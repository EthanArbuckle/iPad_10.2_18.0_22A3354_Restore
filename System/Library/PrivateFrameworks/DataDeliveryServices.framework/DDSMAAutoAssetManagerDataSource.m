@implementation DDSMAAutoAssetManagerDataSource

- (BOOL)shouldDownloadAutoAsset
{
  return _os_feature_enabled_impl();
}

- (int64_t)linguisticAssetCompatabilityVersion
{
  if (linguisticAssetCompatabilityVersion_onceToken != -1)
    dispatch_once(&linguisticAssetCompatabilityVersion_onceToken, &__block_literal_global_5);
  return linguisticAssetCompatabilityVersion_supportedCompatibilityVersion;
}

void __70__DDSMAAutoAssetManagerDataSource_linguisticAssetCompatabilityVersion__block_invoke()
{
  NSObject *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  linguisticAssetCompatabilityVersion_supportedCompatibilityVersion = (uint64_t)DDSReadCompatabilityVersionFromFile(CFSTR("Info.plist"));
  DefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 134217984;
    v2 = linguisticAssetCompatabilityVersion_supportedCompatibilityVersion;
    _os_log_impl(&dword_1DA990000, v0, OS_LOG_TYPE_DEFAULT, "Supported compatibility version for LinguisticData assets = %ld", (uint8_t *)&v1, 0xCu);
  }

}

- (id)supportedAutoAssetSpecifiers
{
  if (supportedAutoAssetSpecifiers_onceToken != -1)
    dispatch_once(&supportedAutoAssetSpecifiers_onceToken, &__block_literal_global_4);
  return (id)supportedAutoAssetSpecifiers_supportedAutoAssetSpecifiers;
}

void __63__DDSMAAutoAssetManagerDataSource_supportedAutoAssetSpecifiers__block_invoke()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;

  DDSReadSupportedPriorityAssetSpecifiersFromFile(CFSTR("Info.plist"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)supportedAutoAssetSpecifiers_supportedAutoAssetSpecifiers;
  supportedAutoAssetSpecifiers_supportedAutoAssetSpecifiers = v0;

  DefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __63__DDSMAAutoAssetManagerDataSource_supportedAutoAssetSpecifiers__block_invoke_cold_1(v2);

}

void __63__DDSMAAutoAssetManagerDataSource_supportedAutoAssetSpecifiers__block_invoke_cold_1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = supportedAutoAssetSpecifiers_supportedAutoAssetSpecifiers;
  _os_log_debug_impl(&dword_1DA990000, log, OS_LOG_TYPE_DEBUG, "Supported auto asset specifiers: %@", (uint8_t *)&v1, 0xCu);
}

@end
