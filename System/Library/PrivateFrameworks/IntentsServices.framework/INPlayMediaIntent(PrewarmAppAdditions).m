@implementation INPlayMediaIntent(PrewarmAppAdditions)

- (uint64_t)ins_shouldPrewarmApp
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "privatePlayMediaIntentData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "internalSignals");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("PrewarmApp"));

  return v3;
}

@end
