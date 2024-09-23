@implementation CAMInternalStorage

- (CAMInternalStorage)init
{
  CAMInternalStorage *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *cacheDeleteQueryQueue;
  NSByteCountFormatter *v6;
  NSByteCountFormatter *byteFormatter;
  void *v8;
  void *v9;
  uint64_t v10;
  NSURL *storageMountPoint;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CAMInternalStorage;
  v2 = -[CAMInternalStorage init](&v16, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.camera.cachedelete", v3);
    cacheDeleteQueryQueue = v2->__cacheDeleteQueryQueue;
    v2->__cacheDeleteQueryQueue = (OS_dispatch_queue *)v4;

    v2->__cachedLowDiskThreshold = 0;
    v2->fastPurgeableBytes = 0;
    v2->slowPurgeableBytes = 0;
    v2->freeBytes = 0;
    v6 = (NSByteCountFormatter *)objc_alloc_init(MEMORY[0x1E0CB34E8]);
    byteFormatter = v2->__byteFormatter;
    v2->__byteFormatter = v6;

    -[NSByteCountFormatter setAllowedUnits:](v2->__byteFormatter, "setAllowedUnits:", 8);
    -[NSByteCountFormatter setCountStyle:](v2->__byteFormatter, "setCountStyle:", 3);
    -[NSByteCountFormatter setIncludesActualByteCount:](v2->__byteFormatter, "setIncludesActualByteCount:", 0);
    v8 = (void *)MEMORY[0x1E0C99E98];
    NSHomeDirectory();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    storageMountPoint = v2->__storageMountPoint;
    v2->__storageMountPoint = (NSURL *)v10;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v2->__isLockScreenExtension = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.camera.lockscreen"));
    -[CAMInternalStorage _loadFreeDiskThresholds](v2, "_loadFreeDiskThresholds");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__legacyDiskSpaceDidBecomeLowNotification, *MEMORY[0x1E0D73E50], 0);

  }
  return v2;
}

- (void)_setPurging:(BOOL)a3
{
  id v4;

  if (self->__purging != a3)
  {
    self->__purging = a3;
    -[CAMInternalStorage delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storageControllerDidChangePurgingState:", self);

  }
}

- (BOOL)isCancelingPurge
{
  _BOOL4 v3;

  v3 = -[CAMInternalStorage isPurging](self, "isPurging");
  if (v3)
    LOBYTE(v3) = -[CAMInternalStorage _shouldCancelNextPurge](self, "_shouldCancelNextPurge");
  return v3;
}

- (void)_setShouldCancelNextPurge:(BOOL)a3
{
  id v4;

  if (self->__shouldCancelNextPurge != a3)
  {
    self->__shouldCancelNextPurge = a3;
    -[CAMInternalStorage delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storageControllerDidChangePurgingState:", self);

  }
}

- (void)_setCachedEstimatedSpace:(id *)a3
{
  __int128 v7;
  uint64_t v8;
  _QWORD v9[8];

  -[CAMInternalStorage _cachedEstimatedSpace](self, "_cachedEstimatedSpace");
  if (v9[5] != a3->var0 || v9[6] != a3->var1 || v9[7] != a3->var2)
  {
    v7 = *(_OWORD *)&a3->var0;
    self->slowPurgeableBytes = a3->var2;
    v8 = MEMORY[0x1E0C809B0];
    *(_OWORD *)&self->freeBytes = v7;
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __47__CAMInternalStorage__setCachedEstimatedSpace___block_invoke;
    v9[3] = &unk_1EA328868;
    v9[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], v9);
  }
}

void __47__CAMInternalStorage__setCachedEstimatedSpace___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableDiskSpaceChanged:", *(_QWORD *)(a1 + 32));

}

- (void)setGraphConfiguration:(id)a3
{
  CAMCaptureGraphConfiguration *v5;
  CAMCaptureGraphConfiguration *v6;

  v5 = (CAMCaptureGraphConfiguration *)a3;
  if (self->_graphConfiguration != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_graphConfiguration, a3);
    -[CAMInternalStorage _updateAvailablePurgeableSpaceAsync](self, "_updateAvailablePurgeableSpaceAsync");
    v5 = v6;
  }

}

- (void)_setFastPurgeThreshold:(int64_t)a3
{
  NSObject *v4;
  __CFString *v5;
  int v6;
  __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->__fastPurgeThreshold != a3)
  {
    self->__fastPurgeThreshold = a3;
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a3 > 2)
        v5 = 0;
      else
        v5 = off_1EA32FD50[a3];
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "CAMStorageController: changed fast purge threshold to %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (BOOL)hasDiskSpaceToAllowCaptureWithConfiguration:(id)a3 allowPurging:(BOOL)a4
{
  return -[CAMInternalStorage hasDiskSpaceToAllowCaptureWithConfiguration:allowPurging:verbose:](self, "hasDiskSpaceToAllowCaptureWithConfiguration:allowPurging:verbose:", a3, a4, 0);
}

- (BOOL)hasDiskSpaceToAllowCaptureWithConfiguration:(id)a3 allowPurging:(BOOL)a4 verbose:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  const char *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v5 = a5;
  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = -[CAMInternalStorage totalFreeBytes](self, "totalFreeBytes");
  v10 = -[CAMInternalStorage _absoluteMinimumBytesForMode:](self, "_absoluteMinimumBytesForMode:", objc_msgSend(v8, "mode"));
  v11 = -[CAMInternalStorage minimumDiskUsageThresholdInBytesForGraphConfiguration:](self, "minimumDiskUsageThresholdInBytesForGraphConfiguration:", v8);
  if (v10 <= v11)
    v10 = v11;
  if (v9 <= v10)
  {
    v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMInternalStorage _stringFromByteCount:](self, "_stringFromByteCount:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMInternalStorage _stringFromByteCount:](self, "_stringFromByteCount:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v13;
      v19 = 2114;
      v20 = v14;
      v15 = "CAMStorageController: Total free disk %{public}@ lower than absolute minimum for this mode (%{public}@)";
      goto LABEL_12;
    }
  }
  else if (v9 >= 2 * v10)
  {
    if (!v5)
      goto LABEL_14;
    v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMInternalStorage _stringFromByteCount:](self, "_stringFromByteCount:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMInternalStorage _stringFromByteCount:](self, "_stringFromByteCount:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v13;
      v19 = 2114;
      v20 = v14;
      v15 = "CAMStorageController: Total free disk (%{public}@) exceeds absolute minimum for this mode (%{public}@)";
      goto LABEL_12;
    }
  }
  else
  {
    v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMInternalStorage _stringFromByteCount:](self, "_stringFromByteCount:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMInternalStorage _stringFromByteCount:](self, "_stringFromByteCount:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v13;
      v19 = 2114;
      v20 = v14;
      v15 = "CAMStorageController: Total free disk (%{public}@) approaching absolute minimum for this mode (%{public}@)";
LABEL_12:
      _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, 0x16u);

    }
  }

LABEL_14:
  if (v6)
    -[CAMInternalStorage _updatePurgeRequestStateForConfiguration:totalFreeBytes:](self, "_updatePurgeRequestStateForConfiguration:totalFreeBytes:", v8, v9);

  return v9 > v10;
}

- (void)reportLowDiskEventWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;
  BOOL v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hostProcess");
  if (v6 <= 4 && ((1 << v6) & 0x15) != 0)
  {
    +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "preferredMinimumFreeBytes");
    if (objc_msgSend(v5, "isInternalInstall"))
      v10 = v9 <= 0;
    else
      v10 = 1;
    if (v10)
    {
      objc_initWeak(&location, self);
      -[CAMInternalStorage _cacheDeleteQueryQueue](self, "_cacheDeleteQueryQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__CAMInternalStorage_reportLowDiskEventWithIdentifier___block_invoke;
      block[3] = &unk_1EA328F00;
      objc_copyWeak(&v14, &location);
      v13 = v4;
      dispatch_async(v11, block);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }

  }
}

void __55__CAMInternalStorage_reportLowDiskEventWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queryQueue_aggregateLowDiskEventWithIdentifier:", *(_QWORD *)(a1 + 32));

}

- (double)availableRecordingTimeInSecondsForGraphConfiguration:(id)a3
{
  id v4;
  unint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  double v12;
  double v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "mode");
  if (v5 > 8 || ((1 << v5) & 0x186) == 0)
  {
    v13 = 0.0;
  }
  else
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "bytesPerMinuteForGraphConfiguration:outputToExternalStorage:", v4, 0);
    if (v8)
    {
      v9 = v8;
      v10 = -[CAMInternalStorage totalFreeBytes](self, "totalFreeBytes");
      v11 = -[CAMInternalStorage minimumDiskUsageThresholdInBytesForGraphConfiguration:](self, "minimumDiskUsageThresholdInBytesForGraphConfiguration:", v4);
      v12 = (double)(v10 - v11) * 60.0;
      if (v10 <= v11)
        v12 = 0.0;
      v13 = v12 / (double)v9;
    }
    else
    {
      v13 = 0.0;
    }

  }
  return v13;
}

- (double)_availableRecordingTimeInMinutesForFreeBytes:(int64_t)a3 minimumDiskUsageThreshold:(int64_t)a4 bytesPerMinute:(int64_t)a5
{
  if (a5 < 1)
    return 0.0;
  else
    return (double)(a3 - a4) / (double)a5;
}

- (int64_t)minimumDiskUsageThresholdInBytesForGraphConfiguration:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  double v14;
  double v15;
  int64_t v16;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CAMInternalStorage _absoluteMinimumBytesForMode:](self, "_absoluteMinimumBytesForMode:", objc_msgSend(v4, "mode"));
  v6 = objc_msgSend(v4, "videoEncodingBehavior");

  if (v6 != 2)
    return v5;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CAMInternalStorage _proResMinimumDiskUsageThreshold](self, "_proResMinimumDiskUsageThreshold"))
  {
    v8 = (double)-[CAMInternalStorage _totalBytes](self, "_totalBytes");
    v9 = (uint64_t)(v8 * 0.1);
    if (objc_msgSend(v7, "proResMinimumDiskSpaceOverrideMegabytesRelativeToFreeSpace"))
    {
      v10 = -[CAMInternalStorage totalFreeBytes](self, "totalFreeBytes");
      v11 = v10 + (objc_msgSend(v7, "proResMinimumDiskSpaceOverrideMegabytesRelativeToFreeSpace") << 20);
      v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v18 = 134218240;
        *(_QWORD *)&v18[4] = v11;
        *(_WORD *)&v18[12] = 2048;
        *(_QWORD *)&v18[14] = (uint64_t)(v8 * 0.1);
        v13 = "CAMStorageController: overriding ProRes minimum disk usage threshold to be %lld (used relative override). Default is %lld";
LABEL_9:
        _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, v13, v18, 0x16u);
      }
    }
    else
    {
      objc_msgSend(v7, "proResMinimumDiskSpaceOverrideAsFractionOfSystemTotal");
      if (v14 == 0.0)
      {
LABEL_11:
        -[CAMInternalStorage _setProResMinimumDiskUsageThreshold:](self, "_setProResMinimumDiskUsageThreshold:", v9, *(_OWORD *)v18, *(_QWORD *)&v18[16], v19);
        goto LABEL_12;
      }
      objc_msgSend(v7, "proResMinimumDiskSpaceOverrideAsFractionOfSystemTotal");
      v11 = (uint64_t)(v15 * v8);
      v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v18 = 134218240;
        *(_QWORD *)&v18[4] = v11;
        *(_WORD *)&v18[12] = 2048;
        *(_QWORD *)&v18[14] = (uint64_t)(v8 * 0.1);
        v13 = "CAMStorageController: overriding ProRes minimum disk usage threshold to be %lld (used fraction override). Default is %lld";
        goto LABEL_9;
      }
    }

    v9 = v11;
    goto LABEL_11;
  }
LABEL_12:
  v16 = -[CAMInternalStorage _proResMinimumDiskUsageThreshold](self, "_proResMinimumDiskUsageThreshold");
  if (v5 <= v16)
    v5 = v16;

  return v5;
}

- (void)_updateAvailablePurgeableSpaceAsync
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12[3];
  id location;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCacheDeleteSupported");

  if (v4)
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMInternalStorage graphConfiguration](self, "graphConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "bytesPerMinuteForGraphConfiguration:outputToExternalStorage:", v6, 0);

    -[CAMInternalStorage graphConfiguration](self, "graphConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CAMInternalStorage minimumDiskUsageThresholdInBytesForGraphConfiguration:](self, "minimumDiskUsageThresholdInBytesForGraphConfiguration:", v8);

    objc_initWeak(&location, self);
    -[CAMInternalStorage _cacheDeleteQueryQueue](self, "_cacheDeleteQueryQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__CAMInternalStorage__updateAvailablePurgeableSpaceAsync__block_invoke;
    v11[3] = &unk_1EA32A9C0;
    objc_copyWeak(v12, &location);
    v12[1] = v7;
    v12[2] = v9;
    dispatch_async(v10, v11);

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
}

void __57__CAMInternalStorage__updateAvailablePurgeableSpaceAsync__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queryQueue_queryAvailableSpaceAndUpdateCachedEstimatesForBytesPerMinute:minimumDiskUsageThreshold:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (int64_t)_fastPurgeThresholdForRequestType:(int64_t)a3
{
  if (a3)
    return 2 * (a3 == 1);
  else
    return 1;
}

- (int64_t)_requestTypeFromNonZeroFastPurgeThreshold:(int64_t)a3
{
  return a3 == 2;
}

- (void)purgeFastPurgeableSpaceWithRequestType:(int64_t)a3
{
  -[CAMInternalStorage _purgeFastPurgeableSpaceWithThreshold:calledFromPurgeCompletion:forceStopReason:analyticsEvent:](self, "_purgeFastPurgeableSpaceWithThreshold:calledFromPurgeCompletion:forceStopReason:analyticsEvent:", -[CAMInternalStorage _fastPurgeThresholdForRequestType:](self, "_fastPurgeThresholdForRequestType:", a3), 0, 0, 0);
}

- (void)_purgeFastPurgeableSpaceWithThreshold:(int64_t)a3 calledFromPurgeCompletion:(BOOL)a4 forceStopReason:(id)a5 analyticsEvent:(id)a6
{
  _BOOL4 v7;
  id v10;
  CAMAnalyticsProResPurgeEvent *v11;
  void *v12;
  int v13;
  int64_t v14;
  CAMAnalyticsProResPurgeEvent *v15;
  void *v16;
  uint64_t v17;
  CAMAnalyticsProResPurgeEvent *v18;
  void (**v19)(_QWORD);
  void (**v20)(_QWORD);
  __CFString *v21;
  void *v22;
  double v23;
  double v24;
  NSObject *v25;
  __CFString *v26;
  __CFString *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  _QWORD block[4];
  CAMAnalyticsProResPurgeEvent *v32;
  void (**v33)(_QWORD);
  id v34[2];
  _QWORD v35[5];
  CAMAnalyticsProResPurgeEvent *v36;
  _QWORD aBlock[4];
  CAMAnalyticsProResPurgeEvent *v38;
  id v39;
  id location;
  uint8_t buf[4];
  __CFString *v42;
  uint64_t v43;

  v7 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = (CAMAnalyticsProResPurgeEvent *)a6;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isCacheDeleteSupported");

  if (v13)
  {
    if (a3 && !v11)
    {
      v14 = -[CAMInternalStorage _requestTypeFromNonZeroFastPurgeThreshold:](self, "_requestTypeFromNonZeroFastPurgeThreshold:", a3);
      v15 = [CAMAnalyticsProResPurgeEvent alloc];
      -[CAMInternalStorage graphConfiguration](self, "graphConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[CAMAnalyticsProResPurgeEvent initWithRequestType:graphConfiguration:totalBytesInSystem:](v15, "initWithRequestType:graphConfiguration:totalBytesInSystem:", v14, v16, -[CAMInternalStorage _totalBytes](self, "_totalBytes"));

    }
    objc_initWeak(&location, self);
    v17 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __117__CAMInternalStorage__purgeFastPurgeableSpaceWithThreshold_calledFromPurgeCompletion_forceStopReason_analyticsEvent___block_invoke;
    aBlock[3] = &unk_1EA328F00;
    objc_copyWeak(&v39, &location);
    v18 = v11;
    v38 = v18;
    v19 = (void (**)(_QWORD))_Block_copy(aBlock);
    v35[0] = v17;
    v35[1] = 3221225472;
    v35[2] = __117__CAMInternalStorage__purgeFastPurgeableSpaceWithThreshold_calledFromPurgeCompletion_forceStopReason_analyticsEvent___block_invoke_2;
    v35[3] = &unk_1EA328A40;
    v35[4] = self;
    v11 = v18;
    v36 = v11;
    v20 = (void (**)(_QWORD))_Block_copy(v35);
    if (v7 && -[CAMInternalStorage _shouldCancelNextPurge](self, "_shouldCancelNextPurge"))
    {
      -[CAMAnalyticsProResPurgeEvent updateForCancelRequest](v11, "updateForCancelRequest");
      v21 = CFSTR("honoring cancelation");
LABEL_29:
      v29 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v42 = v21;
        _os_log_impl(&dword_1DB760000, v29, OS_LOG_TYPE_DEFAULT, "CAMStorageController: stopping purge (%{public}@)", buf, 0xCu);
      }

      v19[2](v19);
LABEL_36:

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
      goto LABEL_37;
    }
    if (v10)
    {
      v21 = (__CFString *)v10;
      if (v7)
        goto LABEL_29;
    }
    else if (-[CAMInternalStorage hasPurgeableResources](self, "hasPurgeableResources"))
    {
      if (a3)
      {
        if (a3 != 1
          || (-[CAMInternalStorage graphConfiguration](self, "graphConfiguration"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              -[CAMInternalStorage availableRecordingTimeInSecondsForGraphConfiguration:](self, "availableRecordingTimeInSecondsForGraphConfiguration:", v22), v24 = v23, v22, v24 < 300.0))
        {
          v25 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = CFSTR("ProResAutoPurgeRecordTime");
            if (a3 != 1)
              v26 = 0;
            if (a3 == 2)
              v26 = CFSTR("Infinite");
            v27 = v26;
            *(_DWORD *)buf = 138543362;
            v42 = v27;
            _os_log_impl(&dword_1DB760000, v25, OS_LOG_TYPE_DEFAULT, "CAMStorageController: Kicking off a fast purge (threshold: %{public}@)", buf, 0xCu);

          }
          -[CAMInternalStorage _setPurging:](self, "_setPurging:", 1);
          -[CAMInternalStorage _setFastPurgeThreshold:](self, "_setFastPurgeThreshold:", a3);
          -[CAMInternalStorage _setShouldCancelNextPurge:](self, "_setShouldCancelNextPurge:", 0);
          -[CAMInternalStorage _cacheDeleteQueryQueue](self, "_cacheDeleteQueryQueue");
          v28 = objc_claimAutoreleasedReturnValue();
          block[0] = v17;
          block[1] = 3221225472;
          block[2] = __117__CAMInternalStorage__purgeFastPurgeableSpaceWithThreshold_calledFromPurgeCompletion_forceStopReason_analyticsEvent___block_invoke_17;
          block[3] = &unk_1EA32FC90;
          objc_copyWeak(v34, &location);
          v34[1] = (id)a3;
          v32 = v11;
          v33 = v19;
          dispatch_async(v28, block);

          objc_destroyWeak(v34);
          v21 = 0;
          goto LABEL_36;
        }
        if (v7)
        {
          v21 = CFSTR("above auto purge threshold");
          goto LABEL_29;
        }
        v20[2](v20);
        v21 = CFSTR("above auto purge threshold");
      }
      else
      {
        v21 = CFSTR("zero threshold");
        if (v7)
          goto LABEL_29;
      }
    }
    else
    {
      if (v7)
      {
        v21 = CFSTR("no purgeable resources");
        goto LABEL_29;
      }
      v20[2](v20);
      v21 = CFSTR("no purgeable resources");
    }
    v30 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v42 = v21;
      _os_log_impl(&dword_1DB760000, v30, OS_LOG_TYPE_DEFAULT, "CAMStorageController: ignoring purge request (%{public}@)", buf, 0xCu);
    }

    goto LABEL_36;
  }
LABEL_37:

}

void __117__CAMInternalStorage__purgeFastPurgeableSpaceWithThreshold_calledFromPurgeCompletion_forceStopReason_analyticsEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setPurging:", 0);
  objc_msgSend(WeakRetained, "_setShouldCancelNextPurge:", 0);
  objc_msgSend(WeakRetained, "_setFastPurgeThreshold:", 0);
  objc_msgSend(*(id *)(a1 + 32), "publish");

}

uint64_t __117__CAMInternalStorage__purgeFastPurgeableSpaceWithThreshold_calledFromPurgeCompletion_forceStopReason_analyticsEvent___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "_cachedEstimatedSpace");
    v3 = *(void **)(a1 + 32);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "graphConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availableRecordingTimeInSecondsForGraphConfiguration:", v4);
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 40), "updateForSkippedPurgeOperationWithFreeBytes:fastPurgeableBytes:slowPurgeableBytes:maxRecordingTimeSeconds:", objc_msgSend(*(id *)(a1 + 32), "totalFreeBytes"), 0, 0, v6);
  return objc_msgSend(*(id *)(a1 + 40), "publish");
}

void __117__CAMInternalStorage__purgeFastPurgeableSpaceWithThreshold_calledFromPurgeCompletion_forceStopReason_analyticsEvent___block_invoke_17(uint64_t a1)
{
  id WeakRetained;
  _QWORD block[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_queryQueue_purgeFastPurgeableResourcesWithThreshold:analyticsEvent:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
  if (!objc_msgSend(WeakRetained, "_queryQueue_currentToken"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __117__CAMInternalStorage__purgeFastPurgeableSpaceWithThreshold_calledFromPurgeCompletion_forceStopReason_analyticsEvent___block_invoke_2_18;
    block[3] = &unk_1EA32BB70;
    v4 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __117__CAMInternalStorage__purgeFastPurgeableSpaceWithThreshold_calledFromPurgeCompletion_forceStopReason_analyticsEvent___block_invoke_2_18(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB760000, v2, OS_LOG_TYPE_DEFAULT, "CAMStorageController: Did not successfully purge, resetting state", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)hasPurgeableResources
{
  void *v3;
  void *v4;
  uint64_t v5;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMInternalStorage graphConfiguration](self, "graphConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "bytesPerMinuteForGraphConfiguration:outputToExternalStorage:", v4, 0);

  -[CAMInternalStorage _cachedEstimatedSpace](self, "_cachedEstimatedSpace");
  return 10 * (v5 / 60) < 0;
}

- (void)cancelPurge
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id buf[2];

  if (-[CAMInternalStorage _purging](self, "_purging"))
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "CAMStorageController: Requesting to cancel purge", (uint8_t *)buf, 2u);
    }

    -[CAMInternalStorage _setShouldCancelNextPurge:](self, "_setShouldCancelNextPurge:", 1);
    objc_initWeak(buf, self);
    -[CAMInternalStorage _cacheDeleteQueryQueue](self, "_cacheDeleteQueryQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__CAMInternalStorage_cancelPurge__block_invoke;
    block[3] = &unk_1EA329490;
    objc_copyWeak(&v6, buf);
    dispatch_async(v4, block);

    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

void __33__CAMInternalStorage_cancelPurge__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queryQueue_cancelCurrentPurge");

}

- (void)_queryQueue_purgeFastPurgeableResourcesWithThreshold:(int64_t)a3 analyticsEvent:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  double v26;
  CFAbsoluteTime Current;
  void *v28;
  uint64_t v29;
  _QWORD aBlock[5];
  id v31;
  CFAbsoluteTime v32;
  uint64_t v33;
  int64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[4];
  _QWORD v40[4];
  uint8_t v41[4];
  id v42;
  uint8_t buf[16];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CAMInternalStorage _cacheDeleteQueryQueue](self, "_cacheDeleteQueryQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (-[CAMInternalStorage _queryQueue_currentToken](self, "_queryQueue_currentToken"))
  {
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "CAMStorageController: Ignoring request to purge since we have an active token";
      v10 = v8;
      v11 = 2;
LABEL_4:
      _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }
  else
  {
    if (!a3)
    {
      v8 = os_log_create("com.apple.camera", "Camera");
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = CFSTR("Zero");
      v9 = "CAMStorageController: Ignoring request to purge, threshold set to %{public}@";
      v10 = v8;
      v11 = 12;
      goto LABEL_4;
    }
    -[CAMInternalStorage _cacheDeleteVolume](self, "_cacheDeleteVolume");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMInternalStorage graphConfiguration](self, "graphConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "bytesPerMinuteForGraphConfiguration:outputToExternalStorage:", v13, 0);

      -[CAMInternalStorage graphConfiguration](self, "graphConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[CAMInternalStorage minimumDiskUsageThresholdInBytesForGraphConfiguration:](self, "minimumDiskUsageThresholdInBytesForGraphConfiguration:", v15);

      memset(buf, 0, sizeof(buf));
      v44 = 0;
      -[CAMInternalStorage _queryQueue_queryAvailableSpaceAndUpdateCachedEstimatesForBytesPerMinute:minimumDiskUsageThreshold:](self, "_queryQueue_queryAvailableSpaceAndUpdateCachedEstimatesForBytesPerMinute:minimumDiskUsageThreshold:", v14, v16);
      if (10 * (v14 / 60) >= 0)
      {
        v23 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v41 = 134217984;
          v42 = *(id *)&buf[8];
          _os_log_impl(&dword_1DB760000, v23, OS_LOG_TYPE_DEFAULT, "CAMStorageController ignoring request to purge space since there is only %lld of fast purgeable space available", v41, 0xCu);
        }
      }
      else
      {
        v17 = *(_QWORD *)buf;
        if (v14 <= v16 + 10 * (v14 / 60) - *(_QWORD *)buf)
          v18 = v16 + 10 * (v14 / 60) - *(_QWORD *)buf;
        else
          v18 = v14;
        v40[0] = v8;
        v39[0] = CFSTR("CACHE_DELETE_VOLUME");
        v39[1] = CFSTR("CACHE_DELETE_AMOUNT");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = v19;
        v39[2] = CFSTR("CACHE_DELETE_URGENCY_LIMIT");
        v20 = (void *)MEMORY[0x1E0CB37E8];
        +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "numberWithInt:", objc_msgSend(v21, "cacheDeleteUrgency"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v39[3] = CFSTR("CACHE_DELETE_SERVICES");
        v40[2] = v22;
        v40[3] = &unk_1EA3B3AB8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
        v23 = objc_claimAutoreleasedReturnValue();

        v24 = -[NSObject mutableCopy](v23, "mutableCopy");
        -[CAMInternalStorage _copyAndApplyByteStringFormattingFromDictionary:toDictionary:keys:](self, "_copyAndApplyByteStringFormattingFromDictionary:toDictionary:keys:", v23, v24, &unk_1EA3B3AD0);
        v25 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v41 = 138543362;
          v42 = v24;
          _os_log_impl(&dword_1DB760000, v25, OS_LOG_TYPE_DEFAULT, "CAMStorageController fast purge request: %{public}@", v41, 0xCu);
        }

        -[CAMInternalStorage _availableRecordingTimeInMinutesForFreeBytes:minimumDiskUsageThreshold:bytesPerMinute:](self, "_availableRecordingTimeInMinutesForFreeBytes:minimumDiskUsageThreshold:bytesPerMinute:", v17, v16, v14);
        objc_msgSend(v6, "updateBeforePurgeOperationWithFreeBytes:fastPurgeableBytes:slowPurgeableBytes:maxRecordingTimeSeconds:", v17, *(_QWORD *)&buf[8], v44, v26 * 60.0);
        Current = CFAbsoluteTimeGetCurrent();
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __90__CAMInternalStorage__queryQueue_purgeFastPurgeableResourcesWithThreshold_analyticsEvent___block_invoke;
        aBlock[3] = &unk_1EA32FCE0;
        v32 = Current;
        aBlock[4] = self;
        v33 = v14;
        v34 = v16;
        v35 = *(_OWORD *)buf;
        v36 = v44;
        v37 = v29;
        v38 = 10 * (v14 / 60);
        v31 = v6;
        v28 = _Block_copy(aBlock);
        -[CAMInternalStorage set_queryQueue_currentToken:](self, "set_queryQueue_currentToken:", CacheDeletePurgeSpaceWithInfo());

      }
    }
  }
LABEL_19:

}

void __90__CAMInternalStorage__queryQueue_purgeFastPurgeableResourcesWithThreshold_analyticsEvent___block_invoke(uint64_t a1, void *a2)
{
  double Current;
  double v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  __int128 v15;
  uint64_t v16;
  double v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  id location;

  Current = CFAbsoluteTimeGetCurrent();
  v5 = *(double *)(a1 + 48);
  v6 = a2;
  v7 = objc_msgSend(*(id *)(a1 + 32), "totalFreeBytes");
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_cacheDeleteQueryQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__CAMInternalStorage__queryQueue_purgeFastPurgeableResourcesWithThreshold_analyticsEvent___block_invoke_2;
  v11[3] = &unk_1EA32FCB8;
  objc_copyWeak(&v14, &location);
  v15 = *(_OWORD *)(a1 + 56);
  v16 = v7;
  v9 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v17 = Current - v5;
  v18 = *(_OWORD *)(a1 + 72);
  v19 = *(_QWORD *)(a1 + 88);
  v20 = *(_OWORD *)(a1 + 96);
  v13 = v9;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __90__CAMInternalStorage__queryQueue_purgeFastPurgeableResourcesWithThreshold_analyticsEvent___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  const void *v20;
  const __CFString *v21;
  const __CFString *v23;
  _QWORD block[8];
  __int128 v25;
  uint64_t v26;
  _BYTE buf[24];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v25 = 0uLL;
  v26 = 0;
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "_queryQueue_queryAvailableSpaceAndUpdateCachedEstimatesForBytesPerMinute:minimumDiskUsageThreshold:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    v3 = *(void **)(a1 + 32);
  }
  objc_msgSend(v3, "_availableRecordingTimeInMinutesForFreeBytes:minimumDiskUsageThreshold:bytesPerMinute:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
  v5 = v4;
  v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "_copyAndApplyByteStringFormattingFromDictionary:toDictionary:keys:", *(_QWORD *)(a1 + 40), v6, &unk_1EA3B3AE8);
  v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 88);
    v9 = *(void **)(a1 + 32);
    *(_OWORD *)buf = v25;
    *(_QWORD *)&buf[16] = v26;
    objc_msgSend(v9, "_stringFromAvailableSpace:", buf);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_stringFromByteCount:", *(_QWORD *)(a1 + 80));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    v28 = v10;
    v29 = 2114;
    v30 = v11;
    v31 = 2048;
    v32 = v5;
    _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "CAMStorageController: Purge completed (%.3f seconds) with results: %{public}@\n%{public}@\n%{public}@ free\nAvailable time: %.2f minutes", buf, 0x34u);

  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "longLongValue");

  v14 = *(_QWORD *)(a1 + 104) - v13;
  v15 = v25;
  v16 = v26;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__CAMInternalStorage__queryQueue_purgeFastPurgeableResourcesWithThreshold_analyticsEvent___block_invoke_41;
  block[3] = &unk_1EA32E1F0;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = v25;
  block[6] = v14;
  block[7] = v26;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v17 = *(_QWORD *)(a1 + 120);
  v18 = *(_QWORD *)(a1 + 128);
  objc_msgSend(*(id *)(a1 + 32), "_availableRecordingTimeInMinutesForFreeBytes:minimumDiskUsageThreshold:bytesPerMinute:", v15, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 48), "updateAfterPurgeOperationWithFreeBytes:fastPurgeableBytes:slowPurgeableBytes:maxRecordingTimeSeconds:bytesPurged:", v15, v14, v16, v13, v19 * 60.0);
  v20 = (const void *)objc_msgSend(WeakRetained, "_queryQueue_currentToken");
  if (v20)
    CFRelease(v20);
  v21 = CFSTR("not enough purgeable space remaining");
  if (v14 >= v18)
    v21 = 0;
  if (v13 < v18 && v13 < v17)
    v23 = CFSTR("did not make significant progress");
  else
    v23 = v21;
  objc_msgSend(WeakRetained, "set_queryQueue_currentToken:", 0);
  objc_msgSend(WeakRetained, "_notifyDelegateOfPurgeCompletionAndUpdateContinuousPurgeWithForceStopWithReason:analyticsEvent:", v23, *(_QWORD *)(a1 + 48));

}

uint64_t __90__CAMInternalStorage__queryQueue_purgeFastPurgeableResourcesWithThreshold_analyticsEvent___block_invoke_41(uint64_t a1)
{
  __int128 v2;
  uint64_t v3;

  v2 = *(_OWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 56);
  return objc_msgSend(*(id *)(a1 + 32), "_setCachedEstimatedSpace:", &v2);
}

- (void)_queryQueue_cancelCurrentPurge
{
  NSObject *v3;
  CacheDeleteToken *v4;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  CacheDeleteToken *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[CAMInternalStorage _cacheDeleteQueryQueue](self, "_cacheDeleteQueryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[CAMInternalStorage _queryQueue_currentToken](self, "_queryQueue_currentToken");
  v5 = os_log_create("com.apple.camera", "Camera");
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = 138543362;
      v8 = -[CAMInternalStorage _queryQueue_currentToken](self, "_queryQueue_currentToken");
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "CAMStorageController canceling purge for token %{public}@", (uint8_t *)&v7, 0xCu);
    }

    -[CAMInternalStorage _queryQueue_currentToken](self, "_queryQueue_currentToken");
    CacheDeleteCancelPurge();
  }
  else
  {
    if (v6)
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "CAMStorageController could not cancel purge (invalid token)", (uint8_t *)&v7, 2u);
    }

  }
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)_queryQueue_queryAvailableSpaceAndUpdateCachedEstimatesForBytesPerMinute:(SEL)a3 minimumDiskUsageThreshold:(int64_t)a4
{
  NSObject *v9;
  void *v10;
  double Current;
  void *v12;
  double v13;
  int64_t v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;
  _QWORD v24[5];
  __int128 v25;
  int64_t var2;
  _BYTE buf[24];
  void *v28;
  __int16 v29;
  uint64_t v30;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  -[CAMInternalStorage _cacheDeleteQueryQueue](self, "_cacheDeleteQueryQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[CAMInternalStorage _cacheDeleteVolume](self, "_cacheDeleteVolume");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v31 = CFSTR("CACHE_DELETE_VOLUME");
    v32[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v12 = (void *)CacheDeleteCopyItemizedPurgeableSpaceWithInfo();
    v13 = CFAbsoluteTimeGetCurrent();
    retstr->var1 = 0;
    retstr->var2 = 0;
    retstr->var0 = 0;
    v14 = -[CAMInternalStorage totalFreeBytes](self, "totalFreeBytes");
    retstr->var0 = v14;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TOTAL_FSPURGEABLE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "longLongValue");
    retstr->var1 = v16;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TOTAL_AVAILABLE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    retstr->var2 = objc_msgSend(v17, "longLongValue") - v16;

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __121__CAMInternalStorage__queryQueue_queryAvailableSpaceAndUpdateCachedEstimatesForBytesPerMinute_minimumDiskUsageThreshold___block_invoke;
    v24[3] = &unk_1EA32E1F0;
    v24[4] = self;
    v25 = *(_OWORD *)&retstr->var0;
    var2 = retstr->var2;
    dispatch_async(MEMORY[0x1E0C80D38], v24);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMInternalStorage _copyAndApplyByteStringFormattingFromDictionary:toDictionary:keys:](self, "_copyAndApplyByteStringFormattingFromDictionary:toDictionary:keys:", v12, v18, &unk_1EA3B3B00);
    -[CAMInternalStorage _copyFromDictionary:toDictionary:keys:](self, "_copyFromDictionary:toDictionary:keys:", v12, v18, &unk_1EA3B3B18);
    -[CAMInternalStorage _availableRecordingTimeInMinutesForFreeBytes:minimumDiskUsageThreshold:bytesPerMinute:](self, "_availableRecordingTimeInMinutesForFreeBytes:minimumDiskUsageThreshold:bytesPerMinute:", v14, a5, a4);
    v20 = v19;
    v21 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_OWORD *)buf = *(_OWORD *)&retstr->var0;
      *(_QWORD *)&buf[16] = retstr->var2;
      -[CAMInternalStorage _stringFromAvailableSpace:](self, "_stringFromAvailableSpace:", buf);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      *(double *)&buf[4] = v13 - Current;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2114;
      v28 = v22;
      v29 = 2048;
      v30 = v20;
      _os_log_impl(&dword_1DB760000, v21, OS_LOG_TYPE_DEFAULT, "CAMStorageController _queryAvailableSpace (%.3f seconds)\nCacheDeleteCopyItemizedPurgeableSpaceWithInfo: %{public}@ \n%{public}@\nAvailable time: %.2f minutes", buf, 0x2Au);

    }
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }

  return result;
}

uint64_t __121__CAMInternalStorage__queryQueue_queryAvailableSpaceAndUpdateCachedEstimatesForBytesPerMinute_minimumDiskUsageThreshold___block_invoke(uint64_t a1)
{
  __int128 v2;
  uint64_t v3;

  v2 = *(_OWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 56);
  return objc_msgSend(*(id *)(a1 + 32), "_setCachedEstimatedSpace:", &v2);
}

- (id)_cacheDeleteVolume
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CAMInternalStorage__cacheDeleteVolume__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  if (_cacheDeleteVolume_onceToken != -1)
    dispatch_once(&_cacheDeleteVolume_onceToken, block);
  return (id)_cacheDeleteVolume_volume;
}

void __40__CAMInternalStorage__cacheDeleteVolume__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  statfs v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memset(&v7.f_mntonname[392], 0, 32);
  objc_msgSend(*(id *)(a1 + 32), "_storageMountPoint", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = statfs((const char *)objc_msgSend(v2, "fileSystemRepresentation"), &v7);

  if (v3)
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __40__CAMInternalStorage__cacheDeleteVolume__block_invoke_cold_1(v4);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7.f_mntonname, 4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_cacheDeleteVolume_volume;
  _cacheDeleteVolume_volume = v5;

}

- (void)_statMountPoint:(statfs *)a3
{
  void *v5;
  id v6;
  int v7;
  NSObject *v8;

  -[CAMInternalStorage _storageMountPoint](self, "_storageMountPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = statfs((const char *)objc_msgSend(v6, "fileSystemRepresentation"), a3);

  if (v7)
  {
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CAMInternalStorage _statMountPoint:].cold.1(self, v8);

    bzero(a3, 0x878uLL);
  }
}

- (int64_t)totalFreeBytes
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (-[CAMInternalStorage _isLockScreenExtension](self, "_isLockScreenExtension"))
    return -[CAMInternalStorage _resourceValueForKey:](self, "_resourceValueForKey:", *MEMORY[0x1E0C99BB8]);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v4 = 0u;
  v5 = 0u;
  -[CAMInternalStorage _statMountPoint:](self, "_statMountPoint:", &v4);
  return *((_QWORD *)&v5 + 1) * v4;
}

- (int64_t)_resourceValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  int64_t v10;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", CFSTR("/"));
  v22[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v5, "resourceValuesForKeys:error:", v6, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;

  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[NSObject longValue](v9, "longValue");
  }
  else
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[CAMInternalStorage _storageMountPoint](self, "_storageMountPoint");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v4;
      v18 = 2114;
      v19 = v13;
      v20 = 2114;
      v21 = v14;
      _os_log_error_impl(&dword_1DB760000, v9, OS_LOG_TYPE_ERROR, "CAMStorageController: resourceValuesForKeys failed to get resource for key %{public}@ at storage mount point %{public}@ with error %{public}@", buf, 0x20u);

    }
    v10 = 0;
  }

  return v10;
}

- (int64_t)_totalBytes
{
  _OWORD v4[135];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (-[CAMInternalStorage _isLockScreenExtension](self, "_isLockScreenExtension"))
    return -[CAMInternalStorage _resourceValueForKey:](self, "_resourceValueForKey:", *MEMORY[0x1E0C99CF0]);
  memset(v4, 0, 512);
  -[CAMInternalStorage _statMountPoint:](self, "_statMountPoint:", v4);
  return *((_QWORD *)&v4[0] + 1) * LODWORD(v4[0]);
}

- (int64_t)_absoluteMinimumBytesForMode:(int64_t)a3
{
  void *v3;
  int64_t v4;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "minimumDiskSpaceReserved");

  return v4;
}

- (void)_loadFreeDiskThresholds
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_0(&dword_1DB760000, v1, v2, "CAMStorageController: fsctl for HFSIOC_GET_LOW_DISK failed: %s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_notifyDelegateOfPurgeCompletionAndUpdateContinuousPurgeWithForceStopWithReason:(id)a3 analyticsEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __117__CAMInternalStorage__notifyDelegateOfPurgeCompletionAndUpdateContinuousPurgeWithForceStopWithReason_analyticsEvent___block_invoke;
  block[3] = &unk_1EA329360;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __117__CAMInternalStorage__notifyDelegateOfPurgeCompletionAndUpdateContinuousPurgeWithForceStopWithReason_analyticsEvent___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_purgeFastPurgeableSpaceWithThreshold:calledFromPurgeCompletion:forceStopReason:analyticsEvent:", objc_msgSend(*(id *)(a1 + 32), "_fastPurgeThreshold"), 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableDiskSpaceChanged:", *(_QWORD *)(a1 + 32));

}

- (int64_t)_preferredMinimumBytesForConfiguration:(id)a3
{
  id v4;
  int64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = -[CAMInternalStorage _cachedLowDiskThreshold](self, "_cachedLowDiskThreshold");
  v6 = objc_msgSend(v4, "mode");
  if (v6 <= 9)
  {
    if (((1 << v6) & 0x259) != 0)
    {
      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(MEMORY[0x1E0C8B0E8], "maxLivePhotoDataSize");
      if (objc_msgSend(v7, "isLivePhotoSupported"))
        v9 = 4 * v8;
      else
        v9 = v8;
      goto LABEL_8;
    }
    if (((1 << v6) & 0x186) != 0)
    {
      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "bytesPerMinuteForGraphConfiguration:outputToExternalStorage:", v4, 0);
LABEL_8:
      v5 += v9;

    }
  }

  return v5;
}

- (void)_updatePurgeRequestStateForConfiguration:(id)a3 totalFreeBytes:(int64_t)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[4];
  id v19[3];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCacheDeleteSupported");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMInternalStorage _lastPurgeRequestUpdateTime](self, "_lastPurgeRequestUpdateTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10 || (objc_msgSend(v9, "timeIntervalSinceDate:", v10), v11 >= 60.0))
    {
      v12 = -[CAMInternalStorage _preferredMinimumBytesForConfiguration:](self, "_preferredMinimumBytesForConfiguration:", v6);
      -[CAMInternalStorage _byteFormatter](self, "_byteFormatter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((uint64_t)v12 > a4)
      {
        v14 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v13, "stringFromByteCount:", a4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringFromByteCount:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v21 = v15;
          v22 = 2114;
          v23 = v16;
          _os_log_impl(&dword_1DB760000, v14, OS_LOG_TYPE_DEFAULT, "CAMStorageController: Total free disk (%{public}@) is less than PREFERRED minimum for this mode (%{public}@)", buf, 0x16u);

        }
        -[CAMInternalStorage _setPurging:](self, "_setPurging:", 1);
        objc_initWeak((id *)buf, self);
        -[CAMInternalStorage _cacheDeleteQueryQueue](self, "_cacheDeleteQueryQueue");
        v17 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __78__CAMInternalStorage__updatePurgeRequestStateForConfiguration_totalFreeBytes___block_invoke;
        block[3] = &unk_1EA32A9C0;
        objc_copyWeak(v19, (id *)buf);
        v19[1] = (id)a4;
        v19[2] = v12;
        dispatch_async(v17, block);

        -[CAMInternalStorage set_lastPurgeRequestUpdateTime:](self, "set_lastPurgeRequestUpdateTime:", v9);
        objc_destroyWeak(v19);
        objc_destroyWeak((id *)buf);
      }

    }
  }

}

void __78__CAMInternalStorage__updatePurgeRequestStateForConfiguration_totalFreeBytes___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queryQueue_updatePurgeRequestStateForTotalFreeBytes:preferredFreeBytes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_queryQueue_aggregateLowDiskEventWithIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = a3;
  NSHomeDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  CacheDeleteRegisterLowDiskFailure();
}

- (void)_queryQueue_updatePurgeRequestStateForTotalFreeBytes:(int64_t)a3 preferredFreeBytes:(int64_t)a4
{
  NSObject *v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[3];
  _QWORD v25[3];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (-[CAMInternalStorage _queryQueue_currentToken](self, "_queryQueue_currentToken"))
  {
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "CAMStorageController: Ignoring request to purge preferred free bytes since we have an active token", buf, 2u);
    }
  }
  else
  {
    -[CAMInternalStorage _cacheDeleteVolume](self, "_cacheDeleteVolume");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v23[5] = 0;
      v8 = (void *)CacheDeleteCopyAvailableSpaceForVolume();
      v9 = a4 - a3;
      v10 = objc_msgSend(v8, "longLongValue");
      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "cacheDeleteUrgency");

      -[CAMInternalStorage _byteFormatter](self, "_byteFormatter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "stringFromByteCount:", v10 - a3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringFromByteCount:", v9);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if ((v12 + 1) > 5)
          v18 = 0;
        else
          v18 = off_1EA32FD68[(int)v12 + 1];
        *(_DWORD *)buf = 138543874;
        v27 = v15;
        v28 = 2114;
        v29 = v16;
        v30 = 2114;
        v31 = v18;
        _os_log_impl(&dword_1DB760000, v14, OS_LOG_TYPE_DEFAULT, "CAMStorageController: CacheDelete indicates %{public}@ bytes purgeable; requesting purge of %{public}@ at %{public}@ urgency",
          buf,
          0x20u);

      }
      v25[0] = v7;
      v24[0] = CFSTR("CACHE_DELETE_VOLUME");
      v24[1] = CFSTR("CACHE_DELETE_URGENCY_LIMIT");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v19;
      v24[2] = CFSTR("CACHE_DELETE_AMOUNT");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25[2] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __94__CAMInternalStorage__queryQueue_updatePurgeRequestStateForTotalFreeBytes_preferredFreeBytes___block_invoke;
      v23[3] = &unk_1EA32FD30;
      v23[4] = self;
      v22 = _Block_copy(v23);
      -[CAMInternalStorage set_queryQueue_currentToken:](self, "set_queryQueue_currentToken:", CacheDeletePurgeSpaceWithInfo());

    }
  }

}

void __94__CAMInternalStorage__queryQueue_updatePurgeRequestStateForTotalFreeBytes_preferredFreeBytes___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  _QWORD block[4];
  id v6[2];
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_cacheDeleteQueryQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__CAMInternalStorage__queryQueue_updatePurgeRequestStateForTotalFreeBytes_preferredFreeBytes___block_invoke_2;
  block[3] = &unk_1EA32FD08;
  objc_copyWeak(v6, &location);
  v6[1] = a2;
  dispatch_async(v4, block);

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __94__CAMInternalStorage__queryQueue_updatePurgeRequestStateForTotalFreeBytes_preferredFreeBytes___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  const void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "CAMStorageController: CacheDelete purge completed with result:%{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = (const void *)objc_msgSend(WeakRetained, "_queryQueue_currentToken");
  if (v5)
    CFRelease(v5);
  objc_msgSend(WeakRetained, "set_queryQueue_currentToken:", 0);
  objc_msgSend(WeakRetained, "_notifyDelegateOfPurgeCompletionAndUpdateContinuousPurgeWithForceStopWithReason:analyticsEvent:", 0, 0);

}

- (void)_legacyDiskSpaceDidBecomeLowNotification
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CAMInternalStorage__legacyDiskSpaceDidBecomeLowNotification__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __62__CAMInternalStorage__legacyDiskSpaceDidBecomeLowNotification__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableDiskSpaceChanged:", *(_QWORD *)(a1 + 32));

}

- (void)_copyFromDictionary:(id)a3 toDictionary:(id)a4 keys:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (void)_copyAndApplyByteStringFormattingFromDictionary:(id)a3 toDictionary:(id)a4 keys:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[CAMInternalStorage _stringFromByteCount:](self, "_stringFromByteCount:", objc_msgSend(v15, "longLongValue"));
          v16 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v16;
        }
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (id)_stringFromByteCount:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[CAMInternalStorage _byteFormatter](self, "_byteFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromByteCount:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%lld (%@)"), a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_stringFromAvailableSpace:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[CAMInternalStorage _stringFromByteCount:](self, "_stringFromByteCount:", a3->var0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMInternalStorage _stringFromByteCount:](self, "_stringFromByteCount:", a3->var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMInternalStorage _stringFromByteCount:](self, "_stringFromByteCount:", a3->var2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Available space:\n\tFree=%@\n\tFast=%@\n\tSlow=%@"), v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CAMPurgeableStorageContainerDelegate)delegate
{
  return (CAMPurgeableStorageContainerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CAMCaptureGraphConfiguration)graphConfiguration
{
  return self->_graphConfiguration;
}

- (int64_t)_cachedLowDiskThreshold
{
  return self->__cachedLowDiskThreshold;
}

- (void)set_cachedLowDiskThreshold:(int64_t)a3
{
  self->__cachedLowDiskThreshold = a3;
}

- (NSDate)_lastPurgeRequestUpdateTime
{
  return self->__lastPurgeRequestUpdateTime;
}

- (void)set_lastPurgeRequestUpdateTime:(id)a3
{
  objc_storeStrong((id *)&self->__lastPurgeRequestUpdateTime, a3);
}

- (OS_dispatch_queue)_cacheDeleteQueryQueue
{
  return self->__cacheDeleteQueryQueue;
}

- (CacheDeleteToken)_queryQueue_currentToken
{
  return self->__queryQueue_currentToken;
}

- (void)set_queryQueue_currentToken:(CacheDeleteToken *)a3
{
  self->__queryQueue_currentToken = a3;
}

- (BOOL)_purging
{
  return self->__purging;
}

- (BOOL)_shouldCancelNextPurge
{
  return self->__shouldCancelNextPurge;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)_cachedEstimatedSpace
{
  *($B281C814454105D39E4829273636FC1A *)retstr = ($B281C814454105D39E4829273636FC1A)self[4];
  return self;
}

- (NSByteCountFormatter)_byteFormatter
{
  return self->__byteFormatter;
}

- (int64_t)_proResMinimumDiskUsageThreshold
{
  return self->__proResMinimumDiskUsageThreshold;
}

- (void)_setProResMinimumDiskUsageThreshold:(int64_t)a3
{
  self->__proResMinimumDiskUsageThreshold = a3;
}

- (int64_t)_fastPurgeThreshold
{
  return self->__fastPurgeThreshold;
}

- (NSURL)_storageMountPoint
{
  return self->__storageMountPoint;
}

- (void)set_storageMountPoint:(id)a3
{
  objc_storeStrong((id *)&self->__storageMountPoint, a3);
}

- (BOOL)_isLockScreenExtension
{
  return self->__isLockScreenExtension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__storageMountPoint, 0);
  objc_storeStrong((id *)&self->__byteFormatter, 0);
  objc_storeStrong((id *)&self->__cacheDeleteQueryQueue, 0);
  objc_storeStrong((id *)&self->__lastPurgeRequestUpdateTime, 0);
  objc_storeStrong((id *)&self->_graphConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __40__CAMInternalStorage__cacheDeleteVolume__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "CAMStorageController: Unable to get storage mount point. Storage controller cannot proceed without a target volume.", v1, 2u);
}

- (void)_statMountPoint:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int *v5;
  char *v6;
  int v7;
  void *v8;
  __int16 v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_storageMountPoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = __error();
  v6 = strerror(*v5);
  v7 = 138543618;
  v8 = v4;
  v9 = 2080;
  v10 = v6;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "CAMStorageController: statfs failed for %{public}@ : %s", (uint8_t *)&v7, 0x16u);

}

- (void)_queryQueue_updatePurgeRequestStateForTotalFreeBytes:(void *)a1 preferredFreeBytes:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1DB760000, v2, v3, "CAMStorageController: Unable to fetch space for essential content bytes from CacheDelete: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end
