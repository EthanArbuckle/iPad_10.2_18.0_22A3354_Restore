@implementation HMDSettingConstraint

- (HMDSettingConstraint)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 type:(id)a5 numberValue:(id)a6 dataValue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDSettingConstraint *v17;
  uint64_t v18;
  NSUUID *identifier;
  uint64_t v20;
  NSUUID *parentIdentifier;
  uint64_t v22;
  NSNumber *type;
  uint64_t v24;
  NSNumber *numberValue;
  uint64_t v26;
  NSData *dataValue;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HMDSettingConstraint;
  v17 = -[HMDSettingConstraint init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSUUID *)v18;

    v20 = objc_msgSend(v13, "copy");
    parentIdentifier = v17->_parentIdentifier;
    v17->_parentIdentifier = (NSUUID *)v20;

    v22 = objc_msgSend(v14, "copy");
    type = v17->_type;
    v17->_type = (NSNumber *)v22;

    v24 = objc_msgSend(v15, "copy");
    numberValue = v17->_numberValue;
    v17->_numberValue = (NSNumber *)v24;

    v26 = objc_msgSend(v16, "copy");
    dataValue = v17->_dataValue;
    v17->_dataValue = (NSData *)v26;

  }
  return v17;
}

- (id)value
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[HMDSettingConstraint type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if ((unint64_t)(v4 - 1) >= 3)
  {
    if (v4 != 4)
    {
      v7 = 0;
      return v7;
    }
    -[HMDSettingConstraint dataValue](self, "dataValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDSettingConstraint numberValue](self, "numberValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v7 = (void *)objc_msgSend(v5, "copy");

  return v7;
}

- (NSString)name
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[HMDSettingConstraint type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "integerValue");
  HMSettingConstraintTypeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDSettingConstraint type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 == 4)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[HMDSettingConstraint value](self, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.%@"), v4, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  return (NSString *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDSettingConstraint *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "hmd_isForXPCTransport") & 1) != 0)
  {
    -[HMDSettingConstraint identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v5, *MEMORY[0x1E0CB9B38]);

    -[HMDSettingConstraint type](self, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, *MEMORY[0x1E0CB9B40]);

    -[HMDSettingConstraint value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, *MEMORY[0x1E0CB9B50]);

  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Did not encode setting constraint as transport is not XPC.", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (HMDSettingConstraint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)type
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)numberValue
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)dataValue
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
