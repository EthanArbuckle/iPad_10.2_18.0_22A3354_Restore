@implementation HMAccessoryAccessCodeValue

- (HMAccessoryAccessCodeValue)initWithAccessoryUUID:(id)a3 accessCodeValue:(id)a4 uniqueIdentifier:(id)a5 hasRestrictions:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  HMAccessoryAccessCodeValue *v13;
  uint64_t v14;
  NSUUID *accessoryUUID;
  uint64_t v16;
  HMAccessCodeValue *accessCodeValue;
  uint64_t v18;
  NSNumber *uniqueIdentifier;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HMAccessoryAccessCodeValue;
  v13 = -[HMAccessoryAccessCodeValue init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    accessoryUUID = v13->_accessoryUUID;
    v13->_accessoryUUID = (NSUUID *)v14;

    v16 = objc_msgSend(v11, "copy");
    accessCodeValue = v13->_accessCodeValue;
    v13->_accessCodeValue = (HMAccessCodeValue *)v16;

    v18 = objc_msgSend(v12, "copy");
    uniqueIdentifier = v13->_uniqueIdentifier;
    v13->_uniqueIdentifier = (NSNumber *)v18;

    v13->_hasRestrictions = a6;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  int v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMAccessoryAccessCodeValue accessoryUUID](self, "accessoryUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMAccessoryAccessCodeValue accessCodeValue](self, "accessCodeValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accessCodeValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[HMAccessoryAccessCodeValue uniqueIdentifier](self, "uniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v12))
        {
          v13 = -[HMAccessoryAccessCodeValue hasRestrictions](self, "hasRestrictions");
          v14 = v13 ^ objc_msgSend(v6, "hasRestrictions") ^ 1;
        }
        else
        {
          LOBYTE(v14) = 0;
        }

      }
      else
      {
        LOBYTE(v14) = 0;
      }

    }
    else
    {
      LOBYTE(v14) = 0;
    }

  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  -[HMAccessoryAccessCodeValue accessoryUUID](self, "accessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMAccessoryAccessCodeValue accessCodeValue](self, "accessCodeValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HMAccessoryAccessCodeValue uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  v9 = v8 ^ -[HMAccessoryAccessCodeValue hasRestrictions](self, "hasRestrictions");

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMAccessoryAccessCodeValue accessoryUUID](self, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMAccessoryAccessCodeValueCodingKeyAccessoryUUID"));

  -[HMAccessoryAccessCodeValue accessCodeValue](self, "accessCodeValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMAccessoryAccessCodeValueCodingKeyAccessCodeValue"));

  -[HMAccessoryAccessCodeValue uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMAccessoryAccessCodeValueCodingKeyUniqueIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMAccessoryAccessCodeValue hasRestrictions](self, "hasRestrictions"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMAccessoryAccessCodeValueCodingKeyHasRestrictions"));

}

- (HMAccessoryAccessCodeValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v13;
  NSObject *v14;
  void *v15;
  HMAccessoryAccessCodeValue *v16;
  HMAccessoryAccessCodeValue *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessoryAccessCodeValueCodingKeyAccessoryUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessoryAccessCodeValueCodingKeyAccessCodeValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessoryAccessCodeValueCodingKeyUniqueIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessoryAccessCodeValueCodingKeyHasRestrictions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
    v10 = v6 == 0;
  else
    v10 = 1;
  if (v10 || v7 == 0 || v8 == 0)
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544386;
      v20 = v15;
      v21 = 2112;
      v22 = v5;
      v23 = 2112;
      v24 = v6;
      v25 = 2112;
      v26 = v7;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding accessoryUUID: %@, accessCodeValue: %@, uniqueIdentifier: %@, hasRestrictions: %@,", (uint8_t *)&v19, 0x34u);

    }
    objc_autoreleasePoolPop(v13);
    v17 = 0;
  }
  else
  {
    v16 = -[HMAccessoryAccessCodeValue initWithAccessoryUUID:accessCodeValue:uniqueIdentifier:hasRestrictions:](self, "initWithAccessoryUUID:accessCodeValue:uniqueIdentifier:hasRestrictions:", v5, v6, v7, objc_msgSend(v8, "BOOLValue"));
    v17 = v16;
  }

  return v17;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessoryAccessCodeValue accessoryUUID](self, "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("accessoryUUID"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessoryAccessCodeValue accessCodeValue](self, "accessCodeValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("accessCodeValue"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessoryAccessCodeValue uniqueIdentifier](self, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("uniqueIdentifier"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMAccessoryAccessCodeValue hasRestrictions](self, "hasRestrictions"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("hasRestrictions"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v15;
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMAccessCodeValue)accessCodeValue
{
  return (HMAccessCodeValue *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)uniqueIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)hasRestrictions
{
  return self->_hasRestrictions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accessCodeValue, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
