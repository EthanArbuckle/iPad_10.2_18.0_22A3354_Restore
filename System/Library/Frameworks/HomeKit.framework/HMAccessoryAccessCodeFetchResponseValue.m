@implementation HMAccessoryAccessCodeFetchResponseValue

- (HMAccessoryAccessCodeFetchResponseValue)initWithAccessoryUUID:(id)a3 accessoryAccessCodeValues:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMAccessoryAccessCodeFetchResponseValue *v11;
  uint64_t v12;
  NSUUID *accessoryUUID;
  uint64_t v14;
  NSArray *accessoryAccessCodeValues;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMAccessoryAccessCodeFetchResponseValue;
  v11 = -[HMAccessoryAccessCodeFetchResponseValue init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    accessoryUUID = v11->_accessoryUUID;
    v11->_accessoryUUID = (NSUUID *)v12;

    v14 = objc_msgSend(v9, "copy");
    accessoryAccessCodeValues = v11->_accessoryAccessCodeValues;
    v11->_accessoryAccessCodeValues = (NSArray *)v14;

    objc_storeStrong((id *)&v11->_error, a5);
  }

  return v11;
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
  char v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMAccessoryAccessCodeFetchResponseValue accessoryUUID](self, "accessoryUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8)
      && (-[HMAccessoryAccessCodeFetchResponseValue accessoryAccessCodeValues](self, "accessoryAccessCodeValues"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "accessoryAccessCodeValues"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = HMFEqualObjects(),
          v10,
          v9,
          v11))
    {
      -[HMAccessoryAccessCodeFetchResponseValue error](self, "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = HMFEqualObjects();

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
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
  unint64_t v8;

  -[HMAccessoryAccessCodeFetchResponseValue accessoryUUID](self, "accessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMAccessoryAccessCodeFetchResponseValue accessoryAccessCodeValues](self, "accessoryAccessCodeValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HMAccessoryAccessCodeFetchResponseValue error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMAccessoryAccessCodeFetchResponseValue accessoryUUID](self, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMAccessoryAccessCodeFetchResponseValueCodingKeyAccessoryUUID"));

  -[HMAccessoryAccessCodeFetchResponseValue accessoryAccessCodeValues](self, "accessoryAccessCodeValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMAccessoryAccessCodeFetchResponseValueCodingKeyAccessoryAccessCodeValues"));

  -[HMAccessoryAccessCodeFetchResponseValue error](self, "error");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMAccessoryAccessCodeFetchResponseValueCodingKeyError"));

}

- (HMAccessoryAccessCodeFetchResponseValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMAccessoryAccessCodeFetchResponseValue *v11;
  HMAccessoryAccessCodeFetchResponseValue *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessoryAccessCodeFetchResponseValueCodingKeyAccessoryUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HMAccessoryAccessCodeFetchResponseValueCodingKeyAccessoryAccessCodeValues"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessoryAccessCodeFetchResponseValueCodingKeyError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11 = -[HMAccessoryAccessCodeFetchResponseValue initWithAccessoryUUID:accessoryAccessCodeValues:error:](self, "initWithAccessoryUUID:accessoryAccessCodeValues:error:", v5, v9, v10);
    v12 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = 0;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding accessoryUUID: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
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
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessoryAccessCodeFetchResponseValue accessoryUUID](self, "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("accessoryUUID"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessoryAccessCodeFetchResponseValue accessoryAccessCodeValues](self, "accessoryAccessCodeValues", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("accessoryAccessCodeValues"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessoryAccessCodeFetchResponseValue error](self, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("error"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)accessoryAccessCodeValues
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_accessoryAccessCodeValues, 0);
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
