@implementation CKPrewarmBalloonPluginManagerForLaunch

void __CKPrewarmBalloonPluginManagerForLaunch_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v0 = (id)objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  if (IMSharedHelperDeviceIsiPad())
  {
    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "balloonPluginForBundleID:", *MEMORY[0x1E0D375F8]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bubbleClass");

    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "balloonPluginForBundleID:", *MEMORY[0x1E0D375E0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bubbleClass");

    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "balloonPluginForBundleID:", *MEMORY[0x1E0D375D0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bubbleClass");

  }
}

@end
