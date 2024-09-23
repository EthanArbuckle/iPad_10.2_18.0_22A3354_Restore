@implementation HMDFeatures

+ (void)enableFeatureHomeTheaterQFAForTests
{
  void *v2;

  v2 = (void *)isFeatureHomeTheaterQFAEnabledForTests;
  isFeatureHomeTheaterQFAEnabledForTests = MEMORY[0x1E0C9AAB0];

}

+ (void)disableFeatureHomeTheaterQFAForTests
{
  void *v2;

  v2 = (void *)isFeatureHomeTheaterQFAEnabledForTests;
  isFeatureHomeTheaterQFAEnabledForTests = MEMORY[0x1E0C9AAA0];

}

+ (void)unsetFeatureHomeTheaterQFAForTests
{
  void *v2;

  v2 = (void *)isFeatureHomeTheaterQFAEnabledForTests;
  isFeatureHomeTheaterQFAEnabledForTests = 0;

}

@end
