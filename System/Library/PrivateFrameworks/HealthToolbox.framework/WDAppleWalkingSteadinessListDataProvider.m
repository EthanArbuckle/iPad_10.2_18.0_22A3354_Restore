@implementation WDAppleWalkingSteadinessListDataProvider

- (id)textForObject:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = (void *)MEMORY[0x24BE4A710];
  objc_msgSend(a3, "quantity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "classificationForAppleWalkingSteadinessQuantity:", v4);

  return (id)objc_msgSend(MEMORY[0x24BE4A710], "localizedTitleForClassification:", v5);
}

- (id)titleForSection:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[WDSampleListDataProvider samples](self, "samples", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 1)
  {
    v9 = 0;
  }
  else
  {
    -[WDSampleListDataProvider displayType](self, "displayType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localization");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedUppercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

@end
