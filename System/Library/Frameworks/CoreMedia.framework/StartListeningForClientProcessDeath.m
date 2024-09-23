@implementation StartListeningForClientProcessDeath

uint64_t __figXPC_StartListeningForClientProcessDeath_block_invoke(uint64_t a1)
{
  _QWORD *Value;

  FigSimpleMutexLock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 112));
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 104), (const void *)*(int *)(a1 + 40));
  if (Value && !Value[4])
    figXPC_ForgetProcessInfo(*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 40));
  return FigSimpleMutexUnlock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 112));
}

void __figXPC_StartListeningForClientProcessDeath_block_invoke_2(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

@end
