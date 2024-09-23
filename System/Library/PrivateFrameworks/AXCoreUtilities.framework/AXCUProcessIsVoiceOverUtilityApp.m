@implementation AXCUProcessIsVoiceOverUtilityApp

void __AXCUProcessIsVoiceOverUtilityApp_block_invoke()
{
  void *v0;
  int v1;

  AXCUApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.VoiceOverUtility"));

  if (v1)
    AXCUProcessIsVoiceOverUtilityApp__IsVoiceOverUtility = 1;
}

@end
