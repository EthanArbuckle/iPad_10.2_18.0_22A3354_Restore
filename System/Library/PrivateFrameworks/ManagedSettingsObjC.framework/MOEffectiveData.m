@implementation MOEffectiveData

- (MOEffectiveData)initWithValue:(id)a3 defaultValue:(id)a4
{
  NSData *v6;
  NSData *v7;
  NSData *value;
  NSData *v9;
  NSData *defaultValue;

  v6 = (NSData *)a3;
  v7 = (NSData *)a4;
  value = self->_value;
  self->_value = v6;
  v9 = v6;

  defaultValue = self->_defaultValue;
  self->_defaultValue = v7;

  return self;
}

- (NSData)value
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)defaultValue
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
