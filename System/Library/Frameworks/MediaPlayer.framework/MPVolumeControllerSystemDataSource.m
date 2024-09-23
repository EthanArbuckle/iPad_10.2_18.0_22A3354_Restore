@implementation MPVolumeControllerSystemDataSource

uint64_t __61__MPVolumeControllerSystemDataSource__systemVolumeDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVolumeAudioCategory:", *(_QWORD *)(a1 + 40));
}

- (void)_systemVolumeDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  int v17;
  void *v18;
  uint64_t v19;
  id v20;
  float v21;
  float v22;
  _QWORD v23[5];
  id v24;
  id v25;
  float v26;
  float v27;
  char v28;
  _QWORD block[5];
  id v30;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D47EC8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D47EC0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D47EB8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v4, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D47E98]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v10, "isEqualToString:", CFSTR("RouteChange"));
  v17 = objc_msgSend(v10, "isEqualToString:", CFSTR("CategoryChange"));
  v18 = (void *)-[NSString copy](self->_volumeAudioCategory, "copy");
  v19 = MEMORY[0x1E0C809B0];
  if ((v16 & 1) != 0 || v17)
  {
    -[MPVolumeControllerSystemDataSource _categoryForActiveCategory:currentCategory:categories:](self, "_categoryForActiveCategory:currentCategory:categories:", v15, self->_volumeAudioCategory, self->_volumeAudioCategories);
    block[0] = v19;
    block[1] = 3221225472;
    block[2] = __61__MPVolumeControllerSystemDataSource__systemVolumeDidChange___block_invoke;
    block[3] = &unk_1E31635F8;
    block[4] = self;
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v30;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  if (objc_msgSend(v15, "isEqualToString:", v18))
  {
    v21 = 1.0;
    if (v8 <= 1.0)
      v21 = v8;
    v22 = fmaxf(v21, 0.0);
    v23[0] = v19;
    v23[1] = 3221225472;
    v23[2] = __61__MPVolumeControllerSystemDataSource__systemVolumeDidChange___block_invoke_2;
    v23[3] = &unk_1E31630A8;
    v23[4] = self;
    v26 = v8;
    v24 = v15;
    v25 = v10;
    v28 = v13;
    v27 = v22;
    dispatch_async(MEMORY[0x1E0C80D38], v23);

  }
}

- (id)_categoryForActiveCategory:(id)a3 currentCategory:(id)a4 categories:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "containsObject:", v8))
  {
    v11 = v8;
  }
  else if (objc_msgSend(v10, "containsObject:", CFSTR("Audio/Video")))
  {
    -[MPVolumeControllerSystemDataSource _mediaPlaybackVolumeAudioCategory](self, "_mediaPlaybackVolumeAudioCategory");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v10, "anyObject");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (unsigned)volumeControlCapabilities
{
  return self->_volumeControlCapabilities;
}

- (MPVolumeControllerSystemDataSource)init
{
  return -[MPVolumeControllerSystemDataSource initWithVolumeAudioCategory:](self, "initWithVolumeAudioCategory:", 0);
}

- (MPVolumeControllerSystemDataSource)initWithVolumeAudioCategory:(id)a3
{
  id v4;
  MPVolumeControllerSystemDataSource *v5;
  MPVolumeControllerSystemDataSource *v6;

  v4 = a3;
  v5 = -[MPVolumeControllerSystemDataSource initCommon](self, "initCommon");
  v6 = v5;
  if (v5)
  {
    if (!v4)
    {
      -[MPVolumeControllerSystemDataSource _mediaPlaybackVolumeAudioCategory](v5, "_mediaPlaybackVolumeAudioCategory");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[MPVolumeControllerSystemDataSource _setVolumeAudioCategory:](v6, "_setVolumeAudioCategory:", v4);
    -[MPVolumeControllerSystemDataSource reload](v6, "reload");
  }

  return v6;
}

- (void)reload
{
  if (self->_reloading)
    self->_needsReloading = 1;
  else
    -[MPVolumeControllerSystemDataSource _reload](self, "_reload");
}

- (void)_reload
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[8];
  _QWORD block[5];
  id v10;
  NSObject *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[3];
  char v16;
  _QWORD v17[3];
  int v18;
  _QWORD v19[3];
  int v20;

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v3 = (void *)-[NSString copy](self->_volumeAudioCategory, "copy");
  if (v3)
  {
    self->_reloading = 1;
    *(_WORD *)&self->_volumeInitialized = 0;
    self->_volumeMutedInitialized = 0;
    v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    -[MPVolumeControllerSystemDataSource _reloadQueue](self, "_reloadQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__MPVolumeControllerSystemDataSource__reload__block_invoke;
    block[3] = &unk_1E3163018;
    block[4] = self;
    v12 = v15;
    v13 = v19;
    v14 = v17;
    v10 = v3;
    v11 = v4;
    v7 = v4;
    dispatch_async(v5, block);

    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __45__MPVolumeControllerSystemDataSource__reload__block_invoke_22;
    v8[3] = &unk_1E3163040;
    v8[4] = self;
    v8[5] = v17;
    v8[6] = v19;
    v8[7] = v15;
    dispatch_group_notify(v7, MEMORY[0x1E0C80D38], v8);

  }
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

- (id)_reloadQueue
{
  if (_reloadQueue___token != -1)
    dispatch_once(&_reloadQueue___token, &__block_literal_global_49257);
  return (id)_reloadQueue__queue;
}

- (id)initCommon
{
  MPVolumeControllerSystemDataSource *v2;
  NSObject *v3;
  uint64_t v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *avscQueue;
  objc_super v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  MPVolumeControllerSystemDataSource *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)MPVolumeControllerSystemDataSource;
  v2 = -[MPVolumeControllerSystemDataSource init](&v8, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v10 = v4;
      v11 = 2048;
      v12 = v2;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> init", buf, 0x16u);
    }

    v5 = dispatch_queue_create("com.apple.MediaPlayer.SystemVolumeDataSource.avscQueue", 0);
    avscQueue = v2->_avscQueue;
    v2->_avscQueue = (OS_dispatch_queue *)v5;

    v2->_supportNativeMute = MSVDeviceIsAppleTV() ^ 1;
    -[MPVolumeControllerSystemDataSource _setup](v2, "_setup");
  }
  return v2;
}

- (void)_setup
{
  NSObject *avscQueue;
  void *v4;
  _QWORD block[5];

  avscQueue = self->_avscQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MPVolumeControllerSystemDataSource__setup__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(avscQueue, block);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__routeDidChangeNotification_, CFSTR("MPAVRouteDidChangeNotification"), 0);

}

- (void)_setVolumeAudioCategory:(id)a3
{
  NSString *v4;
  NSObject *v5;
  NSString *volumeAudioCategory;
  int v7;
  uint64_t v8;
  __int16 v9;
  MPVolumeControllerSystemDataSource *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543874;
    v8 = objc_opt_class();
    v9 = 2048;
    v10 = self;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> changed volumeAudioCategory to: %{public}@", (uint8_t *)&v7, 0x20u);
  }

  volumeAudioCategory = self->_volumeAudioCategory;
  self->_volumeAudioCategory = v4;

}

- (id)_mediaPlaybackVolumeAudioCategory
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__MPVolumeControllerSystemDataSource__mediaPlaybackVolumeAudioCategory__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  if (_mediaPlaybackVolumeAudioCategory___token != -1)
    dispatch_once(&_mediaPlaybackVolumeAudioCategory___token, block);
  return (id)_mediaPlaybackVolumeAudioCategory___mediaPlaybackVolumeAudioCategory;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setVolumeAudioCategory:(id)a3
{
  NSString *v4;
  NSSet *volumeAudioCategories;
  _BOOL4 v6;
  NSString *v7;
  NSString *v8;
  char v9;
  id WeakRetained;
  NSString *v11;

  v4 = (NSString *)a3;
  if (!v4)
  {
    -[MPVolumeControllerSystemDataSource _mediaPlaybackVolumeAudioCategory](self, "_mediaPlaybackVolumeAudioCategory");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v4;
  volumeAudioCategories = self->_volumeAudioCategories;
  if (!volumeAudioCategories
    || (v6 = -[NSSet containsObject:](volumeAudioCategories, "containsObject:", v11), v7 = v11, v6))
  {
    v8 = self->_volumeAudioCategory;
    if (v8 == v11)
    {

      goto LABEL_9;
    }
    v9 = -[NSString isEqual:](v8, "isEqual:", v11);

    v7 = v11;
    if ((v9 & 1) == 0)
    {
      -[MPVolumeControllerSystemDataSource _setVolumeAudioCategory:](self, "_setVolumeAudioCategory:", v11);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "volumeControllerDataSource:didChangeVolumeAudioCategory:", self, v11);

      -[MPVolumeControllerSystemDataSource reload](self, "reload");
LABEL_9:
      v7 = v11;
    }
  }

}

- (NSString)volumeAudioCategory
{
  return self->_volumeAudioCategory;
}

void __44__MPVolumeControllerSystemDataSource__setup__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = (_QWORD *)MEMORY[0x1E0D47F48];
  v6 = (_QWORD *)MEMORY[0x1E0D48280];
  if (*MEMORY[0x1E0D47F48])
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v25[0] = *MEMORY[0x1E0D47F48];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttribute:forKey:error:", v8, *v6, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__systemVolumeCapabilitiesDidChange_, *v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

  }
  v10 = (_QWORD *)MEMORY[0x1E0D482B0];
  if (*MEMORY[0x1E0D482B0])
  {
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v24 = *MEMORY[0x1E0D482B0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAttribute:forKey:error:", v12, *v6, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__systemVolumeDidChange_, *v10, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

  }
  v14 = (_QWORD *)MEMORY[0x1E0D47FB8];
  if (*MEMORY[0x1E0D47FB8])
  {
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v23 = *MEMORY[0x1E0D47FB8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAttribute:forKey:error:", v16, *v6, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__systemMuteDidChange_, *v14, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

  }
  v18 = (_QWORD *)MEMORY[0x1E0D48200];
  if (*MEMORY[0x1E0D48200])
  {
    v19 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v22 = *MEMORY[0x1E0D48200];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAttribute:forKey:error:", v20, *v6, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__mediaServerDiedNotification_, *v18, 0);

  }
}

void __61__MPVolumeControllerSystemDataSource__systemVolumeDidChange___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  double v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  double v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "volumeControlCapabilities");
  v2 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription();
  v3 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    v5 = *(float *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(unsigned __int8 *)(a1 + 64);
    v11 = 138544898;
    v12 = v4;
    v13 = 2048;
    v14 = v6;
    v15 = 2048;
    v16 = v5;
    v17 = 2114;
    v18 = v7;
    v19 = 2112;
    v20 = v2;
    v21 = 2114;
    v22 = v8;
    v23 = 1024;
    v24 = v9;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> AVSystemController volume changed to: %f | category: %{public}@ | capabilities: %@ | reason: %{public}@ | silence: %{BOOL}u", (uint8_t *)&v11, 0x44u);
  }

  LODWORD(v10) = *(_DWORD *)(a1 + 60);
  objc_msgSend(*(id *)(a1 + 32), "updateVolume:silenceVolumeHUD:", *(unsigned __int8 *)(a1 + 64), v10);

}

- (void)updateVolume:(float)a3 silenceVolumeHUD:(BOOL)a4
{
  _BOOL8 v4;
  float v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  double volume;
  NSString *volumeAudioCategory;
  _BOOL4 volumeControlAvailable;
  _BOOL4 muted;
  NSMutableArray *pendingVolumeCompletions;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  NSMutableArray *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  MPVolumeControllerSystemDataSource *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  NSString *v33;
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  _BOOL4 v39;
  uint64_t v40;

  v4 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  if (!self->_volumeInitialized)
    goto LABEL_5;
  v6 = self->_volume - a3;
  if (v6 < 0.0)
    v6 = -v6;
  if (v6 > 0.00000011921)
  {
LABEL_5:
    self->_volumeInitialized = 1;
    self->_volume = a3;
    -[MPVolumeControllerSystemDataSource _effectiveVolume](self, "_effectiveVolume");
    -[MPVolumeControllerSystemDataSource _notifyVolumeDidChage:silenceVolumeHUD:](self, "_notifyVolumeDidChage:silenceVolumeHUD:", v4);
    v7 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription();
    v8 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      volume = self->_volume;
      volumeAudioCategory = self->_volumeAudioCategory;
      volumeControlAvailable = self->_volumeControlAvailable;
      muted = self->_muted;
      *(_DWORD *)buf = 138544898;
      v27 = v9;
      v28 = 2048;
      v29 = self;
      v30 = 2048;
      v31 = volume;
      v32 = 2114;
      v33 = volumeAudioCategory;
      v34 = 1024;
      v35 = volumeControlAvailable;
      v36 = 2112;
      v37 = v7;
      v38 = 1024;
      v39 = muted;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> AVSystemController update volume to: %f | category %{public}@ | available: %{BOOL}u | capabilities: %@ | muted: %{BOOL}u", buf, 0x40u);
    }

  }
  pendingVolumeCompletions = self->_pendingVolumeCompletions;
  if (pendingVolumeCompletions)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = pendingVolumeCompletions;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          (*(void (**)(float))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i) + 16))(self->_volume);
        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v17);
    }

    v20 = self->_pendingVolumeCompletions;
    self->_pendingVolumeCompletions = 0;

  }
}

- (float)_effectiveVolume
{
  float result;

  if (-[MPVolumeControllerSystemDataSource _supportsNativeMute](self, "_supportsNativeMute"))
    return self->_volume;
  result = 0.0;
  if (!self->_muted)
    return self->_volume;
  return result;
}

- (BOOL)_supportsNativeMute
{
  return (_os_feature_enabled_impl() & 1) != 0 || self->_supportNativeMute;
}

- (void)updateVolumeMuted:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  double volume;
  NSString *volumeAudioCategory;
  _BOOL4 volumeControlAvailable;
  _BOOL4 muted;
  int v13;
  uint64_t v14;
  __int16 v15;
  MPVolumeControllerSystemDataSource *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (!self->_volumeMutedInitialized || self->_muted != a3)
  {
    self->_volumeMutedInitialized = 1;
    self->_muted = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "volumeControllerDataSource:didChangeMuted:", self, v3);
    v6 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription();
    v7 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      volume = self->_volume;
      volumeAudioCategory = self->_volumeAudioCategory;
      volumeControlAvailable = self->_volumeControlAvailable;
      muted = self->_muted;
      v13 = 138544898;
      v14 = v8;
      v15 = 2048;
      v16 = self;
      v17 = 2048;
      v18 = volume;
      v19 = 2114;
      v20 = volumeAudioCategory;
      v21 = 1024;
      v22 = volumeControlAvailable;
      v23 = 2112;
      v24 = v6;
      v25 = 1024;
      v26 = muted;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> AVSystemController update mute to: %f | category %{public}@ | available: %{BOOL}u | capabilities: %@ | muted: %{BOOL}u", (uint8_t *)&v13, 0x40u);
    }

  }
}

- (void)updateVolumeControlCapabilities:(unsigned int)a3
{
  uint64_t v3;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  double volume;
  NSString *volumeAudioCategory;
  _BOOL4 muted;
  int v12;
  uint64_t v13;
  __int16 v14;
  MPVolumeControllerSystemDataSource *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if ((!self->_volumeControlCapabilitiesInitialized || ((v3 >> 1) & 1) != self->_volumeControlAvailable)
    && (self->_volumeControlAvailable = (v3 & 2) >> 1,
        objc_msgSend(WeakRetained, "volumeControllerDataSource:didChangeVolumeControlAvailability:", self, (v3 & 2) != 0), !self->_volumeControlCapabilitiesInitialized)|| self->_volumeControlCapabilities != (_DWORD)v3)
  {
    self->_volumeControlCapabilitiesInitialized = 1;
    self->_volumeControlCapabilities = v3;
    objc_msgSend(v6, "volumeControllerDataSource:didChangeVolumeCapabilities:", self, v3);
    v7 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      volume = self->_volume;
      volumeAudioCategory = self->_volumeAudioCategory;
      muted = self->_muted;
      v12 = 138544898;
      v13 = v8;
      v14 = 2048;
      v15 = self;
      v16 = 2048;
      v17 = volume;
      v18 = 2114;
      v19 = volumeAudioCategory;
      v20 = 1024;
      v21 = (v3 >> 1) & 1;
      v22 = 1024;
      v23 = v3;
      v24 = 1024;
      v25 = muted;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> AVSystemController update volume capabilities to: %f | category %{public}@ | available: %{BOOL}u | capabilities: %u | muted: %{BOOL}u", (uint8_t *)&v12, 0x3Cu);
    }

  }
}

- (void)_notifyVolumeDidChage:(float)a3 silenceVolumeHUD:(BOOL)a4
{
  _BOOL8 v4;
  double v7;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(float *)&v7 = a3;
    objc_msgSend(WeakRetained, "volumeControllerDataSource:didChangeVolume:silenceVolumeHUD:", self, v4, v7);
  }
  else
  {
    *(float *)&v7 = a3;
    objc_msgSend(WeakRetained, "volumeControllerDataSource:didChangeVolume:", self, v7);
  }

}

- (BOOL)isVolumeControlAvailable
{
  return self->_volumeControlAvailable;
}

- (BOOL)applicationShouldOverrideHardwareVolumeBehavior
{
  return 0;
}

void __71__MPVolumeControllerSystemDataSource__mediaPlaybackVolumeAudioCategory__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "volumeCategoryForAudioCategory:", CFSTR("MediaPlayback"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_mediaPlaybackVolumeAudioCategory___mediaPlaybackVolumeAudioCategory;
  _mediaPlaybackVolumeAudioCategory___mediaPlaybackVolumeAudioCategory = v1;

}

void __45__MPVolumeControllerSystemDataSource__reload__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD block[5];
  id v8;
  __int128 v9;
  uint64_t v10;

  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __45__MPVolumeControllerSystemDataSource__reload__block_invoke_2;
  block[3] = &unk_1E3162FF0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 32);
  block[1] = 3221225472;
  block[4] = v2;
  v9 = *(_OWORD *)(a1 + 56);
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 72);
  v8 = v5;
  v10 = v6;
  dispatch_sync(v4, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __45__MPVolumeControllerSystemDataSource__reload__block_invoke_2(_QWORD *a1)
{
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  double v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 40), "attributeForKey:", *MEMORY[0x1E0D47FA8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "BOOLValue");

  objc_msgSend(*(id *)(a1[4] + 40), "getVolume:forCategory:", *(_QWORD *)(a1[7] + 8) + 24, a1[5]);
  v3 = objc_msgSend(*(id *)(a1[4] + 40), "currentRouteHasVolumeControl");
  if (v3)
    *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = 10;
  v4 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription();
  v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    v7 = *(float *)(*(_QWORD *)(a1[7] + 8) + 24);
    v8 = a1[4];
    v9 = a1[5];
    v10 = 138544642;
    v11 = v6;
    v12 = 2048;
    v13 = v8;
    v14 = 2048;
    v15 = v7;
    v16 = 2114;
    v17 = v9;
    v18 = 1024;
    v19 = v3;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> AVSystemController reloading volume: %f | category: %{public}@ | hasVolumeControl: %{BOOL}u | capabilities: %@", (uint8_t *)&v10, 0x3Au);
  }

}

void __50__MPVolumeControllerSystemDataSource__reloadQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MediaPlayer.SystemVolumeDataSource.reloadQueue", v2);
  v1 = (void *)_reloadQueue__queue;
  _reloadQueue__queue = (uint64_t)v0;

}

uint64_t __71__MPVolumeControllerSystemDataSource__mediaPlaybackVolumeAudioCategory__block_invoke()
{
  return msv_dispatch_sync_on_queue();
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_volumeControlAvailable)
    v5 = CFSTR("available");
  else
    v5 = CFSTR("not available");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
}

- (MPVolumeControllerSystemDataSource)initWithVolumeAudioCategories:(id)a3
{
  id v5;
  MPVolumeControllerSystemDataSource *v6;
  NSObject *v7;
  NSObject *avscQueue;
  void *v10;
  _QWORD v11[4];
  MPVolumeControllerSystemDataSource *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  MPVolumeControllerSystemDataSource *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[MPVolumeControllerSystemDataSource initCommon](self, "initCommon");
  if (v6)
  {
    if (!v5 || !objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MPVolumeControllerSystemDataSource.m"), 97, CFSTR("Must provide at least one cateogry"));

    }
    v7 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v15 = objc_opt_class();
      v16 = 2048;
      v17 = v6;
      v18 = 2114;
      v19 = v5;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> init volumeAudioCategories: %{public}@", buf, 0x20u);
    }

    avscQueue = v6->_avscQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__MPVolumeControllerSystemDataSource_initWithVolumeAudioCategories___block_invoke;
    v11[3] = &unk_1E31635F8;
    v12 = v6;
    v13 = v5;
    dispatch_async(avscQueue, v11);

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[MPVolumeControllerSystemDataSource _tearDown](self, "_tearDown");
  v3.receiver = self;
  v3.super_class = (Class)MPVolumeControllerSystemDataSource;
  -[MPVolumeControllerSystemDataSource dealloc](&v3, sel_dealloc);
}

- (void)setVolume:(float)a3
{
  NSObject *v5;
  uint64_t v6;
  NSString *volumeAudioCategory;
  double v8;
  NSObject *avscQueue;
  _QWORD v10[5];
  float v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  MPVolumeControllerSystemDataSource *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_volume != a3)
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_opt_class();
      volumeAudioCategory = self->_volumeAudioCategory;
      *(_DWORD *)buf = 138544130;
      v13 = v6;
      v14 = 2048;
      v15 = self;
      v16 = 2048;
      v17 = a3;
      v18 = 2114;
      v19 = volumeAudioCategory;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> AVSystemController set volume to: %f | category %{public}@", buf, 0x2Au);
    }

    *(float *)&v8 = a3;
    -[MPVolumeControllerSystemDataSource updateVolume:silenceVolumeHUD:](self, "updateVolume:silenceVolumeHUD:", 0, v8);
    avscQueue = self->_avscQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__MPVolumeControllerSystemDataSource_setVolume___block_invoke;
    v10[3] = &unk_1E31632A0;
    v10[4] = self;
    v11 = a3;
    dispatch_async(avscQueue, v10);
  }
}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  NSString *volumeAudioCategory;
  NSObject *avscQueue;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  MPVolumeControllerSystemDataSource *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_muted != a3)
  {
    v3 = a3;
    v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_opt_class();
      volumeAudioCategory = self->_volumeAudioCategory;
      *(_DWORD *)buf = 138544130;
      v12 = v6;
      v13 = 2048;
      v14 = self;
      v15 = 1024;
      v16 = v3;
      v17 = 2114;
      v18 = volumeAudioCategory;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> AVSystemController set mute to: %{BOOL}u | category %{public}@", buf, 0x26u);
    }

    -[MPVolumeControllerSystemDataSource updateVolumeMuted:](self, "updateVolumeMuted:", v3);
    if (!-[MPVolumeControllerSystemDataSource _supportsNativeMute](self, "_supportsNativeMute"))
    {
      -[MPVolumeControllerSystemDataSource _effectiveVolume](self, "_effectiveVolume");
      -[MPVolumeControllerSystemDataSource _notifyVolumeDidChage:silenceVolumeHUD:](self, "_notifyVolumeDidChage:silenceVolumeHUD:", 0);
    }
    avscQueue = self->_avscQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__MPVolumeControllerSystemDataSource_setMuted___block_invoke;
    v9[3] = &unk_1E3163468;
    v9[4] = self;
    v10 = v3;
    dispatch_async(avscQueue, v9);
  }
}

- (void)adjustVolumeValue:(float)a3
{
  float v4;
  float v5;
  NSObject *v6;
  double v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  MPVolumeControllerSystemDataSource *v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3 * 100000.0;
  v5 = floorf(v4) * 0.00001;
  v6 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543874;
    v9 = objc_opt_class();
    v10 = 2048;
    v11 = self;
    v12 = 2048;
    v13 = v5;
    _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Adjusting local endpoint volume by: %f", (uint8_t *)&v8, 0x20u);
  }

  v7 = fmax(fmin((float)(self->_volume + v5), 1.0), 0.0);
  *(float *)&v7 = v7;
  -[MPVolumeControllerSystemDataSource setVolume:](self, "setVolume:", v7);
}

- (void)getVolumeValueWithCompletion:(id)a3
{
  void (**v4)(void);
  NSMutableArray *pendingVolumeCompletions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  void (**v10)(void);

  v4 = (void (**)(void))a3;
  v10 = v4;
  if (self->_volumeInitialized)
  {
    -[MPVolumeControllerSystemDataSource volume](self, "volume");
    v10[2]();
  }
  else
  {
    pendingVolumeCompletions = self->_pendingVolumeCompletions;
    if (!pendingVolumeCompletions)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_pendingVolumeCompletions;
      self->_pendingVolumeCompletions = v6;

      v4 = v10;
      pendingVolumeCompletions = self->_pendingVolumeCompletions;
    }
    v8 = (void *)objc_msgSend(v4, "copy");
    v9 = (void *)MEMORY[0x19403A810]();
    -[NSMutableArray addObject:](pendingVolumeCompletions, "addObject:", v9);

  }
}

- (void)endIncreasingRelativeVolume
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  -[MPVolumeControllerSystemDataSource volumeAudioCategory](self, "volumeAudioCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPVolumeControllerSystemDataSource _mediaPlaybackVolumeAudioCategory](self, "_mediaPlaybackVolumeAudioCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D4C4E0], "sharedLocalEndpoint");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "adjustVolume:queue:completion:", 2, MEMORY[0x1E0C80D38], &__block_literal_global_26_49253);

  }
}

- (void)endDecreasingRelativeVolume
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  -[MPVolumeControllerSystemDataSource volumeAudioCategory](self, "volumeAudioCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPVolumeControllerSystemDataSource _mediaPlaybackVolumeAudioCategory](self, "_mediaPlaybackVolumeAudioCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D4C4E0], "sharedLocalEndpoint");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "adjustVolume:queue:completion:", 5, MEMORY[0x1E0C80D38], &__block_literal_global_27_49252);

  }
}

- (void)_mediaServerDiedNotification:(id)a3
{
  -[MPVolumeControllerSystemDataSource _tearDown](self, "_tearDown", a3);
  -[MPVolumeControllerSystemDataSource _setup](self, "_setup");
  -[MPVolumeControllerSystemDataSource reload](self, "reload");
}

- (void)_routeDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  _QWORD block[5];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPAVRoutingController systemRoute](MPAVRoutingController, "systemRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__MPVolumeControllerSystemDataSource__routeDidChangeNotification___block_invoke;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (NSString)volumeControlLabel
{
  void *v2;
  __CFString *v3;

  +[MPAVRoutingController systemRoute](MPAVRoutingController, "systemRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isDeviceSpeakerRoute") & 1) != 0)
  {
    v3 = &stru_1E3163D10;
  }
  else
  {
    objc_msgSend(v2, "routeName");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v3;
}

- (void)_tearDown
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&self->_volumeInitialized = 0;
  self->_volumeMutedInitialized = 0;
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D47F48], 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D482B0], 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D47FB8], 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D48200], 0);
  +[MPAVRoutingController systemRoute](MPAVRoutingController, "systemRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("MPAVRouteDidChangeNotification"), v3);

}

- (MPVolumeControllerDataSourceDelegate)delegate
{
  return (MPVolumeControllerDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (float)EUVolumeLimit
{
  return self->_EUVolumeLimit;
}

- (BOOL)volumeWarningEnabled
{
  return self->_volumeWarningEnabled;
}

- (int64_t)volumeWarningState
{
  return self->_volumeWarningState;
}

- (NSSet)volumeAudioCategories
{
  return self->_volumeAudioCategories;
}

- (BOOL)forceAVSystemController
{
  return self->_forceAVSystemController;
}

- (void)setForceAVSystemController:(BOOL)a3
{
  self->_forceAVSystemController = a3;
}

- (BOOL)supportNativeMute
{
  return self->_supportNativeMute;
}

- (void)setSupportNativeMute:(BOOL)a3
{
  self->_supportNativeMute = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeAudioCategories, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_volumeAudioCategory, 0);
  objc_storeStrong((id *)&self->_avSystemController, 0);
  objc_storeStrong((id *)&self->_avscQueue, 0);
  objc_storeStrong((id *)&self->_pendingVolumeCompletions, 0);
}

void __66__MPVolumeControllerSystemDataSource__routeDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "volumeControlLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "volumeControllerDataSource:didChangeVolumeLabel:", v2, v3);

}

_BYTE *__45__MPVolumeControllerSystemDataSource__reload__block_invoke_22(uint64_t a1, double a2)
{
  _BYTE *result;
  uint64_t v4;

  result = *(_BYTE **)(a1 + 32);
  if (!result[11])
  {
    objc_msgSend(result, "updateVolumeControlCapabilities:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    result = *(_BYTE **)(a1 + 32);
  }
  if (!result[10])
  {
    LODWORD(a2) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    objc_msgSend(result, "updateVolume:silenceVolumeHUD:", 0, a2);
    result = *(_BYTE **)(a1 + 32);
  }
  if (!result[12])
  {
    objc_msgSend(result, "updateVolumeMuted:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    result = *(_BYTE **)(a1 + 32);
  }
  result[8] = 0;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 9))
  {
    *(_BYTE *)(v4 + 9) = 0;
    return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "reload");
  }
  return result;
}

void __47__MPVolumeControllerSystemDataSource_setMuted___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAttribute:forKey:error:", v2, *MEMORY[0x1E0D47FA8], 0);

}

uint64_t __48__MPVolumeControllerSystemDataSource_setVolume___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setVolumeTo:forCategory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), a2);
}

void __68__MPVolumeControllerSystemDataSource_initWithVolumeAudioCategories___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__MPVolumeControllerSystemDataSource_initWithVolumeAudioCategories___block_invoke_2;
  v16[3] = &unk_1E3162FA8;
  v3 = *(void **)(a1 + 40);
  v17 = *(id *)(a1 + 32);
  objc_msgSend(v3, "msv_compactMap:", v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "initWithArray:", v4);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v5;

  v8 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(v10 + 88);
    *(_DWORD *)buf = 138543874;
    v19 = v9;
    v20 = 2048;
    v21 = v10;
    v22 = 2114;
    v23 = v11;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> resolved volumeAudioCategories to: %{public}@", buf, 0x20u);
  }

  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v15 = 0;
  objc_msgSend(v12, "getActiveCategoryVolume:andName:", 0, &v15);
  v13 = v15;
  objc_msgSend(*(id *)(a1 + 32), "_categoryForActiveCategory:currentCategory:categories:", v13, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setVolumeAudioCategory:", v14);
  objc_msgSend(*(id *)(a1 + 32), "reload");

}

uint64_t __68__MPVolumeControllerSystemDataSource_initWithVolumeAudioCategories___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "volumeCategoryForAudioCategory:", a2);
}

@end
