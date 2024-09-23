@implementation SOSCircleSharedTrustedPeers

const void *__SOSCircleSharedTrustedPeers_block_invoke(uint64_t a1, const void **a2)
{
  const void *result;

  result = (const void *)CFEqual(*(CFTypeRef *)(a1 + 40), a2);
  if (a2 && !(_DWORD)result)
  {
    result = SOSCircleHasPeerWithID(*(_QWORD *)(a1 + 48), a2[5]);
    if ((_DWORD)result)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

@end
