@implementation _NADelegateMethodMetadata

- (void)setCustomLogSettingsByArgumentIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)customLogSettingsByArgumentIndex
{
  return self->_customLogSettingsByArgumentIndex;
}

- (NSMethodSignature)methodSignature
{
  return self->_methodSignature;
}

- (void)setMethodSignature:(id)a3
{
  objc_storeStrong((id *)&self->_methodSignature, a3);
}

- (void)setCustomHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)customHandler
{
  return self->_customHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customLogSettingsByArgumentIndex, 0);
  objc_storeStrong(&self->_customHandler, 0);
  objc_storeStrong((id *)&self->_methodSignature, 0);
}

@end
