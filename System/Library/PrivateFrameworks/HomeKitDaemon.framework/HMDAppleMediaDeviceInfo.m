@implementation HMDAppleMediaDeviceInfo

- (HMDAppleMediaDeviceInfo)initWithDeviceID:(id)a3 mediaRouteID:(id)a4 deviceCapabilities:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDAppleMediaDeviceInfo *v12;
  HMDAppleMediaDeviceInfo *v13;
  uint64_t v14;
  NSUUID *mediaRouteUUID;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDAppleMediaDeviceInfo;
  v12 = -[HMDAppleMediaDeviceInfo init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deviceID, a3);
    objc_msgSend(MEMORY[0x24BE3F210], "hmf_cachedInstanceForNSString:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
    mediaRouteUUID = v13->_mediaRouteUUID;
    v13->_mediaRouteUUID = (NSUUID *)v14;

    objc_storeStrong((id *)&v13->_capabilities, a5);
  }

  return v13;
}

- (HMDAppleMediaDeviceInfo)initWithPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAppleMediaDeviceInfo *v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("HMDAM.c"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("HMDAM.u"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("HMDAM.r"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMDAppleMediaDeviceInfo initWithDeviceID:mediaRouteID:deviceCapabilities:](self, "initWithDeviceID:mediaRouteID:deviceCapabilities:", v7, v8, v6);
  return v9;
}

- (HMDAppleMediaDeviceInfo)init
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAppleMediaDeviceInfo *v9;
  HMDAppleMediaDeviceInfo *v11;
  SEL v12;

  v3 = (id)_mediaRouteIdentifier;
  if (v3)
  {
    v4 = v3;
    v5 = (id)uniqueDeviceId;
    +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "capabilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMDAppleMediaDeviceInfo initWithDeviceID:mediaRouteID:deviceCapabilities:](self, "initWithDeviceID:mediaRouteID:deviceCapabilities:", v5, v4, v8);

    return v9;
  }
  else
  {
    v11 = (HMDAppleMediaDeviceInfo *)_HMFPreconditionFailure();
    return (HMDAppleMediaDeviceInfo *)-[HMDAppleMediaDeviceInfo asPayload](v11, v12);
  }
}

- (id)asPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaDeviceInfo deviceID](self, "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDAppleMediaDeviceInfo deviceID](self, "deviceID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("HMDAM.u"));

  }
  -[HMDAppleMediaDeviceInfo mediaRouteUUID](self, "mediaRouteUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDAppleMediaDeviceInfo mediaRouteUUID](self, "mediaRouteUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("HMDAM.r"));

  }
  -[HMDAppleMediaDeviceInfo capabilities](self, "capabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD1618];
    -[HMDAppleMediaDeviceInfo capabilities](self, "capabilities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("HMDAM.c"));

  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
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
  -[HMDAppleMediaDeviceInfo deviceID](self, "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Device ID"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAppleMediaDeviceInfo modelID](self, "modelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Model ID"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAppleMediaDeviceInfo mediaRouteUUID](self, "mediaRouteUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Media Route"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAppleMediaDeviceInfo capabilities](self, "capabilities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Capabilities"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSUUID)modelID
{
  return self->_modelID;
}

- (void)setModelID:(id)a3
{
  objc_storeStrong((id *)&self->_modelID, a3);
}

- (NSUUID)mediaRouteUUID
{
  return self->_mediaRouteUUID;
}

- (HMDDeviceCapabilities)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_mediaRouteUUID, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
