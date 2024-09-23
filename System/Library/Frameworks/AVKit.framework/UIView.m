@implementation UIView

- (uint64_t)_getExtendedDynamicRangeGainFilterIndex
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  if (!a1)
    return 0;
  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "filters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v1, "filters");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_7383);

  }
  else
  {
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

uint64_t __62__UIView_AVAdditions___getExtendedDynamicRangeGainFilterIndex__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("AVExtendedDynamicRangeGain.filter"));

  return v3;
}

@end
