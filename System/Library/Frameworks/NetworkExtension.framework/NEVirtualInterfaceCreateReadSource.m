@implementation NEVirtualInterfaceCreateReadSource

void __NEVirtualInterfaceCreateReadSource_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 74))
  {
    *(_BYTE *)(v2 + 74) = 0;
    dispatch_resume(*(dispatch_object_t *)(a1 + 40));
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    NEVirtualInterfaceTearDown(v3);
    CFRelease(*(CFTypeRef *)(a1 + 32));
  }
}

uint64_t __NEVirtualInterfaceCreateReadSource_block_invoke_2(uint64_t a1)
{
  uint64_t result;
  unsigned int v3;
  int v4;

  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(result + 64))
  {
    v3 = *(_DWORD *)(result + 208);
    v4 = *(unsigned __int8 *)(result + 73);
    if (!*(_BYTE *)(result + 73))
    {
      dispatch_suspend(*(dispatch_object_t *)(result + 64));
      result = *(_QWORD *)(a1 + 32);
      *(_BYTE *)(result + 74) = 1;
      v4 = *(unsigned __int8 *)(result + 73);
    }
    do
    {
      if (v4)
        v3 = *(_DWORD *)(result + 96);
      result = NEVirtualInterfaceReadMultiplePackets(result, v3);
      if (!(_DWORD)result)
        break;
      result = *(_QWORD *)(a1 + 32);
      v4 = *(unsigned __int8 *)(result + 73);
    }
    while (*(_BYTE *)(result + 73));
  }
  return result;
}

@end
