@implementation HMHome

uint64_t __45__HMHome_MediaSetup__hasAccessoryTypeHomePod__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isHomePod");
  if ((_DWORD)result)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

@end
