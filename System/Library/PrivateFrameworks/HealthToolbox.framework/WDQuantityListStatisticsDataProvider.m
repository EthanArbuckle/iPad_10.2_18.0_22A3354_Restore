@implementation WDQuantityListStatisticsDataProvider

- (id)sampleTypes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[WDSampleListStatisticsDataProvider displayType](self, "displayType");
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
  uint64_t v9;
  char *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v4 = a3;
  -[WDSampleListStatisticsDataProvider displayType](self, "displayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSampleListStatisticsDataProvider unitController](self, "unitController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unitForDisplayType:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "aggregationStyle");

  if (v9 == 3)
  {
    v10 = sel_averageQuantity;
  }
  else
  {
    if (v9)
    {
      objc_msgSend(v4, "minimumQuantity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValueForUnit:", v7);
      v20 = v19;

      objc_msgSend(v4, "maximumQuantity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "doubleValueForUnit:", v7);
      v23 = v22;

      objc_msgSend(v5, "presentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "adjustedValueForDaemonValue:", v25);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "presentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "adjustedValueForDaemonValue:", v27);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[WDSampleListStatisticsDataProvider unitController](self, "unitController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      HKFormattedStringFromValueForContext();
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      -[WDSampleListStatisticsDataProvider unitController](self, "unitController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      HKFormattedStringFromValueForContext();
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = (void *)MEMORY[0x24BDD17C8];
      WDBundle();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("SHOW_ALL_DATA_MIN_MAX"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", v34, v29, v31);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    v10 = sel_sumQuantity;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v17 = 0;
    goto LABEL_10;
  }
  objc_msgSend((id)objc_msgSend(v4, "performSelector:", v10), "doubleValueForUnit:", v7);
  v12 = v11;
  objc_msgSend(v5, "presentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "adjustedValueForDaemonValue:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDSampleListStatisticsDataProvider unitController](self, "unitController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HKFormattedStringFromValueForContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

LABEL_10:
  return v17;
}

- (id)titleForSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  -[WDSampleListStatisticsDataProvider displayType](self, "displayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSampleListStatisticsDataProvider unitController](self, "unitController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HKFormatterIncludesUnitForDisplayTypeInContext();

  if ((v7 & 1) != 0)
    return 0;
  v9.receiver = self;
  v9.super_class = (Class)WDQuantityListStatisticsDataProvider;
  -[WDSampleListStatisticsDataProvider titleForSection:](&v9, sel_titleForSection_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
