@implementation AppleIDAuthenticationCopyAppleIDsWithBlock

void ___AppleIDAuthenticationCopyAppleIDsWithBlock_block_invoke(uint64_t a1, const void *a2, int a3)
{
  uint64_t v4;
  NSObject *v6;
  const __CFAllocator *v7;
  CFErrorRef v8;
  const __CFAllocator *v9;
  __CFArray *Mutable;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v6 = AppleIDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = a3;
      _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_ERROR, "SFAppleIDClientCopyMyAppleID failed with error %d\n", (uint8_t *)v11, 8u);
    }
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  }
  else
  {
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    if (Mutable)
    {
      v8 = Mutable;
      if (a2)
        CFArrayAppendValue(Mutable, a2);
      (*(void (**)(uint64_t, CFErrorRef, _QWORD))(v4 + 16))(v4, v8, 0);
      goto LABEL_13;
    }
    v7 = v9;
  }
  v8 = CFErrorCreate(v7, CFSTR("CSIdentityErrorDomain"), -11, 0);
  (*(void (**)(uint64_t, _QWORD, CFErrorRef))(v4 + 16))(v4, 0, v8);
  if (!v8)
  {
    if (!a2)
      return;
    goto LABEL_7;
  }
LABEL_13:
  CFRelease(v8);
  if (a2)
LABEL_7:
    CFRelease(a2);
}

@end
