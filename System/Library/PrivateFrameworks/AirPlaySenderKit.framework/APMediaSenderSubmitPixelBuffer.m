@implementation APMediaSenderSubmitPixelBuffer

uint64_t __APMediaSenderSubmitPixelBuffer_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  int v3;
  uint64_t result;

  v2 = a1[5];
  if (!*(_BYTE *)(v2 + 182))
  {
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = -6709;
    return APSLogErrorAt();
  }
  if ((*(_BYTE *)(v2 + 168) & 1) == 0)
  {
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = -6705;
    return APSLogErrorAt();
  }
  v3 = *(_DWORD *)(v2 + 176);
  if (v3)
  {
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v3;
    return APSLogErrorAt();
  }
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = APMediaSenderFDVSourceSubmitPixelBuffer(*(_QWORD *)(v2 + 48), a1[6], a1[7]);
  result = *(unsigned int *)(*(_QWORD *)(a1[4] + 8) + 24);
  if ((_DWORD)result)
    return APSLogErrorAt();
  return result;
}

@end
