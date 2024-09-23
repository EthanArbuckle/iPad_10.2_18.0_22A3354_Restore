@implementation IOPSReleasePowerSource

void __IOPSReleasePowerSource_block_invoke(uint64_t a1)
{
  const void *v2;
  CFTypeID TypeID;
  int v4;

  v4 = 0;
  if (*(_QWORD *)(a1 + 40))
  {
    if (!_pm_connect(&v4))
    {
      io_ps_release_pspowersource(v4, *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8));
      _pm_disconnect();
    }
    notify_cancel(*(_DWORD *)(*(_QWORD *)(a1 + 40) + 12));
    v2 = **(const void ***)(a1 + 40);
    TypeID = CFDictionaryGetTypeID();
    if (v2)
    {
      if (CFGetTypeID(v2) == TypeID)
        CFRelease(**(CFTypeRef **)(a1 + 40));
    }
    **(_QWORD **)(a1 + 40) = 0;
    free(*(void **)(a1 + 40));
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -536870206;
  }
}

@end
