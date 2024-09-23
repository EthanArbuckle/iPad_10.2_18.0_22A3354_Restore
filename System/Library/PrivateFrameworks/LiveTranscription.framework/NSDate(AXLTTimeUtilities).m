@implementation NSDate(AXLTTimeUtilities)

+ (id)dateToString:()AXLTTimeUtilities
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDD1500];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd-HH-mm-ss"));
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)stringToDate:()AXLTTimeUtilities
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDD1500];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd-HH-mm-ss"));
  objc_msgSend(v5, "dateFromString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (__CFString)timeAgoSinceDateString:()AXLTTimeUtilities
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "stringToDate:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeAgoSinceDate:currentDate:", v4, v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_24F8757C0;
  }

  return v7;
}

+ (id)timeAgoSinceDate:()AXLTTimeUtilities currentDate:
{
  id v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "timeIntervalSinceDate:", v5);
    if (v8 >= 60.0)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDD17A0]);
      objc_msgSend(v10, "localizedStringForDate:relativeToDate:", v5, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      AXLCLocString(CFSTR("liveCaptions.just_now"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (double)timeDifferenceDateStringOld:()AXLTTimeUtilities dateStringNew:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v5 = (void *)MEMORY[0x24BDBCE60];
  v6 = a4;
  objc_msgSend(v5, "stringToDate:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "stringToDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timeIntervalSinceDate:", v7);
  v10 = v9;

  return v10;
}

@end
