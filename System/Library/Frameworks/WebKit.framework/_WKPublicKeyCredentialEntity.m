@implementation _WKPublicKeyCredentialEntity

- (_WKPublicKeyCredentialEntity)initWithName:(id)a3
{
  _WKPublicKeyCredentialEntity *v4;
  _WKPublicKeyCredentialEntity *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_WKPublicKeyCredentialEntity;
  v4 = -[_WKPublicKeyCredentialEntity init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[_WKPublicKeyCredentialEntity setName:](v4, "setName:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_WKPublicKeyCredentialEntity;
  -[_WKPublicKeyCredentialEntity dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
