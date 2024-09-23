@implementation APCarPlayAnalyticsInitAudioAnomaliesCollection

uint64_t __APCarPlayAnalyticsInitAudioAnomaliesCollection_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  v1 = result;
  v2 = *(_QWORD *)(result + 40);
  v3 = *(unsigned __int8 *)(v2 + 28);
  if (*(_BYTE *)(v2 + 28))
  {
    result = APSLogErrorAt();
    v3 = -6709;
  }
  else
  {
    *(_QWORD *)(v2 + 384) = 0;
    *(_OWORD *)(v2 + 352) = 0u;
    *(_OWORD *)(v2 + 368) = 0u;
    *(_OWORD *)(v2 + 320) = 0u;
    *(_OWORD *)(v2 + 336) = 0u;
    *(_OWORD *)(v2 + 288) = 0u;
    *(_OWORD *)(v2 + 304) = 0u;
    *(_OWORD *)(v2 + 256) = 0u;
    *(_OWORD *)(v2 + 272) = 0u;
    *(_OWORD *)(v2 + 224) = 0u;
    *(_OWORD *)(v2 + 240) = 0u;
    *(_OWORD *)(v2 + 192) = 0u;
    *(_OWORD *)(v2 + 208) = 0u;
    *(_QWORD *)(v2 + 200) = CFSTR("glct");
    *(_QWORD *)(v2 + 232) = CFSTR("lost");
    *(_WORD *)(v2 + 192) = 1;
    *(_QWORD *)(v2 + 264) = CFSTR("late");
    *(_QWORD *)(v2 + 296) = CFSTR("unre");
    *(_DWORD *)(v2 + 224) = 3;
    *(_DWORD *)(v2 + 256) = 3;
    *(_DWORD *)(v2 + 288) = 3;
    *(_DWORD *)(v2 + 320) = 3;
    *(_QWORD *)(v2 + 328) = CFSTR("rtsn");
    *(_DWORD *)(v2 + 352) = 1;
    *(_QWORD *)(v2 + 360) = CFSTR("rtfu");
    *(_DWORD *)(v2 + 384) = 1;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = v3;
  return result;
}

@end
