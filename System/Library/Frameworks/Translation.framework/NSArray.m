@implementation NSArray

void __44__NSArray_LTArrayExtensions___ltCompactMap___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
    v2 = v3;
  }

}

uint64_t __56__NSArray_LTArrayExtensions__lt_firstObjectPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

BOOL __51__NSArray_LTArrayExtensions__lt_ensureElementType___block_invoke()
{
  return (objc_opt_isKindOfClass() & 1) == 0;
}

@end
