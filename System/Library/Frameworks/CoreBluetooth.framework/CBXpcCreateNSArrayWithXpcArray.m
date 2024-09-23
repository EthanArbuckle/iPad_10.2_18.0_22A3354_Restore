@implementation CBXpcCreateNSArrayWithXpcArray

uint64_t __CBXpcCreateNSArrayWithXpcArray_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  CBXpcCreateNSObjectWithXpcObject(a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 8 * a2);
  *(_QWORD *)(v6 + 8 * a2) = v5;

  return 1;
}

@end
