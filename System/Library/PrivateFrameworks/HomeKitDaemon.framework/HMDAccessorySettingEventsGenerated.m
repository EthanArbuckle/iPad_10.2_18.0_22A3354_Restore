@implementation HMDAccessorySettingEventsGenerated

+ (id)keyPathMap
{
  return &unk_24E9719D8;
}

+ (id)allKeyPaths
{
  return &unk_24E970B50;
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
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__HMDAccessorySettingEventsGenerated_topicsForAccessoryUUID_homeUUID___block_invoke;
  v11[3] = &unk_24E78F378;
  v12 = v6;
  v13 = v5;
  v7 = v5;
  v8 = v6;
  objc_msgSend(&unk_24E970B68, "na_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __70__HMDAccessorySettingEventsGenerated_topicsForAccessoryUUID_homeUUID___block_invoke()
{
  JUMPOUT(0x2276752E8);
}

@end
