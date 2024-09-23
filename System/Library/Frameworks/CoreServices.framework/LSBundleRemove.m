@implementation LSBundleRemove

void ___LSBundleRemove_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v5;

  v5 = (void *)MEMORY[0x186DAE7A0]();
  if ((*(_QWORD *)(_LSBundleGet(*(void **)(a1 + 32), a3) + 172) & 0x400000000000) != 0)
    _CSStoreWriteToUnit();
  objc_autoreleasePoolPop(v5);
}

uint64_t ___LSBundleRemove_block_invoke_2(uint64_t result, int a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  NSObject *v7;

  if (*(_DWORD *)(a3 + 168) == 14 && *(_DWORD *)(a3 + 300) == *(_DWORD *)(result + 340))
  {
    _LSAppProtectionLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      ___LSBundleRemove_block_invoke_2_cold_1(a2, v7);

    result = _CSStoreWriteToUnit();
    *a5 = 1;
  }
  return result;
}

uint64_t ___LSBundleRemove_block_invoke_108(uint64_t a1)
{
  return _LSClaimRemove(*(void **)(a1 + 32));
}

uint64_t ___LSBundleRemove_block_invoke_2_109(uint64_t a1, uint64_t a2, int a3)
{
  return _UTTypeRemove(*(void **)(a1 + 32), a3);
}

void ___LSBundleRemove_block_invoke_3(uint64_t a1, uint64_t a2, int a3)
{
  __CFDictionary *v5;

  if (!*(_BYTE *)(a1 + 48))
  {
    v5 = *(__CFDictionary **)(a1 + 40);
    if (v5)
      LSPluginAddInfoToPayloadDict(*(void **)(a1 + 32), v5, a3, 0, 0);
  }
  _LSPluginRemove(*(void **)(a1 + 32), a3);
}

void ___LSBundleRemove_block_invoke_4(uint64_t a1, uint64_t a2, int a3)
{
  _LSExtensionPointRemove(*(void **)(a1 + 32), a3);
}

void ___LSBundleRemove_block_invoke_5(uint64_t a1, uint64_t a2)
{
  LaunchServices::LocalizedString::Remove(*(LaunchServices::LocalizedString **)(a1 + 32), (_LSDatabase *)*(unsigned int *)(a1 + 4 * a2 + 556));
}

uint64_t ___LSBundleRemove_block_invoke_6(uint64_t a1, uint64_t a2, int a3)
{
  return _LSPlistRemove(*(_QWORD *)(a1 + 32), a3);
}

void ___LSBundleRemove_block_invoke_2_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_182882000, a2, OS_LOG_TYPE_DEBUG, "Resetting locked/hidden flags for unit: %u", (uint8_t *)v2, 8u);
}

@end
