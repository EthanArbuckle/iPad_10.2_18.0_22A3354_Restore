@implementation MOEffectiveBool

- (MOEffectiveBool)initWithValue:(BOOL)a3 defaultValue:(BOOL)a4
{
  MOEffectiveBool *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MOEffectiveBool;
  result = -[MOEffectiveBool init](&v7, sel_init);
  if (result)
  {
    result->_value = a3;
    result->_defaultValue = a4;
  }
  return result;
}

- (BOOL)value
{
  return self->_value;
}

- (BOOL)defaultValue
{
  return self->_defaultValue;
}

@end
