@implementation CertCacheReferenceCountUpdate

void __CertCacheReferenceCountUpdate_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFNumber *Value;
  CFNumberRef v4;
  CFNumberRef v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v1 + 40))
  {
    Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)gCertCacheDomainList, *(const void **)(v1 + 16));
    if (Value)
    {
      if (CFNumberGetValue(Value, kCFNumberIntType, (void *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)))
      {
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += *(_DWORD *)(a1 + 48);
        v4 = CFNumberCreate(0, kCFNumberIntType, (const void *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
        if (v4)
        {
          v5 = v4;
          CFDictionarySetValue((CFMutableDictionaryRef)gCertCacheDomainList, *(const void **)(*(_QWORD *)(a1 + 40) + 16), v4);
          CFRelease(v5);
          return;
        }
        v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v22)
          __CertCacheReferenceCountUpdate_block_invoke_cold_3(v22, v23, v24, v25, v26, v27, v28, v29);
      }
      else
      {
        v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v14)
          __CertCacheReferenceCountUpdate_block_invoke_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    }
    else
    {
      v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v6)
        __CertCacheReferenceCountUpdate_block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

void __CertCacheReferenceCountUpdate_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CFDictionaryGetValue pCFNumCacheRefCount:NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __CertCacheReferenceCountUpdate_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CFNumberGetValue bCertRefCountValid = false\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __CertCacheReferenceCountUpdate_block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CFNumberCreate pCFNumCertCacheRefCount:NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
