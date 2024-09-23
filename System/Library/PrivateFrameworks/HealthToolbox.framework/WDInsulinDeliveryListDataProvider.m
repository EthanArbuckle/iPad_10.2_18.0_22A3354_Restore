@implementation WDInsulinDeliveryListDataProvider

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
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WDSampleListDataProvider displayType](self, "displayType");
  v5 = objc_claimAutoreleasedReturnValue();
  -[WDSampleListDataProvider unitController](self, "unitController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v5;
  objc_msgSend(v6, "unitForDisplayType:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "quantity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", v7);
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HKFormattedStringFromValue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedDisplayNameForUnit:value:", v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDD31C8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "integerValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("INSULIN_DELIVERY_REASON_%zd"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  v23[1] = CFSTR(" ");
  v23[2] = v12;
  v23[3] = CFSTR(" ");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", v16, &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForLocale();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
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

@end
