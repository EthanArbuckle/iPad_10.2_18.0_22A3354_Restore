@implementation HMDNotificationRegistryCharacteristicsRequest

- (HMDNotificationRegistryCharacteristicsRequest)initWithEnable:(BOOL)a3 userID:(id)a4 accessoryUUID:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  HMDNotificationRegistryCharacteristicsRequest *v11;
  uint64_t v12;
  NSUUID *accessoryUUID;
  uint64_t v14;
  NSMutableSet *characteristicInstanceIDs;
  HMDNotificationRegistryCharacteristicsRequest *v17;
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
    v17 = (HMDNotificationRegistryCharacteristicsRequest *)_HMFPreconditionFailure();
    return (HMDNotificationRegistryCharacteristicsRequest *)-[HMDNotificationRegistryCharacteristicsRequest attributeDescriptions](v17, v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDNotificationRegistryCharacteristicsRequest;
  v11 = -[HMDNotificationRegistryRequest initWithEnable:userID:](&v19, sel_initWithEnable_userID_, v6, v8);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    accessoryUUID = v11->_accessoryUUID;
    v11->_accessoryUUID = (NSUUID *)v12;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    characteristicInstanceIDs = v11->_characteristicInstanceIDs;
    v11->_characteristicInstanceIDs = (NSMutableSet *)v14;

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
  v15.super_class = (Class)HMDNotificationRegistryCharacteristicsRequest;
  -[HMDNotificationRegistryRequest attributeDescriptions](&v15, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNotificationRegistryCharacteristicsRequest accessoryUUID](self, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Accessory UUID"), v5);
  v16[0] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNotificationRegistryCharacteristicsRequest characteristicInstanceIDs](self, "characteristicInstanceIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Characteristic IIDs"), v10);
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableSet)characteristicInstanceIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicInstanceIDs, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

@end
