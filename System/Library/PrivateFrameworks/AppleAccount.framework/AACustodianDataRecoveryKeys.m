@implementation AACustodianDataRecoveryKeys

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AACustodianDataRecoveryKeys)initWithCoder:(id)a3
{
  id v4;
  AACustodianDataRecoveryKeys *v5;
  uint64_t v6;
  NSData *wrappedRKC;
  uint64_t v8;
  NSData *wrappingKey;
  uint64_t v10;
  NSUUID *custodianUUID;
  uint64_t v12;
  NSString *recordBuildVersion;

  v4 = a3;
  v5 = -[AACustodianDataRecoveryKeys init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_wrappedRKC"));
    v6 = objc_claimAutoreleasedReturnValue();
    wrappedRKC = v5->_wrappedRKC;
    v5->_wrappedRKC = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_wrappingKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    wrappingKey = v5->_wrappingKey;
    v5->_wrappingKey = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianUUID"));
    v10 = objc_claimAutoreleasedReturnValue();
    custodianUUID = v5->_custodianUUID;
    v5->_custodianUUID = (NSUUID *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recordBuildVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    recordBuildVersion = v5->_recordBuildVersion;
    v5->_recordBuildVersion = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *wrappedRKC;
  id v5;

  wrappedRKC = self->_wrappedRKC;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", wrappedRKC, CFSTR("_wrappedRKC"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wrappingKey, CFSTR("_wrappingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_custodianUUID, CFSTR("_custodianUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordBuildVersion, CFSTR("_recordBuildVersion"));

}

- (AACustodianDataRecoveryKeys)initWithWrappedRKC:(id)a3 wrappingKey:(id)a4 custodianUUID:(id)a5
{
  return -[AACustodianDataRecoveryKeys initWithWrappedRKC:wrappingKey:custodianUUID:recordBuildVersion:](self, "initWithWrappedRKC:wrappingKey:custodianUUID:recordBuildVersion:", a3, a4, a5, 0);
}

- (AACustodianDataRecoveryKeys)initWithWrappedRKC:(id)a3 wrappingKey:(id)a4 custodianUUID:(id)a5 recordBuildVersion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AACustodianDataRecoveryKeys *v15;
  AACustodianDataRecoveryKeys *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AACustodianDataRecoveryKeys;
  v15 = -[AACustodianDataRecoveryKeys init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_wrappedRKC, a3);
    objc_storeStrong((id *)&v16->_wrappingKey, a4);
    objc_storeStrong((id *)&v16->_custodianUUID, a5);
    objc_storeStrong((id *)&v16->_recordBuildVersion, a6);
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AACustodianDataRecoveryKeys *v4;
  uint64_t v5;
  NSData *wrappedRKC;
  uint64_t v7;
  NSData *wrappingKey;
  uint64_t v9;
  NSUUID *custodianUUID;
  uint64_t v11;
  NSString *recordBuildVersion;

  v4 = -[AACustodianDataRecoveryKeys init](+[AACustodianDataRecoveryKeys allocWithZone:](AACustodianDataRecoveryKeys, "allocWithZone:", a3), "init");
  v5 = -[NSData copy](self->_wrappedRKC, "copy");
  wrappedRKC = v4->_wrappedRKC;
  v4->_wrappedRKC = (NSData *)v5;

  v7 = -[NSData copy](self->_wrappingKey, "copy");
  wrappingKey = v4->_wrappingKey;
  v4->_wrappingKey = (NSData *)v7;

  v9 = -[NSUUID copy](self->_custodianUUID, "copy");
  custodianUUID = v4->_custodianUUID;
  v4->_custodianUUID = (NSUUID *)v9;

  v11 = -[NSString copy](self->_recordBuildVersion, "copy");
  recordBuildVersion = v4->_recordBuildVersion;
  v4->_recordBuildVersion = (NSString *)v11;

  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NSUUID UUIDString](self->_custodianUUID, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> for UUID: %@ recordBuildVersion: %@"), v4, self, v5, self->_recordBuildVersion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSData)wrappedRKC
{
  return self->_wrappedRKC;
}

- (void)setWrappedRKC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)wrappingKey
{
  return self->_wrappingKey;
}

- (void)setWrappingKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)custodianUUID
{
  return self->_custodianUUID;
}

- (void)setCustodianUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)recordBuildVersion
{
  return self->_recordBuildVersion;
}

- (void)setRecordBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordBuildVersion, 0);
  objc_storeStrong((id *)&self->_custodianUUID, 0);
  objc_storeStrong((id *)&self->_wrappingKey, 0);
  objc_storeStrong((id *)&self->_wrappedRKC, 0);
}

@end
