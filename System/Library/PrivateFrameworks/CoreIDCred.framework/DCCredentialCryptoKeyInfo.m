@implementation DCCredentialCryptoKeyInfo

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
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[DCCredentialCryptoKeyInfo identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, 0x24C3072A8);

  -[DCCredentialCryptoKeyInfo credentialIdentifier](self, "credentialIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, 0x24C307168);

  -[DCCredentialCryptoKeyInfo publicKey](self, "publicKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, 0x24C3075C8);

  -[DCCredentialCryptoKeyInfo publicKeyIdentifier](self, "publicKeyIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, 0x24C3072C8);

  -[DCCredentialCryptoKeyInfo keyType](self, "keyType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, 0x24C3072E8);

  -[DCCredentialCryptoKeyInfo keyUsage](self, "keyUsage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, 0x24C307308);

  -[DCCredentialCryptoKeyInfo createdAt](self, "createdAt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, 0x24C3071E8);

  -[DCCredentialCryptoKeyInfo updatedAt](self, "updatedAt");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, 0x24C307208);

  objc_msgSend(v4, "encodeInteger:forKey:", -[DCCredentialCryptoKeyInfo presentmentKeyTimesUsed](self, "presentmentKeyTimesUsed"), 0x24C307688);
  -[DCCredentialCryptoKeyInfo acl](self, "acl");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, 0x24C3077A8);

}

- (DCCredentialCryptoKeyInfo)initWithCoder:(id)a3
{
  id v3;
  DCCredentialCryptoKeyInfo *v4;
  uint64_t v5;
  NSString *identifier;
  uint64_t v7;
  NSString *credentialIdentifier;
  uint64_t v9;
  NSData *publicKey;
  uint64_t v11;
  NSData *publicKeyIdentifier;
  uint64_t v13;
  NSString *keyType;
  uint64_t v15;
  NSString *keyUsage;
  uint64_t v17;
  NSDate *createdAt;
  uint64_t v19;
  NSDate *updatedAt;
  uint64_t v21;
  NSData *acl;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)DCCredentialCryptoKeyInfo;
  v3 = a3;
  v4 = -[DCCredentialCryptoKeyInfo init](&v24, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3072A8, v24.receiver, v24.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307168);
  v7 = objc_claimAutoreleasedReturnValue();
  credentialIdentifier = v4->_credentialIdentifier;
  v4->_credentialIdentifier = (NSString *)v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3075C8);
  v9 = objc_claimAutoreleasedReturnValue();
  publicKey = v4->_publicKey;
  v4->_publicKey = (NSData *)v9;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3072C8);
  v11 = objc_claimAutoreleasedReturnValue();
  publicKeyIdentifier = v4->_publicKeyIdentifier;
  v4->_publicKeyIdentifier = (NSData *)v11;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3072E8);
  v13 = objc_claimAutoreleasedReturnValue();
  keyType = v4->_keyType;
  v4->_keyType = (NSString *)v13;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307308);
  v15 = objc_claimAutoreleasedReturnValue();
  keyUsage = v4->_keyUsage;
  v4->_keyUsage = (NSString *)v15;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3071E8);
  v17 = objc_claimAutoreleasedReturnValue();
  createdAt = v4->_createdAt;
  v4->_createdAt = (NSDate *)v17;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307208);
  v19 = objc_claimAutoreleasedReturnValue();
  updatedAt = v4->_updatedAt;
  v4->_updatedAt = (NSDate *)v19;

  v4->_presentmentKeyTimesUsed = objc_msgSend(v3, "decodeIntegerForKey:", 0x24C307688);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3077A8);
  v21 = objc_claimAutoreleasedReturnValue();

  acl = v4->_acl;
  v4->_acl = (NSData *)v21;

  return v4;
}

- (DCCredentialCryptoKeyInfo)initWithIdentifier:(id)a3 credentialIdentifier:(id)a4 publicKey:(id)a5 publicKeyIdentifier:(id)a6 keyType:(id)a7 keyUsage:(id)a8 createdAt:(id)a9 updatedAt:(id)a10 presentmentKeyTimesUsed:(int64_t)a11 acl:(id)a12
{
  NSString *v17;
  NSString *v18;
  NSData *v19;
  NSData *v20;
  NSString *v21;
  NSString *v22;
  NSDate *v23;
  NSDate *v24;
  DCCredentialCryptoKeyInfo *v25;
  NSString *identifier;
  NSString *credentialIdentifier;
  NSString *v28;
  NSData *publicKey;
  NSData *v30;
  NSData *publicKeyIdentifier;
  NSData *v32;
  NSString *keyType;
  NSString *v34;
  NSString *keyUsage;
  NSString *v36;
  NSDate *createdAt;
  NSDate *v38;
  NSDate *updatedAt;
  NSDate *v40;
  NSData *acl;
  NSData *v43;
  NSString *v45;
  objc_super v46;

  v17 = (NSString *)a3;
  v18 = (NSString *)a4;
  v19 = (NSData *)a5;
  v20 = (NSData *)a6;
  v21 = (NSString *)a7;
  v22 = (NSString *)a8;
  v23 = (NSDate *)a9;
  v24 = (NSDate *)a10;
  v43 = (NSData *)a12;
  v46.receiver = self;
  v46.super_class = (Class)DCCredentialCryptoKeyInfo;
  v25 = -[DCCredentialCryptoKeyInfo init](&v46, sel_init);
  identifier = v25->_identifier;
  v25->_identifier = v17;
  v45 = v17;

  credentialIdentifier = v25->_credentialIdentifier;
  v25->_credentialIdentifier = v18;
  v28 = v18;

  publicKey = v25->_publicKey;
  v25->_publicKey = v19;
  v30 = v19;

  publicKeyIdentifier = v25->_publicKeyIdentifier;
  v25->_publicKeyIdentifier = v20;
  v32 = v20;

  keyType = v25->_keyType;
  v25->_keyType = v21;
  v34 = v21;

  keyUsage = v25->_keyUsage;
  v25->_keyUsage = v22;
  v36 = v22;

  createdAt = v25->_createdAt;
  v25->_createdAt = v23;
  v38 = v23;

  updatedAt = v25->_updatedAt;
  v25->_updatedAt = v24;
  v40 = v24;

  acl = v25->_acl;
  v25->_presentmentKeyTimesUsed = a11;
  v25->_acl = v43;

  return v25;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (NSData)publicKeyIdentifier
{
  return self->_publicKeyIdentifier;
}

- (NSString)keyType
{
  return self->_keyType;
}

- (NSString)keyUsage
{
  return self->_keyUsage;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (NSDate)updatedAt
{
  return self->_updatedAt;
}

- (int64_t)presentmentKeyTimesUsed
{
  return self->_presentmentKeyTimesUsed;
}

- (NSData)acl
{
  return self->_acl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acl, 0);
  objc_storeStrong((id *)&self->_updatedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_keyUsage, 0);
  objc_storeStrong((id *)&self->_keyType, 0);
  objc_storeStrong((id *)&self->_publicKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
