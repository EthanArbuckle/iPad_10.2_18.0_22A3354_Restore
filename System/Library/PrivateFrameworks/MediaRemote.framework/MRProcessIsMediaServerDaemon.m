@implementation MRProcessIsMediaServerDaemon

void __MRProcessIsMediaServerDaemon_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  MRProcessIsMediaServerDaemon_isMediaServer = objc_msgSend(v1, "isEqualToString:", CFSTR("mediaserverd"));
}

@end
