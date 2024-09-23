@implementation HMHome(HMU_IDS)

- (id)hmu_accessoryWithFromID:()HMU_IDS service:
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
  objc_msgSend(a1, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__HMHome_HMU_IDS__hmu_accessoryWithFromID_service___block_invoke;
  v13[3] = &unk_24D2199D8;
  v14 = v7;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "na_firstObjectPassingTest:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)hmu_userWithFromID:()HMU_IDS
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = (void *)IDSCopyAddressDestinationForDestination();
  objc_msgSend(a1, "hmu_allUsersIncludingCurrentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__HMHome_HMU_IDS__hmu_userWithFromID___block_invoke;
  v7[3] = &unk_24D219878;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "na_firstObjectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hmu_userWithDestination:()HMU_IDS
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "hmu_allUsersIncludingCurrentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__HMHome_HMU_IDS__hmu_userWithDestination___block_invoke;
  v9[3] = &unk_24D219878;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hmu_accessoryWithDestination:()HMU_IDS service:
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
  objc_msgSend(a1, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__HMHome_HMU_IDS__hmu_accessoryWithDestination_service___block_invoke;
  v13[3] = &unk_24D2199D8;
  v14 = v7;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "na_firstObjectPassingTest:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
