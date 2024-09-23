@implementation HMHomeWalletKey

- (HMHomeWalletKey)initWithUUID:(id)a3 customURL:(id)a4 expressEnabled:(BOOL)a5 uwbUnlockEnabled:(BOOL)a6 color:(int64_t)a7
{
  id v13;
  id v14;
  HMHomeWalletKey *v15;
  HMHomeWalletKey *v16;
  objc_super v18;

  v13 = a3;
  v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMHomeWalletKey;
  v15 = -[HMHomeWalletKey init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_UUID, a3);
    objc_storeStrong((id *)&v16->_customURL, a4);
    v16->_expressEnabled = a5;
    v16->_uwbUnlockEnabled = a6;
    v16->_color = a7;
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
  int64_t v12;
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
    -[HMHomeWalletKey UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMHomeWalletKey customURL](self, "customURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "customURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10)
        && (v11 = -[HMHomeWalletKey isExpressEnabled](self, "isExpressEnabled"),
            v11 == objc_msgSend(v6, "isExpressEnabled"))
        && (v12 = -[HMHomeWalletKey color](self, "color"), v12 == objc_msgSend(v6, "color")))
      {
        v13 = -[HMHomeWalletKey isUWBUnlockEnabled](self, "isUWBUnlockEnabled");
        v14 = v13 ^ objc_msgSend(v6, "isUWBUnlockEnabled") ^ 1;
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
  void *v2;
  unint64_t v3;

  -[HMHomeWalletKey UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HMHomeWalletKey UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("HMHomeWalletKeyUUID"));

  -[HMHomeWalletKey customURL](self, "customURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("HMHomeWalletKeyCustomURL"));

  objc_msgSend(v6, "encodeBool:forKey:", -[HMHomeWalletKey isExpressEnabled](self, "isExpressEnabled"), CFSTR("HMHomeWalletKeyExpressEnabled"));
  objc_msgSend(v6, "encodeBool:forKey:", -[HMHomeWalletKey isUWBUnlockEnabled](self, "isUWBUnlockEnabled"), CFSTR("HMHomeWalletKeyUWBUnlockEnabled"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[HMHomeWalletKey color](self, "color"), CFSTR("HMHomeWalletKeyEncodedColor"));

}

- (HMHomeWalletKey)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMHomeWalletKey *v12;
  HMHomeWalletKey *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMHomeWalletKeyUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMHomeWalletKeyCustomURL"));
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
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize wallet keyfrom decoded UUID: %@ customURL: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = 0;
  }
  else
  {
    v12 = -[HMHomeWalletKey initWithUUID:customURL:expressEnabled:uwbUnlockEnabled:color:](self, "initWithUUID:customURL:expressEnabled:uwbUnlockEnabled:color:", v5, v6, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMHomeWalletKeyExpressEnabled")), objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMHomeWalletKeyUWBUnlockEnabled")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMHomeWalletKeyEncodedColor")));
    v13 = v12;
  }

  return v13;
}

- (NSString)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
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
  -[HMHomeWalletKey UUID](self, "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UUID"), v19);
  v20[0] = v4;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMHomeWalletKey customURL](self, "customURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Custom URL"), v6);
  v20[1] = v7;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMHomeWalletKey isExpressEnabled](self, "isExpressEnabled");
  HMFBooleanToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Express Enabled"), v9);
  v20[2] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMHomeWalletKey isUWBUnlockEnabled](self, "isUWBUnlockEnabled");
  HMFBooleanToString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("UWB Enabled"), v12);
  v20[3] = v13;
  v14 = objc_alloc(MEMORY[0x1E0D28548]);
  HMHomeWalletKeyColorAsString(-[HMHomeWalletKey color](self, "color"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("Color"), v15);
  v20[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v17;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)customURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isExpressEnabled
{
  return self->_expressEnabled;
}

- (BOOL)isUWBUnlockEnabled
{
  return self->_uwbUnlockEnabled;
}

- (int64_t)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customURL, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
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
