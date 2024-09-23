@implementation HFCameraTimelapseClipManager

+ (id)sharedManager
{
  if (qword_1ED379120 != -1)
    dispatch_once(&qword_1ED379120, &__block_literal_global_101);
  return (id)_MergedGlobals_255;
}

void __45__HFCameraTimelapseClipManager_sharedManager__block_invoke()
{
  HFCameraTimelapseClipManager *v0;
  void *v1;

  v0 = objc_alloc_init(HFCameraTimelapseClipManager);
  v1 = (void *)_MergedGlobals_255;
  _MergedGlobals_255 = (uint64_t)v0;

}

- (HFCameraTimelapseClipManager)init
{
  HFCameraTimelapseClipManager *v2;
  uint64_t v3;
  NSArray *timelapseClips;
  dispatch_queue_t v5;
  OS_dispatch_queue *updateQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFCameraTimelapseClipManager;
  v2 = -[HFCameraTimelapseClipManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    timelapseClips = v2->_timelapseClips;
    v2->_timelapseClips = (NSArray *)v3;

    v5 = dispatch_queue_create("com.apple.home.HFCameraTimelapseClipManager.updateQueue", 0);
    updateQueue = v2->_updateQueue;
    v2->_updateQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)setTimelapseClips:(id)a3
{
  NSArray *v4;
  NSArray *timelapseClips;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  timelapseClips = self->_timelapseClips;
  self->_timelapseClips = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)timelapseClips
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_timelapseClips;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)timelapseClipPositionForDate:(id)a3 inHighQualityClip:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[HFCameraTimelapseClipManager timelapseClips](self, "timelapseClips");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraPlaybackEngine findClipPositionForDate:inEvents:options:](HFCameraPlaybackEngine, "findClipPositionForDate:inEvents:options:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x1DuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v6;
    _os_log_debug_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEBUG, "Found clipPosition:%@ for highQualityClip:%@", (uint8_t *)&v12, 0x16u);
  }

  return v9;
}

- (id)timelapseURLForTimelapseClip:(id)a3
{
  return +[HFCameraUtilities videoDestinationURLForCameraClip:](HFCameraUtilities, "videoDestinationURLForCameraClip:", a3);
}

- (id)timelapseClipPositionForDate:(id)a3 inHighQualityClip:(id)a4 scrubbingType:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  -[HFCameraTimelapseClipManager timelapseClips](self, "timelapseClips");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraPlaybackEngine findClipPositionForDate:inEvents:options:](HFCameraPlaybackEngine, "findClipPositionForDate:inEvents:options:", v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x1DuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412546;
    v14 = v10;
    v15 = 2112;
    v16 = v7;
    _os_log_debug_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEBUG, "Found clipPosition:%@ for highQualityClip:%@", (uint8_t *)&v13, 0x16u);
  }

  return v10;
}

- (void)setClipManager:(id)a3
{
  HMCameraClipManager **p_clipManager;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id obj;

  p_clipManager = &self->_clipManager;
  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_clipManager);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_clipManager);
    objc_msgSend(v6, "removeObserver:", self);

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraTimelapseClipManager setTimelapseClips:](self, "setTimelapseClips:", v7);

  v8 = objc_storeWeak((id *)p_clipManager, obj);
  v9 = v8;
  if (obj)
  {
    v10 = objc_loadWeakRetained((id *)p_clipManager);
    -[HFCameraTimelapseClipManager updateQueue](self, "updateQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:queue:", self, v11);

    -[HFCameraTimelapseClipManager fetchTimelapseClips](self, "fetchTimelapseClips");
  }

}

- (void)fetchTimelapseClips
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x1DuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HFCameraTimelapseClipManager timelapseClips](self, "timelapseClips");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134217984;
    v9 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Begin timelapse clip fetching with cached count:%ld", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v5, -864000.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraTimelapseClipManager setOldestValidDateForTimeline:](self, "setOldestValidDateForTimeline:", v6);

  -[HFCameraTimelapseClipManager oldestValidDateForTimeline](self, "oldestValidDateForTimeline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraTimelapseClipManager fetchClipsFromStartDate:toEndDate:limit:](self, "fetchClipsFromStartDate:toEndDate:limit:", v7, v5, 100000);

}

- (void)fetchClipsFromStartDate:(id)a3 toEndDate:(id)a4 limit:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17[2];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v9);
  HFLogForCategory(0x1DuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[HFCameraTimelapseClipManager oldestFetchedClip](self, "oldestFetchedClip");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v10;
    v20 = 2048;
    v21 = a5;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Fetching timelapse clips with date interval:%@ limit:%ld oldestClip:%@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  -[HFCameraTimelapseClipManager clipManager](self, "clipManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__HFCameraTimelapseClipManager_fetchClipsFromStartDate_toEndDate_limit___block_invoke;
  v15[3] = &unk_1EA733390;
  objc_copyWeak(v17, (id *)buf);
  v14 = v8;
  v16 = v14;
  v17[1] = (id)a5;
  objc_msgSend(v13, "fetchClipsWithDateInterval:quality:limit:shouldOrderAscending:completion:", v10, 1, a5, 1, v15);

  objc_destroyWeak(v17);
  objc_destroyWeak((id *)buf);

}

void __72__HFCameraTimelapseClipManager_fetchClipsFromStartDate_toEndDate_limit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HFLogForCategory(0x1DuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v24 = 138412290;
      v25 = (uint64_t)v6;
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "Timelapse clip fetch error:%@", (uint8_t *)&v24, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 134217984;
      v25 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Returned timelapse clips count %ld", (uint8_t *)&v24, 0xCu);
    }

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "timelapseClips");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v11);

      objc_msgSend(WeakRetained, "setTimelapseClips:", v10);
    }
    objc_msgSend(v5, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setOldestFetchedClip:", v9);
  }

  objc_msgSend(WeakRetained, "oldestValidDateForTimeline");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v14 = v13;

  if (v14 >= 0.0)
  {
    HFLogForCategory(0x1DuLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "timelapseClips");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");
      v24 = 134217984;
      v25 = v23;
      _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, "Finished fetching timelapse clips with count:%ld", (uint8_t *)&v24, 0xCu);

    }
  }
  else
  {
    objc_msgSend(WeakRetained, "oldestFetchedClip");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0C99D68];
    if (v15)
    {
      objc_msgSend(WeakRetained, "oldestFetchedClip");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "startDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dateWithTimeInterval:sinceDate:", v18, -86400.0);
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "oldestFetchedClip");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "fetchClipsFromStartDate:toEndDate:limit:", v19, v21, *(_QWORD *)(a1 + 48));

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 32), -86400.0);
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "fetchClipsFromStartDate:toEndDate:limit:", v19, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    }
  }

}

- (void)clipManager:(id)a3 didUpdateClips:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  HFCameraTimelapseClipManager *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraTimelapseClipManager updateQueue](self, "updateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

  }
  objc_msgSend(v5, "na_map:", &__block_literal_global_11_5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraTimelapseClipManager timelapseClips](self, "timelapseClips");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v14, "uniqueIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
      }
      while (v11);
    }
    v30 = self;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v32 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          objc_msgSend(v21, "uniqueIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, v22);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
      }
      while (v18);
    }

    objc_msgSend(v8, "allValues");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sortedArrayUsingComparator:", &__block_literal_global_14_6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "lastObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x1DuLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v25, "uniqueIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "startDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "duration");
      *(_DWORD *)buf = 138412802;
      v40 = v27;
      v41 = 2112;
      v42 = v28;
      v43 = 2048;
      v44 = v29;
      _os_log_impl(&dword_1DD34E000, v26, OS_LOG_TYPE_DEFAULT, "Last timelapse clip after update: %@ startDate:%@ duration:%.2f", buf, 0x20u);

    }
    -[HFCameraTimelapseClipManager setTimelapseClips:](v30, "setTimelapseClips:", v24);

  }
}

id __59__HFCameraTimelapseClipManager_clipManager_didUpdateClips___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "quality") == 1)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t __59__HFCameraTimelapseClipManager_clipManager_didUpdateClips___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "dateOfOccurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateOfOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (HMCameraClipManager)clipManager
{
  return (HMCameraClipManager *)objc_loadWeakRetained((id *)&self->_clipManager);
}

- (HMCameraClip)oldestFetchedClip
{
  return self->_oldestFetchedClip;
}

- (void)setOldestFetchedClip:(id)a3
{
  objc_storeStrong((id *)&self->_oldestFetchedClip, a3);
}

- (NSDate)oldestValidDateForTimeline
{
  return self->_oldestValidDateForTimeline;
}

- (void)setOldestValidDateForTimeline:(id)a3
{
  objc_storeStrong((id *)&self->_oldestValidDateForTimeline, a3);
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_updateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_oldestValidDateForTimeline, 0);
  objc_storeStrong((id *)&self->_oldestFetchedClip, 0);
  objc_destroyWeak((id *)&self->_clipManager);
  objc_storeStrong((id *)&self->_timelapseClips, 0);
}

@end
