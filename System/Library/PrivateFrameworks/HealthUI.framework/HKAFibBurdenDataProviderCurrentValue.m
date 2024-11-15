@implementation HKAFibBurdenDataProviderCurrentValue

- (HKAFibBurdenDataProviderCurrentValue)initWithMaxValue:(id)a3 date:(id)a4
{
  id v7;
  id v8;
  HKAFibBurdenDataProviderCurrentValue *v9;
  HKAFibBurdenDataProviderCurrentValue *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKAFibBurdenDataProviderCurrentValue;
  v9 = -[HKAFibBurdenDataProviderCurrentValue init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_date, a4);
    objc_storeStrong((id *)&v10->_maxValue, a3);
  }

  return v10;
}

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  return HKAFibBurdenClampedLowerBoundAttributedLocalizedString(self->_maxValue, a5, a6);
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
  objc_storeStrong((id *)&self->_maxValue, 0);
}

@end
