@implementation MFAACreateCertificateCache

void __MFAACreateCertificateCache_block_invoke()
{
  NSObject *v0;
  _BOOL8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v0 = dispatch_queue_create("com.apple.accessoryd.certCacheDomainQueue", 0);
  gCertCacheDomainQueue = (uint64_t)v0;
  if (v0)
  {
    dispatch_sync(v0, &__block_literal_global_2);
  }
  else
  {
    v1 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v1)
      __MFAACreateCertificateCache_block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

void __MFAACreateCertificateCache_block_invoke_2()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  gCertCacheDomainList = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!gCertCacheDomainList)
  {
    v0 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v0)
      __MFAACreateCertificateCache_block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

void __MFAACreateCertificateCache_block_invoke_14(_QWORD *a1)
{
  const void *Value;
  const void *v3;
  const __CFDictionary *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const char *CStringPtr;
  dispatch_queue_t v15;
  __CFDictionary *v16;
  CFMutableDictionaryRef MutableCopy;
  const __CFDictionary *v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  int valuePtr;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  Value = CFDictionaryGetValue((CFDictionaryRef)gCertCacheDomainList, *(const void **)(*(_QWORD *)(a1[4] + 8) + 24));
  v3 = CFDictionaryGetValue((CFDictionaryRef)gCertCacheDomainList, *(const void **)(*(_QWORD *)(a1[5] + 8) + 24));
  if (Value)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "MFAACreateCertificateCache_block_invoke";
      v32 = 1024;
      v33 = (unsigned __int16)Value & 0xFFF;
      _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s CertCacheDomainList contains existing pCFCacheCertDict:%04X", buf, 0x12u);
    }
    CFRetain(Value);
    if (!v3)
      goto LABEL_15;
LABEL_13:
    CFRetain(v3);
    goto LABEL_16;
  }
  v4 = (const __CFDictionary *)CFPreferencesCopyValue(*(CFStringRef *)(*(_QWORD *)(a1[4] + 8) + 24), CFSTR("com.apple.accessoryd"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "MFAACreateCertificateCache_block_invoke";
    v32 = 1024;
    v33 = (unsigned __int16)v4 & 0xFFF;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s CFPreferencesCopyValue returned pkCFDictCertCache:%04X", buf, 0x12u);
  }
  if (!v4)
  {
    Value = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (!v3)
      goto LABEL_15;
    goto LABEL_13;
  }
  Value = CFDictionaryCreateMutableCopy(0, 0, v4);
  if (!Value)
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v5)
      __MFAACreateCertificateCache_block_invoke_14_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  CFRelease(v4);
  if (v3)
    goto LABEL_13;
LABEL_15:
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &_block_invoke_kRefsCountCache);
  if (v3)
  {
LABEL_16:
    *(_DWORD *)buf = 0;
    v13 = CFNumberGetValue((CFNumberRef)v3, kCFNumberIntType, buf);
    CFRelease(v3);
    if (v13)
    {
      valuePtr = *(_DWORD *)buf + 1;
      v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
    }
    else
    {
      v3 = 0;
    }
  }
  CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(*(_QWORD *)(a1[6] + 8) + 24), 0x8000100u);
  if (CStringPtr)
    v15 = dispatch_queue_create(CStringPtr, 0);
  else
    v15 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) + 40) = Value;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) + 24) = v15;
  v16 = (__CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)gCertCacheDomainList, *(const void **)(*(_QWORD *)(a1[8] + 8) + 24));
  if (v16)
  {
    MutableCopy = v16;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "MFAACreateCertificateCache_block_invoke";
      v32 = 1024;
      v33 = (unsigned __int16)MutableCopy & 0xFFF;
      _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s CertChainCacheDomainList contains existing pCFCacheCertChainDict:%04X", buf, 0x12u);
    }
    CFRetain(MutableCopy);
  }
  else
  {
    v18 = (const __CFDictionary *)CFPreferencesCopyValue(*(CFStringRef *)(*(_QWORD *)(a1[8] + 8) + 24), CFSTR("com.apple.accessoryd"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "MFAACreateCertificateCache_block_invoke";
      v32 = 1024;
      v33 = (unsigned __int16)v18 & 0xFFF;
      _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s CFPreferencesCopyValue returned pkCFDictCertChainCache:%04X", buf, 0x12u);
    }
    if (v18)
    {
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v18);
      if (!MutableCopy)
      {
        v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v19)
          __MFAACreateCertificateCache_block_invoke_14_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);
      }
      CFRelease(v18);
    }
    else
    {
      MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) + 64) = MutableCopy;
  if (Value && v3 && v15)
  {
    if (CFDictionaryGetCount((CFDictionaryRef)Value))
      v27 = ValidateCertificateCache((const __CFDictionary *)Value) == 0;
    else
      v27 = 0;
    CFDictionarySetValue((CFMutableDictionaryRef)gCertCacheDomainList, *(const void **)(*(_QWORD *)(a1[4] + 8) + 24), Value);
    CFDictionarySetValue((CFMutableDictionaryRef)gCertCacheDomainList, *(const void **)(*(_QWORD *)(a1[5] + 8) + 24), v3);
    CertCacheReferenceCountUpdate(*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24), 1);
    PrintCertCacheContents((uint64_t)CFSTR("Single"), *(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) + 40));
    PrintCertCacheContents((uint64_t)CFSTR("Chain"), *(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) + 64));
    if (!v27)
    {
      v28 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
      SyncCertCacheContentsToPreferencesFile(*(_QWORD *)(v28 + 32), *(const void **)(v28 + 40));
    }
    goto LABEL_44;
  }
  if (v3)
LABEL_44:
    CFRelease(v3);
}

void __MFAACreateCertificateCache_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "dispatch_queue_create return NULL !\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __MFAACreateCertificateCache_block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CFDictionaryCreateMutable cache domain list NULL !\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __MFAACreateCertificateCache_block_invoke_14_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CFDictionaryCreateMutableCopy pCFCacheCertDict:NULL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
