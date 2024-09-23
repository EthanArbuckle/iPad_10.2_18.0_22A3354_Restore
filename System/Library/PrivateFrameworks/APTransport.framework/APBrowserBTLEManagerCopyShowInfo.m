@implementation APBrowserBTLEManagerCopyShowInfo

uint64_t __APBrowserBTLEManagerCopyShowInfo_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "copyShowInfo:verbose:", *(_QWORD *)(a1 + 48), *(_DWORD *)(a1 + 56) != 0);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
