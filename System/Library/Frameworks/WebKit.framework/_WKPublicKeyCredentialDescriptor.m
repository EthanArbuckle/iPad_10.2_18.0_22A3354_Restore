@implementation _WKPublicKeyCredentialDescriptor

- (_WKPublicKeyCredentialDescriptor)initWithIdentifier:(id)a3
{
  _WKPublicKeyCredentialDescriptor *v4;
  _WKPublicKeyCredentialDescriptor *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_WKPublicKeyCredentialDescriptor;
  v4 = -[_WKPublicKeyCredentialDescriptor init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[_WKPublicKeyCredentialDescriptor setIdentifier:](v4, "setIdentifier:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_WKPublicKeyCredentialDescriptor;
  -[_WKPublicKeyCredentialDescriptor dealloc](&v3, sel_dealloc);
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)transports
{
  return self->_transports;
}

- (void)setTransports:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
