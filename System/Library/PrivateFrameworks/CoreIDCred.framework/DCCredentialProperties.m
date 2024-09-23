@implementation DCCredentialProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialIdentifier, 0x24C307168);
  objc_msgSend(v5, "encodeObject:forKey:", self->_partition, 0x24C307188);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_credentialState, 0x24C3071A8);
  objc_msgSend(v5, "encodeObject:forKey:", self->_options, 0x24C3071C8);
  objc_msgSend(v5, "encodeObject:forKey:", self->_createdAt, 0x24C3071E8);
  objc_msgSend(v5, "encodeObject:forKey:", self->_updatedAt, 0x24C307208);
  objc_msgSend(v5, "encodeObject:forKey:", self->_payloadValidFrom, 0x24C307548);
  objc_msgSend(v5, "encodeObject:forKey:", self->_payloadValidUntil, 0x24C307568);
  objc_msgSend(v5, "encodeObject:forKey:", self->_keySigningKeys, 0x24C3073E8);
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceEncryptionKeys, 0x24C307408);
  objc_msgSend(v5, "encodeObject:forKey:", self->_presentmentKeys, 0x24C307428);
  objc_msgSend(v5, "encodeObject:forKey:", self->_payloadProtectionKeys, 0x24C307448);
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasUsablePresentmentAuthPolicy, 0x24C307468);
  objc_msgSend(v5, "encodeBool:forKey:", self->_needsPresentmentKeyRefresh, 0x24C307488);
  objc_msgSend(v5, "encodeObject:forKey:", self->_payloadIngestionHash, 0x24C3075A8);
  objc_msgSend(v5, "encodeObject:forKey:", self->_region, 0x24C3076A8);
  objc_msgSend(v5, "encodeObject:forKey:", self->_issuingJurisdiction, 0x24C3076C8);
  objc_msgSend(v5, "encodeObject:forKey:", self->_docType, 0x24C307268);

  os_unfair_lock_unlock(p_lock);
}

- (DCCredentialProperties)initWithCoder:(id)a3
{
  id v4;
  DCCredentialProperties *v5;
  uint64_t v6;
  NSString *credentialIdentifier;
  uint64_t v8;
  NSString *partition;
  uint64_t v10;
  DCCredentialOptions *options;
  uint64_t v12;
  NSDate *createdAt;
  uint64_t v14;
  NSDate *updatedAt;
  uint64_t v16;
  NSDate *payloadValidFrom;
  uint64_t v18;
  NSDate *payloadValidUntil;
  uint64_t v20;
  NSData *payloadIngestionHash;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSDictionary *keySigningKeys;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSDictionary *deviceEncryptionKeys;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSDictionary *presentmentKeys;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSArray *payloadProtectionKeys;
  uint64_t v45;
  NSString *region;
  uint64_t v47;
  NSString *issuingJurisdiction;
  uint64_t v49;
  NSString *docType;

  v4 = a3;
  v5 = -[DCCredentialProperties init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307168);
    v6 = objc_claimAutoreleasedReturnValue();
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v6;

    v5->_credentialState = objc_msgSend(v4, "decodeIntegerForKey:", 0x24C3071A8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307188);
    v8 = objc_claimAutoreleasedReturnValue();
    partition = v5->_partition;
    v5->_partition = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3071C8);
    v10 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (DCCredentialOptions *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3071E8);
    v12 = objc_claimAutoreleasedReturnValue();
    createdAt = v5->_createdAt;
    v5->_createdAt = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307208);
    v14 = objc_claimAutoreleasedReturnValue();
    updatedAt = v5->_updatedAt;
    v5->_updatedAt = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307548);
    v16 = objc_claimAutoreleasedReturnValue();
    payloadValidFrom = v5->_payloadValidFrom;
    v5->_payloadValidFrom = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307568);
    v18 = objc_claimAutoreleasedReturnValue();
    payloadValidUntil = v5->_payloadValidUntil;
    v5->_payloadValidUntil = (NSDate *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3075A8);
    v20 = objc_claimAutoreleasedReturnValue();
    payloadIngestionHash = v5->_payloadIngestionHash;
    v5->_payloadIngestionHash = (NSData *)v20;

    v22 = (void *)MEMORY[0x24BDBCF20];
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, 0x24C3073E8);
    v26 = objc_claimAutoreleasedReturnValue();
    keySigningKeys = v5->_keySigningKeys;
    v5->_keySigningKeys = (NSDictionary *)v26;

    v28 = (void *)MEMORY[0x24BDBCF20];
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, 0x24C307408);
    v32 = objc_claimAutoreleasedReturnValue();
    deviceEncryptionKeys = v5->_deviceEncryptionKeys;
    v5->_deviceEncryptionKeys = (NSDictionary *)v32;

    v34 = (void *)MEMORY[0x24BDBCF20];
    v35 = objc_opt_class();
    v36 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v35, v36, objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, 0x24C307428);
    v38 = objc_claimAutoreleasedReturnValue();
    presentmentKeys = v5->_presentmentKeys;
    v5->_presentmentKeys = (NSDictionary *)v38;

    v40 = (void *)MEMORY[0x24BDBCF20];
    v41 = objc_opt_class();
    objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, 0x24C307448);
    v43 = objc_claimAutoreleasedReturnValue();
    payloadProtectionKeys = v5->_payloadProtectionKeys;
    v5->_payloadProtectionKeys = (NSArray *)v43;

    v5->_hasUsablePresentmentAuthPolicy = objc_msgSend(v4, "decodeBoolForKey:", 0x24C307468);
    v5->_needsPresentmentKeyRefresh = objc_msgSend(v4, "decodeBoolForKey:", 0x24C307488);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3076A8);
    v45 = objc_claimAutoreleasedReturnValue();
    region = v5->_region;
    v5->_region = (NSString *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3076C8);
    v47 = objc_claimAutoreleasedReturnValue();
    issuingJurisdiction = v5->_issuingJurisdiction;
    v5->_issuingJurisdiction = (NSString *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307268);
    v49 = objc_claimAutoreleasedReturnValue();
    docType = v5->_docType;
    v5->_docType = (NSString *)v49;

  }
  return v5;
}

- (DCCredentialProperties)init
{
  DCCredentialProperties *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DCCredentialProperties;
  result = -[DCCredentialProperties init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (id)description
{
  return CFSTR("DCCredentialProperties");
}

- (NSString)credentialIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_credentialIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCredentialIdentifier:(id)a3
{
  NSString *v4;
  NSString *credentialIdentifier;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_credentialIdentifier != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    credentialIdentifier = self->_credentialIdentifier;
    self->_credentialIdentifier = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSString)partition
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_partition;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPartition:(id)a3
{
  NSString *v4;
  NSString *partition;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_partition != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    partition = self->_partition;
    self->_partition = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (unint64_t)credentialState
{
  os_unfair_lock_s *p_lock;
  unint64_t credentialState;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  credentialState = self->_credentialState;
  os_unfair_lock_unlock(p_lock);
  return credentialState;
}

- (void)setCredentialState:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_credentialState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (DCCredentialOptions)options
{
  os_unfair_lock_s *p_lock;
  DCCredentialOptions *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_options;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setOptions:(id)a3
{
  DCCredentialOptions *v4;
  DCCredentialOptions *options;
  DCCredentialOptions *v6;

  v6 = (DCCredentialOptions *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_options != v6)
  {
    v4 = -[DCCredentialOptions copyWithZone:](v6, "copyWithZone:", 0);
    options = self->_options;
    self->_options = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSDate)createdAt
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_createdAt;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCreatedAt:(id)a3
{
  NSDate *v4;
  NSDate *createdAt;
  NSDate *v6;

  v6 = (NSDate *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_createdAt != v6)
  {
    v4 = (NSDate *)-[NSDate copyWithZone:](v6, "copyWithZone:", 0);
    createdAt = self->_createdAt;
    self->_createdAt = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSDate)updatedAt
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_updatedAt;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setUpdatedAt:(id)a3
{
  NSDate *v4;
  NSDate *updatedAt;
  NSDate *v6;

  v6 = (NSDate *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_updatedAt != v6)
  {
    v4 = (NSDate *)-[NSDate copyWithZone:](v6, "copyWithZone:", 0);
    updatedAt = self->_updatedAt;
    self->_updatedAt = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSDate)payloadValidFrom
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_payloadValidFrom;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPayloadValidFrom:(id)a3
{
  NSDate *v4;
  NSDate *payloadValidFrom;
  NSDate *v6;

  v6 = (NSDate *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_payloadValidFrom != v6)
  {
    v4 = (NSDate *)-[NSDate copyWithZone:](v6, "copyWithZone:", 0);
    payloadValidFrom = self->_payloadValidFrom;
    self->_payloadValidFrom = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSDate)payloadValidUntil
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_payloadValidUntil;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPayloadValidUntil:(id)a3
{
  NSDate *v4;
  NSDate *payloadValidUntil;
  NSDate *v6;

  v6 = (NSDate *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_payloadValidUntil != v6)
  {
    v4 = (NSDate *)-[NSDate copyWithZone:](v6, "copyWithZone:", 0);
    payloadValidUntil = self->_payloadValidUntil;
    self->_payloadValidUntil = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSData)payloadIngestionHash
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_payloadIngestionHash;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPayloadIngestionHash:(id)a3
{
  NSData *v4;
  NSData *payloadIngestionHash;
  NSData *v6;

  v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_payloadIngestionHash != v6)
  {
    v4 = (NSData *)-[NSData copyWithZone:](v6, "copyWithZone:", 0);
    payloadIngestionHash = self->_payloadIngestionHash;
    self->_payloadIngestionHash = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSDictionary)keySigningKeys
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_keySigningKeys;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setKeySigningKeys:(id)a3
{
  NSDictionary *v4;
  NSDictionary *keySigningKeys;
  NSDictionary *v6;

  v6 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_keySigningKeys != v6)
  {
    v4 = (NSDictionary *)-[NSDictionary copyWithZone:](v6, "copyWithZone:", 0);
    keySigningKeys = self->_keySigningKeys;
    self->_keySigningKeys = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSDictionary)deviceEncryptionKeys
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_deviceEncryptionKeys;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDeviceEncryptionKeys:(id)a3
{
  NSDictionary *v4;
  NSDictionary *deviceEncryptionKeys;
  NSDictionary *v6;

  v6 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_deviceEncryptionKeys != v6)
  {
    v4 = (NSDictionary *)-[NSDictionary copyWithZone:](v6, "copyWithZone:", 0);
    deviceEncryptionKeys = self->_deviceEncryptionKeys;
    self->_deviceEncryptionKeys = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSDictionary)presentmentKeys
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_presentmentKeys;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPresentmentKeys:(id)a3
{
  NSDictionary *v4;
  NSDictionary *presentmentKeys;
  NSDictionary *v6;

  v6 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_presentmentKeys != v6)
  {
    v4 = (NSDictionary *)-[NSDictionary copyWithZone:](v6, "copyWithZone:", 0);
    presentmentKeys = self->_presentmentKeys;
    self->_presentmentKeys = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSArray)payloadProtectionKeys
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_payloadProtectionKeys;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPayloadProtectionKeys:(id)a3
{
  NSArray *v4;
  NSArray *payloadProtectionKeys;
  NSArray *v6;

  v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_payloadProtectionKeys != v6)
  {
    v4 = (NSArray *)-[NSArray copyWithZone:](v6, "copyWithZone:", 0);
    payloadProtectionKeys = self->_payloadProtectionKeys;
    self->_payloadProtectionKeys = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)hasUsablePresentmentAuthPolicy
{
  DCCredentialProperties *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_hasUsablePresentmentAuthPolicy;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasUsablePresentmentAuthPolicy:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_hasUsablePresentmentAuthPolicy = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)needsPresentmentKeyRefresh
{
  DCCredentialProperties *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_needsPresentmentKeyRefresh;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setNeedsPresentmentKeyRefresh:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_needsPresentmentKeyRefresh = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSString)region
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_region;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setRegion:(id)a3
{
  NSString *v4;
  NSString *region;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_region != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    region = self->_region;
    self->_region = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSString)issuingJurisdiction
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_issuingJurisdiction;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setIssuingJurisdiction:(id)a3
{
  NSString *v4;
  NSString *issuingJurisdiction;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_issuingJurisdiction != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    issuingJurisdiction = self->_issuingJurisdiction;
    self->_issuingJurisdiction = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSString)docType
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_docType;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDocType:(id)a3
{
  NSString *v4;
  NSString *docType;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_docType != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    docType = self->_docType;
    self->_docType = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_docType, 0);
  objc_storeStrong((id *)&self->_issuingJurisdiction, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_payloadProtectionKeys, 0);
  objc_storeStrong((id *)&self->_presentmentKeys, 0);
  objc_storeStrong((id *)&self->_deviceEncryptionKeys, 0);
  objc_storeStrong((id *)&self->_keySigningKeys, 0);
  objc_storeStrong((id *)&self->_payloadIngestionHash, 0);
  objc_storeStrong((id *)&self->_payloadValidUntil, 0);
  objc_storeStrong((id *)&self->_payloadValidFrom, 0);
  objc_storeStrong((id *)&self->_updatedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_partition, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
}

@end
