@implementation SOSCircleCopyPeerInfo

uint64_t __SOSCircleCopyPeerInfo_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  const void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v3 = result;
    if (a2)
      v4 = *(const void **)(a2 + 40);
    else
      v4 = 0;
    result = CFEqual(v4, *(CFTypeRef *)(v3 + 40));
    if ((_DWORD)result)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = a2;
  }
  return result;
}

@end
