@implementation IOPMConnectionUnscheduleFromRunLoop

void __IOPMConnectionUnscheduleFromRunLoop_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  const void *v4;
  __CFMachPort *v5;
  mach_port_t Port;
  int v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v2 + 40))
  {
    CFRunLoopRemoveSource(*(CFRunLoopRef *)(a1 + 48), *(CFRunLoopSourceRef *)(v2 + 48), *(CFRunLoopMode *)(a1 + 56));
    v2 = *(_QWORD *)(a1 + 40);
  }
  v3 = *(_DWORD *)(v2 + 72) - 1;
  *(_DWORD *)(v2 + 72) = v3;
  if (!v3)
  {
    v4 = *(const void **)(v2 + 48);
    if (v4)
    {
      CFRelease(v4);
      v2 = *(_QWORD *)(a1 + 40);
    }
    v5 = *(__CFMachPort **)(v2 + 40);
    if (v5)
    {
      Port = CFMachPortGetPort(v5);
      v7 = _conveyMachPortToPowerd(*(int **)(a1 + 40), Port, 0);
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
      CFMachPortInvalidate(*(CFMachPortRef *)(v8 + 40));
      CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 40));
    }
  }
}

@end
