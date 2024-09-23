@implementation CRKInMemoryIdentity

- (CRKInMemoryIdentity)initWithCertificate:(id)a3 privateKey:(id)a4
{
  id v7;
  id v8;
  CRKInMemoryIdentity *v9;
  CRKInMemoryIdentity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKInMemoryIdentity;
  v9 = -[CRKInMemoryIdentity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_certificate, a3);
    objc_storeStrong((id *)&v10->_privateKey, a4);
  }

  return v10;
}

+ (id)identityWithConfiguration:(id)a3 validityDateInterval:(id)a4
{
  id v6;
  id v7;
  CRKInMemoryCertificate *v8;
  CRKInMemoryPrivateKey *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[CRKInMemoryCertificate initWithConfiguration:validityDateInterval:]([CRKInMemoryCertificate alloc], "initWithConfiguration:validityDateInterval:", v7, v6);

  v9 = -[CRKInMemoryPrivateKey initWithConfiguration:]([CRKInMemoryPrivateKey alloc], "initWithConfiguration:", v7);
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCertificate:privateKey:", v8, v9);

  return v10;
}

- (__SecIdentity)underlyingIdentity
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKInMemoryIdentity.m"), 41, CFSTR("Reconsider what you are trying to test"));

  return 0;
}

- (CRKCertificate)certificate
{
  return self->_certificate;
}

- (CRKPrivateKey)privateKey
{
  return self->_privateKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateKey, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
}

@end
