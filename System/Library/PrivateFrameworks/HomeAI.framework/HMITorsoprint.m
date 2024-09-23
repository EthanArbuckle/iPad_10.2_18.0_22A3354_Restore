@implementation HMITorsoprint

- (HMITorsoprint)initWithUUID:(id)a3 data:(id)a4
{
  return -[HMITorsoprint initWithUUID:data:lowQuality:unrecognizable:](self, "initWithUUID:data:lowQuality:unrecognizable:", a3, a4, 0, 0);
}

- (HMITorsoprint)initWithUUID:(id)a3 data:(id)a4 lowQuality:(BOOL)a5 unrecognizable:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  HMITorsoprint *v13;
  uint64_t v14;
  NSUUID *UUID;
  uint64_t v16;
  NSData *data;
  HMITorsoprint *v19;
  SEL v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  if (v11)
  {
    v12 = v11;
    v21.receiver = self;
    v21.super_class = (Class)HMITorsoprint;
    v13 = -[HMITorsoprint init](&v21, sel_init);
    if (v13)
    {
      v14 = objc_msgSend(v10, "copy");
      UUID = v13->_UUID;
      v13->_UUID = (NSUUID *)v14;

      v16 = objc_msgSend(v12, "copy");
      data = v13->_data;
      v13->_data = (NSData *)v16;

      v13->_lowQuality = a5;
      v13->_unrecognizable = a6;
    }

    return v13;
  }
  else
  {
    v19 = (HMITorsoprint *)_HMFPreconditionFailure();
    return (HMITorsoprint *)-[HMITorsoprint attributeDescriptions](v19, v20);
  }
}

- (id)attributeDescriptions
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

  v17[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMITorsoprint UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UUID"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMITorsoprint data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Data"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMITorsoprint lowQuality](self, "lowQuality");
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Bad Torso"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMITorsoprint unrecognizable](self, "unrecognizable");
  HMFBooleanToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("ROI Boundary"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
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
  int v12;
  _BOOL4 v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMITorsoprint UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMITorsoprint data](self, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "data");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToData:", v10)
        && (v11 = -[HMITorsoprint lowQuality](self, "lowQuality"), v11 == objc_msgSend(v6, "lowQuality")))
      {
        v13 = -[HMITorsoprint unrecognizable](self, "unrecognizable");
        v12 = v13 ^ objc_msgSend(v6, "unrecognizable") ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }

    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMITorsoprint UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HMITorsoprint UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("HMITP.ck.u"));

  -[HMITorsoprint data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("HMITP.ck.d"));

  objc_msgSend(v6, "encodeBool:forKey:", -[HMITorsoprint lowQuality](self, "lowQuality"), CFSTR("HMITP.ck.lq"));
  objc_msgSend(v6, "encodeBool:forKey:", -[HMITorsoprint unrecognizable](self, "unrecognizable"), CFSTR("HMITP.ck.ur"));

}

- (HMITorsoprint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  BOOL v9;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMITorsoprint *v17;
  HMITorsoprint *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMITP.ck.u"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMITP.ck.d"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "containsValueForKey:", CFSTR("HMITP.ck.lq"));
  v8 = objc_msgSend(v4, "containsValueForKey:", CFSTR("HMITP.ck.ur"));
  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v7 == 0 || v8 == 0)
  {
    v12 = (void *)MEMORY[0x220735570]();
    v17 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138544386;
      v21 = v14;
      v22 = 2112;
      v23 = v5;
      v24 = 2112;
      v25 = v6;
      v26 = 2112;
      v27 = v15;
      v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded UUID: %@ data: %@ hasLowQualityKey: %@, hasUnrecognizableKey: %@", (uint8_t *)&v20, 0x34u);

    }
    objc_autoreleasePoolPop(v12);
    v18 = 0;
  }
  else
  {
    v17 = -[HMITorsoprint initWithUUID:data:lowQuality:unrecognizable:](self, "initWithUUID:data:lowQuality:unrecognizable:", v5, v6, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMITP.ck.lq")), objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMITP.ck.ur")));
    v18 = v17;
  }

  return v18;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)lowQuality
{
  return self->_lowQuality;
}

- (BOOL)unrecognizable
{
  return self->_unrecognizable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
