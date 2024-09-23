@implementation HMDTargetConfiguration

- (HMDTargetConfiguration)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDTargetConfiguration)initWithIdentifier:(id)a3 name:(id)a4 category:(int64_t)a5 buttonConfiguration:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMDTargetConfiguration *v14;
  HMDTargetConfiguration *v15;
  uint64_t v16;
  NSString *name;
  uint64_t v18;
  NSArray *buttonConfiguration;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMDTargetConfiguration;
  v14 = -[HMDTargetConfiguration init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    v16 = objc_msgSend(v12, "copy");
    name = v15->_name;
    v15->_name = (NSString *)v16;

    v15->_category = a5;
    v18 = objc_msgSend(v13, "copy");
    buttonConfiguration = v15->_buttonConfiguration;
    v15->_buttonConfiguration = (NSArray *)v18;

  }
  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDTargetConfiguration name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTargetConfiguration identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDTargetConfiguration category](self, "category");
  v7 = CFSTR("Unknown");
  if (v6 == 25)
    v7 = CFSTR("HomePod");
  if (v6 == 24)
    v7 = CFSTR("AppleTV");
  v8 = v7;
  -[HMDTargetConfiguration buttonConfiguration](self, "buttonConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  buttonConfigurationAsString(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Name: %@, Identifier: %@, Category: %@, ButtonConfiguration: %@"), v4, v5, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (HMDTargetConfiguration)initWithAccessory:(id)a3 buttonConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HMDTargetConfiguration *v16;
  uint64_t v17;
  NSUUID *uuid;
  HMDTargetConfiguration *v19;
  HMDTargetConfiguration *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedInt:", identifierForTargetWithUUID(v10, v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "category");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = mapTargetCategory(v14);

    v16 = -[HMDTargetConfiguration initWithIdentifier:name:category:buttonConfiguration:](self, "initWithIdentifier:name:category:buttonConfiguration:", v12, v13, v15, v7);
    if (v16)
    {
      objc_msgSend(v6, "uuid");
      v17 = objc_claimAutoreleasedReturnValue();
      uuid = v16->_uuid;
      v16->_uuid = (NSUUID *)v17;

    }
    v19 = v16;

    v20 = v19;
  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UUIDString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = v23;
      v30 = 2112;
      v31 = v24;
      v32 = 2112;
      v33 = v26;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Attempting to create a target with an accessory %@/%@ that is not configured with a home", (uint8_t *)&v28, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    v20 = 0;
  }

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  HMDTargetConfiguration *v4;
  HMDTargetConfiguration *v5;
  HMDTargetConfiguration *v6;
  HMDTargetConfiguration *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HMDTargetConfiguration *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      v10 = 1;
    }
    else
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      -[HMDTargetConfiguration identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDTargetConfiguration identifier](v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v8, "isEqual:", v9);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDTargetConfiguration identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (int64_t)category
{
  return self->_category;
}

- (NSArray)buttonConfiguration
{
  return self->_buttonConfiguration;
}

- (void)setButtonConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_buttonConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonConfiguration, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
