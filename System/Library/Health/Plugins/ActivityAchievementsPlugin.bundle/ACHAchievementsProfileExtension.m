@implementation ACHAchievementsProfileExtension

- (ACHAchievementsProfileExtension)initWithProfile:(id)a3 mobileAssetProvider:(id)a4
{
  return -[ACHAchievementsProfileExtension initWithProfile:mobileAssetProvider:unitTesting:](self, "initWithProfile:mobileAssetProvider:unitTesting:", a3, a4, 0);
}

- (ACHAchievementsProfileExtension)initWithProfile:(id)a3 mobileAssetProvider:(id)a4 unitTesting:(BOOL)a5
{
  id v8;
  id v9;
  ACHAchievementsProfileExtension *v10;
  NSObject *v11;
  uint64_t v12;
  OS_dispatch_queue *clientQueue;
  void *v14;
  void *v15;
  int v16;
  id v17;
  id WeakRetained;
  uint64_t v19;
  uint64_t v20;
  ACHRemoteTemplateAvailabilityKeyProvider *remoteTemplateAvailabilityKeyProvider;
  uint64_t v22;
  NSSet *blocksWaitingOnInitialization;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  __int16 v31[8];
  objc_super v32;

  v8 = a3;
  v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)ACHAchievementsProfileExtension;
  v10 = -[ACHAchievementsProfileExtension init](&v32, sel_init);
  if (v10)
  {
    ACHLogDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v31[0] = 0;
      _os_log_impl(&dword_2322D3000, v11, OS_LOG_TYPE_DEFAULT, "Loading ActivityAchievements plugin...", (uint8_t *)v31, 2u);
    }

    v10->_accessLock._os_unfair_lock_opaque = 0;
    HKCreateSerialDispatchQueue();
    v12 = objc_claimAutoreleasedReturnValue();
    clientQueue = v10->_clientQueue;
    v10->_clientQueue = (OS_dispatch_queue *)v12;

    objc_storeWeak((id *)&v10->_profile, v8);
    objc_msgSend(v8, "daemon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "behavior");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isAppleWatch");

    v17 = objc_alloc(MEMORY[0x24BE01A98]);
    WeakRetained = objc_loadWeakRetained((id *)&v10->_profile);
    if (v16)
      v19 = 1;
    else
      v19 = 2;
    v20 = objc_msgSend(v17, "initWithProfile:creatorDevice:", WeakRetained, v19);
    remoteTemplateAvailabilityKeyProvider = v10->_remoteTemplateAvailabilityKeyProvider;
    v10->_remoteTemplateAvailabilityKeyProvider = (ACHRemoteTemplateAvailabilityKeyProvider *)v20;

    v10->_unitTesting = a5;
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v22 = objc_claimAutoreleasedReturnValue();
    blocksWaitingOnInitialization = v10->_blocksWaitingOnInitialization;
    v10->_blocksWaitingOnInitialization = (NSSet *)v22;

    *(_WORD *)&v10->_initialMoveGoalFetchCompleted = 0;
    v24 = objc_loadWeakRetained((id *)&v10->_profile);
    objc_msgSend(v24, "healthDaemon");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "behavior");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_isWatch = objc_msgSend(v26, "isAppleWatch");

    objc_storeStrong((id *)&v10->_mobileAssetProvider, a4);
    if (v10->_unitTesting)
    {
      v10->_fitnessAppIsInstalled = 1;
      -[ACHAchievementsProfileExtension _unleashTheKrakenUnderProperConditions](v10, "_unleashTheKrakenUnderProperConditions");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_fitnessAppIsInstalled = objc_msgSend(v27, "applicationIsInstalled:", CFSTR("com.apple.Fitness"));

    }
    -[ACHAchievementsProfileExtension _registerApplicationNotifications](v10, "_registerApplicationNotifications");
    -[ACHAchievementsProfileExtension _registerFitnessAppsNotifications](v10, "_registerFitnessAppsNotifications");
    if (-[ACHAchievementsProfileExtension _shouldPerformFitnessMigration](v10, "_shouldPerformFitnessMigration"))
    {
      if (!-[ACHAchievementsProfileExtension performMigration](v10, "performMigration"))
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
          sub_2322D7CBC();
      }
    }
    v28 = objc_loadWeakRetained((id *)&v10->_profile);
    objc_msgSend(v28, "daemon");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "registerForDaemonReady:", v10);

  }
  return v10;
}

- (void)daemonReady:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  ACHLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2322D3000, v4, OS_LOG_TYPE_DEFAULT, "Plugin received daemonReady", v5, 2u);
  }

  if ((FIAreFitnessAppsRestricted() & 1) == 0)
    -[ACHAchievementsProfileExtension _activateActivityAchievements](self, "_activateActivityAchievements");
}

- (void)_activateActivityAchievements
{
  os_unfair_lock_s *p_accessLock;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  if (self->_templateStore)
  {
    os_unfair_lock_unlock(p_accessLock);
    ACHLogDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2322D3000, v4, OS_LOG_TYPE_DEFAULT, "Not activating Fitness submanagers because they're already running.", buf, 2u);
    }

  }
  else
  {
    ACHLogDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2322D3000, v5, OS_LOG_TYPE_DEFAULT, "Activating Fitness called...", v8, 2u);
    }

    -[ACHAchievementsProfileExtension profile](self, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addProtectedDataObserver:", self);

    os_unfair_lock_unlock(p_accessLock);
    -[ACHAchievementsProfileExtension _removeAllAchievementsIfNeeded](self, "_removeAllAchievementsIfNeeded");
    -[ACHAchievementsProfileExtension _loadInitialMoveGoal](self, "_loadInitialMoveGoal");
  }
}

- (void)_deactivateActivityAchievements
{
  os_unfair_lock_s *p_accessLock;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  if (self->_templateStore)
  {
    ACHLogDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2322D3000, v4, OS_LOG_TYPE_DEFAULT, "Deactivating Fitness submanagers...", v8, 2u);
    }

    -[ACHAchievementsProfileExtension profile](self, "profile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeProtectedDataObserver:", self);

    os_unfair_lock_unlock(p_accessLock);
    -[ACHAchievementsProfileExtension _restrainTheKraken](self, "_restrainTheKraken");
  }
  else
  {
    os_unfair_lock_unlock(p_accessLock);
    ACHLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2322D3000, v7, OS_LOG_TYPE_DEFAULT, "Achievements already deactivated.", buf, 2u);
    }

  }
}

- (void)_handleFitnessAppsRestricted:(id)a3
{
  MEMORY[0x24BEDD108](self, sel__deactivateActivityAchievements);
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  NSObject *v5;
  uint8_t v6[16];

  if (a4)
  {
    ACHLogDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2322D3000, v5, OS_LOG_TYPE_DEFAULT, "Plugin received protected data available", v6, 2u);
    }

    -[ACHAchievementsProfileExtension _loadInitialMoveGoal](self, "_loadInitialMoveGoal");
  }
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  ACHLogDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2322D3000, v5, OS_LOG_TYPE_DEFAULT, "Plugin received move goal samples", buf, 2u);
  }

  -[ACHAchievementsProfileExtension _checkForMoveGoal](self, "_checkForMoveGoal");
  if (self->_unitTesting || self->_initialMoveGoalHasBeenSet)
  {
    ACHLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_2322D3000, v6, OS_LOG_TYPE_DEFAULT, "User has added a goal, stopping observing samples, and unleashing the Kraken!", v13, 2u);
    }

    -[ACHAchievementsProfileExtension profile](self, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD3DC0], "calorieGoal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:forDataType:", self, v9);

    -[ACHAchievementsProfileExtension profile](self, "profile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD3DC0], "moveMinuteGoal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObserver:forDataType:", self, v12);

    os_unfair_lock_lock(&self->_accessLock);
    -[ACHAchievementsProfileExtension _unleashTheKrakenUnderProperConditions](self, "_unleashTheKrakenUnderProperConditions");
    os_unfair_lock_unlock(&self->_accessLock);
  }
}

- (void)_checkForMoveGoal
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint8_t v28[16];
  id v29;
  id v30;

  HDQuantitySampleEntityPredicateForQuantity();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE40B90];
  objc_msgSend(MEMORY[0x24BDD3DC0], "calorieGoal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievementsProfileExtension profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v7 = objc_msgSend(v4, "countOfSamplesWithType:profile:matchingPredicate:withError:", v5, v6, v3, &v30);
  v8 = v30;

  v9 = (void *)MEMORY[0x24BE40B90];
  objc_msgSend(MEMORY[0x24BDD3DC0], "moveMinuteGoal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievementsProfileExtension profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v12 = objc_msgSend(v9, "countOfSamplesWithType:profile:matchingPredicate:withError:", v10, v11, v3, &v29);
  v13 = v29;

  if (v8)
  {
    ACHLogDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_2322D7D58((uint64_t)v8, v14, v15, v16, v17, v18, v19, v20);
LABEL_7:

    goto LABEL_8;
  }
  if (v13)
  {
    ACHLogDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_2322D7CF4((uint64_t)v13, v14, v21, v22, v23, v24, v25, v26);
    goto LABEL_7;
  }
  -[ACHAchievementsProfileExtension setInitialMoveGoalFetchCompleted:](self, "setInitialMoveGoalFetchCompleted:", 1);
  ACHLogDefault();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_2322D3000, v27, OS_LOG_TYPE_DEFAULT, "Plugin move goal query completed", v28, 2u);
  }

  if (v7 + v12)
    -[ACHAchievementsProfileExtension setInitialMoveGoalHasBeenSet:](self, "setInitialMoveGoalHasBeenSet:", 1);
LABEL_8:

}

- (void)_loadInitialMoveGoal
{
  os_unfair_lock_s *p_accessLock;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  if (!-[ACHAchievementsProfileExtension initialMoveGoalFetchCompleted](self, "initialMoveGoalFetchCompleted"))
  {
    -[ACHAchievementsProfileExtension _checkForMoveGoal](self, "_checkForMoveGoal");
    if (!-[ACHAchievementsProfileExtension initialMoveGoalHasBeenSet](self, "initialMoveGoalHasBeenSet"))
    {
      ACHLogDefault();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_2322D3000, v4, OS_LOG_TYPE_DEFAULT, "User does *not* have a goal set, starting to observe for one", v12, 2u);
      }

      -[ACHAchievementsProfileExtension profile](self, "profile");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dataManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD3DC0], "calorieGoal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:forDataType:", self, v7);

      -[ACHAchievementsProfileExtension profile](self, "profile");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dataManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD3DC0], "moveMinuteGoal");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:forDataType:", self, v10);

    }
  }
  if (-[ACHAchievementsProfileExtension krakenUnleashed](self, "krakenUnleashed"))
  {
    ACHLogDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_2322D7DBC();

  }
  else
  {
    -[ACHAchievementsProfileExtension _unleashTheKrakenUnderProperConditions](self, "_unleashTheKrakenUnderProperConditions");
  }
  os_unfair_lock_unlock(p_accessLock);
}

- (void)_registerFitnessAppsNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleFitnessAppsAllowed_, *MEMORY[0x24BE408B0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleFitnessAppsRestricted_, *MEMORY[0x24BE408B8], 0);

}

- (void)_registerApplicationNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__applicationsInstalled_, *MEMORY[0x24BE40898], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__applicationsUninstalled_, *MEMORY[0x24BE408A8], 0);

}

- (void)_applicationsInstalled:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE40890]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("com.apple.Fitness"));

  if (v6)
  {
    ACHLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2322D3000, v7, OS_LOG_TYPE_DEFAULT, "The Activity app has been installed.", v8, 2u);
    }

    os_unfair_lock_lock(&self->_accessLock);
    -[ACHAchievementsProfileExtension setFitnessAppIsInstalled:](self, "setFitnessAppIsInstalled:", 1);
    -[ACHAchievementsProfileExtension _unleashTheKrakenUnderProperConditions](self, "_unleashTheKrakenUnderProperConditions");
    os_unfair_lock_unlock(&self->_accessLock);
  }
}

- (void)_applicationsUninstalled:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE408A0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("com.apple.Fitness"));

  if (v6)
  {
    ACHLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2322D3000, v7, OS_LOG_TYPE_DEFAULT, "The Activity app has been uninstalled", v8, 2u);
    }

    os_unfair_lock_lock(&self->_accessLock);
    -[ACHAchievementsProfileExtension setFitnessAppIsInstalled:](self, "setFitnessAppIsInstalled:", 0);
    os_unfair_lock_unlock(&self->_accessLock);
    -[ACHAchievementsProfileExtension _removeAllAchievementsIfNeeded](self, "_removeAllAchievementsIfNeeded");
  }
}

- (void)_removeAllAchievementsIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  if (!-[ACHAchievementsProfileExtension fitnessAppIsInstalled](self, "fitnessAppIsInstalled")
    && !-[ACHAchievementsProfileExtension isWatch](self, "isWatch"))
  {
    v3 = (void *)MEMORY[0x24BE01A38];
    -[ACHAchievementsProfileExtension profile](self, "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    LOBYTE(v3) = objc_msgSend(v3, "removeAllEarnedInstancesWithProfile:error:", v4, &v13);
    v5 = v13;

    if ((v3 & 1) == 0)
    {
      ACHLogDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_2322D7DE8((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

    }
  }
}

- (void)_unleashTheKrakenUnderProperConditions
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  uint64_t v6;
  __int16 v7;

  if (-[ACHAchievementsProfileExtension unitTesting](self, "unitTesting"))
    goto LABEL_13;
  if (!-[ACHAchievementsProfileExtension isWatch](self, "isWatch")
    && -[ACHAchievementsProfileExtension fitnessAppIsInstalled](self, "fitnessAppIsInstalled")
    && -[ACHAchievementsProfileExtension initialMoveGoalHasBeenSet](self, "initialMoveGoalHasBeenSet"))
  {
    ACHLogDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 0;
      v4 = "iPhone: user has goal set and app is installed";
      v5 = (uint8_t *)&v7;
LABEL_11:
      _os_log_impl(&dword_2322D3000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (-[ACHAchievementsProfileExtension isWatch](self, "isWatch")
    && -[ACHAchievementsProfileExtension initialMoveGoalHasBeenSet](self, "initialMoveGoalHasBeenSet"))
  {
    ACHLogDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      v4 = "Watch: user has goal set";
      v5 = (uint8_t *)&v6;
      goto LABEL_11;
    }
LABEL_12:

LABEL_13:
    -[ACHAchievementsProfileExtension _unleashTheKraken](self, "_unleashTheKraken", v6);
  }
}

- (void)_unleashTheKraken
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[5];
  char v6;
  uint8_t buf[16];

  if (!-[ACHAchievementsProfileExtension krakenUnleashed](self, "krakenUnleashed"))
  {
    ACHLogDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2322D3000, v3, OS_LOG_TYPE_DEFAULT, "Plugin unleashing the Kraken!", buf, 2u);
    }

    if (-[ACHAchievementsProfileExtension isWatch](self, "isWatch"))
      v4 = 1;
    else
      v4 = 2;
    -[ACHAchievementsProfileExtension _setupStoresForDeviceIfNecesseary:](self, "_setupStoresForDeviceIfNecesseary:", v4);
    if (-[ACHAchievementsProfileExtension unitTesting](self, "unitTesting"))
    {
      -[ACHAchievementsProfileExtension endPhaseRegistration](self, "endPhaseRegistration");
    }
    else
    {
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_2322D5B08;
      v5[3] = &unk_25011ACD8;
      v5[4] = self;
      v6 = v4;
      -[ACHAchievementsProfileExtension tryInitialAchievementLoadWithCompletionHandler:](self, "tryInitialAchievementLoadWithCompletionHandler:", v5);
    }
  }
}

- (void)_setupStoresForDeviceIfNecesseary:(unsigned __int8)a3
{
  uint64_t v3;
  _BOOL4 storesHaveBeenSet;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  id WeakRetained;
  ACHTemplateEntityWrapper *v10;
  ACHTemplateEntityWrapper *templateEntityWrapper;
  id v12;
  id v13;
  ACHTemplateStore *v14;
  ACHTemplateStore *templateStore;
  id v16;
  id v17;
  ACHEarnedInstanceEntityWrapper *v18;
  ACHEarnedInstanceEntityWrapper *earnedInstanceEntityWrapper;
  id v20;
  id v21;
  ACHEarnedInstanceStore *v22;
  ACHEarnedInstanceStore *earnedInstanceStore;
  ACHTemplateAssetRegistry *v24;
  ACHTemplateAssetRegistry *templateAssetRegistry;
  ACHAchievementProgressEngine *v26;
  ACHAchievementProgressEngine *progressProvider;
  ACHAchievementStoring *v28;
  ACHAchievementStoring *achievementStore;
  NSObject *v30;
  uint8_t v31[16];
  uint8_t v32[16];
  uint8_t buf[16];

  v3 = a3;
  storesHaveBeenSet = self->_storesHaveBeenSet;
  ACHLogDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (storesHaveBeenSet)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2322D3000, v6, OS_LOG_TYPE_DEFAULT, "Plugin stores are already set up, skipping", buf, 2u);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_2322D3000, v6, OS_LOG_TYPE_DEFAULT, "Plugin setting up stores!", v32, 2u);
    }

    v8 = objc_alloc(MEMORY[0x24BE01AD0]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v10 = (ACHTemplateEntityWrapper *)objc_msgSend(v8, "initWithProfile:", WeakRetained);
    templateEntityWrapper = self->_templateEntityWrapper;
    self->_templateEntityWrapper = v10;

    v12 = objc_alloc(MEMORY[0x24BE01AE0]);
    v13 = objc_loadWeakRetained((id *)&self->_profile);
    v14 = (ACHTemplateStore *)objc_msgSend(v12, "initWithProfile:entityWrapper:device:", v13, self->_templateEntityWrapper, v3);
    templateStore = self->_templateStore;
    self->_templateStore = v14;

    v16 = objc_alloc(MEMORY[0x24BE01A40]);
    v17 = objc_loadWeakRetained((id *)&self->_profile);
    v18 = (ACHEarnedInstanceEntityWrapper *)objc_msgSend(v16, "initWithProfile:", v17);
    earnedInstanceEntityWrapper = self->_earnedInstanceEntityWrapper;
    self->_earnedInstanceEntityWrapper = v18;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE01A30]), "initWithTemplateStore:", self->_templateStore);
    v20 = objc_alloc(MEMORY[0x24BE01A48]);
    v21 = objc_loadWeakRetained((id *)&self->_profile);
    v22 = (ACHEarnedInstanceStore *)objc_msgSend(v20, "initWithProfile:earnedInstanceEntityWrapper:earnedInstanceDuplicateUtility:device:", v21, self->_earnedInstanceEntityWrapper, v6, v3);
    earnedInstanceStore = self->_earnedInstanceStore;
    self->_earnedInstanceStore = v22;

    objc_msgSend(MEMORY[0x24BE019D8], "setEarnedInstanceStore:", self->_earnedInstanceStore);
    v24 = (ACHTemplateAssetRegistry *)objc_msgSend(objc_alloc(MEMORY[0x24BE01AC0]), "initWithRemoteTemplateAvailabilityKeyProvider:", self->_remoteTemplateAvailabilityKeyProvider);
    templateAssetRegistry = self->_templateAssetRegistry;
    self->_templateAssetRegistry = v24;

    v26 = (ACHAchievementProgressEngine *)objc_alloc_init(MEMORY[0x24BE01990]);
    progressProvider = self->_progressProvider;
    self->_progressProvider = v26;

    v28 = (ACHAchievementStoring *)objc_msgSend(objc_alloc(MEMORY[0x24BE01A58]), "initWithTemplateStore:earnedInstanceStore:templateAssetRegistry:progressProvider:", self->_templateStore, self->_earnedInstanceStore, self->_templateAssetRegistry, self->_progressProvider);
    achievementStore = self->_achievementStore;
    self->_achievementStore = v28;

    self->_storesHaveBeenSet = 1;
    ACHLogDefault();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_2322D3000, v30, OS_LOG_TYPE_DEFAULT, "Plugin stores set", v31, 2u);
    }

  }
}

- (void)_finishingUnleashingTheKrakenForDevice:(unsigned __int8)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_accessLock;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id WeakRetained;
  ACHTemplateSourceScheduler *v10;
  ACHTemplateSourceScheduler *templateSourceScheduler;
  ACHBuiltinTemplateSource *v12;
  ACHBuiltinTemplateSource *builtInTemplateSource;
  ACHPerfectMonthTemplateSource *v14;
  ACHPerfectMonthTemplateSource *perfectMonthTemplateSource;
  id v16;
  id v17;
  ACHActivitySummaryUtility *v18;
  ACHActivitySummaryUtility *activitySummaryUtility;
  id v20;
  id v21;
  ACHWorkoutUtility *v22;
  ACHWorkoutUtility *workoutUtility;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  ACHMonthlyChallengeTemplateSource *v33;
  ACHMonthlyChallengeTemplateSource *monthlyChallengeTemplateSource;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  ACHRemoteTemplateAvailabilityListener *v42;
  ACHRemoteTemplateAvailabilityListener *remoteTemplateAvailabilityListener;
  ACHRemoteTemplateSource *v44;
  ACHRemoteTemplateSource *remoteTemplateSource;
  NSObject *v46;
  id v47;
  id v48;
  ACHBackCompatMonthlyChallengeListener *v49;
  ACHBackCompatMonthlyChallengeListener *backCompatMonthlyChallengeListener;
  id v51;
  id v52;
  ACHDataStore *v53;
  ACHDataStore *dataStore;
  int v55;
  id v56;
  id v57;
  ACHDataStore *v58;
  ACHEarnedInstanceStore *earnedInstanceStore;
  ACHEarnedInstanceAwardingEngine *v60;
  ACHEarnedInstanceAwardingEngine *awardingEngine;
  id v62;
  id v63;
  ACHActivityAwardingSource *v64;
  ACHActivityAwardingSource *activityAwardingSource;
  id v66;
  id v67;
  ACHWorkoutAwardingSource *v68;
  ACHWorkoutAwardingSource *workoutAwardingSource;
  id v70;
  id v71;
  ACHMonthlyChallengeAwardingSource *v72;
  ACHMonthlyChallengeAwardingSource *monthlyChallengeAwardingSource;
  id v74;
  id v75;
  ACHAwardingScheduler *v76;
  ACHAwardingScheduler *awardingScheduler;
  id v78;
  id v79;
  ACHAwardingScheduler *v80;
  id v81;
  ACHAwardingScheduler *v82;
  id v83;
  id v84;
  ACHAWDSubmissionManager *v85;
  ACHAWDSubmissionManager *submissionManager;
  void *v87;
  __int128 v88;
  __int128 v89;
  uint8_t buf[16];
  __int128 v91;

  v3 = a3;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  ACHLogDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2322D3000, v6, OS_LOG_TYPE_DEFAULT, "Finish unleashing the Kraken", buf, 2u);
  }

  if (!-[ACHAchievementsProfileExtension krakenUnleashed](self, "krakenUnleashed"))
  {
    v8 = objc_alloc(MEMORY[0x24BE01AD8]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v10 = (ACHTemplateSourceScheduler *)objc_msgSend(v8, "initWithProfile:templateStore:achievementStore:", WeakRetained, self->_templateStore, self->_achievementStore);
    templateSourceScheduler = self->_templateSourceScheduler;
    self->_templateSourceScheduler = v10;

    v12 = (ACHBuiltinTemplateSource *)objc_alloc_init(MEMORY[0x24BE019F0]);
    builtInTemplateSource = self->_builtInTemplateSource;
    self->_builtInTemplateSource = v12;

    -[ACHAchievementsProfileExtension _registerTemplateSource:](self, "_registerTemplateSource:", self->_builtInTemplateSource);
    v14 = (ACHPerfectMonthTemplateSource *)objc_alloc_init(MEMORY[0x24BE01A88]);
    perfectMonthTemplateSource = self->_perfectMonthTemplateSource;
    self->_perfectMonthTemplateSource = v14;

    -[ACHAchievementsProfileExtension _registerTemplateSource:](self, "_registerTemplateSource:", self->_perfectMonthTemplateSource);
    v16 = objc_alloc(MEMORY[0x24BE019B0]);
    v17 = objc_loadWeakRetained((id *)&self->_profile);
    v18 = (ACHActivitySummaryUtility *)objc_msgSend(v16, "initWithProfile:shouldIncludePrivateProperties:", v17, 1);
    activitySummaryUtility = self->_activitySummaryUtility;
    self->_activitySummaryUtility = v18;

    v20 = objc_alloc(MEMORY[0x24BE01AF8]);
    v21 = objc_loadWeakRetained((id *)&self->_profile);
    v22 = (ACHWorkoutUtility *)objc_msgSend(v20, "initWithProfile:", v21);
    workoutUtility = self->_workoutUtility;
    self->_workoutUtility = v22;

    v24 = objc_alloc(MEMORY[0x24BE01A70]);
    v25 = objc_loadWeakRetained((id *)&self->_profile);
    v26 = (void *)objc_msgSend(v24, "initWithProfile:activitySummaryUtility:workoutUtility:", v25, self->_activitySummaryUtility, self->_workoutUtility);

    v27 = objc_alloc(MEMORY[0x24BE01A78]);
    v28 = objc_loadWeakRetained((id *)&self->_profile);
    v29 = objc_msgSend(v27, "initWithProfile:achievementStore:activitySummaryUtility:", v28, self->_achievementStore, self->_activitySummaryUtility);

    v30 = objc_alloc(MEMORY[0x24BE01AB8]);
    v31 = objc_loadWeakRetained((id *)&self->_profile);
    v32 = (void *)objc_msgSend(v30, "initWithProfile:", v31);

    v87 = (void *)v29;
    v33 = (ACHMonthlyChallengeTemplateSource *)objc_msgSend(objc_alloc(MEMORY[0x24BE01A80]), "initWithDataSource:dataProvider:templateCache:", v26, v29, v32);
    monthlyChallengeTemplateSource = self->_monthlyChallengeTemplateSource;
    self->_monthlyChallengeTemplateSource = v33;

    -[ACHAchievementsProfileExtension _registerTemplateSource:](self, "_registerTemplateSource:", self->_monthlyChallengeTemplateSource);
    v35 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v35, "daemon");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "behavior");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = objc_msgSend(v37, "isAppleWatch");

    v38 = objc_alloc(MEMORY[0x24BE019E8]);
    v39 = objc_loadWeakRetained((id *)&self->_profile);
    if ((_DWORD)v29)
      v40 = 1;
    else
      v40 = 2;
    v41 = (void *)objc_msgSend(v38, "initWithProfile:creatorDevice:", v39, v40);

    v42 = (ACHRemoteTemplateAvailabilityListener *)objc_alloc_init(MEMORY[0x24BE01AA0]);
    remoteTemplateAvailabilityListener = self->_remoteTemplateAvailabilityListener;
    self->_remoteTemplateAvailabilityListener = v42;

    v44 = (ACHRemoteTemplateSource *)objc_msgSend(objc_alloc(MEMORY[0x24BE01AA8]), "initWithMobileAssetProvider:backCompatWriter:remoteTemplateAvailabilityKeyProvider:", self->_mobileAssetProvider, v41, self->_remoteTemplateAvailabilityKeyProvider);
    remoteTemplateSource = self->_remoteTemplateSource;
    self->_remoteTemplateSource = v44;

    -[ACHAchievementsProfileExtension _registerTemplateSource:](self, "_registerTemplateSource:", self->_remoteTemplateSource);
    ACHLogDefault();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2322D3000, v46, OS_LOG_TYPE_DEFAULT, "Plugin registered template sources", buf, 2u);
    }

    v47 = objc_alloc(MEMORY[0x24BE019E0]);
    v48 = objc_loadWeakRetained((id *)&self->_profile);
    v49 = (ACHBackCompatMonthlyChallengeListener *)objc_msgSend(v47, "initWithProfile:templateStore:", v48, self->_templateStore);
    backCompatMonthlyChallengeListener = self->_backCompatMonthlyChallengeListener;
    self->_backCompatMonthlyChallengeListener = v49;

    v51 = objc_alloc(MEMORY[0x24BE01A08]);
    v52 = objc_loadWeakRetained((id *)&self->_profile);
    v53 = (ACHDataStore *)objc_msgSend(v51, "initWithProfile:", v52);
    dataStore = self->_dataStore;
    self->_dataStore = v53;

    *(_OWORD *)buf = 0u;
    v91 = 0u;
    ACHCompanionHistoricalEvaluationPolicy();
    if (-[ACHAchievementsProfileExtension isWatch](self, "isWatch")
      && FIIsActivePairedDeviceSatellitePaired())
    {
      ACHTinkerHistoricalEvaluationPolicy();
      *(_OWORD *)buf = v88;
      v91 = v89;
      v55 = 1;
    }
    else if (-[ACHAchievementsProfileExtension isWatch](self, "isWatch"))
    {
      ACHGizmoHistoricalEvaluationPolicy();
      v55 = 0;
      *(_OWORD *)buf = v88;
      v91 = v89;
    }
    else
    {
      v55 = 0;
    }
    v56 = objc_alloc(MEMORY[0x24BE01A28]);
    v57 = objc_loadWeakRetained((id *)&self->_profile);
    v58 = self->_dataStore;
    earnedInstanceStore = self->_earnedInstanceStore;
    v88 = *(_OWORD *)buf;
    v89 = v91;
    v60 = (ACHEarnedInstanceAwardingEngine *)objc_msgSend(v56, "initWithProfile:dataStore:earnedInstanceStore:historicalEvaluationPolicy:", v57, v58, earnedInstanceStore, &v88);
    awardingEngine = self->_awardingEngine;
    self->_awardingEngine = v60;

    v62 = objc_alloc(MEMORY[0x24BE019A0]);
    v63 = objc_loadWeakRetained((id *)&self->_profile);
    v64 = (ACHActivityAwardingSource *)objc_msgSend(v62, "initWithProfile:dataStore:templateStore:awardingEngine:progressEngine:", v63, self->_dataStore, self->_templateStore, self->_awardingEngine, self->_progressProvider);
    activityAwardingSource = self->_activityAwardingSource;
    self->_activityAwardingSource = v64;

    -[ACHAchievementsProfileExtension _registerAwardingSource:](self, "_registerAwardingSource:", self->_activityAwardingSource);
    v66 = objc_alloc(MEMORY[0x24BE01AF0]);
    v67 = objc_loadWeakRetained((id *)&self->_profile);
    v68 = (ACHWorkoutAwardingSource *)objc_msgSend(v66, "initWithProfile:awardingEngine:dataStore:templateStore:creatorDevice:progressEngine:workoutUtility:", v67, self->_awardingEngine, self->_dataStore, self->_templateStore, v3, self->_progressProvider, self->_workoutUtility);
    workoutAwardingSource = self->_workoutAwardingSource;
    self->_workoutAwardingSource = v68;

    -[ACHAchievementsProfileExtension _registerAwardingSource:](self, "_registerAwardingSource:", self->_workoutAwardingSource);
    v70 = objc_alloc(MEMORY[0x24BE01A68]);
    v71 = objc_loadWeakRetained((id *)&self->_profile);
    v72 = (ACHMonthlyChallengeAwardingSource *)objc_msgSend(v70, "initWithProfile:awardingEngine:templateStore:earnedInstanceStore:monthlyDataSource:creatorDevice:progressEngine:", v71, self->_awardingEngine, self->_templateStore, self->_earnedInstanceStore, v26, v3, self->_progressProvider);
    monthlyChallengeAwardingSource = self->_monthlyChallengeAwardingSource;
    self->_monthlyChallengeAwardingSource = v72;

    -[ACHAchievementsProfileExtension _registerAwardingSource:](self, "_registerAwardingSource:", self->_monthlyChallengeAwardingSource);
    if (v55)
    {
      v74 = objc_alloc(MEMORY[0x24BE01AE8]);
      v75 = objc_loadWeakRetained((id *)&self->_profile);
      v76 = (ACHAwardingScheduler *)objc_msgSend(v74, "initWithProfile:dataStore:earnedInstanceStore:templateStore:awardingEngine:", v75, self->_dataStore, self->_earnedInstanceStore, self->_templateStore, self->_awardingEngine);
      awardingScheduler = self->_awardingScheduler;
      self->_awardingScheduler = v76;

      -[ACHAchievementsProfileExtension isWatch](self, "isWatch");
    }
    else
    {
      if (-[ACHAchievementsProfileExtension isWatch](self, "isWatch"))
      {
        v78 = objc_alloc(MEMORY[0x24BE01A50]);
        v79 = objc_loadWeakRetained((id *)&self->_profile);
        v80 = (ACHAwardingScheduler *)objc_msgSend(v78, "initWithProfile:dataStore:awardingEngine:", v79, self->_dataStore, self->_awardingEngine);
      }
      else
      {
        v81 = objc_alloc(MEMORY[0x24BE019F8]);
        v79 = objc_loadWeakRetained((id *)&self->_profile);
        v80 = (ACHAwardingScheduler *)objc_msgSend(v81, "initWithProfile:dataStore:earnedInstanceStore:templateStore:awardingEngine:", v79, self->_dataStore, self->_earnedInstanceStore, self->_templateStore, self->_awardingEngine);
      }
      v82 = self->_awardingScheduler;
      self->_awardingScheduler = v80;

      if (-[ACHAchievementsProfileExtension isWatch](self, "isWatch"))
        goto LABEL_25;
    }
    v83 = objc_alloc(MEMORY[0x24BE01988]);
    v84 = objc_loadWeakRetained((id *)&self->_profile);
    v85 = (ACHAWDSubmissionManager *)objc_msgSend(v83, "initWithProfile:earnedInstanceStore:", v84, self->_earnedInstanceStore);
    submissionManager = self->_submissionManager;
    self->_submissionManager = v85;

LABEL_25:
    -[ACHAchievementsProfileExtension endPhaseRegistration](self, "endPhaseRegistration");
    os_unfair_lock_unlock(p_accessLock);

    return;
  }
  ACHLogDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2322D3000, v7, OS_LOG_TYPE_DEFAULT, "Kraken already fully unleahsed, skipping", buf, 2u);
  }

  os_unfair_lock_unlock(p_accessLock);
}

- (void)_restrainTheKraken
{
  os_unfair_lock_s *p_accessLock;
  NSObject *v4;
  ACHTemplateEntityWrapper *templateEntityWrapper;
  ACHTemplateStore *templateStore;
  ACHEarnedInstanceEntityWrapper *earnedInstanceEntityWrapper;
  ACHEarnedInstanceStore *earnedInstanceStore;
  ACHTemplateAssetRegistry *templateAssetRegistry;
  ACHAchievementProgressEngine *progressProvider;
  ACHAchievementStoring *achievementStore;
  ACHMobileAssetProvider *mobileAssetProvider;
  ACHTemplateSourceScheduler *templateSourceScheduler;
  ACHBuiltinTemplateSource *builtInTemplateSource;
  ACHPerfectMonthTemplateSource *perfectMonthTemplateSource;
  ACHActivitySummaryUtility *activitySummaryUtility;
  ACHWorkoutUtility *workoutUtility;
  ACHMonthlyChallengeTemplateSource *monthlyChallengeTemplateSource;
  ACHRemoteTemplateSource *remoteTemplateSource;
  ACHBackCompatMonthlyChallengeListener *backCompatMonthlyChallengeListener;
  ACHDataStore *dataStore;
  ACHEarnedInstanceAwardingEngine *awardingEngine;
  ACHActivityAwardingSource *activityAwardingSource;
  ACHWorkoutAwardingSource *workoutAwardingSource;
  ACHMonthlyChallengeAwardingSource *monthlyChallengeAwardingSource;
  ACHAwardingScheduler *awardingScheduler;
  ACHAWDSubmissionManager *submissionManager;
  HDXPCListener *listener;
  uint8_t v29[16];

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  if (-[ACHAchievementsProfileExtension krakenUnleashed](self, "krakenUnleashed"))
  {
    ACHLogDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_2322D3000, v4, OS_LOG_TYPE_DEFAULT, "Plugin restrain the Kraken!", v29, 2u);
    }

    templateEntityWrapper = self->_templateEntityWrapper;
    self->_templateEntityWrapper = 0;

    templateStore = self->_templateStore;
    self->_templateStore = 0;

    earnedInstanceEntityWrapper = self->_earnedInstanceEntityWrapper;
    self->_earnedInstanceEntityWrapper = 0;

    earnedInstanceStore = self->_earnedInstanceStore;
    self->_earnedInstanceStore = 0;

    templateAssetRegistry = self->_templateAssetRegistry;
    self->_templateAssetRegistry = 0;

    progressProvider = self->_progressProvider;
    self->_progressProvider = 0;

    achievementStore = self->_achievementStore;
    self->_achievementStore = 0;

    self->_storesHaveBeenSet = 0;
    mobileAssetProvider = self->_mobileAssetProvider;
    self->_mobileAssetProvider = 0;

    templateSourceScheduler = self->_templateSourceScheduler;
    self->_templateSourceScheduler = 0;

    builtInTemplateSource = self->_builtInTemplateSource;
    self->_builtInTemplateSource = 0;

    perfectMonthTemplateSource = self->_perfectMonthTemplateSource;
    self->_perfectMonthTemplateSource = 0;

    activitySummaryUtility = self->_activitySummaryUtility;
    self->_activitySummaryUtility = 0;

    workoutUtility = self->_workoutUtility;
    self->_workoutUtility = 0;

    monthlyChallengeTemplateSource = self->_monthlyChallengeTemplateSource;
    self->_monthlyChallengeTemplateSource = 0;

    -[ACHAchievementsProfileExtension _deregisterTemplateSource:](self, "_deregisterTemplateSource:", self->_remoteTemplateSource);
    remoteTemplateSource = self->_remoteTemplateSource;
    self->_remoteTemplateSource = 0;

    backCompatMonthlyChallengeListener = self->_backCompatMonthlyChallengeListener;
    self->_backCompatMonthlyChallengeListener = 0;

    dataStore = self->_dataStore;
    self->_dataStore = 0;

    awardingEngine = self->_awardingEngine;
    self->_awardingEngine = 0;

    activityAwardingSource = self->_activityAwardingSource;
    self->_activityAwardingSource = 0;

    workoutAwardingSource = self->_workoutAwardingSource;
    self->_workoutAwardingSource = 0;

    -[ACHAchievementsProfileExtension _deregisterAwardingSource:](self, "_deregisterAwardingSource:", self->_monthlyChallengeAwardingSource);
    monthlyChallengeAwardingSource = self->_monthlyChallengeAwardingSource;
    self->_monthlyChallengeAwardingSource = 0;

    awardingScheduler = self->_awardingScheduler;
    self->_awardingScheduler = 0;

    submissionManager = self->_submissionManager;
    self->_submissionManager = 0;

    listener = self->_listener;
    self->_listener = 0;

    self->_krakenUnleashed = 0;
    os_unfair_lock_unlock(p_accessLock);
  }
  else
  {
    os_unfair_lock_unlock(p_accessLock);
  }
}

- (void)tryInitialAchievementLoadWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(9, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_2322D6850;
  v7[3] = &unk_25011AD00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)endPhaseRegistration
{
  id v3;
  objc_class *v4;
  void *v5;
  HDXPCListener *v6;
  HDXPCListener *listener;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSSet *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *clientQueue;
  NSSet *v32;
  NSSet *blocksWaitingOnInitialization;
  _QWORD v34[6];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint8_t v49[128];
  uint8_t buf[4];
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE40E58]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (HDXPCListener *)objc_msgSend(v3, "initWithLabel:", v5);
  listener = self->_listener;
  self->_listener = v6;

  -[HDXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[HDXPCListener resume](self->_listener, "resume");
  ACHLogDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[ACHAchievementsProfileExtension templatesSourcesToRegister](self, "templatesSourcesToRegister");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v51 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_2322D3000, v8, OS_LOG_TYPE_DEFAULT, "Registering %lu pending template sources", buf, 0xCu);

  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[ACHAchievementsProfileExtension templatesSourcesToRegister](self, "templatesSourcesToRegister");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v44;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(v10);
        -[ACHAchievementsProfileExtension _registerTemplateSource:](self, "_registerTemplateSource:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v12);
  }

  -[ACHAchievementsProfileExtension setTemplatesSourcesToRegister:](self, "setTemplatesSourcesToRegister:", 0);
  ACHLogDefault();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[ACHAchievementsProfileExtension awardingSourcesToRegister](self, "awardingSourcesToRegister");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    *(_DWORD *)buf = 134217984;
    v51 = v17;
    _os_log_impl(&dword_2322D3000, v15, OS_LOG_TYPE_DEFAULT, "Registering %lu pending awarding sources", buf, 0xCu);

  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[ACHAchievementsProfileExtension awardingSourcesToRegister](self, "awardingSourcesToRegister");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v40;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v40 != v21)
          objc_enumerationMutation(v18);
        -[ACHAchievementsProfileExtension _registerAwardingSource:](self, "_registerAwardingSource:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v22++));
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v20);
  }

  -[ACHAchievementsProfileExtension setAwardingSourcesToRegister:](self, "setAwardingSourcesToRegister:", 0);
  -[ACHAchievementsProfileExtension setKrakenUnleashed:](self, "setKrakenUnleashed:", 1);
  ACHLogDefault();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2322D3000, v23, OS_LOG_TYPE_DEFAULT, "Kraken was unleashed!", buf, 2u);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v24 = self->_blocksWaitingOnInitialization;
  v25 = -[NSSet countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v36;
    v28 = MEMORY[0x24BDAC760];
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(v24);
        v30 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v29);
        clientQueue = self->_clientQueue;
        v34[0] = v28;
        v34[1] = 3221225472;
        v34[2] = sub_2322D6CE0;
        v34[3] = &unk_25011AD28;
        v34[4] = self;
        v34[5] = v30;
        dispatch_async(clientQueue, v34);
        ++v29;
      }
      while (v26 != v29);
      v26 = -[NSSet countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v26);
  }

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v32 = (NSSet *)objc_claimAutoreleasedReturnValue();
  blocksWaitingOnInitialization = self->_blocksWaitingOnInitialization;
  self->_blocksWaitingOnInitialization = v32;

}

- (id)listenerEndpointForClient:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[ACHAchievementsProfileExtension listener](self, "listener", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = (void *)MEMORY[0x24BE01AB0];
  v8 = a4;
  -[ACHAchievementsProfileExtension templateStore](self, "templateStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievementsProfileExtension earnedInstanceStore](self, "earnedInstanceStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievementsProfileExtension awardingScheduler](self, "awardingScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievementsProfileExtension achievementStore](self, "achievementStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievementsProfileExtension mobileAssetProvider](self, "mobileAssetProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievementsProfileExtension templateSourceScheduler](self, "templateSourceScheduler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievementsProfileExtension monthlyChallengeTemplateSource](self, "monthlyChallengeTemplateSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverWithClient:templateStore:earnedInstanceStore:awardingScheduler:achievementStore:mobileAssetProvider:templateSourceScheduler:monthlyChallengeTemplateSource:error:", v8, v9, v10, v11, v12, v13, v14, v15, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)registerTemplateSource:(id)a3 awardingSource:(id)a4
{
  os_unfair_lock_s *p_accessLock;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  p_accessLock = &self->_accessLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_accessLock);
  if (-[ACHAchievementsProfileExtension krakenUnleashed](self, "krakenUnleashed"))
  {
    ACHLogDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2322D3000, v9, OS_LOG_TYPE_DEFAULT, "Client registered and the Kraken is unleashed, do it now!", buf, 2u);
    }

    -[ACHAchievementsProfileExtension _registerTemplateSource:](self, "_registerTemplateSource:", v8);
    -[ACHAchievementsProfileExtension _registerAwardingSource:](self, "_registerAwardingSource:", v7);
  }
  else
  {
    -[ACHAchievementsProfileExtension templatesSourcesToRegister](self, "templatesSourcesToRegister");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHAchievementsProfileExtension setTemplatesSourcesToRegister:](self, "setTemplatesSourcesToRegister:", v11);

    }
    -[ACHAchievementsProfileExtension awardingSourcesToRegister](self, "awardingSourcesToRegister");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHAchievementsProfileExtension setAwardingSourcesToRegister:](self, "setAwardingSourcesToRegister:", v13);

    }
    ACHLogDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_2322D3000, v14, OS_LOG_TYPE_DEFAULT, "Client tried to register, but the Kraken isn't unleashed. Saving to register.", v17, 2u);
    }

    -[ACHAchievementsProfileExtension templatesSourcesToRegister](self, "templatesSourcesToRegister");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v8);

    -[ACHAchievementsProfileExtension awardingSourcesToRegister](self, "awardingSourcesToRegister");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v7);

    v7 = v16;
  }

  os_unfair_lock_unlock(p_accessLock);
}

- (void)deregisterTemplateSource:(id)a3 awardingSource:(id)a4
{
  os_unfair_lock_s *p_accessLock;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_accessLock = &self->_accessLock;
  v7 = a4;
  os_unfair_lock_lock(&self->_accessLock);
  if (-[ACHAchievementsProfileExtension krakenUnleashed](self, "krakenUnleashed"))
  {
    -[ACHAchievementsProfileExtension _deregisterTemplateSource:](self, "_deregisterTemplateSource:", v10);
    -[ACHAchievementsProfileExtension _deregisterAwardingSource:](self, "_deregisterAwardingSource:", v7);
  }
  else
  {
    -[ACHAchievementsProfileExtension templatesSourcesToRegister](self, "templatesSourcesToRegister");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v10);

    -[ACHAchievementsProfileExtension awardingSourcesToRegister](self, "awardingSourcesToRegister");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v7);

    v7 = v9;
  }

  os_unfair_lock_unlock(p_accessLock);
}

- (void)requestImmediateUpdateForTemplateSource:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;
  void *v6;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  -[ACHAchievementsProfileExtension templateSourceScheduler](self, "templateSourceScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "runImmediatelyForTemplateSource:", v5);

  os_unfair_lock_unlock(p_accessLock);
}

- (void)requestIncrementalEvaluationForAwardingSource:(id)a3 evaluationBlock:(id)a4
{
  os_unfair_lock_s *p_accessLock;
  id v7;
  id v8;
  void *v9;

  p_accessLock = &self->_accessLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_accessLock);
  -[ACHAchievementsProfileExtension awardingEngine](self, "awardingEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestIncrementalEvaluationForSource:evaluationBlock:", v8, v7);

  os_unfair_lock_unlock(p_accessLock);
}

- (void)performBlockAfterInitialization:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *clientQueue;
  void *v9;
  NSSet *blocksWaitingOnInitialization;
  NSSet *v11;
  NSSet *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[16];

  v4 = a3;
  os_unfair_lock_lock(&self->_accessLock);
  v5 = -[ACHAchievementsProfileExtension krakenUnleashed](self, "krakenUnleashed");
  ACHLogDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2322D3000, v6, OS_LOG_TYPE_DEFAULT, "ProfileExtending Initialization: Kraken unleashed, performing block", buf, 2u);
    }

    clientQueue = self->_clientQueue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_2322D72F0;
    v13[3] = &unk_25011AD28;
    v13[4] = self;
    v14 = v4;
    dispatch_async(clientQueue, v13);
    v9 = v14;
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2322D3000, v6, OS_LOG_TYPE_DEFAULT, "ProfileExtending Initialization: Kraken not unleashed, adding block", buf, 2u);
    }

    blocksWaitingOnInitialization = self->_blocksWaitingOnInitialization;
    v9 = (void *)MEMORY[0x23490140C](v4);
    -[NSSet setByAddingObject:](blocksWaitingOnInitialization, "setByAddingObject:", v9);
    v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v12 = self->_blocksWaitingOnInitialization;
    self->_blocksWaitingOnInitialization = v11;

  }
  os_unfair_lock_unlock(&self->_accessLock);

}

- (void)_registerTemplateSource:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ACHAchievementsProfileExtension templateSourceScheduler](self, "templateSourceScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerTemplateSource:", v4);

  -[ACHAchievementsProfileExtension templateAssetRegistry](self, "templateAssetRegistry");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerTemplateSource:", v4);

}

- (void)_deregisterTemplateSource:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ACHAchievementsProfileExtension templateSourceScheduler](self, "templateSourceScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deregisterTemplateSource:", v4);

  -[ACHAchievementsProfileExtension templateAssetRegistry](self, "templateAssetRegistry");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deregisterTemplateSource:", v4);

}

- (void)_registerAwardingSource:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[ACHAchievementsProfileExtension awardingEngine](self, "awardingEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerSource:", v6);

  if (objc_msgSend(v6, "conformsToProtocol:", &unk_255FB7110))
  {
    -[ACHAchievementsProfileExtension progressProvider](self, "progressProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerProgressProvider:", v6);

  }
}

- (void)_deregisterAwardingSource:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[ACHAchievementsProfileExtension awardingEngine](self, "awardingEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterSource:", v6);

  if (objc_msgSend(v6, "conformsToProtocol:", &unk_255FB7110))
  {
    -[ACHAchievementsProfileExtension progressProvider](self, "progressProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deregisterProgressProvider:", v6);

  }
}

- (BOOL)performMigration
{
  NSObject *v3;
  _BOOL4 v4;
  uint8_t v6[16];

  _HKInitializeLogging();
  v3 = *MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2322D3000, v3, OS_LOG_TYPE_DEFAULT, "AchievementsPlugin: Performing Fitness migration", v6, 2u);
  }
  v4 = -[ACHAchievementsProfileExtension _updateActivityChallengeAssetsURL](self, "_updateActivityChallengeAssetsURL");
  if (v4)
    -[ACHAchievementsProfileExtension _saveFitnessMigrationBuildVersion](self, "_saveFitnessMigrationBuildVersion");
  return v4;
}

- (BOOL)_updateActivityChallengeAssetsURL
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v8;
  uint8_t buf[16];

  if ((objc_msgSend(MEMORY[0x24BDD4198], "isAppleInternalInstall") & 1) != 0)
  {
    if ((objc_msgSend(MEMORY[0x24BDD4198], "isDeviceSupported") & 1) != 0)
    {
      if (ACHIsActivityAchievementsAssetServerURLExplicitlySet())
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEBUG))
          sub_2322D7E4C();
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://mesu.apple.com/assets/"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_get_global_queue(21, 0);
        v4 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = sub_2322D76D0;
        block[3] = &unk_25011AD50;
        v8 = v3;
        v5 = v3;
        dispatch_async(v4, block);

      }
    }
    else
    {
      _HKInitializeLogging();
      v2 = *MEMORY[0x24BDD2FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2322D3000, v2, OS_LOG_TYPE_DEFAULT, "Device is not supported for Health data, skipping Activity Challenge Assets URL setting", buf, 2u);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEBUG))
      sub_2322D7E78();
  }
  return 1;
}

- (void)_saveFitnessMigrationBuildVersion
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ACHAchievementsProfileExtension _currentBuildVersion](self, "_currentBuildVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("kACHAchievementsPluginLastMigrationBuild"));

}

- (BOOL)_shouldPerformFitnessMigration
{
  void *v2;
  void *v3;
  void *v4;

  -[ACHAchievementsProfileExtension _currentBuildVersion](self, "_currentBuildVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("kACHAchievementsPluginLastMigrationBuild"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isEqualToString:", v2) ^ 1;
  return (char)v3;
}

- (id)_currentBuildVersion
{
  NSString *currentBuildVersion;
  void *v4;

  currentBuildVersion = self->_currentBuildVersion;
  if (!currentBuildVersion)
  {
    objc_msgSend(MEMORY[0x24BDD4198], "currentOSBuild");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHAchievementsProfileExtension setCurrentBuildVersion:](self, "setCurrentBuildVersion:", v4);

    currentBuildVersion = self->_currentBuildVersion;
  }
  return currentBuildVersion;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (HDXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (BOOL)initialMoveGoalFetchCompleted
{
  return self->_initialMoveGoalFetchCompleted;
}

- (void)setInitialMoveGoalFetchCompleted:(BOOL)a3
{
  self->_initialMoveGoalFetchCompleted = a3;
}

- (BOOL)initialMoveGoalHasBeenSet
{
  return self->_initialMoveGoalHasBeenSet;
}

- (void)setInitialMoveGoalHasBeenSet:(BOOL)a3
{
  self->_initialMoveGoalHasBeenSet = a3;
}

- (BOOL)storesHaveBeenSet
{
  return self->_storesHaveBeenSet;
}

- (void)setStoresHaveBeenSet:(BOOL)a3
{
  self->_storesHaveBeenSet = a3;
}

- (BOOL)isWatch
{
  return self->_isWatch;
}

- (void)setIsWatch:(BOOL)a3
{
  self->_isWatch = a3;
}

- (BOOL)krakenUnleashed
{
  return self->_krakenUnleashed;
}

- (void)setKrakenUnleashed:(BOOL)a3
{
  self->_krakenUnleashed = a3;
}

- (BOOL)fitnessAppIsInstalled
{
  return self->_fitnessAppIsInstalled;
}

- (void)setFitnessAppIsInstalled:(BOOL)a3
{
  self->_fitnessAppIsInstalled = a3;
}

- (BOOL)unitTesting
{
  return self->_unitTesting;
}

- (void)setUnitTesting:(BOOL)a3
{
  self->_unitTesting = a3;
}

- (NSMutableSet)templatesSourcesToRegister
{
  return self->_templatesSourcesToRegister;
}

- (void)setTemplatesSourcesToRegister:(id)a3
{
  objc_storeStrong((id *)&self->_templatesSourcesToRegister, a3);
}

- (NSMutableSet)awardingSourcesToRegister
{
  return self->_awardingSourcesToRegister;
}

- (void)setAwardingSourcesToRegister:(id)a3
{
  objc_storeStrong((id *)&self->_awardingSourcesToRegister, a3);
}

- (NSSet)blocksWaitingOnInitialization
{
  return self->_blocksWaitingOnInitialization;
}

- (void)setBlocksWaitingOnInitialization:(id)a3
{
  objc_storeStrong((id *)&self->_blocksWaitingOnInitialization, a3);
}

- (ACHAchievementStoring)achievementStore
{
  return self->_achievementStore;
}

- (void)setAchievementStore:(id)a3
{
  objc_storeStrong((id *)&self->_achievementStore, a3);
}

- (ACHTemplateAssetRegistry)templateAssetRegistry
{
  return self->_templateAssetRegistry;
}

- (void)setTemplateAssetRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_templateAssetRegistry, a3);
}

- (ACHAchievementProgressEngine)progressProvider
{
  return self->_progressProvider;
}

- (void)setProgressProvider:(id)a3
{
  objc_storeStrong((id *)&self->_progressProvider, a3);
}

- (ACHEarnedInstanceStore)earnedInstanceStore
{
  return self->_earnedInstanceStore;
}

- (void)setEarnedInstanceStore:(id)a3
{
  objc_storeStrong((id *)&self->_earnedInstanceStore, a3);
}

- (ACHEarnedInstanceEntityWrapper)earnedInstanceEntityWrapper
{
  return self->_earnedInstanceEntityWrapper;
}

- (void)setEarnedInstanceEntityWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_earnedInstanceEntityWrapper, a3);
}

- (ACHEarnedInstanceAwardingEngine)awardingEngine
{
  return self->_awardingEngine;
}

- (void)setAwardingEngine:(id)a3
{
  objc_storeStrong((id *)&self->_awardingEngine, a3);
}

- (ACHTemplateStore)templateStore
{
  return self->_templateStore;
}

- (void)setTemplateStore:(id)a3
{
  objc_storeStrong((id *)&self->_templateStore, a3);
}

- (ACHTemplateEntityWrapper)templateEntityWrapper
{
  return self->_templateEntityWrapper;
}

- (void)setTemplateEntityWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_templateEntityWrapper, a3);
}

- (ACHAWDSubmissionManager)submissionManager
{
  return self->_submissionManager;
}

- (void)setSubmissionManager:(id)a3
{
  objc_storeStrong((id *)&self->_submissionManager, a3);
}

- (ACHMobileAssetProvider)mobileAssetProvider
{
  return self->_mobileAssetProvider;
}

- (void)setMobileAssetProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mobileAssetProvider, a3);
}

- (ACHDataStore)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_dataStore, a3);
}

- (ACHActivityAwardingSource)activityAwardingSource
{
  return self->_activityAwardingSource;
}

- (void)setActivityAwardingSource:(id)a3
{
  objc_storeStrong((id *)&self->_activityAwardingSource, a3);
}

- (ACHWorkoutUtility)workoutUtility
{
  return self->_workoutUtility;
}

- (void)setWorkoutUtility:(id)a3
{
  objc_storeStrong((id *)&self->_workoutUtility, a3);
}

- (ACHWorkoutAwardingSource)workoutAwardingSource
{
  return self->_workoutAwardingSource;
}

- (void)setWorkoutAwardingSource:(id)a3
{
  objc_storeStrong((id *)&self->_workoutAwardingSource, a3);
}

- (ACHMonthlyChallengeAwardingSource)monthlyChallengeAwardingSource
{
  return self->_monthlyChallengeAwardingSource;
}

- (void)setMonthlyChallengeAwardingSource:(id)a3
{
  objc_storeStrong((id *)&self->_monthlyChallengeAwardingSource, a3);
}

- (ACHActivitySummaryUtility)activitySummaryUtility
{
  return self->_activitySummaryUtility;
}

- (void)setActivitySummaryUtility:(id)a3
{
  objc_storeStrong((id *)&self->_activitySummaryUtility, a3);
}

- (ACHAwardingScheduler)awardingScheduler
{
  return self->_awardingScheduler;
}

- (void)setAwardingScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_awardingScheduler, a3);
}

- (ACHBuiltinTemplateSource)builtInTemplateSource
{
  return self->_builtInTemplateSource;
}

- (void)setBuiltInTemplateSource:(id)a3
{
  objc_storeStrong((id *)&self->_builtInTemplateSource, a3);
}

- (ACHPerfectMonthTemplateSource)perfectMonthTemplateSource
{
  return self->_perfectMonthTemplateSource;
}

- (void)setPerfectMonthTemplateSource:(id)a3
{
  objc_storeStrong((id *)&self->_perfectMonthTemplateSource, a3);
}

- (ACHMonthlyChallengeTemplateSource)monthlyChallengeTemplateSource
{
  return self->_monthlyChallengeTemplateSource;
}

- (void)setMonthlyChallengeTemplateSource:(id)a3
{
  objc_storeStrong((id *)&self->_monthlyChallengeTemplateSource, a3);
}

- (ACHRemoteTemplateSource)remoteTemplateSource
{
  return self->_remoteTemplateSource;
}

- (void)setRemoteTemplateSource:(id)a3
{
  objc_storeStrong((id *)&self->_remoteTemplateSource, a3);
}

- (ACHTemplateSourceScheduler)templateSourceScheduler
{
  return self->_templateSourceScheduler;
}

- (void)setTemplateSourceScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_templateSourceScheduler, a3);
}

- (ACHBackCompatMonthlyChallengeListener)backCompatMonthlyChallengeListener
{
  return self->_backCompatMonthlyChallengeListener;
}

- (void)setBackCompatMonthlyChallengeListener:(id)a3
{
  objc_storeStrong((id *)&self->_backCompatMonthlyChallengeListener, a3);
}

- (ACHRemoteTemplateAvailabilityKeyProvider)remoteTemplateAvailabilityKeyProvider
{
  return self->_remoteTemplateAvailabilityKeyProvider;
}

- (void)setRemoteTemplateAvailabilityKeyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_remoteTemplateAvailabilityKeyProvider, a3);
}

- (ACHRemoteTemplateAvailabilityListener)remoteTemplateAvailabilityListener
{
  return self->_remoteTemplateAvailabilityListener;
}

- (void)setRemoteTemplateAvailabilityListener:(id)a3
{
  objc_storeStrong((id *)&self->_remoteTemplateAvailabilityListener, a3);
}

- (NSString)currentBuildVersion
{
  return self->_currentBuildVersion;
}

- (void)setCurrentBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_currentBuildVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBuildVersion, 0);
  objc_storeStrong((id *)&self->_remoteTemplateAvailabilityListener, 0);
  objc_storeStrong((id *)&self->_remoteTemplateAvailabilityKeyProvider, 0);
  objc_storeStrong((id *)&self->_backCompatMonthlyChallengeListener, 0);
  objc_storeStrong((id *)&self->_templateSourceScheduler, 0);
  objc_storeStrong((id *)&self->_remoteTemplateSource, 0);
  objc_storeStrong((id *)&self->_monthlyChallengeTemplateSource, 0);
  objc_storeStrong((id *)&self->_perfectMonthTemplateSource, 0);
  objc_storeStrong((id *)&self->_builtInTemplateSource, 0);
  objc_storeStrong((id *)&self->_awardingScheduler, 0);
  objc_storeStrong((id *)&self->_activitySummaryUtility, 0);
  objc_storeStrong((id *)&self->_monthlyChallengeAwardingSource, 0);
  objc_storeStrong((id *)&self->_workoutAwardingSource, 0);
  objc_storeStrong((id *)&self->_workoutUtility, 0);
  objc_storeStrong((id *)&self->_activityAwardingSource, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_mobileAssetProvider, 0);
  objc_storeStrong((id *)&self->_submissionManager, 0);
  objc_storeStrong((id *)&self->_templateEntityWrapper, 0);
  objc_storeStrong((id *)&self->_templateStore, 0);
  objc_storeStrong((id *)&self->_awardingEngine, 0);
  objc_storeStrong((id *)&self->_earnedInstanceEntityWrapper, 0);
  objc_storeStrong((id *)&self->_earnedInstanceStore, 0);
  objc_storeStrong((id *)&self->_progressProvider, 0);
  objc_storeStrong((id *)&self->_templateAssetRegistry, 0);
  objc_storeStrong((id *)&self->_achievementStore, 0);
  objc_storeStrong((id *)&self->_blocksWaitingOnInitialization, 0);
  objc_storeStrong((id *)&self->_awardingSourcesToRegister, 0);
  objc_storeStrong((id *)&self->_templatesSourcesToRegister, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end
