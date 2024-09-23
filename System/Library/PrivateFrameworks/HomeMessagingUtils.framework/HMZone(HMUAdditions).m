@implementation HMZone(HMUAdditions)

- (id)hmu_accessories
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "rooms");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_map:", &__block_literal_global_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hmu_homePods
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "rooms");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_map:", &__block_literal_global_3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)hmu_accessoriesInZones:()HMUAdditions
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "na_map:", &__block_literal_global_6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_flatMap:", &__block_literal_global_7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (uint64_t)hmu_uniqueIdentifiersFromZones:()HMUAdditions
{
  return objc_msgSend(a3, "na_map:", &__block_literal_global_8);
}

+ (id)hmu_roomsInZones:()HMUAdditions
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "na_map:", &__block_literal_global_9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_flatMap:", &__block_literal_global_10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hmu_roomsInZones:()HMUAdditions appendingRooms:
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDBCEF0];
  v6 = (void *)MEMORY[0x24BDD7AC8];
  v7 = a4;
  objc_msgSend(v6, "hmu_roomsInZones:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObjectsFromArray:", v7);
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (uint64_t)hmu_zonesWithHomePodsFromZones:()HMUAdditions
{
  return objc_msgSend(a3, "na_filter:", &__block_literal_global_13);
}

+ (uint64_t)hmu_zonesWithAnnounceAccessoriesFromZones:()HMUAdditions
{
  return objc_msgSend(a3, "na_filter:", &__block_literal_global_14);
}

@end
