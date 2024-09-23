@implementation AppleIDAuthenticationCopyStatusWithBlock

void ___AppleIDAuthenticationCopyStatusWithBlock_block_invoke(uint64_t a1, const __CFDictionary *a2, int a3)
{
  uint64_t v4;
  const __CFAllocator *v5;
  const CFDictionaryKeyCallBacks *v6;
  const CFDictionaryValueCallBacks *v7;
  __CFDictionary *Mutable;
  CFMutableDictionaryRef v9;
  __CFDictionary *v10;
  BOOL v11;
  const void *v12;
  const void *Value;
  CFTypeID TypeID;
  CFErrorRef v15;
  uint64_t v16;
  __CFDictionary *v17;
  NSObject *v19;
  const __CFAllocator *v20;
  _DWORD v21[2];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v19 = AppleIDGetLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21[0] = 67109120;
      v21[1] = a3;
      _os_log_impl(&dword_182882000, v19, OS_LOG_TYPE_ERROR, "SFAppleIDClientCopyAccountInfo failed with error %d\n", (uint8_t *)v21, 8u);
    }
    v20 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    goto LABEL_27;
  }
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (!a2)
  {
    v20 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
LABEL_27:
    v15 = CFErrorCreate(v20, CFSTR("CSIdentityErrorDomain"), -11, 0);
    (*(void (**)(uint64_t, _QWORD, _QWORD, CFErrorRef))(v4 + 16))(v4, 0, 0, v15);
    Mutable = 0;
    goto LABEL_16;
  }
  v6 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v7 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v9 = CFDictionaryCreateMutable(v5, 0, v6, v7);
  v10 = v9;
  if (Mutable)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    v12 = (const void *)getkSFAppleIDClientAccountInfoAppleIDCFKey();
    if (v12)
    {
      Value = CFDictionaryGetValue(a2, v12);
      TypeID = CFStringGetTypeID();
      if (Value && (!TypeID || CFGetTypeID(Value) == TypeID))
      {
        CFDictionaryAddValue(v10, Value, a2);
        CFDictionaryAddValue(Mutable, CFSTR("AccountStatuses"), v10);
        v15 = 0;
        v16 = 1;
        v17 = Mutable;
LABEL_14:
        (*(void (**)(uint64_t, uint64_t, __CFDictionary *, CFErrorRef))(v4 + 16))(v4, v16, v17, v15);
LABEL_15:
        CFRelease(v10);
        goto LABEL_16;
      }
    }
    else
    {
      CFStringGetTypeID();
    }
    v15 = CFErrorCreate(v5, CFSTR("CSIdentityErrorDomain"), -11, 0);
    v17 = 0;
    v16 = 0;
    goto LABEL_14;
  }
  v15 = CFErrorCreate(v5, CFSTR("CSIdentityErrorDomain"), -11, 0);
  (*(void (**)(uint64_t, _QWORD, _QWORD, CFErrorRef))(v4 + 16))(v4, 0, 0, v15);
  if (v10)
    goto LABEL_15;
LABEL_16:
  if (v15)
    CFRelease(v15);
  if (Mutable)
    CFRelease(Mutable);
  if (a2)
    CFRelease(a2);
}

@end
