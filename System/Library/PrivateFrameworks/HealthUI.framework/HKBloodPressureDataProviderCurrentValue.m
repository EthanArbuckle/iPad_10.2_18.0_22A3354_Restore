@implementation HKBloodPressureDataProviderCurrentValue

- (HKBloodPressureDataProviderCurrentValue)initWithCorrelation:(id)a3
{
  id v4;
  HKBloodPressureDataProviderCurrentValue *v5;
  uint64_t v6;
  NSDate *date;
  void *v8;
  void *v9;
  uint64_t v10;
  HKQuantity *systolicValue;
  uint64_t v12;
  HKQuantity *diastolicValue;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKBloodPressureDataProviderCurrentValue;
  v5 = -[HKBloodPressureDataProviderCurrentValue init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "endDate");
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AA8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AA0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKBloodPressureDataProviderCurrentValue _quantityForType:correlation:](v5, "_quantityForType:correlation:", v8, v4);
    v10 = objc_claimAutoreleasedReturnValue();
    systolicValue = v5->_systolicValue;
    v5->_systolicValue = (HKQuantity *)v10;

    -[HKBloodPressureDataProviderCurrentValue _quantityForType:correlation:](v5, "_quantityForType:correlation:", v9, v4);
    v12 = objc_claimAutoreleasedReturnValue();
    diastolicValue = v5->_diastolicValue;
    v5->_diastolicValue = (HKQuantity *)v12;

  }
  return v5;
}

- (HKBloodPressureDataProviderCurrentValue)initWithSystolicValue:(id)a3 diastolicValue:(id)a4 date:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKBloodPressureDataProviderCurrentValue *v12;
  HKBloodPressureDataProviderCurrentValue *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKBloodPressureDataProviderCurrentValue;
  v12 = -[HKBloodPressureDataProviderCurrentValue init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_date, a5);
    objc_storeStrong((id *)&v13->_systolicValue, a3);
    objc_storeStrong((id *)&v13->_diastolicValue, a4);
  }

  return v13;
}

- (id)_quantityForType:(id)a3 correlation:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a4, "objectsForType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "quantity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)date
{
  return self->_date;
}

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  HKQuantity *systolicValue;
  void *v17;
  void *v18;
  HKBloodPressureDataProviderCurrentValue *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  HKQuantity *diastolicValue;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  _QWORD v44[4];

  v44[3] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v43 = a6;
  v42 = a5;
  objc_msgSend(v12, "unitForDisplayType:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hk_numberFormatterForUnit:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedNoDataString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedNoDataString();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedDisplayNameForUnit:value:", v13, &unk_1E9CED0B8);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIBloodPressureSystolicDiastolicSeparatorString();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  systolicValue = self->_systolicValue;
  if (systolicValue)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[HKQuantity doubleValueForUnit:](systolicValue, "doubleValueForUnit:", v13);
    objc_msgSend(v17, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentation");
    v19 = self;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "adjustedValueForDaemonValue:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    self = v19;
    v22 = v14;
    v23 = v12;
    objc_msgSend(v14, "stringFromNumber:displayType:unitController:", v21, v11, v12);
    v24 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v24;
  }
  else
  {
    v23 = v12;
    v22 = v14;
    v25 = v15;
  }
  diastolicValue = self->_diastolicValue;
  v27 = v41;
  if (diastolicValue)
  {
    v28 = (void *)MEMORY[0x1E0CB37E8];
    -[HKQuantity doubleValueForUnit:](diastolicValue, "doubleValueForUnit:", v13);
    objc_msgSend(v28, "numberWithDouble:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "adjustedValueForDaemonValue:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v22;
    objc_msgSend(v22, "stringFromNumber:displayType:unitController:", v31, v11, v23);
    v33 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v33;
  }
  else
  {
    v32 = v22;
  }
  v44[0] = v25;
  v44[1] = v39;
  v44[2] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForLocale(v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  HKGenerateAttributedStringsWithUnitValue(v35, v40, v42, v43, 2, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  HKUIJoinAttributedStringsForLocale(v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (id)lastUpdatedDescriptionWithDateCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HKBloodPressureDataProviderCurrentValue date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKLastUpdatedText(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diastolicValue, 0);
  objc_storeStrong((id *)&self->_systolicValue, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
