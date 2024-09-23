@implementation Synchronously

void __Synchronously_block_invoke(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void __Synchronously_ServicingMainRunLoop_block_invoke(uint64_t a1)
{
  _QWORD v1[4];
  __int128 v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 0x40000000;
  v1[2] = __Synchronously_ServicingMainRunLoop_block_invoke_2;
  v1[3] = &unk_1E2919298;
  v2 = *(_OWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v1);
}

void __Synchronously_ServicingMainRunLoop_block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  CFRunLoopSourceSignal((CFRunLoopSourceRef)Synchronously_ServicingMainRunLoop::source);
  CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 40));
}

@end
