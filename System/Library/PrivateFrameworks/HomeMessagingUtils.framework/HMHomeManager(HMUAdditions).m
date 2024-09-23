@implementation HMHomeManager(HMUAdditions)

- (id)hmu_homeWithUniqueIdentifier:()HMUAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__HMHomeManager_HMUAdditions__hmu_homeWithUniqueIdentifier___block_invoke;
  v9[3] = &unk_24D2197E0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hmu_homeWithName:()HMUAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__HMHomeManager_HMUAdditions__hmu_homeWithName___block_invoke;
  v9[3] = &unk_24D2197E0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hmu_homesContainingRoomsWithNames:()HMUAdditions
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1, "homes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __65__HMHomeManager_HMUAdditions__hmu_homesContainingRoomsWithNames___block_invoke;
    v8[3] = &unk_24D2197E0;
    v9 = v4;
    objc_msgSend(v5, "na_filter:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v6;
}

- (id)hmu_homesContainingZonesWithNames:()HMUAdditions
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1, "homes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __65__HMHomeManager_HMUAdditions__hmu_homesContainingZonesWithNames___block_invoke;
    v8[3] = &unk_24D2197E0;
    v9 = v4;
    objc_msgSend(v5, "na_filter:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v6;
}

- (id)hmu_homesWithHomeLocationStatus:()HMUAdditions
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a1, "homes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__HMHomeManager_HMUAdditions__hmu_homesWithHomeLocationStatus___block_invoke;
  v7[3] = &__block_descriptor_40_e16_B16__0__HMHome_8l;
  v7[4] = a3;
  objc_msgSend(v4, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
