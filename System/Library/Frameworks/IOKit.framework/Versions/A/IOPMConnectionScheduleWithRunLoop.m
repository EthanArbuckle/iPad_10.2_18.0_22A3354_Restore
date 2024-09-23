@implementation IOPMConnectionScheduleWithRunLoop

uint64_t __IOPMConnectionScheduleWithRunLoop_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFAllocator *v3;
  __CFMachPort *v4;
  __CFRunLoopSource *v5;
  uint64_t result;
  mach_port_t Port;
  CFMachPortContext context;

  v2 = *(_QWORD *)(a1 + 40);
  context.version = 1;
  context.info = (void *)v2;
  memset(&context.retain, 0, 24);
  if (!*(_QWORD *)(v2 + 40))
  {
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = CFMachPortCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFMachPortCallBack)iopm_mach_port_callback, &context, 0);
    v2 = *(_QWORD *)(a1 + 40);
    v4 = *(__CFMachPort **)(v2 + 40);
    if (v4)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) = CFMachPortCreateRunLoopSource(v3, v4, 0);
      v2 = *(_QWORD *)(a1 + 40);
    }
  }
  v5 = *(__CFRunLoopSource **)(v2 + 48);
  if (v5)
  {
    ++*(_DWORD *)(v2 + 72);
    CFRunLoopAddSource(*(CFRunLoopRef *)(a1 + 48), v5, *(CFRunLoopMode *)(a1 + 56));
    result = *(_QWORD *)(a1 + 40);
    if (*(_DWORD *)(result + 72) != 1)
      return result;
    if (*(_QWORD *)(result + 40))
    {
      Port = CFMachPortGetPort(*(CFMachPortRef *)(result + 40));
      result = *(_QWORD *)(a1 + 40);
    }
    else
    {
      Port = 0;
    }
    result = _conveyMachPortToPowerd((int *)result, Port, 1);
  }
  else
  {
    result = 3758097097;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
