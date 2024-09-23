@implementation WDHeartbeatSequenceListDataProvider

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
  objc_msgSend(MEMORY[0x24BDD3F28], "heartbeatSeriesType");
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
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  v6 = objc_msgSend(v4, "section");

  -[WDSampleListDataProvider objectAtIndex:forSection:](self, "objectAtIndex:forSection:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A5A0]), "initWithSample:usingInsetStyling:profileName:delegate:", v7, 1, 0, self);

  return v8;
}

@end
