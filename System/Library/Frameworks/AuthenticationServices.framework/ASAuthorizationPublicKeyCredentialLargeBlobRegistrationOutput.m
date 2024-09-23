@implementation ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput

+ (id)_outputWithIsSupported:(BOOL)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithIsSupported:", a3);
}

- (id)_initWithIsSupported:(BOOL)a3
{
  ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput *v4;
  ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput *v5;
  ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput;
  v4 = -[ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_isSupported = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput _initWithIsSupported:](+[ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput allocWithZone:](ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput, "allocWithZone:", a3), "_initWithIsSupported:", self->_isSupported);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_isSupported, CFSTR("isSupported"));
}

- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput)initWithCoder:(id)a3
{
  return (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput *)-[ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput _initWithIsSupported:](self, "_initWithIsSupported:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isSupported")));
}

- (BOOL)isSupported
{
  return self->_isSupported;
}

@end
