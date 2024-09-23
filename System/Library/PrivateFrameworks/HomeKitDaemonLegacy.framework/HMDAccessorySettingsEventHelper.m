@implementation HMDAccessorySettingsEventHelper

- (HMDAccessorySettingsEventHelper)initWithKeyPathMap:(id)a3 keyPathList:(id)a4
{
  id v7;
  id v8;
  HMDAccessorySettingsEventHelper *v9;
  HMDAccessorySettingsEventHelper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDAccessorySettingsEventHelper;
  v9 = -[HMDAccessorySettingsEventHelper init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyPathMap, a3);
    objc_storeStrong((id *)&v10->_keyPaths, a4);
  }

  return v10;
}

- (HMDAccessorySettingsEventHelper)init
{
  void *v3;
  void *v4;
  HMDAccessorySettingsEventHelper *v5;

  +[HMDAccessorySettingEventsGenerated keyPathMap](HMDAccessorySettingEventsGenerated, "keyPathMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAccessorySettingEventsGenerated allKeyPaths](HMDAccessorySettingEventsGenerated, "allKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMDAccessorySettingsEventHelper initWithKeyPathMap:keyPathList:](self, "initWithKeyPathMap:keyPathList:", v3, v4);

  return v5;
}

- (unint64_t)remoteUserAccessControlForTopic:(id)a3
{
  int v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  v4 = HMImmutableSettingChangeEventComponentsFromTopic();
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  if (v4)
    v8 = -[HMDAccessorySettingsEventHelper remoteUserAccessControlForKeyPath:]((uint64_t)self, (uint64_t)v7);

  return v8;
}

- (unint64_t)remoteDeviceAccessControlForTopic:(id)a3
{
  int v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  v4 = HMImmutableSettingChangeEventComponentsFromTopic();
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  if (v4)
    v8 = -[HMDAccessorySettingsEventHelper remoteDeviceAccessControlForKeyPath:]((uint64_t)self, (uint64_t)v7);

  return v8;
}

- (id)allTopicsForHome:(id)a3 accessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (HMDAccessorySettingsEventHelper *)self->_keyPaths;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__HMDAccessorySettingsEventHelper_allTopicsForHome_accessory___block_invoke;
  v13[3] = &unk_1E89C1058;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  -[HMDAccessorySettingsEventHelper na_map:](self, "na_map:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)remoteEventAllowedForKeyPath:(id)a3 deviceType:(unint64_t)a4 userType:(unint64_t)a5
{
  id v8;
  BOOL v9;

  v8 = a3;
  v9 = (-[HMDAccessorySettingsEventHelper remoteUserAccessControlForKeyPath:]((uint64_t)self, (uint64_t)v8) & a5) != 0
    && (-[HMDAccessorySettingsEventHelper remoteDeviceAccessControlForKeyPath:]((uint64_t)self, (uint64_t)v8) & a4) != 0;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPaths, 0);
  objc_storeStrong((id *)&self->_keyPathMap, 0);
}

- (unint64_t)remoteUserAccessControlForKeyPath:(uint64_t)a1
{
  void *v2;
  void *v3;
  unint64_t v4;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("remoteUserAccessControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = +[HMDRemoteEventRouterAccessControl remoteUserAccessControlFromNumber:](HMDRemoteEventRouterAccessControl, "remoteUserAccessControlFromNumber:", v3);
  else
    v4 = 0;

  return v4;
}

- (unint64_t)remoteDeviceAccessControlForKeyPath:(uint64_t)a1
{
  void *v2;
  void *v3;
  unint64_t v4;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("remoteDeviceAccessControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = +[HMDRemoteEventRouterAccessControl remoteDeviceAccessControlFromNumber:](HMDRemoteEventRouterAccessControl, "remoteDeviceAccessControlFromNumber:", v3);
  else
    v4 = 0;

  return v4;
}

void __62__HMDAccessorySettingsEventHelper_allTopicsForHome_accessory___block_invoke()
{
  JUMPOUT(0x1D17B8E58);
}

@end
