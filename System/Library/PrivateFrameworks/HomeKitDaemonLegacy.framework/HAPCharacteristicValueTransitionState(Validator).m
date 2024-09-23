@implementation HAPCharacteristicValueTransitionState(Validator)

- (uint64_t)isValid
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "activeTransitionContexts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  objc_msgSend(a1, "activeTransitionContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_allObjectsPassTest:", &__block_literal_global_150276);

  return v4;
}

@end
