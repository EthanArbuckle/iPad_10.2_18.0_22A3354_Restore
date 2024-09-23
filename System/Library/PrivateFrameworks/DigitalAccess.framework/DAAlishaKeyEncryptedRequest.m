@implementation DAAlishaKeyEncryptedRequest

- (DAAlishaKeyEncryptedRequest)initWithVersion:(id)a3 ephemeralPublicKey:(id)a4 publicKeyHash:(id)a5 encryptedRequest:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  DAAlishaKeyEncryptedRequest *v15;
  DAAlishaKeyEncryptedRequest *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)DAAlishaKeyEncryptedRequest;
  v15 = -[DAAlishaKeyEncryptedRequest init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_version, a3);
    objc_storeStrong((id *)&v16->_ephemeralPublicKey, a4);
    objc_storeStrong((id *)&v16->_publicKeyHash, a5);
    objc_storeStrong((id *)&v16->_encryptedRequest, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[DAAlishaKeyEncryptedRequest version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("version"));

  -[DAAlishaKeyEncryptedRequest ephemeralPublicKey](self, "ephemeralPublicKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ephemeralPublicKey"));

  -[DAAlishaKeyEncryptedRequest publicKeyHash](self, "publicKeyHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("publicKeyHash"));

  -[DAAlishaKeyEncryptedRequest encryptedRequest](self, "encryptedRequest");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("encryptedRequest"));

}

- (DAAlishaKeyEncryptedRequest)initWithCoder:(id)a3
{
  id v4;
  DAAlishaKeyEncryptedRequest *v5;
  uint64_t v6;
  NSString *version;
  uint64_t v8;
  NSData *ephemeralPublicKey;
  uint64_t v10;
  NSData *publicKeyHash;
  uint64_t v12;
  NSData *encryptedRequest;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DAAlishaKeyEncryptedRequest;
  v5 = -[DAAlishaKeyEncryptedRequest init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v6 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ephemeralPublicKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    ephemeralPublicKey = v5->_ephemeralPublicKey;
    v5->_ephemeralPublicKey = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKeyHash"));
    v10 = objc_claimAutoreleasedReturnValue();
    publicKeyHash = v5->_publicKeyHash;
    v5->_publicKeyHash = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptedRequest"));
    v12 = objc_claimAutoreleasedReturnValue();
    encryptedRequest = v5->_encryptedRequest;
    v5->_encryptedRequest = (NSData *)v12;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Version               : %@\n"), self->_version);
  kmlUtilHexStringFromData(self->_ephemeralPublicKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("EphemeralPublicKey    : %@\n"), v4);

  kmlUtilHexStringFromData(self->_publicKeyHash);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("PublickKeyHash        : %@\n"), v5);

  kmlUtilHexStringFromData(self->_encryptedRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("EncryptedRequest      : %@"), v6);

  return v3;
}

- (id)encodeWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)decodeWithData:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD1620];
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = a3;
  objc_msgSend(v6, "setWithObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)version
{
  return self->_version;
}

- (NSData)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (NSData)encryptedRequest
{
  return self->_encryptedRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedRequest, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
