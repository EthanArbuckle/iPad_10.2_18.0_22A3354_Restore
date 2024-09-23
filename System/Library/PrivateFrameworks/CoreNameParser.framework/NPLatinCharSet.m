@implementation NPLatinCharSet

void ___NPLatinCharSet_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;

  charSetWithEndpoints(6, a2, a3, a4, a5, a6, a7, a8, 65);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)_NPLatinCharSet_result;
  _NPLatinCharSet_result = v8;

}

@end
