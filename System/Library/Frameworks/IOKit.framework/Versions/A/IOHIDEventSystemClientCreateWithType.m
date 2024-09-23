@implementation IOHIDEventSystemClientCreateWithType

void *__IOHIDEventSystemClientCreateWithType_block_invoke(uint64_t a1, uint64_t a2)
{
  CFMutableDictionaryRef v2;
  CFMutableDictionaryRef v3;
  const __CFData *Data;
  const __CFData *v5;
  unsigned int Length;
  void *v7;
  CFRange v9;

  if (*(_DWORD *)(a2 + 16) != 3)
    return 0;
  v2 = __IOHIDEventSystemClientStateSerialize(*(_QWORD *)(a1 + 32));
  if (!v2)
    return 0;
  v3 = v2;
  Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (Data)
  {
    v5 = Data;
    Length = CFDataGetLength(Data);
    v7 = malloc_type_calloc(1uLL, Length + 200, 0xFE536EE8uLL);
    if (v7)
    {
      __strlcpy_chk();
      *(_DWORD *)v7 = 1;
      *((_DWORD *)v7 + 1) = Length;
      v9.location = 0;
      v9.length = Length;
      CFDataGetBytes(v5, v9, (UInt8 *)v7 + 200);
    }
    CFRelease(v3);
  }
  else
  {
    v7 = 0;
    v5 = v3;
  }
  CFRelease(v5);
  return v7;
}

@end
