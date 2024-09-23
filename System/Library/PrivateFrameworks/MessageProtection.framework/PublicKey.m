@implementation PublicKey

- (PublicKey)initWithKey:(id)a3
{
  id v5;
  PublicKey *v6;
  PublicKey *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PublicKey;
  v6 = -[PublicKey init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_key, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PublicKey key](self, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "dataRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToData:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (PublicKey)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  SecKeyP256Public *v7;
  PublicKey *v8;
  NSObject *v9;

  v6 = a3;
  v7 = -[SecKeyP256Public initWithData:error:]([SecKeyP256Public alloc], "initWithData:error:", v6, a4);
  if (v7)
  {
    self = -[PublicKey initWithKey:](self, "initWithKey:", v7);
    v8 = self;
  }
  else
  {
    MessageProtectionLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PublicKey initWithData:error:].cold.1((uint64_t)v6, (uint64_t *)a4, v9);

    v8 = 0;
  }

  return v8;
}

- (id)dataRepresentation
{
  return (id)-[P256PublicKeyProtocol dataRepresentation](self->_key, "dataRepresentation");
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[PublicKey dataRepresentation](self, "dataRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("PublicKey with data representation: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (P256PublicKeyProtocol)key
{
  return (P256PublicKeyProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)initWithData:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_20BABB000, log, OS_LOG_TYPE_ERROR, "Attempting to initialize public key with invalid format: %@ and error: %@", (uint8_t *)&v4, 0x16u);
}

@end
