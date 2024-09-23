@implementation NSNumber(Analytics)

+ (id)_weeksBetweenStartDate:()Analytics endDate:calendar:
{
  void *v5;
  void *v6;

  objc_msgSend(a5, "components:fromDate:toDate:options:", 0x2000, a3, a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "weekOfYear"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_yearsBetweenStartDateComponents:()Analytics endDate:calendar:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "dateFromComponents:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "components:fromDate:toDate:options:", 4, v9, v7, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "year"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
