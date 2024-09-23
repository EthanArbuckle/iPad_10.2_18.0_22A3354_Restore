@implementation NSBundle(HLPAdditions)

+ (id)HLPBundle
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)gHLPBundle;
  if (!gHLPBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.helpkit"));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)gHLPBundle;
    gHLPBundle = v1;

    v0 = (void *)gHLPBundle;
  }
  return v0;
}

+ (void)removeHLPBundle
{
  void *v0;

  v0 = (void *)gHLPBundle;
  gHLPBundle = 0;

}

@end
