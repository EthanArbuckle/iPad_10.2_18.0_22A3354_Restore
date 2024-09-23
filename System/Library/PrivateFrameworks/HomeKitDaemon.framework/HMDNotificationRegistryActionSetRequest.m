@implementation HMDNotificationRegistryActionSetRequest

- (HMDNotificationRegistryActionSetRequest)initWithEnable:(BOOL)a3 user:(id)a4 deviceIdsDestination:(id)a5 actionSetUUID:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDNotificationRegistryActionSetRequest *v14;
  uint64_t v15;
  NSUUID *actionSetUUID;
  HMDNotificationRegistryActionSetRequest *v18;
  SEL v19;
  objc_super v20;

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
    v18 = (HMDNotificationRegistryActionSetRequest *)_HMFPreconditionFailure();
    return (HMDNotificationRegistryActionSetRequest *)-[HMDNotificationRegistryActionSetRequest attributeDescriptions](v18, v19);
  }
  v20.receiver = self;
  v20.super_class = (Class)HMDNotificationRegistryActionSetRequest;
  v14 = -[HMDNotificationRegistryRequest initWithEnable:user:deviceIdsDestination:](&v20, sel_initWithEnable_user_deviceIdsDestination_, v8, v10, v11);
  if (v14)
  {
    v15 = objc_msgSend(v13, "copy");
    actionSetUUID = v14->_actionSetUUID;
    v14->_actionSetUUID = (NSUUID *)v15;

  }
  return v14;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)HMDNotificationRegistryActionSetRequest;
  -[HMDNotificationRegistryRequest attributeDescriptions](&v10, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNotificationRegistryActionSetRequest actionSetUUID](self, "actionSetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("ActionSet UUID"), v5);
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)actionSetUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSetUUID, 0);
}

@end
