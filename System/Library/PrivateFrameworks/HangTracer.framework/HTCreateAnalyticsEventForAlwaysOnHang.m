@implementation HTCreateAnalyticsEventForAlwaysOnHang

void __HTCreateAnalyticsEventForAlwaysOnHang_block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();

}

id __HTCreateAnalyticsEventForAlwaysOnHang_block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _DWORD v26[4];
  statfs v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  HTPrefsQueue();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HTTelemetryCheckForUpdates(v2);

  if (HTGatherHomeVolumeSpaceInfo_onceToken != -1)
    dispatch_once(&HTGatherHomeVolumeSpaceInfo_onceToken, &__block_literal_global_137);
  if (!HTGatherHomeVolumeSpaceInfo_homeURL)
    goto LABEL_8;
  memset(&v27, 0, 512);
  if (statfs((const char *)objc_msgSend((id)HTGatherHomeVolumeSpaceInfo_homeURL, "fileSystemRepresentation"), &v27))
  {
    shared_ht_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *__error();
      v26[0] = 67109120;
      v26[1] = v4;
      _os_log_impl(&dword_1AF62F000, v3, OS_LOG_TYPE_DEFAULT, "Unable to get volume space info: %{errno}d", (uint8_t *)v26, 8u);
    }

LABEL_8:
    v5 = 0;
    v6 = 0;
    goto LABEL_10;
  }
  v5 = v27.f_blocks * v27.f_bsize;
  v6 = v27.f_bavail * v27.f_bsize;
LABEL_10:
  +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numOSCryptexFileExtents");

  +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "haveRootsInstalled");

  +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "haveNonDefaultFeatureFlags");

  +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "haveSerialLoggingEnabled");

  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", kHTCoreAnalyticsAlwaysOn, kHTCoreAnalyticsMode);
  getStringForSubtype(*(_QWORD *)(a1 + 40));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, kHTCoreAnalyticsHangType);

  objc_msgSend(v15, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), kHTCoreAnalyticsHangBundleID);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, kHTCoreAnalyticsHangDuration);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v6 * 100.0 / (double)v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, kHTCoreAnalyticsDiskAvailablePercent);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, kHTCoreAnalyticsDiskAvailableBytes);

  }
  if ((int)v8 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, kHTCoreAnalyticsNumOSCryptexFileExtents);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, kHTCoreAnalyticsHaveNonDefaultFeatureFlags);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, kHTCoreAnalyticsHaveSerialLoggingEnabled);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, kHTCoreAnalyticsHaveRootsInstalled);

  shared_ht_log_handle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v27.f_bsize = 138412290;
    *(_QWORD *)&v27.f_iosize = v15;
    _os_log_impl(&dword_1AF62F000, v24, OS_LOG_TYPE_INFO, "Logging always-on telemetry: %@", (uint8_t *)&v27, 0xCu);
  }

  return v15;
}

@end
