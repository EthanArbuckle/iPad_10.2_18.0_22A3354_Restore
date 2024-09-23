@implementation MOEffectiveInteger

- (MOEffectiveInteger)initWithValue:(int64_t)a3 defaultValue:(int64_t)a4
{
  MOEffectiveInteger *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MOEffectiveInteger;
  result = -[MOEffectiveInteger init](&v7, sel_init);
  if (result)
  {
    result->_value = a3;
    result->_defaultValue = a4;
  }
  return result;
}

- (int64_t)value
{
  return self->_value;
}

- (int64_t)defaultValue
{
  return self->_defaultValue;
}

@end
