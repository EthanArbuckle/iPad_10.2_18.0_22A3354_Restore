@implementation DDSMobileAssetv2ProviderDataSource

- (id)maAssetQueryForDDSAssetQuery:(id)a3 compatabilityVersion:(int64_t)a4 platformVersion:(id)a5 internalInstall:(BOOL)a6
{
  return +[DDSMobileAssetv2QueryAdapter maAssetQueryForddsAssetQuery:compatiblilityVersion:platformVersion:internalInstall:](DDSMobileAssetv2QueryAdapter, "maAssetQueryForddsAssetQuery:compatiblilityVersion:platformVersion:internalInstall:", a3, a4, a5, a6);
}

- (int64_t)linguisticAssetCompatabilityVersion
{
  if (linguisticAssetCompatabilityVersion_onceToken_0 != -1)
    dispatch_once(&linguisticAssetCompatabilityVersion_onceToken_0, &__block_literal_global_6);
  return linguisticAssetCompatabilityVersion_supportedCompatibilityVersion_0;
}

void __73__DDSMobileAssetv2ProviderDataSource_linguisticAssetCompatabilityVersion__block_invoke()
{
  NSObject *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  linguisticAssetCompatabilityVersion_supportedCompatibilityVersion_0 = (uint64_t)DDSReadCompatabilityVersionFromFile(CFSTR("Info.plist"));
  DefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 134217984;
    v2 = linguisticAssetCompatabilityVersion_supportedCompatibilityVersion_0;
    _os_log_impl(&dword_1DA990000, v0, OS_LOG_TYPE_DEFAULT, "Supported compatibility version for LinguisticData assets = %ld", (uint8_t *)&v1, 0xCu);
  }

}

- (int64_t)mecabraDictionaryRapidUpdatesAssetCompatabilityVersion
{
  if (mecabraDictionaryRapidUpdatesAssetCompatabilityVersion_onceToken != -1)
    dispatch_once(&mecabraDictionaryRapidUpdatesAssetCompatabilityVersion_onceToken, &__block_literal_global_180);
  return mecabraDictionaryRapidUpdatesAssetCompatabilityVersion_mecabraAssetsCompatibilityVersion;
}

void __92__DDSMobileAssetv2ProviderDataSource_mecabraDictionaryRapidUpdatesAssetCompatabilityVersion__block_invoke()
{
  NSObject *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  mecabraDictionaryRapidUpdatesAssetCompatabilityVersion_mecabraAssetsCompatibilityVersion = (uint64_t)DDSReadCompatabilityVersionFromFile(CFSTR("MecabraDictionaryRapidUpdates_Info.plist"));
  DefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 134217984;
    v2 = mecabraDictionaryRapidUpdatesAssetCompatabilityVersion_mecabraAssetsCompatibilityVersion;
    _os_log_impl(&dword_1DA990000, v0, OS_LOG_TYPE_DEFAULT, "Supported compatibility version for MecabraDictionaryRapidUpdates assets = %ld", (uint8_t *)&v1, 0xCu);
  }

}

@end
