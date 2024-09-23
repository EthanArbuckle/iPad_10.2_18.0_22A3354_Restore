@implementation CFFileDescriptorEnableCallBacks

void __CFFileDescriptorEnableCallBacks_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _BOOL4 is_readable;
  uint64_t v4;
  __CFRunLoopSource *v5;
  uint64_t v6;
  _BOOL4 is_writeable;
  uint64_t v8;
  __CFRunLoopSource *v9;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v1 + 16))
  {
    if ((*(_BYTE *)(a1 + 40) & 1) != 0 && *(_QWORD *)(v1 + 32))
    {
      is_readable = cffd_is_readable(*(_DWORD *)(v1 + 20));
      v4 = *(_QWORD *)(a1 + 32);
      if (is_readable)
      {
        *(_BYTE *)(v4 + 50) = 1;
        if (!*(_BYTE *)(v4 + 48))
        {
          dispatch_suspend(*(dispatch_object_t *)(v4 + 32));
          v4 = *(_QWORD *)(a1 + 32);
          *(_BYTE *)(v4 + 48) = 1;
        }
        v5 = *(__CFRunLoopSource **)(v4 + 56);
        if (v5)
        {
          CFRunLoopSourceSignal(v5);
          _CFRunLoopSourceWakeUpRunLoops(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
        }
      }
      else if (*(_BYTE *)(v4 + 48))
      {
        *(_BYTE *)(v4 + 48) = 0;
        dispatch_resume(*(dispatch_object_t *)(v4 + 32));
      }
    }
    if ((*(_BYTE *)(a1 + 40) & 2) != 0)
    {
      v6 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v6 + 40))
      {
        is_writeable = cffd_is_writeable(*(_DWORD *)(v6 + 20));
        v8 = *(_QWORD *)(a1 + 32);
        if (is_writeable)
        {
          *(_BYTE *)(v8 + 51) = 1;
          if (!*(_BYTE *)(v8 + 49))
          {
            dispatch_suspend(*(dispatch_object_t *)(v8 + 40));
            v8 = *(_QWORD *)(a1 + 32);
            *(_BYTE *)(v8 + 49) = 1;
          }
          v9 = *(__CFRunLoopSource **)(v8 + 56);
          if (v9)
          {
            CFRunLoopSourceSignal(v9);
            _CFRunLoopSourceWakeUpRunLoops(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
          }
        }
        else if (*(_BYTE *)(v8 + 49))
        {
          *(_BYTE *)(v8 + 49) = 0;
          dispatch_resume(*(dispatch_object_t *)(v8 + 40));
        }
      }
    }
  }
}

@end
