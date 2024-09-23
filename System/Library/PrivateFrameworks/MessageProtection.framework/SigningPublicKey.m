@implementation SigningPublicKey

- (BOOL)verifySignature:(id)a3 formatter:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a4, "signedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SigningPublicKey verifySignature:ofData:](self, "verifySignature:ofData:", v6, v7);

  return (char)self;
}

- (BOOL)verifySignature:(id)a3 ofData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[PublicKey key](self, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "verifySignature:data:", v7, v6);

  return v9;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[PublicKey dataRepresentation](self, "dataRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SigningPublicKey with data representation: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tetraWrapped
{
  return -[TetraPublicSigningKeyWrapper initWithSigningPublicKey:]([TetraPublicSigningKeyWrapper alloc], "initWithSigningPublicKey:", self);
}

@end
