@implementation HFSimpleFormattedValue

- (HFSimpleFormattedValue)initWithFormattedValue:(id)a3
{
  id v5;
  HFSimpleFormattedValue *v6;
  HFSimpleFormattedValue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFSimpleFormattedValue;
  v6 = -[HFSimpleFormattedValue init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_currentFormattedValue, a3);

  return v7;
}

- (id)observeFormattedValueChangesWithBlock:(id)a3
{
  return (id)objc_opt_new();
}

- (HFStringGenerator)currentFormattedValue
{
  return self->_currentFormattedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFormattedValue, 0);
}

@end
