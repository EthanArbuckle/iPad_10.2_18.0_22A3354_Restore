@implementation ASWorkoutDictionaryByIndex

uint64_t __ASWorkoutDictionaryByIndex_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ASCacheIndexForLocalDate(v2);

  return v3;
}

@end
