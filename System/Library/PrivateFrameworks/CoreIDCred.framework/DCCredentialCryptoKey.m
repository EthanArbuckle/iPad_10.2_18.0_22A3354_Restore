@implementation DCCredentialCryptoKey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *attestation;
  NSData *casdAttestation;
  NSData *casdSignature;
  NSData *progenitorKeyAttestation;
  NSData *keyAuthorization;
  NSArray *kskAttestation;
  id v10;

  v10 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v10, "encodeObject:forKey:", self->_identifier, 0x24C3072A8);
  objc_msgSend(v10, "encodeObject:forKey:", self->_publicKey, 0x24C3075C8);
  objc_msgSend(v10, "encodeObject:forKey:", self->_publicKeyIdentifier, 0x24C3072C8);
  objc_msgSend(v10, "encodeObject:forKey:", self->_publicKeyCOSEKey, 0x24C307528);
  objc_msgSend(v10, "encodeInteger:forKey:", self->_keyType, 0x24C3072E8);
  objc_msgSend(v10, "encodeInteger:forKey:", self->_keyUsage, 0x24C307308);
  attestation = self->_attestation;
  if (attestation)
    objc_msgSend(v10, "encodeObject:forKey:", attestation, 0x24C307328);
  casdAttestation = self->_casdAttestation;
  if (casdAttestation)
    objc_msgSend(v10, "encodeObject:forKey:", casdAttestation, 0x24C307348);
  casdSignature = self->_casdSignature;
  if (casdSignature)
    objc_msgSend(v10, "encodeObject:forKey:", casdSignature, 0x24C307368);
  progenitorKeyAttestation = self->_progenitorKeyAttestation;
  if (progenitorKeyAttestation)
    objc_msgSend(v10, "encodeObject:forKey:", progenitorKeyAttestation, 0x24C307388);
  keyAuthorization = self->_keyAuthorization;
  if (keyAuthorization)
    objc_msgSend(v10, "encodeObject:forKey:", keyAuthorization, 0x24C3073A8);
  kskAttestation = self->_kskAttestation;
  if (kskAttestation)
    objc_msgSend(v10, "encodeObject:forKey:", kskAttestation, 0x24C3073C8);
  os_unfair_lock_unlock(&self->_lock);

}

- (DCCredentialCryptoKey)initWithCoder:(id)a3
{
  id v4;
  DCCredentialCryptoKey *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSData *publicKey;
  uint64_t v10;
  NSData *publicKeyIdentifier;
  uint64_t v12;
  NSData *publicKeyCOSEKey;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *attestation;
  uint64_t v19;
  NSData *casdAttestation;
  uint64_t v21;
  NSData *casdSignature;
  uint64_t v23;
  NSData *progenitorKeyAttestation;
  uint64_t v25;
  NSData *keyAuthorization;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSArray *kskAttestation;

  v4 = a3;
  v5 = -[DCCredentialCryptoKey init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3072A8);
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3075C8);
    v8 = objc_claimAutoreleasedReturnValue();
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3072C8);
    v10 = objc_claimAutoreleasedReturnValue();
    publicKeyIdentifier = v5->_publicKeyIdentifier;
    v5->_publicKeyIdentifier = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307528);
    v12 = objc_claimAutoreleasedReturnValue();
    publicKeyCOSEKey = v5->_publicKeyCOSEKey;
    v5->_publicKeyCOSEKey = (NSData *)v12;

    v5->_keyType = objc_msgSend(v4, "decodeIntegerForKey:", 0x24C3072E8);
    v5->_keyUsage = objc_msgSend(v4, "decodeIntegerForKey:", 0x24C307308);
    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, 0x24C307328);
    v17 = objc_claimAutoreleasedReturnValue();
    attestation = v5->_attestation;
    v5->_attestation = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307348);
    v19 = objc_claimAutoreleasedReturnValue();
    casdAttestation = v5->_casdAttestation;
    v5->_casdAttestation = (NSData *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307368);
    v21 = objc_claimAutoreleasedReturnValue();
    casdSignature = v5->_casdSignature;
    v5->_casdSignature = (NSData *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307388);
    v23 = objc_claimAutoreleasedReturnValue();
    progenitorKeyAttestation = v5->_progenitorKeyAttestation;
    v5->_progenitorKeyAttestation = (NSData *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3073A8);
    v25 = objc_claimAutoreleasedReturnValue();
    keyAuthorization = v5->_keyAuthorization;
    v5->_keyAuthorization = (NSData *)v25;

    v27 = (void *)MEMORY[0x24BDBCF20];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, 0x24C3073C8);
    v30 = objc_claimAutoreleasedReturnValue();
    kskAttestation = v5->_kskAttestation;
    v5->_kskAttestation = (NSArray *)v30;

  }
  return v5;
}

- (DCCredentialCryptoKey)initWithIdentifier:(id)a3 publicKey:(id)a4 publicKeyIdentifier:(id)a5 publicKeyCOSEKey:(id)a6 keyType:(unint64_t)a7 keyUsage:(unint64_t)a8 attestation:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  DCCredentialCryptoKey *v20;
  uint64_t v21;
  NSString *identifier;
  uint64_t v23;
  NSData *publicKey;
  uint64_t v25;
  NSData *publicKeyIdentifier;
  uint64_t v27;
  NSData *publicKeyCOSEKey;
  uint64_t v29;
  NSArray *attestation;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  v20 = -[DCCredentialCryptoKey init](self, "init");
  if (v20)
  {
    v21 = objc_msgSend(v15, "copy");
    identifier = v20->_identifier;
    v20->_identifier = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    publicKey = v20->_publicKey;
    v20->_publicKey = (NSData *)v23;

    v25 = objc_msgSend(v17, "copy");
    publicKeyIdentifier = v20->_publicKeyIdentifier;
    v20->_publicKeyIdentifier = (NSData *)v25;

    v27 = objc_msgSend(v18, "copy");
    publicKeyCOSEKey = v20->_publicKeyCOSEKey;
    v20->_publicKeyCOSEKey = (NSData *)v27;

    v20->_keyUsage = a8;
    v20->_keyType = a7;
    v29 = objc_msgSend(v19, "copy");
    attestation = v20->_attestation;
    v20->_attestation = (NSArray *)v29;

  }
  return v20;
}

- (DCCredentialCryptoKey)initWithIdentifier:(id)a3 publicKey:(id)a4 publicKeyIdentifier:(id)a5 publicKeyCOSEKey:(id)a6 keyType:(unint64_t)a7 keyUsage:(unint64_t)a8 attestation:(id)a9 keyAuthorization:(id)a10 kskAttestation:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  DCCredentialCryptoKey *v24;
  uint64_t v25;
  NSString *identifier;
  uint64_t v27;
  NSData *publicKey;
  uint64_t v29;
  NSData *publicKeyIdentifier;
  uint64_t v31;
  NSData *publicKeyCOSEKey;
  uint64_t v33;
  NSArray *attestation;
  uint64_t v35;
  NSData *keyAuthorization;
  uint64_t v37;
  NSArray *kskAttestation;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = -[DCCredentialCryptoKey init](self, "init");
  if (v24)
  {
    v25 = objc_msgSend(v17, "copy");
    identifier = v24->_identifier;
    v24->_identifier = (NSString *)v25;

    v27 = objc_msgSend(v18, "copy");
    publicKey = v24->_publicKey;
    v24->_publicKey = (NSData *)v27;

    v29 = objc_msgSend(v19, "copy");
    publicKeyIdentifier = v24->_publicKeyIdentifier;
    v24->_publicKeyIdentifier = (NSData *)v29;

    v31 = objc_msgSend(v20, "copy");
    publicKeyCOSEKey = v24->_publicKeyCOSEKey;
    v24->_publicKeyCOSEKey = (NSData *)v31;

    v24->_keyUsage = a8;
    v24->_keyType = a7;
    v33 = objc_msgSend(v21, "copy");
    attestation = v24->_attestation;
    v24->_attestation = (NSArray *)v33;

    v35 = objc_msgSend(v22, "copy");
    keyAuthorization = v24->_keyAuthorization;
    v24->_keyAuthorization = (NSData *)v35;

    v37 = objc_msgSend(v23, "copy");
    kskAttestation = v24->_kskAttestation;
    v24->_kskAttestation = (NSArray *)v37;

  }
  return v24;
}

- (DCCredentialCryptoKey)initWithIdentifier:(id)a3 publicKey:(id)a4 publicKeyIdentifier:(id)a5 publicKeyCOSEKey:(id)a6 keyType:(unint64_t)a7 keyUsage:(unint64_t)a8 casdSignature:(id)a9 casdAttestation:(id)a10 keyAuthorization:(id)a11 kskAttestation:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  DCCredentialCryptoKey *v25;
  uint64_t v26;
  NSString *identifier;
  uint64_t v28;
  NSData *publicKey;
  uint64_t v30;
  NSData *publicKeyIdentifier;
  uint64_t v32;
  NSData *publicKeyCOSEKey;
  uint64_t v34;
  NSData *casdAttestation;
  uint64_t v36;
  NSData *casdSignature;
  uint64_t v38;
  NSData *keyAuthorization;
  uint64_t v40;
  NSArray *kskAttestation;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = -[DCCredentialCryptoKey init](self, "init");
  if (v25)
  {
    v26 = objc_msgSend(v17, "copy");
    identifier = v25->_identifier;
    v25->_identifier = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    publicKey = v25->_publicKey;
    v25->_publicKey = (NSData *)v28;

    v30 = objc_msgSend(v19, "copy");
    publicKeyIdentifier = v25->_publicKeyIdentifier;
    v25->_publicKeyIdentifier = (NSData *)v30;

    v32 = objc_msgSend(v20, "copy");
    publicKeyCOSEKey = v25->_publicKeyCOSEKey;
    v25->_publicKeyCOSEKey = (NSData *)v32;

    v25->_keyUsage = a8;
    v25->_keyType = a7;
    v34 = objc_msgSend(v22, "copy");
    casdAttestation = v25->_casdAttestation;
    v25->_casdAttestation = (NSData *)v34;

    v36 = objc_msgSend(v21, "copy");
    casdSignature = v25->_casdSignature;
    v25->_casdSignature = (NSData *)v36;

    v38 = objc_msgSend(v23, "copy");
    keyAuthorization = v25->_keyAuthorization;
    v25->_keyAuthorization = (NSData *)v38;

    v40 = objc_msgSend(v24, "copy");
    kskAttestation = v25->_kskAttestation;
    v25->_kskAttestation = (NSArray *)v40;

  }
  return v25;
}

- (DCCredentialCryptoKey)initWithIdentifier:(id)a3 publicKey:(id)a4 publicKeyIdentifier:(id)a5 publicKeyCOSEKey:(id)a6 keyType:(unint64_t)a7 keyUsage:(unint64_t)a8 progenitorKeyAttestation:(id)a9 casdAttestation:(id)a10 keyAuthorization:(id)a11 kskAttestation:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  DCCredentialCryptoKey *v25;
  uint64_t v26;
  NSString *identifier;
  uint64_t v28;
  NSData *publicKey;
  uint64_t v30;
  NSData *publicKeyIdentifier;
  uint64_t v32;
  NSData *publicKeyCOSEKey;
  uint64_t v34;
  NSData *casdAttestation;
  uint64_t v36;
  NSData *progenitorKeyAttestation;
  uint64_t v38;
  NSData *keyAuthorization;
  uint64_t v40;
  NSArray *kskAttestation;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = -[DCCredentialCryptoKey init](self, "init");
  if (v25)
  {
    v26 = objc_msgSend(v17, "copy");
    identifier = v25->_identifier;
    v25->_identifier = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    publicKey = v25->_publicKey;
    v25->_publicKey = (NSData *)v28;

    v30 = objc_msgSend(v19, "copy");
    publicKeyIdentifier = v25->_publicKeyIdentifier;
    v25->_publicKeyIdentifier = (NSData *)v30;

    v32 = objc_msgSend(v20, "copy");
    publicKeyCOSEKey = v25->_publicKeyCOSEKey;
    v25->_publicKeyCOSEKey = (NSData *)v32;

    v25->_keyUsage = a8;
    v25->_keyType = a7;
    v34 = objc_msgSend(v22, "copy");
    casdAttestation = v25->_casdAttestation;
    v25->_casdAttestation = (NSData *)v34;

    v36 = objc_msgSend(v21, "copy");
    progenitorKeyAttestation = v25->_progenitorKeyAttestation;
    v25->_progenitorKeyAttestation = (NSData *)v36;

    v38 = objc_msgSend(v23, "copy");
    keyAuthorization = v25->_keyAuthorization;
    v25->_keyAuthorization = (NSData *)v38;

    v40 = objc_msgSend(v24, "copy");
    kskAttestation = v25->_kskAttestation;
    v25->_kskAttestation = (NSArray *)v40;

  }
  return v25;
}

- (DCCredentialCryptoKey)init
{
  DCCredentialCryptoKey *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DCCredentialCryptoKey;
  result = -[DCCredentialCryptoKey init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  NSString *identifier;
  NSData *publicKeyIdentifier;
  void *v7;
  void *v8;
  void *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x24BDD17C8];
  identifier = self->_identifier;
  publicKeyIdentifier = self->_publicKeyIdentifier;
  DCCredentialCryptoKeyTypeToString(self->_keyType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DCCredentialCryptoKeyUsageToString(self->_keyUsage);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("DCCredentialCryptoKey identifier = %@, publicKeyIdentifier = %@, keyType = %@, keyUsage = %@"), identifier, publicKeyIdentifier, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (NSString)identifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_identifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_identifier != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    identifier = self->_identifier;
    self->_identifier = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSData)publicKey
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_publicKey;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPublicKey:(id)a3
{
  NSData *v4;
  NSData *publicKey;
  NSData *v6;

  v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_publicKey != v6)
  {
    v4 = (NSData *)-[NSData copyWithZone:](v6, "copyWithZone:", 0);
    publicKey = self->_publicKey;
    self->_publicKey = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSData)publicKeyIdentifier
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_publicKeyIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPublicKeyIdentifier:(id)a3
{
  NSData *v4;
  NSData *publicKeyIdentifier;
  NSData *v6;

  v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_publicKeyIdentifier != v6)
  {
    v4 = (NSData *)-[NSData copyWithZone:](v6, "copyWithZone:", 0);
    publicKeyIdentifier = self->_publicKeyIdentifier;
    self->_publicKeyIdentifier = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSData)publicKeyCOSEKey
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_publicKeyCOSEKey;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPublicKeyCOSEKey:(id)a3
{
  NSData *v4;
  NSData *publicKeyCOSEKey;
  NSData *v6;

  v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_publicKeyCOSEKey != v6)
  {
    v4 = (NSData *)-[NSData copyWithZone:](v6, "copyWithZone:", 0);
    publicKeyCOSEKey = self->_publicKeyCOSEKey;
    self->_publicKeyCOSEKey = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (unint64_t)keyType
{
  os_unfair_lock_s *p_lock;
  unint64_t keyType;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  keyType = self->_keyType;
  os_unfair_lock_unlock(p_lock);
  return keyType;
}

- (void)setKeyType:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_keyType = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)keyUsage
{
  os_unfair_lock_s *p_lock;
  unint64_t keyUsage;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  keyUsage = self->_keyUsage;
  os_unfair_lock_unlock(p_lock);
  return keyUsage;
}

- (void)setKeyUsage:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_keyUsage = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSArray)attestation
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_attestation;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAttestation:(id)a3
{
  NSArray *v4;
  NSArray *attestation;
  NSArray *v6;

  v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_attestation != v6)
  {
    v4 = (NSArray *)-[NSArray copyWithZone:](v6, "copyWithZone:", 0);
    attestation = self->_attestation;
    self->_attestation = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSData)casdAttestation
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_casdAttestation;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCasdAttestation:(id)a3
{
  NSData *v4;
  NSData *casdAttestation;
  NSData *v6;

  v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_casdAttestation != v6)
  {
    v4 = (NSData *)-[NSData copyWithZone:](v6, "copyWithZone:", 0);
    casdAttestation = self->_casdAttestation;
    self->_casdAttestation = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSData)casdSignature
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_casdSignature;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCasdSignature:(id)a3
{
  NSData *v4;
  NSData *casdSignature;
  NSData *v6;

  v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_casdSignature != v6)
  {
    v4 = (NSData *)-[NSData copyWithZone:](v6, "copyWithZone:", 0);
    casdSignature = self->_casdSignature;
    self->_casdSignature = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSData)progenitorKeyAttestation
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_progenitorKeyAttestation;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setProgenitorKeyAttestation:(id)a3
{
  NSData *v4;
  NSData *progenitorKeyAttestation;
  NSData *v6;

  v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_progenitorKeyAttestation != v6)
  {
    v4 = (NSData *)-[NSData copyWithZone:](v6, "copyWithZone:", 0);
    progenitorKeyAttestation = self->_progenitorKeyAttestation;
    self->_progenitorKeyAttestation = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSData)keyAuthorization
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_keyAuthorization;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setKeyAuthorization:(id)a3
{
  NSData *v4;
  NSData *keyAuthorization;
  NSData *v6;

  v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_keyAuthorization != v6)
  {
    v4 = (NSData *)-[NSData copyWithZone:](v6, "copyWithZone:", 0);
    keyAuthorization = self->_keyAuthorization;
    self->_keyAuthorization = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSArray)kskAttestation
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_kskAttestation;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setKskAttestation:(id)a3
{
  NSArray *v4;
  NSArray *kskAttestation;
  NSArray *v6;

  v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_kskAttestation != v6)
  {
    v4 = (NSArray *)-[NSArray copyWithZone:](v6, "copyWithZone:", 0);
    kskAttestation = self->_kskAttestation;
    self->_kskAttestation = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_publicKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKeyCOSEKey, 0);
  objc_storeStrong((id *)&self->_attestation, 0);
  objc_storeStrong((id *)&self->_casdAttestation, 0);
  objc_storeStrong((id *)&self->_casdSignature, 0);
  objc_storeStrong((id *)&self->_progenitorKeyAttestation, 0);
  objc_storeStrong((id *)&self->_keyAuthorization, 0);
  objc_storeStrong((id *)&self->_kskAttestation, 0);
}

@end
