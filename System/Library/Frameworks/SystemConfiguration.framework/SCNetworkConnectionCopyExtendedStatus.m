@implementation SCNetworkConnectionCopyExtendedStatus

intptr_t __SCNetworkConnectionCopyExtendedStatus_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _CFXPCCreateCFObjectFromXPCObject();
    ne_session_release();
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  else
  {
    if (__SCNetworkConnectionQueue_once != -1)
      dispatch_once(&__SCNetworkConnectionQueue_once, &__block_literal_global_91_0);
    return ne_session_get_status();
  }
}

intptr_t __SCNetworkConnectionCopyExtendedStatus_block_invoke_2(uint64_t a1, int a2)
{
  const __CFAllocator *v3;
  unsigned int valuePtr;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  if ((a2 - 1) >= 5)
  {
    valuePtr = -1;
  }
  else
  {
    valuePtr = dword_18D3FF438[a2 - 1];
    keys[0] = CFSTR("Status");
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFDictionaryCreate(v3, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFRelease(values);
  }
  ne_session_release();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end
