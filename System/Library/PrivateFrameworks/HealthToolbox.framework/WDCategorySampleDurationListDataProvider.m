@implementation WDCategorySampleDurationListDataProvider

- (id)sampleTypes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[WDSampleListDataProvider displayType](self, "displayType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sampleType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)titleForSection:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (-[WDSampleListDataProvider numberOfObjectsForSection:](self, "numberOfObjectsForSection:", a3))
  {
    -[WDSampleListDataProvider displayType](self, "displayType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)textForObject:(id)a3
{
  return (id)objc_msgSend(a3, "displayString");
}

@end
