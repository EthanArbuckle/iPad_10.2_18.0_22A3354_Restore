@implementation AVTCoreDataPersistentStoreConfiguration

+ (id)remoteConfigurationWithEnvironment:(id)a3
{
  id v4;
  AVTAvatarsDaemonClient *v5;
  void *v6;
  AVTAvatarsDaemonClient *v7;
  void *v8;

  v4 = a3;
  v5 = [AVTAvatarsDaemonClient alloc];
  objc_msgSend(v4, "logger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AVTAvatarsDaemonClient initWithLogger:](v5, "initWithLogger:", v6);

  objc_msgSend(a1, "remoteConfigurationWithDaemonClient:environment:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)remoteConfigurationWithDaemonClient:(id)a3 environment:(id)a4
{
  id v5;
  id v6;
  _AVTCoreDataPersistentStoreRemoteConfiguration *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_AVTCoreDataPersistentStoreRemoteConfiguration initWithDaemonClient:environment:]([_AVTCoreDataPersistentStoreRemoteConfiguration alloc], "initWithDaemonClient:environment:", v6, v5);

  return v7;
}

+ (id)localConfigurationWithStoreLocation:(id)a3 environment:(id)a4
{
  id v5;
  id v6;
  _AVTCoreDataPersistentStoreLocalConfiguration *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_AVTCoreDataPersistentStoreLocalConfiguration initWithStoreLocation:copiedAside:environment:]([_AVTCoreDataPersistentStoreLocalConfiguration alloc], "initWithStoreLocation:copiedAside:environment:", v6, 0, v5);

  return v7;
}

+ (id)currentManagedObjectModel
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__AVTCoreDataPersistentStoreConfiguration_currentManagedObjectModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentManagedObjectModel_onceToken != -1)
    dispatch_once(&currentManagedObjectModel_onceToken, block);
  return (id)currentManagedObjectModel__model;
}

void __68__AVTCoreDataPersistentStoreConfiguration_currentManagedObjectModel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "createModel");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)currentManagedObjectModel__model;
  currentManagedObjectModel__model = v1;

}

+ (id)modelV1
{
  id v2;
  id v3;
  objc_class *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBB6B0]);
  v3 = objc_alloc_init(MEMORY[0x24BDBB658]);
  objc_msgSend(v3, "setName:", CFSTR("Avatar"));
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setManagedObjectClassName:", v5);

  v6 = objc_alloc_init(MEMORY[0x24BDBB5E0]);
  objc_msgSend(v6, "setAttributeType:", 1100);
  objc_msgSend(v6, "setName:", CFSTR("identifier"));
  objc_msgSend(v6, "setPreservesValueInHistoryOnDeletion:", 1);
  v7 = objc_alloc_init(MEMORY[0x24BDBB5E0]);
  objc_msgSend(v7, "setAttributeType:", 900);
  objc_msgSend(v7, "setName:", CFSTR("orderDate"));
  v8 = objc_alloc_init(MEMORY[0x24BDBB5E0]);
  objc_msgSend(v8, "setAttributeType:", 1000);
  objc_msgSend(v8, "setName:", CFSTR("avatarData"));
  +[AVTCoreDataCloudKitMirroringConfiguration managedModelAttributesRequiredForMirroring](AVTCoreDataCloudKitMirroringConfiguration, "managedModelAttributesRequiredForMirroring");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = v7;
  v15[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperties:", v11);

  v14 = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntities:", v12);

  return v2;
}

@end
