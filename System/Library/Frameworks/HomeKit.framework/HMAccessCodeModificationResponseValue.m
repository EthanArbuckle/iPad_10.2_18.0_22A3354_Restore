@implementation HMAccessCodeModificationResponseValue

- (HMAccessCodeModificationResponseValue)initWithAccessoryUUID:(id)a3 accessoryAccessCodeValue:(id)a4 accessCodeValue:(id)a5 operationType:(int64_t)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HMAccessCodeModificationResponseValue *v16;
  uint64_t v17;
  NSUUID *accessoryUUID;
  uint64_t v19;
  HMAccessoryAccessCodeValue *accessoryAccessCodeValue;
  uint64_t v21;
  HMAccessCodeValue *accessCodeValue;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)HMAccessCodeModificationResponseValue;
  v16 = -[HMAccessCodeModificationResponseValue init](&v24, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    accessoryUUID = v16->_accessoryUUID;
    v16->_accessoryUUID = (NSUUID *)v17;

    v19 = objc_msgSend(v13, "copy");
    accessoryAccessCodeValue = v16->_accessoryAccessCodeValue;
    v16->_accessoryAccessCodeValue = (HMAccessoryAccessCodeValue *)v19;

    v21 = objc_msgSend(v14, "copy");
    accessCodeValue = v16->_accessCodeValue;
    v16->_accessCodeValue = (HMAccessCodeValue *)v21;

    v16->_operationType = a6;
    objc_storeStrong((id *)&v16->_error, a7);
  }

  return v16;
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
  int v11;
  void *v12;
  void *v13;
  int v14;
  int64_t v15;
  void *v16;
  void *v17;
  char v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMAccessCodeModificationResponseValue accessoryUUID](self, "accessoryUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqual:", v8))
      goto LABEL_10;
    -[HMAccessCodeModificationResponseValue accessoryAccessCodeValue](self, "accessoryAccessCodeValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryAccessCodeValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HMFEqualObjects();

    if (!v11)
      goto LABEL_10;
    -[HMAccessCodeModificationResponseValue accessCodeValue](self, "accessCodeValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessCodeValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = HMFEqualObjects();

    if (!v14)
      goto LABEL_10;
    v15 = -[HMAccessCodeModificationResponseValue operationType](self, "operationType");
    if (v15 == objc_msgSend(v6, "operationType"))
    {
      -[HMAccessCodeModificationResponseValue error](self, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = HMFEqualObjects();

    }
    else
    {
LABEL_10:
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  unint64_t v11;

  -[HMAccessCodeModificationResponseValue accessoryUUID](self, "accessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMAccessCodeModificationResponseValue accessoryAccessCodeValue](self, "accessoryAccessCodeValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HMAccessCodeModificationResponseValue accessCodeValue](self, "accessCodeValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[HMAccessCodeModificationResponseValue operationType](self, "operationType");
  -[HMAccessCodeModificationResponseValue error](self, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HMAccessCodeModificationResponseValue accessoryUUID](self, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMAccessCodeModificationResponseValueCodingKeyAccessoryUUID"));

  -[HMAccessCodeModificationResponseValue accessoryAccessCodeValue](self, "accessoryAccessCodeValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMAccessCodeModificationResponseValueCodingKeyAccessoryAccessCodeValue"));

  -[HMAccessCodeModificationResponseValue accessCodeValue](self, "accessCodeValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMAccessCodeModificationResponseValueCodingKeyAccessCodeValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMAccessCodeModificationResponseValue operationType](self, "operationType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMAccessCodeModificationResponseValueCodingKeyOperationType"));

  -[HMAccessCodeModificationResponseValue error](self, "error");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HMAccessCodeModificationResponseValueCodingKeyError"));

}

- (HMAccessCodeModificationResponseValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMAccessCodeModificationResponseValue *v10;
  HMAccessCodeModificationResponseValue *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessCodeModificationResponseValueCodingKeyAccessoryUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessCodeModificationResponseValueCodingKeyAccessoryAccessCodeValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessCodeModificationResponseValueCodingKeyAccessCodeValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessCodeModificationResponseValueCodingKeyOperationType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessCodeModificationResponseValueCodingKeyError"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v8)
  {
    v10 = -[HMAccessCodeModificationResponseValue initWithAccessoryUUID:accessoryAccessCodeValue:accessCodeValue:operationType:error:](self, "initWithAccessoryUUID:accessoryAccessCodeValue:accessCodeValue:operationType:error:", v5, v6, v7, objc_msgSend(v8, "integerValue"), v9);
    v11 = v10;
  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v14;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding accessoryUUID: %@, operationType: %@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessCodeModificationResponseValue accessoryUUID](self, "accessoryUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("accessoryUUID"), v19);
  v20[0] = v4;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessCodeModificationResponseValue accessoryAccessCodeValue](self, "accessoryAccessCodeValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("accessoryAccessCodeValue"), v6);
  v20[1] = v7;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessCodeModificationResponseValue accessCodeValue](self, "accessCodeValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("accessCodeValue"), v9);
  v20[2] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMAccessCodeModificationResponseValue operationType](self, "operationType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("operationType"), v12);
  v20[3] = v13;
  v14 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessCodeModificationResponseValue error](self, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("error"), v15);
  v20[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v17;
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMAccessoryAccessCodeValue)accessoryAccessCodeValue
{
  return (HMAccessoryAccessCodeValue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccessoryAccessCodeValue:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (HMAccessCodeValue)accessCodeValue
{
  return (HMAccessCodeValue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccessCodeValue:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (int64_t)operationType
{
  return self->_operationType;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_accessCodeValue, 0);
  objc_storeStrong((id *)&self->_accessoryAccessCodeValue, 0);
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
