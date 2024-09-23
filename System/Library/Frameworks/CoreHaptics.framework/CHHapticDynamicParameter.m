@implementation CHHapticDynamicParameter

- (CHHapticDynamicParameter)init
{

  return 0;
}

- (CHHapticDynamicParameter)initWithParameterID:(CHHapticDynamicParameterID)parameterID value:(float)value relativeTime:(NSTimeInterval)time
{
  NSString *v9;
  CHHapticDynamicParameter *v10;
  CHHapticDynamicParameter *v11;
  objc_super v13;

  v9 = parameterID;
  v13.receiver = self;
  v13.super_class = (Class)CHHapticDynamicParameter;
  v10 = -[CHHapticDynamicParameter init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_param, parameterID);
    v11->_value = value;
    v11->_time = time;
  }

  return v11;
}

- (CHHapticDynamicParameterID)parameterID
{
  return (CHHapticDynamicParameterID)objc_getProperty(self, a2, 8, 1);
}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)value
{
  self->_value = value;
}

- (NSTimeInterval)relativeTime
{
  return self->_time;
}

- (void)setRelativeTime:(NSTimeInterval)relativeTime
{
  self->_time = relativeTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_param, 0);
}

@end
