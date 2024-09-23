@implementation SOSPeerInfoSetContainsIdenticalPeers

const void *__SOSPeerInfoSetContainsIdenticalPeers_block_invoke(uint64_t a1, const void *a2)
{
  const void *result;
  BOOL v5;
  uint64_t v6;

  result = CFSetGetValue(*(CFSetRef *)(a1 + 40), a2);
  if (a2 && result)
  {
    result = (const void *)CFEqual(a2, result);
    v5 = (_DWORD)result != 0;
  }
  else
  {
    v5 = result == a2;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_BYTE *)(v6 + 24))
    v5 = 0;
  *(_BYTE *)(v6 + 24) = v5;
  return result;
}

@end
