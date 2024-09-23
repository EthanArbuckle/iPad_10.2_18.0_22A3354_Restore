@implementation HMZone

uint64_t __39__HMZone_HMUAdditions__hmu_accessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessories");
}

id __39__HMZone_HMUAdditions__hmu_accessories__block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __36__HMZone_HMUAdditions__hmu_homePods__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmu_homePods");
}

id __36__HMZone_HMUAdditions__hmu_homePods__block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __47__HMZone_HMUAdditions__hmu_accessoriesInZones___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmu_accessories");
}

id __47__HMZone_HMUAdditions__hmu_accessoriesInZones___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __55__HMZone_HMUAdditions__hmu_uniqueIdentifiersFromZones___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

uint64_t __41__HMZone_HMUAdditions__hmu_roomsInZones___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rooms");
}

id __41__HMZone_HMUAdditions__hmu_roomsInZones___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

BOOL __55__HMZone_HMUAdditions__hmu_zonesWithHomePodsFromZones___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "hmu_homePods");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

BOOL __66__HMZone_HMUAdditions__hmu_zonesWithAnnounceAccessoriesFromZones___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = (void *)MEMORY[0x24BDD7308];
  objc_msgSend(a2, "hmu_accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmu_announceAccessoriesFromAccessories:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

@end
