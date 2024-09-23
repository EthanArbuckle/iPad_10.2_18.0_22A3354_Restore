@implementation ZL53getMDLAssetLoadingOptionDefaultUSDColorSpaceSymbolLocv

void *___ZL53getMDLAssetLoadingOptionDefaultUSDColorSpaceSymbolLocv_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!ModelIOLibraryCore(char **)::frameworkLibrary)
  {
    v4 = xmmword_1EA59DFA0;
    v5 = 0;
    ModelIOLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  if (!ModelIOLibraryCore(char **)::frameworkLibrary)
    ___ZL53getMDLAssetLoadingOptionDefaultUSDColorSpaceSymbolLocv_block_invoke_cold_1(&v3);
  result = dlsym((void *)ModelIOLibraryCore(char **)::frameworkLibrary, "MDLAssetLoadingOptionDefaultUSDColorSpace");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMDLAssetLoadingOptionDefaultUSDColorSpaceSymbolLoc(void)::ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                               + 24);
  return result;
}

@end
