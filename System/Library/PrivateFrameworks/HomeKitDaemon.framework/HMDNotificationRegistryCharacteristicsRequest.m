@implementation HMDNotificationRegistryCharacteristicsRequest

- (HMDNotificationRegistryCharacteristicsRequest)initWithEnable:(BOOL)a3 user:(id)a4 deviceIdsDestination:(id)a5 accessoryUUID:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDNotificationRegistryCharacteristicsRequest *v14;
  uint64_t v15;
  NSUUID *accessoryUUID;
  uint64_t v17;
  NSMutableSet *characteristicInstanceIDs;
  uint64_t v19;
  NSMutableDictionary *characteristicChangeThresholds;
  HMDNotificationRegistryCharacteristicsRequest *v22;
  SEL v23;
  objc_super v24;

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
    v22 = (HMDNotificationRegistryCharacteristicsRequest *)_HMFPreconditionFailure();
    return (HMDNotificationRegistryCharacteristicsRequest *)-[HMDNotificationRegistryCharacteristicsRequest attributeDescriptions](v22, v23);
  }
  v24.receiver = self;
  v24.super_class = (Class)HMDNotificationRegistryCharacteristicsRequest;
  v14 = -[HMDNotificationRegistryRequest initWithEnable:user:deviceIdsDestination:](&v24, sel_initWithEnable_user_deviceIdsDestination_, v8, v10, v11);
  if (v14)
  {
    v15 = objc_msgSend(v13, "copy");
    accessoryUUID = v14->_accessoryUUID;
    v14->_accessoryUUID = (NSUUID *)v15;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    characteristicInstanceIDs = v14->_characteristicInstanceIDs;
    v14->_characteristicInstanceIDs = (NSMutableSet *)v17;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    characteristicChangeThresholds = v14->_characteristicChangeThresholds;
    v14->_characteristicChangeThresholds = (NSMutableDictionary *)v19;

  }
  return v14;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  objc_super v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)HMDNotificationRegistryCharacteristicsRequest;
  -[HMDNotificationRegistryRequest attributeDescriptions](&v18, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNotificationRegistryCharacteristicsRequest accessoryUUID](self, "accessoryUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Accessory UUID"), v17);
  v19[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNotificationRegistryCharacteristicsRequest characteristicInstanceIDs](self, "characteristicInstanceIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Characteristic IIDs"), v9);
  v19[1] = v10;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNotificationRegistryCharacteristicsRequest characteristicChangeThresholds](self, "characteristicChangeThresholds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Change Threshold"), v12);
  v19[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableSet)characteristicInstanceIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableDictionary)characteristicChangeThresholds
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicChangeThresholds, 0);
  objc_storeStrong((id *)&self->_characteristicInstanceIDs, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

@end
