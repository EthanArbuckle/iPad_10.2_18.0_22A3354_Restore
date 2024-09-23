@implementation HFCameraPosterFrameProvider

- (HFCameraPosterFrameProvider)initWithImageCache:(id)a3 andTimelapseClipInfoProvider:(id)a4
{
  id v6;
  id v7;
  HFCameraPosterFrameProvider *v8;
  HFCameraPosterFrameProvider *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *bookkeepingQueue;
  HFCameraPosterFrameRequests *v12;
  HFCameraPosterFrameRequests *posterFrameRequests;
  HFCameraTimelapsePosterFrameGenerator *v14;
  HFCameraTimelapsePosterFrameGenerator *posterFrameGenerator;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HFCameraPosterFrameProvider;
  v8 = -[HFCameraPosterFrameProvider init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_imageCache, v6);
    v10 = dispatch_queue_create("com.apple.home.HFCameraPosterFrameProvider.bookkeepingQueue", 0);
    bookkeepingQueue = v9->_bookkeepingQueue;
    v9->_bookkeepingQueue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc_init(HFCameraPosterFrameRequests);
    posterFrameRequests = v9->_posterFrameRequests;
    v9->_posterFrameRequests = v12;

    v14 = -[HFCameraTimelapsePosterFrameGenerator initWithTimelapseClipInfoProvider:andDelegate:]([HFCameraTimelapsePosterFrameGenerator alloc], "initWithTimelapseClipInfoProvider:andDelegate:", v7, v9);
    posterFrameGenerator = v9->_posterFrameGenerator;
    v9->_posterFrameGenerator = v14;

    objc_storeWeak((id *)&v9->_timelapseClipInfoProvider, v7);
  }

  return v9;
}

- (void)getPosterFrameForDelegate:(id)a3 forHighQualityClip:(id)a4 atOffset:(double)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14[2];
  id location;

  v8 = a3;
  v9 = a4;
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPosterFrameProvider _checkImageCacheForDelegate:forHighQualityClip:atOffset:](self, "_checkImageCacheForDelegate:forHighQualityClip:atOffset:", v8, v9, a5);
  }
  else
  {
    objc_initWeak(&location, self);
    -[HFCameraPosterFrameProvider bookkeepingQueue](self, "bookkeepingQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__HFCameraPosterFrameProvider_getPosterFrameForDelegate_forHighQualityClip_atOffset___block_invoke;
    block[3] = &unk_1EA7273B8;
    objc_copyWeak(v14, &location);
    v12 = v8;
    v13 = v9;
    v14[1] = *(id *)&a5;
    dispatch_async(v10, block);

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }

}

void __85__HFCameraPosterFrameProvider_getPosterFrameForDelegate_forHighQualityClip_atOffset___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_checkImageCacheForDelegate:forHighQualityClip:atOffset:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));

}

- (void)_checkImageCacheForDelegate:(id)a3 forHighQualityClip:(id)a4 atOffset:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = a5;
  +[HFCameraImageCache posterFrameKeyForCameraClipIdentifierString:withOffset:](HFCameraImageCache, "posterFrameKeyForCameraClipIdentifierString:withOffset:", v11, v12);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[HFCameraPosterFrameProvider imageCache](self, "imageCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageForKey:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    -[HFCameraPosterFrameProvider _updateDelegate:withPosterFrame:atOffset:ForHighQualityClip:](self, "_updateDelegate:withPosterFrame:atOffset:ForHighQualityClip:", v9, v14, v8, a5);
  else
    -[HFCameraPosterFrameProvider _generateImageForDelegate:forHighQualityClip:atOffset:](self, "_generateImageForDelegate:forHighQualityClip:atOffset:", v9, v8, a5);

}

- (void)_requestTimelapseFileForDelegate:(id)a3 forHighQualityClip:(id)a4 atOffset:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  -[HFCameraPosterFrameProvider _timelapseClipForHighQualityClip:](self, "_timelapseClipForHighQualityClip:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[HFCameraPosterFrameProvider posterFrameRequests](self, "posterFrameRequests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addRequestForTimelapseFileForDelegate:forHighQualityClip:andTimelapseClip:atOffset:", v9, v8, v10, a5);

    +[HFCameraTimelapseVideoProvider sharedProvider](HFCameraTimelapseVideoProvider, "sharedProvider");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getVideoForTimelapseClip:taskType:delegate:", v10, 1, self);
  }
  else
  {
    HFLogForCategory(0x19uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, "Error: Missing timelapse for clip %@", (uint8_t *)&v13, 0xCu);
    }

    -[HFCameraPosterFrameProvider _updateDelegate:withPosterFrame:atOffset:ForHighQualityClip:](self, "_updateDelegate:withPosterFrame:atOffset:ForHighQualityClip:", v9, 0, v8, a5);
  }

}

- (id)_timelapseClipForHighQualityClip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HFCameraPosterFrameProvider timelapseClipInfoProvider](self, "timelapseClipInfoProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timelapseClipPositionForDate:inHighQualityClip:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "clip");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_requestTimelapsePosterFrameGenerationForTimelapseClip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  HFCameraPosterFrameDelegateRequest *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HFCameraPosterFrameProvider *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[HFCameraPosterFrameProvider posterFrameRequests](self, "posterFrameRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fulfillRequestsForTimelapseFileForTimelapseClip:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "highQualityClip");
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v33 = v4;
      -[HFCameraPosterFrameProvider posterFrameGenerator](self, "posterFrameGenerator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraPosterFrameProvider posterFrameSize](self, "posterFrameSize");
      objc_msgSend(v11, "generatePosterFramesForHighQualityClip:withStep:atSize:", v10, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v32 = v8;
      v14 = v8;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v39 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "offsetNumber");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v19);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v16);
      }
      v31 = self;

      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v20 = v12;
      v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v35;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v35 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
            if ((objc_msgSend(v13, "containsObject:", v25) & 1) == 0)
            {
              v26 = objc_alloc_init(HFCameraPosterFrameDelegateRequest);
              v27 = (void *)objc_msgSend(v25, "copy");
              -[HFCameraPosterFrameDelegateRequest setOffsetNumber:](v26, "setOffsetNumber:", v27);

              -[HFCameraPosterFrameDelegateRequest setDelegate:](v26, "setDelegate:", 0);
              objc_msgSend(v14, "addObject:", v26);

            }
          }
          v22 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        }
        while (v22);
      }

      -[HFCameraPosterFrameProvider posterFrameRequests](v31, "posterFrameRequests");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addRequestsForPosterFrameGeneration:forHighQualityClip:", v14, v10);

      v8 = v32;
      v4 = v33;
    }
    else
    {
      HFLogForCategory(0x19uLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "hf_prettyDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v45 = v30;
        _os_log_error_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_ERROR, "Error: Provider has no high quality clip for timelapse clip %@", buf, 0xCu);

      }
    }

  }
  else
  {
    HFLogForCategory(0x19uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "hf_prettyDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v45 = v29;
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "REQUEST: Provider has no requests for timelapse clip: %@", buf, 0xCu);

    }
  }

}

- (void)didDownloadVideoFileForClip:(id)a3 toURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    HFLogForCategory(0x19uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "hf_prettyDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Downloaded timelapse file for timelapse clip: %@", buf, 0xCu);

    }
    -[HFCameraPosterFrameProvider _requestTimelapsePosterFrameGenerationForTimelapseClip:](self, "_requestTimelapsePosterFrameGenerationForTimelapseClip:", v6);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    -[HFCameraPosterFrameProvider bookkeepingQueue](self, "bookkeepingQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__HFCameraPosterFrameProvider_didDownloadVideoFileForClip_toURL___block_invoke;
    v11[3] = &unk_1EA727A48;
    objc_copyWeak(&v13, (id *)buf);
    v12 = v6;
    dispatch_async(v10, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }

}

void __65__HFCameraPosterFrameProvider_didDownloadVideoFileForClip_toURL___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HFLogForCategory(0x19uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Downloaded timelapse file for timelapse clip: %@", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(WeakRetained, "_requestTimelapsePosterFrameGenerationForTimelapseClip:", *(_QWORD *)(a1 + 32));

}

- (void)foundVideoFileForClip:(id)a3 atURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPosterFrameProvider _requestTimelapsePosterFrameGenerationForTimelapseClip:](self, "_requestTimelapsePosterFrameGenerationForTimelapseClip:", v6);
  }
  else
  {
    objc_initWeak(&location, self);
    -[HFCameraPosterFrameProvider bookkeepingQueue](self, "bookkeepingQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__HFCameraPosterFrameProvider_foundVideoFileForClip_atURL___block_invoke;
    block[3] = &unk_1EA727A48;
    objc_copyWeak(&v11, &location);
    v10 = v6;
    dispatch_async(v8, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __59__HFCameraPosterFrameProvider_foundVideoFileForClip_atURL___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HFLogForCategory(0x19uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Found timelapse file for timelapse clip: %@", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(WeakRetained, "_requestTimelapsePosterFrameGenerationForTimelapseClip:", *(_QWORD *)(a1 + 32));

}

- (void)failedToDownloadVideoFileForClip:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPosterFrameProvider _failedToDownloadVideoFileForClip:](self, "_failedToDownloadVideoFileForClip:", v4);
  }
  else
  {
    objc_initWeak(&location, self);
    -[HFCameraPosterFrameProvider bookkeepingQueue](self, "bookkeepingQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__HFCameraPosterFrameProvider_failedToDownloadVideoFileForClip___block_invoke;
    block[3] = &unk_1EA727A48;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __64__HFCameraPosterFrameProvider_failedToDownloadVideoFileForClip___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_failedToDownloadVideoFileForClip:", *(_QWORD *)(a1 + 32));

}

- (void)_failedToDownloadVideoFileForClip:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x19uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "hf_prettyDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v18;
    _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Error: failed to download timelapse file for timelapse clip: %@", buf, 0xCu);

  }
  -[HFCameraPosterFrameProvider posterFrameRequests](self, "posterFrameRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fulfillRequestsForTimelapseFileForTimelapseClip:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "offsetNumber", (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        v16 = v15;

        objc_msgSend(v13, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFCameraPosterFrameProvider _updateDelegate:withPosterFrame:atOffset:ForHighQualityClip:](self, "_updateDelegate:withPosterFrame:atOffset:ForHighQualityClip:", v17, 0, v4, v16);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

}

- (void)didGeneratePosterFrame:(id)a3 forHighQualityClip:(id)a4 atOffset:(double)a5 withTimelapseOffset:(double)a6
{
  id v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16[3];
  id location;

  v10 = a3;
  v11 = a4;
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPosterFrameProvider _didGeneratePosterFrame:forHighQualityClip:atOffset:withTimelapseOffset:](self, "_didGeneratePosterFrame:forHighQualityClip:atOffset:withTimelapseOffset:", v10, v11, a5, a6);
  }
  else
  {
    objc_initWeak(&location, self);
    -[HFCameraPosterFrameProvider bookkeepingQueue](self, "bookkeepingQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __102__HFCameraPosterFrameProvider_didGeneratePosterFrame_forHighQualityClip_atOffset_withTimelapseOffset___block_invoke;
    v13[3] = &unk_1EA727A70;
    objc_copyWeak(v16, &location);
    v14 = v10;
    v15 = v11;
    v16[1] = *(id *)&a5;
    v16[2] = *(id *)&a6;
    dispatch_async(v12, v13);

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }

}

void __102__HFCameraPosterFrameProvider_didGeneratePosterFrame_forHighQualityClip_atOffset_withTimelapseOffset___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_didGeneratePosterFrame:forHighQualityClip:atOffset:withTimelapseOffset:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (void)_didGeneratePosterFrame:(id)a3 forHighQualityClip:(id)a4 atOffset:(double)a5 withTimelapseOffset:(double)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  HFLogForCategory(0x19uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "hf_prettyDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412546;
    v23 = v12;
    v24 = 2048;
    v25 = a5;
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Generated poster frame for clip: %@; offset: %f",
      (uint8_t *)&v22,
      0x16u);

  }
  objc_msgSend(v10, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v15 = a5;
  +[HFCameraImageCache posterFrameKeyForCameraClipIdentifierString:withOffset:](HFCameraImageCache, "posterFrameKeyForCameraClipIdentifierString:withOffset:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraPosterFrameProvider imageCache](self, "imageCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addImage:forKey:", v9, v16);

  -[HFCameraPosterFrameProvider posterFrameRequests](self, "posterFrameRequests");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fulfillRequestForPosterFrameGenerationForHighQualityClip:atOffset:", v10, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v19, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraPosterFrameProvider _updateDelegate:withPosterFrame:atOffset:ForHighQualityClip:](self, "_updateDelegate:withPosterFrame:atOffset:ForHighQualityClip:", v21, v9, v10, a5);

  }
}

- (void)failedToFindTimelapseClipForHighQualityClip:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPosterFrameProvider _failedToFindTimelapseClipForHighQualityClip:](self, "_failedToFindTimelapseClipForHighQualityClip:", v4);
  }
  else
  {
    objc_initWeak(&location, self);
    -[HFCameraPosterFrameProvider bookkeepingQueue](self, "bookkeepingQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__HFCameraPosterFrameProvider_failedToFindTimelapseClipForHighQualityClip___block_invoke;
    block[3] = &unk_1EA727A48;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __75__HFCameraPosterFrameProvider_failedToFindTimelapseClipForHighQualityClip___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_failedToFindTimelapseClipForHighQualityClip:", *(_QWORD *)(a1 + 32));

}

- (void)_failedToFindTimelapseClipForHighQualityClip:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x19uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "hf_prettyDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v19;
    _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Error: Failed to find timelapse for clip: %@", buf, 0xCu);

  }
  -[HFCameraPosterFrameProvider posterFrameRequests](self, "posterFrameRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fulfillAllRequestsForPosterFrameGenerationForHighQualityClip:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "delegate", (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v13, "offsetNumber");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "doubleValue");
          v17 = v16;

          objc_msgSend(v13, "delegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFCameraPosterFrameProvider _updateDelegate:withPosterFrame:atOffset:ForHighQualityClip:](self, "_updateDelegate:withPosterFrame:atOffset:ForHighQualityClip:", v18, 0, v4, v17);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

}

- (void)failedToGeneratePosterFrameForHighQualityClip:(id)a3 atOffset:(double)a4
{
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  v6 = a3;
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPosterFrameProvider _failedToGeneratePosterFrameForHighQualityClip:atOffset:](self, "_failedToGeneratePosterFrameForHighQualityClip:atOffset:", v6, a4);
  }
  else
  {
    objc_initWeak(&location, self);
    -[HFCameraPosterFrameProvider bookkeepingQueue](self, "bookkeepingQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __86__HFCameraPosterFrameProvider_failedToGeneratePosterFrameForHighQualityClip_atOffset___block_invoke;
    v8[3] = &unk_1EA727A98;
    objc_copyWeak(v10, &location);
    v9 = v6;
    v10[1] = *(id *)&a4;
    dispatch_async(v7, v8);

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }

}

void __86__HFCameraPosterFrameProvider_failedToGeneratePosterFrameForHighQualityClip_atOffset___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_failedToGeneratePosterFrameForHighQualityClip:atOffset:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));

}

- (void)_failedToGeneratePosterFrameForHighQualityClip:(id)a3 atOffset:(double)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  HFLogForCategory(0x19uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "hf_prettyDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v12;
    v15 = 2048;
    v16 = a4;
    _os_log_error_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_ERROR, "Error: Failed generation for clip %@; offset %f",
      (uint8_t *)&v13,
      0x16u);

  }
  -[HFCameraPosterFrameProvider posterFrameRequests](self, "posterFrameRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fulfillRequestForPosterFrameGenerationForHighQualityClip:atOffset:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraPosterFrameProvider _updateDelegate:withPosterFrame:atOffset:ForHighQualityClip:](self, "_updateDelegate:withPosterFrame:atOffset:ForHighQualityClip:", v11, 0, v6, a4);

  }
}

- (void)_updateDelegate:(id)a3 withPosterFrame:(id)a4 atOffset:(double)a5 ForHighQualityClip:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  double v19;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__HFCameraPosterFrameProvider__updateDelegate_withPosterFrame_atOffset_ForHighQualityClip___block_invoke;
  v15[3] = &unk_1EA727250;
  v16 = v10;
  v17 = v9;
  v19 = a5;
  v18 = v11;
  v12 = v11;
  v13 = v9;
  v14 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], v15);

}

uint64_t __91__HFCameraPosterFrameProvider__updateDelegate_withPosterFrame_atOffset_ForHighQualityClip___block_invoke(double *a1)
{
  void *v2;
  uint64_t v3;
  double v4;

  v3 = *((_QWORD *)a1 + 4);
  v2 = (void *)*((_QWORD *)a1 + 5);
  v4 = a1[7];
  if (v3)
    return objc_msgSend(v2, "didFindPosterFrame:atOffset:forClip:", v3, *((_QWORD *)a1 + 6), v4);
  else
    return objc_msgSend(v2, "failedToFindPosterFrameAtOffset:forClip:", *((_QWORD *)a1 + 6), v4);
}

- (CGSize)posterFrameSize
{
  double width;
  double height;
  CGSize result;

  width = self->_posterFrameSize.width;
  height = self->_posterFrameSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPosterFrameSize:(CGSize)a3
{
  self->_posterFrameSize = a3;
}

- (HFCameraImageCache)imageCache
{
  return (HFCameraImageCache *)objc_loadWeakRetained((id *)&self->_imageCache);
}

- (void)setImageCache:(id)a3
{
  objc_storeWeak((id *)&self->_imageCache, a3);
}

- (OS_dispatch_queue)bookkeepingQueue
{
  return self->_bookkeepingQueue;
}

- (void)setBookkeepingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_bookkeepingQueue, a3);
}

- (HFCameraPosterFrameRequests)posterFrameRequests
{
  return self->_posterFrameRequests;
}

- (void)setPosterFrameRequests:(id)a3
{
  objc_storeStrong((id *)&self->_posterFrameRequests, a3);
}

- (HFCameraTimelapsePosterFrameGenerator)posterFrameGenerator
{
  return self->_posterFrameGenerator;
}

- (void)setPosterFrameGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_posterFrameGenerator, a3);
}

- (HFCameraTimelapseClipInfoProvider)timelapseClipInfoProvider
{
  return (HFCameraTimelapseClipInfoProvider *)objc_loadWeakRetained((id *)&self->_timelapseClipInfoProvider);
}

- (void)setTimelapseClipInfoProvider:(id)a3
{
  objc_storeWeak((id *)&self->_timelapseClipInfoProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_timelapseClipInfoProvider);
  objc_storeStrong((id *)&self->_posterFrameGenerator, 0);
  objc_storeStrong((id *)&self->_posterFrameRequests, 0);
  objc_storeStrong((id *)&self->_bookkeepingQueue, 0);
  objc_destroyWeak((id *)&self->_imageCache);
}

@end
