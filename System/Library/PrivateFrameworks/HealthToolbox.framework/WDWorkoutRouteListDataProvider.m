@implementation WDWorkoutRouteListDataProvider

- (id)createQueryForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v11 = (objc_class *)MEMORY[0x24BDD3F00];
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend([v11 alloc], "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v15, v14, a5, v13, v12);

  return v16;
}

- (id)sampleTypes
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3F28], "seriesTypeForIdentifier:", *MEMORY[0x24BDD3880]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)predicateForType:(id)a3
{
  return 0;
}

- (id)textForObject:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKFormattedStringForDate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)secondaryTextForObject:(id)a3
{
  return 0;
}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[WDSampleListDataProvider samples](self, "samples");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "sampleAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x24BE4A940]);
  -[WDSampleListDataProvider healthStore](self, "healthStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSampleListDataProvider profileName](self, "profileName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithWorkoutRoute:healthStore:usingInsetStyling:profileName:delegate:", v7, v9, 1, v10, self);

  return v11;
}

@end
