@implementation HFCameraPlaybackEngineEventCache

- (HFCameraPlaybackEngineEventCache)init
{
  HFCameraPlaybackEngineEventCache *v2;
  HFCameraPlaybackEngineEventCache *v3;
  NSArray *rawEvents;
  NSArray *v5;
  NSDictionary *rawEventsByUniqueIdentifier;
  NSArray *events;
  NSArray *clips;
  uint64_t v9;
  NSMapTable *firstOfTheDayClips;
  uint64_t v11;
  NSMapTable *firstOfTheDayEvents;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *workQueue;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HFCameraPlaybackEngineEventCache;
  v2 = -[HFCameraPlaybackEngineEventCache init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    rawEvents = v2->_rawEvents;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_rawEvents = (NSArray *)MEMORY[0x1E0C9AA60];

    rawEventsByUniqueIdentifier = v3->_rawEventsByUniqueIdentifier;
    v3->_rawEventsByUniqueIdentifier = (NSDictionary *)MEMORY[0x1E0C9AA70];

    events = v3->_events;
    v3->_events = v5;

    clips = v3->_clips;
    v3->_clips = v5;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    firstOfTheDayClips = v3->_firstOfTheDayClips;
    v3->_firstOfTheDayClips = (NSMapTable *)v9;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    firstOfTheDayEvents = v3->_firstOfTheDayEvents;
    v3->_firstOfTheDayEvents = (NSMapTable *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.HFCameraPlaybackEngineEventCache.workQueue", v13);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v14;

    -[HFCameraPlaybackEngineEventCache _setupDebugHandler](v3, "_setupDebugHandler");
  }
  return v3;
}

- (void)setRawEvents:(id)a3
{
  NSArray *v4;
  NSArray *rawEvents;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  rawEvents = self->_rawEvents;
  self->_rawEvents = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)rawEvents
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_rawEvents;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setRawEventsByUniqueIdentifier:(id)a3
{
  NSDictionary *v4;
  NSDictionary *rawEventsByUniqueIdentifier;

  v4 = (NSDictionary *)a3;
  os_unfair_lock_lock_with_options();
  rawEventsByUniqueIdentifier = self->_rawEventsByUniqueIdentifier;
  self->_rawEventsByUniqueIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDictionary)rawEventsByUniqueIdentifier
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_rawEventsByUniqueIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setEvents:(id)a3
{
  NSArray *v4;
  NSArray *events;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  events = self->_events;
  self->_events = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)events
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_events;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_events
{
  NSObject *v3;

  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPlaybackEngineEventCache workQueue](self, "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

  }
  return self->_events;
}

- (void)setClips:(id)a3
{
  NSArray *v4;
  NSArray *clips;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  clips = self->_clips;
  self->_clips = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)clips
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_clips;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setClipWithLongestDuration:(id)a3
{
  HMCameraClip *v4;
  HMCameraClip *clipWithLongestDuration;

  v4 = (HMCameraClip *)a3;
  os_unfair_lock_lock_with_options();
  clipWithLongestDuration = self->_clipWithLongestDuration;
  self->_clipWithLongestDuration = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMCameraClip)clipWithLongestDuration
{
  os_unfair_lock_s *p_lock;
  HMCameraClip *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_clipWithLongestDuration;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setFirstOfTheDayEvents:(id)a3
{
  NSMapTable *v4;
  NSMapTable *firstOfTheDayEvents;

  v4 = (NSMapTable *)a3;
  os_unfair_lock_lock_with_options();
  firstOfTheDayEvents = self->_firstOfTheDayEvents;
  self->_firstOfTheDayEvents = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSMapTable)firstOfTheDayEvents
{
  os_unfair_lock_s *p_lock;
  NSMapTable *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_firstOfTheDayEvents;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setFirstOfTheDayClips:(id)a3
{
  NSMapTable *v4;
  NSMapTable *firstOfTheDayClips;

  v4 = (NSMapTable *)a3;
  os_unfair_lock_lock_with_options();
  firstOfTheDayClips = self->_firstOfTheDayClips;
  self->_firstOfTheDayClips = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSMapTable)firstOfTheDayClips
{
  os_unfair_lock_s *p_lock;
  NSMapTable *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_firstOfTheDayClips;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isFirstEventOfTheDay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[HFCameraPlaybackEngineEventCache firstOfTheDayEvents](self, "firstOfTheDayEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateOfOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_startOfDay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v9, "isEqual:", v10);
  return (char)v4;
}

- (id)firstOfTheDayClipForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFCameraPlaybackEngineEventCache firstOfTheDayClips](self, "firstOfTheDayClips");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_startOfDay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    HFLogForCategory(0x17uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "hf_prettyDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Found first of the day clip for date: %@; clip: %@",
        (uint8_t *)&v11,
        0x16u);

    }
  }

  return v7;
}

- (id)daysWithClips
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFCameraPlaybackEngineEventCache firstOfTheDayClips](self, "firstOfTheDayClips");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateWithEvents:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  -[HFCameraPlaybackEngineEventCache workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPlaybackEngineEventCache _updateWithEvents:completion:](self, "_updateWithEvents:completion:", v6, v7);
  }
  else
  {
    objc_initWeak(&location, self);
    -[HFCameraPlaybackEngineEventCache workQueue](self, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__HFCameraPlaybackEngineEventCache_updateWithEvents_completion___block_invoke;
    v10[3] = &unk_1EA726508;
    objc_copyWeak(&v13, &location);
    v11 = v6;
    v12 = v7;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __64__HFCameraPlaybackEngineEventCache_updateWithEvents_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_updateWithEvents:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_updateWithEvents:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPlaybackEngineEventCache workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v8);

  }
  HFLogForCategory(0x17uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[HFCameraPlaybackEngineEventCache _updateWithEvents:completion:]";
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__HFCameraPlaybackEngineEventCache__updateWithEvents_completion___block_invoke;
  v11[3] = &unk_1EA726530;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  -[HFCameraPlaybackEngineEventCache _validateAndInsertRawEvents:completion:](self, "_validateAndInsertRawEvents:completion:", v7, v11);

}

uint64_t __65__HFCameraPlaybackEngineEventCache__updateWithEvents_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_generateViewModelWithUpdatedIdentifiers:replacedIdentifiers:completion:", a2, a3, *(_QWORD *)(a1 + 40));
}

- (void)removeEventUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  -[HFCameraPlaybackEngineEventCache workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPlaybackEngineEventCache _removeEventUUIDs:completion:](self, "_removeEventUUIDs:completion:", v6, v7);
  }
  else
  {
    objc_initWeak(&location, self);
    -[HFCameraPlaybackEngineEventCache workQueue](self, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__HFCameraPlaybackEngineEventCache_removeEventUUIDs_completion___block_invoke;
    v10[3] = &unk_1EA726508;
    objc_copyWeak(&v13, &location);
    v11 = v6;
    v12 = v7;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __64__HFCameraPlaybackEngineEventCache_removeEventUUIDs_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_removeEventUUIDs:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_removeEventUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[5];
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v6 = a3;
  v7 = a4;
  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPlaybackEngineEventCache workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v8);

  }
  -[HFCameraPlaybackEngineEventCache rawEvents](self, "rawEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  -[HFCameraPlaybackEngineEventCache rawEventsByUniqueIdentifier](self, "rawEventsByUniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  -[HFCameraPlaybackEngineEventCache clipWithLongestDuration](self, "clipWithLongestDuration");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __65__HFCameraPlaybackEngineEventCache__removeEventUUIDs_completion___block_invoke;
  v32[3] = &unk_1EA726558;
  v16 = v12;
  v33 = v16;
  v37 = &v38;
  v17 = v13;
  v34 = v17;
  v18 = v14;
  v35 = v18;
  v19 = v10;
  v36 = v19;
  objc_msgSend(v6, "na_each:", v32);
  if (!v39[5])
  {
    v31[0] = v15;
    v31[1] = 3221225472;
    v31[2] = __65__HFCameraPlaybackEngineEventCache__removeEventUUIDs_completion___block_invoke_2;
    v31[3] = &unk_1EA726580;
    v31[4] = &v38;
    objc_msgSend(v19, "na_each:", v31);
    -[HFCameraPlaybackEngineEventCache setClipWithLongestDuration:](self, "setClipWithLongestDuration:", v39[5]);
  }
  if (objc_msgSend(v18, "count"))
  {
    -[HFCameraPlaybackEngineEventCache events](self, "events");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v15;
    v28[1] = 3221225472;
    v28[2] = __65__HFCameraPlaybackEngineEventCache__removeEventUUIDs_completion___block_invoke_3;
    v28[3] = &unk_1EA7265A8;
    v29 = v18;
    v30 = v17;
    objc_msgSend(v20, "na_each:", v28);

  }
  -[HFCameraPlaybackEngineEventCache setRawEvents:](self, "setRawEvents:", v19);
  -[HFCameraPlaybackEngineEventCache setRawEventsByUniqueIdentifier:](self, "setRawEventsByUniqueIdentifier:", v16);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __65__HFCameraPlaybackEngineEventCache__removeEventUUIDs_completion___block_invoke_4;
  v25[3] = &unk_1EA7265D0;
  v23 = v7;
  v27 = v23;
  v24 = v17;
  v26 = v24;
  -[HFCameraPlaybackEngineEventCache _generateViewModelWithUpdatedIdentifiers:replacedIdentifiers:completion:](self, "_generateViewModelWithUpdatedIdentifiers:replacedIdentifiers:completion:", v21, v22, v25);

  _Block_object_dispose(&v38, 8);
}

void __65__HFCameraPlaybackEngineEventCache__removeEventUUIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "containerType") == 1)
    {
      objc_msgSend(v4, "duration");
      v6 = v5;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "duration");
      if (vabdd_f64(v6, v7) < 2.22044605e-16)
      {
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v9 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = 0;

      }
      v10 = *(void **)(a1 + 40);
    }
    else
    {
      v10 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    objc_msgSend(*(id *)(a1 + 56), "removeObject:", v4);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, v12);
  }

}

void __65__HFCameraPlaybackEngineEventCache__removeEventUUIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  id v15;

  v15 = a2;
  if (objc_msgSend(v15, "containerType") != 1)
    goto LABEL_15;
  v3 = objc_opt_class();
  v4 = v15;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v4;
    if (v5)
      goto LABEL_9;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v3, objc_opt_class());

  }
  v6 = 0;
LABEL_9:

  objc_msgSend(v6, "duration");
  v10 = v9;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "duration");
  v12 = v10 <= v11;
  v13 = vabdd_f64(v10, v11);
  if (!v12 && v13 >= 2.22044605e-16)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v6);

LABEL_15:
}

void __65__HFCameraPlaybackEngineEventCache__removeEventUUIDs_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (objc_msgSend(v13, "containerType") != 2)
    goto LABEL_12;
  v3 = objc_opt_class();
  v4 = v13;
  if (!v4)
    goto LABEL_8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v3, objc_opt_class());

LABEL_8:
    v6 = 0;
  }

  objc_msgSend(v6, "eventUniqueIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intersectsSet:", *(_QWORD *)(a1 + 32));

  if (v10)
  {
    v11 = *(void **)(a1 + 40);
    objc_msgSend(v6, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
LABEL_12:

}

uint64_t __65__HFCameraPlaybackEngineEventCache__removeEventUUIDs_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_validateAndInsertRawEvents:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id, id);
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  HFCameraPlaybackEngineEventCache *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _BYTE *v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id, id))a4;
  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPlaybackEngineEventCache workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v8);

  }
  HFLogForCategory(0x17uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[HFCameraPlaybackEngineEventCache _validateAndInsertRawEvents:completion:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "%s, with (%lu) events", buf, 0x16u);
  }

  -[HFCameraPlaybackEngineEventCache rawEventsByUniqueIdentifier](self, "rawEventsByUniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  -[HFCameraPlaybackEngineEventCache rawEvents](self, "rawEvents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  -[HFCameraPlaybackEngineEventCache clipWithLongestDuration](self, "clipWithLongestDuration");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __75__HFCameraPlaybackEngineEventCache__validateAndInsertRawEvents_completion___block_invoke;
  v23 = &unk_1EA726620;
  v24 = self;
  v29 = buf;
  v16 = v11;
  v25 = v16;
  v17 = v13;
  v26 = v17;
  v18 = v14;
  v27 = v18;
  v19 = v15;
  v28 = v19;
  objc_msgSend(v6, "na_each:", &v20);
  -[HFCameraPlaybackEngineEventCache setRawEvents:](self, "setRawEvents:", v17, v20, v21, v22, v23, v24);
  -[HFCameraPlaybackEngineEventCache setRawEventsByUniqueIdentifier:](self, "setRawEventsByUniqueIdentifier:", v16);
  -[HFCameraPlaybackEngineEventCache setClipWithLongestDuration:](self, "setClipWithLongestDuration:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  if (v7)
    v7[2](v7, v18, v19);

  _Block_object_dispose(buf, 8);
}

void __75__HFCameraPlaybackEngineEventCache__validateAndInsertRawEvents_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend((id)objc_opt_class(), "isValidEvent:", v3))
  {
    if (objc_msgSend(v3, "containerType") != 1)
      goto LABEL_16;
    v4 = objc_opt_class();
    v5 = v3;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v5;
      if (v6)
        goto LABEL_10;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v4, objc_opt_class());

    }
    v7 = 0;
LABEL_10:

    objc_msgSend(v7, "hf_sortSignificantEvents");
    objc_msgSend(v7, "duration");
    v11 = v10;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "duration");
    v13 = v11 <= v12;
    v14 = vabdd_f64(v11, v12);
    if (!v13 && v14 >= 2.22044605e-16)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v7);

LABEL_16:
    v16 = *(void **)(a1 + 40);
    objc_msgSend(v3, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v3, "dateOfOccurrence");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dateOfOccurrence");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqualToDate:", v20);

      v22 = *(void **)(a1 + 48);
      if (!v21)
      {
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __75__HFCameraPlaybackEngineEventCache__validateAndInsertRawEvents_completion___block_invoke_11;
        v48[3] = &unk_1EA7265F8;
        v31 = v3;
        v49 = v31;
        v32 = objc_msgSend(v22, "indexOfObjectPassingTest:", v48);
        if (v32 == 0x7FFFFFFFFFFFFFFFLL)
        {
          HFLogForCategory(0x17uLL);
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v51 = v31;
            _os_log_error_impl(&dword_1DD34E000, v33, OS_LOG_TYPE_ERROR, "Could not locate existing event using indexOfObjectPassingTest: %@", buf, 0xCu);
          }

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 48), "removeObjectAtIndex:", v32);
          v39 = *(void **)(a1 + 40);
          objc_msgSend(v31, "uniqueIdentifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setObject:forKeyedSubscript:", 0, v40);

        }
        v41 = *(void **)(a1 + 48);
        +[HFCameraUtilities cameraRecordingEventDateOfOccurenceComparator](HFCameraUtilities, "cameraRecordingEventDateOfOccurenceComparator");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v41, "hf_insertObject:intoSortedArrayWithOptions:comparator:", v31, 1024, v42);

        if (v43 == 0x7FFFFFFFFFFFFFFFLL)
        {
          HFLogForCategory(0x17uLL);
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v51 = v31;
            _os_log_error_impl(&dword_1DD34E000, v44, OS_LOG_TYPE_ERROR, "Invalid insertion index after removing existing event: %@", buf, 0xCu);
          }
        }
        else
        {
          v45 = *(void **)(a1 + 40);
          objc_msgSend(v31, "uniqueIdentifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setObject:forKeyedSubscript:", v31, v46);

          v47 = *(void **)(a1 + 64);
          objc_msgSend(v31, "uniqueIdentifier");
          v44 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addObject:", v44);
        }

        goto LABEL_37;
      }
      v23 = objc_msgSend(*(id *)(a1 + 48), "count");
      +[HFCameraUtilities cameraRecordingEventDateOfOccurenceComparator](HFCameraUtilities, "cameraRecordingEventDateOfOccurenceComparator");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v22, "indexOfObject:inSortedRange:options:usingComparator:", v18, 0, v23, 256, v24);

      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      {
        HFLogForCategory(0x17uLL);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v3;
          v27 = "Could not locate existing event using indexOfObject: %@";
LABEL_40:
          _os_log_error_impl(&dword_1DD34E000, v26, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);
          goto LABEL_23;
        }
        goto LABEL_23;
      }
      objc_msgSend(*(id *)(a1 + 48), "replaceObjectAtIndex:withObject:", v25, v3);
      v36 = *(void **)(a1 + 40);
      objc_msgSend(v3, "uniqueIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v3, v37);

      v38 = *(void **)(a1 + 56);
      objc_msgSend(v3, "uniqueIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObject:", v35);
    }
    else
    {
      v28 = *(void **)(a1 + 48);
      +[HFCameraUtilities cameraRecordingEventDateOfOccurenceComparator](HFCameraUtilities, "cameraRecordingEventDateOfOccurenceComparator");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "hf_insertObject:intoSortedArrayWithOptions:comparator:", v3, 1024, v29);

      if (v30 == 0x7FFFFFFFFFFFFFFFLL)
      {
        HFLogForCategory(0x17uLL);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v3;
          v27 = "Invalid insertion index: %@";
          goto LABEL_40;
        }
LABEL_23:

LABEL_37:
        goto LABEL_38;
      }
      v34 = *(void **)(a1 + 40);
      objc_msgSend(v3, "uniqueIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v3, v35);
    }

    goto LABEL_37;
  }
LABEL_38:

}

uint64_t __75__HFCameraPlaybackEngineEventCache__validateAndInsertRawEvents_completion___block_invoke_11(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (void)_generateViewModelWithUpdatedIdentifiers:(id)a3 replacedIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  HFCameraScrubberReachabilityEventContainer *v30;
  HFCameraScrubberReachabilityEventContainer *v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void (**v40)(id, id, id);
  _QWORD block[4];
  id v42;
  id v43;
  void (**v44)(id, id, id);
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  _QWORD aBlock[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v40 = (void (**)(id, id, id))a5;
  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPlaybackEngineEventCache workQueue](self, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v10);

  }
  -[HFCameraPlaybackEngineEventCache rawEvents](self, "rawEvents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__HFCameraPlaybackEngineEventCache__generateViewModelWithUpdatedIdentifiers_replacedIdentifiers_completion___block_invoke;
  aBlock[3] = &unk_1EA726648;
  v18 = v16;
  v57 = v18;
  v35 = v8;
  v58 = v35;
  v36 = v9;
  v59 = v36;
  v37 = v14;
  v60 = v37;
  v38 = v15;
  v61 = v38;
  v39 = v12;
  v62 = v39;
  v19 = v13;
  v63 = v19;
  v20 = _Block_copy(aBlock);
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy_;
  v54 = __Block_byref_object_dispose_;
  v55 = 0;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __108__HFCameraPlaybackEngineEventCache__generateViewModelWithUpdatedIdentifiers_replacedIdentifiers_completion___block_invoke_2;
  v45[3] = &unk_1EA726670;
  v49 = &v50;
  v21 = v11;
  v46 = v21;
  v22 = v20;
  v48 = v22;
  v23 = v17;
  v47 = v23;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v45);
  if (v51[5])
  {
    objc_msgSend(v21, "lastObject", v35, v36);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v25 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
    v27 = v26;

    if (objc_msgSend(v27, "isReachable"))
      v28 = v27;
    else
      v28 = 0;
    v29 = v28;
    v30 = [HFCameraScrubberReachabilityEventContainer alloc];
    v31 = -[HFCameraScrubberReachabilityEventContainer initWithStartEvent:endEvent:](v30, "initWithStartEvent:endEvent:", v51[5], v29);
    (*((void (**)(id, HFCameraScrubberReachabilityEventContainer *))v22 + 2))(v22, v31);

  }
  HFLogForCategory(0x17uLL);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = objc_msgSend(v18, "count");
    *(_DWORD *)buf = 136315394;
    v65 = "-[HFCameraPlaybackEngineEventCache _generateViewModelWithUpdatedIdentifiers:replacedIdentifiers:completion:]";
    v66 = 2048;
    v67 = v33;
    _os_log_impl(&dword_1DD34E000, v32, OS_LOG_TYPE_DEFAULT, "%s, adding events to cache with total count: %lu", buf, 0x16u);
  }

  -[HFCameraPlaybackEngineEventCache setEvents:](self, "setEvents:", v18);
  -[HFCameraPlaybackEngineEventCache setClips:](self, "setClips:", v23);
  -[HFCameraPlaybackEngineEventCache setFirstOfTheDayClips:](self, "setFirstOfTheDayClips:", v39);
  -[HFCameraPlaybackEngineEventCache setFirstOfTheDayEvents:](self, "setFirstOfTheDayEvents:", v19);
  if (v40)
  {
    if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
    {
      v40[2](v40, v37, v38);
    }
    else
    {
      -[HFCameraPlaybackEngineEventCache workQueue](self, "workQueue");
      v34 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __108__HFCameraPlaybackEngineEventCache__generateViewModelWithUpdatedIdentifiers_replacedIdentifiers_completion___block_invoke_16;
      block[3] = &unk_1EA726698;
      v44 = v40;
      v42 = v37;
      v43 = v38;
      dispatch_async(v34, block);

    }
  }

  _Block_object_dispose(&v50, 8);
}

void __108__HFCameraPlaybackEngineEventCache__generateViewModelWithUpdatedIdentifiers_replacedIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  if (objc_msgSend(v3, "containerType") != 2)
  {
    v12 = *(void **)(a1 + 40);
    objc_msgSend(v3, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend(v12, "containsObject:", v13);

    if ((v12 & 1) != 0)
      goto LABEL_12;
    v17 = *(void **)(a1 + 48);
    objc_msgSend(v3, "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = objc_msgSend(v17, "containsObject:", v18);

    if ((v17 & 1) == 0)
      goto LABEL_18;
    goto LABEL_16;
  }
  v4 = objc_opt_class();
  v5 = v3;
  if (!v5)
    goto LABEL_8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v5;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v4, objc_opt_class());

LABEL_8:
    v7 = 0;
  }

  objc_msgSend(v7, "eventUniqueIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intersectsSet:", *(_QWORD *)(a1 + 40));

  if (v11)
  {

LABEL_12:
    v14 = *(void **)(a1 + 56);
LABEL_17:
    objc_msgSend(v3, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v19);

    goto LABEL_18;
  }
  objc_msgSend(v7, "eventUniqueIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "intersectsSet:", *(_QWORD *)(a1 + 48));

  if (v16)
  {
LABEL_16:
    v14 = *(void **)(a1 + 64);
    goto LABEL_17;
  }
LABEL_18:
  v20 = *(void **)(a1 + 80);
  v21 = *(id *)(a1 + 72);
  v22 = v20;
  v41 = v3;
  objc_msgSend(v41, "dateOfOccurrence");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "hf_startOfDay");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v41, "containerType") == 1)
  {
    objc_msgSend(v21, "objectForKey:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      objc_msgSend(v25, "dateOfOccurrence");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "dateOfOccurrence");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "compare:", v28);

      if (v29 != 1)
        goto LABEL_29;
    }
    v30 = objc_opt_class();
    v31 = v41;
    if (v31)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v32 = v31;
      else
        v32 = 0;
      v33 = v31;
      if (v32)
        goto LABEL_28;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v30, objc_opt_class());

    }
    v33 = 0;
LABEL_28:

    objc_msgSend(v21, "setObject:forKey:", v33, v24);
LABEL_29:

  }
  objc_msgSend(v22, "objectForKey:", v24);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (!v36
    || (objc_msgSend(v36, "dateOfOccurrence"),
        v38 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v41, "dateOfOccurrence"),
        v39 = (void *)objc_claimAutoreleasedReturnValue(),
        v40 = objc_msgSend(v38, "compare:", v39),
        v39,
        v38,
        v40 == 1))
  {
    objc_msgSend(v22, "setObject:forKey:", v41, v24);
  }

}

void __108__HFCameraPlaybackEngineEventCache__generateViewModelWithUpdatedIdentifiers_replacedIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  HFCameraScrubberReachabilityEventContainer *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a2;
  v5 = objc_msgSend(v26, "containerType");
  if (v5 == 2)
  {
    v21 = objc_opt_class();
    v22 = v26;
    if (v22)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v22;
      else
        v23 = 0;
      v9 = v22;
      if (v23)
      {
LABEL_26:

        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) && (objc_msgSend(v9, "isReachable") & 1) == 0)
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v9);
        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v21, objc_opt_class());

    }
    v9 = 0;
    goto LABEL_26;
  }
  if (v5 == 1)
  {
    v6 = objc_opt_class();
    v7 = v26;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
      v9 = v7;
      if (v8)
        goto LABEL_10;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v6, objc_opt_class());

    }
    v9 = 0;
LABEL_10:

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3 - 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v13 = v12;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v14;

      if (objc_msgSend(v15, "isReachable"))
        v16 = v15;
      else
        v16 = v9;
      v17 = v16;
      v18 = -[HFCameraScrubberReachabilityEventContainer initWithStartEvent:endEvent:]([HFCameraScrubberReachabilityEventContainer alloc], "initWithStartEvent:endEvent:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v17);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = 0;

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
LABEL_29:

  }
}

uint64_t __108__HFCameraPlaybackEngineEventCache__generateViewModelWithUpdatedIdentifiers_replacedIdentifiers_completion___block_invoke_16(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (BOOL)isValidEvent:(id)a3
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  double v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6 && -[NSObject quality](v6, "quality"))
  {
    HFLogForCategory(0x17uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "[INVALID]: timeline ineligible: %@", (uint8_t *)&v16, 0xCu);
    }

LABEL_9:
    v8 = 0;
    goto LABEL_18;
  }

  v9 = v4;
  if (-[NSObject isComplete](v9, "isComplete"))
  {
    -[NSObject duration](v9, "duration");
    if (fabs(v10) < 2.22044605e-16)
    {
      HFLogForCategory(0x17uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412290;
        v17 = v9;
        _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "[INVALID]: not displayable: %@", (uint8_t *)&v16, 0xCu);
      }
      goto LABEL_9;
    }
  }

  v11 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -*MEMORY[0x1E0CB8400]);
  v6 = objc_claimAutoreleasedReturnValue();
  -[NSObject dateOfOccurrence](v11, "dateOfOccurrence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "compare:", v6);

  v8 = v13 == 1;
  if (v13 != 1)
  {
    HFLogForCategory(0x17uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v11;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "[INVALID]: expired: %@", (uint8_t *)&v16, 0xCu);
    }

  }
LABEL_18:

  return v8;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x17uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[HFCameraPlaybackEngineEventCache dealloc]";
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)HFCameraPlaybackEngineEventCache;
  -[HFCameraPlaybackEngineEventCache dealloc](&v4, sel_dealloc);
}

- (void)_setupDebugHandler
{
  void *v2;
  objc_class *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  +[HFDebugStateDumpManager sharedInstance](HFDebugStateDumpManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__HFCameraPlaybackEngineEventCache__setupDebugHandler__block_invoke;
  v6[3] = &unk_1EA7266C0;
  objc_copyWeak(&v7, &location);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "registerStateDumpHandler:withName:", v6, v4);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

id __54__HFCameraPlaybackEngineEventCache__setupDebugHandler__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[HFStateDumpBuilderContext contextWithDetailLevel:](HFStateDumpBuilderContext, "contextWithDetailLevel:", 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", WeakRetained, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "events");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("events"));

    objc_msgSend(WeakRetained, "clips");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("clips"));

    objc_msgSend(WeakRetained, "firstOfTheDayEvents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("firstOfTheDayEvents"));

    objc_msgSend(WeakRetained, "firstOfTheDayClips");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("firstOfTheDayClips"));

    objc_msgSend(v3, "buildPropertyListRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v8;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_firstOfTheDayEvents, 0);
  objc_storeStrong((id *)&self->_firstOfTheDayClips, 0);
  objc_storeStrong((id *)&self->_clipWithLongestDuration, 0);
  objc_storeStrong((id *)&self->_clips, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_rawEventsByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_rawEvents, 0);
}

@end
