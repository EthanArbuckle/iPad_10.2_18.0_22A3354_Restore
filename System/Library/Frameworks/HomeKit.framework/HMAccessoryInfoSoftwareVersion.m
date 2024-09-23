@implementation HMAccessoryInfoSoftwareVersion

- (HMAccessoryInfoSoftwareVersion)initWithSoftwareVersion:(id)a3
{
  id v5;
  HMAccessoryInfoSoftwareVersion *v6;
  HMAccessoryInfoSoftwareVersion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMAccessoryInfoSoftwareVersion;
  v6 = -[HMAccessoryInfoSoftwareVersion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_softwareVersion, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)HMAccessoryInfoSoftwareVersion;
  -[HMAccessoryInfoSoftwareVersion description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoSoftwareVersion softwareVersion](self, "softwareVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoSoftwareVersion softwareVersion](self, "softwareVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@ (%@)"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HMAccessoryInfoSoftwareVersion *v4;
  HMAccessoryInfoSoftwareVersion *v5;
  HMAccessoryInfoSoftwareVersion *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMAccessoryInfoSoftwareVersion *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMAccessoryInfoSoftwareVersion softwareVersion](self, "softwareVersion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessoryInfoSoftwareVersion softwareVersion](v6, "softwareVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = HMFEqualObjects();

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMAccessoryInfoSoftwareVersion softwareVersion](self, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)protoPayload
{
  HMAccessoryInfoProtoSoftwareVersionInfoEvent *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(HMAccessoryInfoProtoSoftwareVersionInfoEvent);
  -[HMAccessoryInfoSoftwareVersion softwareVersion](self, "softwareVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoSoftwareVersionInfoEvent setMajorVersion:](v3, "setMajorVersion:", objc_msgSend(v4, "majorVersion"));

  -[HMAccessoryInfoSoftwareVersion softwareVersion](self, "softwareVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoSoftwareVersionInfoEvent setMinorVersion:](v3, "setMinorVersion:", objc_msgSend(v5, "minorVersion"));

  -[HMAccessoryInfoSoftwareVersion softwareVersion](self, "softwareVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoSoftwareVersionInfoEvent setUpdateVersion:](v3, "setUpdateVersion:", objc_msgSend(v6, "updateVersion"));

  -[HMAccessoryInfoSoftwareVersion softwareVersion](self, "softwareVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoSoftwareVersionInfoEvent setBuildVersion:](v3, "setBuildVersion:", v8);

  return v3;
}

- (id)protoData
{
  void *v2;
  void *v3;

  -[HMAccessoryInfoSoftwareVersion protoPayload](self, "protoPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMAccessoryInfoSoftwareVersion)initWithProtoPayload:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  HMAccessoryInfoSoftwareVersion *v11;
  HMAccessoryInfoSoftwareVersion *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "hasMajorVersion")
    && objc_msgSend(v4, "hasMinorVersion")
    && (objc_msgSend(v4, "hasUpdateVersion") & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x1E0D286A0]);
    v6 = objc_msgSend(v4, "majorVersion");
    v7 = objc_msgSend(v4, "minorVersion");
    v8 = objc_msgSend(v4, "updateVersion");
    objc_msgSend(v4, "buildVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "initWithMajorVersion:minorVersion:updateVersion:buildVersion:", v6, v7, v8, v9);

    v11 = -[HMAccessoryInfoSoftwareVersion initWithSoftwareVersion:](self, "initWithSoftwareVersion:", v10);
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
      v17 = 138544130;
      v18 = v15;
      v19 = 2048;
      v20 = objc_msgSend(v4, "majorVersion");
      v21 = 2048;
      v22 = objc_msgSend(v4, "minorVersion");
      v23 = 2048;
      v24 = objc_msgSend(v4, "updateVersion");
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Proto payload is missing required sw version info. Major: %lld minor: %lld update: %lld", (uint8_t *)&v17, 0x2Au);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (HMAccessoryInfoSoftwareVersion)initWithProtoData:(id)a3
{
  id v4;
  HMAccessoryInfoProtoSoftwareVersionInfoEvent *v5;
  HMAccessoryInfoSoftwareVersion *v6;

  v4 = a3;
  v5 = -[HMAccessoryInfoProtoSoftwareVersionInfoEvent initWithData:]([HMAccessoryInfoProtoSoftwareVersionInfoEvent alloc], "initWithData:", v4);

  v6 = -[HMAccessoryInfoSoftwareVersion initWithProtoPayload:](self, "initWithProtoPayload:", v5);
  return v6;
}

- (HMFSoftwareVersion)softwareVersion
{
  return (HMFSoftwareVersion *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareVersion, 0);
}

@end
