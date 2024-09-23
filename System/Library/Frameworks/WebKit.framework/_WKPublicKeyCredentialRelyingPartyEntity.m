@implementation _WKPublicKeyCredentialRelyingPartyEntity

- (_WKPublicKeyCredentialRelyingPartyEntity)initWithName:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_WKPublicKeyCredentialRelyingPartyEntity;
  return -[_WKPublicKeyCredentialEntity initWithName:](&v4, sel_initWithName_, a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_WKPublicKeyCredentialRelyingPartyEntity;
  -[_WKPublicKeyCredentialEntity dealloc](&v3, sel_dealloc);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
