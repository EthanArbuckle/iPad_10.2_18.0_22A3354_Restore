@implementation MRMediaRemoteCurrentApplicationIsAirPlayReceiver

void __MRMediaRemoteCurrentApplicationIsAirPlayReceiver_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  MRMediaRemoteCurrentApplicationIsAirPlayReceiver_isAirPlayReceiver = MRMediaRemoteApplicationIsAirPlayReceiver((uint64_t)v1);

}

@end
