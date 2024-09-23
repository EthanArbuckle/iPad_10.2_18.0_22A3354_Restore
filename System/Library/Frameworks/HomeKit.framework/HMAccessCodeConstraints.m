@implementation HMAccessCodeConstraints

- (HMAccessCodeConstraints)initWithAllowedCharacterSets:(unint64_t)a3 minimumLength:(int64_t)a4 maximumLength:(int64_t)a5 maximumAllowedAccessCodes:(int64_t)a6
{
  HMAccessCodeConstraints *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMAccessCodeConstraints;
  result = -[HMAccessCodeConstraints init](&v11, sel_init);
  if (result)
  {
    result->_allowedCharacterSets = a3;
    result->_minimumLength = a4;
    result->_maximumLength = a5;
    result->_maximumAllowedAccessCodes = a6;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v7 = -[HMAccessCodeConstraints allowedCharacterSets](self, "allowedCharacterSets"),
        v7 == objc_msgSend(v6, "allowedCharacterSets"))
    && (v8 = -[HMAccessCodeConstraints minimumLength](self, "minimumLength"), v8 == objc_msgSend(v6, "minimumLength"))
    && (v9 = -[HMAccessCodeConstraints maximumLength](self, "maximumLength"), v9 == objc_msgSend(v6, "maximumLength")))
  {
    v10 = -[HMAccessCodeConstraints maximumAllowedAccessCodes](self, "maximumAllowedAccessCodes");
    v11 = v10 == objc_msgSend(v6, "maximumAllowedAccessCodes");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  int64_t v4;
  int64_t v5;

  v3 = -[HMAccessCodeConstraints allowedCharacterSets](self, "allowedCharacterSets");
  v4 = -[HMAccessCodeConstraints minimumLength](self, "minimumLength") ^ v3;
  v5 = -[HMAccessCodeConstraints maximumLength](self, "maximumLength");
  return v4 ^ v5 ^ -[HMAccessCodeConstraints maximumAllowedAccessCodes](self, "maximumAllowedAccessCodes");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMAccessCodeConstraints allowedCharacterSets](self, "allowedCharacterSets"), CFSTR("HMAccessCodeConstraintsCodingKeyAllowedCharacterSets"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMAccessCodeConstraints minimumLength](self, "minimumLength"), CFSTR("HMAccessCodeConstraintsCodingKeyMinimumLength"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMAccessCodeConstraints maximumLength](self, "maximumLength"), CFSTR("HMAccessCodeConstraintsCodingKeyMaximumLength"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMAccessCodeConstraints maximumAllowedAccessCodes](self, "maximumAllowedAccessCodes"), CFSTR("HMAccessCodeConstraintsCodingKeyMaximumAllowedAccessCodes"));

}

- (HMAccessCodeConstraints)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  HMAccessCodeConstraints *v9;
  HMAccessCodeConstraints *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMAccessCodeConstraintsCodingKeyAllowedCharacterSets"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMAccessCodeConstraintsCodingKeyMinimumLength"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMAccessCodeConstraintsCodingKeyMaximumLength"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMAccessCodeConstraintsCodingKeyMaximumAllowedAccessCodes"));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HMAccessCodeConstraintsCodingKeyAllowedCharacterSets"))&& objc_msgSend(v4, "containsValueForKey:", CFSTR("HMAccessCodeConstraintsCodingKeyMinimumLength"))&& objc_msgSend(v4, "containsValueForKey:", CFSTR("HMAccessCodeConstraintsCodingKeyMaximumLength"))&& (objc_msgSend(v4, "containsValueForKey:", CFSTR("HMAccessCodeConstraintsCodingKeyMaximumAllowedAccessCodes")) & 1) != 0)
  {
    v9 = -[HMAccessCodeConstraints initWithAllowedCharacterSets:minimumLength:maximumLength:maximumAllowedAccessCodes:](self, "initWithAllowedCharacterSets:minimumLength:maximumLength:maximumAllowedAccessCodes:", v5, v6, v7, v8);
    v10 = v9;
  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544386;
      v16 = v13;
      v17 = 2048;
      v18 = v5;
      v19 = 2048;
      v20 = v6;
      v21 = 2048;
      v22 = v7;
      v23 = 2048;
      v24 = v8;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding allowedCharacterSets: %ld, minimumLength:%ld, maximumLength:%ld maximumAllowedAccessCodes:%ld", (uint8_t *)&v15, 0x34u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMAccessCodeConstraints allowedCharacterSets](self, "allowedCharacterSets"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("allowedCharacterSets"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMAccessCodeConstraints minimumLength](self, "minimumLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("minimumLength"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMAccessCodeConstraints maximumLength](self, "maximumLength"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("maximumLength"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMAccessCodeConstraints maximumAllowedAccessCodes](self, "maximumAllowedAccessCodes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("maximumAllowedAccessCodes"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v15;
}

- (unint64_t)allowedCharacterSets
{
  return self->_allowedCharacterSets;
}

- (int64_t)minimumLength
{
  return self->_minimumLength;
}

- (int64_t)maximumLength
{
  return self->_maximumLength;
}

- (int64_t)maximumAllowedAccessCodes
{
  return self->_maximumAllowedAccessCodes;
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
