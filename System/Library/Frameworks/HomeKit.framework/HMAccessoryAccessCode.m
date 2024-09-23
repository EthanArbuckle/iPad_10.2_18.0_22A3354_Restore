@implementation HMAccessoryAccessCode

- (HMAccessoryAccessCode)initWithAccessory:(id)a3 accessCodeValue:(id)a4 uniqueIdentifier:(id)a5 hasRestrictions:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  HMAccessoryAccessCode *v14;
  HMAccessoryAccessCode *v15;
  uint64_t v16;
  HMAccessCodeValue *accessCodeValue;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMAccessoryAccessCode;
  v14 = -[HMAccessoryAccessCode init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_accessory, a3);
    v16 = objc_msgSend(v12, "copy");
    accessCodeValue = v15->_accessCodeValue;
    v15->_accessCodeValue = (HMAccessCodeValue *)v16;

    objc_storeStrong((id *)&v15->_uniqueIdentifier, a5);
    v15->_hasRestrictions = a6;
  }

  return v15;
}

- (id)createAccessoryAccessCodeValue
{
  HMAccessoryAccessCodeValue *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMAccessoryAccessCodeValue *v8;

  v3 = [HMAccessoryAccessCodeValue alloc];
  -[HMAccessoryAccessCode accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryAccessCode accessCodeValue](self, "accessCodeValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryAccessCode uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMAccessoryAccessCodeValue initWithAccessoryUUID:accessCodeValue:uniqueIdentifier:hasRestrictions:](v3, "initWithAccessoryUUID:accessCodeValue:uniqueIdentifier:hasRestrictions:", v5, v6, v7, -[HMAccessoryAccessCode hasRestrictions](self, "hasRestrictions"));

  return v8;
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
  void *v15;
  void *v16;
  int v17;
  _BOOL4 v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_9;
  -[HMAccessoryAccessCode accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = HMFEqualObjects();

  if (!v11)
    goto LABEL_9;
  -[HMAccessoryAccessCode accessCodeValue](self, "accessCodeValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessCodeValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = HMFEqualObjects();

  if (v14)
  {
    -[HMAccessoryAccessCode uniqueIdentifier](self, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 == v16)
    {
      v19 = -[HMAccessoryAccessCode hasRestrictions](self, "hasRestrictions");
      v17 = v19 ^ objc_msgSend(v6, "hasRestrictions") ^ 1;
    }
    else
    {
      LOBYTE(v17) = 0;
    }

  }
  else
  {
LABEL_9:
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;

  -[HMAccessoryAccessCode accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[HMAccessoryAccessCode accessCodeValue](self, "accessCodeValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[HMAccessoryAccessCode uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash") ^ v5;
  v10 = v9 ^ -[HMAccessoryAccessCode hasRestrictions](self, "hasRestrictions");

  return v10;
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
  -[HMAccessoryAccessCode accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("accessory"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessoryAccessCode accessCodeValue](self, "accessCodeValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("accessCodeValue"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessoryAccessCode uniqueIdentifier](self, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("uniqueIdentifier"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMAccessoryAccessCode hasRestrictions](self, "hasRestrictions"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("hasRestrictions"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v15;
}

- (HMAccessory)accessory
{
  return (HMAccessory *)objc_getProperty(self, a2, 16, 1);
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
  objc_storeStrong((id *)&self->_accessory, 0);
}

+ (HMAccessoryAccessCode)accessoryAccessCodeWithValue:(id)a3 accessory:(id)a4
{
  id v5;
  id v6;
  HMAccessoryAccessCode *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HMAccessoryAccessCode *v11;

  v5 = a4;
  v6 = a3;
  v7 = [HMAccessoryAccessCode alloc];
  objc_msgSend(v6, "accessCodeValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasRestrictions");

  v11 = -[HMAccessoryAccessCode initWithAccessory:accessCodeValue:uniqueIdentifier:hasRestrictions:](v7, "initWithAccessory:accessCodeValue:uniqueIdentifier:hasRestrictions:", v5, v8, v9, v10);
  return v11;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
