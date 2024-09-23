@implementation NSDateInterval(WFDays)

- (id)wf_initWithDaysBeforeAndAfterCurrentDate:()WFDays
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v7, "setDay:", -a3);
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v7, v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDay:", a3);
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v7, v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(a1, "initWithStartDate:endDate:", v8, v9);

  return v10;
}

- (id)wf_initWithDaysBeforeCurrentDate:()WFDays
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v7, "setDay:", -a3);
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v7, v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(a1, "initWithStartDate:endDate:", v8, v5);

  return v9;
}

- (id)wf_initWithDaysAfterCurrentDate:()WFDays
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v7, "setDay:", a3);
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v7, v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(a1, "initWithStartDate:endDate:", v5, v8);

  return v9;
}

@end
