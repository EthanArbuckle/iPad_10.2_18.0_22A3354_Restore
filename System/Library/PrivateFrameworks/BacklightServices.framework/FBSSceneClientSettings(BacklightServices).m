@implementation FBSSceneClientSettings(BacklightServices)

- (uint64_t)bls_hasDelegate
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForSetting:", 200000);

  return v2;
}

- (BOOL)bls_supportsAlwaysOn
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "flagForSetting:", 200001);

  return v2 == 1 || v2 == 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)bls_optsOutOfProcessAssertions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForSetting:", 200002);

  return v2;
}

@end
