@implementation IOPMConnectionRelease

void __IOPMConnectionRelease_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  int v4;
  int v5;

  v2 = *(_QWORD *)(a1 + 40);
  v5 = 0;
  if (notify_is_valid_token(*(_DWORD *)(v2 + 20)))
    notify_cancel(*(_DWORD *)(v2 + 20));
  v3 = *(const void **)(v2 + 8);
  if (v3)
    CFRelease(v3);
  if (_pm_connect(&v5))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -536870199;
  }
  else
  {
    v4 = io_pm_connection_release(v5, *(_DWORD *)v2, (_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    if (v4)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
    *(_OWORD *)(v2 + 48) = 0u;
    *(_OWORD *)(v2 + 64) = 0u;
    *(_OWORD *)(v2 + 16) = 0u;
    *(_OWORD *)(v2 + 32) = 0u;
    *(_OWORD *)v2 = 0u;
    free((void *)v2);
  }
}

@end
