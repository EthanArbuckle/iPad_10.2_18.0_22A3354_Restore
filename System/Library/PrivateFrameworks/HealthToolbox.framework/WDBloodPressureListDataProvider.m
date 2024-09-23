@implementation WDBloodPressureListDataProvider

- (WDBloodPressureListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  WDBloodPressureListDataProvider *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *systolicAndDiastolicTypes;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)WDBloodPressureListDataProvider;
  v4 = -[WDSampleListDataProvider initWithDisplayType:profile:](&v10, sel_initWithDisplayType_profile_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", *MEMORY[0x24BDD33A8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", *MEMORY[0x24BDD33A0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v7 = objc_claimAutoreleasedReturnValue();
    systolicAndDiastolicTypes = v4->_systolicAndDiastolicTypes;
    v4->_systolicAndDiastolicTypes = (NSArray *)v7;

  }
  return v4;
}

- (id)sampleTypes
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3DC0], "correlationTypeForIdentifier:", *MEMORY[0x24BDD2B08]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)predicateForType:(id)a3
{
  id v3;
  char isKindOfClass;
  void *v5;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD3E88], "predicateForObjectsWithNoCorrelation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)textForObject:(id)a3
{
  id v4;
  void *v5;
  NSArray *systolicAndDiastolicTypes;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  systolicAndDiastolicTypes = self->_systolicAndDiastolicTypes;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__WDBloodPressureListDataProvider_textForObject___block_invoke;
  v11[3] = &unk_24D38E418;
  v11[4] = self;
  v12 = v4;
  v13 = v5;
  v7 = v5;
  v8 = v4;
  -[NSArray enumerateObjectsUsingBlock:](systolicAndDiastolicTypes, "enumerateObjectsUsingBlock:", v11);
  v9 = (void *)objc_msgSend(v7, "copy");

  return v9;
}

void __49__WDBloodPressureListDataProvider_textForObject___block_invoke(id *a1, void *a2, unint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;

  v5 = a1[4];
  v6 = a2;
  objc_msgSend(v5, "displayType");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "quantitySampleForType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "quantity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1[4], "unitController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unitForDisplayType:", v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "presentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v8, "doubleValueForUnit:", v10);
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "adjustedValueForDaemonValue:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[4], "unitController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HKFormattedStringFromValue();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[6], "appendString:", v16);
  }
  else
  {
    v17 = a1[6];
    HKLocalizedNoDataString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendString:", v10);
  }

  if (objc_msgSend(*((id *)a1[4] + 10), "count") - 1 > a3)
  {
    v18 = a1[6];
    HKUIBloodPressureSystolicDiastolicSeparatorString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendString:", v19);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systolicAndDiastolicTypes, 0);
}

@end
