@implementation NSString(FPDPushConnection)

- (uint64_t)fp_isCloudDocsPushTopic
{
  void *v2;
  uint64_t v3;

  objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", CFSTR("clouddocs."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "hasPrefix:", v2);

  return v3;
}

- (uint64_t)fp_isTestPushTopic
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("com.apple.TestingHarness"));
}

@end
