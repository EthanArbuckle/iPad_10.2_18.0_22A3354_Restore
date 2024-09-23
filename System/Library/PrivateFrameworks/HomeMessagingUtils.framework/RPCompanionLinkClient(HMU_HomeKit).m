@implementation RPCompanionLinkClient(HMU_HomeKit)

- (id)hmu_devicesInHome:()HMU_HomeKit
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "activeDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__RPCompanionLinkClient_HMU_HomeKit__hmu_devicesInHome___block_invoke;
  v9[3] = &unk_24D219908;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hmu_devicesForUser:()HMU_HomeKit
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "activeDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__RPCompanionLinkClient_HMU_HomeKit__hmu_devicesForUser___block_invoke;
  v9[3] = &unk_24D219908;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
