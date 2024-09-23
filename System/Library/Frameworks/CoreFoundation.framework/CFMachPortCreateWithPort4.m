@implementation CFMachPortCreateWithPort4

void ___CFMachPortCreateWithPort4_block_invoke(uint64_t a1)
{
  _cfmp_source_invalidated(0, *(_DWORD *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void ___CFMachPortCreateWithPort4_block_invoke_2(uint64_t a1)
{
  CFIndex Count;
  CFIndex v2;
  CFIndex v3;
  uint64_t v4;
  NSObject *v5;
  _DWORD *ValueAtIndex;
  _DWORD *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  _cfmp_source_record_deadness(0, *(_DWORD *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)&__CFAllMachPortsLock);
  if (__CFAllMachPorts)
  {
    Count = CFArrayGetCount((CFArrayRef)__CFAllMachPorts);
    if (Count >= 1)
    {
      v2 = Count;
      v3 = 0;
      v4 = MEMORY[0x1E0C809B0];
      v5 = MEMORY[0x1E0C80D38];
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)__CFAllMachPorts, v3);
        if (ValueAtIndex)
        {
          v7 = ValueAtIndex;
          if (!__CFMachPortCheck(ValueAtIndex[5]) || CFGetRetainCount(v7) == 1)
          {
            if (!v7[4])
            {
              os_unfair_lock_lock((os_unfair_lock_t)v7 + 24);
              if (v7[4])
              {
                os_unfair_lock_unlock((os_unfair_lock_t)v7 + 24);
              }
              else
              {
                v7[4] = 1;
                __dmb(0xBu);
                v8 = *((_QWORD *)v7 + 3);
                if (v8)
                {
                  dispatch_source_cancel(v8);
                  *((_QWORD *)v7 + 3) = 0;
                }
                v9 = *((_QWORD *)v7 + 5);
                *((_QWORD *)v7 + 5) = 0;
                CFRetain(v7);
                os_unfair_lock_unlock((os_unfair_lock_t)v7 + 24);
                block[0] = v4;
                block[1] = 3221225472;
                block[2] = ____CFMachPortChecker_block_invoke;
                block[3] = &__block_descriptor_48_e5_v8__0l;
                block[4] = v7;
                block[5] = v9;
                dispatch_async(v5, block);
              }
            }
            CFArrayRemoveValueAtIndex((CFMutableArrayRef)__CFAllMachPorts, v3--);
            --v2;
          }
        }
        ++v3;
      }
      while (v3 < v2);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__CFAllMachPortsLock);
}

@end
