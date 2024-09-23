@implementation GEOConfigStorageRemote

void __75___GEOConfigStorageRemote_getConfigValueForKey_countryCode_options_source___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  GEOConfig_getCountryAwareValueForKeyFromDictionary(*(void **)(a1 + 32), *(void **)(a1 + 40), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

@end
