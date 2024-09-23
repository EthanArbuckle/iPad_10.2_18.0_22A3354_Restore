@implementation APReceiverAudioSessionRealTimeStopPacketProcesser

void __APReceiverAudioSessionRealTimeStopPacketProcesser_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8968);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v1 + 8968));
    dispatch_release(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8968) = 0;
  }
}

void __APReceiverAudioSessionRealTimeStopPacketProcesser_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 9056);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v1 + 9056));
    dispatch_release(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 9056) = 0;
  }
}

void __APReceiverAudioSessionRealTimeStopPacketProcesser_block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8976);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v1 + 8976));
    dispatch_release(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8976) = 0;
  }
}

@end
