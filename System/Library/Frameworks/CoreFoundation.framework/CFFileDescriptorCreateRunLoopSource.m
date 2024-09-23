@implementation CFFileDescriptorCreateRunLoopSource

_QWORD *__CFFileDescriptorCreateRunLoopSource_block_invoke(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  __CFRunLoopSource *v3;
  int IsValid;
  uint64_t v5;
  __CFRunLoopSource *v6;
  CFRunLoopSourceContext context;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = result[5];
  if (!*(_DWORD *)(v1 + 16))
  {
    v2 = result;
    v3 = *(__CFRunLoopSource **)(v1 + 56);
    if (v3)
    {
      IsValid = CFRunLoopSourceIsValid(v3);
      v1 = v2[5];
      if (!IsValid)
      {
        CFRelease(*(CFTypeRef *)(v1 + 56));
        *(_QWORD *)(v2[5] + 56) = 0;
        v1 = v2[5];
      }
    }
    result = *(_QWORD **)(v1 + 56);
    if (result)
      goto LABEL_12;
    context.version = 0;
    context.info = (void *)v1;
    context.retain = CFRetain;
    context.release = CFRelease;
    context.copyDescription = (CFStringRef (__cdecl *)(const void *))__CFFileDescriptorCopyDescription;
    context.equal = 0;
    context.hash = 0;
    context.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))__CFFileDescriptorSchedule;
    context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))__CFFileDescriptorCancel;
    context.perform = (void (__cdecl *)(void *))__CFFileDescriptorPerform;
    *(_QWORD *)(v2[5] + 56) = CFRunLoopSourceCreate((CFAllocatorRef)v2[6], v2[7], &context);
    v5 = v2[5];
    v6 = *(__CFRunLoopSource **)(v5 + 56);
    if (v6)
    {
      if (*(_BYTE *)(v5 + 50))
      {
        CFRunLoopSourceSignal(v6);
        _CFRunLoopSourceWakeUpRunLoops(*(_QWORD *)(v2[5] + 56));
        v5 = v2[5];
      }
      if (*(_BYTE *)(v5 + 51))
      {
        CFRunLoopSourceSignal(*(CFRunLoopSourceRef *)(v5 + 56));
        _CFRunLoopSourceWakeUpRunLoops(*(_QWORD *)(v2[5] + 56));
        v5 = v2[5];
      }
    }
    result = *(_QWORD **)(v5 + 56);
    if (result)
LABEL_12:
      result = CFRetain(result);
    *(_QWORD *)(*(_QWORD *)(v2[4] + 8) + 24) = result;
  }
  return result;
}

@end
