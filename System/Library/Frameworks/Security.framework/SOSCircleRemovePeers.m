@implementation SOSCircleRemovePeers

uint64_t __SOSCircleRemovePeers_block_invoke(uint64_t result, void *cf)
{
  uint64_t v3;
  CFTypeID v4;
  uint64_t v5;
  char v6;

  if (cf)
  {
    v3 = result;
    v4 = CFGetTypeID(cf);
    result = SOSPeerInfoGetTypeID();
    if (v4 == result)
    {
      result = SOSCircleRemovePeerInternal(*(_QWORD *)(v3 + 40), *(_QWORD **)(v3 + 48), (const void **)cf, *(CFTypeRef **)(v3 + 56));
      v5 = *(_QWORD *)(*(_QWORD *)(v3 + 32) + 8);
      if (*(_BYTE *)(v5 + 24))
        v6 = result;
      else
        v6 = 0;
      *(_BYTE *)(v5 + 24) = v6;
    }
  }
  return result;
}

@end
