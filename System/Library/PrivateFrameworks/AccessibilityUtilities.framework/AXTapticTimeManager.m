@implementation AXTapticTimeManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_35);
  return (id)sharedInstance__sHapticOutputShared;
}

void __37__AXTapticTimeManager_sharedInstance__block_invoke()
{
  AXTapticTimeManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXTapticTimeManager);
  v1 = (void *)sharedInstance__sHapticOutputShared;
  sharedInstance__sHapticOutputShared = (uint64_t)v0;

}

- (AXTapticTimeManager)init
{
  AXTapticTimeManager *v2;
  AXTapticTimeManager *v3;
  uint64_t v4;
  NSHashTable *observers;
  NSMutableArray *v6;
  NSMutableArray *enqueuedSounds;
  NSMutableArray *v8;
  NSMutableArray *enqueuedSoundDelays;
  NSMutableDictionary *v10;
  NSMutableDictionary *soundToPatterns;
  NSMutableDictionary *v12;
  NSMutableDictionary *hapticsDescriptions;
  void *v14;
  os_activity_t v15;
  OS_os_activity *activity;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AXTapticTimeManager;
  v2 = -[AXTapticTimeManager init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AXTapticTimeManager setAssertionID:](v2, "setAssertionID:", 0);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    enqueuedSounds = v3->_enqueuedSounds;
    v3->_enqueuedSounds = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    enqueuedSoundDelays = v3->_enqueuedSoundDelays;
    v3->_enqueuedSoundDelays = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    soundToPatterns = v3->_soundToPatterns;
    v3->_soundToPatterns = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    hapticsDescriptions = v3->_hapticsDescriptions;
    v3->_hapticsDescriptions = v12;

    -[AXTapticTimeManager _updateHapticPatternsIfNecessary:](v3, "_updateHapticPatternsIfNecessary:", 0);
    -[AXTapticTimeManager _updateIs24HourTime](v3, "_updateIs24HourTime");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v3, sel__localeDidChange_, *MEMORY[0x1E0C99720], 0);

    v15 = _os_activity_create(&dword_18C62B000, "Taptic Time", MEMORY[0x1E0C80FE0], OS_ACTIVITY_FLAG_DETACHED);
    activity = v3->_activity;
    v3->_activity = (OS_os_activity *)v15;

  }
  return v3;
}

- (void)_updateHapticPatternsIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  NSNumber *cachedSpeed;
  float v5;
  double v6;
  void *v7;
  float v8;
  double v9;
  unint64_t v10;
  void *v11;
  void *v12;
  NSNumber *v13;
  NSNumber *v14;
  float v15;
  double v16;
  double v17;
  float v18;
  void *v19;
  void *v20;
  unint64_t v21;
  double v22;
  void *v23;
  float v24;
  double v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSMutableDictionary *hapticsDescriptions;
  void *v36;
  NSMutableDictionary *soundToPatterns;
  void *v38;
  void *v39;
  void *v40;
  NSMutableDictionary *v41;
  float v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSMutableDictionary *v49;
  void *v50;
  NSMutableDictionary *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  int v62;
  BOOL v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  unsigned int *v68;
  void *v69;
  NSMutableDictionary *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSMutableDictionary *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  _QWORD v80[2];
  _QWORD v81[2];
  uint64_t v82;
  void *v83;
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  uint64_t v88;
  void *v89;
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  uint64_t v94;
  void *v95;
  _QWORD v96[2];
  _QWORD v97[2];
  _QWORD v98[4];
  _QWORD v99[4];
  _QWORD v100[4];
  _QWORD v101[6];

  v3 = a3;
  v101[4] = *MEMORY[0x1E0C80C00];
  cachedSpeed = self->_cachedSpeed;
  if (!cachedSpeed
    || (-[NSNumber floatValue](cachedSpeed, "floatValue"),
        v6 = v5,
        +[AXSettings sharedInstance](AXSettings, "sharedInstance"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "voiceOverTapticTimeSpeed"),
        v9 = vabdd_f64(v6, v8),
        v7,
        v9 >= 2.22044605e-16))
  {
    if (v3)
      -[AXTapticTimeManager _cleanupHapticsDict](self, "_cleanupHapticsDict");
    v10 = 0x1E0CB3000uLL;
    v11 = (void *)MEMORY[0x1E0CB37E8];
    +[AXSettings sharedInstance](AXSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "voiceOverTapticTimeSpeed");
    objc_msgSend(v11, "numberWithFloat:");
    v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = self->_cachedSpeed;
    self->_cachedSpeed = v13;

    -[NSMutableDictionary removeAllObjects](self->_soundToPatterns, "removeAllObjects");
    -[NSNumber floatValue](self->_cachedSpeed, "floatValue");
    v16 = v15;
    v17 = 0.12 / v15;
    *(float *)&v17 = v17;
    v100[0] = CFSTR("Amplitude");
    v100[1] = CFSTR("StartTime");
    v101[0] = &unk_1E24F9120;
    v101[1] = &unk_1E24F9130;
    v101[2] = CFSTR("BoostSineBrake");
    v100[2] = CFSTR("Type");
    v100[3] = CFSTR("Duration");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v101[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v98[0] = CFSTR("Amplitude");
    v98[1] = CFSTR("StartTime");
    v99[0] = &unk_1E24F9140;
    v99[1] = &unk_1E24F9130;
    v99[2] = CFSTR("BoostSineBrake");
    v98[2] = CFSTR("Type");
    v98[3] = CFSTR("Duration");
    v21 = 0x1E0C99000uLL;
    v18 = 0.37 / v16;
    *(float *)&v22 = v18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v99[3] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 4);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0.35 / v16;
    v25 = 0.65 / v16;
    v26 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v27 = *MEMORY[0x1E0C92510];
    v28 = v24;
    v29 = 0.0;
    v30 = 32;
    v79 = *MEMORY[0x1E0C92510];
    do
    {
      v31 = (void *)objc_msgSend(v20, "mutableCopy");
      objc_msgSend(*(id *)(v10 + 2024), "numberWithDouble:", v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKey:", v32, CFSTR("StartTime"));

      objc_msgSend(v26, "addObject:", v31);
      v96[0] = CFSTR("Amplitude");
      v96[1] = CFSTR("Atoms");
      v97[0] = &unk_1E24F9120;
      v97[1] = v26;
      objc_msgSend(*(id *)(v21 + 3456), "dictionaryWithObjects:forKeys:count:", v97, v96, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = v27;
      v95 = v33;
      objc_msgSend(*(id *)(v21 + 3456), "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
      AudioServicesCreateSystemSoundIDWithOptions();
      v34 = (void *)objc_msgSend(v26, "copy");
      hapticsDescriptions = self->_hapticsDescriptions;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)((char *)&self->super.isa + v30));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](hapticsDescriptions, "setObject:forKeyedSubscript:", v34, v36);

      soundToPatterns = self->_soundToPatterns;
      v92[0] = CFSTR("Intensity");
      v92[1] = CFSTR("VibePattern");
      v93[0] = &unk_1E24F9120;
      -[AXTapticTimeManager _atomToLegacyVibePattern:](self, "_atomToLegacyVibePattern:", v26);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v93[1] = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)((char *)&self->super.isa + v30));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = soundToPatterns;
      v21 = 0x1E0C99000;
      -[NSMutableDictionary setObject:forKey:](v41, "setObject:forKey:", v39, v40);

      v27 = v79;
      v29 = v29 + v28;

      v10 = 0x1E0CB3000;
      v30 += 4;
    }
    while (v30 != 128);
    objc_msgSend(v26, "removeAllObjects");
    v42 = v25;
    v43 = v42;
    v44 = 0.0;
    do
    {
      v45 = (void *)objc_msgSend(v78, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setObject:forKey:", v46, CFSTR("StartTime"));

      objc_msgSend(v26, "addObject:", v45);
      v90[0] = CFSTR("Amplitude");
      v90[1] = CFSTR("Atoms");
      v91[0] = &unk_1E24F9120;
      v91[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v79;
      v89 = v47;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
      AudioServicesCreateSystemSoundIDWithOptions();
      v48 = (void *)objc_msgSend(v26, "copy");
      v49 = self->_hapticsDescriptions;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)((char *)&self->super.isa + v30));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v48, v50);

      v51 = self->_soundToPatterns;
      v86[0] = CFSTR("Intensity");
      v86[1] = CFSTR("VibePattern");
      v87[0] = &unk_1E24F9120;
      -[AXTapticTimeManager _atomToLegacyVibePattern:](self, "_atomToLegacyVibePattern:", v26);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v87[1] = v52;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)((char *)&self->super.isa + v30));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v51, "setObject:forKey:", v53, v54);

      v44 = v44 + v43;
      v30 += 4;
    }
    while (v30 != 224);
    v55 = 0;
    do
    {
      objc_msgSend(v26, "removeAllObjects");
      v56 = 0;
      v57 = 0.0;
      v58 = v26;
      do
      {
        objc_msgSend(&unk_1E24F8E10, "objectAtIndex:", v55);
        v59 = v55;
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "substringWithRange:", v56, 1);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        v62 = objc_msgSend(v61, "isEqualToString:", CFSTR("-"));
        v63 = v62 == 0;
        if (v62)
          v64 = v78;
        else
          v64 = v20;
        if (v63)
          v65 = 0.3;
        else
          v65 = 0.5;
        v66 = (void *)objc_msgSend(v64, "mutableCopy");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v57);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setObject:forKey:", v67, CFSTR("StartTime"));

        objc_msgSend(v58, "addObject:", v66);
        v55 = v59;
        ++v56;
        v57 = v57 + v65;
      }
      while (v56 != 5);
      v84[0] = CFSTR("Amplitude");
      v84[1] = CFSTR("Atoms");
      v85[0] = &unk_1E24F9120;
      v85[1] = v58;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 2);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v79;
      v83 = v77;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
      v68 = &self->_ssIDHapticMorse[v59];
      AudioServicesCreateSystemSoundIDWithOptions();
      v69 = (void *)objc_msgSend(v58, "copy");
      v70 = self->_hapticsDescriptions;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *v68);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v70, "setObject:forKeyedSubscript:", v69, v71);

      v76 = self->_soundToPatterns;
      v80[0] = CFSTR("Intensity");
      v80[1] = CFSTR("VibePattern");
      v81[0] = &unk_1E24F9120;
      -[AXTapticTimeManager _atomToLegacyVibePattern:](self, "_atomToLegacyVibePattern:", v58);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v81[1] = v72;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 2);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *v68);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v76, "setObject:forKey:", v73, v74);

      v55 = v59 + 1;
      v63 = v59 == 9;
      v26 = v58;
    }
    while (!v63);

  }
}

- (void)addObserver:(id)a3
{
  if (a3)
    -[NSHashTable addObject:](self->_observers, "addObject:");
}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (void)_informObserversDidStart
{
  NSObject *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  AXLogTapticTime();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C62B000, v3, OS_LOG_TYPE_DEFAULT, "taptic time did start", buf, 2u);
  }

  os_activity_scope_enter((os_activity_t)self->_activity, &self->_scopeState);
  self->_isCurrentlyOutputting = 1;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_observers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "tapticTimeManagerDidBegin:", self, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

- (void)_informObserversDidStop
{
  NSObject *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  AXLogTapticTime();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C62B000, v3, OS_LOG_TYPE_DEFAULT, "taptic time did stop", buf, 2u);
  }

  os_activity_scope_leave(&self->_scopeState);
  self->_isCurrentlyOutputting = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_observers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "tapticTimeManagerDidComplete:", self, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

- (void)_informObserversWillOutputSSID:(int64_t)a3 hapticsDescriptions:(id)a4
{
  id v6;
  NSObject *v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  int64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  AXLogTapticTime();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v20 = a3;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_18C62B000, v7, OS_LOG_TYPE_INFO, "will output ssid: %zd, hapticsDescriptions: %@", buf, 0x16u);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_observers;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "tapticTimeManager:willOutputSSID:hapticsDescriptions:", self, a3, v6, (_QWORD)v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)_informObserversDidOutputSSID:(int64_t)a3
{
  NSObject *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  AXLogTapticTime();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v18 = a3;
    _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_INFO, "did output ssid: %zd", buf, 0xCu);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_observers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "tapticTimeManager:didOutputSSID:", self, a3, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)_cleanupHapticsDict
{
  uint64_t i;
  uint64_t j;

  for (i = 0; i != 24; ++i)
  {
    AudioServicesDisposeSystemSoundID(self->_ssIDHapticFast[i]);
    AudioServicesDisposeSystemSoundID(self->_ssIDHapticSlow[i]);
  }
  for (j = 0; j != 10; ++j)
    AudioServicesDisposeSystemSoundID(self->_ssIDHapticMorse[j]);
  -[NSMutableDictionary removeAllObjects](self->_hapticsDescriptions, "removeAllObjects");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AXTapticTimeManager _cleanupHapticsDict](self, "_cleanupHapticsDict");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AXTapticTimeManager;
  -[AXTapticTimeManager dealloc](&v4, sel_dealloc);
}

- (id)_atomToLegacyVibePattern:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    v8 = 0.0;
    v9 = MEMORY[0x1E0C9AAB0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKey:", CFSTR("StartTime"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = v13;

        if (v14 > 0.0)
        {
          objc_msgSend(v4, "addObject:", MEMORY[0x1E0C9AAA0]);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v14 - v8) * 1000.0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v15);

        }
        objc_msgSend(v11, "objectForKey:", CFSTR("Duration"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v17;

        objc_msgSend(v11, "objectForKey:", CFSTR("Type"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v16) = objc_msgSend(v19, "isEqualToString:", CFSTR("Tap"));

        objc_msgSend(v4, "addObject:", v9);
        if ((_DWORD)v16)
        {
          objc_msgSend(v4, "addObject:", &unk_1E24F80F0);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18 * 1000.0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v20);

        }
        v8 = v14;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  return v4;
}

- (void)setLocaleOverride:(id)a3
{
  objc_storeStrong((id *)&self->_localeOverride, a3);
  -[AXTapticTimeManager _localeDidChange:](self, "_localeDidChange:", 0);
}

- (void)_updateIs24HourTime
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CB3578];
  -[AXTapticTimeManager localeOverride](self, "localeOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "dateFormatFromTemplate:options:locale:", CFSTR("jj:mm"), 0, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateFormatFromTemplate:options:locale:", CFSTR("jj:mm"), 0, v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v6 = objc_msgSend(v7, "rangeOfString:", CFSTR("H")) != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v7, "rangeOfString:", CFSTR("k")) != 0x7FFFFFFFFFFFFFFFLL;
  self->_is24Hour = v6;

}

- (BOOL)_is24HourTime
{
  return self->_is24Hour;
}

- (int64_t)_numberOfTapsForHourNumber:(int64_t)a3 withEncoding:(int64_t)a4
{
  _BOOL4 v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;

  v6 = -[AXTapticTimeManager _is24HourTime](self, "_is24HourTime");
  v7 = 12;
  v8 = a3 % 12;
  v9 = 24;
  if (a4 == 3)
    v9 = 0;
  if (v6)
  {
    v8 = a3;
    v7 = v9;
  }
  if (v8)
    return v8;
  else
    return v7;
}

- (id)_dateComponentsForClockTime
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXTapticTimeManager dateOverride](self, "dateOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AXTapticTimeManager dateOverride](self, "dateOverride");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  objc_msgSend(v3, "components:fromDate:", 96, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)_numberOfTapHoursForClockTimeWithEncoding:(int64_t)a3
{
  void *v5;
  int64_t v6;

  -[AXTapticTimeManager _dateComponentsForClockTime](self, "_dateComponentsForClockTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AXTapticTimeManager _numberOfTapsForHourNumber:withEncoding:](self, "_numberOfTapsForHourNumber:withEncoding:", objc_msgSend(v5, "hour"), a3);

  return v6;
}

- (int64_t)_numberOfTapMinutesForClockTime
{
  void *v2;
  int64_t v3;

  -[AXTapticTimeManager _dateComponentsForClockTime](self, "_dateComponentsForClockTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "minute");

  return v3;
}

- (void)_clearQueue
{
  -[NSMutableArray removeAllObjects](self->_enqueuedSounds, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_enqueuedSoundDelays, "removeAllObjects");
}

- (BOOL)_preStartCheck
{
  BOOL v3;

  if (-[AXTapticTimeManager isCurrentlyOutputting](self, "isCurrentlyOutputting")
    || !-[AXTapticTimeManager _startPowerAssertion](self, "_startPowerAssertion"))
  {
    return 0;
  }
  v3 = 1;
  -[AXTapticTimeManager _updateHapticPatternsIfNecessary:](self, "_updateHapticPatternsIfNecessary:", 1);
  self->_currentSsid = 0x7FFFFFFFFFFFFFFFLL;
  return v3;
}

- (BOOL)_startPowerAssertion
{
  IOReturn v3;

  -[AXTapticTimeManager _stopPowerAssertion](self, "_stopPowerAssertion");
  if (_startPowerAssertion_onceToken != -1)
    dispatch_once(&_startPowerAssertion_onceToken, &__block_literal_global_72_0);
  v3 = IOPMAssertionCreateWithProperties((CFDictionaryRef)_startPowerAssertion_PMAssertionProperties, &self->_assertionID);
  if (v3)
    -[AXTapticTimeManager setAssertionID:](self, "setAssertionID:", 0);
  return v3 == 0;
}

void __43__AXTapticTimeManager__startPowerAssertion__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("AssertType");
  v2[1] = CFSTR("AssertName");
  v3[0] = CFSTR("PreventUserIdleSystemSleep");
  v3[1] = CFSTR("Outputting taptic time");
  v2[2] = CFSTR("FrameworkBundleID");
  v2[3] = CFSTR("TimeoutAction");
  v3[2] = CFSTR("com.apple.AccessibilityUtilities");
  v3[3] = CFSTR("TimeoutActionRelease");
  v2[4] = CFSTR("TimeoutSeconds");
  v3[4] = &unk_1E24F8108;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_startPowerAssertion_PMAssertionProperties;
  _startPowerAssertion_PMAssertionProperties = v0;

}

- (void)_stopPowerAssertion
{
  if (-[AXTapticTimeManager assertionID](self, "assertionID"))
  {
    IOPMAssertionRelease(-[AXTapticTimeManager assertionID](self, "assertionID"));
    -[AXTapticTimeManager setAssertionID:](self, "setAssertionID:", 0);
  }
}

- (void)_outputWithEnqueueBlock:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__AXTapticTimeManager__outputWithEnqueueBlock___block_invoke;
    v6[3] = &unk_1E24C5340;
    v6[4] = self;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __47__AXTapticTimeManager__outputWithEnqueueBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_clearQueue");
  result = objc_msgSend(*(id *)(a1 + 32), "_preStartCheck");
  if ((_DWORD)result)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_handleTestingQueueCallback");
    objc_msgSend(*(id *)(a1 + 32), "_informObserversDidStart");
    return objc_msgSend(*(id *)(a1 + 32), "_dequeueSound");
  }
  return result;
}

- (void)outputHoursAndMinutes:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__AXTapticTimeManager_outputHoursAndMinutes___block_invoke;
  v3[3] = &unk_1E24C6FE0;
  v3[4] = self;
  v3[5] = a3;
  -[AXTapticTimeManager _outputWithEnqueueBlock:](self, "_outputWithEnqueueBlock:", v3);
}

uint64_t __45__AXTapticTimeManager_outputHoursAndMinutes___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_enqueueHours:encoding:", objc_msgSend(*(id *)(a1 + 32), "_numberOfTapHoursForClockTimeWithEncoding:", *(_QWORD *)(a1 + 40)), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueMinutes:encoding:", objc_msgSend(*(id *)(a1 + 32), "_numberOfTapMinutesForClockTime"), *(_QWORD *)(a1 + 40));
}

- (void)outputHours:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__AXTapticTimeManager_outputHours___block_invoke;
  v3[3] = &unk_1E24C6FE0;
  v3[4] = self;
  v3[5] = a3;
  -[AXTapticTimeManager _outputWithEnqueueBlock:](self, "_outputWithEnqueueBlock:", v3);
}

uint64_t __35__AXTapticTimeManager_outputHours___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueHours:encoding:", objc_msgSend(*(id *)(a1 + 32), "_numberOfTapHoursForClockTimeWithEncoding:", *(_QWORD *)(a1 + 40)), *(_QWORD *)(a1 + 40));
}

- (void)outputMinutes:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__AXTapticTimeManager_outputMinutes___block_invoke;
  v3[3] = &unk_1E24C6FE0;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

uint64_t __37__AXTapticTimeManager_outputMinutes___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_clearQueue");
  result = objc_msgSend(*(id *)(a1 + 32), "_preStartCheck");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_enqueueMinutes:encoding:", objc_msgSend(*(id *)(a1 + 32), "_numberOfTapMinutesForClockTime"), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_handleTestingQueueCallback");
    objc_msgSend(*(id *)(a1 + 32), "_informObserversDidStart");
    return objc_msgSend(*(id *)(a1 + 32), "_dequeueSound");
  }
  return result;
}

- (void)stopCurrentOutput
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AXTapticTimeManager_stopCurrentOutput__block_invoke;
  block[3] = &unk_1E24C4C38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __40__AXTapticTimeManager_stopCurrentOutput__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_clearQueue");
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    return AudioServicesStopSystemSound();
  return result;
}

- (void)_enqueueMinutes:(unint64_t)a3 encoding:(int64_t)a4
{
  float v7;
  float v8;
  double v9;
  double v10;
  unint64_t v11;
  NSMutableArray *v12;
  void *v13;
  NSMutableArray *v14;
  void *v15;
  double v16;
  int64_t v17;
  NSMutableArray *enqueuedSounds;
  void *v19;
  NSMutableArray *enqueuedSoundDelays;
  void *v21;
  float v22;
  NSMutableArray *v23;
  void *v24;
  double v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  NSMutableArray *v29;
  void *v30;
  NSMutableArray *v31;
  void *v32;
  NSMutableArray *v33;
  void *v34;
  id v35;

  -[NSNumber floatValue](self->_cachedSpeed, "floatValue");
  v8 = v7;
  v9 = v7;
  if (-[NSMutableArray count](self->_enqueuedSounds, "count"))
    v10 = (float)(1.5 / v8);
  else
    v10 = 0.0;
  if (a4 == 1)
  {
    v17 = a3 % 0xA;
    if (a3 >= 0xA)
    {
      enqueuedSounds = self->_enqueuedSounds;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ssIDHapticFast[a3 / 0xA + 23]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](enqueuedSounds, "addObject:", v19);

      enqueuedSoundDelays = self->_enqueuedSoundDelays;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](enqueuedSoundDelays, "addObject:", v21);

    }
    if (v17 < 1)
      return;
    v22 = 0.8 / v9;
    v23 = self->_enqueuedSounds;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)&self->_observers + v17 + 1));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v23, "addObject:", v24);

    v14 = self->_enqueuedSoundDelays;
    v15 = (void *)MEMORY[0x1E0CB37E8];
    if (a3 < 0xA)
    {
      v16 = v10 + v22;
      goto LABEL_14;
    }
LABEL_17:
    *(float *)&v25 = v22;
    objc_msgSend(v15, "numberWithFloat:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (a4 == 3)
  {
    v22 = 0.9 / v9;
    v27 = a3 / 0xA;
    v28 = a3 % 0xA;
    v29 = self->_enqueuedSounds;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ssIDHapticMorse[v27]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v29, "addObject:", v30);

    v31 = self->_enqueuedSoundDelays;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v31, "addObject:", v32);

    v33 = self->_enqueuedSounds;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ssIDHapticMorse[v28]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v33, "addObject:", v34);

    v14 = self->_enqueuedSoundDelays;
    v15 = (void *)MEMORY[0x1E0CB37E8];
    goto LABEL_17;
  }
  if (a4 == 2 && a3 >= 0xF)
  {
    v11 = a3;
    v12 = self->_enqueuedSounds;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ssIDHapticFast[v11 / 0xF + 23]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v12, "addObject:", v13);

    v14 = self->_enqueuedSoundDelays;
    v15 = (void *)MEMORY[0x1E0CB37E8];
    v16 = v10;
LABEL_14:
    objc_msgSend(v15, "numberWithDouble:", v16);
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v35 = (id)v26;
    -[NSMutableArray addObject:](v14, "addObject:", v26);

  }
}

- (void)_enqueueHours:(unint64_t)a3 encoding:(int64_t)a4
{
  float v7;
  float v8;
  float v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  NSMutableArray *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  uint64_t v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  NSMutableArray *v23;
  void *v24;
  NSMutableArray *v25;
  void *v26;
  void *v27;
  NSMutableArray *v28;
  double v29;
  uint64_t v30;
  NSMutableArray *v31;
  NSMutableArray *enqueuedSounds;
  void *v33;
  double v34;
  NSMutableArray *enqueuedSoundDelays;
  void *v36;
  NSMutableArray *v37;
  id v38;

  -[NSNumber floatValue](self->_cachedSpeed, "floatValue");
  v8 = v7;
  v9 = 0.8 / v7;
  v10 = -[NSMutableArray count](self->_enqueuedSounds, "count");
  if (a4 != 1)
  {
    if (a4 != 3)
    {
      if (a4 != 2)
        return;
      v11 = a3 / 5;
      v12 = a3 % 5;
      if (a3 > 4)
      {
        enqueuedSounds = self->_enqueuedSounds;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ssIDHapticFast[v11 + 23]);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](enqueuedSounds, "addObject:", v33);

        -[NSMutableArray addObject:](self->_enqueuedSoundDelays, "addObject:", &unk_1E24F9130);
        if (!v12)
          return;
        enqueuedSoundDelays = self->_enqueuedSoundDelays;
        *(float *)&v34 = v9;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](enqueuedSoundDelays, "addObject:", v36);

      }
      else
      {
        if (!v12)
          return;
        -[NSMutableArray addObject:](self->_enqueuedSoundDelays, "addObject:", &unk_1E24F9130);
      }
      v37 = self->_enqueuedSounds;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)&self->_observers + v12 + 1));
      v30 = objc_claimAutoreleasedReturnValue();
      v38 = (id)v30;
      v31 = v37;
      goto LABEL_19;
    }
    if (v10)
      v20 = (float)(1.5 / v8);
    else
      v20 = 0.0;
    v21 = a3 / 0xA;
    v22 = a3 % 0xA;
    v23 = self->_enqueuedSounds;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ssIDHapticMorse[v21]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v23, "addObject:", v24);

    v25 = self->_enqueuedSoundDelays;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v25, "addObject:", v26);

    v17 = self->_enqueuedSounds;
    v18 = (void *)MEMORY[0x1E0CB37E8];
    v19 = self->_ssIDHapticMorse[v22];
LABEL_15:
    objc_msgSend(v18, "numberWithUnsignedInt:", v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v17, "addObject:", v27);

    v28 = self->_enqueuedSoundDelays;
    *(float *)&v29 = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    v38 = (id)v30;
    v31 = v28;
LABEL_19:
    -[NSMutableArray addObject:](v31, "addObject:", v30);

    return;
  }
  v13 = a3 / 0xA;
  v14 = a3 % 0xA;
  if (a3 >= 0xA)
  {
    v15 = self->_enqueuedSounds;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ssIDHapticFast[v13 + 23]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v15, "addObject:", v16);

    -[NSMutableArray addObject:](self->_enqueuedSoundDelays, "addObject:", &unk_1E24F9130);
  }
  if (v14 >= 1)
  {
    v17 = self->_enqueuedSounds;
    v18 = (void *)MEMORY[0x1E0CB37E8];
    v19 = *((unsigned int *)&self->_observers + v14 + 1);
    goto LABEL_15;
  }
}

- (id)_convertSoundToStringName:(unsigned int)a3
{
  uint64_t i;
  char *v4;
  uint64_t v5;

  for (i = 0; i != 24; ++i)
  {
    v4 = (char *)self + 4 * i;
    if (*((_DWORD *)v4 + 32) == a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("slow_%d"), i + 1);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    if (*((_DWORD *)v4 + 8) == a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fast_%d"), i + 1);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v5 = 0;
  while (self->_ssIDHapticMorse[v5] != a3)
  {
    if (++v5 == 10)
      return 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("morse_%d"), v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_handleTestingQueueCallback
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  double v9;
  double v10;
  AXTapticSoundTestingContainer *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  id v14;

  -[AXTapticTimeManager testingQueueCallback](self, "testingQueueCallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v4 = -[NSMutableArray count](self->_enqueuedSounds, "count");
    if (v4 >= 1)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NSMutableArray objectAtIndex:](self->_enqueuedSounds, "objectAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndex:](self->_enqueuedSoundDelays, "objectAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "doubleValue");
        v10 = v9;

        v11 = objc_alloc_init(AXTapticSoundTestingContainer);
        -[AXTapticTimeManager _convertSoundToStringName:](self, "_convertSoundToStringName:", objc_msgSend(v7, "intValue"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXTapticSoundTestingContainer setSound:](v11, "setSound:", v12);

        -[AXTapticSoundTestingContainer setDelay:](v11, "setDelay:", v10);
        objc_msgSend(v14, "addObject:", v11);

      }
    }
    -[AXTapticTimeManager testingQueueCallback](self, "testingQueueCallback");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v13)[2](v13, v14);

  }
}

- (void)_dequeueSound
{
  void *v3;
  int64_t v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  dispatch_time_t v10;
  id v11;
  _QWORD block[5];
  id v13;
  int64_t v14;
  _QWORD aBlock[6];

  if (-[NSMutableArray count](self->_enqueuedSounds, "count"))
  {
    -[NSMutableArray firstObject](self->_enqueuedSounds, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");
    self->_currentSsid = v4;
    -[NSMutableArray removeObjectAtIndex:](self->_enqueuedSounds, "removeObjectAtIndex:", 0);
    -[NSMutableArray objectAtIndex:](self->_enqueuedSoundDelays, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

    -[NSMutableArray removeObjectAtIndex:](self->_enqueuedSoundDelays, "removeObjectAtIndex:", 0);
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__AXTapticTimeManager__dequeueSound__block_invoke;
    aBlock[3] = &unk_1E24C6FE0;
    aBlock[4] = self;
    aBlock[5] = v4;
    v9 = _Block_copy(aBlock);
    v10 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __36__AXTapticTimeManager__dequeueSound__block_invoke_2;
    block[3] = &unk_1E24C8A80;
    v13 = v9;
    v14 = v4;
    block[4] = self;
    v11 = v9;
    dispatch_after(v10, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    -[AXTapticTimeManager _informObserversDidStop](self, "_informObserversDidStop");
    -[AXTapticTimeManager _stopPowerAssertion](self, "_stopPowerAssertion");
  }
}

uint64_t __36__AXTapticTimeManager__dequeueSound__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_informObserversDidOutputSSID:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_dequeueSound");
}

void __36__AXTapticTimeManager__dequeueSound__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  double v15;
  dispatch_time_t v16;
  _QWORD block[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 264);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("VibePattern"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 264);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  AudioServicesPlaySystemSoundWithVibration();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v20;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v8);
        if (((v11 + (_DWORD)i) & 0x80000001) == 1)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "doubleValue");
          v13 = v13 + v15;
        }
      }
      v11 += v10;
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }
  else
  {
    v13 = 0.0;
  }

  v16 = dispatch_time(0, (uint64_t)(v13 / 1000.0 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AXTapticTimeManager__dequeueSound__block_invoke_3;
  block[3] = &unk_1E24C5408;
  v18 = *(id *)(a1 + 40);
  dispatch_after(v16, MEMORY[0x1E0C80D38], block);

}

uint64_t __36__AXTapticTimeManager__dequeueSound__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isCurrentlyOutputting
{
  return self->_isCurrentlyOutputting;
}

- (unsigned)assertionID
{
  return self->_assertionID;
}

- (void)setAssertionID:(unsigned int)a3
{
  self->_assertionID = a3;
}

- (id)testingQueueCallback
{
  return self->_testingQueueCallback;
}

- (void)setTestingQueueCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSLocale)localeOverride
{
  return self->_localeOverride;
}

- (NSDate)dateOverride
{
  return self->_dateOverride;
}

- (void)setDateOverride:(id)a3
{
  objc_storeStrong((id *)&self->_dateOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOverride, 0);
  objc_storeStrong((id *)&self->_localeOverride, 0);
  objc_storeStrong(&self->_testingQueueCallback, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_cachedSpeed, 0);
  objc_storeStrong((id *)&self->_hapticsDescriptions, 0);
  objc_storeStrong((id *)&self->_soundToPatterns, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_enqueuedSoundDelays, 0);
  objc_storeStrong((id *)&self->_enqueuedSounds, 0);
}

@end
