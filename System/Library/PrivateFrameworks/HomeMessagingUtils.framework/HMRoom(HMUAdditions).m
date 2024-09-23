@implementation HMRoom(HMUAdditions)

- (id)hmu_homePods
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hmu_accessoriesInRooms:()HMUAdditions
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "na_map:", &__block_literal_global_2_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_flatMap:", &__block_literal_global_4_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (uint64_t)hmu_uniqueIdentifiersFromRooms:()HMUAdditions
{
  return objc_msgSend(a3, "na_map:", &__block_literal_global_5);
}

+ (uint64_t)hmu_roomsWithHomePodsFromRooms:()HMUAdditions
{
  return objc_msgSend(a3, "na_filter:", &__block_literal_global_7_0);
}

+ (uint64_t)hmu_roomsWithAnnounceAccessoriesFromRooms:()HMUAdditions
{
  return objc_msgSend(a3, "na_filter:", &__block_literal_global_8_0);
}

@end
