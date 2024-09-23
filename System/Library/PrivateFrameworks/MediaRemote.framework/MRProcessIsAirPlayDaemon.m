@implementation MRProcessIsAirPlayDaemon

void __MRProcessIsAirPlayDaemon_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  v1 = (void *)MRMediaRemoteCopyLocalDeviceAirPlayReceiverDisplayID();
  MRProcessIsAirPlayDaemon_isDaemon = objc_msgSend(v2, "isEqualToString:", v1);

}

@end
