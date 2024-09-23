@implementation AVTCoreDataCloudKitMirroringConfiguration

+ (BOOL)manateeContainer:(id)a3
{
  return objc_msgSend(a3, "isEqual:", CFSTR("com.apple.Avatars"));
}

+ (id)currentContainerIdentifier
{
  if (AVTUIUseTestCloudKitContainer())
    return CFSTR("iCloud.com.apple.AvatarUI.Staryu");
  else
    return CFSTR("com.apple.Avatars");
}

+ (void)deviceConfigurationSupportsCloudKitMirroringWithLogger:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __118__AVTCoreDataCloudKitMirroringConfiguration_deviceConfigurationSupportsCloudKitMirroringWithLogger_completionHandler___block_invoke;
  v10[3] = &unk_24DD33078;
  v12 = v7;
  v13 = a1;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v9, "checkingAccountInfo:", v10);

}

void __118__AVTCoreDataCloudKitMirroringConfiguration_deviceConfigurationSupportsCloudKitMirroringWithLogger_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(a1[6], "currentContainerIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB9030], "containerWithIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __118__AVTCoreDataCloudKitMirroringConfiguration_deviceConfigurationSupportsCloudKitMirroringWithLogger_completionHandler___block_invoke_2;
  v7[3] = &unk_24DD33050;
  v8 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v10 = v4;
  v11 = v5;
  v9 = v2;
  v6 = v2;
  objc_msgSend(v3, "accountInfoWithCompletionHandler:", v7);

}

void __118__AVTCoreDataCloudKitMirroringConfiguration_deviceConfigurationSupportsCloudKitMirroringWithLogger_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v12)
  {
    objc_msgSend(v12, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logAccountInfo:status:deviceToDeviceEncryption:", v7, objc_msgSend(v12, "accountStatus"), objc_msgSend(v12, "supportsDeviceToDeviceEncryption"));

    if (objc_msgSend(*(id *)(a1 + 56), "manateeContainer:", *(_QWORD *)(a1 + 40)))
    {
      if ((objc_msgSend(v12, "supportsDeviceToDeviceEncryption") & 1) == 0)
      {
LABEL_4:
        v8 = 0;
LABEL_8:
        v10 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v11, 0);

        goto LABEL_9;
      }
    }
    else if (objc_msgSend(v12, "accountStatus") != 1)
    {
      goto LABEL_4;
    }
    v8 = 1;
    goto LABEL_8;
  }
  objc_msgSend(v5, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logErrorGettingAccountInfo:", v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_9:

}

+ (void)configureStoreDescriptionForMirroring:(id)a3 logger:(id)a4
{
  id v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(a1, "currentContainerIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "manateeContainer:", v11);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB608]), "initWithContainerIdentifier:", v11);
  v8 = objc_alloc_init(MEMORY[0x24BDB9048]);
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "setUseZoneWidePCS:", 1);
    objc_msgSend(v7, "setUseDeviceToDeviceEncryption:", 1);
  }
  objc_msgSend(v7, "setContainerOptions:", v9);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB600]), "initWithOptions:", v7);
  objc_msgSend(v5, "setMirroringDelegate:", v10);

}

+ (id)createMirroringHandlerWithEnvironment:(id)a3
{
  id v3;
  AVTCoreDataCloudKitMirroringHandler *v4;
  void *v5;
  void *v6;
  AVTDisabledMirroringHandler *v7;

  v3 = a3;
  if (AVTUIIsAvatarSyncEnabled())
  {
    v4 = [AVTCoreDataCloudKitMirroringHandler alloc];
    objc_msgSend(v3, "logger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AVTCoreDataCloudKitMirroringHandler initWithLogger:blockScheduler:](v4, "initWithLogger:blockScheduler:", v5, v6);

  }
  else
  {
    v7 = objc_alloc_init(AVTDisabledMirroringHandler);
  }

  return v7;
}

+ (id)managedModelAttributesRequiredForMirroring
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBB5E0]);
  objc_msgSend(v2, "setName:", *MEMORY[0x24BDBB3D0]);
  objc_msgSend(v2, "setAttributeType:", 700);
  objc_msgSend(v2, "setPreservesValueInHistoryOnDeletion:", 1);
  v3 = objc_alloc_init(MEMORY[0x24BDBB5E0]);
  objc_msgSend(v3, "setName:", *MEMORY[0x24BDBB3D8]);
  objc_msgSend(v3, "setAttributeType:", 1000);
  objc_msgSend(v3, "setPreservesValueInHistoryOnDeletion:", 1);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)configureMirroringRequestOptions:(id)a3
{
  objc_msgSend(a1, "configureMirroringRequestOptions:discretionary:", a3, 1);
}

+ (void)configureMirroringRequestOptions:(id)a3 discretionary:(BOOL)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDB9188]);
  objc_msgSend(v5, "setApplicationBundleIdentifierOverrideForNetworkAttribution:", CFSTR("com.apple.Memoji"));
  if (!a4)
    objc_msgSend(v5, "setDiscretionaryNetworkBehavior:", 0);
  objc_msgSend(v6, "setOperationConfiguration:", v5);

}

@end
