@implementation AudioSBufSourceEnqueueAudioData

uint64_t __AudioSBufSourceEnqueueAudioData_block_invoke(uint64_t a1)
{
  CFIndex Length;
  uint64_t v3;
  OpaqueCMClock *HostTimeClock;
  uint64_t v5;
  const __CFData *v6;
  uint64_t result;
  CMTime v8;
  CMTime lhs;
  CMTime rhs;
  CMTime v11;

  Length = CFDataGetLength(*(CFDataRef *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  CMTimeMake(&rhs, Length / *(unsigned int *)(v3 + 48), (int)*(double *)(v3 + 32));
  lhs = *(CMTime *)(v3 + 112);
  CMTimeAdd(&v11, &lhs, &rhs);
  *(CMTime *)(v3 + 112) = v11;
  memset(&v11, 0, sizeof(v11));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v11, HostTimeClock);
  v6 = *(const __CFData **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  lhs = v11;
  v8 = *(CMTime *)(v5 + 112);
  result = ausrc_enqueueAudioDataInternal(v5, v6, (__int128 *)&lhs.value, &v8);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
