@implementation MRUSpatialAudioController

- (NSArray)availableModes
{
  return self->_availableModes;
}

- (MRUSpatialAudioMode)selectedMode
{
  return self->_selectedMode;
}

- (BOOL)isMultichannel
{
  void *v3;
  _BOOL4 v4;
  void *v5;

  -[MRNowPlayingAudioFormatController audioFormatApplication](self->_audioFormatController, "audioFormatApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isFaceTime") & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    -[MRNowPlayingAudioFormatController audioFormatContentInfo](self->_audioFormatController, "audioFormatContentInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isMultichannel") & 1) != 0)
      LOBYTE(v4) = 1;
    else
      v4 = !-[MRUSpatialAudioController isEnabled](self, "isEnabled");

  }
  return v4;
}

- (BOOL)isEnabled
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D4C558], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "expanseSessionHasScreenSharingActivity");

  if ((v4 & 1) != 0)
    return 0;
  -[MRNowPlayingAudioFormatController audioFormatApplication](self->_audioFormatController, "audioFormatApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFaceTime");

  if ((v7 & 1) != 0)
    return 1;
  -[MRNowPlayingAudioFormatController audioFormatContentInfo](self->_audioFormatController, "audioFormatContentInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEligibleForSpatialization"))
  {
    -[MRNowPlayingAudioFormatController audioFormatContentInfo](self->_audioFormatController, "audioFormatContentInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "audioFormatDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v10 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)disabledDescription
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D4C558], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "expanseSessionHasScreenSharingActivity") & 1) != 0
    || -[MRUSpatialAccessibilityObserver isMonoAudioEnabled](self->_accessibilityObserver, "isMonoAudioEnabled"))
  {
    +[MRUStringsProvider spatialButtonNotAvailable](MRUStringsProvider, "spatialButtonNotAvailable");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MRUStringsProvider notPlaying](MRUStringsProvider, "notPlaying");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return (NSString *)v5;
}

- (MRUVolumeNowPlayingInfo)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (void)nowPlayingAudioFormatController:(id)a3 didChangeAudioFormatContentInfo:(id)a4
{
  -[MRUSpatialAudioController resetOptimisticSpatialAudioActive](self, "resetOptimisticSpatialAudioActive", a3, a4);
  -[MRUSpatialAudioController updateSpatialAudioModes](self, "updateSpatialAudioModes");
  -[MRUSpatialAudioController updateNowPlaying](self, "updateNowPlaying");
}

- (void)resetOptimisticSpatialAudioActive
{
  NSTimer *optimisticSpatialAudioActiveTimer;

  -[NSTimer invalidate](self->_optimisticSpatialAudioActiveTimer, "invalidate");
  optimisticSpatialAudioActiveTimer = self->_optimisticSpatialAudioActiveTimer;
  self->_optimisticSpatialAudioActiveTimer = 0;

}

- (void)updateNowPlaying
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  MRUVolumeNowPlayingInfo *v10;
  MRUVolumeNowPlayingInfo *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  id v15;

  -[MRNowPlayingAudioFormatController audioFormatApplication](self->_audioFormatController, "audioFormatApplication");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingAudioFormatController audioFormatContentInfo](self->_audioFormatController, "audioFormatContentInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUSystemOutputDeviceRouteController primaryOutputDeviceRoute](self->_outputDeviceRouteController, "primaryOutputDeviceRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUSpatialAudioController preferenceForBundleID:outputDevice:](self, "preferenceForBundleID:outputDevice:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v3, "renderingMode");
  if (objc_msgSend(v15, "isFaceTime"))
  {
    +[MRUStringsProvider spatialButtonTitle](MRUStringsProvider, "spatialButtonTitle");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (self->_isDeviceSpatialAudioSupported || (unint64_t)(v7 - 3) > 2)
  {
    if (-[NSTimer isValid](self->_optimisticSpatialAudioActiveTimer, "isValid")
      && -[MRUSpatialAudioController isMultichannel](self, "isMultichannel"))
    {
      if (objc_msgSend(v3, "bestAvailableAudioFormat") == 2)
        +[MRUStringsProvider bestAvailableAudioFormatAtmos](MRUStringsProvider, "bestAvailableAudioFormatAtmos");
      else
        +[MRUStringsProvider bestAvailableAudioFormatMulitchannel](MRUStringsProvider, "bestAvailableAudioFormatMulitchannel");
    }
    else if (objc_msgSend(v6, "mode"))
    {
      objc_msgSend(v3, "audioFormatDescription");
    }
    else
    {
      objc_msgSend(v3, "bestAvailableAudioFormatDescription");
    }
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MRUSpatialAudioController localizedStringForRenderingMode:](self, "localizedStringForRenderingMode:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  if (-[MRUSpatialAudioController isEnabled](self, "isEnabled"))
  {
    if (!self->_isDeviceSpatialAudioSupported && (unint64_t)(v7 - 3) >= 3)
      goto LABEL_18;
  }
  else if ((unint64_t)(v7 - 3) > 2)
  {
LABEL_18:
    v10 = 0;
    goto LABEL_21;
  }
  v11 = [MRUVolumeNowPlayingInfo alloc];
  objc_msgSend(v15, "bundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MRUVolumeNowPlayingInfo initWithBundleID:name:formatDescription:](v11, "initWithBundleID:name:formatDescription:", v12, v13, v9);

LABEL_21:
  if (!-[MRUVolumeNowPlayingInfo isEqual:](self->_nowPlayingInfo, "isEqual:", v10))
  {
    objc_storeStrong((id *)&self->_nowPlayingInfo, v10);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "spatialAudioController:didChangeNowPlayingInfo:", self, v10);

  }
}

- (void)updateSpatialAudioModes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL8 v8;
  int v9;
  void *v10;
  MRUSpatialAudioMode *v11;
  MRUSpatialAudioMode *v12;
  void *v13;
  MRUSpatialAudioMode *v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  NSArray *v20;
  NSArray *v21;
  NSArray *availableModes;
  MRUSpatialAudioMode *v23;
  id WeakRetained;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  _BOOL4 v29;
  void *v30;
  _BOOL4 v31;
  _BOOL4 v32;
  _BOOL4 v33;
  _BOOL4 isDeviceSpatialAudioSupported;
  int accessoryStereoHFPStatus;
  MRUSpatialAudioMode *v36;
  void *v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  _BOOL4 v47;
  __int16 v48;
  _BOOL4 v49;
  __int16 v50;
  int v51;
  __int16 v52;
  _BOOL4 v53;
  __int16 v54;
  _BOOL4 v55;
  __int16 v56;
  _BOOL4 v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  -[MRNowPlayingAudioFormatController audioFormatApplication](self->_audioFormatController, "audioFormatApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingAudioFormatController audioFormatContentInfo](self->_audioFormatController, "audioFormatContentInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUSystemOutputDeviceRouteController primaryOutputDeviceRoute](self->_outputDeviceRouteController, "primaryOutputDeviceRoute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUSpatialAudioController preferenceForBundleID:outputDevice:](self, "preferenceForBundleID:outputDevice:", v5, v6);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MRUSpatialAudioController isSpatialAudioActive](self, "isSpatialAudioActive");
  if (objc_msgSend(v3, "isFaceTime"))
    v8 = self->_accessoryStereoHFPStatus == 2;
  else
    v8 = 1;
  if (-[MRUSpatialAccessibilityObserver isHeadTrackingEnabled](self->_accessibilityObserver, "isHeadTrackingEnabled"))
    v9 = !-[MRUSystemOutputDeviceRouteController isSplitRoute](self->_outputDeviceRouteController, "isSplitRoute");
  else
    v9 = 0;
  if (!self->_isDeviceSpatialAudioSupported)
  {
    v13 = 0;
    v18 = 0;
    v15 = v37;
    goto LABEL_28;
  }
  v10 = (void *)MEMORY[0x1E0C99DE8];
  v11 = -[MRUSpatialAudioMode initWithType:]([MRUSpatialAudioMode alloc], "initWithType:", 0);
  v12 = -[MRUSpatialAudioMode initWithType:]([MRUSpatialAudioMode alloc], "initWithType:", 1);
  objc_msgSend(v10, "arrayWithObjects:", v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v14 = -[MRUSpatialAudioMode initWithType:isEnabled:]([MRUSpatialAudioMode alloc], "initWithType:isEnabled:", 2, v8);
    objc_msgSend(v13, "addObject:", v14);

  }
  v15 = v37;
  if (!-[MRUSpatialAudioController isMultichannel](self, "isMultichannel")
    && objc_msgSend(v37, "mode") == 3
    || !objc_msgSend(v37, "mode"))
  {
    goto LABEL_26;
  }
  v16 = objc_msgSend(v37, "mode") == 1 && v7;
  if (!v16 || (objc_msgSend(v37, "isHeadTrackingEnabled") & v9 & 1) == 0)
  {
    if (objc_msgSend(v37, "mode") == 1 && v7)
    {
      v17 = 1;
      goto LABEL_27;
    }
    if (objc_msgSend(v37, "mode") != 1)
    {
      if ((objc_msgSend(v37, "isHeadTrackingEnabled") & v9) != 0)
        v17 = 2;
      else
        v17 = 1;
      goto LABEL_27;
    }
LABEL_26:
    v17 = 0;
    goto LABEL_27;
  }
  v17 = 2;
LABEL_27:
  objc_msgSend(v13, "objectAtIndexedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:
  v20 = self->_availableModes;
  v21 = (NSArray *)objc_msgSend(v13, "copy");
  availableModes = self->_availableModes;
  self->_availableModes = v21;

  v23 = self->_selectedMode;
  objc_storeStrong((id *)&self->_selectedMode, v18);
  if (!-[NSArray isEqualToArray:](v20, "isEqualToArray:", v13))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "spatialAudioController:didChangeAvailableSpatialModes:", self, self->_availableModes);

  }
  if (!-[MRUSpatialAudioMode isEqual:](v23, "isEqual:", v18))
  {
    v25 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v25, "spatialAudioController:didChangeSelectedSpatialMode:", self, self->_selectedMode);

  }
  MCLogCategoryVolume();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = v3;
    v28 = objc_opt_class();
    v33 = -[NSTimer isValid](self->_optimisticSpatialAudioActiveTimer, "isValid");
    isDeviceSpatialAudioSupported = self->_isDeviceSpatialAudioSupported;
    accessoryStereoHFPStatus = self->_accessoryStereoHFPStatus;
    v36 = v23;
    v29 = -[MRUSpatialAccessibilityObserver isHeadTrackingEnabled](self->_accessibilityObserver, "isHeadTrackingEnabled");
    v30 = v13;
    v31 = -[MRUSpatialAccessibilityObserver isMonoAudioEnabled](self->_accessibilityObserver, "isMonoAudioEnabled");
    v32 = -[MRUSystemOutputDeviceRouteController isSplitRoute](self->_outputDeviceRouteController, "isSplitRoute");
    *(_DWORD *)buf = 138545666;
    v39 = v28;
    v3 = v27;
    v15 = v37;
    v40 = 2114;
    v41 = v37;
    v42 = 2114;
    v43 = v3;
    v44 = 2114;
    v45 = v4;
    v46 = 1024;
    v47 = v33;
    v48 = 1024;
    v49 = isDeviceSpatialAudioSupported;
    v50 = 1024;
    v51 = accessoryStereoHFPStatus;
    v52 = 1024;
    v53 = v29;
    v23 = v36;
    v54 = 1024;
    v55 = v31;
    v13 = v30;
    v56 = 1024;
    v57 = v32;
    _os_log_impl(&dword_1AA991000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ update modes - pref: %{public}@ | application: %{public}@ | contentInfo: %{public}@ | OptActive: %{BOOL}u | Supported: %{BOOL}u | HFP: %{PUBLIC}i | HTAcess: %{BOOL}u | Mono: %{BOOL}u | split: %{BOOL}u", buf, 0x4Eu);
  }

}

- (id)preferenceForBundleID:(id)a3 outputDevice:(id)a4
{
  id v6;
  NSCache *cache;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  MRUSpatialAudioPreferences *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  unsigned __int8 v21;
  unsigned int v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  cache = self->_cache;
  v8 = a4;
  -[NSCache objectForKey:](cache, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logicalLeaderOutputDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "deviceType") == 2)
  {
    objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deviceFromAddressString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0;
    v21 = 0;
    v14 = objc_msgSend(v13, "spatialAudioConfig:spatialMode:headTracking:", v6, &v22, &v21);
    if (v14)
    {
      v15 = [MRUSpatialAudioPreferences alloc];
      v16 = -[MRUSpatialAudioPreferences initWithMode:headTrackingEnabled:](v15, "initWithMode:headTrackingEnabled:", v22, v21);

      -[NSCache setObject:forKey:](self->_cache, "setObject:forKey:", v16, v6);
      v9 = (void *)v16;
    }
    MCLogCategoryVolume();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_opt_class();
      objc_msgSend(v10, "uid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v24 = v18;
      v25 = 2114;
      v26 = v9;
      v27 = 2114;
      v28 = v6;
      v29 = 2114;
      v30 = v19;
      v31 = 1024;
      v32 = v14;
      _os_log_impl(&dword_1AA991000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ retrieved preferences: %{public}@ for bundle id: %{public}@ | uid: %{public}@ | success: %{BOOL}u", buf, 0x30u);

    }
  }

  return v9;
}

- (BOOL)isSpatialAudioActive
{
  void *v3;
  void *v4;
  BOOL v5;

  -[MRNowPlayingAudioFormatController audioFormatContentInfo](self->_audioFormatController, "audioFormatContentInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingAudioFormatController audioFormatApplication](self->_audioFormatController, "audioFormatApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_msgSend(v4, "isFaceTime") & 1) != 0
    || (objc_msgSend(v3, "isSpatialized") & 1) != 0
    || -[NSTimer isValid](self->_optimisticSpatialAudioActiveTimer, "isValid");

  return v5;
}

- (MRUSpatialAudioController)initWithOutputDeviceRouteController:(id)a3
{
  id v5;
  MRUSpatialAudioController *v6;
  MRUSpatialAudioController *v7;
  MRNowPlayingAudioFormatController *v8;
  MRNowPlayingAudioFormatController *audioFormatController;
  MRUSpatialAccessibilityObserver *v10;
  MRUSpatialAccessibilityObserver *accessibilityObserver;
  NSCache *v12;
  NSCache *cache;
  void *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRUSpatialAudioController;
  v6 = -[MRUSpatialAudioController init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputDeviceRouteController, a3);
    -[MRUSystemOutputDeviceRouteController addObserver:](v7->_outputDeviceRouteController, "addObserver:", v7);
    v8 = (MRNowPlayingAudioFormatController *)objc_alloc_init(MEMORY[0x1E0D4C598]);
    audioFormatController = v7->_audioFormatController;
    v7->_audioFormatController = v8;

    -[MRNowPlayingAudioFormatController setDelegate:](v7->_audioFormatController, "setDelegate:", v7);
    v10 = objc_alloc_init(MRUSpatialAccessibilityObserver);
    accessibilityObserver = v7->_accessibilityObserver;
    v7->_accessibilityObserver = v10;

    -[MRUSpatialAccessibilityObserver setDelegate:](v7->_accessibilityObserver, "setDelegate:", v7);
    v12 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cache = v7->_cache;
    v7->_cache = v12;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel_accessibilityHeadTrackChangedNotification, *MEMORY[0x1E0D03370], 0);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[MRUSpatialAudioController stopMonitoring](self, "stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)MRUSpatialAudioController;
  -[MRUSpatialAudioController dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MRNowPlayingAudioFormatController audioFormatApplication](self->_audioFormatController, "audioFormatApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingAudioFormatController audioFormatContentInfo](self->_audioFormatController, "audioFormatContentInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSTimer isValid](self->_optimisticSpatialAudioActiveTimer, "isValid"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0D4C558], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "expanseSessionHasScreenSharingActivity"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ | %@ | %@ | optimistic: %@ | Screen Sharing: %@"), v4, v5, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)setSelectedMode:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_storeStrong((id *)&self->_selectedMode, a3);
  -[MRNowPlayingAudioFormatController audioFormatContentInfo](self->_audioFormatController, "audioFormatContentInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUSystemOutputDeviceRouteController primaryOutputDeviceRoute](self->_outputDeviceRouteController, "primaryOutputDeviceRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUSpatialAudioController preferenceForBundleID:outputDevice:](self, "preferenceForBundleID:outputDevice:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUSpatialAudioController preferencesForMode:previousPreferences:](self, "preferencesForMode:previousPreferences:", v12, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUSystemOutputDeviceRouteController primaryOutputDeviceRoute](self->_outputDeviceRouteController, "primaryOutputDeviceRoute");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUSpatialAudioController setPreferences:forBundleID:outputDevice:](self, "setPreferences:forBundleID:outputDevice:", v9, v6, v10);

  if (-[MRUSystemOutputDeviceRouteController isSplitRoute](self->_outputDeviceRouteController, "isSplitRoute"))
  {
    -[MRUSystemOutputDeviceRouteController secondaryOutputDeviceRoute](self->_outputDeviceRouteController, "secondaryOutputDeviceRoute");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUSpatialAudioController setPreferences:forBundleID:outputDevice:](self, "setPreferences:forBundleID:outputDevice:", v9, v6, v11);

  }
  if (!objc_msgSend(v8, "mode")
    && objc_msgSend(v9, "mode") == 1
    && -[MRUSpatialAudioController isMultichannelAvailable](self, "isMultichannelAvailable"))
  {
    -[MRUSpatialAudioController startOptimisticSpatialAudioActive](self, "startOptimisticSpatialAudioActive");
  }
  else
  {
    -[MRUSpatialAudioController stopOptimisticSpatialAudioActive](self, "stopOptimisticSpatialAudioActive");
  }

}

- (BOOL)isMultichannelAvailable
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  char v7;
  BOOL v8;

  -[MRNowPlayingAudioFormatController audioFormatContentInfo](self->_audioFormatController, "audioFormatContentInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bestAvailableAudioFormat");

  -[MRNowPlayingAudioFormatController audioFormatApplication](self->_audioFormatController, "audioFormatApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFaceTime");
  if (v4 == 2)
    v7 = 1;
  else
    v7 = v6;
  if (v4 == 1)
    v8 = 1;
  else
    v8 = v7;

  return v8;
}

- (void)startMonitoring
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D4C558], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

  -[MRUSpatialAudioController updateDeviceSpatialAudioSupported](self, "updateDeviceSpatialAudioSupported");
  -[MRUSpatialAudioController updateFaceTimeHeadTrackedSupported](self, "updateFaceTimeHeadTrackedSupported");
}

- (void)stopMonitoring
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D4C558], "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)startOptimisticSpatialAudioActive
{
  NSTimer *v3;
  NSTimer *optimisticSpatialAudioActiveTimer;

  -[NSTimer invalidate](self->_optimisticSpatialAudioActiveTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_stopOptimisticSpatialAudioActive, 0, 0, 300.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  optimisticSpatialAudioActiveTimer = self->_optimisticSpatialAudioActiveTimer;
  self->_optimisticSpatialAudioActiveTimer = v3;

}

- (void)stopOptimisticSpatialAudioActive
{
  NSTimer *optimisticSpatialAudioActiveTimer;

  if (-[NSTimer isValid](self->_optimisticSpatialAudioActiveTimer, "isValid"))
  {
    -[NSTimer invalidate](self->_optimisticSpatialAudioActiveTimer, "invalidate");
    optimisticSpatialAudioActiveTimer = self->_optimisticSpatialAudioActiveTimer;
    self->_optimisticSpatialAudioActiveTimer = 0;

    -[MRUSpatialAudioController updateSpatialAudioModes](self, "updateSpatialAudioModes");
  }
}

- (void)accessibilityHeadTrackChangedNotification
{
  -[NSCache removeAllObjects](self->_cache, "removeAllObjects");
  -[MRUSpatialAudioController updateSpatialAudioModes](self, "updateSpatialAudioModes");
}

- (void)systemOutputDeviceRouteControllerDidUpdateOutputDevices:(id)a3
{
  -[NSCache removeAllObjects](self->_cache, "removeAllObjects", a3);
  -[MRUSpatialAudioController updateSpatialAudioModes](self, "updateSpatialAudioModes");
  -[MRUSpatialAudioController updateFaceTimeHeadTrackedSupported](self, "updateFaceTimeHeadTrackedSupported");
  -[MRUSpatialAudioController updateNowPlaying](self, "updateNowPlaying");
}

- (void)nowPlayingAudioFormatController:(id)a3 didChangeAudioFormatApplication:(id)a4
{
  -[MRUSpatialAudioController resetOptimisticSpatialAudioActive](self, "resetOptimisticSpatialAudioActive", a3, a4);
  -[MRUSpatialAudioController updateSpatialAudioModes](self, "updateSpatialAudioModes");
  -[MRUSpatialAudioController updateNowPlaying](self, "updateNowPlaying");
}

- (void)expanseManagerDidJoinExpanseSession:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MRUSpatialAudioController_expanseManagerDidJoinExpanseSession___block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __65__MRUSpatialAudioController_expanseManagerDidJoinExpanseSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateSpatialAudioModes");
}

- (void)expanseManagerDidLeaveExpanseSession:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MRUSpatialAudioController_expanseManagerDidLeaveExpanseSession___block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __66__MRUSpatialAudioController_expanseManagerDidLeaveExpanseSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateSpatialAudioModes");
}

- (void)setPreferences:(id)a3 forBundleID:(id)a4 outputDevice:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(a5, "logicalLeaderOutputDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "deviceType") == 2)
  {
    objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deviceFromAddressString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "setSpatialAudioConfig:spatialMode:headTracking:", v9, objc_msgSend(v8, "mode"), objc_msgSend(v8, "isHeadTrackingEnabled"));
    if (v14)
      -[NSCache setObject:forKey:](self->_cache, "setObject:forKey:", v8, v9);
    MCLogCategoryVolume();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_opt_class();
      objc_msgSend(v10, "uid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138544386;
      v19 = v16;
      v20 = 2114;
      v21 = v8;
      v22 = 2114;
      v23 = v9;
      v24 = 2114;
      v25 = v17;
      v26 = 1024;
      v27 = v14;
      _os_log_impl(&dword_1AA991000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ set preferences: %{public}@ for bundle id: %{public}@ | uid: %{public}@ | success: %{BOOL}u", (uint8_t *)&v18, 0x30u);

    }
  }

}

- (id)preferencesForMode:(id)a3 previousPreferences:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  _BOOL4 v9;
  _BOOL4 v10;
  uint64_t v11;
  _BOOL4 v12;
  unsigned int v13;
  uint64_t v14;
  MRUSpatialAudioPreferences *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = -[MRUSpatialAudioController isSpatialAudioActive](self, "isSpatialAudioActive");
  v9 = -[MRUSpatialAudioController isMultichannel](self, "isMultichannel");
  v10 = -[MRUSpatialAudioController isMultichannelAvailable](self, "isMultichannelAvailable");
  v11 = 3;
  if (objc_msgSend(v7, "mode") != 1 || v8 || !v9)
  {
    v12 = objc_msgSend(v7, "mode") == 0;
    if (v9)
      v13 = 1;
    else
      v13 = 2;
    if (v12 && v10)
      v11 = 3;
    else
      v11 = v13;
  }
  v14 = objc_msgSend(v6, "type");
  switch(v14)
  {
    case 2:
      v15 = [MRUSpatialAudioPreferences alloc];
      v16 = v11;
      v17 = 1;
      goto LABEL_18;
    case 1:
LABEL_16:
      v15 = [MRUSpatialAudioPreferences alloc];
      v16 = v11;
      v17 = 0;
LABEL_18:
      v11 = -[MRUSpatialAudioPreferences initWithMode:headTrackingEnabled:](v15, "initWithMode:headTrackingEnabled:", v16, v17);
      break;
    case 0:
      if (v9)
        v11 = 0;
      else
        v11 = 3;
      goto LABEL_16;
  }

  return (id)v11;
}

- (void)updateDeviceSpatialAudioSupported
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  -[MRUSystemOutputDeviceRouteController primaryOutputDeviceRoute](self->_outputDeviceRouteController, "primaryOutputDeviceRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logicalLeaderOutputDevice");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v7, "supportsHeadTrackedSpatialAudio");
  if (-[MRUSystemOutputDeviceRouteController isSplitRoute](self->_outputDeviceRouteController, "isSplitRoute"))
  {
    -[MRUSystemOutputDeviceRouteController secondaryOutputDeviceRoute](self->_outputDeviceRouteController, "secondaryOutputDeviceRoute");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logicalLeaderOutputDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (objc_msgSend(v6, "supportsHeadTrackedSpatialAudio"))
        v4 = +[MRUFeatureFlagProvider isSpatialOnAggregateDevices](MRUFeatureFlagProvider, "isSpatialOnAggregateDevices");
      else
        v4 = 0;
    }

  }
  if (self->_isDeviceSpatialAudioSupported != v4)
  {
    self->_isDeviceSpatialAudioSupported = v4;
    -[MRUSpatialAudioController updateSpatialAudioModes](self, "updateSpatialAudioModes");
  }

}

- (void)updateFaceTimeHeadTrackedSupported
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[MRUSystemOutputDeviceRouteController primaryOutputDeviceRoute](self->_outputDeviceRouteController, "primaryOutputDeviceRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logicalLeaderOutputDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "deviceType") == 2)
  {
    objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceFromAddressString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "getStereoHFPSupport");
    MCLogCategoryVolume();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      objc_msgSend(v4, "uid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138544130;
      v13 = v10;
      v14 = 1026;
      v15 = v8;
      v16 = 2114;
      v17 = v11;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ retrieved accessoryStereoHFPStatus: %{public}i for uid: %{public}@ | device: %{public}@", (uint8_t *)&v12, 0x26u);

    }
  }
  else
  {
    v8 = 0;
  }
  if (self->_accessoryStereoHFPStatus != v8)
  {
    self->_accessoryStereoHFPStatus = v8;
    -[MRUSpatialAudioController updateSpatialAudioModes](self, "updateSpatialAudioModes");
  }

}

- (id)localizedStringForRenderingMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;

  switch(a3)
  {
    case 1:
      +[MRUStringsProvider audioSessionRenderingModeMonoStereo](MRUStringsProvider, "audioSessionRenderingModeMonoStereo", v3, v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      +[MRUStringsProvider audioSessionRenderingModeSurround](MRUStringsProvider, "audioSessionRenderingModeSurround", v3, v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      +[MRUStringsProvider audioSessionRenderingModeSpatialAudio](MRUStringsProvider, "audioSessionRenderingModeSpatialAudio", v3, v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      +[MRUStringsProvider audioSessionRenderingModeDolbyAudio](MRUStringsProvider, "audioSessionRenderingModeDolbyAudio", v3, v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      +[MRUStringsProvider audioSessionRenderingModeDolbyAtmos](MRUStringsProvider, "audioSessionRenderingModeDolbyAtmos", v3, v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = CFSTR("Not Applicable");
      break;
  }
  return v5;
}

- (MRUSystemOutputDeviceRouteController)outputDeviceRouteController
{
  return self->_outputDeviceRouteController;
}

- (MRUSpatialAudioControllerDelegate)delegate
{
  return (MRUSpatialAudioControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MRNowPlayingAudioFormatController)audioFormatController
{
  return self->_audioFormatController;
}

- (void)setAudioFormatController:(id)a3
{
  objc_storeStrong((id *)&self->_audioFormatController, a3);
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (NSTimer)optimisticSpatialAudioActiveTimer
{
  return self->_optimisticSpatialAudioActiveTimer;
}

- (void)setOptimisticSpatialAudioActiveTimer:(id)a3
{
  objc_storeStrong((id *)&self->_optimisticSpatialAudioActiveTimer, a3);
}

- (BOOL)isDeviceSpatialAudioSupported
{
  return self->_isDeviceSpatialAudioSupported;
}

- (void)setIsDeviceSpatialAudioSupported:(BOOL)a3
{
  self->_isDeviceSpatialAudioSupported = a3;
}

- (int)accessoryStereoHFPStatus
{
  return self->_accessoryStereoHFPStatus;
}

- (void)setAccessoryStereoHFPStatus:(int)a3
{
  self->_accessoryStereoHFPStatus = a3;
}

- (MRUSpatialAccessibilityObserver)accessibilityObserver
{
  return self->_accessibilityObserver;
}

- (void)setAccessibilityObserver:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityObserver, 0);
  objc_storeStrong((id *)&self->_optimisticSpatialAudioActiveTimer, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_audioFormatController, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_selectedMode, 0);
  objc_storeStrong((id *)&self->_availableModes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outputDeviceRouteController, 0);
}

@end
