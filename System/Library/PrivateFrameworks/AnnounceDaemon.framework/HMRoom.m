@implementation HMRoom

BOOL __61__HMRoom_Announce__an_roomsWithAnnounceAccessoriesFromRooms___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = (void *)MEMORY[0x1E0CBA1A8];
  objc_msgSend(a2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "announceAccessoriesFromAccessories:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

@end
