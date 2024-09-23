@implementation VCFeatureFlagManager

void __VCFeatureFlagManager_U1AuthTagEnabled_block_invoke()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v0 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-u-plus-one-auth-tag-enabled"), CFSTR("uPlusOneAuthTagEnabled"), MEMORY[0x1E0C9AAB0], 0), "BOOLValue");
  if (VCFeatureFlagManager_UseShortMKI_onceToken != -1)
    dispatch_once(&VCFeatureFlagManager_UseShortMKI_onceToken, &__block_literal_global_33_0);
  v1 = VCFeatureFlagManager_UseShortMKI_result;
  v2 = _os_feature_enabled_impl();
  if (v1)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3 & v0;
  VCFeatureFlagManager_U1AuthTagEnabled_result = v3 & v0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109632;
    v5[1] = v4;
    v6 = 1024;
    v7 = v1;
    v8 = 1024;
    v9 = v0;
    _os_log_impl(&dword_1D8A54000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCFeatureFlagManager: U1AuthTag=%{BOOL}d, shortMKIEnabled=%{BOOL}d, storeBagValue=%{BOOL}d", (uint8_t *)v5, 0x14u);
  }
}

void __VCFeatureFlagManager_SessionBasedMutingEnabled_block_invoke()
{
  int v0;
  _BOOL4 v1;
  _DWORD v2[2];
  __int16 v3;
  _BOOL4 v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = _os_feature_enabled_impl();
  v1 = VCFeatureFlagManager_UseAvconferenced();
  VCFeatureFlagManager_SessionBasedMutingEnabled_result = v0 & v1;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2[0] = 67109632;
    v2[1] = v0;
    v3 = 1024;
    v4 = v1;
    v5 = 1024;
    v6 = v0 & v1;
    _os_log_impl(&dword_1D8A54000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCFeatureFlagManager: SessionBasedMuting=%{BOOL}d, UseAvconferencedEmbeddedSpecific=%{BOOL}d, result=%{BOOL}d", (uint8_t *)v2, 0x14u);
  }
}

uint64_t __VCFeatureFlagManager_UseAvconferenced_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  VCFeatureFlagManager_UseAvconferenced_flag = result;
  return result;
}

uint64_t __VCFeatureFlagManager_UseOptimizedTelephonyHandovers_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  VCFeatureFlagManager_UseOptimizedTelephonyHandovers_result = result;
  return result;
}

BOOL __VCFeatureFlagManager_PreviewMSROptimizationForEmbedded_block_invoke()
{
  _BOOL8 result;

  result = (_os_feature_enabled_impl() & 1) != 0
        || VCDefaults_GetBoolValueForKey(CFSTR("forceEnablePreviewMSROptimizationForEmbedded"), 0);
  VCFeatureFlagManager_PreviewMSROptimizationForEmbedded_result = result;
  return result;
}

void __VCFeatureFlagManager_SkipNonInfraWiFiAssertion_block_invoke()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = _os_feature_enabled_impl();
  VCFeatureFlagManager_SkipNonInfraWiFiAssertion_result = v0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_impl(&dword_1D8A54000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SkipNonInfraWiFiAssertion=%d", (uint8_t *)v1, 8u);
  }
}

void __VCFeatureFlagManager_UseShortMKI_block_invoke()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = _os_feature_enabled_impl();
  VCFeatureFlagManager_UseShortMKI_result = v0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_impl(&dword_1D8A54000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "ShortMKI=%{BOOL}d", (uint8_t *)v1, 8u);
  }
}

void __VCFeatureFlagManager_UseTLE_block_invoke()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = _os_feature_enabled_impl();
  VCFeatureFlagManager_UseTLE_result = v0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_impl(&dword_1D8A54000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TransportLevelEncryption=%{BOOL}d", (uint8_t *)v1, 8u);
  }
}

uint64_t __VCFeatureFlagManager_UseAnalyzerSpeechAPI_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  VCFeatureFlagManager_UseAnalyzerSpeechAPI_flag = result;
  return result;
}

uint64_t __VCFeatureFlagManager_UseBlockDurationHinting_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
    result = _os_feature_enabled_impl();
  VCFeatureFlagManager_UseBlockDurationHinting_flag = result;
  return result;
}

uint64_t __VCFeatureFlagManager_RecordingResiliencyEnabled_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  VCFeatureFlagManager_RecordingResiliencyEnabled_flag = result;
  return result;
}

uint64_t __VCFeatureFlagManager_LocalRecordingEnabled_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  VCFeatureFlagManager_LocalRecordingEnabled_flag = result;
  return result;
}

uint64_t __VCFeatureFlagManager_CallRecordingEnabled_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  VCFeatureFlagManager_CallRecordingEnabled_flag = result;
  return result;
}

@end
