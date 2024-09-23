@implementation HMDAccessorySettingEventsGenerated

+ (id)keyPathMap
{
  return &unk_1E8B35B38;
}

+ (id)allKeyPaths
{
  return &unk_1E8B31DB8;
}

+ (id)topicsForAccessoryUUID:(id)a3 homeUUID:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__HMDAccessorySettingEventsGenerated_topicsForAccessoryUUID_homeUUID___block_invoke;
  v11[3] = &unk_1E89B79A0;
  v12 = v6;
  v13 = v5;
  v7 = v5;
  v8 = v6;
  objc_msgSend(&unk_1E8B31DD0, "na_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __70__HMDAccessorySettingEventsGenerated_topicsForAccessoryUUID_homeUUID___block_invoke()
{
  JUMPOUT(0x1D17B8E58);
}

@end
