@implementation APReceiverAudioSessionPlatformControl

void __APReceiverAudioSessionPlatformControl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 184);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v1 + 184));
    dispatch_release(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) = 0;
  }
}

void __APReceiverAudioSessionPlatformControl_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 184);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v1 + 184));
    dispatch_release(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) = 0;
  }
}

@end
