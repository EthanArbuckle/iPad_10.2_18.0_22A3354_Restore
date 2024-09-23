@implementation HMRoom

uint64_t __36__HMRoom_HMUAdditions__hmu_homePods__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmu_isHomePod");
}

uint64_t __47__HMRoom_HMUAdditions__hmu_accessoriesInRooms___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessories");
}

id __47__HMRoom_HMUAdditions__hmu_accessoriesInRooms___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __55__HMRoom_HMUAdditions__hmu_uniqueIdentifiersFromRooms___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

BOOL __55__HMRoom_HMUAdditions__hmu_roomsWithHomePodsFromRooms___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "hmu_homePods");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

BOOL __66__HMRoom_HMUAdditions__hmu_roomsWithAnnounceAccessoriesFromRooms___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = (void *)MEMORY[0x24BDD7308];
  objc_msgSend(a2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmu_announceAccessoriesFromAccessories:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

@end
