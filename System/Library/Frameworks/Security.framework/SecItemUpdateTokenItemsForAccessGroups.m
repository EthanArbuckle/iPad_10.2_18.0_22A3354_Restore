@implementation SecItemUpdateTokenItemsForAccessGroups

uint64_t __SecItemUpdateTokenItemsForAccessGroups_block_invoke(uint64_t a1, CFTypeRef *a2)
{
  uint64_t v2;
  __CFArray *Mutable;
  CFIndex v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  const void *v10;
  const void *v11;
  BOOL v12;
  const void *v13;
  uint64_t v14;
  __CFArray *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  CFTypeID TypeID;
  int v20;
  int v21;
  int v22;
  int v23;
  __CFData *v24;
  __CFData *v25;
  __CFDictionary *MutableCopy;
  uint64_t (*v27)(uint64_t, uint64_t, __CFArray *, uint64_t, CFTypeRef *);
  uint64_t v28;
  uint64_t v29;
  __CFArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __CFArray *v35;
  uint64_t v36;
  const __CFAllocator *allocator;
  CFIndex v40;
  _QWORD v41[7];

  v2 = a1;
  if (*(_QWORD *)(a1 + 32))
  {
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    v4 = 0;
    v5 = CFSTR("accc");
    v6 = CFSTR("toid");
    v7 = CFSTR("v_Data");
    while (v4 < CFArrayGetCount(*(CFArrayRef *)(v2 + 32)))
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v2 + 32), v4);
      Value = CFDictionaryGetValue(ValueAtIndex, v5);
      v10 = CFDictionaryGetValue(ValueAtIndex, v6);
      v11 = CFDictionaryGetValue(ValueAtIndex, v7);
      if (v10)
        v12 = Value == 0;
      else
        v12 = 1;
      if (v12)
        goto LABEL_14;
      v13 = v11;
      v40 = v4;
      v14 = v2;
      v15 = Mutable;
      v16 = v7;
      v17 = v6;
      v18 = v5;
      TypeID = CFDataGetTypeID();
      v12 = TypeID == CFGetTypeID(Value);
      v5 = v18;
      v6 = v17;
      v7 = v16;
      Mutable = v15;
      v2 = v14;
      v4 = v40;
      if (v12)
      {
        v24 = SecTokenItemValueCreate((uint64_t)v10, (int)Value, v13, a2, v20, v21, v22, v23);
        if (!v24)
        {
          v36 = 0;
          if (Mutable)
            goto LABEL_34;
          return v36;
        }
        v25 = v24;
        MutableCopy = CFDictionaryCreateMutableCopy(allocator, 0, ValueAtIndex);
        CFDictionarySetValue(MutableCopy, v7, v25);
        CFDictionarySetValue(MutableCopy, CFSTR("tkid"), *(const void **)(v2 + 40));
        CFDictionaryRemoveValue(MutableCopy, v5);
        CFDictionaryRemoveValue(MutableCopy, v6);
        CFArrayAppendValue(Mutable, MutableCopy);
        if (MutableCopy)
          CFRelease(MutableCopy);
        CFRelease(v25);
      }
      else
      {
LABEL_14:
        CFArrayAppendValue(Mutable, ValueAtIndex);
      }
      ++v4;
    }
  }
  else
  {
    Mutable = 0;
  }
  if (gSecurityd
    && (v27 = *(uint64_t (**)(uint64_t, uint64_t, __CFArray *, uint64_t, CFTypeRef *))(gSecurityd + 80)) != 0)
  {
    v28 = *(_QWORD *)(v2 + 40);
    if (*(_QWORD *)(v2 + 48))
      v29 = *(_QWORD *)(v2 + 48);
    else
      v29 = MEMORY[0x1E0C9AA60];
    if (Mutable)
      v30 = Mutable;
    else
      v30 = (__CFArray *)MEMORY[0x1E0C9AA60];
    v31 = SecSecurityClientGet();
    v32 = v27(v28, v29, v30, v31, a2);
  }
  else
  {
    v33 = *(_QWORD *)(v2 + 40);
    if (*(_QWORD *)(v2 + 48))
      v34 = *(_QWORD *)(v2 + 48);
    else
      v34 = MEMORY[0x1E0C9AA60];
    if (Mutable)
      v35 = Mutable;
    else
      v35 = (__CFArray *)MEMORY[0x1E0C9AA60];
    SecSecurityClientGet();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __cfstring_array_array_to_error_request_block_invoke;
    v41[3] = &__block_descriptor_56_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
    v41[4] = v33;
    v41[5] = v34;
    v41[6] = v35;
    v32 = securityd_send_sync_and_do(0x62u, a2, (uint64_t)v41, 0);
  }
  v36 = v32;
  if (Mutable)
LABEL_34:
    CFRelease(Mutable);
  return v36;
}

@end
