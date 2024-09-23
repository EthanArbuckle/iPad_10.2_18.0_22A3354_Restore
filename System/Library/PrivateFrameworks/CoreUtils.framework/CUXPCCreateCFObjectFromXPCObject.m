@implementation CUXPCCreateCFObjectFromXPCObject

BOOL __CUXPCCreateCFObjectFromXPCObject_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = CUXPCCreateCFObjectFromXPCObject(a3);
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(_QWORD *)(v6 + 24);
    *(_QWORD *)(v6 + 24) = v7 + 1;
    *(_QWORD *)(v5 + 8 * v7) = v4;
  }
  return v4 != 0;
}

uint64_t __CUXPCCreateCFObjectFromXPCObject_block_invoke_2(_QWORD *a1, const char *a2, uint64_t a3)
{
  uint64_t result;
  const void *v6;
  CFStringRef v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = CUXPCCreateCFObjectFromXPCObject(a3);
  if (result)
  {
    v6 = (const void *)result;
    v7 = CFStringCreateWithCString(0, a2, 0x8000100u);
    if (v7)
    {
      *(_QWORD *)(a1[5] + 8 * *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24)) = v7;
      v9 = a1[5];
      v8 = a1[6];
      v10 = *(_QWORD *)(a1[4] + 8);
      v11 = *(_QWORD *)(v10 + 24);
      *(_QWORD *)(v10 + 24) = v11 + 1;
      *(_QWORD *)(v9 + 8 * (v11 + v8)) = v6;
      return 1;
    }
    else
    {
      CFRelease(v6);
      return 0;
    }
  }
  return result;
}

@end
