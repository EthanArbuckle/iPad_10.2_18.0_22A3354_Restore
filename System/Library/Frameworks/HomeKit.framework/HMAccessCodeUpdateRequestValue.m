@implementation HMAccessCodeUpdateRequestValue

- (HMAccessCodeUpdateRequestValue)initWithAccessoryAccessCodeValue:(id)a3 updatedAccessCodeValue:(id)a4
{
  id v6;
  id v7;
  HMAccessCodeUpdateRequestValue *v8;
  uint64_t v9;
  HMAccessoryAccessCodeValue *accessoryAccessCodeValue;
  uint64_t v11;
  HMAccessCodeValue *updatedAccessCodeValue;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMAccessCodeUpdateRequestValue;
  v8 = -[HMAccessCodeUpdateRequestValue init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    accessoryAccessCodeValue = v8->_accessoryAccessCodeValue;
    v8->_accessoryAccessCodeValue = (HMAccessoryAccessCodeValue *)v9;

    v11 = objc_msgSend(v7, "copy");
    updatedAccessCodeValue = v8->_updatedAccessCodeValue;
    v8->_updatedAccessCodeValue = (HMAccessCodeValue *)v11;

  }
  return v8;
}

- (NSUUID)accessoryUUID
{
  void *v2;
  void *v3;

  -[HMAccessCodeUpdateRequestValue accessoryAccessCodeValue](self, "accessoryAccessCodeValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
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
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMAccessCodeUpdateRequestValue accessoryAccessCodeValue](self, "accessoryAccessCodeValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryAccessCodeValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMAccessCodeUpdateRequestValue updatedAccessCodeValue](self, "updatedAccessCodeValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "updatedAccessCodeValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMAccessCodeUpdateRequestValue accessoryAccessCodeValue](self, "accessoryAccessCodeValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMAccessCodeUpdateRequestValue updatedAccessCodeValue](self, "updatedAccessCodeValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMAccessCodeUpdateRequestValue accessoryAccessCodeValue](self, "accessoryAccessCodeValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMAccessCodeUpdateRequestValueCodingKeyAccessoryAccessCodeValue"));

  -[HMAccessCodeUpdateRequestValue updatedAccessCodeValue](self, "updatedAccessCodeValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMAccessCodeUpdateRequestValueCodingKeyUpdatedAccessCodeValue"));

}

- (HMAccessCodeUpdateRequestValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMAccessCodeUpdateRequestValue *v12;
  HMAccessCodeUpdateRequestValue *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessCodeUpdateRequestValueCodingKeyAccessoryAccessCodeValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessCodeUpdateRequestValueCodingKeyUpdatedAccessCodeValue"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v11;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding accessoryAccessCodeValue: %@, updatedAccessCodeValue: %@,", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = 0;
  }
  else
  {
    v12 = -[HMAccessCodeUpdateRequestValue initWithAccessoryAccessCodeValue:updatedAccessCodeValue:](self, "initWithAccessoryAccessCodeValue:updatedAccessCodeValue:", v5, v6);
    v13 = v12;
  }

  return v13;
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
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessCodeUpdateRequestValue accessoryAccessCodeValue](self, "accessoryAccessCodeValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("accessoryAccessCodeValue"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessCodeUpdateRequestValue updatedAccessCodeValue](self, "updatedAccessCodeValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("updatedAccessCodeValue"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (HMAccessoryAccessCodeValue)accessoryAccessCodeValue
{
  return (HMAccessoryAccessCodeValue *)objc_getProperty(self, a2, 8, 1);
}

- (HMAccessCodeValue)updatedAccessCodeValue
{
  return (HMAccessCodeValue *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUserUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)guestName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setGuestName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guestName, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_updatedAccessCodeValue, 0);
  objc_storeStrong((id *)&self->_accessoryAccessCodeValue, 0);
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
