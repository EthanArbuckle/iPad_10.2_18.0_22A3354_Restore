@implementation FixedParameter

- (FixedParameter)initWithIdentifier:(int)a3 value:(float)a4
{
  FixedParameter *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FixedParameter;
  result = -[FixedParameter init](&v7, sel_init);
  if (result)
  {
    result->_identifier = a3;
    result->_value = a4;
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ id=%d, val=%f>"), objc_opt_class(), self->_identifier, self->_value);
}

- (int)identifier
{
  return self->_identifier;
}

- (float)value
{
  return self->_value;
}

@end
