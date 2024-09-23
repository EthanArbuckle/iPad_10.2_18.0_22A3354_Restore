@implementation CAMCVCStillImageResultCoordinator

- (CAMCVCStillImageResultCoordinator)initWithDelegate:(id)a3 identifier:(id)a4 allExpectedResultSpecifiers:(id)a5 isExpectingPairedVideo:(BOOL)a6 allowMultipleCaptures:(BOOL)a7 shouldReturnFilteredPhotosAsSingleAsset:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  CAMCVCStillImageResultCoordinator *v17;
  CAMCVCStillImageResultCoordinator *v18;
  uint64_t v19;
  NSMutableSet *receivedPhotos;
  uint64_t v21;
  NSMutableSet *receivedVideos;
  uint64_t v23;
  NSMutableSet *photoResultSpecifiersDelayingForcedDispatch;
  uint64_t v25;
  NSMutableSet *videoResultSpecifiersDelayingForcedDispatch;
  uint64_t v27;
  NSMutableSet *handledResultSpecifiers;
  uint64_t v29;
  NSMutableSet *dispatchedResultSpecifiers;
  uint64_t v31;
  NSMutableDictionary *pendingPhotoProperties;
  uint64_t v33;
  NSMutableDictionary *pendingVideoProperties;
  uint64_t v35;
  NSMutableDictionary *pendingAssetAdjustments;
  CAMCVCStillImageResultCoordinator *v37;
  objc_super v39;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v39.receiver = self;
  v39.super_class = (Class)CAMCVCStillImageResultCoordinator;
  v17 = -[CAMCVCStillImageResultCoordinator init](&v39, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v14);
    objc_storeStrong((id *)&v18->_identifier, a4);
    objc_storeStrong((id *)&v18->_allExpectedResultSpecifiers, a5);
    v18->_expectingPairedVideo = a6;
    v18->_allowMultipleCaptures = a7;
    v18->_shouldReturnFilteredPhotosAsSingleAsset = a8;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = objc_claimAutoreleasedReturnValue();
    receivedPhotos = v18->__receivedPhotos;
    v18->__receivedPhotos = (NSMutableSet *)v19;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v21 = objc_claimAutoreleasedReturnValue();
    receivedVideos = v18->__receivedVideos;
    v18->__receivedVideos = (NSMutableSet *)v21;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v23 = objc_claimAutoreleasedReturnValue();
    photoResultSpecifiersDelayingForcedDispatch = v18->__photoResultSpecifiersDelayingForcedDispatch;
    v18->__photoResultSpecifiersDelayingForcedDispatch = (NSMutableSet *)v23;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v25 = objc_claimAutoreleasedReturnValue();
    videoResultSpecifiersDelayingForcedDispatch = v18->__videoResultSpecifiersDelayingForcedDispatch;
    v18->__videoResultSpecifiersDelayingForcedDispatch = (NSMutableSet *)v25;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v27 = objc_claimAutoreleasedReturnValue();
    handledResultSpecifiers = v18->__handledResultSpecifiers;
    v18->__handledResultSpecifiers = (NSMutableSet *)v27;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v29 = objc_claimAutoreleasedReturnValue();
    dispatchedResultSpecifiers = v18->__dispatchedResultSpecifiers;
    v18->__dispatchedResultSpecifiers = (NSMutableSet *)v29;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v31 = objc_claimAutoreleasedReturnValue();
    pendingPhotoProperties = v18->__pendingPhotoProperties;
    v18->__pendingPhotoProperties = (NSMutableDictionary *)v31;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v33 = objc_claimAutoreleasedReturnValue();
    pendingVideoProperties = v18->__pendingVideoProperties;
    v18->__pendingVideoProperties = (NSMutableDictionary *)v33;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v35 = objc_claimAutoreleasedReturnValue();
    pendingAssetAdjustments = v18->__pendingAssetAdjustments;
    v18->__pendingAssetAdjustments = (NSMutableDictionary *)v35;

    v37 = v18;
  }

  return v18;
}

- (void)updatePhotoProperties:(id)a3 assetAdjustments:(id)a4 forResultSpecifiers:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  int v23;
  void *v24;
  __int16 v25;
  __CFString *v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  v10 = os_log_create("com.apple.camera", "Camera");
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    goto LABEL_12;
  -[CAMCVCStillImageResultCoordinator identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a5 & 2) == 0)
  {
    v12 = &stru_1EA3325A0;
    if ((a5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((a5 & 1) != 0)
  {
LABEL_6:
    -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", CFSTR("HDR"));
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (__CFString *)v13;
  }
LABEL_7:
  if (!-[__CFString length](v12, "length"))
  {

    v12 = CFSTR("None");
  }
  v14 = CFSTR("YES");
  if (!v8)
    v14 = CFSTR("NO");
  v15 = v14;
  v23 = 138543874;
  v24 = v11;
  v25 = 2114;
  v26 = v12;
  v27 = 2114;
  v28 = v15;
  _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: updatePhotoProperties for %{public}@ (hasAdjustments=%{public}@)", (uint8_t *)&v23, 0x20u);

LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CAMCVCStillImageResultCoordinator _isDelayingForcedDispatch](self, "_isDelayingForcedDispatch");
  -[CAMCVCStillImageResultCoordinator _receivedPhotos](self, "_receivedPhotos");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v16);

  -[CAMCVCStillImageResultCoordinator _photoResultSpecifiersDelayingForcedDispatch](self, "_photoResultSpecifiersDelayingForcedDispatch");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeObject:", v16);

  -[CAMCVCStillImageResultCoordinator _pendingPhotoProperties](self, "_pendingPhotoProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v9, v16);

  -[CAMCVCStillImageResultCoordinator _pendingAssetAdjustments](self, "_pendingAssetAdjustments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v8, v16);

  v22 = v17
     && !-[CAMCVCStillImageResultCoordinator _isDelayingForcedDispatch](self, "_isDelayingForcedDispatch")
     && -[CAMCVCStillImageResultCoordinator _didReceiveForceRemainingDispatchesIfPossible](self, "_didReceiveForceRemainingDispatchesIfPossible");
  -[CAMCVCStillImageResultCoordinator _dispatchPendingPropertiesForced:](self, "_dispatchPendingPropertiesForced:", v22);

}

- (void)updateVideoProperties:(id)a3 forResultSpecifiers:(unint64_t)a4 wantsDepthRenderedForStill:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  int v21;
  void *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = os_log_create("com.apple.camera", "Camera");
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    goto LABEL_10;
  -[CAMCVCStillImageResultCoordinator identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a4 & 2) == 0)
  {
    v11 = &stru_1EA3325A0;
    if ((a4 & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((a4 & 1) != 0)
  {
LABEL_6:
    -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR("HDR"));
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (__CFString *)v12;
  }
LABEL_7:
  if (!-[__CFString length](v11, "length"))
  {

    v11 = CFSTR("None");
  }
  v21 = 138543618;
  v22 = v10;
  v23 = 2114;
  v24 = v11;
  _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: updateVideoProperties for %{public}@", (uint8_t *)&v21, 0x16u);

LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CAMCVCStillImageResultCoordinator _isDelayingForcedDispatch](self, "_isDelayingForcedDispatch");
  -[CAMCVCStillImageResultCoordinator _receivedVideos](self, "_receivedVideos");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v13);

  -[CAMCVCStillImageResultCoordinator _videoResultSpecifiersDelayingForcedDispatch](self, "_videoResultSpecifiersDelayingForcedDispatch");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObject:", v13);

  -[CAMCVCStillImageResultCoordinator _pendingVideoProperties](self, "_pendingVideoProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v8, v13);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4 | 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCVCStillImageResultCoordinator _pendingVideoProperties](self, "_pendingVideoProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v8, v18);

  }
  v20 = v14
     && !-[CAMCVCStillImageResultCoordinator _isDelayingForcedDispatch](self, "_isDelayingForcedDispatch")
     && -[CAMCVCStillImageResultCoordinator _didReceiveForceRemainingDispatchesIfPossible](self, "_didReceiveForceRemainingDispatchesIfPossible");
  -[CAMCVCStillImageResultCoordinator _dispatchPendingPropertiesForced:](self, "_dispatchPendingPropertiesForced:", v20);

}

- (void)delayForcedDispatchForPhotoResultSpecifiers:(unint64_t)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMCVCStillImageResultCoordinator _receivedPhotos](self, "_receivedPhotos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v7);

  if ((v5 & 1) == 0)
  {
    -[CAMCVCStillImageResultCoordinator _photoResultSpecifiersDelayingForcedDispatch](self, "_photoResultSpecifiersDelayingForcedDispatch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

- (void)delayForcedDispatchForVideoResultSpecifiers:(unint64_t)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMCVCStillImageResultCoordinator _receivedVideos](self, "_receivedVideos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v7);

  if ((v5 & 1) == 0)
  {
    -[CAMCVCStillImageResultCoordinator _videoResultSpecifiersDelayingForcedDispatch](self, "_videoResultSpecifiersDelayingForcedDispatch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

- (BOOL)_isDelayingForcedDispatch
{
  void *v3;
  BOOL v4;
  void *v5;

  -[CAMCVCStillImageResultCoordinator _photoResultSpecifiersDelayingForcedDispatch](self, "_photoResultSpecifiersDelayingForcedDispatch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[CAMCVCStillImageResultCoordinator _videoResultSpecifiersDelayingForcedDispatch](self, "_videoResultSpecifiersDelayingForcedDispatch");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (void)forceRemainingDispatchesIfPossible
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[CAMCVCStillImageResultCoordinator _setDidReceiveForceRemainingDispatchesIfPossible:](self, "_setDidReceiveForceRemainingDispatchesIfPossible:", 1);
  if (-[CAMCVCStillImageResultCoordinator _isDelayingForcedDispatch](self, "_isDelayingForcedDispatch"))
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMCVCStillImageResultCoordinator identifier](self, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMCVCStillImageResultCoordinator _photoResultSpecifiersDelayingForcedDispatch](self, "_photoResultSpecifiersDelayingForcedDispatch");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      CAMDebugStringForCaptureResultSpecifiersSet(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMCVCStillImageResultCoordinator _videoResultSpecifiersDelayingForcedDispatch](self, "_videoResultSpecifiersDelayingForcedDispatch");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      CAMDebugStringForCaptureResultSpecifiersSet(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = v4;
      v11 = 2114;
      v12 = v6;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: received forceRemainingDispatchesIfPossible but still explicitly waiting for Photos:%{public}@ Videos:%{public}@", (uint8_t *)&v9, 0x20u);

    }
  }
  else
  {
    -[CAMCVCStillImageResultCoordinator _dispatchPendingPropertiesForced:](self, "_dispatchPendingPropertiesForced:", 1);
  }
}

- (void)_dispatchPendingPropertiesForced:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  id v32;
  _BOOL4 v33;
  _QWORD v34[4];
  id v35;
  id v36;
  CAMCVCStillImageResultCoordinator *v37;
  BOOL v38;
  BOOL v39;
  BOOL v40;
  _QWORD v41[4];
  id v42;
  id v43;
  BOOL v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v3 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  v5 = -[CAMCVCStillImageResultCoordinator allowMultipleCaptures](self, "allowMultipleCaptures");
  -[CAMCVCStillImageResultCoordinator _dispatchedResultSpecifiers](self, "_dispatchedResultSpecifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v5 || !v7)
  {
    v33 = v3;
    if (v3)
    {
      v8 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[CAMCVCStillImageResultCoordinator identifier](self, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v46 = v9;
        _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: forcing remaining dispatches", buf, 0xCu);

      }
    }
    -[CAMCVCStillImageResultCoordinator allExpectedResultSpecifiers](self, "allExpectedResultSpecifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCVCStillImageResultCoordinator _handledResultSpecifiers](self, "_handledResultSpecifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CAMCVCStillImageResultCoordinator shouldReturnFilteredPhotosAsSingleAsset](self, "shouldReturnFilteredPhotosAsSingleAsset");
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v5)
      v14 = 0;
    else
      v14 = 2;
    v15 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __70__CAMCVCStillImageResultCoordinator__dispatchPendingPropertiesForced___block_invoke;
    v41[3] = &unk_1EA32E3A0;
    v16 = v10;
    v42 = v16;
    v44 = v12;
    v17 = v13;
    v43 = v17;
    objc_msgSend(&unk_1EA3B3A58, "enumerateObjectsWithOptions:usingBlock:", v14, v41);
    v34[0] = v15;
    v34[1] = 3221225472;
    v34[2] = __70__CAMCVCStillImageResultCoordinator__dispatchPendingPropertiesForced___block_invoke_2;
    v34[3] = &unk_1EA32E3C8;
    v18 = v11;
    v35 = v18;
    v36 = v16;
    v38 = v12;
    v39 = v33;
    v37 = self;
    v40 = v5;
    v32 = v16;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v34);
    v19 = objc_msgSend(v18, "count");
    v20 = objc_msgSend(v17, "count");
    v21 = objc_msgSend(v6, "count");
    v22 = v21;
    v23 = !v5;
    if (!v5 && v19 == v20 && !v21)
    {
      v24 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        -[CAMCVCStillImageResultCoordinator identifier](self, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v46 = v25;
        _os_log_impl(&dword_1DB760000, v24, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: Failed to dispatch or fallback so just returning nil", buf, 0xCu);

      }
      objc_msgSend(v17, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "integerValue");

      -[CAMCVCStillImageResultCoordinator _errorForResultSpecifiers:allowMissingVideo:](self, "_errorForResultSpecifiers:allowMissingVideo:", v27, v33);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMCVCStillImageResultCoordinator delegate](self, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stillImagePersistenceCoordinator:requestsDispatchForResultSpecifiers:photoProperties:videoProperties:unfilteredPhotoProperties:unfilteredVideoProperties:assetAdjustments:error:", self, v27, 0, 0, 0, 0, 0, v28);

    }
    if (v22)
      v30 = v23;
    else
      v30 = 0;
    if (v33 || v30)
    {
      -[CAMCVCStillImageResultCoordinator delegate](self, "delegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stillImagePersistenceCoordinatorDidCompleteAllDispatches:", self);

    }
  }

}

void __70__CAMCVCStillImageResultCoordinator__dispatchPendingPropertiesForced___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    v3 = objc_msgSend(v7, "integerValue");
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3 | 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

    if (v3 == (v3 | 2) || !*(_BYTE *)(a1 + 48) || !v6)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }

}

void __70__CAMCVCStillImageResultCoordinator__dispatchPendingPropertiesForced___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v14;
  int v15;
  char v16;
  int v17;
  int v18;
  id v19;

  v19 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v19);
  v7 = v19;
  if ((v6 & 1) == 0)
  {
    v8 = objc_msgSend(v19, "integerValue");
    v9 = v8 & 0xFFFFFFFFFFFFFFFDLL;
    v10 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8 & 0xFFFFFFFFFFFFFFFDLL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "containsObject:", v11);

    if (v8 == (v8 & 0xFFFFFFFFFFFFFFFDLL) || *(_BYTE *)(a1 + 56) == 0)
      v12 = 0;
    if (*(_BYTE *)(a1 + 57))
      goto LABEL_9;
    v18 = objc_msgSend(*(id *)(a1 + 48), "_isWaitingOnResultSpecifiers:", v8);
    if ((v18 & 1) != 0 || ((v12 ^ 1) & 1) != 0)
    {
      if (v18)
        goto LABEL_20;
    }
    else if ((objc_msgSend(*(id *)(a1 + 48), "_isWaitingOnResultSpecifiers:", v9) & 1) != 0)
    {
LABEL_20:
      v7 = v19;
      if (*(_BYTE *)(a1 + 58))
        goto LABEL_2;
      goto LABEL_21;
    }
LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v19);
    v14 = *(void **)(a1 + 48);
    v15 = *(unsigned __int8 *)(a1 + 57);
    if (v12)
    {
      v16 = objc_msgSend(v14, "_attemptDispatchForPairWithFilteredResultSpecifiers:unfilteredResultSpecifiers:forceRemainingDispatches:", v8, v9, v15 != 0);
      v7 = v19;
      if ((v16 & 1) == 0)
        goto LABEL_2;
    }
    else
    {
      v17 = objc_msgSend(v14, "_attemptDispatchForResultSpecifiers:forceRemainingDispatches:", v8, v15 != 0);
      v7 = v19;
      if (!v17)
        goto LABEL_2;
    }
    if (*(_BYTE *)(a1 + 58))
      goto LABEL_2;
LABEL_21:
    *a4 = 1;
  }
LABEL_2:

}

- (BOOL)_isWaitingOnResultSpecifiers:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  char v12;

  -[CAMCVCStillImageResultCoordinator _receivedPhotos](self, "_receivedPhotos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCVCStillImageResultCoordinator _receivedVideos](self, "_receivedVideos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CAMCVCStillImageResultCoordinator isExpectingPairedVideo](self, "isExpectingPairedVideo");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "containsObject:", v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "containsObject:", v10);

  if (v9)
    v12 = v7 & (v11 ^ 1);
  else
    v12 = 1;

  return v12;
}

- (BOOL)_attemptDispatchForPairWithFilteredResultSpecifiers:(unint64_t)a3 unfilteredResultSpecifiers:(unint64_t)a4 forceRemainingDispatches:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  __CFString *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  CAMCVCStillImageResultCoordinator *v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  __CFString *v43;
  __CFString *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  const char *v48;
  void *v49;
  __CFString *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v58;
  __CFString *v59;
  __CFString *v60;
  void *v61;
  _BOOL4 v62;
  __int128 v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  __CFString *v71;
  __int16 v72;
  __CFString *v73;
  uint64_t v74;

  v5 = a5;
  v74 = *MEMORY[0x1E0C80C00];
  v9 = -[CAMCVCStillImageResultCoordinator allowMultipleCaptures](self, "allowMultipleCaptures");
  v62 = -[CAMCVCStillImageResultCoordinator isExpectingPairedVideo](self, "isExpectingPairedVideo");
  -[CAMCVCStillImageResultCoordinator _pendingPhotoProperties](self, "_pendingPhotoProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v64 = objc_claimAutoreleasedReturnValue();

  -[CAMCVCStillImageResultCoordinator _pendingVideoProperties](self, "_pendingVideoProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  *((_QWORD *)&v63 + 1) = objc_claimAutoreleasedReturnValue();

  -[CAMCVCStillImageResultCoordinator _pendingPhotoProperties](self, "_pendingPhotoProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = objc_claimAutoreleasedReturnValue();

  -[CAMCVCStillImageResultCoordinator _pendingVideoProperties](self, "_pendingVideoProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v18);
  *(_QWORD *)&v63 = objc_claimAutoreleasedReturnValue();

  -[CAMCVCStillImageResultCoordinator _pendingAssetAdjustments](self, "_pendingAssetAdjustments");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v20);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMCVCStillImageResultCoordinator _errorForResultSpecifiers:allowMissingVideo:](self, "_errorForResultSpecifiers:allowMissingVideo:", a3, v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCVCStillImageResultCoordinator _errorForResultSpecifiers:allowMissingVideo:](self, "_errorForResultSpecifiers:allowMissingVideo:", a4, v5);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = os_log_create("com.apple.camera", "Camera");
  v23 = v22;
  v65 = v21;
  if (__PAIR128__((unint64_t)v66, (unint64_t)v21) == 0)
  {
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      goto LABEL_32;
    -[CAMCVCStillImageResultCoordinator identifier](self, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a4 & 2) != 0)
    {
      objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ((a4 & 1) == 0)
        goto LABEL_22;
    }
    else
    {
      v31 = &stru_1EA3325A0;
      if ((a4 & 1) == 0)
      {
LABEL_22:
        if (!-[__CFString length](v31, "length"))
        {

          v31 = CFSTR("None");
        }
        v43 = v31;
        if ((a3 & 2) != 0)
        {
          objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
          v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if ((a3 & 1) == 0)
          {
LABEL_29:
            if (!-[__CFString length](v44, "length"))
            {

              v44 = CFSTR("None");
            }
            *(_DWORD *)buf = 138543874;
            v69 = v30;
            v70 = 2114;
            v71 = v43;
            v72 = 2114;
            v73 = v44;
            _os_log_impl(&dword_1DB760000, v23, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: Dispatching %{public}@+%{public}@", buf, 0x20u);

LABEL_32:
            v27 = (void *)*((_QWORD *)&v63 + 1);
            v26 = (void *)v64;
            v28 = (void *)v16;
            v29 = (void *)v63;
            if (v62)
            {
              if (v63 == 0)
              {
                v46 = os_log_create("com.apple.camera", "Camera");
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  -[CAMCVCStillImageResultCoordinator identifier](self, "identifier");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v69 = v47;
                  v48 = "ResultCoordinator %{public}@: Missing filtered and unfiltered videos for filtered LivePhoto. Wil"
                        "l treat as regular photo";
                  goto LABEL_52;
                }
LABEL_53:

                goto LABEL_54;
              }
              if (!*((_QWORD *)&v63 + 1))
              {
                v46 = os_log_create("com.apple.camera", "Camera");
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  -[CAMCVCStillImageResultCoordinator identifier](self, "identifier");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v69 = v47;
                  v48 = "ResultCoordinator %{public}@: Missing filtered video for filtered LivePhoto. Will treat as regular photo";
                  goto LABEL_52;
                }
                goto LABEL_53;
              }
              if (!(_QWORD)v63)
              {
                v46 = os_log_create("com.apple.camera", "Camera");
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  -[CAMCVCStillImageResultCoordinator identifier](self, "identifier");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v69 = v47;
                  v48 = "ResultCoordinator %{public}@: Missing unfiltered video for filtered LivePhoto. May result in issues.";
LABEL_52:
                  _os_log_impl(&dword_1DB760000, v46, OS_LOG_TYPE_DEFAULT, v48, buf, 0xCu);

                  goto LABEL_53;
                }
                goto LABEL_53;
              }
            }
LABEL_54:
            -[CAMCVCStillImageResultCoordinator delegate](self, "delegate");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v36;
            v61 = v67;
            v38 = self;
            v39 = a3;
            v40 = (void *)v64;
            v41 = *((_QWORD *)&v63 + 1);
            v53 = v28;
            v54 = v63;
            goto LABEL_55;
          }
        }
        else
        {
          v44 = &stru_1EA3325A0;
          if ((a3 & 1) == 0)
            goto LABEL_29;
        }
        -[__CFString stringByAppendingString:](v44, "stringByAppendingString:", CFSTR("HDR"));
        v45 = objc_claimAutoreleasedReturnValue();

        v44 = (__CFString *)v45;
        goto LABEL_29;
      }
    }
    -[__CFString stringByAppendingString:](v31, "stringByAppendingString:", CFSTR("HDR"));
    v42 = objc_claimAutoreleasedReturnValue();

    v31 = (__CFString *)v42;
    goto LABEL_22;
  }
  if (!v21)
  {
    v28 = (void *)v16;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMCVCStillImageResultCoordinator identifier](self, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "localizedDescription");
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v69 = v32;
      v70 = 2114;
      v71 = v33;
      _os_log_impl(&dword_1DB760000, v23, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: Using filtered photo alone instead of filtered pair due to error: %{public}@", buf, 0x16u);

    }
    v27 = (void *)*((_QWORD *)&v63 + 1);
    v26 = (void *)v64;
    v29 = (void *)v63;
    if (v62 && !*((_QWORD *)&v63 + 1))
    {
      v34 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        -[CAMCVCStillImageResultCoordinator identifier](self, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v69 = v35;
        _os_log_impl(&dword_1DB760000, v34, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: Missing video for LivePhoto. Will treat as regular photo", buf, 0xCu);

      }
    }
    -[CAMCVCStillImageResultCoordinator delegate](self, "delegate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    v61 = 0;
    v38 = self;
    v39 = a3;
    v40 = (void *)v64;
    v41 = *((_QWORD *)&v63 + 1);
    goto LABEL_48;
  }
  if (!v66)
  {
    v27 = (void *)*((_QWORD *)&v63 + 1);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMCVCStillImageResultCoordinator identifier](self, "identifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "localizedDescription");
      v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v69 = v49;
      v70 = 2114;
      v71 = v50;
      _os_log_impl(&dword_1DB760000, v23, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: Using unfiltered photo alone instead of filtered pair due to error: %{public}@", buf, 0x16u);

    }
    v26 = (void *)v64;
    v28 = (void *)v16;
    v29 = (void *)v63;
    if (v62 && !(_QWORD)v63)
    {
      v51 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        -[CAMCVCStillImageResultCoordinator identifier](self, "identifier");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v69 = v52;
        _os_log_impl(&dword_1DB760000, v51, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: Missing video for LivePhoto. Will treat as regular photo", buf, 0xCu);

      }
    }
    -[CAMCVCStillImageResultCoordinator delegate](self, "delegate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    v61 = 0;
    v38 = self;
    v39 = a4;
    v40 = v28;
    v41 = v63;
LABEL_48:
    v53 = 0;
    v54 = 0;
LABEL_55:
    objc_msgSend(v36, "stillImagePersistenceCoordinator:requestsDispatchForResultSpecifiers:photoProperties:videoProperties:unfilteredPhotoProperties:unfilteredVideoProperties:assetAdjustments:error:", v38, v39, v40, v41, v53, v54, v61, 0);

    -[CAMCVCStillImageResultCoordinator _dispatchedResultSpecifiers](self, "_dispatchedResultSpecifiers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v55);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v56);

    v25 = 1;
    goto LABEL_56;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    -[CAMCVCStillImageResultCoordinator identifier](self, "identifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedDescription");
    v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "localizedDescription");
    v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v69 = v58;
    v70 = 2114;
    v71 = v59;
    v72 = 2114;
    v73 = v60;
    _os_log_error_impl(&dword_1DB760000, v23, OS_LOG_TYPE_ERROR, "ResultCoordinator %{public}@: Could not dispatch filtered pair due to errors: %{public}@ and %{public}@", buf, 0x20u);

    v21 = v65;
  }

  if (v9)
  {
    -[CAMCVCStillImageResultCoordinator delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stillImagePersistenceCoordinator:requestsDispatchForResultSpecifiers:photoProperties:videoProperties:unfilteredPhotoProperties:unfilteredVideoProperties:assetAdjustments:error:", self, a3, 0, 0, 0, 0, 0, v21);
    v25 = 0;
    v27 = (void *)*((_QWORD *)&v63 + 1);
    v26 = (void *)v64;
    v28 = (void *)v16;
    v29 = (void *)v63;
LABEL_56:

    goto LABEL_57;
  }
  v25 = 0;
  v27 = (void *)*((_QWORD *)&v63 + 1);
  v26 = (void *)v64;
  v28 = (void *)v16;
  v29 = (void *)v63;
LABEL_57:

  return v25;
}

- (BOOL)_attemptDispatchForResultSpecifiers:(unint64_t)a3 forceRemainingDispatches:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  __CFString *v36;
  __int16 v37;
  __CFString *v38;
  uint64_t v39;

  v4 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v7 = -[CAMCVCStillImageResultCoordinator allowMultipleCaptures](self, "allowMultipleCaptures");
  -[CAMCVCStillImageResultCoordinator _errorForResultSpecifiers:allowMissingVideo:](self, "_errorForResultSpecifiers:allowMissingVideo:", a3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = os_log_create("com.apple.camera", "Camera");
  v10 = v9;
  if (!v8)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      -[CAMCVCStillImageResultCoordinator _pendingPhotoProperties](self, "_pendingPhotoProperties");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[CAMCVCStillImageResultCoordinator _pendingVideoProperties](self, "_pendingVideoProperties");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[CAMCVCStillImageResultCoordinator _pendingAssetAdjustments](self, "_pendingAssetAdjustments");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[CAMCVCStillImageResultCoordinator isExpectingPairedVideo](self, "isExpectingPairedVideo") && !v20)
      {
        v24 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          -[CAMCVCStillImageResultCoordinator identifier](self, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v34 = v25;
          _os_log_impl(&dword_1DB760000, v24, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: Missing video for LivePhoto. Will treat as regular photo", buf, 0xCu);

        }
      }
      -[CAMCVCStillImageResultCoordinator delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stillImagePersistenceCoordinator:requestsDispatchForResultSpecifiers:photoProperties:videoProperties:unfilteredPhotoProperties:unfilteredVideoProperties:assetAdjustments:error:", self, a3, v17, v20, 0, 0, v23, 0);

      -[CAMCVCStillImageResultCoordinator _dispatchedResultSpecifiers](self, "_dispatchedResultSpecifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v27);

      goto LABEL_20;
    }
    -[CAMCVCStillImageResultCoordinator identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a3 & 2) != 0)
    {
      objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ((a3 & 1) == 0)
      {
LABEL_11:
        if (!-[__CFString length](v13, "length"))
        {

          v13 = CFSTR("None");
        }
        *(_DWORD *)buf = 138543618;
        v34 = v12;
        v35 = 2114;
        v36 = v13;
        _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: Dispatching %{public}@", buf, 0x16u);

        goto LABEL_14;
      }
    }
    else
    {
      v13 = &stru_1EA3325A0;
      if ((a3 & 1) == 0)
        goto LABEL_11;
    }
    -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("HDR"));
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (__CFString *)v14;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[CAMCVCStillImageResultCoordinator identifier](self, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedDescription");
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((a3 & 2) != 0)
    {
      objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = &stru_1EA3325A0;
    }
    if ((a3 & 1) != 0)
    {
      -[__CFString stringByAppendingString:](v31, "stringByAppendingString:", CFSTR("HDR"));
      v32 = objc_claimAutoreleasedReturnValue();

      v31 = (__CFString *)v32;
    }
    if (!-[__CFString length](v31, "length"))
    {

      v31 = CFSTR("None");
    }
    *(_DWORD *)buf = 138543874;
    v34 = v29;
    v35 = 2114;
    v36 = v30;
    v37 = 2114;
    v38 = v31;
    _os_log_error_impl(&dword_1DB760000, v10, OS_LOG_TYPE_ERROR, "ResultCoordinator %{public}@: %{public}@ for %{public}@", buf, 0x20u);

  }
  if (v7)
  {
    -[CAMCVCStillImageResultCoordinator delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stillImagePersistenceCoordinator:requestsDispatchForResultSpecifiers:photoProperties:videoProperties:unfilteredPhotoProperties:unfilteredVideoProperties:assetAdjustments:error:", self, a3, 0, 0, 0, 0, 0, v8);
LABEL_20:

  }
  return v8 == 0;
}

- (id)_errorForResultSpecifiers:(unint64_t)a3 allowMissingVideo:(BOOL)a4
{
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;

  v7 = -[CAMCVCStillImageResultCoordinator isExpectingPairedVideo](self, "isExpectingPairedVideo");
  -[CAMCVCStillImageResultCoordinator _pendingPhotoProperties](self, "_pendingPhotoProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMCVCStillImageResultCoordinator _pendingVideoProperties](self, "_pendingVideoProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerCaptureError"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = -38101;
    v16 = CFSTR("Photo capture error");
LABEL_3:
    -[CAMCVCStillImageResultCoordinator _errorWithDescription:code:](self, "_errorWithDescription:code:", v16, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (!v10)
  {
    v15 = -38102;
    v16 = CFSTR("Missing photo properties");
    goto LABEL_3;
  }
  v17 = 0;
  if (v7 && !v13 && !a4)
  {
    v15 = -38103;
    v16 = CFSTR("Missing video properties");
    goto LABEL_3;
  }
LABEL_4:

  return v17;
}

- (id)_errorWithDescription:(id)a3 code:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = *MEMORY[0x1E0CB2D50];
  v11[0] = a3;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CAMCVCStillImageResultCoordinatorErrorDomain"), a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CAMCVCStillImageResultCoordinatorDelegate)delegate
{
  return (CAMCVCStillImageResultCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSSet)allExpectedResultSpecifiers
{
  return self->_allExpectedResultSpecifiers;
}

- (BOOL)isExpectingPairedVideo
{
  return self->_expectingPairedVideo;
}

- (BOOL)allowMultipleCaptures
{
  return self->_allowMultipleCaptures;
}

- (BOOL)shouldReturnFilteredPhotosAsSingleAsset
{
  return self->_shouldReturnFilteredPhotosAsSingleAsset;
}

- (NSMutableSet)_receivedPhotos
{
  return self->__receivedPhotos;
}

- (NSMutableSet)_receivedVideos
{
  return self->__receivedVideos;
}

- (NSMutableSet)_photoResultSpecifiersDelayingForcedDispatch
{
  return self->__photoResultSpecifiersDelayingForcedDispatch;
}

- (NSMutableSet)_videoResultSpecifiersDelayingForcedDispatch
{
  return self->__videoResultSpecifiersDelayingForcedDispatch;
}

- (BOOL)_didReceiveForceRemainingDispatchesIfPossible
{
  return self->__didReceiveForceRemainingDispatchesIfPossible;
}

- (void)_setDidReceiveForceRemainingDispatchesIfPossible:(BOOL)a3
{
  self->__didReceiveForceRemainingDispatchesIfPossible = a3;
}

- (NSMutableSet)_handledResultSpecifiers
{
  return self->__handledResultSpecifiers;
}

- (NSMutableSet)_dispatchedResultSpecifiers
{
  return self->__dispatchedResultSpecifiers;
}

- (NSMutableDictionary)_pendingPhotoProperties
{
  return self->__pendingPhotoProperties;
}

- (NSMutableDictionary)_pendingVideoProperties
{
  return self->__pendingVideoProperties;
}

- (NSMutableDictionary)_pendingAssetAdjustments
{
  return self->__pendingAssetAdjustments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pendingAssetAdjustments, 0);
  objc_storeStrong((id *)&self->__pendingVideoProperties, 0);
  objc_storeStrong((id *)&self->__pendingPhotoProperties, 0);
  objc_storeStrong((id *)&self->__dispatchedResultSpecifiers, 0);
  objc_storeStrong((id *)&self->__handledResultSpecifiers, 0);
  objc_storeStrong((id *)&self->__videoResultSpecifiersDelayingForcedDispatch, 0);
  objc_storeStrong((id *)&self->__photoResultSpecifiersDelayingForcedDispatch, 0);
  objc_storeStrong((id *)&self->__receivedVideos, 0);
  objc_storeStrong((id *)&self->__receivedPhotos, 0);
  objc_storeStrong((id *)&self->_allExpectedResultSpecifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
