@implementation HMSettingVersionValue

- (HMSettingVersionValue)initWithVersion:(id)a3 type:(int64_t)a4
{
  id v7;
  void *v8;
  HMSettingVersionValue *v9;
  HMSettingVersionValue *v10;
  HMSettingVersionValue *v12;
  SEL v13;
  id v14;
  objc_super v15;

  v7 = a3;
  if (v7)
  {
    v8 = v7;
    v15.receiver = self;
    v15.super_class = (Class)HMSettingVersionValue;
    v9 = -[HMImmutableSettingValue initSettingValue](&v15, sel_initSettingValue);
    v10 = v9;
    if (v9)
    {
      v9->_type = a4;
      objc_storeStrong((id *)&v9->_version, a3);
    }

    return v10;
  }
  else
  {
    v12 = (HMSettingVersionValue *)_HMFPreconditionFailure();
    return -[HMSettingVersionValue initWithPayload:](v12, v13, v14);
  }
}

- (HMSettingVersionValue)initWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  void *v13;
  HMSettingVersionValue *v14;
  HMSettingVersionValue *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0;
  v5 = objc_msgSend(v4, "hmf_integerForKey:error:", CFSTR("HMSettingVersionValueTypePayloadKey"), &v17);
  v6 = v17;
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("HMSettingVersionValueVersionPayloadKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", v7);
  v9 = (void *)v8;
  if (v6)
    v10 = 1;
  else
    v10 = v8 == 0;
  if (v10)
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v15 = 0;
  }
  else
  {
    v14 = -[HMSettingVersionValue initWithVersion:type:](self, "initWithVersion:type:", v8, v5);
    v15 = v14;
  }

  return v15;
}

- (id)payloadCopy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v9[0] = &unk_1E3B2E140;
  v8[0] = CFSTR("HMImmutableSettingValueTypePayloadKey");
  v8[1] = CFSTR("HMSettingVersionValueTypePayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMSettingVersionValue type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("HMSettingVersionValueVersionPayloadKey");
  -[HMSettingVersionValue version](self, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "versionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)HMSettingVersionValue;
  -[HMImmutableSettingValue attributeDescriptions](&v13, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  HMSettingVersionValueTypeAsString(-[HMSettingVersionValue type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("type"), v5);
  v14[0] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSettingVersionValue version](self, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("version"), v8);
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HMSettingVersionValue *v4;
  HMSettingVersionValue *v5;
  HMSettingVersionValue *v6;
  int64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HMSettingVersionValue *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6 && (v7 = -[HMSettingVersionValue type](self, "type"), v7 == -[HMSettingVersionValue type](v6, "type")))
    {
      -[HMSettingVersionValue version](self, "version");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSettingVersionValue version](v6, "version");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMSettingVersionValue version](self, "version");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (HMFVersion)version
{
  return (HMFVersion *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
}

@end
