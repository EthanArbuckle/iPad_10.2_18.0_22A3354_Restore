@implementation CRXFASAKey

- (CRXFASAKey)initWithName:(id)a3 privateKey:(id)a4 publicKey:(id)a5 creationDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CRXFASAKey *v15;
  CRXFASAKey *v16;
  NSDate *v17;
  NSDate *creationDate;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CRXFASAKey;
  v15 = -[CRXFASAKey init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_privateKey, a4);
    objc_storeStrong((id *)&v16->_publicKey, a5);
    if (v14)
    {
      v17 = (NSDate *)v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    creationDate = v16->_creationDate;
    v16->_creationDate = v17;

  }
  return v16;
}

- (NSString)privateKeyPEM
{
  NSString *privateKeyPEM;
  NSString *v4;
  NSString *v5;

  privateKeyPEM = self->_privateKeyPEM;
  if (!privateKeyPEM)
  {
    objc_msgSend((id)objc_opt_class(), "keyInPEMFormat:isPublic:", self->_privateKey, 0);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_privateKeyPEM;
    self->_privateKeyPEM = v4;

    privateKeyPEM = self->_privateKeyPEM;
  }
  return (NSString *)(id)-[NSString copy](privateKeyPEM, "copy");
}

- (NSString)publicKeyPEM
{
  NSString *publicKeyPEM;
  NSString *v4;
  NSString *v5;

  publicKeyPEM = self->_publicKeyPEM;
  if (!publicKeyPEM)
  {
    objc_msgSend((id)objc_opt_class(), "keyInPEMFormat:isPublic:", self->_publicKey, 1);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_publicKeyPEM;
    self->_publicKeyPEM = v4;

    publicKeyPEM = self->_publicKeyPEM;
  }
  return (NSString *)(id)-[NSString copy](publicKeyPEM, "copy");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CRXFASAKey name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (CRXUObjectsEqual((unint64_t)v6, (uint64_t)v7))
    {
      -[CRXFASAKey privateKey](self, "privateKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "privateKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (CRXUObjectsEqual((unint64_t)v8, (uint64_t)v9))
      {
        -[CRXFASAKey publicKey](self, "publicKey");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "publicKey");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CRXUObjectsEqual((unint64_t)v10, (uint64_t)v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)keyInPEMFormat:(id)a3 isPublic:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  const char *v10;
  const char *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a4;
  if (a4)
    v5 = 120;
  else
    v5 = 167;
  v6 = (objc_class *)MEMORY[0x24BDBCEC8];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithCapacity:", v5);
  v9 = v8;
  if (v4)
  {
    objc_msgSend(v8, "appendBytes:length:", &keyInPEMFormat_isPublic__kPublicKeyHeader, 23);
    objc_msgSend(v9, "appendData:", v7);

    v10 = "-----END PUBLIC KEY-----";
    v11 = "-----BEGIN PUBLIC KEY-----";
  }
  else
  {
    objc_msgSend(v8, "appendBytes:length:", &keyInPEMFormat_isPublic__kPrivateKeyHeader, 8);
    v12 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "appendBytes:length:", objc_msgSend(v12, "bytes") + 97, 48);
    objc_msgSend(v9, "appendBytes:length:", &keyInPEMFormat_isPublic__kPrivateKeyParamsBlock, 14);
    v13 = objc_retainAutorelease(v12);
    v14 = objc_msgSend(v13, "bytes");

    objc_msgSend(v9, "appendBytes:length:", v14, 97);
    v10 = "-----END EC PRIVATE KEY-----";
    v11 = "-----BEGIN EC PRIVATE KEY-----";
  }
  objc_msgSend(v9, "base64EncodedStringWithOptions:", 33);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s\n%@\n%s\n"), v11, v15, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSString)name
{
  return self->_name;
}

- (NSData)privateKey
{
  return self->_privateKey;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_privateKey, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_publicKeyPEM, 0);
  objc_storeStrong((id *)&self->_privateKeyPEM, 0);
}

@end
