@implementation _WKAuthenticationExtensionsClientOutputs

- (_WKAuthenticationExtensionsClientOutputs)initWithAppid:(BOOL)a3
{
  _WKAuthenticationExtensionsClientOutputs *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_WKAuthenticationExtensionsClientOutputs;
  result = -[_WKAuthenticationExtensionsClientOutputs init](&v5, sel_init);
  if (result)
    result->_appid = a3;
  return result;
}

- (BOOL)appid
{
  return self->_appid;
}

@end
