@implementation AXAudiogramIngestionAssetPolicy

- (id)assetType
{
  return CFSTR("com.apple.MobileAsset.AudiogramAssets");
}

- (id)launchActivityIdentifier
{
  return CFSTR("com.apple.ax.AudiogramAssets.LaunchActivity");
}

- (BOOL)shouldCopyLocally
{
  return 1;
}

- (id)maxSupportedFormatVersion
{
  if (_os_feature_enabled_impl())
    return &unk_1E95D7B90;
  else
    return &unk_1E95D7BA8;
}

- (id)minSupportedFormatVersion
{
  if (_os_feature_enabled_impl())
    return &unk_1E95D7B90;
  else
    return &unk_1E95D7BA8;
}

- (BOOL)shouldUseProductionServerForInternalBuilds
{
  return _os_feature_enabled_impl() ^ 1;
}

- (id)downloadOptionsForOperation:(unint64_t)a3 userInitiated:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)AXAudiogramIngestionAssetPolicy;
  -[AXAssetPolicy downloadOptionsForOperation:userInitiated:](&v7, sel_downloadOptionsForOperation_userInitiated_, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsCellularAccess:", v4);
  return v5;
}

- (id)assetsToPurgeFromInstalledAssets:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  objc_super v9;
  uint8_t buf[16];

  v4 = a3;
  if (-[AXAudiogramIngestionAssetPolicy _assetsUsedInLastSixMonths](self, "_assetsUsedInLastSixMonths"))
  {
    v9.receiver = self;
    v9.super_class = (Class)AXAudiogramIngestionAssetPolicy;
    -[AXAssetPolicy assetsToPurgeFromInstalledAssets:](&v9, sel_assetsToPurgeFromInstalledAssets_, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AXLogAudiogram();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3F8E000, v6, OS_LOG_TYPE_DEFAULT, "Audiogram Ingestion assets have been unused for 6 months. Purging all installed assets", buf, 2u);
    }

    v5 = v4;
  }
  v7 = v5;

  return v7;
}

- (BOOL)_assetsUsedInLastSixMonths
{
  void *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v2 = (void *)getAXSettingsClass_softClass;
  v12 = getAXSettingsClass_softClass;
  if (!getAXSettingsClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getAXSettingsClass_block_invoke;
    v8[3] = &unk_1E95D3900;
    v8[4] = &v9;
    __getAXSettingsClass_block_invoke((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v3, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audiogramIngestionLastModelAccess");
  v6 = v5;

  return CFAbsoluteTimeGetCurrent() - v6 < 15724800.0;
}

- (AXAudiogramIngestionAssetPolicy)init
{
  AXAudiogramIngestionAssetPolicy *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _Unwind_Exception *v10;
  objc_super v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;

  v11.receiver = self;
  v11.super_class = (Class)AXAudiogramIngestionAssetPolicy;
  v2 = -[AXAssetPolicy init](&v11, sel_init);
  if (v2 && _os_feature_enabled_impl() && os_variant_has_internal_ui())
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v3 = getASServerURLForAssetTypeSymbolLoc_ptr;
    v15 = getASServerURLForAssetTypeSymbolLoc_ptr;
    if (!getASServerURLForAssetTypeSymbolLoc_ptr)
    {
      v4 = (void *)MobileAssetLibrary();
      v3 = dlsym(v4, "ASServerURLForAssetType");
      v13[3] = (uint64_t)v3;
      getASServerURLForAssetTypeSymbolLoc_ptr = v3;
    }
    _Block_object_dispose(&v12, 8);
    if (v3)
    {
      ((void (*)(const __CFString *, _QWORD))v3)(CFSTR("com.apple.MobileAsset.AudiogramAssets"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("https://mesu.apple.com/assets/")))
      {
LABEL_12:

        return v2;
      }
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v7 = getMASetServerUrlOverrideSymbolLoc_ptr;
      v15 = getMASetServerUrlOverrideSymbolLoc_ptr;
      if (!getMASetServerUrlOverrideSymbolLoc_ptr)
      {
        v8 = (void *)MobileAssetLibrary();
        v7 = dlsym(v8, "MASetServerUrlOverride");
        v13[3] = (uint64_t)v7;
        getMASetServerUrlOverrideSymbolLoc_ptr = v7;
      }
      _Block_object_dispose(&v12, 8);
      if (v7)
      {
        ((void (*)(const __CFString *, const __CFString *))v7)(CFSTR("com.apple.MobileAsset.AudiogramAssets"), CFSTR("https://basejumper.apple.com/livability/Crystal"));
        goto LABEL_12;
      }
    }
    else
    {
      -[AXAudiogramIngestionAssetPolicy init].cold.1();
    }
    v10 = (_Unwind_Exception *)-[AXAudiogramIngestionAssetPolicy init].cold.1();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v10);
  }
  return v2;
}

- (uint64_t)init
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __getAXSettingsClass_block_invoke_cold_1(v0);
}

@end
