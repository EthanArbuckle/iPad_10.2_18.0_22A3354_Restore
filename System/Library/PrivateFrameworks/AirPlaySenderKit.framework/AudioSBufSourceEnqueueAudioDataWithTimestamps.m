@implementation AudioSBufSourceEnqueueAudioDataWithTimestamps

uint64_t __AudioSBufSourceEnqueueAudioDataWithTimestamps_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFData *v4;
  uint64_t result;
  CMTime v6;
  CMTime v7;

  v2 = *(_QWORD *)(a1 + 40);
  CMTimeMake(&v7, *(_QWORD *)(a1 + 48), (int)*(double *)(v2 + 32));
  *(CMTime *)(v2 + 112) = v7;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(const __CFData **)(a1 + 56);
  v7 = *(CMTime *)(a1 + 64);
  v6 = *(CMTime *)(v3 + 112);
  result = ausrc_enqueueAudioDataInternal(v3, v4, (__int128 *)&v7.value, &v6);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
