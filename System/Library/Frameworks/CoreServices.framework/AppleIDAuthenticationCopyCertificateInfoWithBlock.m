@implementation AppleIDAuthenticationCopyCertificateInfoWithBlock

void ___AppleIDAuthenticationCopyCertificateInfoWithBlock_block_invoke(uint64_t a1, CFDictionaryRef theDict, int a3)
{
  CFErrorRef v3;
  uint64_t v4;
  NSObject *v6;
  CFErrorRef v7;
  CFDictionaryRef Copy;
  NSObject *v9;
  _DWORD v10[2];
  uint64_t v11;

  v3 = theDict;
  v11 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v6 = AppleIDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109120;
      v10[1] = a3;
      _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_ERROR, "SFAppleIDClientCopyCertificate failed with error %d\n", (uint8_t *)v10, 8u);
    }
    v7 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("CSIdentityErrorDomain"), -11, 0);
    (*(void (**)(uint64_t, _QWORD, CFErrorRef))(v4 + 16))(v4, 0, v7);
    if (v7)
      CFRelease(v7);
    goto LABEL_12;
  }
  if (!theDict)
  {
    v9 = AppleIDGetLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_182882000, v9, OS_LOG_TYPE_ERROR, "Unexpected empty certificate info\n", (uint8_t *)v10, 2u);
    }
    v3 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("CSIdentityErrorDomain"), -11, 0);
    (*(void (**)(uint64_t, _QWORD, CFErrorRef))(v4 + 16))(v4, 0, v3);
LABEL_12:
    if (!v3)
      return;
    goto LABEL_13;
  }
  Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], theDict);
  (*(void (**)(uint64_t, CFDictionaryRef, _QWORD))(v4 + 16))(v4, Copy, 0);
  if (Copy)
    CFRelease(Copy);
LABEL_13:
  CFRelease(v3);
}

@end
