@implementation HMDNotificationRegistryMediaPropertiesRequest

- (HMDNotificationRegistryMediaPropertiesRequest)initWithEnable:(BOOL)a3 userID:(id)a4 mediaProfileUUID:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  HMDNotificationRegistryMediaPropertiesRequest *v11;
  uint64_t v12;
  NSUUID *mediaProfileUUID;
  uint64_t v14;
  NSMutableSet *mediaProperties;
  HMDNotificationRegistryMediaPropertiesRequest *v17;
  SEL v18;
  objc_super v19;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v10 = v9;
  if (!v9)
  {
LABEL_7:
    v17 = (HMDNotificationRegistryMediaPropertiesRequest *)_HMFPreconditionFailure();
    return (HMDNotificationRegistryMediaPropertiesRequest *)-[HMDNotificationRegistryMediaPropertiesRequest attributeDescriptions](v17, v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDNotificationRegistryMediaPropertiesRequest;
  v11 = -[HMDNotificationRegistryRequest initWithEnable:userID:](&v19, sel_initWithEnable_userID_, v6, v8);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    mediaProfileUUID = v11->_mediaProfileUUID;
    v11->_mediaProfileUUID = (NSUUID *)v12;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    mediaProperties = v11->_mediaProperties;
    v11->_mediaProperties = (NSMutableSet *)v14;

  }
  return v11;
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

  v16[2] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)HMDNotificationRegistryMediaPropertiesRequest;
  -[HMDNotificationRegistryRequest attributeDescriptions](&v15, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNotificationRegistryMediaPropertiesRequest mediaProfileUUID](self, "mediaProfileUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Media Profile UUID"), v5);
  v16[0] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNotificationRegistryMediaPropertiesRequest mediaProperties](self, "mediaProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Media Properties"), v10);
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSUUID)mediaProfileUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableSet)mediaProperties
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMediaProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProperties, 0);
  objc_storeStrong((id *)&self->_mediaProfileUUID, 0);
}

@end
