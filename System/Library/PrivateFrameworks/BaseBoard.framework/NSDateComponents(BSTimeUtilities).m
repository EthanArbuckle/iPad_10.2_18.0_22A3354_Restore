@implementation NSDateComponents(BSTimeUtilities)

- (uint64_t)isSameDayAsComponents:()BSTimeUtilities
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a1, "day");
  if (v5 == objc_msgSend(v4, "day"))
    v6 = objc_msgSend(a1, "isSameMonthAsComponents:", v4);
  else
    v6 = 0;

  return v6;
}

- (uint64_t)isSameMonthAsComponents:()BSTimeUtilities
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a1, "month");
  if (v5 == objc_msgSend(v4, "month"))
    v6 = objc_msgSend(a1, "isSameYearAsComponents:", v4);
  else
    v6 = 0;

  return v6;
}

- (BOOL)isSameYearAsComponents:()BSTimeUtilities
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "year");
  if (v5 == objc_msgSend(v4, "year"))
  {
    v6 = objc_msgSend(a1, "era");
    v7 = v6 == objc_msgSend(v4, "era");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
