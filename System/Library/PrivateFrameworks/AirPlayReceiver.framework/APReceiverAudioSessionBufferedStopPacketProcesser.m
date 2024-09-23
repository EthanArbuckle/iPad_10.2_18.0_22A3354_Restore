@implementation APReceiverAudioSessionBufferedStopPacketProcesser

void __APReceiverAudioSessionBufferedStopPacketProcesser_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 1216);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v1 + 1216));
    dispatch_release(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1216) = 0;
  }
}

void __APReceiverAudioSessionBufferedStopPacketProcesser_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 1232);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v1 + 1232));
    dispatch_release(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1232) = 0;
  }
}

@end
