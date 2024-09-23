@implementation CHHapticEventParameter

- (CHHapticEventParameter)initWithParameterID:(CHHapticEventParameterID)parameterID value:(float)value
{
  NSString *v7;
  CHHapticEventParameter *v8;
  CHHapticEventParameter *v9;
  objc_super v11;

  v7 = parameterID;
  v11.receiver = self;
  v11.super_class = (Class)CHHapticEventParameter;
  v8 = -[CHHapticEventParameter init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_param, parameterID);
    v9->_value = value;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_param, 0);
}

- (CHHapticEventParameterID)parameterID
{
  return (CHHapticEventParameterID)objc_getProperty(self, a2, 16, 1);
}

- (float)value
{
  return self->_value;
}

- (CHHapticEventParameter)init
{

  return 0;
}

- (void)setValue:(float)value
{
  self->_value = value;
}

@end
