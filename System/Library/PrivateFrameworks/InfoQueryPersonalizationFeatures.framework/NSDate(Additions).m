@implementation NSDate(Additions)

- (uint64_t)isDateInTodayOrFuture
{
  double v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "timeIntervalSinceNow");
  if (v2 >= 0.0)
    return 1;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDateInToday:", a1);

  return v4;
}

@end
