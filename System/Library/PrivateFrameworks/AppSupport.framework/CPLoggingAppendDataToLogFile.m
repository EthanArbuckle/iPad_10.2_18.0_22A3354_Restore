@implementation CPLoggingAppendDataToLogFile

uint64_t __CPLoggingAppendDataToLogFile_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __CPLoggingAppendDataToLogFile_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __CPLoggingAppendDataToLogFile_block_invoke_3(uint64_t a1)
{
  const void *v2;
  _QWORD block[5];

  _workQueueAppendDataToLogFile(*(_QWORD *)(a1 + 40), *(const __CFData **)(a1 + 48));
  free(*(void **)(a1 + 40));
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
  if (*(_QWORD *)(a1 + 32))
  {
    if (_callbackQueue_onceToken != -1)
      dispatch_once(&_callbackQueue_onceToken, &__block_literal_global_108);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __CPLoggingAppendDataToLogFile_block_invoke_4;
    block[3] = &unk_1E2881F10;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)_callbackQueue_queue, block);
  }
}

void __CPLoggingAppendDataToLogFile_block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
}

@end
