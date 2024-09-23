@implementation _HKAppleSleepingBreathingDisturbancesAnnotationDataProvider

- (_HKAppleSleepingBreathingDisturbancesAnnotationDataProvider)initWithBreathingDisturbancesValue:(id)a3 date:(id)a4
{
  id v7;
  id v8;
  _HKAppleSleepingBreathingDisturbancesAnnotationDataProvider *v9;
  _HKAppleSleepingBreathingDisturbancesAnnotationDataProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HKAppleSleepingBreathingDisturbancesAnnotationDataProvider;
  v9 = -[_HKAppleSleepingBreathingDisturbancesAnnotationDataProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_breathingDisturbancesValue, a3);
    objc_storeStrong((id *)&v10->_date, a4);
  }

  return v10;
}

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  id v36;
  void *v37;
  _QWORD v38[3];
  _QWORD v39[2];
  _QWORD v40[2];
  uint64_t v41;
  id v42;
  _QWORD v43[2];
  _QWORD v44[3];

  v44[2] = *MEMORY[0x1E0C80C00];
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v35 = a6;
  v36 = a5;
  v12 = a4;
  v13 = a3;
  -[_HKAppleSleepingBreathingDisturbancesAnnotationDataProvider breathingDisturbancesValue](self, "breathingDisturbancesValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValueForUnit:", v15);
  objc_msgSend(v11, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  HKFormattedStringFromValue(v16, v13, v12, 0, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0CB3498]);
  v18 = *MEMORY[0x1E0DC1138];
  v44[0] = v36;
  v19 = *MEMORY[0x1E0DC1140];
  v43[0] = v18;
  v43[1] = v19;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v17, "initWithString:attributes:", v37, v21);

  v23 = objc_alloc(MEMORY[0x1E0CB3498]);
  v41 = v18;
  v42 = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithString:attributes:", CFSTR(" "), v24);

  v26 = v16;
  objc_msgSend(v12, "localizedDisplayNameForDisplayType:value:", v13, v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_alloc(MEMORY[0x1E0CB3498]);
  v39[1] = v19;
  v40[0] = v35;
  v39[0] = v18;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopLabelColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v28, "initWithString:attributes:", v27, v30);

  v38[0] = v22;
  v38[1] = v25;
  v38[2] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  HKUIJoinAttributedStringsForLocale(v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (HKQuantity)breathingDisturbancesValue
{
  return self->_breathingDisturbancesValue;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_breathingDisturbancesValue, 0);
}

@end
