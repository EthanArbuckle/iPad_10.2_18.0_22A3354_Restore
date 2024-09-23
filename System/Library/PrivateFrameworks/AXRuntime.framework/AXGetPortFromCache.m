@implementation AXGetPortFromCache

void ___AXGetPortFromCache_block_invoke(uint64_t a1)
{
  const __CFDictionary *Mutable;
  __CFMachPort *v3;
  mach_port_name_t v4;
  ipc_space_t *v5;

  Mutable = (const __CFDictionary *)gPortCache;
  if (gPortCache
    || (Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]), (gPortCache = (uint64_t)Mutable) != 0))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFDictionaryGetValue(Mutable, (const void *)*(int *)(a1 + 48));
    v3 = *(__CFMachPort **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (v3)
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFMachPortGetPort(v3);
      v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      if (v4)
      {
        v5 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
        if (mach_port_mod_refs(*MEMORY[0x1E0C83DA0], v4, 0, 1) == 17)
        {
          mach_port_mod_refs(*v5, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 4u, 1);
          CFDictionaryRemoveValue((CFMutableDictionaryRef)gPortCache, (const void *)*(int *)(a1 + 48));
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
        }
      }
    }
  }
}

void ___AXGetPortFromCache_block_invoke_38(uint64_t a1)
{
  ipc_space_t *v2;
  kern_return_t v3;

  if (gPortCache)
    CFDictionarySetValue((CFMutableDictionaryRef)gPortCache, (const void *)*(int *)(a1 + 48), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v2 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  v3 = mach_port_mod_refs(*MEMORY[0x1E0C83DA0], *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0, 1);
  if (v3)
  {
    if (v3 == 17)
    {
      mach_port_mod_refs(*v2, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 4u, 1);
      CFDictionaryRemoveValue((CFMutableDictionaryRef)gPortCache, (const void *)*(int *)(a1 + 48));
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  else
  {
    CFMachPortSetInvalidationCallBack(*(CFMachPortRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), (CFMachPortInvalidationCallBack)portInvalidationCallback);
  }
}

@end
