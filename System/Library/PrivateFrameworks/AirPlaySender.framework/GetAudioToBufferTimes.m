@implementation GetAudioToBufferTimes

__n128 __audioHoseManagerBuffered_GetAudioToBufferTimes_block_invoke(uint64_t a1, uint64_t a2, __n128 *a3)
{
  uint64_t v3;
  __n128 result;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = a3[4];
  *(_QWORD *)(v3 + 40) = a3[5].n128_u64[0];
  *(__n128 *)(v3 + 24) = result;
  return result;
}

__n128 __audioHoseManagerBuffered_GetAudioToBufferTimes_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  __n128 result;
  uint64_t v7;
  CMTime v8;
  CMTime time1;

  if (!*(_BYTE *)(a3 + 8))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    time1 = *(CMTime *)(a3 + 64);
    v8 = *(CMTime *)(v5 + 24);
    if (CMTimeCompare(&time1, &v8) < 0)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      result = *(__n128 *)(a3 + 64);
      *(_QWORD *)(v7 + 40) = *(_QWORD *)(a3 + 80);
      *(__n128 *)(v7 + 24) = result;
    }
  }
  return result;
}

@end
