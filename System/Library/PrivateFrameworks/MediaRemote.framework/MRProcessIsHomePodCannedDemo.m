@implementation MRProcessIsHomePodCannedDemo

void __MRProcessIsHomePodCannedDemo_block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v0, "processName");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v0) = objc_msgSend(v1, "containsString:", CFSTR("HomePodCannedDemo"));
  MRProcessIsHomePodCannedDemo_isChannelDemo = v0 | objc_msgSend(v1, "containsString:", CFSTR("ChannelDemoCap"));

}

@end
