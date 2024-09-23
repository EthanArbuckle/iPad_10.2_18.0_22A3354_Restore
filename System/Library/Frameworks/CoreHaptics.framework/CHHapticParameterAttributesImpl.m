@implementation CHHapticParameterAttributesImpl

- (float)minValue
{
  return self->_minValue;
}

- (float)maxValue
{
  return self->_maxValue;
}

- (CHHapticParameterAttributesImpl)initWithMinValue:(float)a3 maxValue:(float)a4 defaultValue:(float)a5
{
  CHHapticParameterAttributesImpl *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CHHapticParameterAttributesImpl;
  result = -[CHHapticParameterAttributesImpl init](&v9, sel_init);
  if (result)
  {
    result->_minValue = a3;
    result->_maxValue = a4;
    result->_defaultValue = a5;
  }
  return result;
}

- (CHHapticParameterAttributesImpl)init
{

  return 0;
}

- (float)defaultValue
{
  return self->_defaultValue;
}

@end
