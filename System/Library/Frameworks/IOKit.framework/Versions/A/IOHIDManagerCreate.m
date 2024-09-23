@implementation IOHIDManagerCreate

void *__IOHIDManagerCreate_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  const __CFAllocator *v3;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  const __CFAllocator *v12;
  CFSetRef Copy;
  const __CFSet *v14;
  CFMutableArrayRef v15;
  CFMutableArrayRef v16;
  const __CFData *Data;
  const __CFData *v18;
  unsigned int Length;
  void *v20;
  _QWORD context[5];
  CFRange v23;

  if ((*(_DWORD *)(a2 + 16) & 0xFFFFFFFE) != 2)
    return 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
    return 0;
  v5 = Mutable;
  os_unfair_recursive_lock_lock_with_options();
  v6 = (const void *)*MEMORY[0x1E0C9AE50];
  v7 = (const void *)*MEMORY[0x1E0C9AE40];
  if (*(_QWORD *)(v2 + 96))
    v8 = (const void *)*MEMORY[0x1E0C9AE50];
  else
    v8 = (const void *)*MEMORY[0x1E0C9AE40];
  CFDictionarySetValue(v5, CFSTR("DispatchQueue"), v8);
  if (*(_QWORD *)(v2 + 80))
    v9 = v6;
  else
    v9 = v7;
  CFDictionarySetValue(v5, CFSTR("RunLoop"), v9);
  _IOHIDDictionaryAddSInt32(v5, CFSTR("openOptions"), *(_DWORD *)(v2 + 148));
  _IOHIDDictionaryAddSInt32(v5, CFSTR("createOptions"), *(_DWORD *)(v2 + 152));
  if (*(_BYTE *)(v2 + 144))
    v10 = v6;
  else
    v10 = v7;
  CFDictionarySetValue(v5, CFSTR("isOpen"), v10);
  v11 = *(const void **)(v2 + 32);
  if (v11)
  {
    v12 = CFGetAllocator(v11);
    Copy = CFSetCreateCopy(v12, *(CFSetRef *)(v2 + 32));
    if (Copy)
    {
      v14 = Copy;
      v15 = CFArrayCreateMutable(v3, 0, MEMORY[0x1E0C9B378]);
      if (v15)
      {
        v16 = v15;
        context[0] = MEMORY[0x1E0C809B0];
        context[1] = 0x40000000;
        context[2] = ____IOHIDManagerSerializeState_block_invoke;
        context[3] = &__block_descriptor_tmp_31;
        context[4] = v15;
        _IOHIDCFSetApplyBlock(v14, context);
        CFDictionarySetValue(v5, CFSTR("devices"), v16);
        CFRelease(v16);
      }
      CFRelease(v14);
    }
  }
  os_unfair_recursive_lock_unlock();
  Data = CFPropertyListCreateData(v3, v5, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (!Data)
  {
    CFRelease(v5);
    return 0;
  }
  v18 = Data;
  Length = CFDataGetLength(Data);
  v20 = malloc_type_calloc(1uLL, Length + 200, 0xDDD9AAE1uLL);
  if (v20)
  {
    __strlcpy_chk();
    *(_DWORD *)v20 = 1;
    *((_DWORD *)v20 + 1) = Length;
    v23.location = 0;
    v23.length = Length;
    CFDataGetBytes(v18, v23, (UInt8 *)v20 + 200);
  }
  CFRelease(v5);
  CFRelease(v18);
  return v20;
}

@end
