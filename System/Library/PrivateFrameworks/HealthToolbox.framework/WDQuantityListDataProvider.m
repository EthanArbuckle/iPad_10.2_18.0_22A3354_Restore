@implementation WDQuantityListDataProvider

- (WDQuantityListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  id v6;
  WDQuantityListDataProvider *v7;
  void *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDQuantityListDataProvider;
  v7 = -[WDSampleListDataProvider initWithDisplayType:profile:](&v10, sel_initWithDisplayType_profile_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "sampleType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Attempt to create a quantity list provider with a non-quantity data group"));

  }
  return v7;
}

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

- (id)textForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[WDSampleListDataProvider displayType](self, "displayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSampleListDataProvider unitController](self, "unitController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unitForDisplayType:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "quantity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValueForUnit:", v7);
  v10 = v9;

  objc_msgSend(v5, "presentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "adjustedValueForDaemonValue:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDSampleListDataProvider unitController](self, "unitController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HKFormattedStringFromValueForContext();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)titleForSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  -[WDSampleListDataProvider displayType](self, "displayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSampleListDataProvider unitController](self, "unitController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HKFormatterIncludesUnitForDisplayTypeInContext();

  if ((v7 & 1) != 0)
    return 0;
  v9.receiver = self;
  v9.super_class = (Class)WDQuantityListDataProvider;
  -[WDSampleListDataProvider titleForSection:](&v9, sel_titleForSection_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
