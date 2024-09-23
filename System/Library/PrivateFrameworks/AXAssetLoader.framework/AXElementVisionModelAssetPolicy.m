@implementation AXElementVisionModelAssetPolicy

- (id)assetType
{
  return CFSTR("com.apple.MobileAsset.AXElementVision");
}

- (id)launchActivityIdentifier
{
  return CFSTR("com.apple.ax.AXElementVision.LaunchActivity");
}

- (BOOL)shouldDownloadAsset:(id)a3 withInstalledAssets:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  NSObject *v9;
  _DWORD v11[2];
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[AXAssetPolicy isAssetSupported:](self, "isAssetSupported:", v6))
    v8 = -[AXAssetPolicy isAssetContentVersion:greatherThanInstalledAssets:](self, "isAssetContentVersion:greatherThanInstalledAssets:", v6, v7);
  else
    v8 = 0;
  AXLogAssetLoader();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11[0] = 67109378;
    v11[1] = v8;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1D3F8E000, v9, OS_LOG_TYPE_INFO, "Should download asset = %d for %@", (uint8_t *)v11, 0x12u);
  }

  return v8;
}

- (id)maxSupportedFormatVersion
{
  return &unk_1E95D7C08;
}

- (id)minSupportedFormatVersion
{
  return &unk_1E95D7C08;
}

@end
