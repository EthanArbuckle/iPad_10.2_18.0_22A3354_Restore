@implementation APMediaSenderSetDisplayInfoUpdateBlock

uint64_t __APMediaSenderSetDisplayInfoUpdateBlock_block_invoke(uint64_t *a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = a1[6];
  if (*(_BYTE *)(v2 + 182))
  {
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = -6709;
    return APSLogErrorAt();
  }
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = APMediaSenderFDVSourceSetDisplayInfoBlock(*(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 24), a1[4]);
  result = *(unsigned int *)(*(_QWORD *)(a1[5] + 8) + 24);
  if ((_DWORD)result)
    return APSLogErrorAt();
  return result;
}

@end
