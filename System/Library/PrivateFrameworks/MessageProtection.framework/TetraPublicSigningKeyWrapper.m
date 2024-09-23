@implementation TetraPublicSigningKeyWrapper

- (id)lookupIdentifier
{
  void *v2;
  void *v3;

  -[PublicKey dataRepresentation](self->_signingKey, "dataRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)compactRepresentation
{
  void *v2;
  void *v3;

  -[PublicKey key](self->_signingKey, "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TetraPublicSigningKeyWrapper)initWithCompactRepresentation:(id)a3
{
  id v4;
  TetraPublicSigningKeyWrapper *v5;
  SigningPublicKey *v6;
  id v7;
  SigningPublicKey *signingKey;
  TetraPublicSigningKeyWrapper *v9;
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TetraPublicSigningKeyWrapper;
  v5 = -[TetraPublicSigningKeyWrapper init](&v12, sel_init);
  if (!v5)
    goto LABEL_3;
  v11 = 0;
  v6 = -[PublicKey initWithData:error:]([SigningPublicKey alloc], "initWithData:error:", v4, &v11);
  v7 = v11;
  signingKey = v5->_signingKey;
  v5->_signingKey = v6;

  v9 = (TetraPublicSigningKeyWrapper *)v5->_signingKey;
  if (v9)
LABEL_3:
    v9 = v5;

  return v9;
}

- (TetraPublicSigningKeyWrapper)initWithSigningPublicKey:(id)a3
{
  id v5;
  TetraPublicSigningKeyWrapper *v6;
  TetraPublicSigningKeyWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TetraPublicSigningKeyWrapper;
  v6 = -[TetraPublicSigningKeyWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_signingKey, a3);

  return v7;
}

- (BOOL)verifyTetraRegistrationSignature:(id)a3 formatter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[TetraPublicSigningKeyWrapper signingKey](self, "signingKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "verifySignature:formatter:", v7, v6);

  return v9;
}

- (BOOL)verifyTetraMessageSignature:(id)a3 formatter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[TetraPublicSigningKeyWrapper signingKey](self, "signingKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "verifySignature:formatter:", v7, v6);

  return v9;
}

- (SigningPublicKey)signingKey
{
  return (SigningPublicKey *)objc_getProperty(self, a2, 8, 1);
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
