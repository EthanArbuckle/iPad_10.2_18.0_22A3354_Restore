@implementation NSSet

uint64_t __42__NSSet_HFDebugging__hf_prettyDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_prettyDescription");
}

uint64_t __51__NSSet_HFDebugging__hf_prettyExpensiveDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_prettyExpensiveDescription");
}

uint64_t __46__NSSet_HFDebugging__hf_prettyFullDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_prettyFullDescription");
}

uint64_t __57__NSSet_HFMediaProfileContainer__hf_appleTVMediaProfiles__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_404);

  return v3;
}

uint64_t __57__NSSet_HFMediaProfileContainer__hf_appleTVMediaProfiles__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isAppleTV");
}

uint64_t __57__NSSet_HFMediaProfileContainer__hf_homePodMediaProfiles__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_406);

  return v3;
}

uint64_t __57__NSSet_HFMediaProfileContainer__hf_homePodMediaProfiles__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isHomePod");
}

@end
