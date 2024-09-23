@implementation NSDate(DayComparison)

- (BOOL)isSameDayAsDate:()DayComparison
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 28, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 28, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "year");
  if (v9 == objc_msgSend(v8, "year") && (v10 = objc_msgSend(v7, "month"), v10 == objc_msgSend(v8, "month")))
  {
    v11 = objc_msgSend(v7, "day");
    v12 = v11 == objc_msgSend(v8, "day");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
