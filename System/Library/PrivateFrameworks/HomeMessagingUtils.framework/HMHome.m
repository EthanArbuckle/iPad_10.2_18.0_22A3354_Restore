@implementation HMHome

uint64_t __53__HMHome_HMUAdditions__hmu_userWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __64__HMHome_HMUAdditions__hmu_userWithSenderCorrelationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "senderCorrelationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

BOOL __66__HMHome_HMUAdditions__hmu_homesFromHomes_withHomeLocationStatus___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "homeLocationStatus") == *(_QWORD *)(a1 + 32);
}

uint64_t __53__HMHome_HMUAdditions__hmu_roomWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __55__HMHome_HMUAdditions__hmu_roomsWithUniqueIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __41__HMHome_HMUAdditions__hmu_roomWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __53__HMHome_HMUAdditions__hmu_zoneWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __55__HMHome_HMUAdditions__hmu_zonesWithUniqueIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __41__HMHome_HMUAdditions__hmu_zoneWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __47__HMHome_HMUAdditions__hmu_endpointAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmu_isEndpoint");
}

uint64_t __51__HMHome_HMU_IDS__hmu_accessoryWithFromID_service___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a2, "hmu_destinationForService:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destinationURIs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__HMHome_HMU_IDS__hmu_accessoryWithFromID_service___block_invoke_2;
  v7[3] = &unk_24D2199B0;
  v8 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "na_any:", v7);

  return v5;
}

uint64_t __51__HMHome_HMU_IDS__hmu_accessoryWithFromID_service___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

uint64_t __38__HMHome_HMU_IDS__hmu_userWithFromID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a2, "userIDSURI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destinationURIs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__HMHome_HMU_IDS__hmu_userWithFromID___block_invoke_2;
  v7[3] = &unk_24D2199B0;
  v8 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "na_any:", v7);

  return v5;
}

uint64_t __38__HMHome_HMU_IDS__hmu_userWithFromID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

uint64_t __43__HMHome_HMU_IDS__hmu_userWithDestination___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "destinationURIs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userIDSURI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "destinationURIs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "intersectsSet:", v6);

  return v7;
}

uint64_t __56__HMHome_HMU_IDS__hmu_accessoryWithDestination_service___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "hmu_destinationForService:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destinationURIs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "destinationURIs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "intersectsSet:", v5);

  return v6;
}

@end
