@implementation BonjourAdvertiserSetNANControlFlags

uint64_t __BonjourAdvertiserSetNANControlFlags_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v1 + 40) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(v1 + 64), "setControlFlags:", *(unsigned int *)(a1 + 40));
}

@end
