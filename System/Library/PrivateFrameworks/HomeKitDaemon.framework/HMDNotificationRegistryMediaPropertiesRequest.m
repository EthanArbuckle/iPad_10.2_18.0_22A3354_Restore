@implementation HMDNotificationRegistryMediaPropertiesRequest

- (HMDNotificationRegistryMediaPropertiesRequest)initWithEnable:(BOOL)a3 user:(id)a4 deviceIdsDestination:(id)a5 mediaProfileUUID:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDNotificationRegistryMediaPropertiesRequest *v14;
  uint64_t v15;
  NSUUID *mediaProfileUUID;
  uint64_t v17;
  NSMutableSet *mediaProperties;
  HMDNotificationRegistryMediaPropertiesRequest *v20;
  SEL v21;
  objc_super v22;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v11)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v13 = v12;
  if (!v12)
  {
LABEL_9:
    v20 = (HMDNotificationRegistryMediaPropertiesRequest *)_HMFPreconditionFailure();
    return (HMDNotificationRegistryMediaPropertiesRequest *)-[HMDNotificationRegistryMediaPropertiesRequest attributeDescriptions](v20, v21);
  }
  v22.receiver = self;
  v22.super_class = (Class)HMDNotificationRegistryMediaPropertiesRequest;
  v14 = -[HMDNotificationRegistryRequest initWithEnable:user:deviceIdsDestination:](&v22, sel_initWithEnable_user_deviceIdsDestination_, v8, v10, v11);
  if (v14)
  {
    v15 = objc_msgSend(v13, "copy");
    mediaProfileUUID = v14->_mediaProfileUUID;
    v14->_mediaProfileUUID = (NSUUID *)v15;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    mediaProperties = v14->_mediaProperties;
    v14->_mediaProperties = (NSMutableSet *)v17;

  }
  return v14;
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
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)HMDNotificationRegistryMediaPropertiesRequest;
  -[HMDNotificationRegistryRequest attributeDescriptions](&v15, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNotificationRegistryMediaPropertiesRequest mediaProfileUUID](self, "mediaProfileUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Media Profile UUID"), v5);
  v16[0] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNotificationRegistryMediaPropertiesRequest mediaProperties](self, "mediaProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Media Properties"), v10);
  v16[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSUUID)mediaProfileUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableSet)mediaProperties
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMediaProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProperties, 0);
  objc_storeStrong((id *)&self->_mediaProfileUUID, 0);
}

@end
