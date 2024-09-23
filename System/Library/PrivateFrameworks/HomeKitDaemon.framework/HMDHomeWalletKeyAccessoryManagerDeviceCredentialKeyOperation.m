@implementation HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation

- (HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation)initWithDeviceCredentialKey:(id)a3 accessoriesUUIDs:(id)a4 user:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *v11;
  uint64_t v12;
  NSData *deviceCredentialKey;
  uint64_t v14;
  NSSet *accessoriesUUIDs;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation;
  v11 = -[HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    deviceCredentialKey = v11->_deviceCredentialKey;
    v11->_deviceCredentialKey = (NSData *)v12;

    v14 = objc_msgSend(v9, "copy");
    accessoriesUUIDs = v11->_accessoriesUUIDs;
    v11->_accessoriesUUIDs = (NSSet *)v14;

    objc_storeWeak((id *)&v11->_user, v10);
  }

  return v11;
}

- (HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation)initWithDeviceCredentialKey:(id)a3 accessories:(id)a4 user:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "uuid", (_QWORD)v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  v18 = -[HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation initWithDeviceCredentialKey:accessoriesUUIDs:user:](self, "initWithDeviceCredentialKey:accessoriesUUIDs:user:", v8, v11, v10);
  return v18;
}

- (id)operationByMergingWithOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *v9;
  void *v10;
  void *v11;
  HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *v12;

  v4 = a3;
  objc_msgSend(v4, "accessoriesUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation accessoriesUUIDs](self, "accessoriesUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  v9 = [HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation alloc];
  objc_msgSend(v4, "deviceCredentialKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation initWithDeviceCredentialKey:accessoriesUUIDs:user:](v9, "initWithDeviceCredentialKey:accessoriesUUIDs:user:", v10, v6, v11);
  return v12;
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
  void *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation deviceCredentialKey](self, "deviceCredentialKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Device Credential Key"), v4);
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation accessoriesUUIDs](self, "accessoriesUUIDs", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Accessories UUIDs"), v7);
  v15[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation user](self, "user");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("User UUID"), v11);
  v15[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSData)deviceCredentialKey
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)accessoriesUUIDs
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (HMDUser)user
{
  return (HMDUser *)objc_loadWeakRetained((id *)&self->_user);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_user);
  objc_storeStrong((id *)&self->_accessoriesUUIDs, 0);
  objc_storeStrong((id *)&self->_deviceCredentialKey, 0);
}

@end
