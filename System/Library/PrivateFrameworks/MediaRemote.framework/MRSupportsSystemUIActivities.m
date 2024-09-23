@implementation MRSupportsSystemUIActivities

void __MRSupportsSystemUIActivities_block_invoke()
{
  void *v0;
  uint64_t (**v1)(void);

  if (MRProcessIsMediaRemoteDaemon())
  {
    v1 = (uint64_t (**)(void))MEMORY[0x194036C44](MRSupportsSystemUIActivitiesBlock);
    if (v1)
      MRSupportsSystemUIActivities___supportsSystemUIActivities = v1[2]();
    v0 = (void *)MRSupportsSystemUIActivitiesBlock;
    MRSupportsSystemUIActivitiesBlock = 0;

  }
  else
  {
    MRGetSharedService();
    v1 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    MRSupportsSystemUIActivities___supportsSystemUIActivities = objc_msgSend(v1, "deviceSupportsUISessions");
  }

}

@end
