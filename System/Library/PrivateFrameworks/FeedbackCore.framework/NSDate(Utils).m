@implementation NSDate(Utils)

+ (id)dateWithYear:()Utils month:day:
{
  id v8;
  void *v9;
  id v10;
  void *v11;

  v8 = objc_alloc(MEMORY[0x24BDBCE48]);
  v9 = (void *)objc_msgSend(v8, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  v10 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v10, "setYear:", a3);
  objc_msgSend(v10, "setMonth:", a4);
  objc_msgSend(v10, "setDay:", a5);
  objc_msgSend(v9, "dateFromComponents:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)tomorrow
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dateByAddingTimeInterval:", 86400.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (BOOL)isEarlierThan:()Utils
{
  return objc_msgSend(a1, "compare:") == -1;
}

@end
