@implementation MFAADeallocCertificateCache

void __MFAADeallocCertificateCache_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  const void *v3;
  uint64_t *v4;
  const void *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  const void *Value;
  const void *v16;
  const void *v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const void *v26;
  const void *v27;

  if ((int)CertCacheReferenceCountUpdate(*(_QWORD *)(a1 + 32), -1) <= 0)
  {
    if ((v2 = *(_QWORD **)(a1 + 32), (v3 = (const void *)v2[5]) != 0) && v2[4] || v2[8] && v2[7])
    {
      PrintCertCacheContents((uint64_t)CFSTR("Single"), v3);
      PrintCertCacheContents((uint64_t)CFSTR("Chain"), *(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 64));
      v4 = *(uint64_t **)(a1 + 32);
      v5 = (const void *)v4[5];
      if (v5)
      {
        if (!SyncCertCacheContentsToPreferencesFile(v4[4], v5))
        {
          v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v6)
            SyncCertCacheContentsToPreferencesFile_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
        }
        v4 = *(uint64_t **)(a1 + 32);
        v14 = (const void *)v4[4];
        if (v14)
        {
          Value = CFDictionaryGetValue((CFDictionaryRef)gCertCacheDomainList, v14);
          v4 = *(uint64_t **)(a1 + 32);
          if (Value)
          {
            CFDictionaryRemoveValue((CFMutableDictionaryRef)gCertCacheDomainList, (const void *)v4[4]);
            v4 = *(uint64_t **)(a1 + 32);
            v16 = (const void *)v4[5];
            if (v16)
            {
              CFRelease(v16);
              *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
              v4 = *(uint64_t **)(a1 + 32);
            }
          }
        }
      }
      v17 = (const void *)v4[8];
      if (v17)
      {
        if (!SyncCertCacheContentsToPreferencesFile(v4[7], v17))
        {
          v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v18)
            __MFAADeallocCertificateCache_block_invoke_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
        }
        v26 = *(const void **)(*(_QWORD *)(a1 + 32) + 56);
        if (v26 && CFDictionaryGetValue((CFDictionaryRef)gCertCacheDomainList, v26))
        {
          CFDictionaryRemoveValue((CFMutableDictionaryRef)gCertCacheDomainList, *(const void **)(*(_QWORD *)(a1 + 32) + 56));
          v27 = *(const void **)(*(_QWORD *)(a1 + 32) + 64);
          if (v27)
          {
            CFRelease(v27);
            *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
          }
        }
      }
    }
  }
}

void __MFAADeallocCertificateCache_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "ChainCache CFPreferencesSynchronize fail bPrefSyncOkay:false\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
