@implementation COCoordinationService

- (id)_initWithConstituentType:(unint64_t)a3
{
  COCoordinationService *v4;
  COCoordinationService *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v10;
  NSMapTable *assertions;
  uint64_t v12;
  COClusterAliasManager *aliasManager;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  COHomeKitAdapter *hkAdapter;
  void *v24;
  objc_super v26;
  uint8_t buf[4];
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)COCoordinationService;
  v4 = -[COCoordinationService init](&v26, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)&v4->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INTERACTIVE, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = dispatch_queue_create("com.apple.coordination.COCoordinationService", v7);
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    assertions = v5->_assertions;
    v5->_assertions = (NSMapTable *)v10;

    +[COClusterAliasManager aliasManagerWithProvider:delegate:delegateDispatchQueue:](COClusterAliasManager, "aliasManagerWithProvider:delegate:delegateDispatchQueue:", v5, v5, v5->_dispatchQueue);
    v12 = objc_claimAutoreleasedReturnValue();
    aliasManager = v5->_aliasManager;
    v5->_aliasManager = (COClusterAliasManager *)v12;

    v14 = (void *)MEMORY[0x24BE19E28];
    objc_msgSend(MEMORY[0x24BE19E28], "coordinationBundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userDefaultsForIdentifer:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "objectForKey:", CFSTR("SingleShotType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        a3 = objc_msgSend(v17, "unsignedIntegerValue");
        COCoreLogForCategory(1);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v28 = a3;
          _os_log_impl(&dword_215E92000, v18, OS_LOG_TYPE_DEFAULT, "Service type overridden with %016llX", buf, 0xCu);
        }

      }
      objc_msgSend(v16, "removeObjectForKey:", CFSTR("SingleShotType"));
    }
    v5->_type = a3;
    objc_msgSend(v16, "doubleForKey:", CFSTR("MinimumPing"));
    v20 = v19;
    objc_msgSend(v16, "doubleForKey:", CFSTR("MaximumPing"));
    if (v20 > 0.0 && v20 < v21)
    {
      v5->_pingMinimum = v20;
      v5->_pingMaximum = v21;
    }
    +[COHomeKitAdapter sharedInstance](COHomeKitAdapter, "sharedInstance");
    v22 = objc_claimAutoreleasedReturnValue();
    hkAdapter = v5->_hkAdapter;
    v5->_hkAdapter = (COHomeKitAdapter *)v22;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v5, sel__significantHomeChange_, CFSTR("COHomeKitAdapterSignificantHomeChangeNotification"), 0);

    v5->_isMigrating = 1;
    -[COCoordinationService _initiateMigrationFrom:](v5, "_initiateMigrationFrom:", objc_msgSend(v16, "integerForKey:", CFSTR("LastMigration")));
    -[COCoordinationService _setupIDSServerBag](v5, "_setupIDSServerBag");

  }
  return v5;
}

+ (COCoordinationService)singleton
{
  return (COCoordinationService *)(id)_CoordinationService;
}

+ (void)setSingleton:(id)a3
{
  objc_storeStrong((id *)&_CoordinationService, a3);
}

+ (void)startWithConstituentType:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__COCoordinationService_startWithConstituentType___block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a1;
  v3[5] = a3;
  if (startWithConstituentType__onceToken != -1)
    dispatch_once(&startWithConstituentType__onceToken, v3);
}

void __50__COCoordinationService_startWithConstituentType___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = -[COCoordinationService _initWithConstituentType:]([COCoordinationService alloc], "_initWithConstituentType:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v1, "setSingleton:", v2);

}

- (void)_initiateMigrationFrom:(int64_t)a3
{
  NSObject *v5;
  _BOOL4 v6;
  _QWORD v7[5];
  uint8_t buf[4];
  int64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a3 < 1)
  {
    if (v6)
    {
      *(_DWORD *)buf = 134218240;
      v9 = a3;
      v10 = 2048;
      v11 = 1;
      _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "Migration starting from %ld to %ld...", buf, 0x16u);
    }

    -[COCoordinationService _continueMigration](self, "_continueMigration");
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 134218240;
      v9 = a3;
      v10 = 2048;
      v11 = 1;
      _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "No migration required (%ld >= %ld)", buf, 0x16u);
    }

    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __48__COCoordinationService__initiateMigrationFrom___block_invoke;
    v7[3] = &unk_24D4B0C80;
    v7[4] = self;
    -[COCoordinationService _withLock:](self, "_withLock:", v7);
    -[COCoordinationService _continueInitialization](self, "_continueInitialization");
  }
}

uint64_t __48__COCoordinationService__initiateMigrationFrom___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 16) = 0;
  return result;
}

- (void)_continueMigration
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  COCoordinationService *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  -[COCoordinationService hkAdapter](self, "hkAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BE67828]);
    v6 = objc_alloc_init(MEMORY[0x24BE67870]);
    v7 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(v5, "alarms");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v8;
    objc_msgSend(v6, "timers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE6B628], "immediateScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "combineAllFutures:ignoringErrors:scheduler:", v10, 1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __43__COCoordinationService__continueMigration__block_invoke;
    v16[3] = &unk_24D4B20E8;
    v17 = v4;
    v18 = v5;
    v19 = v6;
    v20 = self;
    v13 = v6;
    v14 = v5;
    v15 = (id)objc_msgSend(v12, "addSuccessBlock:", v16);

  }
  else
  {
    -[COCoordinationService _completeMigration](self, "_completeMigration");
  }

}

void __43__COCoordinationService__continueMigration__block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id *v44;
  void *v45;
  void *v46;
  _QWORD v47[5];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_opt_class();
  v44 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v7 = v4;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v8)
    {
      v9 = v8;
      v45 = v6;
      v38 = v5;
      v40 = v4;
      v42 = v3;
      v10 = *(_QWORD *)v53;
      v11 = *MEMORY[0x24BE19C48];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v53 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v13, "siriContext", v38, v40, v42);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            COAlarmSiriContextTargetReferenceForAccessory();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(v13, "mutableCopy");
            if (v14)
              v17 = (id)objc_msgSend(v14, "mutableCopy");
            else
              v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
            v18 = v17;
            objc_msgSend(v17, "setObject:forKey:", v15, v11);
            objc_msgSend(v16, "setSiriContext:", v18);
            objc_msgSend(a1[5], "updateAlarm:", v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "addObject:", v19);

            a1 = v44;
          }

        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v9);
      v4 = v40;
      v3 = v42;
      v5 = v38;
      v6 = v45;
    }
  }
  else
  {
    COCoreLogForCategory(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __43__COCoordinationService__continueMigration__block_invoke_cold_2();
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v20 = v5;
    v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v21)
    {
      v22 = v21;
      v46 = v6;
      v39 = v5;
      v41 = v4;
      v43 = v3;
      v23 = *(_QWORD *)v49;
      v24 = *MEMORY[0x24BE19DE0];
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v49 != v23)
            objc_enumerationMutation(v20);
          v26 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
          if ((objc_msgSend(v26, "isCurrentTimer", v39, v41, v43) & 1) == 0)
          {
            objc_msgSend(v26, "siriContext");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKey:", v24);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v28)
            {
              COTimerSiriContextTargetReferenceForAccessory();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = (void *)objc_msgSend(v26, "mutableCopy");
              if (v27)
                v30 = (id)objc_msgSend(v27, "mutableCopy");
              else
                v30 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              v31 = v30;
              objc_msgSend(v30, "setObject:forKey:", v28, v24);
              objc_msgSend(v29, "setSiriContext:", v31);
              objc_msgSend(a1[6], "updateTimer:", v29);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "addObject:", v32);

              a1 = v44;
            }

          }
        }
        v22 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v22);
      v4 = v41;
      v3 = v43;
      v5 = v39;
      v6 = v46;
    }
  }
  else
  {
    COCoreLogForCategory(1);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __43__COCoordinationService__continueMigration__block_invoke_cold_1();
  }

  if (objc_msgSend(v6, "count"))
  {
    v33 = a1;
    v34 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BE6B628], "immediateScheduler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "combineAllFutures:ignoringErrors:scheduler:", v6, 1, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __43__COCoordinationService__continueMigration__block_invoke_30;
    v47[3] = &unk_24D4B46C0;
    v47[4] = v33[7];
    v37 = (id)objc_msgSend(v36, "addCompletionBlock:", v47);

  }
  else
  {
    objc_msgSend(a1[7], "_completeMigration");
  }

}

uint64_t __43__COCoordinationService__continueMigration__block_invoke_30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeMigration");
}

- (void)_completeMigration
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  COCoreLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215E92000, v3, OS_LOG_TYPE_DEFAULT, "Migration complete.", buf, 2u);
  }

  v4 = (void *)MEMORY[0x24BE19E28];
  objc_msgSend(MEMORY[0x24BE19E28], "coordinationBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDefaultsForIdentifer:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setInteger:forKey:", 1, CFSTR("LastMigration"));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__COCoordinationService__completeMigration__block_invoke;
  v7[3] = &unk_24D4B0C80;
  v7[4] = self;
  -[COCoordinationService _withLock:](self, "_withLock:", v7);
  -[COCoordinationService _continueInitialization](self, "_continueInitialization");

}

uint64_t __43__COCoordinationService__completeMigration__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 16) = 0;
  return result;
}

- (void)_initializeServices
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSOrderedSet *v10;
  NSOrderedSet *services;
  int v12;
  COCoordinationService *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_servicesLock);
  v3 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  +[COCapabilityService serviceWithDelegate:](COCapabilityService, "serviceWithDelegate:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  +[CORoleService serviceWithDelegate:](CORoleService, "serviceWithDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  +[COStateService serviceWithDelegate:](COStateService, "serviceWithDelegate:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  +[COMessagingService serviceWithDelegate:](COMessagingService, "serviceWithDelegate:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  if ((objc_msgSend(MEMORY[0x24BE19E30], "isDistributedTimersForHH1Enabled") & 1) != 0)
  {
    COCoreLogForCategory(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = self;
      _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p Alarms & Timers are handled by DistributedTimers (HH1 ok)", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    +[COAlarmService serviceWithDelegate:](COAlarmService, "serviceWithDelegate:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

    +[COTimerService serviceWithDelegate:](COTimerService, "serviceWithDelegate:", self);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);
  }

  v10 = (NSOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF00]), "initWithOrderedSet:", v3);
  services = self->_services;
  self->_services = v10;

}

- (void)_continueInitialization
{
  NSArray *alwaysAssert;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__COCoordinationService__continueInitialization__block_invoke;
  v4[3] = &unk_24D4B0C80;
  v4[4] = self;
  -[COCoordinationService _withServicesLock:](self, "_withServicesLock:", v4);
  alwaysAssert = self->_alwaysAssert;
  self->_alwaysAssert = 0;

}

uint64_t __48__COCoordinationService__continueInitialization__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initializeServices");
}

- (void)_significantHomeChange:(id)a3
{
  id v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v4 = a3;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__COCoordinationService__significantHomeChange___block_invoke;
  v5[3] = &unk_24D4B07E0;
  v5[4] = self;
  v5[5] = &v6;
  -[COCoordinationService _withLock:](self, "_withLock:", v5);
  if (*((_BYTE *)v7 + 24))
    -[COCoordinationService _continueMigration](self, "_continueMigration");
  _Block_object_dispose(&v6, 8);

}

uint64_t __48__COCoordinationService__significantHomeChange___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (void)_linkServicesToMeshController:(id)a3 withClusterIdentifier:(id)a4 forClusters:(id)a5
{
  id v8;
  int v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  dispatch_group_t v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  void (**v30)(_QWORD);
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  const char *v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  NSObject *v43;
  _QWORD *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  id *v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _QWORD v54[4];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[5];
  id v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint8_t buf[4];
  COCoordinationService *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  id v75;
  __int16 v76;
  id v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v37 = a3;
  v38 = a4;
  v8 = a5;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__29;
  v66 = __Block_byref_object_dispose__29;
  v67 = 0;
  v59[0] = MEMORY[0x24BDAC760];
  v59[1] = 3221225472;
  v59[2] = __89__COCoordinationService__linkServicesToMeshController_withClusterIdentifier_forClusters___block_invoke;
  v59[3] = &unk_24D4B0BE0;
  v61 = &v62;
  v59[4] = self;
  v36 = v8;
  v60 = v36;
  -[COCoordinationService _withServicesLock:](self, "_withServicesLock:", v59);
  v9 = objc_msgSend(MEMORY[0x24BE19E30], "isDistributedTimersEnabled");
  -[COCoordinationService hkAdapter](self, "hkAdapter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasOptedToHH2");

  COCoreLogForCategory(1);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v34 = "no";
    if (v9)
      v35 = "yes";
    else
      v35 = "no";
    *(_DWORD *)buf = 134218498;
    v69 = self;
    v71 = (uint64_t)v35;
    v70 = 2080;
    if (v11)
      v34 = "yes";
    v72 = 2080;
    v73 = v34;
    _os_log_debug_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEBUG, "%p DistributedTimers: %s, HomeHub2: %s", buf, 0x20u);
  }

  if (((objc_msgSend(MEMORY[0x24BE19E30], "isDistributedTimersForHH1Enabled") | v9 ^ 1) & 1) == 0
    && ((v11 ^ 1) & 1) == 0)
  {
    COCoreLogForCategory(1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v69 = self;
      _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%p Alarms & Timers are handled by DistributedTimers, removing services.", buf, 0xCu);
    }

    v14 = (void *)objc_msgSend((id)v63[5], "mutableCopy");
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v15 = (id)v63[5];
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v78, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v56 != v17)
            objc_enumerationMutation(v15);
          v19 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
          v20 = (void *)objc_opt_class();
          if ((objc_msgSend(v20, "isEqual:", objc_opt_class()) & 1) == 0)
          {
            v21 = (void *)objc_opt_class();
            if (!objc_msgSend(v21, "isEqual:", objc_opt_class()))
              continue;
          }
          COCoreLogForCategory(1);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v69 = self;
            v70 = 2112;
            v71 = v19;
            _os_log_impl(&dword_215E92000, v22, OS_LOG_TYPE_DEFAULT, "%p removing %@", buf, 0x16u);
          }

          objc_msgSend(v14, "removeObject:", v19);
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v78, 16);
      }
      while (v16);
    }

    v23 = (void *)v63[5];
    v63[5] = (uint64_t)v14;

  }
  v24 = objc_msgSend((id)v63[5], "count");
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v54[3] = 0;
  v48 = 0;
  v49 = (id *)&v48;
  v50 = 0x3042000000;
  v51 = __Block_byref_object_copy__44;
  v52 = __Block_byref_object_dispose__45;
  v53 = 0;
  v25 = dispatch_group_create();
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __89__COCoordinationService__linkServicesToMeshController_withClusterIdentifier_forClusters___block_invoke_46;
  v39[3] = &unk_24D4B4710;
  v47 = v24;
  v44 = v54;
  v45 = &v62;
  v26 = v36;
  v40 = v26;
  v27 = v37;
  v41 = v27;
  v28 = v38;
  v42 = v28;
  v46 = &v48;
  v29 = v25;
  v43 = v29;
  v30 = (void (**)(_QWORD))MEMORY[0x2199F3D40](v39);
  objc_storeWeak(v49 + 5, v30);
  COCoreLogForCategory(1);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = objc_msgSend((id)v63[5], "count");
    *(_DWORD *)buf = 134219010;
    v69 = self;
    v70 = 2048;
    v71 = v32;
    v72 = 2048;
    v73 = (const char *)v27;
    v74 = 2112;
    v75 = v28;
    v76 = 2112;
    v77 = v26;
    _os_log_impl(&dword_215E92000, v31, OS_LOG_TYPE_DEFAULT, "%p linking %lu services to %p with %@ for Clusters %@", buf, 0x34u);
  }

  COCoreLogForCategory(1);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    -[COCoordinationService _linkServicesToMeshController:withClusterIdentifier:forClusters:].cold.1();

  dispatch_group_enter(v29);
  v30[2](v30);
  dispatch_group_wait(v29, 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(&v48, 8);
  objc_destroyWeak(&v53);

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(&v62, 8);

}

void __89__COCoordinationService__linkServicesToMeshController_withClusterIdentifier_forClusters___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_servicesForClusters:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __89__COCoordinationService__linkServicesToMeshController_withClusterIdentifier_forClusters___block_invoke_46(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) >= *(_QWORD *)(a1 + 88))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectAtIndex:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __89__COCoordinationService__linkServicesToMeshController_withClusterIdentifier_forClusters___block_invoke_2;
    v6[3] = &unk_24D4B46E8;
    v6[4] = *(_QWORD *)(a1 + 80);
    objc_msgSend(v2, "joinClusters:usingMeshController:withClusterIdentifier:completion:", v3, v4, v5, v6);

  }
}

void __89__COCoordinationService__linkServicesToMeshController_withClusterIdentifier_forClusters___block_invoke_2(uint64_t a1)
{
  void (**WeakRetained)(void);

  WeakRetained = (void (**)(void))objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  WeakRetained[2]();

}

- (void)_unlinkServicesFromMeshController:(id)a3 withClusterIdentifier:(id)a4 forClusters:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  dispatch_group_t v14;
  id v15;
  id v16;
  NSObject *v17;
  void (**v18)(_QWORD);
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  id *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _QWORD v38[4];
  _QWORD v39[5];
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  COCoordinationService *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__29;
  v46 = __Block_byref_object_dispose__29;
  v47 = 0;
  v11 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __93__COCoordinationService__unlinkServicesFromMeshController_withClusterIdentifier_forClusters___block_invoke;
  v39[3] = &unk_24D4B0BE0;
  v41 = &v42;
  v39[4] = self;
  v12 = v10;
  v40 = v12;
  -[COCoordinationService _withServicesLock:](self, "_withServicesLock:", v39);
  v13 = objc_msgSend((id)v43[5], "count");
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0;
  v32 = 0;
  v33 = (id *)&v32;
  v34 = 0x3042000000;
  v35 = __Block_byref_object_copy__44;
  v36 = __Block_byref_object_dispose__45;
  v37 = 0;
  v14 = dispatch_group_create();
  v21 = v11;
  v22 = 3221225472;
  v23 = __93__COCoordinationService__unlinkServicesFromMeshController_withClusterIdentifier_forClusters___block_invoke_2;
  v24 = &unk_24D4B4738;
  v31 = v13;
  v28 = v38;
  v29 = &v42;
  v15 = v12;
  v25 = v15;
  v16 = v9;
  v26 = v16;
  v30 = &v32;
  v17 = v14;
  v27 = v17;
  v18 = (void (**)(_QWORD))MEMORY[0x2199F3D40](&v21);
  objc_storeWeak(v33 + 5, v18);
  COCoreLogForCategory(1);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend((id)v43[5], "count", v21, v22, v23, v24, v25, v26);
    *(_DWORD *)buf = 134219010;
    v49 = self;
    v50 = 2048;
    v51 = v20;
    v52 = 2048;
    v53 = v8;
    v54 = 2112;
    v55 = v16;
    v56 = 2112;
    v57 = v15;
    _os_log_impl(&dword_215E92000, v19, OS_LOG_TYPE_DEFAULT, "%p unlinking %lu services from %p with %@ for Clusters %@", buf, 0x34u);
  }

  dispatch_group_enter(v17);
  v18[2](v18);
  dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(&v32, 8);
  objc_destroyWeak(&v37);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v42, 8);

}

void __93__COCoordinationService__unlinkServicesFromMeshController_withClusterIdentifier_forClusters___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_servicesForClusters:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __93__COCoordinationService__unlinkServicesFromMeshController_withClusterIdentifier_forClusters___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >= *(_QWORD *)(a1 + 80))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectAtIndex:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __93__COCoordinationService__unlinkServicesFromMeshController_withClusterIdentifier_forClusters___block_invoke_3;
    v5[3] = &unk_24D4B46E8;
    v5[4] = *(_QWORD *)(a1 + 72);
    objc_msgSend(v2, "leaveClusters:withClusterIdentifier:completion:", v3, v4, v5);

  }
}

void __93__COCoordinationService__unlinkServicesFromMeshController_withClusterIdentifier_forClusters___block_invoke_3(uint64_t a1)
{
  void (**WeakRetained)(void);

  WeakRetained = (void (**)(void))objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  WeakRetained[2]();

}

- (id)takeAssertionForCluster:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  COCoordinationService *v13;
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__29;
  v25 = __Block_byref_object_dispose__29;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __49__COCoordinationService_takeAssertionForCluster___block_invoke;
  v12 = &unk_24D4B4760;
  v13 = self;
  v5 = v4;
  v14 = v5;
  v15 = &v21;
  v16 = &v17;
  -[COCoordinationService _withLock:](self, "_withLock:", &v9);
  if (*((_BYTE *)v18 + 24))
  {
    -[COCoordinationService aliasManager](self, "aliasManager", v9, v10, v11, v12, v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startTrackingCluster:", v5);

  }
  v7 = (id)v22[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v7;
}

void __49__COCoordinationService_takeAssertionForCluster___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id location;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "assertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v3);

  v4 = objc_loadWeakRetained(&location);
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    COCoreLogForCategory(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v8, "assertions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134218754;
      v22 = v8;
      v23 = 2048;
      v24 = v7;
      v25 = 2112;
      v26 = v6;
      v27 = 2048;
      v28 = v10;
      _os_log_debug_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEBUG, "%p reusing assertion %p for Cluster %@ (total %lu)", buf, 0x2Au);

    }
  }
  else
  {
    +[COClusterAssertion assertionForCluster:delegate:](COClusterAssertion, "assertionForCluster:delegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    objc_msgSend(*(id *)(a1 + 32), "assertions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));

    COCoreLogForCategory(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v17 = *(void **)(a1 + 32);
      objc_msgSend(v17, "assertions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");
      *(_DWORD *)buf = 134218754;
      v22 = v17;
      v23 = 2048;
      v24 = v16;
      v25 = 2112;
      v26 = v15;
      v27 = 2048;
      v28 = v19;
      _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p established assertion %p for Cluster %@ (total %lu)", buf, 0x2Au);

    }
  }

  objc_destroyWeak(&location);
}

- (void)waitForClusterBootstrap:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__COCoordinationService_waitForClusterBootstrap_completion___block_invoke;
  v11[3] = &unk_24D4B08A8;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v13 = &v14;
  -[COCoordinationService _withLock:](self, "_withLock:", v11);
  if (*((_BYTE *)v15 + 24))
  {
    COCoreLogForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[COCoordinationService waitForClusterBootstrap:completion:].cold.1();

    v7[2](v7);
  }
  else
  {
    -[COCoordinationService aliasManager](self, "aliasManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "waitForBootstrapOfCluster:withBlock:", v8, v7);

  }
  _Block_object_dispose(&v14, 8);

}

void __60__COCoordinationService_waitForClusterBootstrap_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "assertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v3);

  v4 = objc_loadWeakRetained(&location);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4 == 0;

  objc_destroyWeak(&location);
}

- (void)didInvalidateAssertionForCluster:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__COCoordinationService_didInvalidateAssertionForCluster___block_invoke;
  v7[3] = &unk_24D4B0858;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[COCoordinationService _withLock:](self, "_withLock:", v7);
  -[COCoordinationService aliasManager](self, "aliasManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopTrackingCluster:", v6);

}

void __58__COCoordinationService_didInvalidateAssertionForCluster___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "assertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  COCoreLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "assertions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218498;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    v11 = 2048;
    v12 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_215E92000, v3, OS_LOG_TYPE_DEFAULT, "%p assertion invalidated for Cluster %@ (total %lu)", (uint8_t *)&v7, 0x20u);

  }
}

- (id)aliasManagerRequestsNewMesh:(id)a3
{
  COMeshController *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = -[COMeshController initWithConstituentType:]([COMeshController alloc], "initWithConstituentType:", -[COCoordinationService type](self, "type"));
  -[COCoordinationService dispatchQueue](self, "dispatchQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshController setDispatchQueue:](v4, "setDispatchQueue:", v5);

  -[COCoordinationService pingMinimum](self, "pingMinimum");
  v7 = v6;
  -[COCoordinationService pingMaximum](self, "pingMaximum");
  if (v7 > 0.0)
  {
    v9 = v8;
    if (v7 < v8)
    {
      -[COMeshController setPingMinimum:](v4, "setPingMinimum:", v7);
      -[COMeshController setPingMaximum:](v4, "setPingMaximum:", v9);
    }
  }
  return v4;
}

- (void)aliasManager:(id)a3 activatingMesh:(id)a4 withClusterIdentifier:(id)a5 forClusters:(id)a6 completion:(id)a7
{
  void (**v11)(void);

  v11 = (void (**)(void))a7;
  -[COCoordinationService _linkServicesToMeshController:withClusterIdentifier:forClusters:](self, "_linkServicesToMeshController:withClusterIdentifier:forClusters:", a4, a5, a6);
  v11[2]();

}

- (void)aliasManager:(id)a3 deactivatingMesh:(id)a4 withClusterIdentifier:(id)a5 forClusters:(id)a6 completion:(id)a7
{
  void (**v11)(void);

  v11 = (void (**)(void))a7;
  -[COCoordinationService _unlinkServicesFromMeshController:withClusterIdentifier:forClusters:](self, "_unlinkServicesFromMeshController:withClusterIdentifier:forClusters:", a4, a5, a6);
  v11[2]();

}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_withServicesLock:(id)a3
{
  os_unfair_lock_s *p_servicesLock;
  void (**v4)(_QWORD);

  p_servicesLock = &self->_servicesLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_servicesLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_servicesLock);
}

- (id)_servicesForClusters:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_servicesLock);
  v17 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[COCoordinationService services](self, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = v4;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              if (objc_msgSend(v10, "_applicableToCluster:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j)))
              {
                objc_msgSend(v17, "addObject:", v10);
                goto LABEL_16;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v13)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  return v17;
}

- (void)_setupIDSServerBag
{
  NSObject *v3;
  COIDSServerBag *v4;
  COIDSServerBag *idsServerBag;
  void *v6;
  void *v7;
  int v8;
  COCoordinationService *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = self;
    _os_log_impl(&dword_215E92000, v3, OS_LOG_TYPE_DEFAULT, "%p setting up IDSServer Bag", (uint8_t *)&v8, 0xCu);
  }

  v4 = objc_alloc_init(COIDSServerBag);
  idsServerBag = self->_idsServerBag;
  self->_idsServerBag = v4;

  -[COCoordinationService idsServerBag](self, "idsServerBag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[COCoordinationService idsServerBag](self, "idsServerBag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configure");

}

- (void)idsServerBagDidUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  COCoordinationService *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  COCoordinationService *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  COCoordinationService *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COCoreLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134217984;
    v20 = self;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p IDS server bag updated", (uint8_t *)&v19, 0xCu);
  }

  v6 = (void *)MEMORY[0x24BE19E28];
  objc_msgSend(MEMORY[0x24BE19E28], "coordinationBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userDefaultsForIdentifer:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "isFastFoldEnabled");
  v9 = (COCoordinationService *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = *MEMORY[0x24BE19C78];
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BE19C78]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11 || (objc_msgSend(v11, "isEqual:", v9) & 1) == 0)
    {
      COCoreLogForCategory(1);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v9;
        _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "Received an updated bag value for fast fold %@. Writing to prefs", (uint8_t *)&v19, 0xCu);
      }

      objc_msgSend(v8, "setObject:forKey:", v9, v10);
    }

  }
  objc_msgSend(v4, "isIPDiffingEnabled");
  v14 = (COCoordinationService *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = *MEMORY[0x24BE19C80];
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BE19C80]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16 || (objc_msgSend(v16, "isEqual:", v14) & 1) == 0)
    {
      COCoreLogForCategory(1);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v14;
        _os_log_impl(&dword_215E92000, v18, OS_LOG_TYPE_DEFAULT, "Received an updated bag value for ip diffing %@. Writing to prefs", (uint8_t *)&v19, 0xCu);
      }

      objc_msgSend(v8, "setObject:forKey:", v14, v15);
    }

  }
}

- (unint64_t)type
{
  return self->_type;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (double)pingMinimum
{
  return self->_pingMinimum;
}

- (double)pingMaximum
{
  return self->_pingMaximum;
}

- (COHomeKitAdapter)hkAdapter
{
  return self->_hkAdapter;
}

- (NSOrderedSet)services
{
  return self->_services;
}

- (NSArray)alwaysAssert
{
  return self->_alwaysAssert;
}

- (NSMapTable)assertions
{
  return self->_assertions;
}

- (COClusterAliasManager)aliasManager
{
  return self->_aliasManager;
}

- (COIDSServerBag)idsServerBag
{
  return self->_idsServerBag;
}

- (void)setIdsServerBag:(id)a3
{
  objc_storeStrong((id *)&self->_idsServerBag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsServerBag, 0);
  objc_storeStrong((id *)&self->_aliasManager, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_alwaysAssert, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_hkAdapter, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __43__COCoordinationService__continueMigration__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_215E92000, v0, v1, "Migrating timers failed (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __43__COCoordinationService__continueMigration__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_215E92000, v0, v1, "Migrating alarms failed (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_linkServicesToMeshController:withClusterIdentifier:forClusters:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_215E92000, v1, OS_LOG_TYPE_DEBUG, "%p services: %@", v2, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

- (void)waitForClusterBootstrap:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_215E92000, v1, OS_LOG_TYPE_ERROR, "%p no assertion for Cluster %@, invoking bootstrap block inline", v2, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

@end
