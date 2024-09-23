@implementation NSArray

void __34__NSArray_CPLCopying__cplDeepCopy__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend(a2, "cplDeepCopy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 8 * a3);
  *(_QWORD *)(v6 + 8 * a3) = v5;

}

@end
