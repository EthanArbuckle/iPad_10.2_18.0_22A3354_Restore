@implementation APMediaSenderEnqueueAudioData

uint64_t __APMediaSenderEnqueueAudioData_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t result;

  v2 = a1[5];
  if (!*(_BYTE *)(v2 + 182))
  {
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = -6709;
    return APSLogErrorAt();
  }
  v3 = *(_QWORD *)(v2 + 56);
  if (!v3)
  {
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = -6705;
    return APSLogErrorAt();
  }
  v4 = *(_DWORD *)(v2 + 176);
  if (v4)
  {
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v4;
    return APSLogErrorAt();
  }
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = AudioSBufSourceEnqueueAudioData(v3, a1[6]);
  result = *(unsigned int *)(*(_QWORD *)(a1[4] + 8) + 24);
  if ((_DWORD)result)
    return APSLogErrorAt();
  return result;
}

@end
