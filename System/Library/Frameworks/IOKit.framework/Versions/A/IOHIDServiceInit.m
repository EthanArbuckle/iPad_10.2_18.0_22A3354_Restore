@implementation IOHIDServiceInit

void ____IOHIDServiceInit_block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v2 + 440) = 0;
  if (!*(_DWORD *)(v2 + 444))
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 448));
    v2 = *(_QWORD *)(a1 + 32);
  }
  CFRelease((CFTypeRef)v2);
}

void ____IOHIDServiceInit_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 444) - 1;
  *(_DWORD *)(v2 + 444) = v3;
  if (!v3 && !*(_BYTE *)(v2 + 440))
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 448));
    v2 = *(_QWORD *)(a1 + 32);
  }
  CFRelease((CFTypeRef)v2);
}

@end
