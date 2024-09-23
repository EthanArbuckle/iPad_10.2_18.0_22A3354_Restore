@implementation AppleIDAuthenticationFindPersonWithBlock

void ___AppleIDAuthenticationFindPersonWithBlock_block_invoke(uint64_t a1, const __CFArray *a2, int a3)
{
  uint64_t v4;
  NSObject *v6;
  const __CFAllocator *v7;
  CFErrorRef v8;
  const __CFAllocator *v9;
  CFMutableArrayRef Mutable;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v6 = AppleIDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v11[0]) = 67109120;
      HIDWORD(v11[0]) = a3;
      _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_ERROR, "SFAppleIDClientCopyPersonInfo failed with error %d\n", (uint8_t *)v11, 8u);
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
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 0x40000000;
      v11[2] = ___ZL41handleSFAppleIDClientCopyPersonInfoResultPK9__CFArrayiU13block_pointerFvS1_hP9__CFErrorE_block_invoke;
      v11[3] = &__block_descriptor_tmp_54;
      v11[4] = Mutable;
      CFArrayApplyBlock(a2, (uint64_t)v11);
      (*(void (**)(uint64_t, CFErrorRef, uint64_t, _QWORD))(v4 + 16))(v4, v8, 1, 0);
      goto LABEL_11;
    }
    v7 = v9;
  }
  v8 = CFErrorCreate(v7, CFSTR("CSIdentityErrorDomain"), -11, 0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, CFErrorRef))(v4 + 16))(v4, 0, 1, v8);
  if (!v8)
  {
    if (!a2)
      return;
    goto LABEL_7;
  }
LABEL_11:
  CFRelease(v8);
  if (a2)
LABEL_7:
    CFRelease(a2);
}

@end
