@implementation CKPrewarmResumeDeferredSetup

id __CKPrewarmResumeDeferredSetup_block_invoke()
{
  CEMStringIsSingleEmoji();
  return (id)objc_msgSend(MEMORY[0x1E0D35938], "sharedInstance");
}

void __CKPrewarmResumeDeferredSetup_block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v0 = +[CKPluginExtensionStateObserver sharedInstance](CKPluginExtensionStateObserver, "sharedInstance");
  if ((IMSharedHelperDeviceIsiPad() & 1) == 0)
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
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "balloonPluginForBundleID:", *MEMORY[0x1E0D375D0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bubbleClass");

  }
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_642);
}

void __CKPrewarmResumeDeferredSetup_block_invoke_3()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("com.apple.messages.CKPluginPrewarmForLaunchCompleteNotification"), 0);

}

void __CKPrewarmResumeDeferredSetup_block_invoke_4()
{
  id v0;

  IMSharedDowntimeController();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerForScreenTimeNotifications");

}

@end
