@implementation BonjourAdvertiserSetNANCustomData

uint64_t __BonjourAdvertiserSetNANCustomData_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 48);
  if (v3)
  {
    CFRelease(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v2 + 48) = *(_QWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setCustomData:", *(_QWORD *)(a1 + 40));
}

@end
