@implementation SigningKey

- (id)tetraWrapped
{
  return -[TetraSigningKeyWrapper initWithSigningKey:]([TetraSigningKeyWrapper alloc], "initWithSigningKey:", self);
}

- (id)publicKey
{
  SigningPublicKey *publicKey;
  SigningPublicKey *v3;
  void *v5;
  void *v6;
  SigningPublicKey *v7;
  SigningPublicKey *v8;

  publicKey = self->__publicKey;
  if (publicKey)
  {
    v3 = publicKey;
  }
  else
  {
    -[FullKey key](self, "key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "publicKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = -[PublicKey initWithKey:]([SigningPublicKey alloc], "initWithKey:", v6);
      v8 = self->__publicKey;
      self->__publicKey = v7;

      v3 = self->__publicKey;
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (id)signData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[FullKey key](self, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signData:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)signDataWithFormatter:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "signedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SigningKey signData:error:](self, "signData:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SigningKey publicKey](self, "publicKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SigningKey with public data representation: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (SigningPublicKey)_publicKey
{
  return self->__publicKey;
}

- (void)set_publicKey:(id)a3
{
  objc_storeStrong((id *)&self->__publicKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__publicKey, 0);
}

@end
