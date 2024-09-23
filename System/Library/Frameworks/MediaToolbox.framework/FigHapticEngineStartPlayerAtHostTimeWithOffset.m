@implementation FigHapticEngineStartPlayerAtHostTimeWithOffset

uint64_t __FigHapticEngineStartPlayerAtHostTimeWithOffset_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  double Seconds;
  double v6;
  CMTime v7;
  CMTime v8;
  CMTime rhs;
  CMTime lhs;
  CMTime v11;
  id v12;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  *(_OWORD *)&v8.value = *(_OWORD *)(a1 + 56);
  v8.epoch = *(_QWORD *)(a1 + 72);
  *(_OWORD *)&v7.value = *(_OWORD *)(a1 + 80);
  v7.epoch = *(_QWORD *)(a1 + 96);
  v12 = 0;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 96));
  result = figHapticEngineStartOnActivityQueue(v2);
  if (!(_DWORD)result)
  {
    memset(&v11, 0, sizeof(v11));
    lhs = *(CMTime *)(v3 + 16);
    rhs = v7;
    CMTimeAdd(&v11, &lhs, &rhs);
    lhs = v11;
    Seconds = CMTimeGetSeconds(&lhs);
    lhs = v8;
    v6 = CMTimeGetSeconds(&lhs);
    if ((Seconds <= 0.0 || objc_msgSend(*(id *)(v3 + 88), "seekToOffset:error:", &v12, Seconds))
      && (objc_msgSend(*(id *)(v3 + 88), "startAtTime:error:", &v12, v6, *(_OWORD *)&v7.value, v7.epoch) & 1) != 0)
    {
      result = 0;
    }
    else
    {
      objc_msgSend(v12, "code", *(_OWORD *)&v7.value, v7.epoch);
      result = FigSignalErrorAt();
    }
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
