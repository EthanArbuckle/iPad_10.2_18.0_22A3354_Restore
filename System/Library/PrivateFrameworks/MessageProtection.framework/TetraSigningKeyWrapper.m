@implementation TetraSigningKeyWrapper

- (id)signDataWithFormatter:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[TetraSigningKeyWrapper signingKey](self, "signingKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signDataWithFormatter:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)generateKeyForTesting
{
  TetraSigningKeyWrapper *v2;
  void *v3;
  void *v4;
  TetraSigningKeyWrapper *v5;

  v2 = [TetraSigningKeyWrapper alloc];
  +[SecKeyP256Private defaultProtectionClassForPlatform](SecKeyP256Private, "defaultProtectionClassForPlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FullKey generateNewKeyWithAccess:error:](SigningKey, "generateNewKeyWithAccess:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TetraSigningKeyWrapper initWithSigningKey:](v2, "initWithSigningKey:", v4);

  return v5;
}

- (TetraSigningKeyWrapper)initWithSigningKey:(id)a3
{
  id v5;
  TetraSigningKeyWrapper *v6;
  TetraSigningKeyWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TetraSigningKeyWrapper;
  v6 = -[TetraSigningKeyWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_signingKey, a3);

  return v7;
}

- (id)publicKey
{
  TetraPublicSigningKeyWrapper *v3;
  void *v4;
  TetraPublicSigningKeyWrapper *v5;

  v3 = [TetraPublicSigningKeyWrapper alloc];
  -[SigningKey publicKey](self->_signingKey, "publicKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TetraPublicSigningKeyWrapper initWithSigningPublicKey:](v3, "initWithSigningPublicKey:", v4);

  return v5;
}

- (id)signDataWithMessageFormatter:(id)a3 error:(id *)a4
{
  return -[SigningKey signDataWithFormatter:error:](self->_signingKey, "signDataWithFormatter:error:", a3, a4);
}

- (id)signDataWithRegistrationFormatter:(id)a3 error:(id *)a4
{
  return -[SigningKey signDataWithFormatter:error:](self->_signingKey, "signDataWithFormatter:error:", a3, a4);
}

- (SigningKey)signingKey
{
  return (SigningKey *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSigningKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingKey, 0);
}

@end
