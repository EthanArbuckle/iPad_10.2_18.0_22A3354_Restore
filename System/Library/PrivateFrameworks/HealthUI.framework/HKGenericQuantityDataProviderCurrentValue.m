@implementation HKGenericQuantityDataProviderCurrentValue

- (HKGenericQuantityDataProviderCurrentValue)initWithQuantity:(id)a3
{
  id v5;
  HKGenericQuantityDataProviderCurrentValue *v6;
  HKGenericQuantityDataProviderCurrentValue *v7;

  v5 = a3;
  v6 = -[HKGenericQuantityDataProviderCurrentValue init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_quantity, a3);

  return v7;
}

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v13, "unitForDisplayType:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[HKQuantity doubleValueForUnit:](self->_quantity, "doubleValueForUnit:", v15);
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "adjustedValueForDaemonValue:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "hk_valueFormatterForUnit:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "attributedStringFromValue:displayType:unitController:valueFont:unitFont:", v19, v14, v13, v12, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)stringWithDisplayType:(id)a3 unitController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "unitForDisplayType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[HKQuantity doubleValueForUnit:](self->_quantity, "doubleValueForUnit:", v8);
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "adjustedValueForDaemonValue:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hk_valueFormatterForUnit:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringFromValue:displayType:unitController:", v12, v7, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)lastUpdatedDescriptionWithDateCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HKGenericQuantityDataProviderCurrentValue date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKLastUpdatedText(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_quantity, 0);
}

@end
