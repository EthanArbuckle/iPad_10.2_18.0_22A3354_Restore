@implementation MPRestrictionsMonitor

+ (MPRestrictionsMonitor)sharedRestrictionsMonitor
{
  if (sharedRestrictionsMonitor___once != -1)
    dispatch_once(&sharedRestrictionsMonitor___once, &__block_literal_global_49037);
  return (MPRestrictionsMonitor *)(id)sharedRestrictionsMonitor___sharedInstance;
}

- (BOOL)allowsExplicitContent
{
  return self->_allowsExplicitContent;
}

- (BOOL)allowsMusicVideos
{
  return self->_allowsMusicVideos;
}

- (int64_t)maximumMovieRating
{
  void *v2;
  void *v3;
  int64_t v4;

  -[MPRestrictionsMonitor effectiveValueForSetting:](self, "effectiveValueForSetting:", *MEMORY[0x1E0D470C0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 1000;

  return v4;
}

- (int64_t)maximumTVShowRating
{
  void *v2;
  void *v3;
  int64_t v4;

  -[MPRestrictionsMonitor effectiveValueForSetting:](self, "effectiveValueForSetting:", *MEMORY[0x1E0D470C8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 1000;

  return v4;
}

- (id)effectiveValueForSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_cachedSettings, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (!v7)
      goto LABEL_6;
  }
  else
  {
    -[MCProfileConnection effectiveValueForSetting:](self->_connection, "effectiveValueForSetting:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_lock);
    -[MPRestrictionsMonitor _cacheValue:forSetting:](self, "_cacheValue:forSetting:", v5, v4);
    os_unfair_lock_unlock(&self->_lock);
  }

  v5 = 0;
LABEL_6:

  return v5;
}

- (void)_cacheValue:(id)a3 forSetting:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v8 = a3;
  v6 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  v7 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (id)v7;
  -[NSMutableDictionary setObject:forKey:](self->_cachedSettings, "setObject:forKey:", v7, v6);

}

- (void)setMaximumTVShowRatingForAgeGate:(int64_t)a3
{
  self->_maximumTVShowRatingForAgeGate = a3;
}

- (void)setMaximumMovieRatingForAgeGate:(int64_t)a3
{
  self->_maximumMovieRatingForAgeGate = a3;
}

uint64_t __50__MPRestrictionsMonitor__isRunningInStoreDemoMode__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0DC3470], "isRunningInStoreDemoMode");
  _isRunningInStoreDemoMode___isRunningInStoreDemoMode = result;
  return result;
}

- (BOOL)allowsAccountModification
{
  return self->_allowsAccountModification;
}

void __50__MPRestrictionsMonitor_sharedRestrictionsMonitor__block_invoke()
{
  MPRestrictionsMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(MPRestrictionsMonitor);
  v1 = (void *)sharedRestrictionsMonitor___sharedInstance;
  sharedRestrictionsMonitor___sharedInstance = (uint64_t)v0;

}

- (MPRestrictionsMonitor)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MPRestrictionsMonitor;
  v2 = -[MPRestrictionsMonitor init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v3;

    *((_DWORD *)v2 + 2) = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    if (+[MPHomeMonitor isCurrentDeviceValidHomeAccessory](MPHomeMonitor, "isCurrentDeviceValidHomeAccessory"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_handleAllowExplicitSettingDidChangeNotification_, CFSTR("MPHomeUserObserverUserAllowExplicitSettingsDidChangeNotification"), 0);

    }
    *(int64x2_t *)(v2 + 40) = vdupq_n_s64(0x3E8uLL);
    objc_msgSend(*((id *)v2 + 3), "registerObserver:", v2);
    objc_msgSend(v2, "_updateWithCanPostNotifications:", 0);
  }
  return (MPRestrictionsMonitor *)v2;
}

- (void)_updateWithCanPostNotifications:(BOOL)a3
{
  id v4;
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  MCProfileConnection *connection;
  int v9;
  const char *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  MPRestrictionsMonitor *v15;
  unsigned int v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  MPRestrictionsMonitor *v22;
  unsigned int v23;
  NSObject *v24;
  const __CFString *v25;
  _BOOL4 v26;
  const char *v27;
  void *v28;
  NSObject *v29;
  MPRestrictionsMonitor *v30;
  unsigned int v31;
  NSObject *v32;
  const __CFString *v33;
  _BOOL4 v34;
  const char *v35;
  void *v36;
  NSObject *v37;
  MPRestrictionsMonitor *v38;
  unsigned int v39;
  NSObject *v40;
  const __CFString *v41;
  MPRestrictionsMonitor *v42;
  unsigned int v43;
  NSObject *v44;
  const __CFString *v45;
  _BOOL4 v47;
  void *v48;
  NSObject *v49;
  unsigned int v50;
  NSObject *v51;
  const __CFString *v52;
  _BOOL4 v54;
  const char *v55;
  void *v56;
  NSObject *v57;
  MPRestrictionsMonitor *v58;
  unsigned int v59;
  NSObject *v60;
  const __CFString *v61;
  _BOOL4 v62;
  const char *v63;
  void *v64;
  NSObject *v65;
  MPRestrictionsMonitor *v66;
  unsigned int v67;
  NSObject *v68;
  const __CFString *v69;
  _BOOL4 v70;
  const char *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  NSObject *v82;
  _BOOL4 v83;
  const char *v84;
  const char *v85;
  NSObject *v86;
  uint32_t v87;
  NSObject *v88;
  _QWORD block[4];
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint8_t buf[4];
  MPRestrictionsMonitor *v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  const char *v100;
  __int16 v101;
  id v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);

  }
  else
  {
    v4 = 0;
  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = -[MPRestrictionsMonitor _isRunningInStoreDemoMode](self, "_isRunningInStoreDemoMode");
  v7 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    *(_DWORD *)buf = 138543874;
    v96 = self;
    v97 = 2114;
    v98 = (uint64_t)connection;
    v99 = 1024;
    LODWORD(v100) = v6;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "Beginning update for properties of %{public}@. _connection = %{public}@, isRunningInStoreDemoMode = %{BOOL}u", buf, 0x1Cu);
  }

  os_unfair_lock_lock(&self->_lock);
  v9 = !v6;
  v10 = "Unchanged";
  if (self->_allowsDeletion != !v6)
  {
    self->_allowsDeletion = v9;
    objc_msgSend(v5, "addObject:", CFSTR("allowsDeletion"));
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("MPRestrictionsMonitorAllowsDeletionDidChangeNotification"), self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

    v10 = "Updated";
  }
  v12 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v96 = (MPRestrictionsMonitor *)v10;
    v97 = 1024;
    LODWORD(v98) = v9;
    _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s allowsDeletion = %{BOOL}u.", buf, 0x12u);
  }

  if (+[MPHomeMonitor isCurrentDeviceValidHomeAccessory](MPHomeMonitor, "isCurrentDeviceValidHomeAccessory"))
  {
    v13 = +[MPHomeUserMonitor isExplicitSettingEnabledForCurrentUser](MPHomeUserMonitor, "isExplicitSettingEnabledForCurrentUser");
    if (self->_allowsExplicitContent == v13)
    {
LABEL_12:
      v14 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    v15 = (MPRestrictionsMonitor *)*MEMORY[0x1E0D46FF8];
    v16 = -[MCProfileConnection effectiveBoolValueForSetting:](self->_connection, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FF8]);
    v17 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      if (v16 > 2)
        v18 = CFSTR("????");
      else
        v18 = off_1E3162F88[v16];
      *(_DWORD *)buf = 138543618;
      v96 = v15;
      v97 = 2114;
      v98 = (uint64_t)v18;
      _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_DEFAULT, "Effective BOOL value for MCFeatureExplicitContentAllowed (%{public}@) = %{public}@.", buf, 0x16u);
    }

    v13 = v16 == 1;
    if (self->_allowsExplicitContent == v13)
      goto LABEL_12;
  }
  self->_allowsExplicitContent = v13;
  objc_msgSend(v5, "addObject:", CFSTR("allowsExplicitContent"));
  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("MPRestrictionsMonitorAllowsExplicitContentDidChangeNotification"), self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v19);

  v14 = 1;
LABEL_20:
  v20 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = "Updated";
    if (!v14)
      v21 = "Unchanged";
    *(_DWORD *)buf = 136446466;
    v96 = (MPRestrictionsMonitor *)v21;
    v97 = 1024;
    LODWORD(v98) = v13;
    _os_log_impl(&dword_193B9B000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s allowsExplicitContent = %{BOOL}u.", buf, 0x12u);
  }

  v22 = (MPRestrictionsMonitor *)*MEMORY[0x1E0D46ED8];
  v23 = -[MCProfileConnection effectiveBoolValueForSetting:](self->_connection, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46ED8]);
  v24 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    if (v23 > 2)
      v25 = CFSTR("????");
    else
      v25 = off_1E3162F88[v23];
    *(_DWORD *)buf = 138543618;
    v96 = v22;
    v97 = 2114;
    v98 = (uint64_t)v25;
    _os_log_impl(&dword_193B9B000, v24, OS_LOG_TYPE_DEFAULT, "Effective BOOL value for MCFeatureAccountModificationAllowed (%{public}@) = %{public}@.", buf, 0x16u);
  }

  v26 = v23 != 2;
  if (self->_allowsAccountModification == v26)
  {
    v27 = "Unchanged";
  }
  else
  {
    self->_allowsAccountModification = v26;
    objc_msgSend(v5, "addObject:", CFSTR("allowsAccountModification"));
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("MPRestrictionsMonitorAllowsAccountModificationDidChangeNotification"), self);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v28);

    v27 = "Updated";
  }
  v29 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v96 = (MPRestrictionsMonitor *)v27;
    v97 = 1024;
    LODWORD(v98) = v26;
    _os_log_impl(&dword_193B9B000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s allowsAccountModification = %{BOOL}u.", buf, 0x12u);
  }

  v30 = (MPRestrictionsMonitor *)*MEMORY[0x1E0D470E0];
  v31 = -[MCProfileConnection effectiveBoolValueForSetting:](self->_connection, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D470E0]);
  v32 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    if (v31 > 2)
      v33 = CFSTR("????");
    else
      v33 = off_1E3162F88[v31];
    *(_DWORD *)buf = 138543618;
    v96 = v30;
    v97 = 2114;
    v98 = (uint64_t)v33;
    _os_log_impl(&dword_193B9B000, v32, OS_LOG_TYPE_DEFAULT, "Effective BOOL value for MCFeatureMusicServiceAllowed (%{public}@) = %{public}@.", buf, 0x16u);
  }

  v34 = v31 != 2;
  if (self->_allowsMusicSubscription == v34)
  {
    v35 = "Unchanged";
  }
  else
  {
    self->_allowsMusicSubscription = v34;
    objc_msgSend(v5, "addObject:", CFSTR("allowsMusicSubscription"));
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("MPRestrictionsMonitorMusicSubscriptionDidChangeNotification"), self);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v36);

    v35 = "Updated";
  }
  v37 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v96 = (MPRestrictionsMonitor *)v35;
    v97 = 1024;
    LODWORD(v98) = v34;
    _os_log_impl(&dword_193B9B000, v37, OS_LOG_TYPE_DEFAULT, "%{public}s allowsMusicSubscription = %{BOOL}u.", buf, 0x12u);
  }

  v38 = (MPRestrictionsMonitor *)*MEMORY[0x1E0D47080];
  v39 = -[MCProfileConnection effectiveBoolValueForSetting:](self->_connection, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47080]);
  v40 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    if (v39 > 2)
      v41 = CFSTR("????");
    else
      v41 = off_1E3162F88[v39];
    *(_DWORD *)buf = 138543618;
    v96 = v38;
    v97 = 2114;
    v98 = (uint64_t)v41;
    _os_log_impl(&dword_193B9B000, v40, OS_LOG_TYPE_DEFAULT, "Effective BOOL value for MCFeatureITunesAllowed (%{public}@) = %{public}@.", buf, 0x16u);
  }

  v42 = (MPRestrictionsMonitor *)*MEMORY[0x1E0D47098];
  v43 = -[MCProfileConnection effectiveBoolValueForSetting:](self->_connection, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47098]);
  v44 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    if (v43 > 2)
      v45 = CFSTR("????");
    else
      v45 = off_1E3162F88[v43];
    *(_DWORD *)buf = 138543618;
    v96 = v42;
    v97 = 2114;
    v98 = (uint64_t)v45;
    _os_log_impl(&dword_193B9B000, v44, OS_LOG_TYPE_DEFAULT, "Effective BOOL value for MCFeatureInAppPurchasesAllowed (%{public}@) = %{public}@.", buf, 0x16u);
  }

  if (v39 == 1 && v43 == 1)
    v47 = v9;
  else
    v47 = 0;
  if (self->_allowsStorePurchases != v47)
  {
    self->_allowsStorePurchases = v47;
    objc_msgSend(v5, "addObject:", CFSTR("allowStorePurchases"));
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("MPRestrictionsMonitorAllowsStorePurchasesDidChangeNotification"), self);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v48);

  }
  v49 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v96 = (MPRestrictionsMonitor *)"Updated";
    v97 = 1024;
    LODWORD(v98) = v47;
    _os_log_impl(&dword_193B9B000, v49, OS_LOG_TYPE_DEFAULT, "%{public}s allowStorePurchases = %{BOOL}u.", buf, 0x12u);
  }

  v50 = -[MCProfileConnection effectiveBoolValueForSetting:](self->_connection, "effectiveBoolValueForSetting:", v42);
  v51 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    if (v50 > 2)
      v52 = CFSTR("????");
    else
      v52 = off_1E3162F88[v50];
    *(_DWORD *)buf = 138543618;
    v96 = v42;
    v97 = 2114;
    v98 = (uint64_t)v52;
    _os_log_impl(&dword_193B9B000, v51, OS_LOG_TYPE_DEFAULT, "Effective BOOL value for MCFeatureInAppPurchasesAllowed (%{public}@) = %{public}@.", buf, 0x16u);
  }

  v54 = v50 == 1 && v39 == 1;
  if (self->_allowsRadioPurchases == v54)
  {
    v55 = "Unchanged";
  }
  else
  {
    self->_allowsRadioPurchases = v54;
    objc_msgSend(v5, "addObject:", CFSTR("allowsRadioPurchases"));
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("MPRestrictionsMonitorAllowsRadioPurchasesDidChangeNotification"), self);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v56);

    v55 = "Updated";
  }
  v57 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v96 = (MPRestrictionsMonitor *)v55;
    v97 = 1024;
    LODWORD(v98) = v54;
    _os_log_impl(&dword_193B9B000, v57, OS_LOG_TYPE_DEFAULT, "%{public}s allowsRadioPurchases = %{BOOL}u.", buf, 0x12u);
  }

  v58 = (MPRestrictionsMonitor *)*MEMORY[0x1E0D47118];
  v59 = -[MCProfileConnection effectiveBoolValueForSetting:](self->_connection, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47118]);
  v60 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    if (v59 > 2)
      v61 = CFSTR("????");
    else
      v61 = off_1E3162F88[v59];
    *(_DWORD *)buf = 138543618;
    v96 = v58;
    v97 = 2114;
    v98 = (uint64_t)v61;
    _os_log_impl(&dword_193B9B000, v60, OS_LOG_TYPE_DEFAULT, "Effective BOOL value for MCFeatureRadioServiceAllowed (%{public}@) = %{public}@.", buf, 0x16u);
  }

  v62 = v59 == 1;
  if (self->_allowsRadioService == v62)
  {
    v63 = "Unchanged";
  }
  else
  {
    self->_allowsRadioService = v62;
    objc_msgSend(v5, "addObject:", CFSTR("allowsRadioService"));
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("MPRestrictionsMonitorAllowsRadioServiceDidChangeNotification"), self);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v64);

    v63 = "Updated";
  }
  v65 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v96 = (MPRestrictionsMonitor *)v63;
    v97 = 1024;
    LODWORD(v98) = v62;
    _os_log_impl(&dword_193B9B000, v65, OS_LOG_TYPE_DEFAULT, "%{public}s allowsRadioService = %{BOOL}u.", buf, 0x12u);
  }

  v66 = (MPRestrictionsMonitor *)*MEMORY[0x1E0D470E8];
  v67 = -[MCProfileConnection effectiveBoolValueForSetting:](self->_connection, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D470E8]);
  v68 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    if (v67 > 2)
      v69 = CFSTR("????");
    else
      v69 = off_1E3162F88[v67];
    *(_DWORD *)buf = 138543618;
    v96 = v66;
    v97 = 2114;
    v98 = (uint64_t)v69;
    _os_log_impl(&dword_193B9B000, v68, OS_LOG_TYPE_DEFAULT, "Effective BOOL value for MCFeatureMusicVideosAllowed (%{public}@) = %{public}@.", buf, 0x16u);
  }

  v70 = v67 == 1;
  if (self->_allowsMusicVideos == v70)
  {
    v71 = "Unchanged";
  }
  else
  {
    self->_allowsMusicVideos = v70;
    objc_msgSend(v5, "addObject:", CFSTR("allowsMusicVideos"));
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("MPRestrictionsMonitorAllowsMusicVideosDidChangeNotification"), self);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v72);

    v71 = "Updated";
  }
  v73 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v96 = (MPRestrictionsMonitor *)v71;
    v97 = 1024;
    LODWORD(v98) = v70;
    _os_log_impl(&dword_193B9B000, v73, OS_LOG_TYPE_DEFAULT, "%{public}s allowsMusicVideos = %{BOOL}u.", buf, 0x12u);
  }

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v74 = (void *)-[NSMutableDictionary copy](self->_cachedSettings, "copy");
  v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
  if (v75)
  {
    v76 = v75;
    v77 = *(_QWORD *)v92;
    do
    {
      for (i = 0; i != v76; ++i)
      {
        if (*(_QWORD *)v92 != v77)
          objc_enumerationMutation(v74);
        v79 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i);
        -[MCProfileConnection effectiveValueForSetting:](self->_connection, "effectiveValueForSetting:", v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPRestrictionsMonitor _cacheValue:forSetting:](self, "_cacheValue:forSetting:", v80, v79);

      }
      v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
    }
    while (v76);
  }

  os_unfair_lock_unlock(&self->_lock);
  v81 = objc_msgSend(v5, "count");
  v82 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  v83 = os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT);
  if (v81)
  {
    if (!v83)
      goto LABEL_115;
    v84 = "properties";
    *(_DWORD *)buf = 138544130;
    v96 = self;
    v97 = 2048;
    if (v81 == 1)
      v84 = "property";
    v98 = v81;
    v99 = 2082;
    v100 = v84;
    v101 = 2114;
    v102 = v5;
    v85 = "Completed update for properties of %{public}@. %lu %{public}s updated: %{public}@";
    v86 = v82;
    v87 = 42;
  }
  else
  {
    if (!v83)
      goto LABEL_115;
    *(_DWORD *)buf = 138543362;
    v96 = self;
    v85 = "Completed update for properties of %{public}@. All properties remained unchanged.";
    v86 = v82;
    v87 = 12;
  }
  _os_log_impl(&dword_193B9B000, v86, OS_LOG_TYPE_DEFAULT, v85, buf, v87);
LABEL_115:

  if (objc_msgSend(v4, "count"))
  {
    dispatch_get_global_queue(0, 0);
    v88 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__MPRestrictionsMonitor__updateWithCanPostNotifications___block_invoke;
    block[3] = &unk_1E3163508;
    v90 = v4;
    dispatch_async(v88, block);

  }
}

- (BOOL)_isRunningInStoreDemoMode
{
  if (_isRunningInStoreDemoMode___once != -1)
    dispatch_once(&_isRunningInStoreDemoMode___once, &__block_literal_global_25_49015);
  return _isRunningInStoreDemoMode___isRunningInStoreDemoMode;
}

- (BOOL)allowsMusicSubscription
{
  return self->_allowsMusicSubscription;
}

- (void)dealloc
{
  objc_super v3;

  -[MCProfileConnection unregisterObserver:](self->_connection, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)MPRestrictionsMonitor;
  -[MPRestrictionsMonitor dealloc](&v3, sel_dealloc);
}

- (BOOL)hasRestrictionsPasscode
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getSFRestrictionsPasscodeControllerClass_softClass;
  v9 = getSFRestrictionsPasscodeControllerClass_softClass;
  if (!getSFRestrictionsPasscodeControllerClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getSFRestrictionsPasscodeControllerClass_block_invoke;
    v5[3] = &unk_1E31639A0;
    v5[4] = &v6;
    __getSFRestrictionsPasscodeControllerClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_msgSend(v3, "settingEnabled");
}

- (void)handleAllowExplicitSettingDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  MPRestrictionsMonitor *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ handling allow explicit setting did change notification for home monitor: %{public}@.", (uint8_t *)&v6, 0x16u);
  }

  -[MPRestrictionsMonitor _updateWithCanPostNotifications:](self, "_updateWithCanPostNotifications:", 1);
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  MPRestrictionsMonitor *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.mediaplayer", "Restrictions");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543874;
    v10 = self;
    v11 = 2114;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ handling effective settings changed notification for %{public}@ with user info: %{public}@.", (uint8_t *)&v9, 0x20u);
  }

  -[MPRestrictionsMonitor _updateWithCanPostNotifications:](self, "_updateWithCanPostNotifications:", 1);
}

- (BOOL)allowsDeletion
{
  return self->_allowsDeletion;
}

- (BOOL)allowsStorePurchases
{
  return self->_allowsStorePurchases;
}

- (BOOL)allowsRadioPurchases
{
  return self->_allowsRadioPurchases;
}

- (BOOL)allowsRadioService
{
  return self->_allowsRadioService;
}

- (int64_t)maximumTVShowRatingForAgeGate
{
  return self->_maximumTVShowRatingForAgeGate;
}

- (int64_t)maximumMovieRatingForAgeGate
{
  return self->_maximumMovieRatingForAgeGate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_cachedSettings, 0);
}

void __57__MPRestrictionsMonitor__updateWithCanPostNotifications___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v5);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "postNotification:", v6);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

@end
