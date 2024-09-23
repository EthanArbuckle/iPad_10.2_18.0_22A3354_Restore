@implementation HKCardioFitnessDataProviderCurrentValue

- (HKCardioFitnessDataProviderCurrentValue)initWithVO2MaxQuantity:(id)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5 date:(id)a6
{
  id v11;
  id v12;
  HKCardioFitnessDataProviderCurrentValue *v13;
  HKCardioFitnessDataProviderCurrentValue *v14;
  objc_super v16;

  v11 = a3;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HKCardioFitnessDataProviderCurrentValue;
  v13 = -[HKCardioFitnessDataProviderCurrentValue init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_date, a6);
    objc_storeStrong((id *)&v14->_vo2maxQuantity, a3);
    v14->_biologicalSex = a4;
    v14->_ageInYears = a5;
  }

  return v14;
}

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  HKQuantity *vo2maxQuantity;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0DC1140];
  v21[0] = *MEMORY[0x1E0DC1138];
  v21[1] = v8;
  v22[0] = a5;
  v9 = (void *)MEMORY[0x1E0DC3658];
  v10 = a5;
  objc_msgSend(v9, "hk_chartLollipopValueColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  vo2maxQuantity = self->_vo2maxQuantity;
  -[HKQuantity _unit](vo2maxQuantity, "_unit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](vo2maxQuantity, "doubleValueForUnit:", v14);
  v16 = v15;

  +[HKCardioFitnessUtilities localizedStringForCardioFitnessLevel:](HKCardioFitnessUtilities, "localizedStringForCardioFitnessLevel:", +[HKCardioFitnessUtilities cardioFitnessLevelForVO2Max:biologicalSex:age:](HKCardioFitnessUtilities, "cardioFitnessLevelForVO2Max:biologicalSex:age:", self->_biologicalSex, self->_ageInYears, v16));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x1E0CB3498]);

  v19 = (void *)objc_msgSend(v18, "initWithString:attributes:", v17, v12);
  return v19;
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
  objc_storeStrong((id *)&self->_vo2maxQuantity, 0);
}

@end
