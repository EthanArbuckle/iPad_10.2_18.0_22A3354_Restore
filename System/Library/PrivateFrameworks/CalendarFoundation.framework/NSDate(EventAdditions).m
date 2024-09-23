@implementation NSDate(EventAdditions)

+ (uint64_t)daysSpannedFromStartDate:()EventAdditions toEndDate:allDay:inCalendar:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if ((objc_msgSend(v9, "isEqualToDate:", v10) & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    if (a5)
    {
      objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 32, 2, v9, 0);
      v13 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 32, 2, v10, 0);
      v14 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v14;
      v9 = (id)v13;
    }
    objc_msgSend(v11, "components:fromDate:", 542, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateFromComponents:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "components:fromDate:", 542, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateFromComponents:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "components:fromDate:toDate:options:", 16, v16, v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v19, "day");

    if ((a5 & 1) == 0)
      v12 += objc_msgSend(v18, "isEqualToDate:", v10) ^ 1;

  }
  return v12;
}

@end
