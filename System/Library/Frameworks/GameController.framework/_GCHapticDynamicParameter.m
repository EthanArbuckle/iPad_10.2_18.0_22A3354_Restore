@implementation _GCHapticDynamicParameter

- (_GCHapticDynamicParameter)initWithType:(unsigned int)a3 value:(double)a4
{
  _GCHapticDynamicParameter *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_GCHapticDynamicParameter;
  result = -[_GCHapticDynamicParameter init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_value = a4;
  }
  return result;
}

- (unsigned)type
{
  return self->_type;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

@end
