@implementation _WKPublicKeyCredentialUserEntity

- (_WKPublicKeyCredentialUserEntity)initWithName:(id)a3 identifier:(id)a4 displayName:(id)a5
{
  _WKPublicKeyCredentialUserEntity *v7;
  _WKPublicKeyCredentialUserEntity *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_WKPublicKeyCredentialUserEntity;
  v7 = -[_WKPublicKeyCredentialEntity initWithName:](&v10, sel_initWithName_, a3);
  v8 = v7;
  if (v7)
  {
    -[_WKPublicKeyCredentialUserEntity setIdentifier:](v7, "setIdentifier:", a4);
    -[_WKPublicKeyCredentialUserEntity setDisplayName:](v8, "setDisplayName:", a5);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_WKPublicKeyCredentialUserEntity;
  -[_WKPublicKeyCredentialEntity dealloc](&v3, sel_dealloc);
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
