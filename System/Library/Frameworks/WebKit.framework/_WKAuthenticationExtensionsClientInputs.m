@implementation _WKAuthenticationExtensionsClientInputs

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_WKAuthenticationExtensionsClientInputs;
  -[_WKAuthenticationExtensionsClientInputs dealloc](&v3, sel_dealloc);
}

- (NSString)appid
{
  return self->_appid;
}

- (void)setAppid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
