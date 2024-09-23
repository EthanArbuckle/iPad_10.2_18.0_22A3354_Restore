@implementation HAENLocalizationUtilityGetBundle

void __HAENLocalizationUtilityGetBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/HAENotifications.framework"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)HAENLocalizationUtilityGetBundle__haeNotificationFrameworkBundle;
  HAENLocalizationUtilityGetBundle__haeNotificationFrameworkBundle = v0;

}

@end
