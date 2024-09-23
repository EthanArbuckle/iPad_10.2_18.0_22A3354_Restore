@implementation SNNMILListValue

- (SNNMILListValue)initWithValues:(id)a3
{
  NSArray *v4;
  SNNMILListValue *v5;
  NSArray *values;
  objc_super v8;

  v4 = (NSArray *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SNNMILListValue;
  v5 = -[SNNMILValue init](&v8, sel_init);
  values = v5->_values;
  v5->_values = v4;

  return v5;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
