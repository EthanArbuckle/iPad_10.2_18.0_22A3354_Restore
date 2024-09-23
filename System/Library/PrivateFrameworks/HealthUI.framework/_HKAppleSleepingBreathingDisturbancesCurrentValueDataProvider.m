@implementation _HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider

- (_HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider)initWithBreathingDisturbancesClassification:(int64_t)a3 date:(id)a4
{
  id v7;
  _HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider *v8;
  _HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider;
  v8 = -[_HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_classification = a3;
    objc_storeStrong((id *)&v8->_date, a4);
  }

  return v9;
}

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0DC1140];
  v17[0] = *MEMORY[0x1E0DC1138];
  v17[1] = v8;
  v18[0] = a5;
  v9 = (void *)MEMORY[0x1E0DC3658];
  v10 = a5;
  objc_msgSend(v9, "hk_chartLollipopValueColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKSleepApneaUtilities localizedTitleForBreathingDisturbancesClassification:](HKSleepApneaUtilities, "localizedTitleForBreathingDisturbancesClassification:", -[_HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider classification](self, "classification"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0CB3498]);

  v15 = (void *)objc_msgSend(v14, "initWithString:attributes:", v13, v12);
  return v15;
}

- (int64_t)classification
{
  return self->_classification;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
