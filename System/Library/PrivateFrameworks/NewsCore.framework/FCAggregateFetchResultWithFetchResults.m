@implementation FCAggregateFetchResultWithFetchResults

uint64_t __FCAggregateFetchResultWithFetchResults_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __FCAggregateFetchResultWithFetchResults_block_invoke_2;
  v4[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
  v4[4] = a2;
  return objc_msgSend(v2, "fc_containsObjectPassingTest:", v4);
}

uint64_t __FCAggregateFetchResultWithFetchResults_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithUnsignedInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToNumber:", v5);

  return v6;
}

@end
