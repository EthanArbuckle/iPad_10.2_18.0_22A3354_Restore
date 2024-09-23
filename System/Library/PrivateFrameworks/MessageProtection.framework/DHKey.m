@implementation DHKey

- (id)publicKey
{
  void *v2;
  void *v3;
  DHPublicKey *v4;

  -[FullKey key](self, "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publicKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = -[PublicKey initWithKey:]([DHPublicKey alloc], "initWithKey:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)keyAgreementWithPublicKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[FullKey key](self, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "keyAgreement:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[DHKey publicKey](self, "publicKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("DHKey with public data representation: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
