@implementation BonjourAdvertiserSetNANInterruptionHandler

uint64_t __BonjourAdvertiserSetNANInterruptionHandler_block_invoke(uint64_t a1)
{
  const void *v2;
  void *v3;
  uint64_t v4;
  const void *v5;

  v2 = *(const void **)(a1 + 32);
  if (v2)
    v3 = _Block_copy(v2);
  else
    v3 = 0;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(const void **)(v4 + 56);
  if (v5)
  {
    _Block_release(v5);
    v4 = *(_QWORD *)(a1 + 40);
  }
  *(_QWORD *)(v4 + 56) = v3;
  return objc_msgSend(*(id *)(v4 + 64), "setInterruptionHandler:", v3);
}

@end
