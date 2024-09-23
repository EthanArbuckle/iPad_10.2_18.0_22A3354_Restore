@implementation HMDFeatures

+ (void)enableFeatureHomeTheaterQFAForTests
{
  void *v2;

  v2 = (void *)isFeatureHomeTheaterQFAEnabledForTests;
  isFeatureHomeTheaterQFAEnabledForTests = MEMORY[0x24BDBD1C8];

}

+ (void)disableFeatureHomeTheaterQFAForTests
{
  void *v2;

  v2 = (void *)isFeatureHomeTheaterQFAEnabledForTests;
  isFeatureHomeTheaterQFAEnabledForTests = MEMORY[0x24BDBD1C0];

}

+ (void)unsetFeatureHomeTheaterQFAForTests
{
  void *v2;

  v2 = (void *)isFeatureHomeTheaterQFAEnabledForTests;
  isFeatureHomeTheaterQFAEnabledForTests = 0;

}

@end
