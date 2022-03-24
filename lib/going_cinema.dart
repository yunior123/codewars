int movie1(int card, int ticket, double perc) {
  final advantage = ticket - (ticket * perc);
  final result = card / advantage;
  return result.ceil();
}

// System A : 15 * 3 = 45
// System B : 500 + 15 * 0.90 + (15 * 0.90) * 0.90 + (15 * 0.90 * 0.90) * 0.90
//( = 536.5849999999999, no rounding for each ticket)
int movie(int card, int ticket, double perc) {
  var result1 = 0;
  var result2 = 0;
  var discount = ticket * perc;
  var increment = 0.0;
  for (var i = 1; true; i++) {
    // 15*1=15
    // 15*2=30
    // increment of 15
    // 43 * 15= 645
    // = 0.95
    // = 1.9
    result1 = ticket * i;
    // 500 + 0.9 * 15 *  1 = 514
    // 500 + 0.9 * 15 * 2 = 528
    // increment of 15 * 0.9
    // 500 + 645*0.9
    increment = increment + discount;
    // = 0.95
    // = 1.7
    result2 = (card + increment).ceil();
    discount = discount * perc;
    if (result1 > result2) {
      return i;
    }
  }
}
