@implementation HMMTRFeatures

+ (void)enableFeatureiPhoneOnlyPairingControlForTests
{
  void *v2;

  v2 = (void *)isFeatureMatteriPhoneOnlyPairingControlEnabledForTests;
  isFeatureMatteriPhoneOnlyPairingControlEnabledForTests = MEMORY[0x24BDBD1C8];

}

+ (void)unsetFeatureiPhoneOnlyPairingControlForTests
{
  void *v2;

  v2 = (void *)isFeatureMatteriPhoneOnlyPairingControlEnabledForTests;
  isFeatureMatteriPhoneOnlyPairingControlEnabledForTests = 0;

}

+ (void)disableFeatureiPhoneOnlyPairingControlForTests
{
  void *v2;

  v2 = (void *)isFeatureMatteriPhoneOnlyPairingControlEnabledForTests;
  isFeatureMatteriPhoneOnlyPairingControlEnabledForTests = MEMORY[0x24BDBD1C0];

}

@end
