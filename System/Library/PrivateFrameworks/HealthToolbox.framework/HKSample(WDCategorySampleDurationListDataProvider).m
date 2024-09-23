@implementation HKSample(WDCategorySampleDurationListDataProvider)

- (id)displayString
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v2 = objc_alloc(MEMORY[0x24BDD1508]);
  objc_msgSend(a1, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithStartDate:endDate:", v3, v4);

  objc_msgSend(v5, "duration");
  v7 = v6;
  objc_msgSend(MEMORY[0x24BE4A5D8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sampleType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayTypeForObjectType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "presentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "useSecondsWhenDisplayingDuration");

  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromNumber:displayType:unitController:", v13, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
