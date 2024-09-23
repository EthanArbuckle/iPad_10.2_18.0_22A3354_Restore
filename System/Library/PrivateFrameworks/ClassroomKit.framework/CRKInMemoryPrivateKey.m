@implementation CRKInMemoryPrivateKey

- (CRKInMemoryPrivateKey)init
{
  void *v3;
  CRKInMemoryPrivateKey *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[CRKInMemoryPrivateKey initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (CRKInMemoryPrivateKey)initWithData:(id)a3
{
  void *v4;
  CRKInMemoryPrivateKey *v5;

  +[CRKIdentityConfiguration configurationWithData:](CRKIdentityConfiguration, "configurationWithData:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CRKInMemoryPrivateKey initWithConfiguration:](self, "initWithConfiguration:", v4);

  return v5;
}

- (CRKInMemoryPrivateKey)initWithConfiguration:(id)a3
{
  id v4;
  CRKInMemoryPrivateKey *v5;
  uint64_t v6;
  CRKIdentityConfiguration *configuration;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKInMemoryPrivateKey;
  v5 = -[CRKInMemoryPrivateKey init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (CRKIdentityConfiguration *)v6;

  }
  return v5;
}

- (NSData)dataRepresentation
{
  void *v2;
  void *v3;

  -[CRKInMemoryPrivateKey configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (__SecKey)underlyingPrivateKey
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKInMemoryPrivateKey.m"), 47, CFSTR("Reconsider what you are trying to test"));

  return 0;
}

- (CRKIdentityConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
