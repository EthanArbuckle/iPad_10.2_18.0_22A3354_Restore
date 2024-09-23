@implementation MDSimpleQueryDeallocate

uint64_t ___MDSimpleQueryDeallocate_block_invoke(uint64_t a1, uint64_t a2)
{
  const void *v3;
  uint64_t v4;

  v3 = *(const void **)(a2 + 32);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a2 + 32) = 0;
  }
  v4 = *(_QWORD *)(a2 + 16);
  if (v4 && *(_QWORD *)(v4 + 104))
  {
    icu_ctx_release();
    *(_QWORD *)(*(_QWORD *)(a2 + 16) + 104) = 0;
  }
  return a2;
}

@end
