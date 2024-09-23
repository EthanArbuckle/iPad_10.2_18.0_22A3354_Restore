@implementation APMediaSenderEnqueueAudioDataWithTimestamps

uint64_t __APMediaSenderEnqueueAudioDataWithTimestamps_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t result;
  __int128 v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(v2 + 182))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -6709;
    return APSLogErrorAt();
  }
  v3 = *(_QWORD *)(v2 + 56);
  if (!v3)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -6705;
    return APSLogErrorAt();
  }
  v4 = *(_DWORD *)(v2 + 176);
  if (v4)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
    return APSLogErrorAt();
  }
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_BYTE *)(a1 + 88);
  v9 = *(_OWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 80);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = AudioSBufSourceEnqueueAudioDataWithTimestamps(v3, v5, &v9, v6, v7);
  result = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if ((_DWORD)result)
    return APSLogErrorAt();
  return result;
}

@end
