@implementation MCProfileConnection

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *notificationSyncQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  notificationSyncQueue = self->_notificationSyncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MCProfileConnection_registerObserver___block_invoke;
  block[3] = &unk_1E41E0D70;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(notificationSyncQueue, block);

}

- (BOOL)isAutomaticAppDownloadsAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAutomaticAppDownloads")) != 2;
}

- (BOOL)isCloudSyncAllowed:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (-[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowCloudDocumentSync")) == 2)
  {
    v5 = 0;
  }
  else if (-[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowManagedAppsCloudSync")) == 2)
  {
    objc_msgSend(MEMORY[0x1E0D44778], "attributesByAppID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v4);

    v5 = v8 ^ 1;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)isOnDeviceAppInstallationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAppInstallation")) != 2&& -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowUIAppInstallation")) != 2;
}

- (BOOL)isActivityContinuationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowActivityContinuation")) != 2;
}

- (BOOL)isHealthDataSubmissionAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowHealthDataSubmission")) == 1;
}

- (BOOL)isNewsAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowNews")) != 2;
}

- (BOOL)isDictationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowDictation")) != 2;
}

- (BOOL)isDiagnosticSubmissionAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowDiagnosticSubmission")) == 1;
}

- (int)effectiveBoolValueForSetting:(id)a3
{
  return -[MCProfileConnection effectiveBoolValueForSetting:outAsk:](self, "effectiveBoolValueForSetting:outAsk:", a3, 0);
}

- (id)effectiveBlockedAppBundleIDsExcludingRemovedSystemApps
{
  void *v2;
  void *v3;
  void *v4;

  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
  {
    v2 = 0;
  }
  else
  {
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "effectiveBlockedAppBundleIDsExcludingRemovedSystemApps:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v4, "copy");

  }
  return v2;
}

- (int)appWhitelistState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
    return 0;
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectiveUserSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentRestrictions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[MCRestrictionManager appWhitelistStateWithSettingsDictionary:restrictionsDictionary:](MCRestrictionManager, "appWhitelistStateWithSettingsDictionary:restrictionsDictionary:", v4, v6);

  return v7;
}

- (id)effectiveValueForSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
  {
    v5 = 0;
  }
  else
  {
    -[MCProfileConnection effectiveParametersForValueSetting:](self, "effectiveParametersForValueSetting:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("value"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)effectiveParametersForValueSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectiveParametersForValueSetting:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isBoolSettingLockedDownByRestrictions:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBoolSettingLockedDownByRestrictions:", v4);

  return v6;
}

+ (id)sharedConnection
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (!sharedConnection_connection)
  {
    v3 = objc_opt_new();
    v4 = (void *)sharedConnection_connection;
    sharedConnection_connection = v3;

  }
  objc_sync_exit(v2);

  return (id)sharedConnection_connection;
}

- (int)effectiveBoolValueForSetting:(id)a3 outAsk:(BOOL *)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
  {
    v7 = 0;
  }
  else
  {
    -[MCProfileConnection effectiveParametersForBoolSetting:](self, "effectiveParametersForBoolSetting:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "BOOLValue"))
      {
        if (a4)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ask"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = objc_msgSend(v11, "BOOLValue");

        }
        v7 = 1;
      }
      else
      {
        v7 = 2;
      }
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void)checkInIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  NSObject *v6;
  int v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
  {
    v3 = mach_absolute_time();
    -[MCProfileConnection checkIn](self, "checkIn");
    v4 = mach_absolute_time();
    v5 = _MCMachTimeToSeconds(v4 - v3);
    if (v5 > 0.01)
    {
      v6 = qword_1ECD40B38;
      if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
      {
        v7 = 134217984;
        v8 = v5;
        _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_ERROR, "A call was blocked for a significant time waiting for ManagedConfiguration migration to complete. checkInIfNeeded time elapsed: %f", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (BOOL)needsCheckIn
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  BOOL result;
  const char *v8;
  uint8_t *v9;
  _BOOL4 v10;
  __int16 v11;
  __int16 v12;

  if ((MCHasMigrated() & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.datamigrator"));

  if (v4)
  {
    v5 = qword_1ECD40B38;
    v6 = os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v6)
      return result;
    v12 = 0;
    v8 = "Not blocking for migration because we're running inside the data migrator.";
    v9 = (uint8_t *)&v12;
    goto LABEL_8;
  }
  if (!MCIsDaemonProcess)
    return 1;
  v5 = qword_1ECD40B38;
  v10 = os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v10)
  {
    v11 = 0;
    v8 = "Not blocking for migration because we're running inside profiled.";
    v9 = (uint8_t *)&v11;
LABEL_8:
    _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    return 0;
  }
  return result;
}

- (id)effectiveParametersForBoolSetting:(id)a3 configurationUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "effectiveParametersForBoolSetting:configurationUUID:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)effectiveParametersForBoolSetting:(id)a3
{
  return -[MCProfileConnection effectiveParametersForBoolSetting:configurationUUID:](self, "effectiveParametersForBoolSetting:configurationUUID:", a3, 0);
}

void __149__MCProfileConnection_Settings__setParametersForSettingsByType_configurationUUID_toSystem_user_passcode_credentialSet_waitUntilCompleted_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (!os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v5 = v4;
    objc_msgSend(v3, "MCVerboseDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Set parameters for settings error. Error: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  else
  {
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject invalidateSettings](v5, "invalidateSettings");
  }

LABEL_6:
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

- (MCProfileConnection)init
{
  MCProfileConnection *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *xpcConnectionSyncQueue;
  dispatch_queue_t v6;
  OS_dispatch_queue *publicXPCConnectionSyncQueue;
  dispatch_queue_t v8;
  OS_dispatch_queue *shutDownSerialQueue;
  uint64_t v10;
  NSHashTable *observers;
  dispatch_queue_t v12;
  OS_dispatch_queue *notificationSyncQueue;
  NSMutableArray *v14;
  NSMutableArray *notificationTokens;
  const char *v16;
  NSObject *v17;
  uint64_t v18;
  MCProfileConnection *v19;
  NSMutableArray *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  MCProfileConnection *v24;
  NSMutableArray *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  MCProfileConnection *v29;
  NSMutableArray *v30;
  void *v31;
  const char *v32;
  NSObject *v33;
  MCProfileConnection *v34;
  NSMutableArray *v35;
  void *v36;
  const char *v37;
  NSObject *v38;
  uint64_t v39;
  MCProfileConnection *v40;
  NSMutableArray *v41;
  void *v42;
  const char *v43;
  NSObject *v44;
  MCProfileConnection *v45;
  NSMutableArray *v46;
  void *v47;
  const char *v48;
  NSObject *v49;
  MCProfileConnection *v50;
  NSMutableArray *v51;
  void *v52;
  const char *v53;
  NSObject *v54;
  MCProfileConnection *v55;
  NSMutableArray *v56;
  void *v57;
  const char *v58;
  NSObject *v59;
  MCProfileConnection *v60;
  NSMutableArray *v61;
  void *v62;
  const char *v63;
  NSObject *v64;
  id v65;
  NSMutableArray *v66;
  void *v67;
  const char *v68;
  NSObject *v69;
  id v70;
  NSMutableArray *v71;
  void *v72;
  const char *v73;
  id v74;
  NSObject *v75;
  NSMutableArray *v76;
  void *v77;
  const char *v78;
  id v79;
  NSMutableArray *v80;
  void *v81;
  const char *v82;
  id v83;
  NSMutableArray *v84;
  void *v85;
  const char *v86;
  NSObject *v87;
  id v88;
  NSMutableArray *v89;
  void *v90;
  const char *v91;
  id v92;
  NSMutableArray *v93;
  void *v94;
  const char *v95;
  id v96;
  NSMutableArray *v97;
  void *v98;
  const char *v99;
  id v100;
  NSMutableArray *v101;
  void *v102;
  const char *v103;
  id v104;
  NSMutableArray *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  _QWORD v115[4];
  id v116;
  _QWORD v117[4];
  id v118;
  _QWORD v119[4];
  id v120;
  _QWORD v121[4];
  id v122;
  _QWORD v123[4];
  id v124;
  _QWORD v125[4];
  id v126;
  _QWORD v127[4];
  id v128;
  _QWORD v129[4];
  id v130;
  _QWORD v131[4];
  id v132;
  _QWORD v133[4];
  id v134;
  _QWORD v135[4];
  id v136;
  _QWORD v137[4];
  MCProfileConnection *v138;
  _QWORD v139[4];
  MCProfileConnection *v140;
  _QWORD v141[4];
  MCProfileConnection *v142;
  _QWORD v143[4];
  MCProfileConnection *v144;
  _QWORD v145[4];
  MCProfileConnection *v146;
  _QWORD v147[4];
  MCProfileConnection *v148;
  _QWORD v149[4];
  MCProfileConnection *v150;
  _QWORD handler[4];
  MCProfileConnection *v152;
  int out_token;
  objc_super v154;

  MCLoggingInitialize();
  v154.receiver = self;
  v154.super_class = (Class)MCProfileConnection;
  v3 = -[MCProfileConnection init](&v154, sel_init);
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.MCProfileConnection._xpcConnectionSyncQueue", 0);
    xpcConnectionSyncQueue = v3->_xpcConnectionSyncQueue;
    v3->_xpcConnectionSyncQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_create("com.apple.MCProfileConnection._publicXPCConnectionSyncQueue", 0);
    publicXPCConnectionSyncQueue = v3->_publicXPCConnectionSyncQueue;
    v3->_publicXPCConnectionSyncQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_create("com.apple.MCProfileConnection._shutDownSerialQueue", 0);
    shutDownSerialQueue = v3->_shutDownSerialQueue;
    v3->_shutDownSerialQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v10;

    v12 = dispatch_queue_create("com.apple.MCProfileConnection._notificationSyncQueue", 0);
    notificationSyncQueue = v3->_notificationSyncQueue;
    v3->_notificationSyncQueue = (OS_dispatch_queue *)v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    notificationTokens = v3->_notificationTokens;
    v3->_notificationTokens = v14;

    out_token = 0;
    v16 = (const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.restrictionchanged"), "cStringUsingEncoding:", 4);
    notificationQueue();
    v17 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    v18 = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __27__MCProfileConnection_init__block_invoke;
    handler[3] = &unk_1E41E0C90;
    v19 = v3;
    v152 = v19;
    notify_register_dispatch(v16, &out_token, v17, handler);

    v20 = v3->_notificationTokens;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v20, "addObject:", v21);

    v22 = (const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.passcodechanged"), "cStringUsingEncoding:", 4);
    notificationQueue();
    v23 = objc_claimAutoreleasedReturnValue();
    v149[0] = v18;
    v149[1] = 3221225472;
    v149[2] = __27__MCProfileConnection_init__block_invoke_13;
    v149[3] = &unk_1E41E0C90;
    v24 = v19;
    v150 = v24;
    notify_register_dispatch(v22, &out_token, v23, v149);

    v25 = v3->_notificationTokens;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v25, "addObject:", v26);

    v27 = (const char *)objc_msgSend(CFSTR("PINPolicyChangedNotification"), "cStringUsingEncoding:", 4);
    notificationQueue();
    v28 = objc_claimAutoreleasedReturnValue();
    v147[0] = v18;
    v147[1] = 3221225472;
    v147[2] = __27__MCProfileConnection_init__block_invoke_14;
    v147[3] = &unk_1E41E0C90;
    v29 = v24;
    v148 = v29;
    notify_register_dispatch(v27, &out_token, v28, v147);

    v30 = v3->_notificationTokens;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v30, "addObject:", v31);

    v32 = (const char *)objc_msgSend(CFSTR("com.apple.ManagedConfiguration.profileListChanged"), "cStringUsingEncoding:", 4);
    notificationQueue();
    v33 = objc_claimAutoreleasedReturnValue();
    v145[0] = v18;
    v145[1] = 3221225472;
    v145[2] = __27__MCProfileConnection_init__block_invoke_15;
    v145[3] = &unk_1E41E0C90;
    v34 = v29;
    v146 = v34;
    notify_register_dispatch(v32, &out_token, v33, v145);

    v35 = v3->_notificationTokens;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v35, "addObject:", v36);

    v37 = (const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.settingschanged"), "cStringUsingEncoding:", 4);
    notificationQueue();
    v38 = objc_claimAutoreleasedReturnValue();
    v143[0] = v18;
    v39 = v18;
    v143[1] = 3221225472;
    v143[2] = __27__MCProfileConnection_init__block_invoke_18;
    v143[3] = &unk_1E41E0C90;
    v40 = v34;
    v144 = v40;
    notify_register_dispatch(v37, &out_token, v38, v143);

    v41 = v3->_notificationTokens;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v41, "addObject:", v42);

    v43 = (const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.effectivesettingschanged"), "cStringUsingEncoding:", 4);
    notificationQueue();
    v44 = objc_claimAutoreleasedReturnValue();
    v141[0] = v18;
    v141[1] = 3221225472;
    v141[2] = __27__MCProfileConnection_init__block_invoke_19;
    v141[3] = &unk_1E41E0C90;
    v45 = v40;
    v142 = v45;
    notify_register_dispatch(v43, &out_token, v44, v141);

    v46 = v3->_notificationTokens;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v46, "addObject:", v47);

    v48 = (const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.appwhitelistdidchange"), "UTF8String");
    notificationQueue();
    v49 = objc_claimAutoreleasedReturnValue();
    v139[0] = v18;
    v139[1] = 3221225472;
    v139[2] = __27__MCProfileConnection_init__block_invoke_21;
    v139[3] = &unk_1E41E0C90;
    v50 = v45;
    v140 = v50;
    notify_register_dispatch(v48, &out_token, v49, v139);

    v51 = v3->_notificationTokens;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v51, "addObject:", v52);

    v53 = (const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.defaultsdidchange"), "UTF8String");
    notificationQueue();
    v54 = objc_claimAutoreleasedReturnValue();
    v137[0] = v39;
    v137[1] = 3221225472;
    v137[2] = __27__MCProfileConnection_init__block_invoke_22;
    v137[3] = &unk_1E41E0C90;
    v55 = v50;
    v138 = v55;
    notify_register_dispatch(v53, &out_token, v54, v137);

    v56 = v3->_notificationTokens;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v56, "addObject:", v57);

    v58 = (const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.keyboardsettingschanged"), "UTF8String");
    notificationQueue();
    v59 = objc_claimAutoreleasedReturnValue();
    v135[0] = v39;
    v135[1] = 3221225472;
    v135[2] = __27__MCProfileConnection_init__block_invoke_23;
    v135[3] = &unk_1E41E0C90;
    v60 = v55;
    v136 = v60;
    notify_register_dispatch(v58, &out_token, v59, v135);

    v61 = v3->_notificationTokens;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v61, "addObject:", v62);

    v63 = (const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.newssettingschanged"), "UTF8String");
    notificationQueue();
    v64 = objc_claimAutoreleasedReturnValue();
    v133[0] = v39;
    v133[1] = 3221225472;
    v133[2] = __27__MCProfileConnection_init__block_invoke_24;
    v133[3] = &unk_1E41E0C90;
    v65 = v60;
    v134 = v65;
    notify_register_dispatch(v63, &out_token, v64, v133);

    v66 = v3->_notificationTokens;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v66, "addObject:", v67);

    v68 = (const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.clientrestrictionschanged"), "cStringUsingEncoding:", 4);
    notificationQueue();
    v69 = objc_claimAutoreleasedReturnValue();
    v131[0] = v39;
    v131[1] = 3221225472;
    v131[2] = __27__MCProfileConnection_init__block_invoke_25;
    v131[3] = &unk_1E41E0C90;
    v70 = v65;
    v132 = v70;
    notify_register_dispatch(v68, &out_token, v69, v131);

    v71 = v3->_notificationTokens;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v71, "addObject:", v72);

    v73 = (const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.webFilterUIActiveDidChange"), "UTF8String");
    v129[0] = v39;
    v129[1] = 3221225472;
    v129[2] = __27__MCProfileConnection_init__block_invoke_26;
    v129[3] = &unk_1E41E0C90;
    v74 = v70;
    v130 = v74;
    v75 = MEMORY[0x1E0C80D38];
    notify_register_dispatch(v73, &out_token, MEMORY[0x1E0C80D38], v129);
    v76 = v3->_notificationTokens;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v76, "addObject:", v77);

    v78 = (const char *)objc_msgSend(CFSTR("com.apple.ManagedConfiguration.managedAppsChanged"), "UTF8String");
    v127[0] = v39;
    v127[1] = 3221225472;
    v127[2] = __27__MCProfileConnection_init__block_invoke_27;
    v127[3] = &unk_1E41E0C90;
    v79 = v74;
    v128 = v79;
    notify_register_dispatch(v78, &out_token, v75, v127);

    v80 = v3->_notificationTokens;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v80, "addObject:", v81);

    v82 = (const char *)objc_msgSend(CFSTR("MCManagedBooksChanged"), "UTF8String");
    v125[0] = v39;
    v125[1] = 3221225472;
    v125[2] = __27__MCProfileConnection_init__block_invoke_28;
    v125[3] = &unk_1E41E0C90;
    v83 = v79;
    v126 = v83;
    notify_register_dispatch(v82, &out_token, v75, v125);

    v84 = v3->_notificationTokens;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v84, "addObject:", v85);

    v86 = (const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.allowpasscodemodificationchanged"), "UTF8String");
    notificationQueue();
    v87 = objc_claimAutoreleasedReturnValue();
    v123[0] = v39;
    v123[1] = 3221225472;
    v123[2] = __27__MCProfileConnection_init__block_invoke_29;
    v123[3] = &unk_1E41E0C90;
    v88 = v83;
    v124 = v88;
    notify_register_dispatch(v86, &out_token, v87, v123);

    v89 = v3->_notificationTokens;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v89, "addObject:", v90);

    v91 = (const char *)objc_msgSend(CFSTR("com.apple.ManagedConfiguration.removedSystemAppsChanged"), "UTF8String");
    v121[0] = v39;
    v121[1] = 3221225472;
    v121[2] = __27__MCProfileConnection_init__block_invoke_30;
    v121[3] = &unk_1E41E0C90;
    v92 = v88;
    v122 = v92;
    notify_register_dispatch(v91, &out_token, v75, v121);

    v93 = v3->_notificationTokens;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v93, "addObject:", v94);

    v95 = (const char *)objc_msgSend(CFSTR("com.apple.ManagedConfiguration.diagnosticsCollected"), "UTF8String");
    v119[0] = v39;
    v119[1] = 3221225472;
    v119[2] = __27__MCProfileConnection_init__block_invoke_31;
    v119[3] = &unk_1E41E0C90;
    v96 = v92;
    v120 = v96;
    notify_register_dispatch(v95, &out_token, v75, v119);

    v97 = v3->_notificationTokens;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v97, "addObject:", v98);

    v99 = (const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.allowhealthdatasubmissionchanged"), "UTF8String");
    v117[0] = v39;
    v117[1] = 3221225472;
    v117[2] = __27__MCProfileConnection_init__block_invoke_32;
    v117[3] = &unk_1E41E0C90;
    v100 = v96;
    v118 = v100;
    notify_register_dispatch(v99, &out_token, v75, v117);

    v101 = v3->_notificationTokens;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v101, "addObject:", v102);

    v103 = (const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.homescreenlayoutchanged"), "UTF8String");
    v115[0] = v39;
    v115[1] = 3221225472;
    v115[2] = __27__MCProfileConnection_init__block_invoke_33;
    v115[3] = &unk_1E41E0C90;
    v104 = v100;
    v116 = v104;
    notify_register_dispatch(v103, &out_token, v75, v115);

    v105 = v3->_notificationTokens;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v105, "addObject:", v106);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "addObserver:selector:name:object:", v104, sel__restrictionDidChange, CFSTR("com.apple.managedconfiguration.restrictionchanged"), v104);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "addObserver:selector:name:object:", v104, sel__passcodePolicyDidChange, CFSTR("PINPolicyChangedNotification"), v104);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "addObserver:selector:name:object:", v104, sel__passcodeDidChange, CFSTR("com.apple.managedconfiguration.passcodechanged"), v104);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "addObserver:selector:name:object:", v104, sel__profileListDidChange, CFSTR("com.apple.ManagedConfiguration.profileListChanged"), v104);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "addObserver:selector:name:object:", v104, sel__effectiveSettingsDidChange_, CFSTR("com.apple.managedconfiguration.effectivesettingschanged"), v104);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "addObserver:selector:name:object:", v104, sel__defaultsDidChange, CFSTR("com.apple.managedconfiguration.defaultsdidchange"), v104);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "addObserver:selector:name:object:", v104, sel__appWhitelistDidChange_, CFSTR("com.apple.managedconfiguration.appwhitelistdidchange"), v104);

  }
  return v3;
}

uint64_t __40__MCProfileConnection_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isEphemeralMultiUser
{
  return objc_msgSend(MEMORY[0x1E0D1C1E8], "isSharediPad");
}

- (BOOL)isAppManaged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  int v12;
  id v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  MCContainingBundleIDForBundleID(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D44778], "attributesByAppID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  v9 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v10 = CFSTR("NO");
    if (v8)
      v10 = CFSTR("YES");
    v12 = 138412546;
    v13 = v4;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_19ECC4000, v9, OS_LOG_TYPE_DEBUG, "isAppManaged:%@ => %@", (uint8_t *)&v12, 0x16u);
  }

  return v8;
}

- (BOOL)isBundleIDAccountBasedForDragDrop:(id)a3
{
  void *v3;
  BOOL v4;

  MCContainingBundleIDForBundleID(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MCIsAppAccountBasedForDragDrop(v3);

  return v4;
}

- (id)restrictedAppBundleIDsExcludingRemovedSystemApps
{
  void *v2;
  void *v3;
  void *v4;

  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
  {
    v2 = 0;
  }
  else
  {
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "restrictedAppBundleIDsExcludingRemovedSystemApps:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v4, "copy");

  }
  return v2;
}

- (BOOL)isNotificationsModificationAllowedForBundleID:(id)a3
{
  void *v4;

  -[MCProfileConnection restrictionEnforcedNotificationSettingsForBundleID:](self, "restrictionEnforcedNotificationSettingsForBundleID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowNotificationsModification")) != 2&& v4 == 0;
}

- (id)restrictionEnforcedNotificationSettingsForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection restrictionEnforcedNotificationSettings](self, "restrictionEnforcedNotificationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileConnection _restrictionEnforcedNotificationSettingsForBundleID:settingsArray:](self, "_restrictionEnforcedNotificationSettingsForBundleID:settingsArray:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)restrictionEnforcedNotificationSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[3];
  _QWORD v34[3];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v3 = (void *)MEMORY[0x1E0C99D20];
  MCUserNotificationSettingsFilePath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0C99D20];
    MCSystemNotificationSettingsFilePath();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithContentsOfFile:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[MCProfileConnection _notificationRestrictedApps](self, "_notificationRestrictedApps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_msgSend(v5, "mutableCopy");
    v10 = v9;
    v25 = v5;
    if (v9)
      v11 = v9;
    else
      v11 = (id)objc_opt_new();
    v12 = v11;

    v13 = (void *)MEMORY[0x1E0CB3880];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __68__MCProfileConnection_Misc__restrictionEnforcedNotificationSettings__block_invoke;
    v31[3] = &unk_1E41E3E68;
    v24 = v8;
    v14 = v8;
    v32 = v14;
    objc_msgSend(v13, "predicateWithBlock:", v31);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "filterUsingPredicate:", v15);

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v14;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v28;
      v19 = MEMORY[0x1E0C9AAA0];
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v33[0] = CFSTR("BundleIdentifier");
          v33[1] = CFSTR("NotificationsEnabled");
          v34[0] = v21;
          v34[1] = v19;
          v33[2] = CFSTR("CriticalAlertEnabled");
          v34[2] = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v22);

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v17);
    }

    v5 = (void *)objc_msgSend(v12, "copy");
    v8 = v24;
  }

  return v5;
}

- (id)restrictionEnforcedHomeScreenLayout
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v2 = (void *)MEMORY[0x1E0C99D20];
  MCUserHomeScreenLayoutFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0C99D20];
    MCSystemHomeScreenLayoutFilePath();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithContentsOfFile:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)isOpenInRestrictionInEffect
{
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (-[MCProfileConnection mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged"))
    v3 = !-[MCProfileConnection mayOpenFromUnmanagedToManaged](self, "mayOpenFromUnmanagedToManaged");
  else
    v3 = 1;
  v4 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v5 = CFSTR("NO");
    if (v3)
      v5 = CFSTR("YES");
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "isOpenInRestrictionInEffect: %@", (uint8_t *)&v7, 0xCu);
  }
  return v3;
}

- (BOOL)mayOpenFromUnmanagedToManaged
{
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveRestrictedBoolForSetting:", CFSTR("allowOpenFromUnmanagedToManaged"));

  v4 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v5 = CFSTR("NO");
    if (v3 != 2)
      v5 = CFSTR("YES");
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "mayOpenFromUnmanagedToManaged: %@", (uint8_t *)&v7, 0xCu);
  }
  return v3 != 2;
}

- (BOOL)mayOpenFromManagedToUnmanaged
{
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveRestrictedBoolForSetting:", CFSTR("allowOpenFromManagedToUnmanaged"));

  v4 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v5 = CFSTR("NO");
    if (v3 != 2)
      v5 = CFSTR("YES");
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "mayOpenFromManagedToUnmanaged: %@", (uint8_t *)&v7, 0xCu);
  }
  return v3 != 2;
}

- (BOOL)isPasscodeSet
{
  void *v2;
  char v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeSet");

  return v3;
}

- (BOOL)isExplicitContentAllowedOutAsk:(BOOL *)a3
{
  return -[MCProfileConnection effectiveBoolValueForSetting:outAsk:](self, "effectiveBoolValueForSetting:outAsk:", CFSTR("allowExplicitContent"), a3) != 2;
}

- (BOOL)isSpotlightInternetResultsAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowSpotlightInternetResults")) != 2;
}

- (BOOL)isAppClipsAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAppClips")) != 2;
}

- (id)crossSiteTrackingPreventionRelaxedDomains
{
  return -[MCProfileConnection effectiveValuesForIntersectionSetting:](self, "effectiveValuesForIntersectionSetting:", CFSTR("crossSiteTrackingPreventionRelaxedDomains"));
}

- (id)effectiveWhitelistedAppBundleIDs
{
  void *v2;
  void *v3;
  void *v4;

  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
  {
    v2 = 0;
  }
  else
  {
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "effectiveWhitelistedAppBundleIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v4, "copy");

  }
  return v2;
}

- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6
{
  -[MCProfileConnection setBoolValue:forSetting:toSystem:user:passcode:](self, "setBoolValue:forSetting:toSystem:user:passcode:", a3, a4, a5, a6, 0);
}

- (BOOL)isAutomaticAppUpdatesAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAutomaticAppUpdates")) != 2;
}

- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4
{
  -[MCProfileConnection setBoolValue:forSetting:toSystem:user:](self, "setBoolValue:forSetting:toSystem:user:", a3, a4, 1, 0);
}

- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7
{
  uint64_t v7;

  LOBYTE(v7) = 1;
  -[MCProfileConnection setBoolValue:ask:forSetting:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:](self, "setBoolValue:ask:forSetting:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:", a3, 0, a4, 0, a5, a6, a7, 0, v7, 0);
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 configurationUUID:(id)a6 toSystem:(BOOL)a7 user:(BOOL)a8 passcode:(id)a9 credentialSet:(id)a10 waitUntilCompleted:(BOOL)a11 completion:(id)a12
{
  _BOOL8 v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _BOOL4 v28;
  MCProfileConnection *v29;
  _BOOL4 v30;
  _BOOL4 v31;
  id v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  uint8_t buf[4];
  const __CFString *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v30 = a7;
  v31 = a8;
  v28 = a4;
  v13 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a12;
  v17 = a10;
  v18 = a9;
  v19 = a6;
  v29 = self;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v20 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
  {
    v21 = CFSTR("NO");
    if (v13)
      v21 = CFSTR("YES");
    *(_DWORD *)buf = 138543618;
    v37 = v21;
    v38 = 2114;
    v39 = v15;
    _os_log_impl(&dword_19ECC4000, v20, OS_LOG_TYPE_DEFAULT, "Set Bool value %{public}@ for settings: %{public}@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("value"));

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("ask"));

  }
  else
  {
    objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("ask"));
  }
  v33 = v22;
  v34 = CFSTR("restrictedBool");
  v32 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = a11;
  -[MCProfileConnection setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:](v29, "setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:", v26, v19, v30, v31, v18, v17, v27, v16);

}

- (void)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 waitUntilCompleted:(BOOL)a9 completion:(id)a10
{
  _BOOL8 v12;
  _BOOL8 v13;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;

  v12 = a6;
  v13 = a5;
  v17 = a10;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __149__MCProfileConnection_Settings__setParametersForSettingsByType_configurationUUID_toSystem_user_passcode_credentialSet_waitUntilCompleted_completion___block_invoke;
  v25[3] = &unk_1E41E3950;
  v26 = v17;
  v18 = v17;
  v19 = a8;
  v20 = a7;
  v21 = a4;
  v22 = a3;
  v23 = (void *)MEMORY[0x1A1AF040C](v25);
  LOBYTE(v24) = a9;
  -[MCProfileConnection setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:errorCompletionBlock:](self, "setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:errorCompletionBlock:", v22, v21, v13, v12, v20, v19, v24, v23);

}

- (void)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 waitUntilCompleted:(BOOL)a9 errorCompletionBlock:(id)a10
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  id v30;
  id v31;
  _BOOL4 v32;
  _BOOL4 v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v32 = a5;
  v33 = a6;
  v46 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v34 = a4;
  v31 = a7;
  v30 = a8;
  v15 = a10;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (a9)
    objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  else
    objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v15);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v18 = v14;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v41;
    v35 = v18;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v41 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(v18, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v24 = v23;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v37;
            do
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v37 != v27)
                  objc_enumerationMutation(v24);
                +[MCSignpostManager willSetFeature:](MCSignpostManager, "willSetFeature:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            }
            while (v26);
          }

          v18 = v35;
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v20);
  }

  objc_msgSend(v29, "setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:completion:", v18, v34, v32, v33, v31, v30, v15);
}

- (NSXPCConnection)xpcConnection
{
  NSObject *xpcConnectionSyncQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  xpcConnectionSyncQueue = self->_xpcConnectionSyncQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__MCProfileConnection_xpcConnection__block_invoke;
  v5[3] = &unk_1E41E0BF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(xpcConnectionSyncQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSXPCConnection *)v3;
}

- (id)effectiveValuesForIntersectionSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
  {
    v5 = 0;
  }
  else
  {
    -[MCProfileConnection effectiveParametersForIntersectionSetting:](self, "effectiveParametersForIntersectionSetting:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("values"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)effectiveParametersForIntersectionSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectiveParametersForIntersectedSetting:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isiTunesAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowiTunes")) != 2;
}

- (BOOL)isWallpaperModificationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowWallpaperModification")) != 2;
}

- (BOOL)isPasswordAutoFillAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowPasswordAutoFill")) != 2;
}

- (BOOL)isBookstoreEroticaAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowBookstoreErotica")) != 2;
}

- (BOOL)isAppRemovalAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAppRemoval")) != 2;
}

- (BOOL)isAppInstallationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAppInstallation")) != 2;
}

void __42__MCProfileConnection_publicXPCConnection__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[17];
  if (!v3)
  {
    objc_msgSend(v2, "_queueCreateAndResumePublicXPCConnection");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (void)_queueCreateAndResumePublicXPCConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *publicXPCConnection;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.managedconfiguration.profiled.public"), 4096);
  publicXPCConnection = self->_publicXPCConnection;
  self->_publicXPCConnection = v3;

  MCXPCProtocolInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_publicXPCConnection, "setRemoteObjectInterface:", v5);

  MCProfileConnectionXPCProtocolInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](self->_publicXPCConnection, "setExportedInterface:", v6);

  -[NSXPCConnection setExportedObject:](self->_publicXPCConnection, "setExportedObject:", self);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__MCProfileConnection__queueCreateAndResumePublicXPCConnection__block_invoke;
  v10[3] = &unk_1E41E0C68;
  objc_copyWeak(&v11, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_publicXPCConnection, "setInvalidationHandler:", v10);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __63__MCProfileConnection__queueCreateAndResumePublicXPCConnection__block_invoke_2;
  v8[3] = &unk_1E41E0C68;
  objc_copyWeak(&v9, &location);
  -[NSXPCConnection setInterruptionHandler:](self->_publicXPCConnection, "setInterruptionHandler:", v8);
  -[NSXPCConnection resume](self->_publicXPCConnection, "resume");
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (BOOL)isBluetoothModificationAllowed
{
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowBluetoothModification")) != 2;
}

- (int)effectiveRestrictedBoolValueForSetting:(id)a3
{
  id v4;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  LODWORD(self) = -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", v4);

  return (int)self;
}

- (void)checkInWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1A1AF040C](a3, a2);
  if (!v4)
    v4 = &__block_literal_global_52;
  v7 = v4;
  -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkInWithCompletion:", v7);

}

- (NSXPCConnection)publicXPCConnection
{
  NSObject *publicXPCConnectionSyncQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  publicXPCConnectionSyncQueue = self->_publicXPCConnectionSyncQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__MCProfileConnection_publicXPCConnection__block_invoke;
  v5[3] = &unk_1E41E0BF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(publicXPCConnectionSyncQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSXPCConnection *)v3;
}

void __36__MCProfileConnection_xpcConnection__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[18];
  if (!v3)
  {
    objc_msgSend(v2, "_queueCreateAndResumeXPCConnection");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (BOOL)isMailPrivacyProtectionAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowMailPrivacyProtection")) != 2;
}

- (int)BOOLRestrictionForFeature:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "restrictedBoolForFeature:", v4);

  return v6;
}

- (BOOL)isNetworkDriveAccessInFilesAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowFilesNetworkDriveAccess")) != 2;
}

- (BOOL)isLocalStorageAllowed
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MCUMUserManagerClass(), "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isSharedIPad"))
  {
    objc_msgSend(v2, "currentUser");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isTransientUser");

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

void __45__MCProfileConnection_checkInWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Check-in error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (BOOL)isLiveVoicemailAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowLiveVoicemail")) != 2;
}

- (BOOL)isKeyboardShortcutsAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowKeyboardShortcuts")) != 2;
}

- (BOOL)isSupervised
{
  void *v2;
  char v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSupervised");

  return v3;
}

- (void)_createAndResumeXPCConnection
{
  NSObject *xpcConnectionSyncQueue;
  _QWORD block[5];

  xpcConnectionSyncQueue = self->_xpcConnectionSyncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MCProfileConnection__createAndResumeXPCConnection__block_invoke;
  block[3] = &unk_1E41E0C18;
  block[4] = self;
  dispatch_sync(xpcConnectionSyncQueue, block);
}

uint64_t __52__MCProfileConnection__createAndResumeXPCConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queueCreateAndResumeXPCConnection");
}

- (void)_destroyXPCConnectionAndInvalidate:(BOOL)a3
{
  NSObject *xpcConnectionSyncQueue;
  _QWORD v4[5];
  BOOL v5;

  xpcConnectionSyncQueue = self->_xpcConnectionSyncQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__MCProfileConnection__destroyXPCConnectionAndInvalidate___block_invoke;
  v4[3] = &unk_1E41E0C40;
  v5 = a3;
  v4[4] = self;
  dispatch_sync(xpcConnectionSyncQueue, v4);
}

void __58__MCProfileConnection__destroyXPCConnectionAndInvalidate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 144);
  *(_QWORD *)(v2 + 144) = 0;

}

- (void)_queueCreateAndResumeXPCConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcConnection;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.managedconfiguration.profiled"), 4096);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v3;

  MCXPCProtocolInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v5);

  MCProfileConnectionXPCProtocolInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v6);

  -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__MCProfileConnection__queueCreateAndResumeXPCConnection__block_invoke;
  v10[3] = &unk_1E41E0C68;
  objc_copyWeak(&v11, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v10);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __57__MCProfileConnection__queueCreateAndResumeXPCConnection__block_invoke_1;
  v8[3] = &unk_1E41E0C68;
  objc_copyWeak(&v9, &location);
  -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v8);
  -[NSXPCConnection resume](self->_xpcConnection, "resume");
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __57__MCProfileConnection__queueCreateAndResumeXPCConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_ERROR, "XPC connection invalidated", v7, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[16];
    if (v5)
    {
      (*(void (**)(void))(v5 + 16))();
      v6 = (void *)v4[16];
      v4[16] = 0;

    }
    objc_msgSend(v4, "_destroyXPCConnectionAndInvalidate:", 0);
  }

}

void __57__MCProfileConnection__queueCreateAndResumeXPCConnection__block_invoke_1(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted", v4, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_destroyXPCConnectionAndInvalidate:", 1);

}

- (void)_createAndResumePublicXPCConnection
{
  NSObject *publicXPCConnectionSyncQueue;
  _QWORD block[5];

  publicXPCConnectionSyncQueue = self->_publicXPCConnectionSyncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MCProfileConnection__createAndResumePublicXPCConnection__block_invoke;
  block[3] = &unk_1E41E0C18;
  block[4] = self;
  dispatch_sync(publicXPCConnectionSyncQueue, block);
}

uint64_t __58__MCProfileConnection__createAndResumePublicXPCConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queueCreateAndResumePublicXPCConnection");
}

- (void)_destroyPublicXPCConnectionAndInvalidate:(BOOL)a3
{
  NSObject *publicXPCConnectionSyncQueue;
  _QWORD v4[5];
  BOOL v5;

  publicXPCConnectionSyncQueue = self->_publicXPCConnectionSyncQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__MCProfileConnection__destroyPublicXPCConnectionAndInvalidate___block_invoke;
  v4[3] = &unk_1E41E0C40;
  v5 = a3;
  v4[4] = self;
  dispatch_sync(publicXPCConnectionSyncQueue, v4);
}

void __64__MCProfileConnection__destroyPublicXPCConnectionAndInvalidate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 136);
  *(_QWORD *)(v2 + 136) = 0;

}

void __63__MCProfileConnection__queueCreateAndResumePublicXPCConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_ERROR, "Public XPC connection invalidated", v4, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_destroyPublicXPCConnectionAndInvalidate:", 0);

}

void __63__MCProfileConnection__queueCreateAndResumePublicXPCConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEFAULT, "Public XPC connection interrupted", v4, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_destroyPublicXPCConnectionAndInvalidate:", 1);

}

void __27__MCProfileConnection_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t buf[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEBUG, "Received restriction changed notification", buf, 2u);
  }
  v3 = MCIsDaemonProcess;
  v4 = qword_1ECD40B38;
  v5 = os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "Not invalidating cache because we're running inside profiled.", v9, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "Invalidating cache", v8, 2u);
    }
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateRestrictions");

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("com.apple.managedconfiguration.restrictionchanged"), *(_QWORD *)(a1 + 32));

}

void __27__MCProfileConnection_init__block_invoke_13(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEBUG, "Received passcode changed notification", v4, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.managedconfiguration.passcodechanged"), *(_QWORD *)(a1 + 32));

}

void __27__MCProfileConnection_init__block_invoke_14(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEBUG, "Received passcode policy changed notification", v4, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PINPolicyChangedNotification"), *(_QWORD *)(a1 + 32));

}

void __27__MCProfileConnection_init__block_invoke_15(uint64_t a1)
{
  NSObject *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t buf[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEBUG, "Received profile list changed notification", buf, 2u);
  }
  v3 = MCIsDaemonProcess;
  v4 = qword_1ECD40B38;
  v5 = os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "Not invalidating caches because we're running inside profiled.", v16, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "Invalidating caches", v15, 2u);
    }
    +[MCDependencyReader sharedReader](MCDependencyReader, "sharedReader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateCache");

    +[MCManifest sharedManifest](MCManifest, "sharedManifest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidateCache");

    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidateRestrictions");

    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidateSettings");

  }
  v10 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_DEBUG, "Sending out a localized restriction source notification!", v14, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("com.apple.ManagedConfiguration.profileListChanged"), *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("com.apple.ManagedConfiguration.localizedRestrictionSourceDescriptionDidChange"), *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:", CFSTR("com.apple.ManagedConfiguration.localizedCertificateSourceDescriptionDidChange"), *(_QWORD *)(a1 + 32));

}

void __27__MCProfileConnection_init__block_invoke_18(uint64_t a1)
{
  NSObject *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t buf[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEBUG, "Received settings changed notification", buf, 2u);
  }
  v3 = MCIsDaemonProcess;
  v4 = qword_1ECD40B38;
  v5 = os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "Not invalidating cache because we're running inside profiled.", v9, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "Invalidating cache", v8, 2u);
    }
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateSettings");

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("com.apple.managedconfiguration.settingschanged"), *(_QWORD *)(a1 + 32));

}

void __27__MCProfileConnection_init__block_invoke_19(uint64_t a1, int a2)
{
  NSObject *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "Received effective settings changed notification", (uint8_t *)&v13, 2u);
  }
  v5 = MCIsDaemonProcess;
  v6 = qword_1ECD40B38;
  v7 = os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_DEBUG, "Not invalidating cache because we're running inside profiled.", (uint8_t *)&v13, 2u);
    }
  }
  else
  {
    if (v7)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_DEBUG, "Invalidating cache", (uint8_t *)&v13, 2u);
    }
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidateSettings");

  }
  v13 = 0;
  notify_get_state(a2, &v13);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v14 = CFSTR("senderPID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("com.apple.managedconfiguration.effectivesettingschanged"), v10, v12);

}

void __27__MCProfileConnection_init__block_invoke_21(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEBUG, "Received app allow list did changed notification", v5, 2u);
  }
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearEffectiveWhitelistedAppsAndOptionsCache");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("com.apple.managedconfiguration.appwhitelistdidchange"), *(_QWORD *)(a1 + 32));

}

void __27__MCProfileConnection_init__block_invoke_22(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEBUG, "Received defaults did changed notification", v4, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.managedconfiguration.defaultsdidchange"), *(_QWORD *)(a1 + 32));

}

void __27__MCProfileConnection_init__block_invoke_23(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEBUG, "Received keyboard settings changed notification", v4, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.managedconfiguration.keyboardsettingschanged"), *(_QWORD *)(a1 + 32));

}

void __27__MCProfileConnection_init__block_invoke_24(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEBUG, "Received news settings changed notification", v4, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.managedconfiguration.newssettingschanged"), *(_QWORD *)(a1 + 32));

}

void __27__MCProfileConnection_init__block_invoke_25(uint64_t a1)
{
  NSObject *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEBUG, "Received client restrictions changed notification", buf, 2u);
  }
  v3 = MCIsDaemonProcess;
  v4 = qword_1ECD40B38;
  v5 = os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "Not invalidating caches because we're running inside profiled.", v12, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "Invalidating caches", v11, 2u);
    }
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateRestrictions");

    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidateSettings");

  }
  v8 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_DEBUG, "Sending out a localized restriction source notification!", v10, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("com.apple.ManagedConfiguration.localizedRestrictionSourceDescriptionDidChange"), *(_QWORD *)(a1 + 32));

}

void __27__MCProfileConnection_init__block_invoke_26(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEBUG, "Received web filter UI active did changed notification", v4, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.managedconfiguration.webFilterUIActiveDidChange"), *(_QWORD *)(a1 + 32));

}

void __27__MCProfileConnection_init__block_invoke_27(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEBUG, "Received managed apps changed notification", v4, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.ManagedConfiguration.managedAppsChanged"), *(_QWORD *)(a1 + 32));

}

void __27__MCProfileConnection_init__block_invoke_28(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEBUG, "Received managed books changed notification", v4, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MCManagedBooksChanged"), *(_QWORD *)(a1 + 32));

}

void __27__MCProfileConnection_init__block_invoke_29(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEBUG, "Received allow passcode modification changed notification", v4, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.managedconfiguration.allowpasscodemodificationchanged"), *(_QWORD *)(a1 + 32));

}

void __27__MCProfileConnection_init__block_invoke_30(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEBUG, "Received removed system apps changed notification", v4, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.ManagedConfiguration.removedSystemAppsChanged"), *(_QWORD *)(a1 + 32));

}

void __27__MCProfileConnection_init__block_invoke_31(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEBUG, "Received diagnostics collected notification", v4, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.ManagedConfiguration.diagnosticsCollected"), *(_QWORD *)(a1 + 32));

}

void __27__MCProfileConnection_init__block_invoke_32(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEBUG, "Received allow health data submission changed notification", v4, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.managedconfiguration.allowhealthdatasubmissionchanged"), *(_QWORD *)(a1 + 32));

}

void __27__MCProfileConnection_init__block_invoke_33(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEBUG, "Received home screen layout changed notification", v4, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.managedconfiguration.homescreenlayoutchanged"), *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", 0);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  -[NSXPCConnection setInvalidationHandler:](self->_publicXPCConnection, "setInvalidationHandler:", 0);
  -[NSXPCConnection invalidate](self->_publicXPCConnection, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_notificationTokens;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        notify_cancel(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "intValue"));
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)MCProfileConnection;
  -[MCProfileConnection dealloc](&v9, sel_dealloc);
}

- (void)checkIn
{
  void *v2;
  id v3;

  -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "checkInWithCompletion:", &__block_literal_global_2);

}

void __30__MCProfileConnection_checkIn__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Check-in error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)checkInAsynchronously
{
  void *v2;
  id v3;

  -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_53);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "checkInWithCompletion:", &__block_literal_global_53);

}

void __44__MCProfileConnection_checkInAsynchronously__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Check-in async error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)_applyToObservers:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *notificationSyncQueue;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD block[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  notificationSyncQueue = self->_notificationSyncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MCProfileConnection__applyToObservers___block_invoke;
  block[3] = &unk_1E41E0CF8;
  block[4] = self;
  block[5] = &v18;
  dispatch_sync(notificationSyncQueue, block);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (id)v19[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
  v8 = v7;
  if (v7)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1A1AF0250](v7);
        v4[2](v4, v11);
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
      v8 = v7;
    }
    while (v7);
  }

  _Block_object_dispose(&v18, 8);
}

void __41__MCProfileConnection__applyToObservers___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_restrictionDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MCProfileConnection__restrictionDidChange__block_invoke;
  block[3] = &unk_1E41E0C18;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __44__MCProfileConnection__restrictionDidChange__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__MCProfileConnection__restrictionDidChange__block_invoke_2;
  v3[3] = &unk_1E41E0D20;
  v3[4] = v1;
  return objc_msgSend(v1, "_applyToObservers:", v3);
}

void __44__MCProfileConnection__restrictionDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "profileConnectionDidReceiveRestrictionChangedNotification:userInfo:", *(_QWORD *)(a1 + 32), 0);

}

- (void)_passcodeDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MCProfileConnection__passcodeDidChange__block_invoke;
  block[3] = &unk_1E41E0C18;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __41__MCProfileConnection__passcodeDidChange__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__MCProfileConnection__passcodeDidChange__block_invoke_2;
  v3[3] = &unk_1E41E0D20;
  v3[4] = v1;
  return objc_msgSend(v1, "_applyToObservers:", v3);
}

void __41__MCProfileConnection__passcodeDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "profileConnectionDidReceivePasscodeChangedNotification:userInfo:", *(_QWORD *)(a1 + 32), 0);

}

- (void)_passcodePolicyDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MCProfileConnection__passcodePolicyDidChange__block_invoke;
  block[3] = &unk_1E41E0C18;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __47__MCProfileConnection__passcodePolicyDidChange__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__MCProfileConnection__passcodePolicyDidChange__block_invoke_2;
  v3[3] = &unk_1E41E0D20;
  v3[4] = v1;
  return objc_msgSend(v1, "_applyToObservers:", v3);
}

void __47__MCProfileConnection__passcodePolicyDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "profileConnectionDidReceivePasscodePolicyChangedNotification:userInfo:", *(_QWORD *)(a1 + 32), 0);

}

- (void)_profileListDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MCProfileConnection__profileListDidChange__block_invoke;
  block[3] = &unk_1E41E0C18;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __44__MCProfileConnection__profileListDidChange__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__MCProfileConnection__profileListDidChange__block_invoke_2;
  v3[3] = &unk_1E41E0D20;
  v3[4] = v1;
  return objc_msgSend(v1, "_applyToObservers:", v3);
}

void __44__MCProfileConnection__profileListDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "profileConnectionDidReceiveProfileListChangedNotification:userInfo:", *(_QWORD *)(a1 + 32), 0);

}

- (void)_appWhitelistDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MCProfileConnection__appWhitelistDidChange___block_invoke;
  block[3] = &unk_1E41E0C18;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __46__MCProfileConnection__appWhitelistDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__MCProfileConnection__appWhitelistDidChange___block_invoke_2;
  v3[3] = &unk_1E41E0D20;
  v3[4] = v1;
  return objc_msgSend(v1, "_applyToObservers:", v3);
}

void __46__MCProfileConnection__appWhitelistDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "profileConnectionDidReceiveAppWhitelistChangedNotification:userInfo:", *(_QWORD *)(a1 + 32), 0);

}

- (void)_defaultsDidChange
{
  -[MCProfileConnection performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__internalDefaultsDidChange, 0, 0);
}

- (void)_internalDefaultsDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__MCProfileConnection__internalDefaultsDidChange__block_invoke;
  v2[3] = &unk_1E41E0D20;
  v2[4] = self;
  -[MCProfileConnection _applyToObservers:](self, "_applyToObservers:", v2);
}

void __49__MCProfileConnection__internalDefaultsDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "profileConnectionDidReceiveDefaultsChangedNotification:userInfo:", *(_QWORD *)(a1 + 32), 0);

}

- (void)_effectiveSettingsDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__MCProfileConnection__effectiveSettingsDidChange___block_invoke;
  v6[3] = &unk_1E41E0D70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __51__MCProfileConnection__effectiveSettingsDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51__MCProfileConnection__effectiveSettingsDidChange___block_invoke_2;
  v2[3] = &unk_1E41E0D48;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_applyToObservers:", v2);

}

void __51__MCProfileConnection__effectiveSettingsDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "profileConnectionDidReceiveEffectiveSettingsChangedNotification:userInfo:", v3, v4);

  }
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *notificationSyncQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  notificationSyncQueue = self->_notificationSyncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MCProfileConnection_unregisterObserver___block_invoke;
  block[3] = &unk_1E41E0D70;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(notificationSyncQueue, block);

}

uint64_t __42__MCProfileConnection_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_publicXPCConnection, 0);
  objc_storeStrong(&self->xpcConnectionInvalidatedActionBlock, 0);
  objc_storeStrong(&self->waitForEnrollmentCompletionBlock, 0);
  objc_storeStrong(&self->showWarningsReplyBlock, 0);
  objc_storeStrong(&self->passcodeReplyBlock, 0);
  objc_storeStrong(&self->restoreReplyBlock, 0);
  objc_storeStrong(&self->MAIDSignInReplyBlock, 0);
  objc_storeStrong(&self->userInputReplyBlock, 0);
  objc_storeStrong((id *)&self->_notificationTokens, 0);
  objc_storeStrong((id *)&self->_shutDownSerialQueue, 0);
  objc_storeStrong((id *)&self->_publicXPCConnectionSyncQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnectionSyncQueue, 0);
  objc_storeStrong((id *)&self->_notificationSyncQueue, 0);
  objc_storeStrong((id *)&self->_originalProfileData, 0);
  objc_storeStrong((id *)&self->_preflightResponse, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (id)activeClassroomRoles
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[MCProfileConnection effectiveValuesForIntersectionSetting:](self, "effectiveValuesForIntersectionSetting:", CFSTR("classroomRoles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setActiveClassroomRoles:(id)a3
{
  id v4;

  objc_msgSend(a3, "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MCProfileConnection setValues:forIntersectionSetting:toSystem:user:](self, "setValues:forIntersectionSetting:toSystem:user:", v4, CFSTR("classroomRoles"), 0, 1);

}

- (void)addActiveClassroomRole:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MCProfileConnection activeClassroomRoles](self, "activeClassroomRoles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addObject:", v4);
  -[MCProfileConnection setActiveClassroomRoles:](self, "setActiveClassroomRoles:", v6);

}

- (void)removeActiveClassroomRole:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MCProfileConnection activeClassroomRoles](self, "activeClassroomRoles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObject:", v4);
  -[MCProfileConnection setActiveClassroomRoles:](self, "setActiveClassroomRoles:", v6);

}

- (BOOL)isClassroomStudentRoleEnabled
{
  void *v2;
  char v3;

  -[MCProfileConnection activeClassroomRoles](self, "activeClassroomRoles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("student"));

  return v3;
}

- (void)setClassroomStudentRoleEnabled:(BOOL)a3
{
  if (a3)
    -[MCProfileConnection addActiveClassroomRole:](self, "addActiveClassroomRole:", CFSTR("student"));
  else
    -[MCProfileConnection removeActiveClassroomRole:](self, "removeActiveClassroomRole:", CFSTR("student"));
}

- (BOOL)isClassroomInstructorRoleEnabled
{
  void *v2;
  char v3;

  -[MCProfileConnection activeClassroomRoles](self, "activeClassroomRoles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("instructor"));

  return v3;
}

- (void)setClassroomInstructorRoleEnabled:(BOOL)a3
{
  if (a3)
    -[MCProfileConnection addActiveClassroomRole:](self, "addActiveClassroomRole:", CFSTR("instructor"));
  else
    -[MCProfileConnection removeActiveClassroomRole:](self, "removeActiveClassroomRole:", CFSTR("instructor"));
}

- (BOOL)isClassroomEnabled
{
  void *v2;
  char v3;

  -[MCProfileConnection activeClassroomRoles](self, "activeClassroomRoles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "containsObject:", CFSTR("instructor")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "containsObject:", CFSTR("student"));

  return v3;
}

- (BOOL)isClassroomUnpromptedScreenObservationForced
{
  int v3;

  v3 = -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("forceClassroomUnpromptedScreenObservation"));
  if (v3 != 1)
    LOBYTE(v3) = -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("forceUnpromptedManagedClassroomScreenObservation")) == 1;
  return v3;
}

- (BOOL)isClassroomAutomaticClassJoiningForced
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("forceClassroomAutomaticallyJoinClasses")) == 1;
}

- (BOOL)isClassroomUnpromptedAppAndDeviceLockForced
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("forceClassroomUnpromptedAppAndDeviceLock")) == 1;
}

- (BOOL)isClassroomRequestPermissionToLeaveClassesForced
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("forceClassroomRequestPermissionToLeaveClasses")) == 1;
}

- (int)restrictedBoolValueForFeature:(id)a3
{
  id v4;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  LODWORD(self) = -[MCProfileConnection BOOLRestrictionForFeature:](self, "BOOLRestrictionForFeature:", v4);

  return (int)self;
}

- (id)valueForFeature:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection valueRestrictionForFeature:](self, "valueRestrictionForFeature:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)installedMDMProfileIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection unverifiedInstalledMDMProfileIdentifier](self, "unverifiedInstalledMDMProfileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__7;
    v24 = __Block_byref_object_dispose__7;
    v25 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__7;
    v18 = __Block_byref_object_dispose__7;
    v19 = 0;
    -[MCProfileConnection xpcConnection](self, "xpcConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__MCProfileConnection_Profiles__installedMDMProfileIdentifier__block_invoke;
    v13[3] = &unk_1E41E38D8;
    v13[4] = &v14;
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __62__MCProfileConnection_Profiles__installedMDMProfileIdentifier__block_invoke_2;
    v12[3] = &unk_1E41E3900;
    v12[4] = &v14;
    v12[5] = &v20;
    objc_msgSend(v6, "verifiedMDMProfileIdentifierWithCompletion:", v12);

    if (v15[5])
    {
      v7 = (id)qword_1ECD40B38;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v15[5], "MCVerboseDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v8;
        _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_ERROR, "MDM profile installation check failed with error: %{public}@", buf, 0xCu);

      }
      v9 = (void *)v21[5];
      if (!v9)
        v9 = v3;
    }
    else
    {
      v9 = (void *)v21[5];
    }
    v10 = v9;
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __62__MCProfileConnection_Profiles__installedMDMProfileIdentifier__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __62__MCProfileConnection_Profiles__installedMDMProfileIdentifier__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)unverifiedInstalledMDMProfileIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99D80];
  MDMFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D448D0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)installedProfileIdentifiers
{
  void *v2;
  void *v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCManifest sharedManifest](MCManifest, "sharedManifest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allInstalledProfileIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)uninstalledProfileIdentifiersForDevice:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCHoldingTankManifest sharedManifest](MCHoldingTankManifest, "sharedManifest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uninstalledProfileIdentifiersForDevice:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)installedProfileIdentifiersInstalledBy:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v16 = (void *)objc_opt_new();
  -[MCProfileConnection installedProfileIdentifiers](self, "installedProfileIdentifiers");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1A1AF0250]();
        +[MCManifest sharedManifest](MCManifest, "sharedManifest");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "installedProfileWithIdentifier:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v11, "installOptions");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", CFSTR("installedBy"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13 && objc_msgSend(v13, "isEqualToString:", v17))
            objc_msgSend(v16, "addObject:", v8);

        }
        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  v14 = (void *)objc_msgSend(v16, "copy");
  return v14;
}

- (id)installedProfilesInstalledBy:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v17 = (void *)objc_opt_new();
  -[MCProfileConnection installedProfileIdentifiers](self, "installedProfileIdentifiers");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1A1AF0250]();
        +[MCManifest sharedManifest](MCManifest, "sharedManifest");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "installedProfileWithIdentifier:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v12, "installOptions");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", CFSTR("installedBy"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 && objc_msgSend(v14, "isEqualToString:", v18))
            objc_msgSend(v17, "addObject:", v12);

        }
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v15 = (void *)objc_msgSend(v17, "copy");
  return v15;
}

- (id)installedProfileIdentifiersWithFilterFlags:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  int v16;
  int v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v3 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCManifest sharedManifest](MCManifest, "sharedManifest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifiersOfProfilesWithFilterFlags:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v3 & 0x24) != 0)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1A1AF0250]();
          +[MCManifest sharedManifest](MCManifest, "sharedManifest");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "installedProfileWithIdentifier:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
              && (v15 = objc_msgSend(v14, "isMDMProfile"), (v3 & 0x40) != 0)
              && (v15 & 1) != 0
              || ((v16 = objc_msgSend(v14, "isManagedByMDM"), (v3 & 0x20) == 0) ? (v17 = 1) : (v17 = v16),
                  (v16 & (v3 >> 2) & 1) == 0 && v17))
            {
              objc_msgSend(v19, "addObject:", v11);
            }
          }

          objc_autoreleasePoolPop(v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

    v5 = (void *)objc_msgSend(v19, "copy");
  }
  return v5;
}

- (id)installedProfilesWithFilterFlags:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  int v19;
  BOOL v20;
  BOOL v21;
  const __CFString *v23;
  void *v24;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v3 = *(_QWORD *)&a3;
  v32 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if ((v3 & 4) != 0)
  {
    -[MCProfileConnection unverifiedInstalledMDMProfileIdentifier](self, "unverifiedInstalledMDMProfileIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
  -[MCProfileConnection installedProfileIdentifiersWithFilterFlags:](self, "installedProfileIdentifiersWithFilterFlags:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    v23 = CFSTR("managingProfileIdentifier");
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1A1AF0250]();
        +[MCManifest sharedManifest](MCManifest, "sharedManifest");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "installedProfileWithIdentifier:filterFlags:", v10, v3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          if ((v3 & 4) == 0)
            goto LABEL_11;
          objc_msgSend(v13, "managingProfileIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            v16 = v14;
          }
          else
          {
            objc_msgSend(v13, "installOptions");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKey:", v23);
            v16 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_opt_class();
          v18 = (objc_opt_isKindOfClass() & 1) != 0 ? objc_msgSend(v13, "isMDMProfile") : 0;
          v19 = objc_msgSend(v24, "isEqualToString:", v16, v23);
          v20 = (v3 & 0x40) == 0 || v18 == 0;
          v21 = v20;

          if (!v19 || !v21)
LABEL_11:
            objc_msgSend(v25, "addObject:", v13, v23);
        }

        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v7);
  }

  return v25;
}

- (id)installedConfigurationProfileInfoWithOutMDMProfileInfo:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  MCProfileInfo *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MCProfileInfo *v14;
  void *v15;
  void *v16;
  id v17;
  MCProfileInfo *v18;
  id v19;
  void *v20;
  void *v21;
  MCProfileInfo *v22;
  void *v23;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection unverifiedInstalledMDMProfileIdentifier](self, "unverifiedInstalledMDMProfileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileConnection installedProfileIdentifiersWithFilterFlags:](self, "installedProfileIdentifiersWithFilterFlags:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = v5;
  v28 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  v7 = 0;
  if (v28)
  {
    v8 = *(_QWORD *)v31;
    v27 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1A1AF0250]();
        +[MCManifest sharedManifest](MCManifest, "sharedManifest");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "installedProfileWithIdentifier:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v29 = v11;
          v14 = -[MCProfileInfo initWithProfile:]([MCProfileInfo alloc], "initWithProfile:", v13);
          objc_msgSend(v13, "managingProfileIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            v17 = v15;
          }
          else
          {
            objc_msgSend(v13, "installOptions");
            v18 = v7;
            v19 = v6;
            v20 = v4;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKey:", CFSTR("managingProfileIdentifier"));
            v17 = (id)objc_claimAutoreleasedReturnValue();

            v4 = v20;
            v6 = v19;
            v7 = v18;
            v8 = v27;
          }

          if (objc_msgSend(v10, "isEqualToString:", v4))
          {
            v22 = v14;

            v7 = v22;
            v11 = v29;
          }
          else
          {
            v11 = v29;
            if ((objc_msgSend(v4, "isEqualToString:", v17) & 1) == 0)
              objc_msgSend(v26, "addObject:", v14);
          }

        }
        objc_autoreleasePoolPop(v11);
      }
      v28 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v28);
  }

  if (a3)
    *a3 = objc_retainAutorelease(v7);
  v23 = (void *)objc_msgSend(v26, "copy");

  return v23;
}

- (id)installedProfileWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCManifest installedProfileWithIdentifier:](MCManifest, "installedProfileWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)installedSystemProfileWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCManifest installedSystemProfileWithIdentifier:](MCManifest, "installedSystemProfileWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)installedUserProfileWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCManifest installedUserProfileWithIdentifier:](MCManifest, "installedUserProfileWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isProfileInstalledWithIdentifier:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  v19 = 0;
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__MCProfileConnection_Profiles__isProfileInstalledWithIdentifier_outError___block_invoke;
  v13[3] = &unk_1E41E38D8;
  v13[4] = &v14;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __75__MCProfileConnection_Profiles__isProfileInstalledWithIdentifier_outError___block_invoke_7;
  v12[3] = &unk_1E41E3928;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v9, "isProfileInstalledWithIdentifier:completion:", v6, v12);
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v10 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __75__MCProfileConnection_Profiles__isProfileInstalledWithIdentifier_outError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Cannot query if a profile is installed. Error: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __75__MCProfileConnection_Profiles__isProfileInstalledWithIdentifier_outError___block_invoke_7(uint64_t a1, void *a2, char a3)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;

}

- (void)isProfileInstalledWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__MCProfileConnection_Profiles__isProfileInstalledWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E41E3950;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __77__MCProfileConnection_Profiles__isProfileInstalledWithIdentifier_completion___block_invoke_9;
  v13[3] = &unk_1E41E3978;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "isProfileInstalledWithIdentifier:completion:", v7, v13);

}

void __77__MCProfileConnection_Profiles__isProfileInstalledWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Cannot query if a profile is installed. Error: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id, _QWORD))(v5 + 16))(v5, v3, 0);

}

uint64_t __77__MCProfileConnection_Profiles__isProfileInstalledWithIdentifier_completion___block_invoke_9(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)installedProfileDataWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCManifest installedProfileDataWithIdentifier:](MCManifest, "installedProfileDataWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)installedSystemProfileDataWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCManifest installedSystemProfileDataWithIdentifier:](MCManifest, "installedSystemProfileDataWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)installedUserProfileDataWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCManifest installedUserProfileDataWithIdentifier:](MCManifest, "installedUserProfileDataWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)uninstalledProfileDataWithIdentifier:(id)a3 targetDevice:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCHoldingTankManifest sharedManifest](MCHoldingTankManifest, "sharedManifest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uninstalledProfileDataWithIdentifier:targetDevice:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isProfileWithIdentifier:(id)a3 managedByProfileWithIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[MCDependencyReader sharedReader](MCDependencyReader, "sharedReader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dependentsOfParent:inDomain:", v5, CFSTR("ManagingProfileToManagedProfile"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "containsObject:", v6);
  return (char)v7;
}

- (void)allProfilesOutMDMProfileInfo:(id *)a3 outConfigurationProfilesInfo:(id *)a4 outUninstalledProfilesInfo:(id *)a5 forDeviceType:(unint64_t)a6
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  MCProfileInfo *v24;
  id v25;
  void *v26;
  id *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection installedConfigurationProfileInfoWithOutMDMProfileInfo:](self, "installedConfigurationProfileInfoWithOutMDMProfileInfo:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a4)
    *a4 = objc_retainAutorelease(v11);
  if (a5)
  {
    v26 = v12;
    v27 = a5;
    +[MCHoldingTankManifest sharedManifest](MCHoldingTankManifest, "sharedManifest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileConnection uninstalledProfileIdentifiersForDevice:](self, "uninstalledProfileIdentifiersForDevice:", a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v20);
          v22 = (void *)MEMORY[0x1A1AF0250]();
          objc_msgSend(v13, "uninstalledProfileWithIdentifier:targetDevice:", v21, a6);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v24 = -[MCProfileInfo initWithProfile:]([MCProfileInfo alloc], "initWithProfile:", v23);
            objc_msgSend(v15, "addObject:", v24);

          }
          objc_autoreleasePoolPop(v22);
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v18);
    }

    v25 = objc_retainAutorelease(v15);
    *v27 = v25;

    v12 = v26;
  }

}

- (id)popProfileDataFromHeadOfInstallationQueue
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  v13 = 0;
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_29);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__MCProfileConnection_Profiles__popProfileDataFromHeadOfInstallationQueue__block_invoke_11;
  v7[3] = &unk_1E41E39A0;
  v7[4] = &v8;
  objc_msgSend(v4, "popProfileDataFromHeadOfInstallationQueueWithCompletion:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __74__MCProfileConnection_Profiles__popProfileDataFromHeadOfInstallationQueue__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Pop profile data error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __74__MCProfileConnection_Profiles__popProfileDataFromHeadOfInstallationQueue__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Pop profile data error. Error: %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (id)peekProfileDataFromPurgatoryForDeviceType:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__7;
  v14 = __Block_byref_object_dispose__7;
  v15 = 0;
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_13_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__MCProfileConnection_Profiles__peekProfileDataFromPurgatoryForDeviceType___block_invoke_14;
  v9[3] = &unk_1E41E39A0;
  v9[4] = &v10;
  objc_msgSend(v6, "peekProfileDataFromPurgatoryForDeviceType:withCompletion:", a3, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __75__MCProfileConnection_Profiles__peekProfileDataFromPurgatoryForDeviceType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Peek profile data from Purgatory error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __75__MCProfileConnection_Profiles__peekProfileDataFromPurgatoryForDeviceType___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Peek profile data from Purgatory error. Error: %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (id)_handleQueueProfileError:(id)a3 targetDevice:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[MCUserNotificationManager sharedManager](MCUserNotificationManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayQueueProfileError:targetDevice:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "code") == 4036)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      objc_msgSend(v5, "MCVerboseDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_ERROR, "Profile data failed to queue with error: %{public}@", (uint8_t *)&v13, 0xCu);

    }
    v8 = v7;
  }

  return v8;
}

- (void)_queueDataForAcceptance:(id)a3 originalFileName:(id)a4 originatingBundleID:(id)a5 transitionToUI:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v8 = a6;
  v12 = a5;
  v13 = a7;
  v14 = a4;
  v15 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection checkApplicationIdentifierEntitlement](self, "checkApplicationIdentifierEntitlement");
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bundleIdentifier");
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __120__MCProfileConnection_Profiles___queueDataForAcceptance_originalFileName_originatingBundleID_transitionToUI_completion___block_invoke;
  v25[3] = &unk_1E41E39C8;
  v18 = v13;
  v25[4] = self;
  v26 = v18;
  v19 = (void *)MEMORY[0x1A1AF040C](v25);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __120__MCProfileConnection_Profiles___queueDataForAcceptance_originalFileName_originatingBundleID_transitionToUI_completion___block_invoke_2;
  v23[3] = &unk_1E41E39F0;
  v23[4] = self;
  v24 = v18;
  v22 = v18;
  objc_msgSend(v21, "queueProfileDataForInstallation:originalFileName:originatingBundleID:transitionToUI:completion:", v15, v14, v12, v8, v23);

}

void __120__MCProfileConnection_Profiles___queueDataForAcceptance_originalFileName_originatingBundleID_transitionToUI_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_handleQueueProfileError:targetDevice:", a2, 99);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

}

void __120__MCProfileConnection_Profiles___queueDataForAcceptance_originalFileName_originatingBundleID_transitionToUI_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;

  v8 = a2;
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleQueueProfileError:targetDevice:", a4, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_queueDataForAcceptance:(id)a3 originalFileName:(id)a4 originatingBundleID:(id)a5 transitionToUI:(BOOL)a6 outError:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  _QWORD v25[7];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection checkApplicationIdentifierEntitlement](self, "checkApplicationIdentifierEntitlement");
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__7;
  v41 = __Block_byref_object_dispose__7;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__7;
  v35 = __Block_byref_object_dispose__7;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  v16 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __118__MCProfileConnection_Profiles___queueDataForAcceptance_originalFileName_originatingBundleID_transitionToUI_outError___block_invoke;
  v26[3] = &unk_1E41E38D8;
  v26[4] = &v31;
  v17 = (void *)MEMORY[0x1A1AF040C](v26);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  v25[1] = 3221225472;
  v25[2] = __118__MCProfileConnection_Profiles___queueDataForAcceptance_originalFileName_originatingBundleID_transitionToUI_outError___block_invoke_2;
  v25[3] = &unk_1E41E3A18;
  v25[4] = &v37;
  v25[5] = &v31;
  v25[6] = &v27;
  objc_msgSend(v19, "queueProfileDataForInstallation:originalFileName:originatingBundleID:transitionToUI:completion:", v12, v13, v14, v8, v25);

  v20 = v32[5];
  if (v20)
  {
    -[MCProfileConnection _handleQueueProfileError:targetDevice:](self, "_handleQueueProfileError:targetDevice:", v20, v28[3]);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v32[5];
    v32[5] = v21;

    if (a7)
      *a7 = objc_retainAutorelease((id)v32[5]);
  }
  v23 = (id)v38[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return v23;
}

void __118__MCProfileConnection_Profiles___queueDataForAcceptance_originalFileName_originatingBundleID_transitionToUI_outError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __118__MCProfileConnection_Profiles___queueDataForAcceptance_originalFileName_originatingBundleID_transitionToUI_outError___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v7 = a2;
  v8 = a4;
  v9 = *(_QWORD *)(a1[4] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v14 = v7;

  v11 = *(_QWORD *)(a1[5] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;
  v13 = v8;

  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
}

- (void)queueFileDataForAcceptance:(id)a3 originalFileName:(id)a4 forBundleID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection _queueDataForAcceptance:originalFileName:originatingBundleID:transitionToUI:completion:](self, "_queueDataForAcceptance:originalFileName:originatingBundleID:transitionToUI:completion:", v13, v12, v11, 1, v10);

}

- (id)queueFileDataForAcceptance:(id)a3 originalFileName:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection _queueDataForAcceptance:originalFileName:originatingBundleID:transitionToUI:outError:](self, "_queueDataForAcceptance:originalFileName:originatingBundleID:transitionToUI:outError:", v9, v8, 0, 1, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)queueFileDataForAcceptance:(id)a3 originalFileName:(id)a4 forBundleID:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection _queueDataForAcceptance:originalFileName:originatingBundleID:transitionToUI:outError:](self, "_queueDataForAcceptance:originalFileName:originatingBundleID:transitionToUI:outError:", v12, v11, v10, 1, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)installProfileData:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection installProfileData:options:outError:](self, "installProfileData:options:outError:", v6, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)installProfileData:(id)a3 options:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection checkApplicationIdentifierEntitlement](self, "checkApplicationIdentifierEntitlement");
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__7;
  v28 = __Block_byref_object_dispose__7;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__7;
  v22 = __Block_byref_object_dispose__7;
  v10 = MEMORY[0x1E0C809B0];
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__MCProfileConnection_Profiles__installProfileData_options_outError___block_invoke;
  v17[3] = &unk_1E41E38D8;
  v17[4] = &v18;
  v11 = (void *)MEMORY[0x1A1AF040C](v17);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __69__MCProfileConnection_Profiles__installProfileData_options_outError___block_invoke_18;
  v16[3] = &unk_1E41E3A40;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend(v13, "installProfileData:interactive:options:completion:", v8, 0, v9, v16);

  if (a5)
    *a5 = objc_retainAutorelease((id)v19[5]);
  v14 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __69__MCProfileConnection_Profiles__installProfileData_options_outError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Install profile data connection error. Error: %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __69__MCProfileConnection_Profiles__installProfileData_options_outError___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Install profile data error. Error: %{public}@", (uint8_t *)&v15, 0xCu);

    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;
  v12 = v6;

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v5;

}

- (id)appleConnect_installMDMAssociatedProfileData:(id)a3 outError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[6];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection checkApplicationIdentifierEntitlement](self, "checkApplicationIdentifierEntitlement");
  -[MCProfileConnection installedMDMProfileIdentifier](self, "installedMDMProfileIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isInstalledByMDM"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("managingProfileIdentifier"));
    v16 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_19ECC4000, v16, OS_LOG_TYPE_INFO, "AppleConnect installing MDM-associated profile data with options: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__7;
    v35 = __Block_byref_object_dispose__7;
    v36 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__7;
    v30 = __Block_byref_object_dispose__7;
    v17 = MEMORY[0x1E0C809B0];
    v31 = 0;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __87__MCProfileConnection_Profiles__appleConnect_installMDMAssociatedProfileData_outError___block_invoke;
    v25[3] = &unk_1E41E38D8;
    v25[4] = &v26;
    v18 = (void *)MEMORY[0x1A1AF040C](v25);
    -[MCProfileConnection xpcConnection](self, "xpcConnection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __87__MCProfileConnection_Profiles__appleConnect_installMDMAssociatedProfileData_outError___block_invoke_23;
    v24[3] = &unk_1E41E3A40;
    v24[4] = &v26;
    v24[5] = &buf;
    objc_msgSend(v20, "appleConnect_installMDMAssociatedProfileData:interactive:options:completion:", v6, 0, v15, v24);

    if (a4)
      *a4 = objc_retainAutorelease((id)v27[5]);
    a4 = (id *)*(id *)(*((_QWORD *)&buf + 1) + 40);

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&buf, 8);

  }
  else if (a4)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("ERROR_NO_ASSOCIATED_MDM_PROFILE"), v7, v8, v9, v10, v11, v12, v13, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCInstallationErrorDomain"), 4046, v22, CFSTR("MCFatalError"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

void __87__MCProfileConnection_Profiles__appleConnect_installMDMAssociatedProfileData_outError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "AppleConnect install profile data connection error. Error: %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __87__MCProfileConnection_Profiles__appleConnect_installMDMAssociatedProfileData_outError___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "AppleConnect install profile data error. Error: %{public}@", (uint8_t *)&v15, 0xCu);

    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;
  v12 = v6;

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v5;

}

- (void)removeProfileWithIdentifier:(id)a3
{
  -[MCProfileConnection removeProfileWithIdentifier:installationType:](self, "removeProfileWithIdentifier:installationType:", a3, 1);
}

- (void)removeProfileAsyncWithIdentifier:(id)a3
{
  -[MCProfileConnection removeProfileAsyncWithIdentifier:installationType:](self, "removeProfileAsyncWithIdentifier:installationType:", a3, 1);
}

- (void)removeProfileWithIdentifier:(id)a3 completion:(id)a4
{
  -[MCProfileConnection removeProfileWithIdentifier:installationType:completion:](self, "removeProfileWithIdentifier:installationType:completion:", a3, 1, a4);
}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection checkApplicationIdentifierEntitlement](self, "checkApplicationIdentifierEntitlement");
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_24);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeProfileWithIdentifier:installationType:completion:", v6, a4, &__block_literal_global_24);
}

void __78__MCProfileConnection_Profiles__removeProfileWithIdentifier_installationType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Remove profile error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)removeProfileAsyncWithIdentifier:(id)a3 installationType:(int64_t)a4
{
  -[MCProfileConnection removeProfileAsyncWithIdentifier:installationType:completion:](self, "removeProfileAsyncWithIdentifier:installationType:completion:", a3, a4, 0);
}

- (void)removeProtectedProfileAsyncWithIdentifier:(id)a3 installationType:(int64_t)a4
{
  -[MCProfileConnection removeProtectedProfileAsyncWithIdentifier:installationType:completion:](self, "removeProtectedProfileAsyncWithIdentifier:installationType:completion:", a3, a4, 0);
}

- (void)removeProfileAsyncWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection checkApplicationIdentifierEntitlement](self, "checkApplicationIdentifierEntitlement");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __94__MCProfileConnection_Profiles__removeProfileAsyncWithIdentifier_installationType_completion___block_invoke;
  v14[3] = &unk_1E41E3950;
  v15 = v8;
  v10 = v8;
  v11 = (void *)MEMORY[0x1A1AF040C](v14);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "removeProfileWithIdentifier:installationType:completion:", v9, a4, v11);
}

void __94__MCProfileConnection_Profiles__removeProfileAsyncWithIdentifier_installationType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Remove profile async error. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)removeProtectedProfileAsyncWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection checkApplicationIdentifierEntitlement](self, "checkApplicationIdentifierEntitlement");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __103__MCProfileConnection_Profiles__removeProtectedProfileAsyncWithIdentifier_installationType_completion___block_invoke;
  v14[3] = &unk_1E41E3950;
  v15 = v8;
  v10 = v8;
  v11 = (void *)MEMORY[0x1A1AF040C](v14);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "removeProtectedProfileWithIdentifier:installationType:completion:", v9, a4, v11);
}

void __103__MCProfileConnection_Profiles__removeProtectedProfileAsyncWithIdentifier_installationType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Remove protected profile async error. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection checkApplicationIdentifierEntitlement](self, "checkApplicationIdentifierEntitlement");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__MCProfileConnection_Profiles__removeProfileWithIdentifier_installationType_completion___block_invoke;
  v14[3] = &unk_1E41E3950;
  v15 = v8;
  v10 = v8;
  v11 = (void *)MEMORY[0x1A1AF040C](v14);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "removeProfileWithIdentifier:installationType:completion:", v9, a4, v11);
}

void __89__MCProfileConnection_Profiles__removeProfileWithIdentifier_installationType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Remove profile error. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

- (void)removeUninstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v11 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection checkApplicationIdentifierEntitlement](self, "checkApplicationIdentifierEntitlement");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __117__MCProfileConnection_Profiles__removeUninstalledProfileWithIdentifier_installationType_targetDeviceType_completion___block_invoke;
  v16[3] = &unk_1E41E3950;
  v17 = v10;
  v12 = v10;
  v13 = (void *)MEMORY[0x1A1AF040C](v16);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "removeUninstalledProfileWithIdentifier:installationType:targetDeviceType:completion:", v11, a4, a5, v13);
}

void __117__MCProfileConnection_Profiles__removeUninstalledProfileWithIdentifier_installationType_targetDeviceType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Remove uninstalled profile error. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

- (void)removePostSetupAutoInstallSetAsideProfileWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__MCProfileConnection_Profiles__removePostSetupAutoInstallSetAsideProfileWithCompletion___block_invoke;
  v9[3] = &unk_1E41E3950;
  v10 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1A1AF040C](v9);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removePostSetupAutoInstallSetAsideProfileWithCompletion:", v5);
}

void __89__MCProfileConnection_Profiles__removePostSetupAutoInstallSetAsideProfileWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "XPC connection failed when removing set aside MDM profile. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (id)updateProfileWithIdentifier:(id)a3 outError:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection checkApplicationIdentifierEntitlement](self, "checkApplicationIdentifierEntitlement");
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__7;
  v25 = __Block_byref_object_dispose__7;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v7 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__MCProfileConnection_Profiles__updateProfileWithIdentifier_outError___block_invoke;
  v14[3] = &unk_1E41E38D8;
  v14[4] = &v15;
  v8 = (void *)MEMORY[0x1A1AF040C](v14);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __70__MCProfileConnection_Profiles__updateProfileWithIdentifier_outError___block_invoke_25;
  v13[3] = &unk_1E41E3A40;
  v13[4] = &v15;
  v13[5] = &v21;
  objc_msgSend(v10, "updateProfileIdentifier:interactive:completion:", v6, 0, v13);

  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v11 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __70__MCProfileConnection_Profiles__updateProfileWithIdentifier_outError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    v5 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      objc_msgSend(v4, "MCVerboseDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_ERROR, "Update profile, interactive error. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __70__MCProfileConnection_Profiles__updateProfileWithIdentifier_outError___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Update profile, interactive error. Error: %{public}@", (uint8_t *)&v12, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (id)acceptedMIMETypes
{
  return &unk_1E4212CD0;
}

- (id)acceptedFileExtensions
{
  return &unk_1E4212CE8;
}

- (BOOL)_openSensitiveURLString:(id)a3 unlock:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a4;
  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__MCProfileConnection_Profiles___openSensitiveURLString_unlock___block_invoke;
  v11[3] = &unk_1E41E38D8;
  v11[4] = &v12;
  v7 = (void *)MEMORY[0x1A1AF040C](v11);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "openSensitiveURL:unlock:completion:", v6, v4, v7);

  LOBYTE(v4) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return v4;
}

void __64__MCProfileConnection_Profiles___openSensitiveURLString_unlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Open sensitive URL error. Error: %{public}@", (uint8_t *)&v7, 0xCu);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

- (BOOL)showProfileErrorUIWithProfileIdentifier:(id)a3 outError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (!objc_msgSend(v6, "length"))
  {
    v40 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("ERROR_UIOP_NULL_IDENTIFIER"), v7, v8, v9, v10, v11, v12, v13, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCUIOperationErrorDomain"), 27000, v41, CFSTR("MCFatalError"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
      goto LABEL_22;
    goto LABEL_18;
  }
  -[MCProfileConnection installedProfilesWithFilterFlags:](self, "installedProfilesWithFilterFlags:", 1);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v49 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", v6);

        if ((v20 & 1) != 0)
        {

          objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v31);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@&profileID=%@"), CFSTR("prefs:root=General&path=ManagedConfigurationList/ProfileError"), v29, (_QWORD)v48);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[MCProfileConnection _openSensitiveURLString:unlock:](self, "_openSensitiveURLString:unlock:", v32, 0))
          {
            v30 = 0;
          }
          else
          {
            v42 = (void *)MEMORY[0x1E0CB35C8];
            MCErrorArray(CFSTR("ERROR_UIOP_CANNOT_DISPLAY_P_IDENTIFIER"), v33, v34, v35, v36, v37, v38, v39, v6);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCUIOperationErrorDomain"), 27001, v43, CFSTR("MCFatalError"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_17;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (v16)
        continue;
      break;
    }
  }

  v21 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArray(CFSTR("ERROR_UIOP_IDENTIFIER_NOT_FOUND_P_IDENTIFIER"), v22, v23, v24, v25, v26, v27, v28, v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCUIOperationErrorDomain"), 27000, v29, CFSTR("MCFatalError"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  if (v30)
  {
LABEL_18:
    v44 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v45 = v44;
      objc_msgSend(v30, "MCVerboseDescription");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v6;
      v54 = 2114;
      v55 = v46;
      _os_log_impl(&dword_19ECC4000, v45, OS_LOG_TYPE_ERROR, "Cannot display profile with identifier “%{public}@”. Error: %{public}@", buf, 0x16u);

    }
    if (a4)
      *a4 = objc_retainAutorelease(v30);
  }
LABEL_22:

  return v30 == 0;
}

- (id)listInstalledProvisioningProfileUUIDsWithManagedOnly:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__7;
  v13 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v14 = v4;
  if (v3)
  {
    +[MCDependencyReader sharedReader](MCDependencyReader, "sharedReader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v5;
  MISEnumerateInstalledProvisioningProfiles();
  v6 = (void *)objc_msgSend((id)v10[5], "copy");

  _Block_object_dispose(&v9, 8);
  return v6;
}

BOOL __86__MCProfileConnection_Profiles__listInstalledProvisioningProfileUUIDsWithManagedOnly___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t v10[16];

  MISProvisioningProfileGetUUID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (!*(_BYTE *)(a1 + 48)
      || (objc_msgSend(*(id *)(a1 + 32), "dependentsOfParent:inDomain:", v2, CFSTR("ProvisioningProfileToManagingProfile")), v3 = (void *)objc_claimAutoreleasedReturnValue(), v4 = objc_msgSend(v3, "count"), v3, v4))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v2);
    }
  }
  else
  {
    v5 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Cannot get UUID of installed provisioning profile.", v10, 2u);
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  return v2 != 0;
}

- (BOOL)installProvisioningProfileData:(id)a3 managingProfileIdentifier:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v8 = a3;
  v9 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __99__MCProfileConnection_Profiles__installProvisioningProfileData_managingProfileIdentifier_outError___block_invoke;
  v15[3] = &unk_1E41E3A90;
  v15[4] = &v22;
  v15[5] = &v16;
  v10 = (void *)MEMORY[0x1A1AF040C](v15);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "installProvisioningProfileData:managingProfileIdentifier:completion:", v8, v9, v10);

  if (a5)
    *a5 = objc_retainAutorelease((id)v17[5]);
  v13 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v13;
}

void __99__MCProfileConnection_Profiles__installProvisioningProfileData_managingProfileIdentifier_outError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Install provisioning profile error. Error: %{public}@", (uint8_t *)&v9, 0xCu);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

- (BOOL)removeProvisioningProfileWithUUID:(id)a3 outError:(id *)a4
{
  return -[MCProfileConnection removeProvisioningProfileWithUUID:managingProfileIdentifier:outError:](self, "removeProvisioningProfileWithUUID:managingProfileIdentifier:outError:", a3, 0, a4);
}

- (BOOL)removeProvisioningProfileWithUUID:(id)a3 managingProfileIdentifier:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v8 = a3;
  v9 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__7;
  v22 = __Block_byref_object_dispose__7;
  v10 = MEMORY[0x1E0C809B0];
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __102__MCProfileConnection_Profiles__removeProvisioningProfileWithUUID_managingProfileIdentifier_outError___block_invoke;
  v17[3] = &unk_1E41E38D8;
  v17[4] = &v18;
  v11 = (void *)MEMORY[0x1A1AF040C](v17);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __102__MCProfileConnection_Profiles__removeProvisioningProfileWithUUID_managingProfileIdentifier_outError___block_invoke_59;
  v16[3] = &unk_1E41E3AB8;
  v16[4] = &v24;
  v16[5] = &v18;
  objc_msgSend(v13, "removeProvisioningProfileWithUUID:managingProfileIdentifier:completion:", v8, v9, v16);

  if (a5)
    *a5 = objc_retainAutorelease((id)v19[5]);
  v14 = *((_BYTE *)v25 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __102__MCProfileConnection_Profiles__removeProvisioningProfileWithUUID_managingProfileIdentifier_outError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Remove provisioning profile error. Error: %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __102__MCProfileConnection_Profiles__removeProvisioningProfileWithUUID_managingProfileIdentifier_outError___block_invoke_59(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      objc_msgSend(v5, "MCVerboseDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_ERROR, "Remove provisioning profile error. Error: %{public}@", (uint8_t *)&v11, 0xCu);

    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (BOOL)addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:(id)a3 outError:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__7;
  v26 = __Block_byref_object_dispose__7;
  v27 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __100__MCProfileConnection_Profiles__addTrustedCodeSigningIdentitiesForProvisioningProfileUUID_outError___block_invoke;
  v19[3] = &unk_1E41E3AE0;
  v8 = v6;
  v20 = v8;
  v21 = &v22;
  v9 = (void *)MEMORY[0x1A1AF040C](v19);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __100__MCProfileConnection_Profiles__addTrustedCodeSigningIdentitiesForProvisioningProfileUUID_outError___block_invoke_61;
  v15[3] = &unk_1E41E3B08;
  v12 = v8;
  v16 = v12;
  v17 = &v28;
  v18 = &v22;
  objc_msgSend(v11, "addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:completion:", v12, v15);

  if (a4)
    *a4 = objc_retainAutorelease((id)v23[5]);
  v13 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v13;
}

void __100__MCProfileConnection_Profiles__addTrustedCodeSigningIdentitiesForProvisioningProfileUUID_outError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v5;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_ERROR, "MCProfileConnection+Profiles XPC failed to add trusted code signing identities for provisioning profile uuid '%{public}@' with error: %{public}@", (uint8_t *)&v10, 0x16u);

    }
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __100__MCProfileConnection_Profiles__addTrustedCodeSigningIdentitiesForProvisioningProfileUUID_outError___block_invoke_61(_QWORD *a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[4];
      v8 = v6;
      objc_msgSend(v5, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v7;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "MCProfileConnection+Profiles failed to add trusted code signing identities for provisioning profile uuid '%{public}@' with error: %{public}@", (uint8_t *)&v12, 0x16u);

    }
  }
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (BOOL)isProvisioningProfilesWithUUID:(id)a3 managedByProfileWithIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[MCDependencyReader sharedReader](MCDependencyReader, "sharedReader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dependentsOfParent:inDomain:", v5, CFSTR("ManagingProfileToProvisioningProfile"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "containsObject:", v6);
  return (char)v7;
}

- (BOOL)getIsBundleBlocked:(BOOL *)a3 bundlePath:(id)a4 outHash:(id *)a5 outHashType:(id *)a6 outError:(id *)a7
{
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  _QWORD v19[8];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;

  v12 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__7;
  v37 = __Block_byref_object_dispose__7;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__7;
  v31 = __Block_byref_object_dispose__7;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__7;
  v25 = __Block_byref_object_dispose__7;
  v13 = MEMORY[0x1E0C809B0];
  v26 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __92__MCProfileConnection_Profiles__getIsBundleBlocked_bundlePath_outHash_outHashType_outError___block_invoke;
  v20[3] = &unk_1E41E38D8;
  v20[4] = &v21;
  v14 = (void *)MEMORY[0x1A1AF040C](v20);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __92__MCProfileConnection_Profiles__getIsBundleBlocked_bundlePath_outHash_outHashType_outError___block_invoke_62;
  v19[3] = &unk_1E41E3B30;
  v19[4] = &v39;
  v19[5] = &v33;
  v19[6] = &v27;
  v19[7] = &v21;
  objc_msgSend(v16, "isBundleBlocked:completion:", v12, v19);

  if (a3)
    *a3 = *((_BYTE *)v40 + 24);
  if (a5)
    *a5 = objc_retainAutorelease((id)v34[5]);
  if (a6)
    *a6 = objc_retainAutorelease((id)v28[5]);
  if (a7)
    *a7 = objc_retainAutorelease((id)v22[5]);
  v17 = v22[5] == 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v17;
}

void __92__MCProfileConnection_Profiles__getIsBundleBlocked_bundlePath_outHash_outHashType_outError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "MCProfileConnection isBundleBlocked XPC error: %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __92__MCProfileConnection_Profiles__getIsBundleBlocked_bundlePath_outHash_outHashType_outError___block_invoke_62(_QWORD *a1, char a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    v12 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      objc_msgSend(v11, "MCVerboseDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v14;
      _os_log_impl(&dword_19ECC4000, v13, OS_LOG_TYPE_ERROR, "MCProfileConnection isBundleBlocked error: %{public}@", (uint8_t *)&v23, 0xCu);

    }
  }
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  v15 = *(_QWORD *)(a1[5] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;
  v17 = v9;

  v18 = *(_QWORD *)(a1[6] + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v10;
  v20 = v10;

  v21 = *(_QWORD *)(a1[7] + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v11;

}

- (BOOL)getAreBundlesBlocked:(id *)a3 bundlePaths:(id)a4 outError:(id *)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__7;
  v26 = __Block_byref_object_dispose__7;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  v8 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__MCProfileConnection_Profiles__getAreBundlesBlocked_bundlePaths_outError___block_invoke;
  v15[3] = &unk_1E41E38D8;
  v15[4] = &v16;
  v9 = (void *)MEMORY[0x1A1AF040C](v15);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __75__MCProfileConnection_Profiles__getAreBundlesBlocked_bundlePaths_outError___block_invoke_64;
  v14[3] = &unk_1E41E3B58;
  v14[4] = &v22;
  v14[5] = &v16;
  objc_msgSend(v11, "areBundlesBlocked:completion:", v7, v14);

  if (a3)
    *a3 = objc_retainAutorelease((id)v23[5]);
  v12 = v17[5] == 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __75__MCProfileConnection_Profiles__getAreBundlesBlocked_bundlePaths_outError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "MCProfileConnection areBundlesBlocked XPC error: %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __75__MCProfileConnection_Profiles__getAreBundlesBlocked_bundlePaths_outError___block_invoke_64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "MCProfileConnection areBundlesBlocked error: %{public}@", (uint8_t *)&v15, 0xCu);

    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;
  v12 = v5;

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v6;

}

- (void)_detectProfiledCrashes
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_ERROR, "detectProfiledCrashes is no longer available", v3, 2u);
  }
}

- (void)installProfileData:(id)a3 interactionDelegate:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection installProfileData:options:interactionDelegate:](self, "installProfileData:options:interactionDelegate:", v7, 0, v6);

}

+ (id)profileDaemonConnectionErrorWithUnderlyingError:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = a3;
  MCErrorArray(CFSTR("ERROR_PROFILE_INSTALLATION_FAILED_TITLE"), v5, v6, v7, v8, v9, v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCInstallationErrorDomain"), 4045, v12, v4, CFSTR("MCFatalError"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)profileInstallationErrorWithUnderlyingError:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = a3;
  MCErrorArray(CFSTR("ERROR_PROFILE_INSTALLATION_FAILED_TITLE"), v5, v6, v7, v8, v9, v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCInstallationErrorDomain"), 4001, v12, v4, CFSTR("MCFatalError"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)installProfileData:(id)a3 options:(id)a4 interactionDelegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_storeStrong((id *)&self->_originalProfileData, a3);
  objc_storeWeak((id *)&self->_interactionDelegate, v11);
  objc_initWeak(&location, self);
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__MCProfileConnection_Profiles__installProfileData_options_interactionDelegate___block_invoke;
  v18[3] = &unk_1E41E3B80;
  v18[4] = self;
  objc_copyWeak(&v19, &location);
  v13 = (void *)MEMORY[0x1A1AF040C](v18);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __80__MCProfileConnection_Profiles__installProfileData_options_interactionDelegate___block_invoke_69;
  v16[3] = &unk_1E41E3BA8;
  v16[4] = self;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v15, "installProfileData:interactive:options:completion:", v9, 1, v10, v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __80__MCProfileConnection_Profiles__installProfileData_options_interactionDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id WeakRetained;
  id v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Install profile data, interactive error. Error: %{public}@", (uint8_t *)&v10, 0xCu);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v8 = objc_loadWeakRetained((id *)(a1 + 40));
  +[MCProfileConnection profileDaemonConnectionErrorWithUnderlyingError:](MCProfileConnection, "profileDaemonConnectionErrorWithUnderlyingError:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "profileConnection:didFinishInstallationWithIdentifier:error:", v8, 0, v9);

}

void __80__MCProfileConnection_Profiles__installProfileData_options_interactionDelegate___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id WeakRetained;
  id v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Install profile data, interactive error. Error: %{public}@", (uint8_t *)&v13, 0xCu);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v11 = objc_loadWeakRetained((id *)(a1 + 40));
  +[MCProfileConnection profileInstallationErrorWithUnderlyingError:](MCProfileConnection, "profileInstallationErrorWithUnderlyingError:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "profileConnection:didFinishInstallationWithIdentifier:error:", v11, 0, v12);

}

- (void)updateProfileWithIdentifier:(id)a3 interactionDelegate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_storeWeak((id *)&self->_interactionDelegate, v7);
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__MCProfileConnection_Profiles__updateProfileWithIdentifier_interactionDelegate___block_invoke;
  v14[3] = &unk_1E41E3B80;
  v14[4] = self;
  objc_copyWeak(&v15, &location);
  v9 = (void *)MEMORY[0x1A1AF040C](v14);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __81__MCProfileConnection_Profiles__updateProfileWithIdentifier_interactionDelegate___block_invoke_70;
  v12[3] = &unk_1E41E3BA8;
  v12[4] = self;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v11, "updateProfileIdentifier:interactive:completion:", v6, v7 != 0, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __81__MCProfileConnection_Profiles__updateProfileWithIdentifier_interactionDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id WeakRetained;
  id v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Update profile, interactive error. Error: %{public}@", (uint8_t *)&v10, 0xCu);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v8 = objc_loadWeakRetained((id *)(a1 + 40));
  +[MCProfileConnection profileDaemonConnectionErrorWithUnderlyingError:](MCProfileConnection, "profileDaemonConnectionErrorWithUnderlyingError:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "profileConnection:didFinishInstallationWithIdentifier:error:", v8, 0, v9);

}

void __81__MCProfileConnection_Profiles__updateProfileWithIdentifier_interactionDelegate___block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id WeakRetained;
  id v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Update profile, interactive error. Error: %{public}@", (uint8_t *)&v13, 0xCu);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v11 = objc_loadWeakRetained((id *)(a1 + 40));
  +[MCProfileConnection profileInstallationErrorWithUnderlyingError:](MCProfileConnection, "profileInstallationErrorWithUnderlyingError:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "profileConnection:didFinishInstallationWithIdentifier:error:", v11, 0, v12);

}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (BOOL)isProfileUIInstallationEffectivelyAllowed
{
  void *v2;
  int v3;

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveRestrictedBoolForSetting:", CFSTR("allowUIConfigurationProfileInstallation"));

  return v3 != 2;
}

- (BOOL)isProfileUIInstallationAllowed
{
  void *v3;
  BOOL v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (!-[MCProfileConnection isProfileUIInstallationEffectivelyAllowed](self, "isProfileUIInstallationEffectivelyAllowed"))return 0;
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userMode") != 1;

  return v4;
}

- (BOOL)mustInstallProfileNonInteractively:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (-[MCProfileConnection isProfileUIInstallationEffectivelyAllowed](self, "isProfileUIInstallationEffectivelyAllowed")&& (objc_msgSend(v4, "mustInstallNonInteractively") & 1) == 0)
  {
    v5 = MCIsEffectivelyInAppWhitelistMode();
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)preflightUserInputResponses:(id)a3 forPayloadIndex:(unint64_t)a4
{
  id v6;
  void (**userInputReplyBlock)(id, id, uint64_t, unint64_t, _QWORD);
  id v8;

  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
    -[MCProfileConnection(Profiles) preflightUserInputResponses:forPayloadIndex:].cold.1();
  userInputReplyBlock = (void (**)(id, id, uint64_t, unint64_t, _QWORD))self->userInputReplyBlock;
  if (userInputReplyBlock)
  {
    userInputReplyBlock[2](userInputReplyBlock, v6, 1, a4, 0);
    v8 = self->userInputReplyBlock;
    self->userInputReplyBlock = 0;

  }
}

- (void)cancelUserInputResponses
{
  id userInputReplyBlock;
  id v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
    -[MCProfileConnection(Profiles) cancelUserInputResponses].cold.1();
  userInputReplyBlock = self->userInputReplyBlock;
  if (userInputReplyBlock)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))userInputReplyBlock + 2))(userInputReplyBlock, 0, 0, 0, 0);
    v4 = self->userInputReplyBlock;
    self->userInputReplyBlock = 0;

  }
}

- (void)submitUserInputResponses:(id)a3
{
  id v4;
  id userInputReplyBlock;
  id v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
    -[MCProfileConnection(Profiles) submitUserInputResponses:].cold.1();
  userInputReplyBlock = self->userInputReplyBlock;
  if (userInputReplyBlock)
  {
    (*((void (**)(id, id, _QWORD, _QWORD, _QWORD))userInputReplyBlock + 2))(userInputReplyBlock, v4, 0, 0, 0);
    v6 = self->userInputReplyBlock;
    self->userInputReplyBlock = 0;

  }
}

- (void)__checkForProfiledCrash
{
  id WeakRetained;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[16];

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  if (WeakRetained)
  {
    v4 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "profiled crash detected.", buf, 2u);
    }
    v12 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("INSTALLATION_FAILED"), v5, v6, v7, v8, v9, v10, v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCInstallationErrorDomain"), 4001, v13, CFSTR("MCFatalError"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[MCProfileConnection doMCICDidFinishInstallationWithIdentifier:error:completion:](self, "doMCICDidFinishInstallationWithIdentifier:error:completion:", 0, v14, 0);
  }
}

- (void)respondToMAIDAuthenticationRequest:(BOOL)a3 error:(id)a4 isCancelled:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void (**MAIDSignInReplyBlock)(id, _BOOL8, id, _BOOL8);
  id v10;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
    -[MCProfileConnection(Profiles) respondToMAIDAuthenticationRequest:error:isCancelled:].cold.1();
  MAIDSignInReplyBlock = (void (**)(id, _BOOL8, id, _BOOL8))self->MAIDSignInReplyBlock;
  if (MAIDSignInReplyBlock)
  {
    MAIDSignInReplyBlock[2](MAIDSignInReplyBlock, v6, v8, v5);
    v10 = self->MAIDSignInReplyBlock;
    self->MAIDSignInReplyBlock = 0;

  }
}

- (void)respondToManagedRestoreRequest:(BOOL)a3 error:(id)a4 isCancelled:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void (**restoreReplyBlock)(id, _BOOL8, id, _BOOL8);
  id v10;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
    -[MCProfileConnection(Profiles) respondToManagedRestoreRequest:error:isCancelled:].cold.1();
  restoreReplyBlock = (void (**)(id, _BOOL8, id, _BOOL8))self->restoreReplyBlock;
  if (restoreReplyBlock)
  {
    restoreReplyBlock[2](restoreReplyBlock, v6, v8, v5);
    v10 = self->restoreReplyBlock;
    self->restoreReplyBlock = 0;

  }
}

- (void)respondToWarningsContinueInstallation:(BOOL)a3
{
  _BOOL8 v3;
  void (**showWarningsReplyBlock)(id, _BOOL8, _QWORD);
  id v6;

  v3 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
    -[MCProfileConnection(Profiles) respondToWarningsContinueInstallation:].cold.1();
  showWarningsReplyBlock = (void (**)(id, _BOOL8, _QWORD))self->showWarningsReplyBlock;
  if (showWarningsReplyBlock)
  {
    showWarningsReplyBlock[2](showWarningsReplyBlock, v3, 0);
    v6 = self->showWarningsReplyBlock;
    self->showWarningsReplyBlock = 0;

  }
}

- (void)respondToCurrentPasscodeRequestContinue:(BOOL)a3 passcode:(id)a4
{
  _BOOL8 v4;
  id v6;
  void (**passcodeReplyBlock)(id, _BOOL8, id, _QWORD);
  id v8;

  v4 = a3;
  v6 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
    -[MCProfileConnection(Profiles) respondToCurrentPasscodeRequestContinue:passcode:].cold.1();
  passcodeReplyBlock = (void (**)(id, _BOOL8, id, _QWORD))self->passcodeReplyBlock;
  if (passcodeReplyBlock)
  {
    passcodeReplyBlock[2](passcodeReplyBlock, v4, v6, 0);
    v8 = self->passcodeReplyBlock;
    self->passcodeReplyBlock = 0;

  }
}

- (BOOL)isChaperoned
{
  void *v2;
  char v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSupervised");

  return v3;
}

- (id)chaperoneOrganization
{
  void *v3;
  void *v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection cloudConfigurationDetails](self, "cloudConfigurationDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D44820]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)effectiveRestrictions
{
  void *v2;
  void *v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRestrictions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)effectiveRestrictionsForPairedDevice
{
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  return objc_alloc_init(MEMORY[0x1E0C99D80]);
}

- (id)valueRestrictionForFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForFeature:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)objectRestrictionForFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForFeature:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)applyRestrictionDictionary:(id)a3 clientType:(id)a4 clientUUID:(id)a5 localizedClientDescription:(id)a6 localizedWarningMessage:(id)a7 outRestrictionChanged:(BOOL *)a8 outEffectiveSettingsChanged:(BOOL *)a9 outError:(id *)a10
{
  return -[MCProfileConnection applyRestrictionDictionary:overrideRestrictions:appsAndOptions:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:](self, "applyRestrictionDictionary:overrideRestrictions:appsAndOptions:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:", a3, 0, 0, a4, a5, a6, a7, a8, a9, a10);
}

- (BOOL)applyRestrictionDictionary:(id)a3 appsAndOptions:(id)a4 clientType:(id)a5 clientUUID:(id)a6 localizedClientDescription:(id)a7 localizedWarningMessage:(id)a8 outRestrictionChanged:(BOOL *)a9 outEffectiveSettingsChanged:(BOOL *)a10 outError:(id *)a11
{
  return -[MCProfileConnection applyRestrictionDictionary:overrideRestrictions:appsAndOptions:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:](self, "applyRestrictionDictionary:overrideRestrictions:appsAndOptions:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:", a3, 0, a4, a5, a6, a7, a8, a9, a10, a11);
}

- (BOOL)applyRestrictionDictionary:(id)a3 overrideRestrictions:(BOOL)a4 clientType:(id)a5 clientUUID:(id)a6 localizedClientDescription:(id)a7 localizedWarningMessage:(id)a8 outRestrictionChanged:(BOOL *)a9 outEffectiveSettingsChanged:(BOOL *)a10 outError:(id *)a11
{
  return -[MCProfileConnection applyRestrictionDictionary:overrideRestrictions:appsAndOptions:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:](self, "applyRestrictionDictionary:overrideRestrictions:appsAndOptions:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:", a3, a4, 0, a5, a6, a7, a8, a9, a10, a11);
}

- (BOOL)applyRestrictionDictionary:(id)a3 overrideRestrictions:(BOOL)a4 appsAndOptions:(id)a5 clientType:(id)a6 clientUUID:(id)a7 localizedClientDescription:(id)a8 localizedWarningMessage:(id)a9 outRestrictionChanged:(BOOL *)a10 outEffectiveSettingsChanged:(BOOL *)a11 outError:(id *)a12
{
  _BOOL8 v16;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  BOOL v28;
  id v30;
  _QWORD v31[8];
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v16 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v30 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__8;
  v37 = __Block_byref_object_dispose__8;
  v23 = MEMORY[0x1E0C809B0];
  v38 = 0;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __232__MCProfileConnection_Restrictions__applyRestrictionDictionary_overrideRestrictions_appsAndOptions_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke;
  v32[3] = &unk_1E41E38D8;
  v32[4] = &v33;
  v24 = (void *)MEMORY[0x1A1AF040C](v32);
  v25 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v44 = v20;
    v45 = 2114;
    v46 = v19;
    v47 = 2114;
    v48 = v18;
    _os_log_impl(&dword_19ECC4000, v25, OS_LOG_TYPE_DEFAULT, "Setting client truth of UUID %{public}@ type %{public}@ to %{public}@", buf, 0x20u);
  }
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "synchronousRemoteObjectProxyWithErrorHandler:", v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v23;
  v31[1] = 3221225472;
  v31[2] = __232__MCProfileConnection_Restrictions__applyRestrictionDictionary_overrideRestrictions_appsAndOptions_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke_2;
  v31[3] = &unk_1E41E3BD0;
  v31[6] = a10;
  v31[7] = a11;
  v31[4] = &v39;
  v31[5] = &v33;
  objc_msgSend(v27, "applyRestrictionDictionary:overrideRestrictions:appsAndOptions:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:completion:", v18, v16, v30, v19, v20, v21, v22, v31);

  if (a12)
    *a12 = objc_retainAutorelease((id)v34[5]);
  v28 = *((_BYTE *)v40 + 24) != 0;

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v28;
}

void __232__MCProfileConnection_Restrictions__applyRestrictionDictionary_overrideRestrictions_appsAndOptions_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Apply restriction dict error. Error: %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __232__MCProfileConnection_Restrictions__applyRestrictionDictionary_overrideRestrictions_appsAndOptions_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke_2(_QWORD *a1, char a2, char a3, void *a4)
{
  id v7;
  void *v8;
  _BYTE *v9;
  _BYTE *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  v9 = (_BYTE *)a1[6];
  if (v9)
    *v9 = a2;
  v10 = (_BYTE *)a1[7];
  if (v10)
    *v10 = a3;
  if (v7)
  {
    v11 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      objc_msgSend(v8, "MCVerboseDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v13;
      _os_log_impl(&dword_19ECC4000, v12, OS_LOG_TYPE_ERROR, "Apply restriction dict error. Error: %{public}@", (uint8_t *)&v16, 0xCu);

    }
  }
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
  v14 = *(_QWORD *)(a1[5] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v8;

}

- (int)applyRestrictionDictionary:(id)a3 clientType:(id)a4 clientUUID:(id)a5 localizedClientDescription:(id)a6 localizedWarningMessage:(id)a7 complianceBlocking:(int)a8 displayImmediateAlert:(BOOL)a9 outRestrictionChanged:(BOOL *)a10 outEffectiveSettingsChanged:(BOOL *)a11 outError:(id *)a12
{
  return -[MCProfileConnection applyRestrictionDictionary:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:complianceBlocking:displayImmediateAlert:limitForUserEnrollment:outRestrictionChanged:outEffectiveSettingsChanged:outError:](self, "applyRestrictionDictionary:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:complianceBlocking:displayImmediateAlert:limitForUserEnrollment:outRestrictionChanged:outEffectiveSettingsChanged:outError:", a3, a4, a5, a6, a7, *(_QWORD *)&a8);
}

- (int)applyRestrictionDictionary:(id)a3 clientType:(id)a4 clientUUID:(id)a5 localizedClientDescription:(id)a6 localizedWarningMessage:(id)a7 complianceBlocking:(int)a8 displayImmediateAlert:(BOOL)a9 limitForUserEnrollment:(BOOL)a10 outRestrictionChanged:(BOOL *)a11 outEffectiveSettingsChanged:(BOOL *)a12 outError:(id *)a13
{
  __CFString *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  __CFString *v36;
  NSObject *v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  int v58;
  dispatch_semaphore_t v59;
  const char *v60;
  NSObject *v61;
  NSObject *v62;
  uint32_t v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  int v69;
  dispatch_semaphore_t v70;
  const char *v71;
  NSObject *v72;
  uint32_t v73;
  NSObject *v74;
  const char *v76;
  NSObject *v77;
  uint32_t v78;
  NSObject *v79;
  int *p_out_token;
  __CFString *v81;
  __CFString *v82;
  __CFString *v83;
  void *v84;
  int v85;
  uint32_t v86;
  id v87;
  void *v88;
  __CFString *v89;
  id v90;
  _QWORD v91[4];
  NSObject *v92;
  int v93;
  _QWORD v94[4];
  NSObject *v95;
  _QWORD handler[4];
  NSObject *v97;
  int out_token;
  id v99;
  uint8_t buf[4];
  const __CFString *v101;
  __int16 v102;
  uint32_t v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v19 = (__CFString *)a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v90 = a7;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  MCLocalizedErrorFormatByDevice(CFSTR("ENCRYPTION_POLICY_CLIENT_FAILURE_TEXT"), v23, v24, v25, v26, v27, v28, v29, (uint64_t)v22);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCDeviceCapabilities currentDevice](MCDeviceCapabilities, "currentDevice");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "validateCapabilitiesRequiredByRestrictions:localizedIncompatibilityMessage:outError:", v19, v30, a13);

  if (v32)
  {
    v85 = a8;
    if (v19 && a10)
    {
      v87 = v21;
      v33 = v20;
      v34 = qword_1ECD40B38;
      if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v101 = v19;
        _os_log_impl(&dword_19ECC4000, v34, OS_LOG_TYPE_DEBUG, "Transmogrifying client restrictions from: %{public}@", buf, 0xCu);
      }
      v99 = 0;
      -[MCProfileConnection _transmogrifyRestrictionDictionaryForUserEnrollment:outError:](self, "_transmogrifyRestrictionDictionaryForUserEnrollment:outError:", v19, &v99);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (__CFString *)v99;
      v37 = qword_1ECD40B38;
      v38 = os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG);
      v89 = (__CFString *)v35;
      if (!v35)
      {
        if (v38)
        {
          *(_DWORD *)buf = 138543362;
          v101 = v36;
          _os_log_impl(&dword_19ECC4000, v37, OS_LOG_TYPE_DEBUG, "Rejecting client restrictions: %{public}@", buf, 0xCu);
        }
        v20 = v33;
        if (!a13)
        {
          v46 = 2;
          v47 = v90;
          v21 = v87;
LABEL_49:

          goto LABEL_50;
        }
        v67 = (void *)MEMORY[0x1E0CB35C8];
        MCErrorArray(CFSTR("USER_ENROLLMENT_DISALLOWED_RESTRICTIONS_P_CLIENT"), v39, v40, v41, v42, v43, v44, v45, v22);
        v68 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCDeviceCapabilitiesErrorDomain"), 26002, v68, v36, CFSTR("MCFatalError"));
        *a13 = (id)objc_claimAutoreleasedReturnValue();
        v46 = 2;
        v47 = v90;
        v66 = (void *)v68;
        v21 = v87;
        goto LABEL_48;
      }
      if (v38)
      {
        *(_DWORD *)buf = 138543362;
        v101 = (const __CFString *)v35;
        _os_log_impl(&dword_19ECC4000, v37, OS_LOG_TYPE_DEBUG, "Transmogrifying client restrictions to: %{public}@", buf, 0xCu);
      }

      v20 = v33;
      v21 = v87;
    }
    else
    {
      v89 = v19;
    }
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString systemClientRestrictions](v36, "systemClientRestrictions");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKey:", v21);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v88 = v49;
    if (v49)
    {
      objc_msgSend(v49, "objectForKey:", CFSTR("clientType"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "isEqualToString:", v20);

      if (v51)
      {
        v81 = v36;
        objc_msgSend(v49, "objectForKey:", CFSTR("clientRestrictions"));
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = (void *)-[__CFString MCMutableDeepCopy](v89, "MCMutableDeepCopy");
        +[MCHacks sharedHacks](MCHacks, "sharedHacks");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "_applyHeuristicsToRestrictions:forProfile:ignoresUnrestrictableApps:", v53, 0, 0);

        v84 = (void *)v52;
        if (objc_msgSend(v53, "isEqualToDictionary:", v52))
        {
          objc_msgSend(v49, "objectForKey:", CFSTR("compliant"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "BOOLValue");

          if ((v56 & 1) != 0)
          {

            v46 = 0;
            v47 = v90;
            v36 = v81;
LABEL_46:
            v19 = v89;
            goto LABEL_47;
          }
        }

        v36 = v81;
      }
    }
    v19 = v89;
    v47 = v90;
    if (-[MCProfileConnection applyRestrictionDictionary:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:](self, "applyRestrictionDictionary:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:", v89, v20, v21, v22, v90, a11, a12, a13))
    {
      +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "isDeviceLocked");
      v84 = v57;
      if (v85)
      {
        if (v58)
        {
          v82 = v36;
          v59 = dispatch_semaphore_create(0);
          out_token = 0;
          v60 = (const char *)*MEMORY[0x1E0D4E600];
          dispatch_get_global_queue(0, 0);
          v61 = objc_claimAutoreleasedReturnValue();
          handler[0] = MEMORY[0x1E0C809B0];
          handler[1] = 3221225472;
          handler[2] = __260__MCProfileConnection_Restrictions__applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_complianceBlocking_displayImmediateAlert_limitForUserEnrollment_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke;
          handler[3] = &unk_1E41E0C90;
          v62 = v59;
          v97 = v62;
          v63 = notify_register_dispatch(v60, &out_token, v61, handler);

          if (v63)
          {
            v64 = qword_1ECD40B38;
            v36 = v82;
            if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              v101 = (const __CFString *)v60;
              v102 = 1024;
              v103 = v63;
              _os_log_impl(&dword_19ECC4000, v64, OS_LOG_TYPE_ERROR, "Unable to register for message %{public}s: %d", buf, 0x12u);
            }
            v65 = v97;
LABEL_45:

            v46 = 3;
            goto LABEL_46;
          }
          v57 = v84;
          v36 = v82;
          if (objc_msgSend(v84, "isDeviceLocked"))
          {
            do
              dispatch_semaphore_wait(v62, 0xFFFFFFFFFFFFFFFFLL);
            while ((objc_msgSend(v84, "isDeviceLocked") & 1) != 0);
          }
          notify_cancel(out_token);

          v19 = v89;
        }
        v69 = objc_msgSend(v57, "currentPasscodeCompliesWithPolicyFromRestrictions:outError:", v19, 0);
        if (v85 == 1)
          goto LABEL_38;
        if ((v69 & 1) == 0)
        {
          v70 = dispatch_semaphore_create(0);
          out_token = 0;
          v71 = (const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.passcodechanged"), "cStringUsingEncoding:", 4);
          dispatch_get_global_queue(0, 0);
          v72 = objc_claimAutoreleasedReturnValue();
          v94[0] = MEMORY[0x1E0C809B0];
          v94[1] = 3221225472;
          v94[2] = __260__MCProfileConnection_Restrictions__applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_complianceBlocking_displayImmediateAlert_limitForUserEnrollment_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke_12;
          v94[3] = &unk_1E41E0C90;
          v62 = v70;
          v95 = v62;
          v73 = notify_register_dispatch(v71, &out_token, v72, v94);

          if (v73)
          {
            v74 = qword_1ECD40B38;
            v47 = v90;
            if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v101 = CFSTR("com.apple.managedconfiguration.passcodechanged");
              v102 = 1024;
              v103 = v73;
              _os_log_impl(&dword_19ECC4000, v74, OS_LOG_TYPE_ERROR, "Unable to register for message %{public}@: %d", buf, 0x12u);
            }
            v65 = v95;
            goto LABEL_45;
          }
          v83 = v36;
          v93 = 0;
          v76 = (const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.restrictionchanged"), "cStringUsingEncoding:", 4);
          v91[0] = MEMORY[0x1E0C809B0];
          v91[1] = 3221225472;
          v91[2] = __260__MCProfileConnection_Restrictions__applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_complianceBlocking_displayImmediateAlert_limitForUserEnrollment_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke_13;
          v91[3] = &unk_1E41E0C90;
          v77 = v62;
          v92 = v77;
          v78 = notify_register_dispatch(v76, &v93, v72, v91);

          v86 = v78;
          if (v78)
          {
            v79 = qword_1ECD40B38;
            v19 = v89;
            v47 = v90;
            if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v101 = CFSTR("com.apple.managedconfiguration.restrictionchanged");
              v102 = 1024;
              v103 = v78;
              _os_log_impl(&dword_19ECC4000, v79, OS_LOG_TYPE_ERROR, "Unable to register for message %{public}@: %d", buf, 0x12u);
            }
            v46 = 3;
            p_out_token = &out_token;
          }
          else
          {
            v19 = v89;
            v47 = v90;
            if ((objc_msgSend(v84, "currentPasscodeCompliesWithPolicyFromRestrictions:outError:", v89, 0) & 1) == 0)
            {
              do
                dispatch_semaphore_wait(v77, 0xFFFFFFFFFFFFFFFFLL);
              while (!objc_msgSend(v84, "currentPasscodeCompliesWithPolicyFromRestrictions:outError:", v89, 0));
            }
            notify_cancel(out_token);
            v46 = 2;
            p_out_token = &v93;
          }
          v36 = v83;
          notify_cancel(*p_out_token);

          if (v86)
            goto LABEL_47;
        }
        v46 = 0;
      }
      else
      {
        if ((v58 & 1) == 0)
        {
          v69 = objc_msgSend(v57, "currentPasscodeCompliesWithPolicyFromRestrictions:outError:", v89, 0);
LABEL_38:
          v46 = v69 ^ 1;
          goto LABEL_47;
        }
        v46 = 4;
      }
LABEL_47:
      v66 = v88;

      goto LABEL_48;
    }
    v46 = 3;
    v66 = v49;
LABEL_48:

    goto LABEL_49;
  }
  v46 = 2;
  v47 = v90;
LABEL_50:

  return v46;
}

intptr_t __260__MCProfileConnection_Restrictions__applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_complianceBlocking_displayImmediateAlert_limitForUserEnrollment_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __260__MCProfileConnection_Restrictions__applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_complianceBlocking_displayImmediateAlert_limitForUserEnrollment_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke_12(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __260__MCProfileConnection_Restrictions__applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_complianceBlocking_displayImmediateAlert_limitForUserEnrollment_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke_13(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)allClientUUIDsForClientType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allClientUUIDsForClientType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)clientRestrictionsForClientUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientRestrictionsForClientUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)userInfoForClientUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfoForClientUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setUserInfo:(id)a3 forClientUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (MCIsDaemonProcess)
  {
    -[objc_class sharedManager](NSClassFromString(CFSTR("MCRestrictionManagerWriter")), "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserInfo:forClientUUID:sender:", v7, v6, CFSTR("profiled"));
  }
  else
  {
    -[MCProfileConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_30);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUserInfo:forClientUUID:completion:", v7, v6, &__block_literal_global_30);

    v6 = v7;
    v7 = v9;
  }

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidateRestrictions");

}

void __63__MCProfileConnection_Restrictions__setUserInfo_forClientUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Set user info error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (BOOL)clearUserInfoForClientUUIDs:(id)a3
{
  id v3;
  int v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = MCIsDaemonProcess;
  if (MCIsDaemonProcess)
  {
    -[objc_class sharedManager](NSClassFromString(CFSTR("MCRestrictionManagerWriter")), "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      v10 = MEMORY[0x1E0C9AA70];
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "setUserInfo:forClientUUID:sender:", v10, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), CFSTR("profiled"), (_QWORD)v13);
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  return v4 != 0;
}

- (void)removeOrphanedClientRestrictions
{
  void *v3;
  id v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeOrphanedClientRestrictionsWithCompletion:", &__block_literal_global_18);

}

void __69__MCProfileConnection_Restrictions__removeOrphanedClientRestrictions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Remove orphaned client restrictions error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)removeOrphanedClientRestrictionsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__MCProfileConnection_Restrictions__removeOrphanedClientRestrictionsWithCompletion___block_invoke;
  v9[3] = &unk_1E41E3950;
  v10 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1A1AF040C](v9);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeOrphanedClientRestrictionsWithCompletion:", v6);

}

void __84__MCProfileConnection_Restrictions__removeOrphanedClientRestrictionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Remove orphaned client restrictions error. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (id)effectiveWhitelistedAppsAndOptions
{
  void *v2;
  void *v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveWhitelistedAppsAndOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (NSArray)features
{
  if (features_onceToken != -1)
    dispatch_once(&features_onceToken, &__block_literal_global_31);
  return (NSArray *)(id)features_features;
}

void __41__MCProfileConnection_Settings__features__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = (id)objc_opt_new();
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "defaultRestrictions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v3);

  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("restrictedValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v5);

  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("intersection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v7);

  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("union"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v9);

  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("assignedObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v11);

  v12 = objc_msgSend(v14, "copy");
  v13 = (void *)features_features;
  features_features = v12;

}

- (void)setParametersForSettingsByType:(id)a3
{
  -[MCProfileConnection setParametersForSettingsByType:passcode:](self, "setParametersForSettingsByType:passcode:", a3, 0);
}

- (void)setParametersForSettingsByType:(id)a3 passcode:(id)a4
{
  -[MCProfileConnection setParametersForSettingsByType:toSystem:user:passcode:](self, "setParametersForSettingsByType:toSystem:user:passcode:", a3, 1, 0, a4);
}

- (void)setParametersForSettingsByType:(id)a3 toSystem:(BOOL)a4 user:(BOOL)a5
{
  -[MCProfileConnection setParametersForSettingsByType:toSystem:user:passcode:](self, "setParametersForSettingsByType:toSystem:user:passcode:", a3, a4, a5, 0);
}

- (void)setParametersForSettingsByType:(id)a3 toSystem:(BOOL)a4 user:(BOOL)a5 passcode:(id)a6
{
  -[MCProfileConnection setParametersForSettingsByType:toSystem:user:passcode:waitUntilCompleted:completion:](self, "setParametersForSettingsByType:toSystem:user:passcode:waitUntilCompleted:completion:", a3, a4, a5, a6, 1, 0);
}

- (void)setParametersForSettingsByType:(id)a3 passcode:(id)a4 completion:(id)a5
{
  -[MCProfileConnection setParametersForSettingsByType:toSystem:user:passcode:completion:](self, "setParametersForSettingsByType:toSystem:user:passcode:completion:", a3, 1, 0, a4, a5);
}

- (void)setParametersForSettingsByType:(id)a3 toSystem:(BOOL)a4 user:(BOOL)a5 passcode:(id)a6 completion:(id)a7
{
  -[MCProfileConnection setParametersForSettingsByType:toSystem:user:passcode:waitUntilCompleted:completion:](self, "setParametersForSettingsByType:toSystem:user:passcode:waitUntilCompleted:completion:", a3, a4, a5, a6, 0, a7);
}

- (void)setParametersForSettingsByType:(id)a3 toSystem:(BOOL)a4 user:(BOOL)a5 passcode:(id)a6 waitUntilCompleted:(BOOL)a7 completion:(id)a8
{
  uint64_t v8;

  LOBYTE(v8) = a7;
  -[MCProfileConnection setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:](self, "setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:", a3, 0, a4, a5, a6, 0, v8, a8);
}

- (void)setParameters:(id)a3 forBoolSetting:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v11 = v7;
  v12 = CFSTR("restrictedBool");
  v10 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCProfileConnection setParametersForSettingsByType:](self, "setParametersForSettingsByType:", v9);
}

- (void)setParameters:(id)a3 forValueSetting:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v11 = v7;
  v12 = CFSTR("restrictedValue");
  v10 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCProfileConnection setParametersForSettingsByType:](self, "setParametersForSettingsByType:", v9);
}

- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 passcode:(id)a5
{
  -[MCProfileConnection setBoolValue:forSetting:toSystem:user:passcode:](self, "setBoolValue:forSetting:toSystem:user:passcode:", a3, a4, 1, 0, a5);
}

- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 passcode:(id)a5 completion:(id)a6
{
  -[MCProfileConnection setBoolValue:ask:forSetting:passcode:completion:](self, "setBoolValue:ask:forSetting:passcode:completion:", a3, 0, a4, a5, a6);
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 passcode:(id)a6
{
  uint64_t v6;

  LOBYTE(v6) = 1;
  -[MCProfileConnection setBoolValue:ask:forSetting:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:](self, "setBoolValue:ask:forSetting:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:", a3, a4, a5, 0, 1, 0, a6, 0, v6, 0);
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 passcode:(id)a6 completion:(id)a7
{
  -[MCProfileConnection setBoolValue:ask:forSetting:toSystem:user:passcode:completion:](self, "setBoolValue:ask:forSetting:toSystem:user:passcode:completion:", a3, a4, a5, 1, 0, a6, a7);
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 toSystem:(BOOL)a6 user:(BOOL)a7 passcode:(id)a8 completion:(id)a9
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  -[MCProfileConnection setBoolValue:ask:forSetting:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:](self, "setBoolValue:ask:forSetting:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:", a3, a4, a5, 0, a6, a7, a8, 0, v9, a9);
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 configurationUUID:(id)a6 toSystem:(BOOL)a7 user:(BOOL)a8 passcode:(id)a9
{
  uint64_t v9;

  LOBYTE(v9) = 1;
  -[MCProfileConnection setBoolValue:ask:forSetting:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:](self, "setBoolValue:ask:forSetting:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:", a3, a4, a5, a6, a7, a8, a9, 0, v9, 0);
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 configurationUUID:(id)a6 toSystem:(BOOL)a7 user:(BOOL)a8 passcode:(id)a9 completion:(id)a10
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  -[MCProfileConnection setBoolValue:ask:forSetting:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:](self, "setBoolValue:ask:forSetting:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:", a3, a4, a5, a6, a7, a8, a9, 0, v10, a10);
}

- (void)setAsk:(BOOL)a3 forBoolSetting:(id)a4 configurationUUID:(id)a5 toSystem:(BOOL)a6 user:(BOOL)a7 passcode:(id)a8
{
  uint64_t v8;

  LOBYTE(v8) = 1;
  -[MCProfileConnection setAsk:forBoolSetting:configurationUUID:toSystem:user:passcode:waitUntilCompleted:completion:](self, "setAsk:forBoolSetting:configurationUUID:toSystem:user:passcode:waitUntilCompleted:completion:", a3, a4, a5, a6, a7, a8, v8, 0);
}

- (void)setAsk:(BOOL)a3 forBoolSetting:(id)a4 configurationUUID:(id)a5 toSystem:(BOOL)a6 user:(BOOL)a7 passcode:(id)a8 completion:(id)a9
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  -[MCProfileConnection setAsk:forBoolSetting:configurationUUID:toSystem:user:passcode:waitUntilCompleted:completion:](self, "setAsk:forBoolSetting:configurationUUID:toSystem:user:passcode:waitUntilCompleted:completion:", a3, a4, a5, a6, a7, a8, v9, a9);
}

- (void)setAsk:(BOOL)a3 forBoolSetting:(id)a4 configurationUUID:(id)a5 toSystem:(BOOL)a6 user:(BOOL)a7 passcode:(id)a8 waitUntilCompleted:(BOOL)a9 completion:(id)a10
{
  _BOOL8 v13;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _BOOL4 v24;
  _BOOL4 v25;
  const __CFString *v26;
  void *v27;
  id v28;
  void *v29;
  const __CFString *v30;
  _QWORD v31[2];

  v24 = a6;
  v25 = a7;
  v13 = a3;
  v31[1] = *MEMORY[0x1E0C80C00];
  v15 = a10;
  v16 = a8;
  v17 = a5;
  v18 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v30 = CFSTR("restrictedBool");
  v28 = v18;
  v26 = CFSTR("ask");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v23) = a9;
  -[MCProfileConnection setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:](self, "setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:", v22, v17, v24, v25, v16, 0, v23, v15);

}

- (void)setValue:(id)a3 forSetting:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection setValue:forSetting:passcode:](self, "setValue:forSetting:passcode:", v7, v6, 0);

}

- (void)setValue:(id)a3 forSetting:(id)a4 passcode:(id)a5
{
  -[MCProfileConnection setValue:forSetting:toSystem:user:passcode:](self, "setValue:forSetting:toSystem:user:passcode:", a3, a4, 1, 0, a5);
}

- (void)setValue:(id)a3 forSetting:(id)a4 passcode:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  id v21;
  id v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v14 = (void *)qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    *(_DWORD *)buf = 67109378;
    v27 = objc_msgSend(v10, "unsignedIntValue");
    v28 = 2114;
    v29 = v11;
    _os_log_impl(&dword_19ECC4000, v15, OS_LOG_TYPE_DEFAULT, "Set value %u for settings: %{public}@", buf, 0x12u);

  }
  v24 = CFSTR("restrictedValue");
  v21 = v10;
  v22 = v11;
  v20 = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = 0;
  -[MCProfileConnection setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:](self, "setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:", v18, 0, 1, 0, v13, 0, v19, v12);

}

- (void)setValues:(id)a3 forIntersectionSetting:(id)a4
{
  -[MCProfileConnection setValues:forIntersectionSetting:toSystem:user:](self, "setValues:forIntersectionSetting:toSystem:user:", a3, a4, 1, 0);
}

- (void)setValues:(id)a3 forUnionSetting:(id)a4
{
  -[MCProfileConnection setValues:forUnionSetting:toSystem:user:](self, "setValues:forUnionSetting:toSystem:user:", a3, a4, 1, 0);
}

- (id)errorCheckedSetBoolValue:(BOOL)a3 forSetting:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  const __CFString *v22;
  void *v23;
  id v24;
  void *v25;
  const __CFString *v26;
  _QWORD v27[2];

  v4 = a3;
  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__9;
  v20 = __Block_byref_object_dispose__9;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__MCProfileConnection_Settings__errorCheckedSetBoolValue_forSetting___block_invoke;
  v15[3] = &unk_1E41E38D8;
  v15[4] = &v16;
  v7 = (void *)MEMORY[0x1A1AF040C](v15);
  v26 = CFSTR("restrictedBool");
  v24 = v6;
  v22 = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v14) = 1;
  -[MCProfileConnection setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:errorCompletionBlock:](self, "setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:errorCompletionBlock:", v11, 0, 1, 0, 0, 0, v14, v7);
  v12 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v12;
}

void __69__MCProfileConnection_Settings__errorCheckedSetBoolValue_forSetting___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    v5 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      objc_msgSend(v4, "MCVerboseDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_ERROR, "Set parameters for settings error. Error: %{public}@", (uint8_t *)&v9, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidateSettings");

  }
}

- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 errorCompletionBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  const __CFString *v22;
  void *v23;
  id v24;
  void *v25;
  const __CFString *v26;
  _QWORD v27[2];

  v6 = a3;
  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __78__MCProfileConnection_Settings__setBoolValue_forSetting_errorCompletionBlock___block_invoke;
  v20 = &unk_1E41E3950;
  v21 = v8;
  v9 = v8;
  v10 = a4;
  v11 = (void *)MEMORY[0x1A1AF040C](&v17);
  v26 = CFSTR("restrictedBool");
  v24 = v10;
  v22 = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v16) = 0;
  -[MCProfileConnection setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:errorCompletionBlock:](self, "setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:errorCompletionBlock:", v15, 0, 1, 0, 0, 0, v16, v11, v17, v18, v19, v20);

}

void __78__MCProfileConnection_Settings__setBoolValue_forSetting_errorCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (!os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v5 = v4;
    objc_msgSend(v3, "MCVerboseDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Set parameters for settings error. Error: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  else
  {
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject invalidateSettings](v5, "invalidateSettings");
  }

LABEL_6:
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 completion:(id)a8
{
  -[MCProfileConnection setBoolValue:ask:forSetting:toSystem:user:passcode:completion:](self, "setBoolValue:ask:forSetting:toSystem:user:passcode:completion:", a3, 0, a4, a5, a6, a7, a8);
}

- (void)setValue:(id)a3 forSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6
{
  -[MCProfileConnection setValue:forSetting:toSystem:user:passcode:](self, "setValue:forSetting:toSystem:user:passcode:", a3, a4, a5, a6, 0);
}

- (void)setValue:(id)a3 forSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  id v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v8 = a6;
  v9 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v15 = (void *)qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    *(_DWORD *)buf = 67109378;
    v27 = objc_msgSend(v12, "unsignedIntValue");
    v28 = 2114;
    v29 = v13;
    _os_log_impl(&dword_19ECC4000, v16, OS_LOG_TYPE_DEFAULT, "Set value %u for settings: %{public}@", buf, 0x12u);

  }
  v24 = CFSTR("restrictedValue");
  v21 = v12;
  v22 = v13;
  v20 = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileConnection setParametersForSettingsByType:toSystem:user:passcode:](self, "setParametersForSettingsByType:toSystem:user:passcode:", v19, v9, v8, v14);

}

- (void)setValues:(id)a3 forIntersectionSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  id v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v6 = a6;
  v7 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v12 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = v10;
    v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_19ECC4000, v12, OS_LOG_TYPE_DEFAULT, "Set values %{public}@ for intersection settings: %{public}@", buf, 0x16u);
  }
  v20 = CFSTR("intersection");
  v18 = v11;
  if (v10)
  {
    v16 = CFSTR("values");
    v17 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA70];
  }
  v19 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileConnection setParametersForSettingsByType:toSystem:user:](self, "setParametersForSettingsByType:toSystem:user:", v15, v7, v6);

  if (v10)
}

- (void)setValues:(id)a3 forUnionSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  id v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v6 = a6;
  v7 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v12 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = v10;
    v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_19ECC4000, v12, OS_LOG_TYPE_DEFAULT, "Set values %{public}@ for union settings: %{public}@", buf, 0x16u);
  }
  v20 = CFSTR("union");
  v18 = v11;
  if (v10)
  {
    v16 = CFSTR("values");
    v17 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA70];
  }
  v19 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileConnection setParametersForSettingsByType:toSystem:user:](self, "setParametersForSettingsByType:toSystem:user:", v15, v7, v6);

  if (v10)
}

- (id)userSettingsForSystem
{
  void *v2;
  void *v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemUserSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)userSettingsForCurrentUser
{
  void *v2;
  void *v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userUserSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)userSettingsForPairedDevice
{
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  return objc_alloc_init(MEMORY[0x1E0C99D80]);
}

- (id)parametersForBoolSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection userSettings](self, "userSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("restrictedBool"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)parametersForValueSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection userSettings](self, "userSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("restrictedValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)parametersForIntersectionSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection userSettings](self, "userSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("intersection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)parametersForUnionSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection userSettings](self, "userSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("values"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)defaultBoolValueForSetting:(id)a3
{
  id v4;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  LODWORD(self) = +[MCRestrictionManager defaultBoolValueForSetting:](MCRestrictionManager, "defaultBoolValueForSetting:", v4);

  return (int)self;
}

- (id)defaultValueForSetting:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager defaultValueForSetting:](MCRestrictionManager, "defaultValueForSetting:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultValuesForIntersectionSetting:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager defaultIntersectedValuesForSetting:](MCRestrictionManager, "defaultIntersectedValuesForSetting:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultValuesForUnionSetting:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager defaultUnionValuesForSetting:](MCRestrictionManager, "defaultUnionValuesForSetting:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultParametersForBoolSetting:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager defaultParametersForBoolSetting:](MCRestrictionManager, "defaultParametersForBoolSetting:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultParametersForValueSetting:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager defaultParametersForValueSetting:](MCRestrictionManager, "defaultParametersForValueSetting:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultParametersForIntersectionSetting:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager defaultParametersForIntersectedValuesSetting:](MCRestrictionManager, "defaultParametersForIntersectedValuesSetting:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultParametersForUnionSetting:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager defaultParametersForUnionValuesSetting:](MCRestrictionManager, "defaultParametersForUnionValuesSetting:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)effectiveParametersForUnionSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectiveParametersForUnionSetting:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)effectiveBoolValueForSetting:(id)a3 configurationUUID:(id)a4 outAsk:(BOOL *)a5
{
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
  {
    v10 = 0;
  }
  else
  {
    -[MCProfileConnection effectiveParametersForBoolSetting:configurationUUID:](self, "effectiveParametersForBoolSetting:configurationUUID:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if (objc_msgSend(v12, "BOOLValue"))
      {
        if (a5)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ask"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *a5 = objc_msgSend(v14, "BOOLValue");

        }
        v10 = 1;
      }
      else
      {
        v10 = 2;
      }
    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (id)effectiveValuesForUnionSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
  {
    v5 = 0;
  }
  else
  {
    -[MCProfileConnection effectiveParametersForUnionSetting:](self, "effectiveParametersForUnionSetting:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("values"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (int)effectiveBoolValueForWatchSetting:(id)a3 pairedDevice:(id)a4
{
  return -[MCProfileConnection effectiveBoolValueForWatchSetting:pairedDevice:outError:](self, "effectiveBoolValueForWatchSetting:pairedDevice:outError:", a3, a4, 0);
}

- (id)effectiveValueForWatchSetting:(id)a3 pairedDevice:(id)a4
{
  return -[MCProfileConnection effectiveValueForWatchSetting:pairedDevice:outError:](self, "effectiveValueForWatchSetting:pairedDevice:outError:", a3, a4, 0);
}

- (id)effectiveValuesForWatchIntersectionSetting:(id)a3 pairedDevice:(id)a4
{
  return -[MCProfileConnection effectiveValuesForWatchIntersectionSetting:pairedDevice:outError:](self, "effectiveValuesForWatchIntersectionSetting:pairedDevice:outError:", a3, a4, 0);
}

- (id)effectiveValuesForWatchUnionSetting:(id)a3 pairedDevice:(id)a4
{
  return -[MCProfileConnection effectiveValuesForWatchUnionSetting:pairedDevice:outError:](self, "effectiveValuesForWatchUnionSetting:pairedDevice:outError:", a3, a4, 0);
}

- (int)effectiveBoolValueForWatchSetting:(id)a3 pairedDevice:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v9, "valueForProperty:", *MEMORY[0x1E0D51730]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForProperty:", *MEMORY[0x1E0D51700]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__9;
    v25 = __Block_byref_object_dispose__9;
    v26 = 0;
    -[MCProfileConnection xpcConnection](self, "xpcConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __89__MCProfileConnection_Settings__effectiveBoolValueForWatchSetting_pairedDevice_outError___block_invoke;
    v20[3] = &unk_1E41E38D8;
    v20[4] = &v21;
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __89__MCProfileConnection_Settings__effectiveBoolValueForWatchSetting_pairedDevice_outError___block_invoke_2;
    v19[3] = &unk_1E41E3C18;
    v19[4] = &v21;
    v19[5] = &v27;
    objc_msgSend(v15, "effectiveBoolValueForWatchSetting:pairingID:pairingDataStore:completion:", v8, v11, v12, v19);

    if (v22[5])
    {
      v16 = (id)qword_1ECD40B38;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v22[5], "MCVerboseDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v8;
        v33 = 2114;
        v34 = v17;
        _os_log_impl(&dword_19ECC4000, v16, OS_LOG_TYPE_ERROR, "Failed to retrieve effective BOOL for feature “%{public}@” with error: %{public}@", buf, 0x16u);

      }
      v10 = 0;
      if (a5)
        *a5 = objc_retainAutorelease((id)v22[5]);
    }
    else
    {
      v10 = *((_DWORD *)v28 + 6);
    }
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
  }

  return v10;
}

void __89__MCProfileConnection_Settings__effectiveBoolValueForWatchSetting_pairedDevice_outError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __89__MCProfileConnection_Settings__effectiveBoolValueForWatchSetting_pairedDevice_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  if (v7)
  {
    if (objc_msgSend(v7, "BOOLValue"))
      v6 = 1;
    else
      v6 = 2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  }

}

- (id)effectiveValueForWatchSetting:(id)a3 pairedDevice:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v9, "valueForProperty:", *MEMORY[0x1E0D51730]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForProperty:", *MEMORY[0x1E0D51700]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__9;
    v31 = __Block_byref_object_dispose__9;
    v32 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__9;
    v25 = __Block_byref_object_dispose__9;
    v26 = 0;
    -[MCProfileConnection xpcConnection](self, "xpcConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __85__MCProfileConnection_Settings__effectiveValueForWatchSetting_pairedDevice_outError___block_invoke;
    v20[3] = &unk_1E41E38D8;
    v20[4] = &v21;
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __85__MCProfileConnection_Settings__effectiveValueForWatchSetting_pairedDevice_outError___block_invoke_2;
    v19[3] = &unk_1E41E3C18;
    v19[4] = &v21;
    v19[5] = &v27;
    objc_msgSend(v15, "effectiveValueForWatchSetting:pairingID:pairingDataStore:completion:", v8, v11, v12, v19);

    if (v22[5])
    {
      v16 = (id)qword_1ECD40B38;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v22[5], "MCVerboseDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v8;
        v35 = 2114;
        v36 = v17;
        _os_log_impl(&dword_19ECC4000, v16, OS_LOG_TYPE_ERROR, "Failed to retrieve effective value for feature “%{public}@” with error: %{public}@", buf, 0x16u);

      }
      v10 = 0;
      if (a5)
        *a5 = objc_retainAutorelease((id)v22[5]);
    }
    else
    {
      v10 = (id)v28[5];
    }
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
  }

  return v10;
}

void __85__MCProfileConnection_Settings__effectiveValueForWatchSetting_pairedDevice_outError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __85__MCProfileConnection_Settings__effectiveValueForWatchSetting_pairedDevice_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)effectiveValuesForWatchIntersectionSetting:(id)a3 pairedDevice:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v9, "valueForProperty:", *MEMORY[0x1E0D51730]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForProperty:", *MEMORY[0x1E0D51700]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__9;
    v31 = __Block_byref_object_dispose__9;
    v32 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__9;
    v25 = __Block_byref_object_dispose__9;
    v26 = 0;
    -[MCProfileConnection xpcConnection](self, "xpcConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __98__MCProfileConnection_Settings__effectiveValuesForWatchIntersectionSetting_pairedDevice_outError___block_invoke;
    v20[3] = &unk_1E41E38D8;
    v20[4] = &v21;
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __98__MCProfileConnection_Settings__effectiveValuesForWatchIntersectionSetting_pairedDevice_outError___block_invoke_2;
    v19[3] = &unk_1E41E3C40;
    v19[4] = &v21;
    v19[5] = &v27;
    objc_msgSend(v15, "effectiveValuesForWatchIntersectionSetting:pairingID:pairingDataStore:completion:", v8, v11, v12, v19);

    if (v22[5])
    {
      v16 = (id)qword_1ECD40B38;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v22[5], "MCVerboseDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v8;
        v35 = 2114;
        v36 = v17;
        _os_log_impl(&dword_19ECC4000, v16, OS_LOG_TYPE_ERROR, "Failed to retrieve effective intersection values for feature “%{public}@” with error: %{public}@", buf, 0x16u);

      }
      v10 = 0;
      if (a5)
        *a5 = objc_retainAutorelease((id)v22[5]);
    }
    else
    {
      v10 = (id)v28[5];
    }
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
  }

  return v10;
}

void __98__MCProfileConnection_Settings__effectiveValuesForWatchIntersectionSetting_pairedDevice_outError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __98__MCProfileConnection_Settings__effectiveValuesForWatchIntersectionSetting_pairedDevice_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)effectiveValuesForWatchUnionSetting:(id)a3 pairedDevice:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v9, "valueForProperty:", *MEMORY[0x1E0D51730]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForProperty:", *MEMORY[0x1E0D51700]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__9;
    v31 = __Block_byref_object_dispose__9;
    v32 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__9;
    v25 = __Block_byref_object_dispose__9;
    v26 = 0;
    -[MCProfileConnection xpcConnection](self, "xpcConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __91__MCProfileConnection_Settings__effectiveValuesForWatchUnionSetting_pairedDevice_outError___block_invoke;
    v20[3] = &unk_1E41E38D8;
    v20[4] = &v21;
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __91__MCProfileConnection_Settings__effectiveValuesForWatchUnionSetting_pairedDevice_outError___block_invoke_2;
    v19[3] = &unk_1E41E3C40;
    v19[4] = &v21;
    v19[5] = &v27;
    objc_msgSend(v15, "effectiveValuesForWatchUnionSetting:pairingID:pairingDataStore:completion:", v8, v11, v12, v19);

    if (v22[5])
    {
      v16 = (id)qword_1ECD40B38;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v22[5], "MCVerboseDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v8;
        v35 = 2114;
        v36 = v17;
        _os_log_impl(&dword_19ECC4000, v16, OS_LOG_TYPE_ERROR, "Failed to retrieve effective union values for feature “%{public}@” with error: %{public}@", buf, 0x16u);

      }
      v10 = 0;
      if (a5)
        *a5 = objc_retainAutorelease((id)v22[5]);
    }
    else
    {
      v10 = (id)v28[5];
    }
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
  }

  return v10;
}

void __91__MCProfileConnection_Settings__effectiveValuesForWatchUnionSetting_pairedDevice_outError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __91__MCProfileConnection_Settings__effectiveValuesForWatchUnionSetting_pairedDevice_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)requestEffectiveBoolValueForSetting:(id)a3 configurationUUID:(id)a4 promptOptions:(id)a5 completion:(id)a6
{
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __112__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_completion___block_invoke;
  v28[3] = &unk_1E41E3C90;
  v29 = v10;
  v12 = v10;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)MEMORY[0x1A1AF040C](v28);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v11;
  v24 = 3221225472;
  v25 = __112__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_completion___block_invoke_2;
  v26 = &unk_1E41E3950;
  v27 = v16;
  v20 = v16;
  objc_msgSend(v19, "remoteObjectProxyWithErrorHandler:", &v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "showFeaturePromptForSetting:configurationUUID:promptOptions:promptIdentifier:completion:", v15, v14, v13, v18, v20, v23, v24, v25, v26);

  return v18;
}

void __112__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  int v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      objc_msgSend(v5, "MCVerboseDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_ERROR, "Request effective restricted BOOL value error. Error: %{public}@", buf, 0xCu);

    }
  }
  v9 = *(void **)(a1 + 32);
  if (v9)
  {
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __112__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_completion___block_invoke_12;
    block[3] = &unk_1E41E3C68;
    v13 = v9;
    v14 = a2;
    v12 = v5;
    dispatch_async(v10, block);

  }
}

uint64_t __112__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_completion___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __112__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)requestEffectiveBoolValueForSetting:(id)a3 configurationUUID:(id)a4 promptOptions:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__9;
  v25 = __Block_byref_object_dispose__9;
  v26 = 0;
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __110__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_outError___block_invoke;
  v20[3] = &unk_1E41E38D8;
  v20[4] = &v21;
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __110__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_outError___block_invoke_2;
  v19[3] = &unk_1E41E3CB8;
  v19[4] = &v21;
  v19[5] = &v27;
  objc_msgSend(v15, "showFeaturePromptForSetting:configurationUUID:promptOptions:promptIdentifier:completion:", v10, v11, v12, 0, v19);

  if (a6)
  {
    v16 = (void *)v22[5];
    if (v16)
      *a6 = objc_retainAutorelease(v16);
  }
  v17 = *((_DWORD *)v28 + 6);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v17;
}

void __110__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_outError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __110__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_outError___block_invoke_2(uint64_t a1, int a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)cancelRequestEffectiveBoolValue:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __76__MCProfileConnection_Settings__cancelRequestEffectiveBoolValue_completion___block_invoke;
  v19[3] = &unk_1E41E3950;
  v20 = v6;
  v8 = v6;
  v9 = a3;
  v10 = (void *)MEMORY[0x1A1AF040C](v19);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  v15 = 3221225472;
  v16 = __76__MCProfileConnection_Settings__cancelRequestEffectiveBoolValue_completion___block_invoke_2;
  v17 = &unk_1E41E3950;
  v18 = v10;
  v12 = v10;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cancelFeaturePromptWithIdentifier:completion:", v9, v12, v14, v15, v16, v17);

}

void __76__MCProfileConnection_Settings__cancelRequestEffectiveBoolValue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Cancel request effective restricted BOOL value error. Error: %{public}@", buf, 0xCu);

    }
  }
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __76__MCProfileConnection_Settings__cancelRequestEffectiveBoolValue_completion___block_invoke_15;
    v9[3] = &unk_1E41E3CE0;
    v11 = v7;
    v10 = v3;
    dispatch_async(v8, v9);

  }
}

uint64_t __76__MCProfileConnection_Settings__cancelRequestEffectiveBoolValue_completion___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __76__MCProfileConnection_Settings__cancelRequestEffectiveBoolValue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isSettingLockedDownByRestrictions:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSettingLockedDownByRestrictions:", v4);

  return v6;
}

- (BOOL)_areProfilesRestrictingSettings:(id)a3 outMDMName:(id *)a4 outExchangeName:(id *)a5 outExchangeCount:(int64_t *)a6 outProfileName:(id *)a7 outProfileCount:(int64_t *)a8
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v45;
  void *v46;
  int64_t v47;
  uint64_t v48;
  id obj;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v45 = v9;
  -[MCProfileConnection _settingsLockedDownByRestrictions:](self, "_settingsLockedDownByRestrictions:", v9);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99D80];
  MDMFilePath();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithContentsOfFile:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D448D0]);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50 = 0;
  }
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "profileIdentifiersRestrictingSettings:", v46);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = 0;
    v48 = 0;
    v19 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v56 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        v22 = (void *)MEMORY[0x1A1AF0250]();
        if (v12 && objc_msgSend(v21, "isEqualToString:", v50))
        {
          +[MCManifest installedProfileWithIdentifier:](MCManifest, "installedProfileWithIdentifier:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "organization");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(v23, "organization");
            v25 = objc_claimAutoreleasedReturnValue();

            v48 = v25;
          }
          else
          {
            objc_msgSend(v23, "friendlyName");
            v27 = objc_claimAutoreleasedReturnValue();

            ++v17;
            v18 = v27;
          }

        }
        else
        {
          if (!v18)
          {
            +[MCManifest installedProfileWithIdentifier:](MCManifest, "installedProfileWithIdentifier:", v21);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "friendlyName");
            v18 = objc_claimAutoreleasedReturnValue();

          }
          ++v17;
        }
        objc_autoreleasePoolPop(v22);
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v48 = 0;
  }

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "exchangeUUIDsRestrictingSettings:", v46);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v31 = v29;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v32)
  {
    v33 = v32;
    v47 = 0;
    v34 = 0;
    v35 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v52 != v35)
          objc_enumerationMutation(v31);
        objc_msgSend(v30, "accountWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        if (!v34)
        {
          objc_msgSend(v37, "accountDescription");
          v34 = objc_claimAutoreleasedReturnValue();
        }

      }
      v47 += v33;
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v33);
  }
  else
  {
    v47 = 0;
    v34 = 0;
  }

  if (a4)
    *a4 = objc_retainAutorelease((id)v48);
  if (a5)
    *a5 = objc_retainAutorelease((id)v34);
  if (a6)
    *a6 = v47;
  if (a7)
    *a7 = objc_retainAutorelease((id)v18);
  if (a8)
    *a8 = v17;

  return (v48 | v18 | v34) != 0;
}

- (id)localizedRestrictionSourceDescriptionForFeatures:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v14 = 0;
  v15 = 0;
  v12 = 0;
  v13 = 0;
  v11 = 0;
  v5 = -[MCProfileConnection _areProfilesRestrictingSettings:outMDMName:outExchangeName:outExchangeCount:outProfileName:outProfileCount:](self, "_areProfilesRestrictingSettings:outMDMName:outExchangeName:outExchangeCount:outProfileName:outProfileCount:", v4, &v13, &v12, &v15, &v11, &v14);

  v6 = v13;
  v7 = v12;
  v8 = v11;
  v9 = 0;
  if (v5)
  {
    -[MCProfileConnection _localizedRestrictionSourceDescriptionFromMDMName:exchangeName:exchangeCount:profileName:profileCount:](self, "_localizedRestrictionSourceDescriptionFromMDMName:exchangeName:exchangeCount:profileName:profileCount:", v6, v7, v15, v8, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_settingsLockedDownByRestrictions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (-[MCProfileConnection isSettingLockedDownByRestrictions:](self, "isSettingLockedDownByRestrictions:", v11, (_QWORD)v14))
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (BOOL)areSettingsLockedDownByRestrictions:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (-[MCProfileConnection isSettingLockedDownByRestrictions:](self, "isSettingLockedDownByRestrictions:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12))
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)isValueSettingLockedDownByRestrictions:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isValueSettingLockedDownByRestrictions:", v4);

  return v6;
}

- (BOOL)isIntersectionSettingLockedDownByRestrictions:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isIntersectionSettingLockedDownByRestrictions:", v4);

  return v6;
}

- (BOOL)isUnionSettingLockedDownByRestrictions:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUnionSettingLockedDownByRestrictions:", v4);

  return v6;
}

- (void)removeBoolSetting:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v5 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_DEFAULT, "Remove Bool settings: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_18_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeBoolSetting:completion:", v4, &__block_literal_global_18_0);

}

void __51__MCProfileConnection_Settings__removeBoolSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Remove BOOL setting error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)removeValueSetting:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v5 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_DEFAULT, "Remove Value settings: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_19_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeValueSetting:completion:", v4, &__block_literal_global_19_0);

}

void __52__MCProfileConnection_Settings__removeValueSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Remove value setting error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (id)effectiveUserSettings
{
  void *v2;
  void *v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveUserSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)resetAllSettingsToDefaults
{
  -[MCProfileConnection resetAllSettingsToDefaultsIsUserInitiated:waitUntilCompleted:completion:](self, "resetAllSettingsToDefaultsIsUserInitiated:waitUntilCompleted:completion:", 1, 1, &__block_literal_global_20_1);
}

void __59__MCProfileConnection_Settings__resetAllSettingsToDefaults__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Reset all settings error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)resetAllSettingsToDefaultsIsUserInitiated:(BOOL)a3 completion:(id)a4
{
  -[MCProfileConnection resetAllSettingsToDefaultsIsUserInitiated:waitUntilCompleted:completion:](self, "resetAllSettingsToDefaultsIsUserInitiated:waitUntilCompleted:completion:", a3, 0, a4);
}

- (void)resetAllSettingsToDefaultsIsUserInitiated:(BOOL)a3 waitUntilCompleted:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v5 = a4;
  v6 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v9 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("NO");
    if (v6)
      v10 = CFSTR("YES");
    *(_DWORD *)buf = 138543362;
    v19 = v10;
    _os_log_impl(&dword_19ECC4000, v9, OS_LOG_TYPE_DEFAULT, "Reset all settings to defaults. User Initiated: %{public}@", buf, 0xCu);
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __105__MCProfileConnection_Settings__resetAllSettingsToDefaultsIsUserInitiated_waitUntilCompleted_completion___block_invoke;
  v16[3] = &unk_1E41E3950;
  v17 = v8;
  v11 = v8;
  v12 = (void *)MEMORY[0x1A1AF040C](v16);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v5)
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  else
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "resetAllSettingsToDefaultsIsUserInitiated:completion:", v6, v12);
}

void __105__MCProfileConnection_Settings__resetAllSettingsToDefaultsIsUserInitiated_waitUntilCompleted_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Reset all settings error. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (int)userBoolValueForSetting:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLSettingForFeature:", v4);

  return v6;
}

- (id)userValueForSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueSettingForFeature:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)userValueForIntersectionSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intersectedValuesSettingForFeature:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)userValueForUnionSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionValuesSettingForFeature:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)lockedDownRootCertificatesWithOutLocalizedSourceDescription:(id *)a3
{
  MCProfileConnection *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  __SecCertificate *v23;
  __SecCertificate *v24;
  CFDataRef v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  MCProfileConnection *v36;
  id *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  char v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v4 = self;
  v60 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  +[MCManifest sharedManifest](MCManifest, "sharedManifest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allProfileIdentifiersInstalledNonInteractivelyWithFilterFlags:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileConnection installedProfileIdentifiersWithFilterFlags:](v4, "installedProfileIdentifiersWithFilterFlags:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  -[MCProfileConnection installedMDMProfileIdentifier](v4, "installedMDMProfileIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v7, "addObject:", v9);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v10 = v7;
  v41 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (!v41)
  {
    v46 = 0;
    v49 = 0;
    v31 = 0;
    v30 = v10;
    goto LABEL_35;
  }
  v36 = v4;
  v37 = a3;
  v38 = v6;
  v44 = 0;
  v49 = 0;
  v46 = 0;
  v40 = *(_QWORD *)v55;
  v39 = v10;
  do
  {
    for (i = 0; i != v41; ++i)
    {
      if (*(_QWORD *)v55 != v40)
        objc_enumerationMutation(v10);
      v12 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
      v13 = (void *)MEMORY[0x1A1AF0250]();
      +[MCManifest sharedManifest](MCManifest, "sharedManifest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v12;
      objc_msgSend(v14, "installedProfileWithIdentifier:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v42 = v13;
        v43 = i;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        objc_msgSend(v15, "payloads");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v51;
          v48 = v16;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v51 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v22 = v21;
                if (objc_msgSend(v22, "isFullyTrustedRootCert"))
                {
                  v23 = (__SecCertificate *)objc_msgSend(v22, "copyCertificate");
                  if (v23)
                  {
                    v24 = v23;
                    v25 = SecCertificateCopyData(v23);
                    objc_msgSend(v47, "addObject:", v25);
                    v26 = v15;
                    objc_msgSend(v15, "installOptions");
                    v27 = v9;
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "objectForKey:", CFSTR("managingProfileIdentifier"));
                    v29 = (void *)objc_claimAutoreleasedReturnValue();

                    v9 = v27;
                    if (v27
                      && ((objc_msgSend(v45, "isEqualToString:", v27) & 1) != 0
                       || v29 && (objc_msgSend(v29, "isEqualToString:", v27) & 1) != 0))
                    {
                      v44 = 1;
                    }
                    else
                    {
                      if (!v46)
                      {
                        objc_msgSend(v26, "friendlyName");
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      ++v49;
                    }
                    CFRelease(v24);

                    v15 = v26;
                    v16 = v48;
                  }
                }

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
          }
          while (v18);
        }

        v10 = v39;
        v13 = v42;
        i = v43;
      }

      objc_autoreleasePoolPop(v13);
    }
    v41 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  }
  while (v41);

  a3 = v37;
  if ((v44 & 1) != 0)
  {
    v4 = v36;
    -[MCProfileConnection installedProfileWithIdentifier:](v36, "installedProfileWithIdentifier:", v9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "friendlyName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v38;
LABEL_35:

    goto LABEL_37;
  }
  v31 = 0;
  v6 = v38;
  v4 = v36;
LABEL_37:
  -[MCProfileConnection _localizedCertificateSourceDescriptionFromMDMName:exchangeName:exchangeCount:profileName:profileCount:](v4, "_localizedCertificateSourceDescriptionFromMDMName:exchangeName:exchangeCount:profileName:profileCount:", v31, 0, 0, v46, v49);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (a3)
    *a3 = objc_retainAutorelease(v32);
  v34 = v47;

  return v34;
}

- (id)permittedAutoLockSeconds
{
  void *v2;
  void *v3;

  +[MCHacks sharedHacks](MCHacks, "sharedHacks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "permittedAutoLockNumbers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setAllowedGrandfatheredRestrictionFeature:(id)a3 forRestrictionKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MCSystemMetadataFilePath();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  v10 = (void *)MEMORY[0x1E0C99E08];
  if ((v9 & 1) != 0)
  {
    MCSystemMetadataFilePath();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithContentsOfFile:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)objc_opt_new();
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AllowedGrandfatheredRestrictions"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {
      v16 = (void *)objc_msgSend(v15, "mutableCopy");
      if ((objc_msgSend(v16, "containsObject:", v5) & 1) == 0)
      {
        objc_msgSend(v16, "addObject:", v5);
        v17 = objc_msgSend(v16, "copy");

        v15 = (void *)v17;
      }

    }
    else
    {
      v22[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v18;
    }
  }
  else
  {
    v21 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v6);

  v19 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("AllowedGrandfatheredRestrictions"));

  MCSystemMetadataFilePath();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "MCWriteToBinaryFile:", v20);

}

- (void)setAllowedGrandfatheredRestrictionBoolFeature:(id)a3
{
  -[MCProfileConnection _setAllowedGrandfatheredRestrictionFeature:forRestrictionKey:](self, "_setAllowedGrandfatheredRestrictionFeature:forRestrictionKey:", a3, CFSTR("restrictedBool"));
}

- (void)setAllowedGrandfatheredRestrictionValueFeature:(id)a3
{
  -[MCProfileConnection _setAllowedGrandfatheredRestrictionFeature:forRestrictionKey:](self, "_setAllowedGrandfatheredRestrictionFeature:forRestrictionKey:", a3, CFSTR("restrictedValue"));
}

- (void)setAllowedGrandfatheredRestrictionIntersectionFeature:(id)a3
{
  -[MCProfileConnection _setAllowedGrandfatheredRestrictionFeature:forRestrictionKey:](self, "_setAllowedGrandfatheredRestrictionFeature:forRestrictionKey:", a3, CFSTR("intersection"));
}

- (void)setAllowedGrandfatheredRestrictionUnionFeature:(id)a3
{
  -[MCProfileConnection _setAllowedGrandfatheredRestrictionFeature:forRestrictionKey:](self, "_setAllowedGrandfatheredRestrictionFeature:forRestrictionKey:", a3, CFSTR("union"));
}

- (void)lockDeviceImmediately:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lockDeviceImmediately:", v3);

}

- (void)lockDevice
{
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection lockDeviceImmediately:](self, "lockDeviceImmediately:", 0);
}

- (BOOL)isPasscodeRequired
{
  void *v2;
  BOOL v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "restrictedBoolForFeature:", CFSTR("forcePIN")) == 1;

  return v3;
}

- (BOOL)isPasscodeRequiredByProfiles
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemProfileRestrictions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v3, "keyEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("forcePIN"), v9);

        if (v10 == 1)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)isPasscodeModificationAllowed
{
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  return (objc_msgSend(MEMORY[0x1E0D1C1E8], "isSharediPad") & 1) != 0
      || +[MCRestrictionManager mayChangePasscode](MCRestrictionManager, "mayChangePasscode");
}

- (BOOL)isPasscodeRecoveryAllowed
{
  _BOOL4 v3;

  v3 = -[MCProfileConnection isPasscodeRecoverySupported](self, "isPasscodeRecoverySupported");
  if (v3)
    LOBYTE(v3) = -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowPasscodeRecovery")) != 2;
  return v3;
}

- (BOOL)isPasscodeRecoveryRestricted
{
  return !-[MCProfileConnection isPasscodeRecoverySupported](self, "isPasscodeRecoverySupported")
      || -[MCProfileConnection isSettingLockedDownByRestrictions:](self, "isSettingLockedDownByRestrictions:", CFSTR("allowPasscodeRecovery"))|| !-[MCProfileConnection isPasscodeModificationAllowed](self, "isPasscodeModificationAllowed")|| -[MCProfileConnection isLockdownModeEnabled](self, "isLockdownModeEnabled");
}

- (void)setPasscodeRecoveryAllowed:(BOOL)a3 passcode:(id)a4
{
  id v4;

  v4 = -[MCProfileConnection setPasscodeRecoveryAllowed:](self, "setPasscodeRecoveryAllowed:", a3, a4);
}

- (id)setPasscodeRecoveryAllowed:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  if (-[MCProfileConnection isPasscodeRecoverySupported](self, "isPasscodeRecoverySupported"))
  {
    -[MCProfileConnection errorCheckedSetBoolValue:forSetting:](self, "errorCheckedSetBoolValue:forSetting:", v3, CFSTR("allowPasscodeRecovery"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("SETTINGS_SETTING_IS_RESTRICTED"), v5, v6, v7, v8, v9, v10, v11, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCSettingsErrorDomain"), 28003, v14, v15, CFSTR("MCFatalError"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (void)setPasscodeRecoveryAllowed:(BOOL)a3 passcode:(id)a4 completionBlock:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__MCProfileConnection_Passcode__setPasscodeRecoveryAllowed_passcode_completionBlock___block_invoke;
  v9[3] = &unk_1E41E3950;
  v10 = v7;
  v8 = v7;
  -[MCProfileConnection setPasscodeRecoveryAllowed:completionBlock:](self, "setPasscodeRecoveryAllowed:completionBlock:", v5, v9);

}

uint64_t __85__MCProfileConnection_Passcode__setPasscodeRecoveryAllowed_passcode_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setPasscodeRecoveryAllowed:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(id, void *);

  v4 = a3;
  v17 = (void (**)(id, void *))a4;
  if (-[MCProfileConnection isPasscodeRecoverySupported](self, "isPasscodeRecoverySupported"))
  {
    -[MCProfileConnection setBoolValue:forSetting:errorCompletionBlock:](self, "setBoolValue:forSetting:errorCompletionBlock:", v4, CFSTR("allowPasscodeRecovery"), v17);
  }
  else if (v17)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("SETTINGS_SETTING_IS_RESTRICTED"), v6, v7, v8, v9, v10, v11, v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCSettingsErrorDomain"), 28003, v14, v15, CFSTR("MCFatalError"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17[2](v17, v16);
  }

}

- (BOOL)recoveryPasscodeAvailable
{
  int v2;

  v2 = -[MCProfileConnection isPasscodeRecoveryAllowed](self, "isPasscodeRecoveryAllowed");
  if (v2)
    LOBYTE(v2) = MCKeybagMementoBlobExists();
  return v2;
}

- (id)clearRecoveryPasscode
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__10;
  v15 = __Block_byref_object_dispose__10;
  v3 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__MCProfileConnection_Passcode__clearRecoveryPasscode__block_invoke;
  v10[3] = &unk_1E41E38D8;
  v10[4] = &v11;
  v4 = (void *)MEMORY[0x1A1AF040C](v10);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __54__MCProfileConnection_Passcode__clearRecoveryPasscode__block_invoke_5;
  v9[3] = &unk_1E41E38D8;
  v9[4] = &v11;
  objc_msgSend(v6, "clearRecoveryPasscodeWithCompletion:", v9);

  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __54__MCProfileConnection_Passcode__clearRecoveryPasscode__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    v5 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      objc_msgSend(v4, "MCVerboseDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_ERROR, "Clear recovery passcode error. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __54__MCProfileConnection_Passcode__clearRecoveryPasscode__block_invoke_5(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    v5 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      objc_msgSend(v4, "MCVerboseDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_ERROR, "Clear recovery passcode error. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

- (void)clearRecoveryPasscodeWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__MCProfileConnection_Passcode__clearRecoveryPasscodeWithCompletion___block_invoke;
  v9[3] = &unk_1E41E3950;
  v10 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1A1AF040C](v9);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearRecoveryPasscodeWithCompletion:", v6);

}

void __69__MCProfileConnection_Passcode__clearRecoveryPasscodeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Clear recovery passcode error. Error: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)isPasscodeCompliantWithNamedPolicy:(id)a3 outError:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__10;
  v19 = __Block_byref_object_dispose__10;
  v7 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__MCProfileConnection_Passcode__isPasscodeCompliantWithNamedPolicy_outError___block_invoke;
  v14[3] = &unk_1E41E38D8;
  v14[4] = &v15;
  v8 = (void *)MEMORY[0x1A1AF040C](v14);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __77__MCProfileConnection_Passcode__isPasscodeCompliantWithNamedPolicy_outError___block_invoke_6;
  v13[3] = &unk_1E41E3AB8;
  v13[4] = &v15;
  v13[5] = &v21;
  objc_msgSend(v10, "isPasscodeCompliantWithNamedPolicy:completion:", v6, v13);

  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v11 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __77__MCProfileConnection_Passcode__isPasscodeCompliantWithNamedPolicy_outError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    v5 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v7 = v5;
      objc_msgSend(v6, "MCVerboseDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_ERROR, "Unable to determine passcode compliance. Error: %{public}@", (uint8_t *)&v9, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __77__MCProfileConnection_Passcode__isPasscodeCompliantWithNamedPolicy_outError___block_invoke_6(uint64_t a1, char a2, void *a3)
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v9 = v7;
      objc_msgSend(v8, "MCVerboseDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_19ECC4000, v9, OS_LOG_TYPE_ERROR, "Unable to determine passcode compliance. Error: %{public}@", (uint8_t *)&v11, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (BOOL)isPasscodeNagDaemonEnabled
{
  int AppBooleanValue;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("DisablePasscodeNagD"), (CFStringRef)*MEMORY[0x1E0C9B228], &keyExistsAndHasValidFormat);
  return !keyExistsAndHasValidFormat || AppBooleanValue == 0;
}

- (BOOL)changePasscodeFrom:(id)a3 to:(id)a4 outError:(id *)a5
{
  return -[MCProfileConnection changePasscodeFrom:to:skipRecovery:outError:](self, "changePasscodeFrom:to:skipRecovery:outError:", a3, a4, 0, a5);
}

- (BOOL)changePasscodeFrom:(id)a3 to:(id)a4 skipRecovery:(BOOL)a5 outError:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__10;
  v24 = __Block_byref_object_dispose__10;
  v12 = MEMORY[0x1E0C809B0];
  v25 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __77__MCProfileConnection_Passcode__changePasscodeFrom_to_skipRecovery_outError___block_invoke;
  v19[3] = &unk_1E41E38D8;
  v19[4] = &v20;
  v13 = (void *)MEMORY[0x1A1AF040C](v19);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __77__MCProfileConnection_Passcode__changePasscodeFrom_to_skipRecovery_outError___block_invoke_8;
  v18[3] = &unk_1E41E3AB8;
  v18[4] = &v20;
  v18[5] = &v26;
  objc_msgSend(v15, "changePasscode:oldPasscode:isRecovery:skipRecovery:completion:", v11, v10, 0, v7, v18);

  if (a6)
    *a6 = objc_retainAutorelease((id)v21[5]);
  v16 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v16;
}

void __77__MCProfileConnection_Passcode__changePasscodeFrom_to_skipRecovery_outError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    v5 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      objc_msgSend(v4, "MCVerboseDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_ERROR, "Change passcode error. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __77__MCProfileConnection_Passcode__changePasscodeFrom_to_skipRecovery_outError___block_invoke_8(uint64_t a1, char a2, void *a3)
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Change passcode error. Error: %{public}@", (uint8_t *)&v10, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (BOOL)changePasscodeWithRecoveryPasscode:(id)a3 to:(id)a4 outError:(id *)a5
{
  return -[MCProfileConnection changePasscodeWithRecoveryPasscode:to:skipRecovery:outError:](self, "changePasscodeWithRecoveryPasscode:to:skipRecovery:outError:", a3, a4, 0, a5);
}

- (BOOL)changePasscodeWithRecoveryPasscode:(id)a3 to:(id)a4 skipRecovery:(BOOL)a5 outError:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__10;
  v24 = __Block_byref_object_dispose__10;
  v12 = MEMORY[0x1E0C809B0];
  v25 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __93__MCProfileConnection_Passcode__changePasscodeWithRecoveryPasscode_to_skipRecovery_outError___block_invoke;
  v19[3] = &unk_1E41E38D8;
  v19[4] = &v20;
  v13 = (void *)MEMORY[0x1A1AF040C](v19);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __93__MCProfileConnection_Passcode__changePasscodeWithRecoveryPasscode_to_skipRecovery_outError___block_invoke_9;
  v18[3] = &unk_1E41E3AB8;
  v18[4] = &v20;
  v18[5] = &v26;
  objc_msgSend(v15, "changePasscode:oldPasscode:isRecovery:skipRecovery:completion:", v11, v10, 1, v7, v18);

  if (a6)
    *a6 = objc_retainAutorelease((id)v21[5]);
  v16 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v16;
}

void __93__MCProfileConnection_Passcode__changePasscodeWithRecoveryPasscode_to_skipRecovery_outError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    v5 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      objc_msgSend(v4, "MCVerboseDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_ERROR, "Change passcode with recovery passcode error. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __93__MCProfileConnection_Passcode__changePasscodeWithRecoveryPasscode_to_skipRecovery_outError___block_invoke_9(uint64_t a1, char a2, void *a3)
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Change passcode with recovery passcode error. Error: %{public}@", (uint8_t *)&v10, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (BOOL)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  _QWORD v16[6];
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v8 = a3;
  v9 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v10 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_DEBUG, "Attempting clearing passcode with escrow keybag", buf, 2u);
  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  *(_QWORD *)buf = 0;
  v18 = buf;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__10;
  v21 = __Block_byref_object_dispose__10;
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__MCProfileConnection_Passcode__clearPasscodeWithEscrowKeybagData_secret_outError___block_invoke;
  v16[3] = &unk_1E41E3A90;
  v16[4] = &v23;
  v16[5] = buf;
  v11 = (void *)MEMORY[0x1A1AF040C](v16);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clearPasscodeWithEscrowKeybagData:secret:completion:", v8, v9, v11);

  if (a5)
    *a5 = objc_retainAutorelease(*((id *)v18 + 5));
  v14 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v23, 8);

  return v14;
}

void __83__MCProfileConnection_Passcode__clearPasscodeWithEscrowKeybagData_secret_outError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    v5 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      objc_msgSend(v4, "MCVerboseDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_ERROR, "Clear passcode error. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (BOOL)unlockDeviceWithPasscode:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "unlockDeviceWithPasscode:outError:", v6, a4);

  return (char)a4;
}

- (BOOL)isContentProtectionInEffect
{
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  return MKBGetDeviceLockState() != 3 && (int)MKBDeviceFormattedForContentProtection() > 0;
}

- (BOOL)passcode:(id)a3 meetsCurrentConstraintsOutError:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "passcode:compliesWithPolicyCheckHistory:outError:", v6, 1, a4);

  return (char)a4;
}

- (BOOL)currentPasscodeIsCompliantWithGlobalRestrictionsOutError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentRestrictions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v6, "currentPasscodeCompliesWithPolicyFromRestrictions:outError:", v5, &v9);
  v7 = v9;

  if (a3 && v7)
    *a3 = objc_retainAutorelease(v7);

  return v7 == 0;
}

- (BOOL)currentPasscodeIsCompliantWithProfileRestrictionsOutError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "combinedProfileRestrictions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "currentPasscodeCompliesWithPolicyFromRestrictions:outError:", v5, a3);

  return (char)a3;
}

- (int)_getPasscodeComplianceWarningExpiryDate:(id)a3 lastLockDate:(id)a4 outLocalizedTitle:(id *)a5 outLocalizedMessage:(id *)a6
{
  id v10;
  id v11;
  double v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  int v47;
  void *v48;
  id v49;
  double v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  _BOOL4 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __CFString *v67;
  uint64_t v68;
  __CFString *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  id *v73;
  id *v74;
  id v75;
  uint8_t buf[4];
  id v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  int v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (!+[MCRestrictionManager mayChangePasscode](MCRestrictionManager, "mayChangePasscode"))
  {
    v18 = 0;
    v17 = 0;
    v19 = 0;
    if (!a5)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(v10, "timeIntervalSinceNow");
  if (v12 >= 0.0)
  {
    v73 = a5;
    v74 = a6;
    v75 = v10;
    v21 = (void *)MEMORY[0x1E0C99D80];
    MCNagUIMetaFilePath();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryWithContentsOfFile:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v23, "count"))
    {
      v24 = 0;
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localeIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("lastLocale"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("message"));
        v28 = objc_claimAutoreleasedReturnValue();
        if (!v28
          || (v29 = (void *)v28, v30 = objc_msgSend(v26, "isEqualToString:", v27), v29, (v30 & 1) != 0))
        {

          v18 = 0;
          v35 = v23;
          goto LABEL_26;
        }
        v31 = qword_1ECD40B38;
        v32 = os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT);
        if ((v24 & 1) != 0)
          break;
        if (v32)
        {
          *(_DWORD *)buf = 138543874;
          v77 = v27;
          v78 = 2114;
          v79 = v26;
          v80 = 1024;
          v81 = 1;
          _os_log_impl(&dword_19ECC4000, v31, OS_LOG_TYPE_DEFAULT, "Cached nag may be in an old locale (it's %{public}@, we're %{public}@), asking to regenerate it (%d more tries)", buf, 0x1Cu);
        }
        -[MCProfileConnection recomputeUserComplianceWarningSynchronously](self, "recomputeUserComplianceWarningSynchronously");

        v33 = (void *)MEMORY[0x1E0C99D80];
        MCNagUIMetaFilePath();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "dictionaryWithContentsOfFile:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = 1;
        v23 = v35;
        if (!objc_msgSend(v35, "count"))
          goto LABEL_22;
      }
      if (v32)
      {
        *(_DWORD *)buf = 138543618;
        v77 = v27;
        v78 = 2114;
        v79 = v26;
        _os_log_impl(&dword_19ECC4000, v31, OS_LOG_TYPE_DEFAULT, "Cached nag may be in an old locale (it's %{public}@, we're %{public}@), continuing anyway", buf, 0x16u);
      }

      v18 = 0;
      v17 = 0;
      v19 = 0;
LABEL_59:

      a6 = v74;
      v10 = v75;
      a5 = v73;
      if (!v73)
        goto LABEL_9;
LABEL_8:
      *a5 = objc_retainAutorelease(v17);
      goto LABEL_9;
    }
    v35 = v23;
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    MCBackupContainsPasscodeFilePath();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "fileExistsAtPath:", v37);

    if (!v38)
    {
      v18 = 0;
      v17 = 0;
      v19 = 0;
      v23 = v35;
      goto LABEL_59;
    }
    if (-[MCProfileConnection isPasscodeSet](self, "isPasscodeSet"))
    {
      -[MCProfileConnection notifyUserHasSeenComplianceMessageWithLastLockDate:](self, "notifyUserHasSeenComplianceMessageWithLastLockDate:", v11);
      v18 = 0;
      v17 = 0;
      v19 = 0;
LABEL_58:
      v23 = v35;
      goto LABEL_59;
    }
    v53 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v53, OS_LOG_TYPE_DEFAULT, "Advising user to set passcode since they've restored a backup", buf, 2u);
    }
    MCLocalizedString(CFSTR("NAG_UI_PASSCODE_REMINDER_TITLE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedStringByDevice(CFSTR("NAG_UI_PASSCODE_REMINDER_MESSAGE"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
LABEL_26:
      MCLocalizedFormat(CFSTR("NAG_UI_COMPLIANCE_TITLE"), v39, v40, v41, v42, v43, v44, v45, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("mandatory"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "BOOLValue");

    if (!v47)
    {
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("message"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v52;
      if (v52)
      {
        v49 = v52;

        v18 = v49;
      }
      else if (!v18)
      {
        MCLocalizedStringByDevice(CFSTR("NAG_UI_GENERIC_WARNING"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
LABEL_54:

      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("lastLockDate"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v71;
      if (v71)
        v19 = 2 * (objc_msgSend(v71, "compare:", v11) == -1);
      else
        v19 = 2;

      goto LABEL_58;
    }
    objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("expiryDate"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      v49 = v48;
      objc_msgSend(v48, "timeIntervalSinceNow");
      if (v50 <= 3600.0)
      {
LABEL_43:
        objc_msgSend(v49, "timeIntervalSinceNow");
        v57 = v56;
        MCFormattedStringForTimeInterval(v56);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = -[MCProfileConnection isPasscodeSet](self, "isPasscodeSet");
        if (v57 <= 60.0)
        {
          if (v59)
            v69 = CFSTR("NAG_UI_MANDATORY_MESSAGE");
          else
            v69 = CFSTR("NAG_UI_MANDATORY_NOPASS_MESSAGE");
          MCLocalizedFormatByDevice(v69, v60, v61, v62, v63, v64, v65, v66, (uint64_t)v58);
          v70 = objc_claimAutoreleasedReturnValue();

          v19 = 1;
          v23 = v35;
          v18 = (void *)v70;
          goto LABEL_59;
        }
        if (v59)
          v67 = CFSTR("NAG_UI_COUNTDOWN_MESSAGE_P_MINUTES");
        else
          v67 = CFSTR("NAG_UI_COUNTDOWN_NOPASS_MESSAGE_P_MINUTES");
        MCLocalizedFormatByDevice(v67, v60, v61, v62, v63, v64, v65, v66, (uint64_t)v58);
        v68 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v68;
        goto LABEL_54;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:");
      v51 = objc_claimAutoreleasedReturnValue();

      v49 = (id)v51;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 3600.0);
      v49 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[MCProfileConnection xpcConnection](self, "xpcConnection");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_33);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "notifyStartComplianceTimer:completion:", v49, &__block_literal_global_33);

    goto LABEL_43;
  }
  v13 = (void *)qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)MEMORY[0x1E0C99D68];
    v15 = v13;
    objc_msgSend(v14, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v77 = v10;
    v78 = 2114;
    v79 = v16;
    _os_log_impl(&dword_19ECC4000, v15, OS_LOG_TYPE_DEFAULT, "Current passcode expired at %{public}@ and current date is %{public}@. Requiring mandatory passcode change.", buf, 0x16u);

  }
  MCLocalizedString(CFSTR("NAG_UI_EXPIRY_TITLE"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedStringByDevice(CFSTR("NAG_UI_EXPIRY_MESSAGE"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 1;
  if (a5)
    goto LABEL_8;
LABEL_9:
  if (a6)
    *a6 = objc_retainAutorelease(v18);

  return v19;
}

void __124__MCProfileConnection_Passcode___getPasscodeComplianceWarningExpiryDate_lastLockDate_outLocalizedTitle_outLocalizedMessage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Notify start compliance timer error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (int)getPasscodeComplianceWarningLastLockDate:(id)a3 outLocalizedTitle:(id *)a4 outLocalizedMessage:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection passcodeExpiryDate](self, "passcodeExpiryDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = -[MCProfileConnection _getPasscodeComplianceWarningExpiryDate:lastLockDate:outLocalizedTitle:outLocalizedMessage:](self, "_getPasscodeComplianceWarningExpiryDate:lastLockDate:outLocalizedTitle:outLocalizedMessage:", v9, v8, a4, a5);

  return (int)a5;
}

- (void)getPasscodeComplianceWarningLastLockDate:(id)a3 completionBlock:(id)a4
{
  void (**v6)(id, _QWORD, id, id);
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v6 = (void (**)(id, _QWORD, id, id))a4;
  v7 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "passcodeExpiryDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v14 = 0;
  v10 = -[MCProfileConnection _getPasscodeComplianceWarningExpiryDate:lastLockDate:outLocalizedTitle:outLocalizedMessage:](self, "_getPasscodeComplianceWarningExpiryDate:lastLockDate:outLocalizedTitle:outLocalizedMessage:", v9, v7, &v14, &v13);

  v11 = v14;
  v12 = v13;
  if (v6)
    v6[2](v6, v10, v11, v12);

}

- (void)recomputeUserComplianceWarningSynchronously
{
  void *v3;
  id v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_34_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recomputeUserComplianceWarningWithCompletion:", &__block_literal_global_34_1);

}

void __76__MCProfileConnection_Passcode__recomputeUserComplianceWarningSynchronously__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Recompute user compliance warning error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)recomputeUserComplianceWarning
{
  void *v3;
  id v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_35);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recomputeUserComplianceWarningWithCompletion:", &__block_literal_global_35);

}

void __63__MCProfileConnection_Passcode__recomputeUserComplianceWarning__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Recompute user compliance warning error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)notifyClientsToRecomputeCompliance
{
  void *v3;
  id v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_36_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recomputePerClientUserComplianceWithCompletion:", &__block_literal_global_36_1);

}

void __67__MCProfileConnection_Passcode__notifyClientsToRecomputeCompliance__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Notify clients to recompute compliance error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)notifyUserHasSeenComplianceMessageWithLastLockDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v4, 1.0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_37);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notifyHaveSeenComplianceMessageWithLastLockDate:completion:", v7, &__block_literal_global_37);

}

void __84__MCProfileConnection_Passcode__notifyUserHasSeenComplianceMessageWithLastLockDate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Notify user seen compliance error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (id)passcodeCreationDate
{
  void *v2;
  void *v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passcodeCreationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)passcodeExpiryDate
{
  void *v2;
  void *v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passcodeExpiryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)recoveryPasscodeExpiryDate
{
  void *v2;
  void *v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recoveryPasscodeExpiryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)unlockScreenType
{
  void *v2;
  int v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentUnlockScreenType");

  return v3;
}

- (int)unlockScreenTypeWithOutSimplePasscodeType:(int *)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (a3)
  {
    +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "currentUnlockSimplePasscodeType");

    *a3 = v5;
  }
  +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "currentUnlockScreenType");

  return v7;
}

- (int)unlockScreenTypeForUser:(id)a3 outSimplePasscodeType:(int *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;

  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (a4)
  {
    +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unlockSimplePasscodeTypeForUser:", v6);

    *a4 = v8;
  }
  +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unlockScreenTypeForUser:", v6);

  return v10;
}

- (int)recoveryPasscodeUnlockScreenType
{
  void *v2;
  int v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "recoveryPasscodeUnlockScreenType");

  return v3;
}

- (int)recoveryPasscodeUnlockScreenTypeWithOutSimplePasscodeType:(int *)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (a3)
  {
    +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "recoveryPasscodeUnlockSimplePasscodeType");

    *a3 = v5;
  }
  +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "recoveryPasscodeUnlockScreenType");

  return v7;
}

- (int)unlockScreenTypeForPasscode:(id)a3 outSimplePasscodeType:(int *)a4
{
  return +[MCPasscodeUtilities unlockScreenTypeForPasscode:outSimplePasscodeType:](MCPasscodeUtilities, "unlockScreenTypeForPasscode:outSimplePasscodeType:", a3, a4);
}

- (int)newPasscodeEntryScreenType
{
  void *v2;
  int v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "newPasscodeEntryScreenType");

  return v3;
}

- (int)newPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3
{
  void *v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v4, "newPasscodeEntryScreenTypeWithOutSimplePasscodeType:", a3);

  return (int)a3;
}

- (int)minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3
{
  void *v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v4, "minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:", a3);

  return (int)a3;
}

- (int)defaultNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3
{
  void *v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v4, "defaultNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:", a3);

  return (int)a3;
}

- (id)localizedDescriptionOfCurrentPasscodeConstraints
{
  void *v2;
  void *v3;
  void *v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRestrictions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCPasscodeManager localizedDescriptionOfPasscodePolicyFromRestrictions:](MCPasscodeManager, "localizedDescriptionOfPasscodePolicyFromRestrictions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedDescriptionOfDefaultNewPasscodeConstraints
{
  void *v2;
  void *v3;
  void *v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRestrictions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCPasscodeManager localizedDescriptionOfDefaultNewPasscodePolicyFromRestrictions:](MCPasscodeManager, "localizedDescriptionOfDefaultNewPasscodePolicyFromRestrictions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)managedWiFiNetworkNames
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__11;
  v12 = __Block_byref_object_dispose__11;
  v13 = 0;
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_34);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__MCProfileConnection_Misc__managedWiFiNetworkNames__block_invoke_1;
  v7[3] = &unk_1E41E3D28;
  v7[4] = &v8;
  objc_msgSend(v4, "managedWiFiNetworkNamesWithCompletion:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __52__MCProfileConnection_Misc__managedWiFiNetworkNames__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Managed WLAN network names error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __52__MCProfileConnection_Misc__managedWiFiNetworkNames__block_invoke_1(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Managed WLAN network names error. Error: %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (void)invalidateRestrictionCache
{
  void *v2;
  id v3;

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateSettings");

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateRestrictions");

}

- (void)recomputeProfileRestrictionsWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_3_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recomputeProfileRestrictionsWithCompletionBlock:", v4);

}

void __77__MCProfileConnection_Misc__recomputeProfileRestrictionsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Remove Profile Restrictions remote object proxy error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)shutDown
{
  -[MCProfileConnection shutDownWithCompletion:](self, "shutDownWithCompletion:", 0);
}

- (void)shutDownWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  void *v10;
  id xpcConnectionInvalidatedActionBlock;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  NSObject *v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD *v23;
  id v24;
  id location;
  _QWORD v26[3];
  char v27;
  _QWORD v28[4];
  id v29;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v5 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke;
  v28[3] = &unk_1E41E3950;
  v6 = v4;
  v29 = v6;
  v7 = (void *)MEMORY[0x1A1AF040C](v28);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v8 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_4;
  v21[3] = &unk_1E41E3D50;
  objc_copyWeak(&v24, &location);
  v23 = v26;
  v9 = v8;
  v22 = v9;
  v10 = (void *)MEMORY[0x1A1AF040C](v21);
  xpcConnectionInvalidatedActionBlock = self->xpcConnectionInvalidatedActionBlock;
  self->xpcConnectionInvalidatedActionBlock = v10;

  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_2;
  v17[3] = &unk_1E41E3DC8;
  v12 = v6;
  v19 = v12;
  v20 = v26;
  v17[4] = self;
  v13 = v9;
  v18 = v13;
  v14 = (void *)MEMORY[0x1A1AF040C](v17);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shutDownWithCompletion:", v14);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  _Block_object_dispose(v26, 8);
}

void __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Shut down connection error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

void __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_4(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v3, OS_LOG_TYPE_DEFAULT, "XPC connection with profiled was invalidated, stop waiting.", buf, 2u);
    }
    v4 = WeakRetained[8];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_5;
    block[3] = &unk_1E41E35E0;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(v4, block);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

uint64_t __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_5(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v3;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Failed to shut down profiled with error: %{public}@", buf, 0xCu);
    }
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[2] = __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_7;
    v10[3] = &unk_1E41E3DA0;
    v14 = *(_QWORD *)(a1 + 56);
    v10[1] = 3221225472;
    v8 = v6;
    v9 = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = v9;
    v13 = *(id *)(a1 + 48);
    dispatch_async_and_wait(v7, v10);

  }
}

void __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_7(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  __int128 v10;
  uint8_t buf[16];

  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    v2 = a1[6];
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
  else
  {
    v3 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v3, OS_LOG_TYPE_DEFAULT, "Waiting for profiled to shut down...", buf, 2u);
    }
    v4 = a1[4];
    v5 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v4, v5);
    v6 = *(NSObject **)(a1[5] + 64);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_8;
    block[3] = &unk_1E41E3D78;
    v8 = *((_OWORD *)a1 + 3);
    v7 = (id)v8;
    v10 = v8;
    dispatch_async(v6, block);

  }
}

void __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_8(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v2 = qword_1ECD40B38;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_DEFAULT, "Profiled has exited.", buf, 2u);
    }
    v3 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_FAULT, "Timed out waiting for profiled to exit.", v16, 2u);
    }
    v4 = (void *)MEMORY[0x1E0D1C1A8];
    DMCHangTracerDirectory();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dumpStackshotToPath:fileName:", v5, CFSTR("profiled_shutdown_hang.ips"));

    v6 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("ERROR_FAILED_TO_SHUT_DOWN_PROFILED"), v7, v8, v9, v10, v11, v12, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCGeneralErrorDomain"), 65000, v14, CFSTR("MCFatalError"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = *(_QWORD *)(a1 + 32);
  if (v15)
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v3);

}

- (id)managedSystemConfigurationServiceIDs
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__11;
  v12 = __Block_byref_object_dispose__11;
  v13 = 0;
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_14_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__MCProfileConnection_Misc__managedSystemConfigurationServiceIDs__block_invoke_15;
  v7[3] = &unk_1E41E3D28;
  v7[4] = &v8;
  objc_msgSend(v4, "managedSystemConfigurationServiceIDsWithCompletion:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __65__MCProfileConnection_Misc__managedSystemConfigurationServiceIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Managed system config service IDs error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __65__MCProfileConnection_Misc__managedSystemConfigurationServiceIDs__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Managed system config service IDs error. Error: %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (id)managedAppIDs
{
  void *v2;
  void *v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44778], "attributesByAppID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)doNotBackupAppIDs
{
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  return (id)objc_msgSend(MEMORY[0x1E0D44778], "managedAppIDsWithFlags:", 4);
}

- (id)managedEmailDomains
{
  return -[MCProfileConnection effectiveValuesForIntersectionSetting:](self, "effectiveValuesForIntersectionSetting:", CFSTR("managedEmailDomains"));
}

- (void)setManagedEmailDomains:(id)a3
{
  -[MCProfileConnection setValues:forIntersectionSetting:](self, "setValues:forIntersectionSetting:", a3, CFSTR("managedEmailDomains"));
}

- (id)crossSiteTrackingPreventionRelaxedApps
{
  return -[MCProfileConnection effectiveValuesForIntersectionSetting:](self, "effectiveValuesForIntersectionSetting:", CFSTR("crossSiteTrackingPreventionRelaxedApps"));
}

- (void)migrateWithContext:(int)a3 passcodeWasSetInBackup:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  MCProfileConnection *v19;
  id v20;
  int v21;
  BOOL v22;
  _QWORD v23[4];
  id v24;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __82__MCProfileConnection_Misc__migrateWithContext_passcodeWasSetInBackup_completion___block_invoke;
  v23[3] = &unk_1E41E3950;
  v24 = v8;
  v10 = v8;
  v15 = v9;
  v16 = 3221225472;
  v17 = __82__MCProfileConnection_Misc__migrateWithContext_passcodeWasSetInBackup_completion___block_invoke_17;
  v18 = &unk_1E41E3DF0;
  v19 = self;
  v20 = (id)MEMORY[0x1A1AF040C](v23);
  v21 = v6;
  v22 = v5;
  v11 = v20;
  v12 = (void *)MEMORY[0x1A1AF040C](&v15);
  -[MCProfileConnection xpcConnection](self, "xpcConnection", v15, v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "migrateWithContext:passcodeWasSetInBackup:completion:", v6, v5, v12);

}

void __82__MCProfileConnection_Misc__migrateWithContext_passcodeWasSetInBackup_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Migrate with context error. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

void __82__MCProfileConnection_Misc__migrateWithContext_passcodeWasSetInBackup_completion___block_invoke_17(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {

    goto LABEL_7;
  }
  if (objc_msgSend(v7, "code") != 4097)
  {
    v4 = objc_msgSend(v7, "code");

    if (v4 == 4099)
      goto LABEL_6;
LABEL_7:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_8;
  }

LABEL_6:
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "migrateWithContext:passcodeWasSetInBackup:completion:", *(unsigned int *)(a1 + 48), *(unsigned __int8 *)(a1 + 52), *(_QWORD *)(a1 + 40));

LABEL_8:
}

- (void)migrateCleanupMigratorWithContext:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__MCProfileConnection_Misc__migrateCleanupMigratorWithContext_completion___block_invoke;
  v15[3] = &unk_1E41E3950;
  v8 = v6;
  v16 = v8;
  v9 = (void *)MEMORY[0x1A1AF040C](v15);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __74__MCProfileConnection_Misc__migrateCleanupMigratorWithContext_completion___block_invoke_18;
  v13[3] = &unk_1E41E3950;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "migrateCleanupMigratorWithContext:completion:", v4, v13);

}

void __74__MCProfileConnection_Misc__migrateCleanupMigratorWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "MCCleanupMigrator: Error in handler: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

void __74__MCProfileConnection_Misc__migrateCleanupMigratorWithContext_completion___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "MCCleanupMigrator: Error in completion: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (id)associatedDomainsForManagedApps
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44778], "attributesByAppID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v4)
    {
      v5 = v4;
      v21 = 0;
      v6 = *(_QWORD *)v23;
      v18 = CFSTR("BundleID");
      v19 = v3;
      do
      {
        v7 = 0;
        v20 = v5;
        do
        {
          if (*(_QWORD *)v23 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v7);
          objc_msgSend(v3, "objectForKeyedSubscript:", v8, v18);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AssociatedDomains"));
          v10 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AssociatedDomainsEnableDirectDownloads"));
          v11 = objc_claimAutoreleasedReturnValue();
          if (v10 | v11)
          {
            v12 = v6;
            v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, v18);
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("AssociatedDomains"));
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("AssociatedDomainsEnableDirectDownloads"));
            v14 = v21;
            if (!v21)
              v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v21 = v14;
            objc_msgSend(v14, "addObject:", v13);

            v6 = v12;
            v5 = v20;
            v3 = v19;
          }

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v5);
    }
    else
    {
      v21 = 0;
    }
    v15 = v21;
    v16 = (void *)objc_msgSend(v21, "copy");
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }

  return v16;
}

- (BOOL)isDeprecatedWebKitTLSAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowDeprecatedWebKitTLS")) == 1;
}

- (BOOL)isDeprecatedWebKitSynchronousXHRLoadsAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowDeprecatedWebKitSynchronousXHRLoads")) == 1;
}

- (BOOL)isSafariPasswordAutoFillAllowedForURL:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCSafariPasswordAutoFillDomainsCache sharedCache](MCSafariPasswordAutoFillDomainsCache, "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSafariPasswordAutoFillAllowedForURL:", v4);

  return v6;
}

- (BOOL)isAuthenticationBeforeAutoFillRequired
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("forceAuthenticationBeforeAutoFill")) == 1;
}

- (BOOL)isPasswordSharingAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowPasswordSharing")) != 2;
}

- (BOOL)isPasswordProximityAutoFillRequestingAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowPasswordProximityRequests")) != 2;
}

- (id)trustedCodeSigningIdentities
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveUnionValuesForSetting:", CFSTR("trustedCodeSigningIdentities"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (void)setTrustedCodeSigningIdentities:(id)a3
{
  -[MCProfileConnection setValues:forUnionSetting:](self, "setValues:forUnionSetting:", a3, CFSTR("trustedCodeSigningIdentities"));
}

- (void)validateAppBundleIDs:(id)a3
{
  -[MCProfileConnection validateAppBundleIDs:waitUntilCompleted:completion:](self, "validateAppBundleIDs:waitUntilCompleted:completion:", a3, 1, 0);
}

- (void)validateAppBundleIDs:(id)a3 completion:(id)a4
{
  -[MCProfileConnection validateAppBundleIDs:waitUntilCompleted:completion:](self, "validateAppBundleIDs:waitUntilCompleted:completion:", a3, 0, a4);
}

- (void)validateAppBundleIDs:(id)a3 waitUntilCompleted:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__MCProfileConnection_Misc__validateAppBundleIDs_waitUntilCompleted_completion___block_invoke;
  v15[3] = &unk_1E41E3950;
  v16 = v8;
  v10 = v8;
  v11 = (void *)MEMORY[0x1A1AF040C](v15);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v5)
    objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  else
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "validateAppBundleIDs:completion:", v9, v11);
}

void __80__MCProfileConnection_Misc__validateAppBundleIDs_waitUntilCompleted_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Validate app bundle IDs error. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (BOOL)isCloudKeychainSyncAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowCloudKeychainSync")) != 2;
}

- (BOOL)isCloudPrivateRelayAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowCloudPrivateRelay")) != 2;
}

- (BOOL)isVehicleUIAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowVehicleUI")) != 2;
}

- (BOOL)isOTAPKIUpdatesAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowOTAPKIUpdates")) != 2;
}

- (void)setAutomaticAppUpdatesAllowed:(BOOL)a3
{
  -[MCProfileConnection setBoolValue:forSetting:](self, "setBoolValue:forSetting:", a3, CFSTR("allowAutomaticAppUpdates"));
}

- (BOOL)isAutomaticAppUpdatesModificationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAutomaticAppUpdatesModification")) != 2;
}

- (BOOL)isAppCellularDataModificationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAppCellularDataModification")) != 2;
}

- (BOOL)isCellularPlanModificationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowCellularPlanModification")) != 2;
}

- (BOOL)isWebTextDefineAllowed
{
  return 1;
}

- (BOOL)isWebContentFilteringInEffect
{
  void *v2;
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "effectiveRestrictedBoolForSetting:", CFSTR("forceWebContentFilterAuto")) == 1)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v2, "effectiveIntersectedValuesForSetting:", CFSTR("webContentFilterWhitelistedURLs"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(v2, "effectiveUnionValuesForSetting:", CFSTR("webContentFilterBlacklistedURLs"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v3 = 1;
      }
      else
      {
        +[MCDependencyReader sharedReader](MCDependencyReader, "sharedReader");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "parentsInDomain:", CFSTR("MCDMProfileWithWebContentFilterToPayloadUUIDDependencyKey"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v7, "count") != 0;

      }
    }

  }
  return v3;
}

- (BOOL)isAdTrackingLimited
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("forceLimitAdTracking")) == 1;
}

- (BOOL)isIdentifierForAdvertisingAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowIdentifierForAdvertising")) != 2;
}

- (BOOL)isApplePersonalizedAdvertisingAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowApplePersonalizedAdvertising")) != 2;
}

- (BOOL)isLockScreenWiFiModificationAllowed
{
  return 1;
}

- (BOOL)isUIAppInstallationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowUIAppInstallation")) != 2;
}

- (BOOL)isSystemAppRemovalAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowSystemAppRemoval")) != 2;
}

- (BOOL)isRemovalRestrictedByPolicyForApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44778], "attributesByAppID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5
    && (objc_msgSend(v5, "objectForKeyedSubscript:", v4), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Removable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v11 = objc_msgSend(v9, "BOOLValue") ^ 1;
    else
      LOBYTE(v11) = 0;

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)isAppRatingLimitInEffect
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MCProfileConnection effectiveValueForSetting:](self, "effectiveValueForSetting:", CFSTR("ratingApps"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (int)objc_msgSend(v2, "intValue") < 1000;
  else
    v4 = 0;

  return v4;
}

- (BOOL)isAirDropAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAirDrop")) != 2;
}

- (BOOL)isAirPrintAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAirPrint")) != 2;
}

- (BOOL)isAirPrintiBeaconDiscoveryAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAirPrintiBeaconDiscovery")) != 2;
}

- (BOOL)isAirPrintCredentialsStorageAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAirPrintCredentialsStorage")) != 2;
}

- (BOOL)isAirPrintTrustedTLSRequirementEnforced
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("forceAirPrintTrustedTLSRequirement")) == 1;
}

- (BOOL)isCameraAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowCamera")) != 2;
}

- (BOOL)isLockScreenNotificationsViewAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowLockScreenNotificationsView")) != 2;
}

- (BOOL)isLockScreenTodayViewAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowLockScreenTodayView")) != 2;
}

- (BOOL)isLockScreenControlCenterAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowLockScreenControlCenter")) != 2;
}

- (BOOL)isControlCenterAllowedInApps
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowControlCenterInApps")) != 2;
}

- (BOOL)isActivationLockAllowed
{
  void *v2;
  int v3;
  void *v4;
  char v5;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSupervised");

  if (!v3)
    return 1;
  objc_msgSend(MEMORY[0x1E0D44760], "sharedClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActivationLockAllowedWhileSupervised");

  return v5;
}

- (BOOL)isAssistantUserGeneratedContentAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAssistantUserGeneratedContent")) != 2;
}

- (BOOL)isFingerprintModificationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowFingerprintModification")) != 2;
}

- (BOOL)isFingerprintUnlockAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowFingerprintForUnlock")) != 2;
}

- (BOOL)isAutoUnlockAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAutoUnlock")) != 2;
}

- (BOOL)isAirPlayOutgoingRequestsPairingPasswordRequired
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("forceAirPlayOutgoingRequestsPairingPassword")) == 1;
}

- (BOOL)isAirPlayIncomingRequestsPairingPasswordRequired
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("forceAirPlayIncomingRequestsPairingPassword")) == 1;
}

- (BOOL)isAirPlayIncomingRequestsAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAirPlayIncomingRequests")) != 2;
}

- (BOOL)isGeotagSharingAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowGeotagSharing")) != 2;
}

- (BOOL)isWiFiPasswordSharingAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowWiFiPasswordSharing")) != 2;
}

- (void)setActivityContinuationAllowed:(BOOL)a3
{
  -[MCProfileConnection setBoolValue:forSetting:](self, "setBoolValue:forSetting:", a3, CFSTR("allowActivityContinuation"));
}

- (BOOL)isBookstoreAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowBookstore")) != 2;
}

- (BOOL)isEnterpriseBookBackupAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowEnterpriseBookBackup")) != 2;
}

- (BOOL)isEnterpriseBookMetadataSyncAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowEnterpriseBookMetadataSync")) != 2;
}

- (BOOL)hasDiagnosticSubmissionAllowedBeenSet
{
  void *v2;
  BOOL v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForFeature:", CFSTR("allowDiagnosticSubmission")) != 0;

  return v3;
}

- (BOOL)isDiagnosticSubmissionModificationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowDiagnosticSubmissionModification")) != 2;
}

- (BOOL)isAppAnalyticsAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAppAnalytics")) == 1;
}

- (BOOL)hasAppAnalyticsAllowedBeenSet
{
  void *v2;
  BOOL v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForFeature:", CFSTR("allowAppAnalytics")) != 0;

  return v3;
}

- (BOOL)isAppAndAccessoryAnalyticsAllowed
{
  return 0;
}

- (BOOL)hasAppAndAccessoryAnalyticsAllowedBeenSet
{
  return 0;
}

- (BOOL)hasHealthDataSubmissionAllowedBeenSet
{
  void *v2;
  BOOL v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForFeature:", CFSTR("allowHealthDataSubmission")) != 0;

  return v3;
}

- (void)setHealthDataSubmissionAllowed:(BOOL)a3
{
  -[MCProfileConnection setBoolValue:forSetting:](self, "setBoolValue:forSetting:", a3, CFSTR("allowHealthDataSubmission"));
}

- (BOOL)isHealthDataSubmission2Allowed
{
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowHealthDataSubmission2")) == 1;
}

- (BOOL)hasHealthDataSubmission2BeenSet
{
  void *v2;
  BOOL v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForFeature:", CFSTR("allowHealthDataSubmission2")) != 0;

  return v3;
}

- (void)setHealthDataSubmission2Allowed:(BOOL)a3
{
  -[MCProfileConnection setBoolValue:forSetting:](self, "setBoolValue:forSetting:", a3, CFSTR("allowHealthDataSubmission2"));
}

- (BOOL)isWheelchairDataSubmissionAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowWheelchairDataSubmission")) == 1;
}

- (BOOL)hasWheelchairDataSubmissionAllowedBeenSet
{
  void *v2;
  BOOL v3;

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForFeature:", CFSTR("allowWheelchairDataSubmission")) != 0;

  return v3;
}

- (void)setWheelchairDataSubmissionAllowed:(BOOL)a3
{
  -[MCProfileConnection setBoolValue:forSetting:](self, "setBoolValue:forSetting:", a3, CFSTR("allowWheelchairDataSubmission"));
}

- (BOOL)isHandWashingDataSubmissionAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowHandWashingDataSubmission")) == 1;
}

- (BOOL)hasHandWashingDataSubmissionAllowedBeenSet
{
  void *v2;
  BOOL v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForFeature:", CFSTR("allowHandWashingDataSubmission")) != 0;

  return v3;
}

- (void)setHandWashingDataSubmissionAllowed:(BOOL)a3
{
  -[MCProfileConnection setBoolValue:forSetting:](self, "setBoolValue:forSetting:", a3, CFSTR("allowHandWashingDataSubmission"));
}

- (BOOL)isSafetyDataSubmissionAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowSafetyDataSubmission")) == 1;
}

- (BOOL)hasSafetyDataSubmissionAllowedBeenSet
{
  void *v2;
  BOOL v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForFeature:", CFSTR("allowSafetyDataSubmission")) != 0;

  return v3;
}

- (void)setSafetyDataSubmissionAllowed:(BOOL)a3
{
  -[MCProfileConnection setBoolValue:forSetting:](self, "setBoolValue:forSetting:", a3, CFSTR("allowSafetyDataSubmission"));
}

- (BOOL)isSiriServerLoggingAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowSiriServerLogging")) != 2;
}

- (BOOL)isOnDeviceOnlyDictationForced
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("forceOnDeviceOnlyDictation")) == 1;
}

- (BOOL)isOnDeviceOnlyTranslationForced
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("forceOnDeviceOnlyTranslation")) == 1;
}

- (BOOL)isPodcastsAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowPodcasts")) != 2;
}

- (BOOL)isFindMyCarAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowFindMyCar")) != 2;
}

- (void)setFindMyCarAllowed:(BOOL)a3
{
  -[MCProfileConnection setBoolValue:forSetting:](self, "setBoolValue:forSetting:", a3, CFSTR("allowFindMyCar"));
}

- (BOOL)isFindMyDeviceAllowed
{
  return (objc_msgSend(MEMORY[0x1E0D1C1E8], "isSharediPad") & 1) == 0
      && -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowFindMyDevice")) != 2;
}

- (BOOL)isFindMyFriendsAllowed
{
  return (objc_msgSend(MEMORY[0x1E0D1C1E8], "isSharediPad") & 1) == 0
      && -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowFindMyFriends")) != 2;
}

- (BOOL)isHomeAllowed
{
  return (objc_msgSend(MEMORY[0x1E0D1C1E8], "isSharediPad") & 1) == 0
      && -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowHome")) != 2;
}

- (BOOL)isiCloudDriveAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowCloudDocumentSync")) != 2;
}

- (BOOL)isInstalledAppNearMeSuggestionsAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowInstalledAppNearMeSuggestions")) != 2;
}

- (BOOL)isUninstalledAppNearMeSuggestionsAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowUninstalledAppNearMeSuggestions")) != 2;
}

- (BOOL)isContactlessPaymentAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowContactlessPayment")) != 2;
}

- (BOOL)isFingerprintForContactlessPaymentAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowFingerprintForContactlessPayment")) != 2;
}

- (BOOL)isBiometricAuthForSignInWithAppleAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowBiometricAuthForSignInWithApple")) != 2;
}

- (BOOL)isInAppPaymentAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowInAppPayment")) != 2;
}

- (BOOL)isPersonalHotspotModificationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowPersonalHotspotModification")) != 2;
}

- (BOOL)isWiFiPowerModificationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("forceWiFiPowerOn")) != 1;
}

- (BOOL)isNFCAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowNFC")) != 2;
}

- (BOOL)isESIMModificationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowESIMModification")) != 2;
}

- (BOOL)isESIMOutgoingTransferAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowESIMOutgoingTransfers")) != 2;
}

- (BOOL)isUSBDriveAccessInFilesAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowFilesUSBDriveAccess")) != 2;
}

- (BOOL)isUSBDriveAccessAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowUSBDriveAccess")) != 2;
}

- (BOOL)isDeviceNameModificationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowDeviceNameModification")) != 2;
}

- (BOOL)isScreenShotAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowScreenShot")) != 2;
}

- (BOOL)isScreenRecordingAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowScreenRecording")) != 2;
}

- (BOOL)isMusicServiceAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowMusicService")) != 2;
}

- (BOOL)isMusicVideoViewingAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowMusicVideos")) != 2;
}

- (BOOL)isMusicArtistActivityAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowMusicArtistActivity")) != 2;
}

- (BOOL)isRadioServiceAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowRadioService")) != 2;
}

- (BOOL)isAutoCorrectionAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAutoCorrection")) != 2;
}

- (BOOL)isSmartPunctuationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowSmartPunctuation")) != 2;
}

- (BOOL)isPredictiveKeyboardAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowPredictiveKeyboard")) != 2;
}

- (BOOL)isContinuousPathKeyboardAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowContinuousPathKeyboard")) != 2;
}

- (BOOL)isSpellCheckAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowSpellCheck")) != 2;
}

- (BOOL)isProximitySetupToNewDeviceAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowProximitySetupToNewDevice")) != 2;
}

- (BOOL)isAccessibilitySpeechAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAccessibilitySpeech")) != 2;
}

- (void)setAutoCorrectionAllowed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_26_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutoCorrectionAllowed:completion:", v3, &__block_literal_global_26_0);

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateSettings");

}

void __54__MCProfileConnection_Misc__setAutoCorrectionAllowed___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Set auto-correction allowed error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)setSmartPunctuationAllowed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_27_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSmartPunctuationAllowed:completion:", v3, &__block_literal_global_27_0);

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateSettings");

}

void __56__MCProfileConnection_Misc__setSmartPunctuationAllowed___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Set smart punctuation allowed error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)setPredictiveKeyboardAllowed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredictiveKeyboardAllowed:completion:", v3, &__block_literal_global_28);

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateSettings");

}

void __58__MCProfileConnection_Misc__setPredictiveKeyboardAllowed___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Set predictive keyboard allowed error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)setContinuousPathKeyboardAllowed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_29_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContinuousPathKeyboardAllowed:completion:", v3, &__block_literal_global_29_0);

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateSettings");

}

void __62__MCProfileConnection_Misc__setContinuousPathKeyboardAllowed___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Set predictive keyboard allowed error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)setKeyboardShortcutsAllowed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_30_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyboardShortcutsAllowed:completion:", v3, &__block_literal_global_30_0);

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateSettings");

}

void __57__MCProfileConnection_Misc__setKeyboardShortcutsAllowed___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Set keyboard shortcuts allowed error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)setSpellCheckAllowed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSpellCheckAllowed:completion:", v3, &__block_literal_global_31);

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateSettings");

}

void __50__MCProfileConnection_Misc__setSpellCheckAllowed___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Set spell-check allowed error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (BOOL)isNewsTodayAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowNewsToday")) != 2;
}

- (BOOL)isSpotlightNewsAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowSpotlightNews")) != 2;
}

- (BOOL)isQuickNoteAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowQuickNote")) != 2;
}

- (BOOL)isMultitaskingAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowMultitasking")) != 2;
}

- (void)setMultitaskingAllowed:(BOOL)a3
{
  -[MCProfileConnection setBoolValue:forSetting:](self, "setBoolValue:forSetting:", a3, CFSTR("allowMultitasking"));
}

- (BOOL)isHashtagImagesAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowHashtagImages")) != 2;
}

- (BOOL)isTVAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowTV")) != 2;
}

- (void)setTVAllowed:(BOOL)a3
{
  -[MCProfileConnection setBoolValue:forSetting:](self, "setBoolValue:forSetting:", a3, CFSTR("allowTV"));
}

- (BOOL)isSoftwareUpdateResisted
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("forceDelayedSoftwareUpdates")) == 1;
}

- (unint64_t)enforcedSoftwareUpdateDelayInDays
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveValueForSetting:", CFSTR("enforcedSoftwareUpdateDelay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (int64_t)softwareUpdatePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  v2 = (void *)MEMORY[0x1E0C99D80];
  MDMFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MCDictionaryFromFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SoftwareUpdateSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RecommendationCadence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (BOOL)isAutomaticDateAndTimeEnforced
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("forceAutomaticDateAndTime")) == 1;
}

- (BOOL)isWiFiWhitelistingEnforced
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("forceWiFiWhitelisting")) == 1;
}

- (BOOL)isWiFiWithAllowedNetworksOnlyEnforced
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("forceWiFiToAllowedNetworksOnly")) == 1;
}

- (BOOL)isGroupActivityAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowGroupActivity")) != 2;
}

- (BOOL)isRemoteAppPairingAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowRemoteAppPairing")) != 2;
}

- (void)setRemoteAppPairingAllowed:(BOOL)a3
{
  -[MCProfileConnection setBoolValue:forSetting:](self, "setBoolValue:forSetting:", a3, CFSTR("allowRemoteAppPairing"));
}

- (BOOL)isTVProviderModificationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowTVProviderModification")) != 2;
}

- (void)setTVProviderModificationAllowed:(BOOL)a3
{
  -[MCProfileConnection setBoolValue:forSetting:](self, "setBoolValue:forSetting:", a3, CFSTR("allowTVProviderModification"));
}

- (BOOL)isTVShowingUndownloadedTVShowsAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowShowingUndownloadedTV")) != 2;
}

- (void)setTVShowingUndownloadedTVShowsAllowed:(BOOL)a3
{
  -[MCProfileConnection setBoolValue:forSetting:](self, "setBoolValue:forSetting:", a3, CFSTR("allowShowingUndownloadedTV"));
}

- (BOOL)isTVShowingUndownloadedMoviesAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowShowingUndownloadedMovies")) != 2;
}

- (void)setTVShowingUndownloadedMoviesAllowed:(BOOL)a3
{
  -[MCProfileConnection setBoolValue:forSetting:](self, "setBoolValue:forSetting:", a3, CFSTR("allowShowingUndownloadedMovies"));
}

- (BOOL)isVPNCreationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowVPNCreation")) != 2;
}

- (BOOL)isDriverDoNotDisturbModificationsAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowDriverDoNotDisturbModifications")) != 2;
}

- (void)setDriverDoNotDisturbModificationsAllowed:(BOOL)a3
{
  -[MCProfileConnection setBoolValue:forSetting:](self, "setBoolValue:forSetting:", a3, CFSTR("allowDriverDoNotDisturbModifications"));
}

- (BOOL)isUSBRestrictedModeAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowUSBRestrictedMode")) != 2;
}

- (BOOL)isLockdownModeEnabled
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowLockdownMode")) == 1;
}

- (BOOL)isSharedDeviceTemporarySessionAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowSharedDeviceTemporarySession")) != 2;
}

- (BOOL)isRapidSecurityResponseInstallationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowRapidSecurityResponseInstallation")) != 2;
}

- (BOOL)isRapidSecurityResponseRemovalAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowRapidSecurityResponseRemoval")) != 2;
}

- (BOOL)isiPhoneWidgetsOnMacAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowiPhoneWidgetsOnMac")) != 2;
}

- (BOOL)isHidingAppsAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAppsToBeHidden")) != 2;
}

- (BOOL)isLockingAppsAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAppsToBeLocked")) != 2;
}

- (BOOL)isPreserveESIMOnEraseEnforced
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("forcePreserveESIMOnErase")) == 1;
}

- (BOOL)isAutoDimAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAutoDim")) != 2;
}

- (BOOL)isCommandTabAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowCommandTab")) != 2;
}

- (BOOL)isControlCenterAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowControlCenter")) != 2;
}

- (BOOL)isCoverSheetAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowCoverSheet")) != 2;
}

- (BOOL)isHomeScreenEditingAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowHomeScreenEditing")) != 2;
}

- (BOOL)isSpotlightAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowSpotlight")) != 2;
}

- (BOOL)isExternalDisplayStageManagerAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowExternalDisplayStageManager")) != 2;
}

- (BOOL)isWallpaperAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowWallpaper")) != 2;
}

- (BOOL)isCalculatorInputModeRPNAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowCalculatorInputModeRPN")) != 2;
}

- (BOOL)isCalculatorInputModeUnitConversionAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowCalculatorInputModeUnitConversion")) != 2;
}

- (BOOL)isCalculatorModeBasicAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowCalculatorModeBasic")) != 2;
}

- (BOOL)isCalculatorModeMathPaperAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowCalculatorModeMathPaper")) != 2;
}

- (BOOL)isCalculatorModeProgrammerAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowCalculatorModeProgrammer")) != 2;
}

- (BOOL)isCalculatorModeScientificAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowCalculatorModeScientific")) != 2;
}

- (BOOL)isKeyboardMathSolvingAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowKeyboardMathSolving")) != 2;
}

- (BOOL)isMathPaperSolvingAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowMathPaperSolving")) != 2;
}

- (BOOL)isSquareRootOnBasicCalculatorForced
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("forceSquareRootOnBasicCalculator")) == 1;
}

- (BOOL)isMarketplaceAppInstallationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowMarketplaceAppInstallation")) != 2;
}

- (BOOL)isWebDistributionAppInstallationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowWebDistributionAppInstallation")) != 2;
}

- (id)allowedMarketplaces
{
  void *v3;
  void *v4;

  if (-[MCProfileConnection isMarketplaceAppInstallationAllowed](self, "isMarketplaceAppInstallationAllowed"))
  {
    -[MCProfileConnection effectiveValuesForIntersectionSetting:](self, "effectiveValuesForIntersectionSetting:", CFSTR("allowedMarketplaceApps"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)deniedMarketplaces
{
  void *v3;
  void *v4;
  void *v5;

  -[MCProfileConnection allowedMarketplaces](self, "allowedMarketplaces");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[MCProfileConnection effectiveValuesForUnionSetting:](self, "effectiveValuesForUnionSetting:", CFSTR("deniedMarketplaceApps"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (BOOL)isMarketplaceAllowed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = a3;
  -[MCProfileConnection allowedMarketplaces](self, "allowedMarketplaces");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    LOBYTE(v7) = objc_msgSend(v5, "containsObject:", v4);
  }
  else
  {
    -[MCProfileConnection deniedMarketplaces](self, "deniedMarketplaces");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "containsObject:", v4) ^ 1;

  }
  return v7;
}

- (BOOL)anyMarketplaceAllowed
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MCProfileConnection allowedMarketplaces](self, "allowedMarketplaces");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "count") != 0;
  else
    v4 = 1;

  return v4;
}

- (BOOL)allMarketplacesAllowed
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[MCProfileConnection allowedMarketplaces](self, "allowedMarketplaces");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[MCProfileConnection deniedMarketplaces](self, "deniedMarketplaces");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v4 = objc_msgSend(v5, "count") == 0;
    else
      v4 = 1;

  }
  return v4;
}

- (BOOL)isOnenessAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowiPhoneMirroring")) != 2;
}

- (BOOL)isVideoConferencingRemoteControlAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowVideoConferencingRemoteControl")) != 2;
}

- (BOOL)isVideoConferencingAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowVideoConferencing")) != 2;
}

- (BOOL)isTodayViewAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowTodayView")) != 2;
}

- (BOOL)isTodayViewModificationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowTodayViewModification")) != 2;
}

uint64_t __68__MCProfileConnection_Misc__restrictionEnforcedNotificationSettings__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("BundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

- (id)_notificationRestrictedApps
{
  return -[MCProfileConnection effectiveValuesForUnionSetting:](self, "effectiveValuesForUnionSetting:", CFSTR("notificationRestrictedApps"));
}

- (id)_restrictionEnforcedNotificationSettingsForBundleID:(id)a3 settingsArray:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("BundleIdentifier"), (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v5);

        if ((v13 & 1) != 0)
        {
          v14 = v11;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)_sharedDeviceConfiguration
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D80];
  MCSharedDeviceConfigurationFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deviceLockScreenFootnote
{
  void *v3;
  void *v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection _sharedDeviceConfiguration](self, "_sharedDeviceConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LockScreenFootnote"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deviceProvisionalEnrollmentFootnote
{
  void *v2;
  void *v3;

  if (-[MCProfileConnection isProvisionallyEnrolled](self, "isProvisionallyEnrolled"))
  {
    objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userMode") == 1)
      MCLocalizedString(CFSTR("TESLA_PROVISIONAL_ENROLLMENT_EDU_TEXT"));
    else
      MCLocalizedStringByDevice(CFSTR("TESLA_PROVISIONAL_ENROLLMENT_TEXT"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)deviceAssetTag
{
  void *v3;
  void *v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection _sharedDeviceConfiguration](self, "_sharedDeviceConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AssetTagInformation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)userSessionTimeout
{
  double result;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D1C1E8], "userSessionTimeout");
  return result;
}

- (double)temporarySessionTimeout
{
  double result;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D1C1E8], "temporarySessionTimeout");
  return result;
}

- (BOOL)isTemporarySessionOnlyModeEnabled
{
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  return objc_msgSend(MEMORY[0x1E0D1C1E8], "temporarySessionOnly");
}

- (BOOL)communicationServiceRulesExistForBundleID:(id)a3 forCommunicationServiceType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  LODWORD(self) = objc_msgSend(v7, "isEqualToString:", CFSTR("AudioCall"));

  if ((_DWORD)self)
  {
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "effectiveUnionValuesForSetting:", CFSTR("audioCallDefaultHandlerAppBundleIDs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "containsObject:", v6);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)defaultAppBundleIDForCommunicationServiceType:(id)a3 forAccountWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v8 = 0;
  if (v6 && v7)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__11;
    v17 = __Block_byref_object_dispose__11;
    v18 = 0;
    -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_45_1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __100__MCProfileConnection_Misc__defaultAppBundleIDForCommunicationServiceType_forAccountWithIdentifier___block_invoke_46;
    v12[3] = &unk_1E41E3E90;
    v12[4] = &v13;
    objc_msgSend(v10, "defaultAppBundleIDForCommunicationServiceType:forAccountWithIdentifier:completion:", v6, v7, v12);

    v8 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

  }
  return v8;
}

void __100__MCProfileConnection_Misc__defaultAppBundleIDForCommunicationServiceType_forAccountWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Default app bundle identifier for comm service type error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __100__MCProfileConnection_Misc__defaultAppBundleIDForCommunicationServiceType_forAccountWithIdentifier___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Default app bundle identifier for comm service type error. Error: %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (id)activationLockBypassKey
{
  void *v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection fetchActivationLockBypassKeyWithError:](self, "fetchActivationLockBypassKeyWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3 != 0;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEFAULT, "Requested activation lock bypass code, it exists: %d", (uint8_t *)v6, 8u);
  }
  return v3;
}

- (void)deleteActivationLockBypassKey
{
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCCrypto clearStoredActivationLockBypassCode](MCCrypto, "clearStoredActivationLockBypassCode");
}

- (id)activationLockBypassHash
{
  void *v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCCrypto storedActivationLockBypassCodeHash](MCCrypto, "storedActivationLockBypassCodeHash");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2 != 0;
    _os_log_impl(&dword_19ECC4000, v3, OS_LOG_TYPE_DEFAULT, "Requested activation lock bypass code hash, it exists: %d", (uint8_t *)v5, 8u);
  }
  return v2;
}

- (void)waitForMigrationIncludingPostRestoreMigration:(BOOL)a3 completion:(id)a4
{
  -[MCProfileConnection waitForMigrationIncludingPostRestoreMigration:waitUntilCompleted:completion:](self, "waitForMigrationIncludingPostRestoreMigration:waitUntilCompleted:completion:", a3, 0, a4);
}

- (void)waitForMigrationIncludingPostRestoreMigration:(BOOL)a3 waitUntilCompleted:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __105__MCProfileConnection_Misc__waitForMigrationIncludingPostRestoreMigration_waitUntilCompleted_completion___block_invoke;
  v14[3] = &unk_1E41E3950;
  v15 = v8;
  v9 = v8;
  v10 = (void *)MEMORY[0x1A1AF040C](v14);
  -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v5)
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  else
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "waitForMigrationIncludingPostRestoreMigration:completion:", v6, v10);
}

void __105__MCProfileConnection_Misc__waitForMigrationIncludingPostRestoreMigration_waitUntilCompleted_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Wait for migration including post restore error. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

- (void)flush
{
  -[MCProfileConnection waitForMigrationIncludingPostRestoreMigration:waitUntilCompleted:completion:](self, "waitForMigrationIncludingPostRestoreMigration:waitUntilCompleted:completion:", 0, 1, 0);
}

- (void)setGracePeriod:(unint64_t)a3 passcode:(id)a4 completionBlock:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a5;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  objc_msgSend(v8, "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileConnection setValue:forSetting:passcode:](self, "setValue:forSetting:passcode:", v10, CFSTR("maxGracePeriod"), v9);

  v11 = v12;
  if (v12)
  {
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
    v11 = v12;
  }

}

- (unint64_t)gracePeriod
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveValueForSetting:", CFSTR("maxGracePeriod"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)setFingerprintUnlockAllowed:(BOOL)a3 passcode:(id)a4 completionBlock:(id)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;

  v6 = a3;
  v9 = a5;
  -[MCProfileConnection setFingerprintUnlockAllowed:passcode:](self, "setFingerprintUnlockAllowed:passcode:", v6, a4);
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    v8 = v9;
  }

}

- (void)setFingerprintUnlockAllowed:(BOOL)a3 passcode:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 1;
  -[MCProfileConnection setBoolValue:ask:forSetting:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:](self, "setBoolValue:ask:forSetting:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:", a3, 0, CFSTR("allowFingerprintForUnlock"), 0, 1, 0, a4, 0, v4, 0);
}

- (void)setFingerprintUnlockAllowed:(BOOL)a3 passcode:(id)a4 completion:(id)a5
{
  uint64_t v5;

  LOBYTE(v5) = 0;
  -[MCProfileConnection setBoolValue:ask:forSetting:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:](self, "setBoolValue:ask:forSetting:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:", a3, 0, CFSTR("allowFingerprintForUnlock"), 0, 1, 0, a4, 0, v5, a5);
}

- (void)setFingerprintUnlockAllowed:(BOOL)a3 credentialSet:(id)a4 completionBlock:(id)a5
{
  _BOOL8 v6;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a3;
  v10 = a5;
  LOBYTE(v9) = 1;
  -[MCProfileConnection setBoolValue:ask:forSetting:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:](self, "setBoolValue:ask:forSetting:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:completion:", v6, 0, CFSTR("allowFingerprintForUnlock"), 0, 1, 0, 0, a4, v9, 0);
  v8 = v10;
  if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    v8 = v10;
  }

}

- (BOOL)isAttentionAwareAutoLockAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAttentionAwareAutoLock")) != 2;
}

- (BOOL)shouldDestroyOldKeybag
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  const __CFString *v9;
  void *v10;
  char v11;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44760], "sharedClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessRights");

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MDMFilePath();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, 0);

  if (!-[MCProfileConnection isSupervised](self, "isSupervised") || (v7 & ((v4 & 4) != 0)) != 0)
    return 1;
  v9 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSynchronize(CFSTR("com.apple.managedconfiguration.notbackedup"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  v10 = (void *)CFPreferencesCopyValue(CFSTR("KeybagMigrationHasBeenClearedByHost"), CFSTR("com.apple.managedconfiguration.notbackedup"), CFSTR("mobile"), v9);
  v11 = objc_msgSend(v10, "BOOLValue");

  return v11;
}

- (void)setAirPlaySettingsUIAllowed:(BOOL)a3 ask:(BOOL)a4 completion:(id)a5
{
  -[MCProfileConnection setBoolValue:ask:forSetting:passcode:completion:](self, "setBoolValue:ask:forSetting:passcode:completion:", a3, a4, CFSTR("allowAirPlaySettingsUI"), 0, a5);
}

- (BOOL)isAirPlaySettingsUIAllowedOutAsk:(BOOL *)a3
{
  return -[MCProfileConnection effectiveBoolValueForSetting:outAsk:](self, "effectiveBoolValueForSetting:outAsk:", CFSTR("allowAirPlaySettingsUI"), a3) != 2;
}

- (void)setAirPlaySecuritySettingsUIAllowed:(BOOL)a3
{
  -[MCProfileConnection setBoolValue:forSetting:](self, "setBoolValue:forSetting:", a3, CFSTR("allowAirPlaySecuritySettingsUI"));
}

- (BOOL)isAirPlaySecuritySettingsUIAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAirPlaySecuritySettingsUI")) != 2;
}

- (void)setMediaPurchaseAllowed:(BOOL)a3 ask:(BOOL)a4 completion:(id)a5
{
  -[MCProfileConnection setBoolValue:ask:forSetting:passcode:completion:](self, "setBoolValue:ask:forSetting:passcode:completion:", a3, a4, CFSTR("allowMediaPurchase"), 0, a5);
}

- (BOOL)isMediaPurchaseAllowedOutAsk:(BOOL *)a3
{
  return -[MCProfileConnection effectiveBoolValueForSetting:outAsk:](self, "effectiveBoolValueForSetting:outAsk:", CFSTR("allowMediaPurchase"), a3) != 2;
}

- (void)setExplicitContentAllowed:(BOOL)a3 ask:(BOOL)a4 completion:(id)a5
{
  -[MCProfileConnection setBoolValue:ask:forSetting:passcode:completion:](self, "setBoolValue:ask:forSetting:passcode:completion:", a3, a4, CFSTR("allowExplicitContent"), 0, a5);
}

- (void)setConferenceRoomDisplayModeEnabled:(BOOL)a3 ask:(BOOL)a4 completion:(id)a5
{
  -[MCProfileConnection setBoolValue:ask:forSetting:passcode:completion:](self, "setBoolValue:ask:forSetting:passcode:completion:", a3, a4, CFSTR("forceConferenceRoomDisplay"), 0, a5);
}

- (BOOL)isConferenceRoomDisplayModeEnabledOutAsk:(BOOL *)a3
{
  return -[MCProfileConnection effectiveBoolValueForSetting:outAsk:](self, "effectiveBoolValueForSetting:outAsk:", CFSTR("forceConferenceRoomDisplay"), a3) != 2;
}

- (void)setConferenceRoomDisplaySettingsUIAllowed:(BOOL)a3 ask:(BOOL)a4 completion:(id)a5
{
  -[MCProfileConnection setBoolValue:ask:forSetting:passcode:completion:](self, "setBoolValue:ask:forSetting:passcode:completion:", a3, a4, CFSTR("allowConferenceRoomDisplaySettingsUI"), 0, a5);
}

- (BOOL)isConferenceRoomDisplaySettingsUIAllowedOutAsk:(BOOL *)a3
{
  return -[MCProfileConnection effectiveBoolValueForSetting:outAsk:](self, "effectiveBoolValueForSetting:outAsk:", CFSTR("allowConferenceRoomDisplaySettingsUI"), a3) != 2;
}

- (BOOL)isDeviceSleepAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowDeviceSleep")) != 2;
}

- (BOOL)isAutomaticScreenSaverAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowAutomaticScreenSaver")) != 2;
}

- (void)startMonitoringEnrollmentStateWithPersonaID:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "monitorEnrollmentStateWithPersonaID:", v4);

}

- (void)stopMonitoringEnrollmentState
{
  void (**waitForEnrollmentCompletionBlock)(id, SEL);
  id v4;

  waitForEnrollmentCompletionBlock = (void (**)(id, SEL))self->waitForEnrollmentCompletionBlock;
  if (waitForEnrollmentCompletionBlock)
  {
    waitForEnrollmentCompletionBlock[2](waitForEnrollmentCompletionBlock, a2);
    v4 = self->waitForEnrollmentCompletionBlock;
    self->waitForEnrollmentCompletionBlock = 0;

  }
}

- (void)createMDMUnlockTokenIfNeededWithPasscode:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__MCProfileConnection_Misc__createMDMUnlockTokenIfNeededWithPasscode_completionBlock___block_invoke;
  v12[3] = &unk_1E41E3950;
  v13 = v6;
  v8 = v6;
  v9 = (void *)MEMORY[0x1A1AF040C](v12);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createMDMUnlockTokenIfNeededWithPasscode:completion:", v7, v9);

}

void __86__MCProfileConnection_Misc__createMDMUnlockTokenIfNeededWithPasscode_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Failed to create MDM unlock token. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (BOOL)isGameCenterAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowGameCenter")) != 2;
}

- (BOOL)isNearbyMultiplayerGamingAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowGameCenterNearbyMultiplayer")) != 2;
}

- (BOOL)isGameCenterPrivateMessagingAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowGameCenterPrivateMessaging")) != 2;
}

- (BOOL)isGameCenterProfilePrivacyModificationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowGameCenterProfilePrivacyModification")) != 2;
}

- (BOOL)isGameCenterProfileModificationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowGameCenterProfileModification")) != 2;
}

- (BOOL)isGameCenterFriendsSharingModificationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowGameCenterFriendsSharingModification")) != 2;
}

- (int64_t)allowedGameCenterPlayerTypes
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveValueForSetting:", CFSTR("allowedGameCenterOtherPlayerTypes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  v5 = 2;
  if (v4 < 2)
    v5 = v4;
  return v5 & ~(v5 >> 63);
}

- (id)managingOrganizationForFontAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  +[MCDependencyReader sharedReader](MCDependencyReader, "sharedReader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dependentsOfParent:inDomain:", v6, CFSTR("MCDMFontURLToProfileIdentifierKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[MCProfileConnection installedProfileWithIdentifier:](self, "installedProfileWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "organization");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v9, "organization");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "managingProfileIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[MCProfileConnection installedProfileWithIdentifier:](self, "installedProfileWithIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "organization");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isDefinitionLookupAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowDefinitionLookup")) != 2;
}

- (BOOL)isTranslationLookupAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowTranslationLookup")) != 2;
}

- (BOOL)isSelectedTextSharingAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowSelectedTextSharing")) != 2;
}

- (id)skipSetupKeys
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "currentSkipKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isMultiUserNewUserCreationAllowed
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MCUMUserManagerClass(), "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isSharedIPad") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D44770], "sharedConfiguration"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "memberQueueManagingProfileIdentifier"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D44770], "sharedConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isUserEnrollment");

  }
  return v6;
}

- (BOOL)isWritingToolsAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowWritingTools")) != 2;
}

- (BOOL)isAudioToTextTranscriptionAllowed
{
  return 1;
}

- (BOOL)isPersonalizedHandwritingResultsAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowPersonalizedHandwritingResults")) != 2;
}

- (BOOL)isImageGenerationAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowImageGeneration")) != 2;
}

- (BOOL)isGenmojiAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowGenmoji")) != 2;
}

- (BOOL)isImagePlaygroundAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowImagePlayground")) != 2;
}

- (BOOL)isImageWandAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowImageWand")) != 2;
}

- (void)checkCarrierProfile
{
  -[MCProfileConnection checkCarrierProfileForceInstallation:](self, "checkCarrierProfileForceInstallation:", 0);
}

- (void)checkCarrierProfileForceInstallation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_35);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "checkCarrierProfileAndForceReinstallation:completion:", v3, &__block_literal_global_35);

}

void __69__MCProfileConnection_Private__checkCarrierProfileForceInstallation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Check carrier profile error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)notifyDeviceUnlocked
{
  void *v3;
  id v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_2_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifyDeviceUnlockedWithCompletion:", &__block_literal_global_2_1);

}

void __52__MCProfileConnection_Private__notifyDeviceUnlocked__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Notify device unlocked error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)notifyDeviceUnlockedAndPasscodeRequired
{
  void *v3;
  id v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_3_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifyDeviceUnlockedAndPasscodeRequiredWithCompletion:", &__block_literal_global_3_1);

}

void __71__MCProfileConnection_Private__notifyDeviceUnlockedAndPasscodeRequired__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Notify device unlocked and passcode required error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)removeExpiredProfiles
{
  void *v3;
  id v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeExpiredProfilesWithCompletion:", &__block_literal_global_4);

}

void __53__MCProfileConnection_Private__removeExpiredProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Remove expired profiles error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)rereadManagedAppAttributes
{
  void *v3;
  id v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_5_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rereadManagedAppAttributesWithCompletion:", &__block_literal_global_5_0);

}

void __58__MCProfileConnection_Private__rereadManagedAppAttributes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Reread managed app attributes error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)resetPasscodeMetadataWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__MCProfileConnection_Private__resetPasscodeMetadataWithCompletion___block_invoke;
  v9[3] = &unk_1E41E3950;
  v10 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1A1AF040C](v9);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resetPasscodeMetadataWithCompletion:", v6);

}

void __68__MCProfileConnection_Private__resetPasscodeMetadataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Reset passcode metadata failed. Error: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)doMCICDidUpdateStatus:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id WeakRetained;
  char v9;
  id v10;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
    -[MCProfileConnection(Private) doMCICDidUpdateStatus:completion:].cold.1();
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    objc_msgSend(v10, "profileConnection:didUpdateStatus:", self, v6);

  }
  if (v7)
    v7[2](v7, 0);

}

- (void)doMCICDidRequestCurrentPasscodeWithCompletion:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  void *v7;
  id passcodeReplyBlock;
  id v9;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
    -[MCProfileConnection(Private) doMCICDidRequestCurrentPasscodeWithCompletion:].cold.1();
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1A1AF040C](v4);
    passcodeReplyBlock = self->passcodeReplyBlock;
    self->passcodeReplyBlock = v7;

    v9 = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    objc_msgSend(v9, "profileConnectionDidRequestCurrentPasscode:", self);

  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, 0, 0, 0);
  }

}

- (void)doMCICDidBeginInstallingNextProfileData:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id WeakRetained;
  char v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
    -[MCProfileConnection(Private) doMCICDidBeginInstallingNextProfileData:completion:].cold.1();
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  v9 = objc_opt_respondsToSelector();

  if (v6 && (v9 & 1) != 0)
  {
    +[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_loadWeakRetained((id *)&self->_interactionDelegate);
      objc_msgSend(v11, "profileConnection:didBeginInstallingNextProfile:", self, v10);

    }
  }
  if (v7)
    v7[2](v7, 0);

}

- (void)doMCICDidFinishInstallationWithIdentifier:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  id WeakRetained;
  char v12;
  id v13;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
    -[MCProfileConnection(Private) doMCICDidFinishInstallationWithIdentifier:error:completion:].cold.1();
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    objc_msgSend(v13, "profileConnection:didFinishInstallationWithIdentifier:error:", self, v8, v9);

    objc_storeWeak((id *)&self->_interactionDelegate, 0);
  }
  if (v10)
    v10[2](v10, 0);

}

- (void)doMCICDidRequestUserInput:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  char v9;
  void *v10;
  id userInputReplyBlock;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
    -[MCProfileConnection(Private) doMCICDidRequestUserInput:completion:].cold.1();
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = (void *)MEMORY[0x1A1AF040C](v7);
    userInputReplyBlock = self->userInputReplyBlock;
    self->userInputReplyBlock = v10;

    v12 = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    objc_msgSend(v12, "profileConnection:didRequestUserInput:", self, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      while (1)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionary", v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v17);

        if (!--v15)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (!v15)
            break;
        }
      }
    }

    if (v7)
      (*((void (**)(id, void *, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, v12, 0, 0, 0);
  }

}

- (void)doMCICDidRequestMAIDSignIn:(id)a3 personaID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  char v12;
  void *v13;
  id MAIDSignInReplyBlock;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
    -[MCProfileConnection(Private) doMCICDidRequestMAIDSignIn:personaID:completion:].cold.1();
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = (void *)MEMORY[0x1A1AF040C](v10);
    MAIDSignInReplyBlock = self->MAIDSignInReplyBlock;
    self->MAIDSignInReplyBlock = v13;

    v15 = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    objc_msgSend(v15, "profileConnection:didRequestMAIDSignIn:personaID:", self, v8, v9);
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCInstallationErrorDomain"), 4001, &unk_1E4212D00, CFSTR("MCFatalError"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, _QWORD))v10 + 2))(v10, 0, v15, 0);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)doMCICDidRequestManagedRestoreWithManagedAppleID:(id)a3 personaID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  char v11;
  void *v12;
  id restoreReplyBlock;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = (void *)MEMORY[0x1A1AF040C](v9);
    restoreReplyBlock = self->restoreReplyBlock;
    self->restoreReplyBlock = v12;

    v14 = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    objc_msgSend(v14, "profileConnection:didRequestManagedRestoreWithManagedAppleID:personaID:", self, v15, v8);
LABEL_5:

    goto LABEL_6;
  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCInstallationErrorDomain"), 4001, &unk_1E4212D18, CFSTR("MCFatalError"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, _QWORD))v9 + 2))(v9, 0, v14, 0);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)doMCICDidRequestShowUserWarnings:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  id WeakRetained;
  char v9;
  void *v10;
  id showWarningsReplyBlock;
  id v12;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
    -[MCProfileConnection(Private) doMCICDidRequestShowUserWarnings:completion:].cold.1();
  if (!objc_msgSend(v6, "count"))
  {

    v6 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = (void *)MEMORY[0x1A1AF040C](v7);
    showWarningsReplyBlock = self->showWarningsReplyBlock;
    self->showWarningsReplyBlock = v10;

    v12 = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    objc_msgSend(v12, "profileConnection:didShowUserWarnings:", self, v6);

  }
  else if (v7)
  {
    v7[2](v7, 1, 0);
  }

}

- (void)doMCICDidFinishPreflightWithError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id userInputReplyBlock;
  id WeakRetained;

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
    -[MCProfileConnection(Private) doMCICDidFinishPreflightWithError:completion:].cold.1();
  v8 = (void *)MEMORY[0x1A1AF040C](v7);
  userInputReplyBlock = self->userInputReplyBlock;
  self->userInputReplyBlock = v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  objc_msgSend(WeakRetained, "profileConnection:didFinishPreflightWithError:", self, v6);

}

- (void)doMCICWaitForEnrollmentToFinishWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id waitForEnrollmentCompletionBlock;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
    -[MCProfileConnection(Private) doMCICWaitForEnrollmentToFinishWithCompletion:].cold.1();
  v5 = (void *)MEMORY[0x1A1AF040C](v4);
  waitForEnrollmentCompletionBlock = self->waitForEnrollmentCompletionBlock;
  self->waitForEnrollmentCompletionBlock = v5;

}

- (id)fetchActivationLockBypassKeyWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v10 = 0;
  +[MCCrypto storedActivationLockBypassCodeWithOutError:](MCCrypto, "storedActivationLockBypassCodeWithOutError:", &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    v6 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      objc_msgSend(v5, "MCVerboseDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_ERROR, "Activation lock bypass key fetch error. Error: %{public}@", buf, 0xCu);

    }
    if (a3)
      *a3 = objc_retainAutorelease(v5);
  }

  return v4;
}

- (id)_localizedCertificateSourceDescriptionFromMDMName:(id)a3 exchangeName:(id)a4 exchangeCount:(int64_t)a5 profileName:(id)a6 profileCount:(int64_t)a7
{
  return -[MCProfileConnection _localizedSourceDescriptionForType:MDMName:exchangeName:exchangeCount:profileName:profileCount:](self, "_localizedSourceDescriptionForType:MDMName:exchangeName:exchangeCount:profileName:profileCount:", 0, a3, a4, a5, a6, a7);
}

- (id)_localizedRestrictionSourceDescriptionFromMDMName:(id)a3 exchangeName:(id)a4 exchangeCount:(int64_t)a5 profileName:(id)a6 profileCount:(int64_t)a7
{
  return -[MCProfileConnection _localizedSourceDescriptionForType:MDMName:exchangeName:exchangeCount:profileName:profileCount:](self, "_localizedSourceDescriptionForType:MDMName:exchangeName:exchangeCount:profileName:profileCount:", 1, a3, a4, a5, a6, a7);
}

- (id)_localizedSourceDescriptionForType:(int64_t)a3 MDMName:(id)a4 exchangeName:(id)a5 exchangeCount:(int64_t)a6 profileName:(id)a7 profileCount:(int64_t)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  const __CFString *v17;
  BOOL v18;
  int v19;
  char v21;
  char v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  char v42;
  BOOL v43;
  int v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  char v56;
  char v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  BOOL v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  char v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  void *v120;
  NSObject *v121;
  void *v122;
  void *v123;
  uint8_t buf[4];
  id v125;
  __int16 v126;
  id v127;
  __int16 v128;
  void *v129;
  __int16 v130;
  void *v131;
  __int16 v132;
  void *v133;
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = v15;
  v17 = CFSTR("SETTINGS");
  if (!a3)
    v17 = CFSTR("CERTIFICATES");
  if (v13)
    v18 = a6 < 1;
  else
    v18 = 0;
  v19 = v18;
  if (v19 == 1 && a8 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_RESTRICTED_BY_MDM_NAME"), v17);
    goto LABEL_19;
  }
  v21 = v19 ^ 1;
  if (a8 == 1)
    v22 = v21;
  else
    v22 = 1;
  if ((v22 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_RESTRICTED_BY_MDM_NAME_AND_ONE_PROFILE"), v17);
LABEL_19:
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedFormat(v23, v24, v25, v26, v27, v28, v29, v30, (uint64_t)v13);
LABEL_20:
    v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

    goto LABEL_22;
  }
  if (a8 < 2)
    v21 = 1;
  if ((v21 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_RESTRICTED_BY_MDM_NAME_AND_MULTIPLE_PROFILES"), v17);
LABEL_27:
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedFormat(v23, v34, v35, v36, v37, v38, v39, v40, (uint64_t)v13);
LABEL_28:
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  if (v13)
    v41 = a6 == 1;
  else
    v41 = 0;
  v42 = v41;
  if (v41 && a8 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_RESTRICTED_BY_MDM_NAME_AND_ONE_EXCHANGE"), v17);
    goto LABEL_19;
  }
  if (v13)
    v43 = a6 <= 1;
  else
    v43 = 1;
  v44 = !v43;
  if (v44 == 1 && a8 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_RESTRICTED_BY_MDM_NAME_AND_MULTIPLE_EXCHANGES"), v17);
LABEL_48:
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedFormat(v45, v47, v48, v49, v50, v51, v52, v53, (uint64_t)v13);
LABEL_49:
    v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_50:

    goto LABEL_22;
  }
  v54 = v42 ^ 1;
  if (a8 == 1)
    v55 = v54;
  else
    v55 = 1;
  if ((v55 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_RESTRICTED_BY_MDM_NAME_ONE_EXCHANGE_AND_ONE_PROFILE"), v17);
    goto LABEL_19;
  }
  if (a8 < 2)
    v54 = 1;
  if ((v54 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_RESTRICTED_BY_MDM_NAME_ONE_EXCHANGE_AND_MULTIPLE_PROFILES"), v17);
    goto LABEL_27;
  }
  v56 = v44 ^ 1;
  if (a8 == 1)
    v57 = v56;
  else
    v57 = 1;
  if ((v57 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_RESTRICTED_BY_MDM_NAME_MULTIPLE_EXCHANGES_AND_ONE_PROFILE"), v17);
    goto LABEL_48;
  }
  if (a8 < 2)
    v56 = 1;
  if ((v56 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_RESTRICTED_BY_MDM_NAME_MULTIPLE_EXCHANGES_AND_MULTIPLE_PROFILES"), v17);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a8);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedFormat(v45, v59, v60, v61, v62, v63, v64, v65, (uint64_t)v13);
LABEL_69:
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_50;
  }
  if (v14)
    v66 = a6 == 1;
  else
    v66 = 0;
  v67 = v66;
  if (v66 && a8 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_RESTRICTED_BY_EXCHANGE_NAME"), v17);
LABEL_93:
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedFormat(v23, v77, v78, v79, v80, v81, v82, v83, (uint64_t)v14);
    goto LABEL_20;
  }
  if (v14 && a6 == 2 && a8 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_RESTRICTED_BY_EXCHANGE_NAME_AND_ONE_OTHER"), v17);
    goto LABEL_93;
  }
  if (v14 && a6 >= 3 && a8 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_RESTRICTED_BY_EXCHANGE_NAME_AND_MULTIPLE_OTHERS"), v17);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6 - 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedFormat(v45, v68, v69, v70, v71, v72, v73, v74, (uint64_t)v14);
    goto LABEL_49;
  }
  v75 = v67 ^ 1;
  if (a8 == 1)
    v76 = v75;
  else
    v76 = 1;
  if ((v76 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_RESTRICTED_BY_EXCHANGE_NAME_AND_ONE_PROFILE"), v17);
    goto LABEL_93;
  }
  if (a8 < 2)
    v75 = 1;
  if ((v75 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_RESTRICTED_BY_EXCHANGE_NAME_AND_MULTIPLE_PROFILES"), v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedFormat(v23, v84, v85, v86, v87, v88, v89, v90, (uint64_t)v14);
    goto LABEL_28;
  }
  if (a6 >= 2 && a8 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_RESTRICTED_BY_MULTIPLE_EXCHANGES_AND_ONE_PROFILE"), v17);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedFormat(v45, v91, v92, v93, v94, v95, v96, v97, (uint64_t)v46);
    goto LABEL_49;
  }
  if (a6 >= 2 && a8 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_RESTRICTED_BY_MULTIPLE_EXCHANGES_AND_MULTIPLE_PROFILES"), v17);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a8);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedFormat(v45, v98, v99, v100, v101, v102, v103, v104, (uint64_t)v46);
    goto LABEL_69;
  }
  if (v15 && a8 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_RESTRICTED_BY_PROFILE_NAME"), v17);
LABEL_110:
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedFormat(v23, v105, v106, v107, v108, v109, v110, v111, (uint64_t)v16);
    goto LABEL_20;
  }
  if (v15 && a8 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_RESTRICTED_BY_PROFILE_NAME_AND_ONE_OTHER"), v17);
    goto LABEL_110;
  }
  if (v15 && a8 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_RESTRICTED_BY_PROFILE_NAME_AND_MULTIPLE_OTHERS"), v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a8 - 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedFormat(v23, v112, v113, v114, v115, v116, v117, v118, (uint64_t)v16);
    goto LABEL_28;
  }
  v119 = (void *)qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
  {
    v120 = (void *)MEMORY[0x1E0CB37E8];
    v121 = v119;
    objc_msgSend(v120, "numberWithInteger:", a6);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a8);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v125 = v13;
    v126 = 2114;
    v127 = v14;
    v128 = 2114;
    v129 = v122;
    v130 = 2114;
    v131 = v16;
    v132 = 2114;
    v133 = v123;
    _os_log_impl(&dword_19ECC4000, v121, OS_LOG_TYPE_ERROR, "Couldn't craft proper restriction info string for (%{public}@, %{public}@, %{public}@, %{public}@, %{public}@)", buf, 0x34u);

  }
  v31 = 0;
LABEL_22:

  return v31;
}

- (id)_disallowedRestrictionErrorForRestrictionKey:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArray(CFSTR("USER_ENROLLMENT_DISALLOWED_RESTRICTION_P_RESTRICTION"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCDeviceCapabilitiesErrorDomain"), 26002, v9, CFSTR("MCFatalError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_transmogrifyRestrictionDictionaryForUserEnrollment:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  MCProfileConnection *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;

  v6 = a3;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 1;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__12;
  v34 = __Block_byref_object_dispose__12;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__12;
  v28 = __Block_byref_object_dispose__12;
  v29 = (id)objc_msgSend(v6, "MCMutableDeepCopy");
  +[MCRestrictionsPayload userEnrollmentAllowedKeysFilter](MCRestrictionsPayload, "userEnrollmentAllowedKeysFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultRestrictions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __93__MCProfileConnection_Private___transmogrifyRestrictionDictionaryForUserEnrollment_outError___block_invoke;
  v16[3] = &unk_1E41E3F00;
  v10 = v7;
  v17 = v10;
  v20 = &v36;
  v21 = &v24;
  v11 = v9;
  v22 = &v40;
  v23 = &v30;
  v18 = v11;
  v19 = self;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v16);
  if (*((_BYTE *)v37 + 24))
  {
    objc_msgSend((id)v25[5], "MCSetBoolRestriction:value:", CFSTR("allowSimple"), 0);
    objc_msgSend((id)v25[5], "MCSetValueRestriction:value:", CFSTR("minLength"), &unk_1E4212A60);
  }
  v12 = *((unsigned __int8 *)v41 + 24);
  if (a4 && !*((_BYTE *)v41 + 24))
  {
    *a4 = objc_retainAutorelease((id)v31[5]);
    v12 = *((unsigned __int8 *)v41 + 24);
  }
  if (v12)
    v13 = (void *)v25[5];
  else
    v13 = 0;
  v14 = v13;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v14;
}

void __93__MCProfileConnection_Private___transmogrifyRestrictionDictionaryForUserEnrollment_outError___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;

  v7 = a2;
  v8 = *(void **)(a1 + 32);
  v9 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__MCProfileConnection_Private___transmogrifyRestrictionDictionaryForUserEnrollment_outError___block_invoke_2;
  v15[3] = &unk_1E41E3ED8;
  v16 = v10;
  v17 = v7;
  v20 = *(_OWORD *)(a1 + 56);
  v11 = *(id *)(a1 + 40);
  v21 = *(_OWORD *)(a1 + 72);
  v12 = *(_QWORD *)(a1 + 48);
  v18 = v11;
  v19 = v12;
  v13 = v7;
  v14 = v10;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v15);

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) ^ 1;
}

void __93__MCProfileConnection_Private___transmogrifyRestrictionDictionaryForUserEnrollment_outError___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a2;
  v7 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v19) & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("restrictedValue")))
    {
      if (!objc_msgSend(v19, "isEqualToString:", CFSTR("minLength")))
      {
LABEL_8:
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v19);

        goto LABEL_12;
      }
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("restrictedBool")))
        goto LABEL_11;
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v19);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_11;
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("preference"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("value"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v14, "BOOLValue");

      if (v13 != (_DWORD)v11)
        goto LABEL_8;
      if ((objc_msgSend(v19, "isEqualToString:", CFSTR("forcePIN")) & 1) == 0
        && !objc_msgSend(v19, "isEqualToString:", CFSTR("allowSimple")))
      {
LABEL_11:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
        objc_msgSend(*(id *)(a1 + 56), "_disallowedRestrictionErrorForRestrictionKey:", v19);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        v18 = *(void **)(v17 + 40);
        *(_QWORD *)(v17 + 40) = v16;

        *a4 = 1;
        goto LABEL_12;
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    goto LABEL_8;
  }
LABEL_12:

}

- (void)debugRescheduleBackgroundActivity:(int64_t)a3 startDate:(id)a4 gracePeriod:(id)a5 repeatingInterval:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_83);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "debugRescheduleBackgroundActivity:startDate:gracePeriod:repeatingInterval:completion:", a3, v12, v11, v10, &__block_literal_global_83);

}

void __106__MCProfileConnection_Private__debugRescheduleBackgroundActivity_startDate_gracePeriod_repeatingInterval___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Reschedule background activity error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (BOOL)checkApplicationIdentifierEntitlement
{
  __SecTask *v2;
  __SecTask *v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  NSObject *v11;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v2)
  {
    v3 = v2;
    error = 0;
    v4 = (void *)SecTaskCopyValueForEntitlement(v2, CFSTR("application-identifier"), &error);
    v5 = v4 != 0;
    if (!v4)
    {
      v6 = qword_1ECD40B38;
      if (error)
      {
        if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v15 = error;
          v7 = "Failed to retrieve application-identifier entitlement with error: %{public}@";
          v8 = v6;
          v9 = OS_LOG_TYPE_ERROR;
          v10 = 12;
LABEL_11:
          _os_log_impl(&dword_19ECC4000, v8, v9, v7, buf, v10);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "This process requires an application-identifier entitlement to communicate with profiled. This will cause a"
             " crash in the future.";
        v8 = v6;
        v9 = OS_LOG_TYPE_FAULT;
        v10 = 2;
        goto LABEL_11;
      }
    }
    CFRelease(v3);

    return v5;
  }
  v11 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19ECC4000, v11, OS_LOG_TYPE_ERROR, "Failed to construct SecTask for client application-identifier entitlement check", buf, 2u);
  }
  return 0;
}

- (void)updateCloudConfigWithSupervision:(BOOL)a3 replaceExistingConfig:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "details");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (a4 || !v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E4212A78, *MEMORY[0x1E0D447B8]);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D44798]);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D44838]);
    v11 = v12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D447D8]);

  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D447A8]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__MCProfileConnection_Private__updateCloudConfigWithSupervision_replaceExistingConfig_completion___block_invoke;
  v15[3] = &unk_1E41E3950;
  v16 = v8;
  v14 = v8;
  -[MCProfileConnection storeCloudConfigurationDetails:completion:](self, "storeCloudConfigurationDetails:completion:", v11, v15);

}

uint64_t __98__MCProfileConnection_Private__updateCloudConfigWithSupervision_replaceExistingConfig_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setUserBookmarks:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "serializableDictionary", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }
  -[MCProfileConnection xpcConnection](self, "xpcConnection", (_QWORD)v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_38);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUserBookmarks:completion:", v5, &__block_literal_global_38);

}

void __57__MCProfileConnection_SafariBookmarks__setUserBookmarks___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Set user bookmarks error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (id)userBookmarks
{
  void *v2;
  void *v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCBookmarkManager sharedManager](MCBookmarkManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userBookmarks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)defaultUserBookmarks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  MCBookmark *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[16];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  MCSystemRootDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/System/Library/PrivateFrameworks/WebContentAnalysis.framework"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("com.apple.webcontentfilter.defaults."), "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pathForResource:ofType:", v7, CFSTR("plist"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = v7;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("siteWhitelist"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      v29 = v9;
      v30 = v10;
      v31 = v5;
      v32 = v4;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v28 = v13;
      obj = v13;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v35 != v17)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            v20 = objc_alloc_init(MCBookmark);
            v21 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("address"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "URLWithString:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[MCBookmark setURL:](v20, "setURL:", v23);

            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("bookmarkPath"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[MCBookmark setPath:](v20, "setPath:", v24);

            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("pageTitle"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[MCBookmark setTitle:](v20, "setTitle:", v25);

            objc_msgSend(v14, "addObject:", v20);
          }
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        }
        while (v16);
      }

      v4 = v32;
      v10 = v30;
      v5 = v31;
      v9 = v29;
      v13 = v28;
    }
    else
    {
      v14 = 0;
    }

    goto LABEL_16;
  }
  objc_msgSend(CFSTR("com.apple.webcontentfilter.defaults."), "stringByAppendingString:", CFSTR("en"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pathForResource:ofType:", v10, CFSTR("plist"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v9 = (void *)v11;
    goto LABEL_5;
  }
  v27 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19ECC4000, v27, OS_LOG_TYPE_ERROR, "Could not find English default bookmarks file", buf, 2u);
  }
  v14 = 0;
LABEL_16:

  return v14;
}

- (void)setWebContentFilterAutoPermittedURLStrings:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowedURLStrings:completion:", v4, &__block_literal_global_22);

}

void __83__MCProfileConnection_SafariBookmarks__setWebContentFilterAutoPermittedURLStrings___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Set webcontentfilter autopermitted URLs error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)setWebContentFilterUserBlacklistedURLStrings:(id)a3
{
  id v4;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection setValues:forUnionSetting:](self, "setValues:forUnionSetting:", v4, CFSTR("webContentFilterBlacklistedURLs"));

}

- (int)hostMayPairWithOptions:(id)a3 challenge:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;
  int v18;
  void *v19;
  SecPolicyRef BasicX509;
  SecPolicyRef v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  __SecCertificate *CertificateAtIndex;
  int v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  NSObject *log;
  CFDataRef v33;
  char v34;
  void *v35;
  void *v36;
  uint8_t v37[8];
  void *v38;
  _BYTE buf[24];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v8 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_INFO, "Received pairing request.", buf, 2u);
  }
  v9 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_19ECC4000, v9, OS_LOG_TYPE_DEBUG, "Pairing options: %{public}@", buf, 0xCu);
  }
  -[MCProfileConnection cloudConfigurationDetails](self, "cloudConfigurationDetails");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D44848]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = qword_1ECD40B38;
      if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19ECC4000, v12, OS_LOG_TYPE_ERROR, "Rejecting pairing options because it's not a dictionary.", buf, 2u);
      }

      v6 = 0;
    }
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SupervisorCertificate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = qword_1ECD40B38;
      if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19ECC4000, v14, OS_LOG_TYPE_ERROR, "Rejecting supervisor certificate because it is not a data object.", buf, 2u);
      }

      v13 = 0;
    }
  }
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "effectiveRestrictedBoolForSetting:", CFSTR("allowHostPairing"));
  if (v13)
  {
    if (objc_msgSend(v11, "containsObject:", v13))
    {
      v17 = qword_1ECD40B38;
      if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19ECC4000, v17, OS_LOG_TYPE_INFO, "Challenge requested for silent pairing.", buf, 2u);
      }
      v18 = 3;
      goto LABEL_40;
    }
    goto LABEL_34;
  }
  if (!v7 || !objc_msgSend(v11, "count"))
  {
LABEL_34:
    v25 = qword_1ECD40B38;
    if (v16 == 2)
    {
      if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19ECC4000, v25, OS_LOG_TYPE_ERROR, "Pairing is not allowed.", buf, 2u);
      }
      v18 = 0;
    }
    else
    {
      v18 = 1;
      if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19ECC4000, v25, OS_LOG_TYPE_INFO, "Pairing is allowed pending user acceptance.", buf, 2u);
      }
    }
    goto LABEL_40;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ChallengeResponse"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Challenge response is invalid.";
LABEL_32:
      _os_log_impl(&dword_19ECC4000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    }
LABEL_33:

    goto LABEL_34;
  }
  BasicX509 = SecPolicyCreateBasicX509();
  if (!BasicX509)
  {
    v23 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Could not create security policy.";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  v21 = BasicX509;
  v38 = 0;
  *(_QWORD *)buf = 0;
  v36 = v19;
  if (SecCMSVerifyCopyDataAndAttributes())
  {
    v22 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_19ECC4000, v22, OS_LOG_TYPE_ERROR, "Could not extract the signing certificate from the response.", v37, 2u);
    }
    CFRelease(v21);
    v19 = v36;
    goto LABEL_33;
  }
  v35 = v38;
  if (!objc_msgSend(v7, "isEqualToData:"))
  {
    v29 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v37 = 0;
      v30 = "Response data does not match challenge.";
LABEL_51:
      _os_log_impl(&dword_19ECC4000, v29, OS_LOG_TYPE_ERROR, v30, v37, 2u);
    }
LABEL_52:
    v34 = 0;
    v18 = 0;
    goto LABEL_53;
  }
  if (!*(_QWORD *)buf || SecTrustGetCertificateCount(*(SecTrustRef *)buf) < 1)
  {
    v29 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v37 = 0;
      v30 = "Could not determine challenge signer.";
      goto LABEL_51;
    }
    goto LABEL_52;
  }
  CertificateAtIndex = SecTrustGetCertificateAtIndex(*(SecTrustRef *)buf, 0);
  v33 = SecCertificateCopyData(CertificateAtIndex);
  v28 = objc_msgSend(v11, "containsObject:");
  v34 = v28;
  if (v28)
  {
    log = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v37 = 0;
      v18 = 2;
      _os_log_impl(&dword_19ECC4000, log, OS_LOG_TYPE_INFO, "Pairing approved without prompting.", v37, 2u);
    }
    else
    {
      v18 = 2;
    }
  }
  else
  {
    v31 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_19ECC4000, v31, OS_LOG_TYPE_ERROR, "The signing certificate is not among the list of approved certificates.", v37, 2u);
    }
    v18 = 0;
  }

LABEL_53:
  if (*(_QWORD *)buf)
    CFRelease(*(CFTypeRef *)buf);

  CFRelease(v21);
  if ((v34 & 1) == 0)
    goto LABEL_34;
LABEL_40:

  return v18;
}

- (void)lockdownDidReceiveActivationRecord:(id)a3
{
  id v4;
  char isKindOfClass;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = qword_1ECD40B38;
  if ((isKindOfClass & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_INFO))
    {
      v9 = 138543362;
      v10 = v4;
      _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_INFO, "Received activation record: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    -[MCProfileConnection xpcConnection](self, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_41);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "storeActivationRecord:completion:", v4, &__block_literal_global_41);

  }
  else if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_ERROR, "Activation record configuration is not a dictionary. Ignoring.", (uint8_t *)&v9, 2u);
  }

}

void __68__MCProfileConnection_Lockdown__lockdownDidReceiveActivationRecord___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Lockdown did receive activation record error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (BOOL)isUnpairedExternalBootToRecoveryAllowed
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowUnpairedExternalBootToRecovery")) == 1;
}

- (BOOL)isHomeScreenLayoutApplied
{
  void *v2;
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MCUserHomeScreenLayoutFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "fileExistsAtPath:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    MCSystemHomeScreenLayoutFilePath();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "fileExistsAtPath:", v5);

  }
  return v4;
}

- (id)removedSystemAppBundleIDs
{
  void *v2;
  void *v3;
  void *v4;

  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
  {
    v2 = 0;
  }
  else
  {
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "effectiveUnionValuesForSetting:", CFSTR("removedSystemAppBundleIDs"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v4, "copy");

  }
  return v2;
}

- (id)restrictionEnforcedBlockedAppBundleIDs
{
  void *v2;
  void *v3;
  void *v4;

  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
  {
    v2 = 0;
  }
  else
  {
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "restrictionEnforcedBlockedAppBundleIDsExcludingRemovedSystemApps:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v4, "copy");

  }
  return v2;
}

- (id)parentalControlsBlockedAppBundleIDs
{
  void *v2;
  void *v3;
  void *v4;

  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
  {
    v2 = 0;
  }
  else
  {
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "parentalControlsBlockedAppBundleIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v4, "copy");

  }
  return v2;
}

- (void)setParentalControlsBlockedAppBundleIDs:(id)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(a3, "allObjects");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[MCProfileConnection setValues:forUnionSetting:](self, "setValues:forUnionSetting:", v4, CFSTR("blockedAppBundleIDs"));

}

- (id)restrictionEnforcedWhitelistedAppBundleIDs
{
  void *v2;
  void *v3;
  void *v4;

  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
  {
    v2 = 0;
  }
  else
  {
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "restrictionEnforcedWhitelistedAppBundleIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v4, "copy");

  }
  return v2;
}

- (BOOL)isInSingleAppMode
{
  void *v2;
  char v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInSingleAppMode");

  return v3;
}

- (BOOL)isEffectivelyInAppAllowListMode
{
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  return MCIsEffectivelyInAppWhitelistMode();
}

- (BOOL)isPasscodeRequiredToAccessWhitelistedApps
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveUserSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[MCRestrictionManager isPasscodeRequiredToAccessWhitelistedAppsWithSettingsDictionary:](MCRestrictionManager, "isPasscodeRequiredToAccessWhitelistedAppsWithSettingsDictionary:", v3);

  return v4;
}

- (BOOL)mayEnterPasscodeToAccessNonWhitelistedApps
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveUserSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[MCRestrictionManager mayEnterPasscodeToAccessNonWhitelistedAppsWithSettingsDictionary:](MCRestrictionManager, "mayEnterPasscodeToAccessNonWhitelistedAppsWithSettingsDictionary:", v3);

  return v4;
}

- (BOOL)isSingleAppModeLogoutAllowed
{
  void *v2;
  char v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSingleAppModeLogoutAllowed");

  return v3;
}

- (id)parentalControlsWhitelistedAppBundleIDs
{
  void *v2;
  void *v3;
  void *v4;

  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
  {
    v2 = 0;
  }
  else
  {
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "parentalControlsWhitelistedAppBundleIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v4, "copy");

  }
  return v2;
}

- (void)setParentalControlsWhitelistedAppBundleIDs:(id)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(a3, "allObjects");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[MCProfileConnection setValues:forIntersectionSetting:](self, "setValues:forIntersectionSetting:", v4, CFSTR("appLockBundleIDs"));

}

- (BOOL)isParentalControlsAllowPasscodeAccessToNonWhitelistedAppsUIForcedByRestrictions
{
  void *v2;
  char v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBoolSettingLockedDownByRestrictions:", CFSTR("allowAccessWithoutPasscodeInAppLock"));

  return v3;
}

- (BOOL)parentalControlsAllowPasscodeAccessToNonWhitelistedApps
{
  return -[MCProfileConnection effectiveBoolValueForSetting:](self, "effectiveBoolValueForSetting:", CFSTR("allowMultipleAppsInAppLock")) != 2;
}

- (void)parentalControlsSetAllowPasscodeAccessToNonWhitelistedApps:(BOOL)a3
{
  -[MCProfileConnection setBoolValue:forSetting:](self, "setBoolValue:forSetting:", a3, CFSTR("allowMultipleAppsInAppLock"));
}

- (id)autonomousSingleAppModePermittedBundleIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[MCProfileConnection needsCheckIn](self, "needsCheckIn"))
  {
    v3 = 0;
  }
  else
  {
    -[MCProfileConnection effectiveValuesForIntersectionSetting:](self, "effectiveValuesForIntersectionSetting:", CFSTR("autonomousSingleAppModePermittedAppIDs"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCProfileConnection restrictedAppBundleIDs](self, "restrictedAppBundleIDs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCProfileConnection effectiveWhitelistedAppBundleIDs](self, "effectiveWhitelistedAppBundleIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(v5, "minusSet:", v6);
      if (v7)
        objc_msgSend(v5, "intersectSet:", v7);
      objc_msgSend(v5, "allObjects");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (id)companionBundleIDToWatchBundleIDsMap
{
  return +[MCGizmoUtilities MCFirstPartyCompanionToWatchAppBundleIDs](MCGizmoUtilities, "MCFirstPartyCompanionToWatchAppBundleIDs");
}

- (void)storeCertificateData:(id)a3 forHostIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (-[MCProfileConnection _checkRemoteProcessHasMDMEntitlement](self, "_checkRemoteProcessHasMDMEntitlement"))
  {
    -[MCProfileConnection xpcConnection](self, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_47);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "storeCertificateData:forIPCUIdentifier:completion:", v9, v6, &__block_literal_global_47);

  }
  else
  {
    -[MCProfileConnection _lacksEntitlementError](self, "_lacksEntitlementError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __67__MCProfileConnection_MDM__storeCertificateData_forHostIdentifier___block_invoke((uint64_t)v7, v7);
  }

}

void __67__MCProfileConnection_MDM__storeCertificateData_forHostIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Store certificate data error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)stageMDMEnrollmentInfoForPairingWatchWithProfileData:(id)a3 orServiceURL:(id)a4 anchorCertificates:(id)a5 supervised:(BOOL)a6 declarationKeys:(id)a7 declarationConfiguration:(id)a8 completion:(id)a9
{
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;

  v11 = a6;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __176__MCProfileConnection_MDM__stageMDMEnrollmentInfoForPairingWatchWithProfileData_orServiceURL_anchorCertificates_supervised_declarationKeys_declarationConfiguration_completion___block_invoke;
  v29 = &unk_1E41E3950;
  v30 = v16;
  v22 = v16;
  v23 = (void *)MEMORY[0x1A1AF040C](&v26);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "remoteObjectProxyWithErrorHandler:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stageMDMEnrollmentInfoForPairingWatchWithProfileData:orServiceURL:anchorCertificates:supervised:declarationKeys:declarationConfiguration:completion:", v21, v20, v19, v11, v18, v17, v22, v26, v27, v28, v29);

}

void __176__MCProfileConnection_MDM__stageMDMEnrollmentInfoForPairingWatchWithProfileData_orServiceURL_anchorCertificates_supervised_declarationKeys_declarationConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "XPC error staging enrollment data: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)unstageMDMEnrollmentInfoForPairingWatchWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__MCProfileConnection_MDM__unstageMDMEnrollmentInfoForPairingWatchWithCompletion___block_invoke;
  v9[3] = &unk_1E41E3950;
  v10 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1A1AF040C](v9);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unstageMDMEnrollmentInfoForPairingWatchWithCompletion:", v5);

}

void __82__MCProfileConnection_MDM__unstageMDMEnrollmentInfoForPairingWatchWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "XPC error unstaging enrollment data: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__MCProfileConnection_MDM__fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion___block_invoke;
  v9[3] = &unk_1E41E3950;
  v10 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1A1AF040C](v9);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:", v5);

}

void __86__MCProfileConnection_MDM__fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "XPC error fetching staged enrollment data: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __99__MCProfileConnection_MDM__fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken_completion___block_invoke;
  v12[3] = &unk_1E41E3950;
  v13 = v6;
  v8 = v6;
  v9 = (void *)MEMORY[0x1A1AF040C](v12);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:completion:", v7, v8);

}

void __99__MCProfileConnection_MDM__fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "XPC error fetching staged enrollment data: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __97__MCProfileConnection_MDM__fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion___block_invoke;
  v9[3] = &unk_1E41E3950;
  v10 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1A1AF040C](v9);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:", v5);

}

void __97__MCProfileConnection_MDM__fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "XPC error fetching staged declaration keys: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)applyPairingWatchMDMEnrollmentData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__MCProfileConnection_MDM__applyPairingWatchMDMEnrollmentData_completion___block_invoke;
  v12[3] = &unk_1E41E3950;
  v13 = v6;
  v8 = v6;
  v9 = (void *)MEMORY[0x1A1AF040C](v12);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applyPairingWatchMDMEnrollmentData:completion:", v7, v8);

}

void __74__MCProfileConnection_MDM__applyPairingWatchMDMEnrollmentData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "XPC error applying enrollment data: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)updateMDMEnrollmentInfoForPairingWatch:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v8 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_DEBUG, "updateMDMEnrollmentInfoForPairingWatch", buf, 2u);
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__MCProfileConnection_MDM__updateMDMEnrollmentInfoForPairingWatch_completion___block_invoke;
  v13[3] = &unk_1E41E3950;
  v14 = v6;
  v9 = v6;
  v10 = (void *)MEMORY[0x1A1AF040C](v13);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateMDMEnrollmentInfoForPairingWatch:completion:", v7, v9);

}

void __78__MCProfileConnection_MDM__updateMDMEnrollmentInfoForPairingWatch_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "XPC error updating enrollment data for pairing watch: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)_checkRemoteProcessHasMDMEntitlement
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForEntitlement:", CFSTR("com.apple.managedconfiguration.profileconnection.mdm-access"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "BOOLValue") & 1) != 0)
      v4 = 1;
  }

  return v4;
}

- (id)_lacksEntitlementError
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArray(CFSTR("XPC_ERROR_LACKS_ENTITLEMENT_CODE"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, CFSTR("com.apple.managedconfiguration.profileconnection.mdm-access"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCXPCErrorDomain"), 39000, v9, CFSTR("MCFatalError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)knownAirPrintIPPURLStrings
{
  void *v2;
  void *v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveUnionValuesForSetting:", CFSTR("knownAirPrintTargets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cloudConfigurationDetails
{
  void *v2;
  void *v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)enrollProvisionallyWithNonce:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v8 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__MCProfileConnection_CloudConfiguration__enrollProvisionallyWithNonce_completionBlock___block_invoke;
  v10[3] = &unk_1E41E4830;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "provisionallyEnrollWithNonce:completionBlock:", v7, v10);

}

void __88__MCProfileConnection_CloudConfiguration__enrollProvisionallyWithNonce_completionBlock___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v14 = a4;
  if (a2)
  {
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
      (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, 0, v20);
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("CLOUD_CONFIG_PROVISIONAL_ENROLLMENT_FAILED"), v7, v8, v9, v10, v11, v12, v13, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCCloudConfigErrorDomain"), 33007, v17, v14, CFSTR("MCFatalError"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *(_QWORD *)(a1 + 32);
    if (v19)
      (*(void (**)(uint64_t, void *, _QWORD))(v19 + 16))(v19, v18, 0);

  }
}

- (void)unenrollWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v5 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__MCProfileConnection_CloudConfiguration__unenrollWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E41E4830;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "unenrollWithCompletionBlock:", v7);

}

void __71__MCProfileConnection_CloudConfiguration__unenrollWithCompletionBlock___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v14 = a4;
  if (a2)
  {
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
      (*(void (**)(uint64_t, _QWORD))(v15 + 16))(v15, 0);
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("CLOUD_CONFIG_UNENROLLMENT_FAILED"), v7, v8, v9, v10, v11, v12, v13, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCCloudConfigErrorDomain"), 33008, v17, v14, CFSTR("MCFatalError"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *(_QWORD *)(a1 + 32);
    if (v19)
      (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v18);

  }
}

- (void)retrieveCloudConfigurationDetailsCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v6 = (id)objc_opt_new();
  -[MCProfileConnection _cloudConfigurationRetrievalBlockWithCompletion:](self, "_cloudConfigurationRetrievalBlockWithCompletion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fetchConfigurationWithCompletionBlock:", v5);
}

- (void)retrieveCloudConfigurationWithoutValidationCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v6 = (id)objc_opt_new();
  -[MCProfileConnection _cloudConfigurationRetrievalBlockWithCompletion:](self, "_cloudConfigurationRetrievalBlockWithCompletion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fetchConfigurationWithoutValidationWithCompletionBlock:", v5);
}

- (void)retrieveAndStoreCloudConfigurationDetailsCompletionBlock:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v6)
      v6[2](v6, 0);
  }
  else
  {
    -[MCProfileConnection forceRetrieveAndStoreCloudConfigurationDetailsCompletionBlock:](self, "forceRetrieveAndStoreCloudConfigurationDetailsCompletionBlock:", v6);
  }

}

- (void)forceRetrieveAndStoreCloudConfigurationDetailsCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __105__MCProfileConnection_CloudConfiguration__forceRetrieveAndStoreCloudConfigurationDetailsCompletionBlock___block_invoke;
  v6[3] = &unk_1E41E4858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MCProfileConnection retrieveCloudConfigurationDetailsCompletionBlock:](self, "retrieveCloudConfigurationDetailsCompletionBlock:", v6);

}

void __105__MCProfileConnection_CloudConfiguration__forceRetrieveAndStoreCloudConfigurationDetailsCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (*v7)(void);
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (!v10)
  {
    if (v5)
    {
      v8 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E4212B68, *MEMORY[0x1E0D447B8]);
      objc_msgSend(*(id *)(a1 + 32), "storeCloudConfigurationDetails:completion:", v8, *(_QWORD *)(a1 + 40));

      goto LABEL_7;
    }
    v9 = *(_QWORD *)(a1 + 40);
    if (!v9)
      goto LABEL_7;
    v7 = *(void (**)(void))(v9 + 16);
    goto LABEL_4;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v7 = *(void (**)(void))(v6 + 16);
LABEL_4:
    v7();
  }
LABEL_7:

}

- (id)_cloudConfigurationRetrievalBlockWithCompletion:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__MCProfileConnection_CloudConfiguration___cloudConfigurationRetrievalBlockWithCompletion___block_invoke;
  v7[3] = &unk_1E41E4830;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1A1AF040C](v7);

  return v5;
}

void __91__MCProfileConnection_CloudConfiguration___cloudConfigurationRetrievalBlockWithCompletion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void (*v16)(void);
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a4;
  if (a2)
  {
    v14 = (void *)objc_msgSend(a3, "mutableCopy");
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E4212B68, *MEMORY[0x1E0D447B8]);
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
    {
      v16 = *(void (**)(void))(v15 + 16);
LABEL_6:
      v16();
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("CLOUD_CONFIG_NOT_AVAILABLE"), v7, v8, v9, v10, v11, v12, v13, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCCloudConfigErrorDomain"), 33001, v18, v20, CFSTR("MCFatalError"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *(_QWORD *)(a1 + 32);
    if (v19)
    {
      v16 = *(void (**)(void))(v19 + 16);
      goto LABEL_6;
    }
  }

}

- (id)getMachineInfo
{
  return -[MCProfileConnection getMachineInfoWithAdditionalInfo:](self, "getMachineInfoWithAdditionalInfo:", 0);
}

- (id)getMachineInfoWithAdditionalInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__15;
  v14 = __Block_byref_object_dispose__15;
  v15 = 0;
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_49);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__MCProfileConnection_CloudConfiguration__getMachineInfoWithAdditionalInfo___block_invoke_11;
  v9[3] = &unk_1E41E39A0;
  v9[4] = &v10;
  objc_msgSend(v6, "cloudConfigurationMachineInfoDataWithAdditionalInfo:completion:", v4, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __76__MCProfileConnection_CloudConfiguration__getMachineInfoWithAdditionalInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Failed to communicate with profiled. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __76__MCProfileConnection_CloudConfiguration__getMachineInfoWithAdditionalInfo___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Cloud config machine info error. Error: %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (id)getReducedMachineInfo
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  v12 = 0;
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_13_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__MCProfileConnection_CloudConfiguration__getReducedMachineInfo__block_invoke_14;
  v6[3] = &unk_1E41E39A0;
  v6[4] = &v7;
  objc_msgSend(v3, "reducedMachineInfoDataWithCompletion:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __64__MCProfileConnection_CloudConfiguration__getReducedMachineInfo__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "User enrollment machine info error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __64__MCProfileConnection_CloudConfiguration__getReducedMachineInfo__block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "User enrollment machine info error. Error: %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (void)retrieveCloudConfigurationFromURL:(id)a3 username:(id)a4 password:(id)a5 anchorCertificates:(id)a6 completionBlock:(id)a7
{
  -[MCProfileConnection retrieveCloudConfigurationFromURL:username:password:anchorCertificates:additionalMachineInfo:completionBlock:](self, "retrieveCloudConfigurationFromURL:username:password:anchorCertificates:additionalMachineInfo:completionBlock:", a3, a4, a5, a6, 0, a7);
}

- (void)retrieveCloudConfigurationFromURL:(id)a3 username:(id)a4 password:(id)a5 anchorCertificates:(id)a6 additionalMachineInfo:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  MCProfileConnection *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  dispatch_get_global_queue(0, 0);
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __152__MCProfileConnection_CloudConfiguration__retrieveCloudConfigurationFromURL_username_password_anchorCertificates_additionalMachineInfo_completionBlock___block_invoke;
  block[3] = &unk_1E41E48D0;
  v28 = v14;
  v29 = self;
  v30 = v18;
  v31 = v15;
  v32 = v16;
  v33 = v17;
  v34 = v19;
  v21 = v19;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  v25 = v18;
  v26 = v14;
  dispatch_async(v20, block);

}

void __152__MCProfileConnection_CloudConfiguration__retrieveCloudConfigurationFromURL_username_password_anchorCertificates_additionalMachineInfo_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v2, "setTimeoutInterval:", 90.0);
  objc_msgSend(v2, "setValue:forHTTPHeaderField:", CFSTR("application/pkcs7-signature"), CFSTR("Content-Type"));
  objc_msgSend(v2, "setValue:forHTTPHeaderField:", CFSTR("CloudConfiguration/1.0"), CFSTR("User-Agent"));
  objc_msgSend(*(id *)(a1 + 40), "getMachineInfoWithAdditionalInfo:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHTTPBody:", v3);
  v4 = objc_alloc_init(MEMORY[0x1E0D1C1D0]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __152__MCProfileConnection_CloudConfiguration__retrieveCloudConfigurationFromURL_username_password_anchorCertificates_additionalMachineInfo_completionBlock___block_invoke_2;
  v7[3] = &unk_1E41E48A8;
  v8 = v4;
  v9 = v2;
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v12 = *(id *)(a1 + 72);
  v13 = *(id *)(a1 + 80);
  v5 = v2;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __152__MCProfileConnection_CloudConfiguration__retrieveCloudConfigurationFromURL_username_password_anchorCertificates_additionalMachineInfo_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __152__MCProfileConnection_CloudConfiguration__retrieveCloudConfigurationFromURL_username_password_anchorCertificates_additionalMachineInfo_completionBlock___block_invoke_3;
  v6[3] = &unk_1E41E4880;
  v5 = *(_QWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 72);
  objc_msgSend(v1, "startWithRequest:username:password:anchorCertificateRefs:completionBlock:", v2, v3, v4, v5, v6);

}

void __152__MCProfileConnection_CloudConfiguration__retrieveCloudConfigurationFromURL_username_password_anchorCertificates_additionalMachineInfo_completionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  char v21;
  void (*v22)(void);
  id v23;
  id v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v24 = 0;
    +[MCProfile profileWithData:fileName:outError:](MCProfile, "profileWithData:fileName:outError:", v7, 0, &v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v24;
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v25 = CFSTR("isCloudProfile");
      v26[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v21 = objc_msgSend(v16, "mayInstallWithOptions:hasInteractionClient:outError:", v20, 0, &v23);
      v18 = v23;

      v19 = *(_QWORD *)(a1 + 32);
      if ((v21 & 1) != 0)
      {
        if (v19)
        {
          v22 = *(void (**)(void))(v19 + 16);
LABEL_15:
          v22();
        }
LABEL_16:

        v10 = 0;
        goto LABEL_17;
      }
    }
    if (v19)
    {
      v22 = *(void (**)(void))(v19 + 16);
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v10 = v9;
  objc_msgSend(v9, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D1C0A8]))
  {
    v12 = objc_msgSend(v10, "code");

    if (v12 != 23003)
      goto LABEL_6;
    v13 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v10, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("MCCloudConfigErrorDomain"), 33000, v11);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }

LABEL_6:
  v15 = *(_QWORD *)(a1 + 32);
  if (v15)
    (*(void (**)(uint64_t, void *, _QWORD))(v15 + 16))(v15, v10, 0);
LABEL_17:

}

- (BOOL)wasCloudConfigurationApplied
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D447B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)wasTeslaCloudConfigurationApplied
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D447B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "BOOLValue"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D447B8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue") == 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isAwaitingDeviceConfigured
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D447A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "BOOLValue"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D447C0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isAwaitingUserConfigured
{
  void *v2;
  char v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44790], "sharedClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAwaitingUserConfigured");

  return v3;
}

- (void)updateCloudConfigurationWithRMAccountIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0D44768];
  v5 = a3;
  objc_msgSend(v4, "sharedConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "details");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D44840]);
  -[MCProfileConnection storeCloudConfigurationDetails:waitUntilCompleted:completion:](self, "storeCloudConfigurationDetails:waitUntilCompleted:completion:", v8, 1, 0);

}

- (void)updateCloudConfigurationWithLastPushTokenHash:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0D44768];
  v5 = a3;
  objc_msgSend(v4, "sharedConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "details");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D447E0]);
  -[MCProfileConnection storeCloudConfigurationDetails:waitUntilCompleted:completion:](self, "storeCloudConfigurationDetails:waitUntilCompleted:completion:", v8, 1, 0);

}

- (void)restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_32_0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:", v4);
}

void __105__MCProfileConnection_CloudConfiguration__restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Failed to restore set aside cloud config and MDM profile. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)cloudConfigurationUIDidCompleteWasApplied:(BOOL)a3
{
  -[MCProfileConnection cloudConfigurationUIDidCompleteWasApplied:completionHandler:](self, "cloudConfigurationUIDidCompleteWasApplied:completionHandler:", a3, 0);
}

- (void)cloudConfigurationUIDidCompleteWasApplied:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "details");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D447A8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D447B0]);

  -[MCProfileConnection storeCloudConfigurationDetails:waitUntilCompleted:completion:](self, "storeCloudConfigurationDetails:waitUntilCompleted:completion:", v10, 1, v6);
}

- (void)storeCloudConfigurationDetails:(id)a3
{
  -[MCProfileConnection storeCloudConfigurationDetails:waitUntilCompleted:completion:](self, "storeCloudConfigurationDetails:waitUntilCompleted:completion:", a3, 1, 0);
}

- (void)storeCloudConfigurationDetails:(id)a3 completion:(id)a4
{
  -[MCProfileConnection storeCloudConfigurationDetails:waitUntilCompleted:completion:](self, "storeCloudConfigurationDetails:waitUntilCompleted:completion:", a3, 0, a4);
}

- (void)storeCloudConfigurationDetails:(id)a3 waitUntilCompleted:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __104__MCProfileConnection_CloudConfiguration__storeCloudConfigurationDetails_waitUntilCompleted_completion___block_invoke;
  v15[3] = &unk_1E41E3950;
  v16 = v8;
  v10 = v8;
  v11 = (void *)MEMORY[0x1A1AF040C](v15);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v5)
    objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  else
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "cloudConfigurationStoreDetails:completion:", v9, v11);
}

void __104__MCProfileConnection_CloudConfiguration__storeCloudConfigurationDetails_waitUntilCompleted_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (!os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v5 = v4;
    objc_msgSend(v3, "MCVerboseDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Store cloud config details error. Error: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject refreshDetailsFromDisk](v5, "refreshDetailsFromDisk");
  }

LABEL_6:
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)removeSetAsideCloudConfigurationProfileWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __97__MCProfileConnection_CloudConfiguration__removeSetAsideCloudConfigurationProfileWithCompletion___block_invoke;
  v9[3] = &unk_1E41E3950;
  v10 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1A1AF040C](v9);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeSetAsideCloudConfigurationProfileWithCompletion:", v5);
}

void __97__MCProfileConnection_CloudConfiguration__removeSetAsideCloudConfigurationProfileWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "XPC connection failed when removing set aside cloud config profile. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (BOOL)activationRecordIndicatesCloudConfigurationIsAvailable
{
  return -[MCProfileConnection activationRecordIndicatesCloudConfigurationIsAvailableAndKeyExists:](self, "activationRecordIndicatesCloudConfigurationIsAvailableAndKeyExists:", 0);
}

- (BOOL)activationRecordIndicatesCloudConfigurationIsAvailableAndKeyExists:(BOOL *)a3
{
  void *v5;
  void *v6;
  char v7;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection flush](self, "flush");
  v5 = (void *)CFPreferencesCopyAppValue(CFSTR("LockdownActivationIndicatesCloudConfigurationAvailable"), CFSTR("com.apple.managedconfiguration.notbackedup"));
  v6 = v5;
  if (!v5)
  {
    v7 = 0;
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = objc_msgSend(v5, "BOOLValue");
  if (a3)
LABEL_3:
    *a3 = v6 != 0;
LABEL_4:

  return v7;
}

- (BOOL)shouldSkipSetupPanes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D447B8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "intValue") == 1)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D447B0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)shouldShowCloudConfigurationUI
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  uint8_t *v14;
  BOOL v15;
  __int16 v17;
  uint8_t v18[2];
  uint8_t buf[16];

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "details");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAsideDetails");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[MCProfileConnection activationRecordIndicatesCloudConfigurationIsAvailable](self, "activationRecordIndicatesCloudConfigurationIsAvailable")|| v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D447A8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    v10 = qword_1ECD40B38;
    if (!v9)
    {
      if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        v13 = "Cloud configuration is available.";
        v14 = v18;
        goto LABEL_15;
      }
LABEL_16:
      v15 = 1;
      goto LABEL_17;
    }
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_INFO, "User has completed cloud configuration. Not showing UI again.", buf, 2u);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("MCForceShowCloudConfigurationUI"));

  if (v12)
  {
    v10 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 0;
      v13 = "Force-displaying cloud configuration UI.";
      v14 = (uint8_t *)&v17;
LABEL_15:
      _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  v15 = 0;
LABEL_17:

  return v15;
}

- (BOOL)cloudConfigIndicatesMDMProfileNeedsToBeInstalled
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  BOOL v16;
  uint8_t v18[16];
  __int16 v19;
  uint8_t buf[2];
  __int16 v21;
  __int16 v22;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "details");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_17;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D44838]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    v7 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_INFO))
    {
      v22 = 0;
      v8 = "Cloud config indicates that MDM profile has been installed.";
      v9 = (uint8_t *)&v22;
LABEL_16:
      _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_INFO, v8, v9, 2u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D447D8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if ((v11 & 1) == 0)
  {
    v7 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_INFO))
    {
      v21 = 0;
      v8 = "Cloud config indicates that the device is not supervised.";
      v9 = (uint8_t *)&v21;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D447D0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "BOOLValue") & 1) == 0)
  {

LABEL_14:
    v7 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v8 = "Cloud config indicates that the MDM profile is not mandatory or is removable.";
      v9 = buf;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D447C8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if ((v14 & 1) == 0)
    goto LABEL_14;
  -[MCProfileConnection unverifiedInstalledMDMProfileIdentifier](self, "unverifiedInstalledMDMProfileIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = qword_1ECD40B38;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_INFO))
    {
      v19 = 0;
      v8 = "Found installed MDM profile.";
      v9 = (uint8_t *)&v19;
      goto LABEL_16;
    }
LABEL_17:
    v16 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_DEFAULT, "Cloud configuration is available and the MDM profile hasn't been installed.", v18, 2u);
  }
  v16 = 1;
LABEL_18:

  return v16;
}

- (BOOL)shouldShowSetupAssistant
{
  _BOOL4 v3;

  DMPerformMigrationIfNeeded();
  if (-[MCProfileConnection shouldShowCloudConfigurationUI](self, "shouldShowCloudConfigurationUI")
    || -[MCProfileConnection cloudConfigIndicatesMDMProfileNeedsToBeInstalled](self, "cloudConfigIndicatesMDMProfileNeedsToBeInstalled"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[MCProfileConnection wasCloudConfigurationApplied](self, "wasCloudConfigurationApplied");
    if (v3)
      LOBYTE(v3) = -[MCProfileConnection isAwaitingDeviceConfigured](self, "isAwaitingDeviceConfigured");
  }
  return v3;
}

- (void)storedProfileDataWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__MCProfileConnection_CloudConfiguration__storedProfileDataWithCompletion___block_invoke;
  v13[3] = &unk_1E41E3950;
  v6 = v4;
  v14 = v6;
  v7 = (void *)MEMORY[0x1A1AF040C](v13);
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __75__MCProfileConnection_CloudConfiguration__storedProfileDataWithCompletion___block_invoke_2;
  v11[3] = &unk_1E41E4920;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "storedProfileDataWithCompletion:", v11);

}

void __75__MCProfileConnection_CloudConfiguration__storedProfileDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Profile data stored for purpose error. Error: %{public}@", buf, 0xCu);

    }
  }
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __75__MCProfileConnection_CloudConfiguration__storedProfileDataWithCompletion___block_invoke_37;
    v9[3] = &unk_1E41E3CE0;
    v11 = v7;
    v10 = v3;
    dispatch_async(v8, v9);

  }
}

uint64_t __75__MCProfileConnection_CloudConfiguration__storedProfileDataWithCompletion___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __75__MCProfileConnection_CloudConfiguration__storedProfileDataWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Profile data stored for purpose error. Error: %{public}@", buf, 0xCu);

    }
  }
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__MCProfileConnection_CloudConfiguration__storedProfileDataWithCompletion___block_invoke_38;
    block[3] = &unk_1E41E48F8;
    v15 = v10;
    v13 = v5;
    v14 = v6;
    dispatch_async(v11, block);

  }
}

uint64_t __75__MCProfileConnection_CloudConfiguration__storedProfileDataWithCompletion___block_invoke_38(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)installProfileDataStoredForPurpose:(int)a3 completionBlock:(id)a4
{
  -[MCProfileConnection installStoredProfileDataWithCompletion:](self, "installStoredProfileDataWithCompletion:", a4);
}

- (void)installProfileDataStoredForPurpose:(int)a3 extraOptions:(id)a4 completionBlock:(id)a5
{
  -[MCProfileConnection installStoredProfileDataWithExtraOptions:completion:](self, "installStoredProfileDataWithExtraOptions:completion:", a4, a5);
}

- (void)installStoredProfileDataWithCompletion:(id)a3
{
  -[MCProfileConnection installStoredProfileDataWithExtraOptions:completion:](self, "installStoredProfileDataWithExtraOptions:completion:", 0, a3);
}

- (void)installStoredProfileDataWithExtraOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__MCProfileConnection_CloudConfiguration__installStoredProfileDataWithExtraOptions_completion___block_invoke;
  v10[3] = &unk_1E41E4970;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[MCProfileConnection storedProfileDataWithCompletion:](self, "storedProfileDataWithCompletion:", v10);

}

void __95__MCProfileConnection_CloudConfiguration__installStoredProfileDataWithExtraOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;

  v5 = a2;
  v6 = a3;
  v14 = v6;
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__MCProfileConnection_CloudConfiguration__installStoredProfileDataWithExtraOptions_completion___block_invoke_2;
    block[3] = &unk_1E41E4948;
    v16 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v21 = v16;
    v22 = v5;
    v23 = *(id *)(a1 + 48);
    dispatch_async(v15, block);

  }
  else
  {
    if (!v6)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(CFSTR("ERROR_PROFILE_NOT_FOUND"), v7, v8, v9, v10, v11, v12, v13, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCInstallationErrorDomain"), 4023, v18, CFSTR("MCFatalError"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v19 = *(_QWORD *)(a1 + 48);
    if (v19)
      (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v14);
  }

}

void __95__MCProfileConnection_CloudConfiguration__installStoredProfileDataWithExtraOptions_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cloudConfigurationDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D447C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 32), "cloudConfigurationDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D447B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue") == 1;

  v18[0] = CFSTR("isCloudLocked");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v18[1] = CFSTR("isCloudProfile");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v11, "addEntriesFromDictionary:");
  v12 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 48);
  v17 = 0;
  v14 = (id)objc_msgSend(v12, "installProfileData:options:outError:", v13, v11, &v17);
  v15 = v17;
  if (!v15)
    objc_msgSend(*(id *)(a1 + 32), "markStoredProfileAsInstalled");
  v16 = *(_QWORD *)(a1 + 56);
  if (v16)
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v15);

}

- (void)storeProfileData:(id)a3 configurationSource:(int)a4 purpose:(int)a5 completionBlock:(id)a6
{
  -[MCProfileConnection storeProfileData:completion:](self, "storeProfileData:completion:", a3, a6, *(_QWORD *)&a5);
}

- (void)storeProfileData:(id)a3
{
  -[MCProfileConnection storeProfileData:completion:](self, "storeProfileData:completion:", a3, &__block_literal_global_41);
}

- (void)storeProfileData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storeProfileData:completion:", v7, v6);

}

- (BOOL)shouldInstallStoredProfile
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MCPostSetupAutoInstallProfilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "details");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D447A8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "BOOLValue"))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D44838]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v8, "BOOLValue") ^ 1;

    }
    else
    {
      LOBYTE(v4) = 0;
    }

  }
  return v4;
}

- (void)markStoredProfileAsInstalled
{
  void *v3;
  id v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection xpcConnection](self, "xpcConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_43);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markStoredProfileAsInstalledWithCompletion:", &__block_literal_global_43);

}

void __71__MCProfileConnection_CloudConfiguration__markStoredProfileAsInstalled__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Mark stored profile for purpose as installed error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)setupAssistantDidFinish
{
  -[MCProfileConnection setupAssistantDidFinishWithCompletion:](self, "setupAssistantDidFinishWithCompletion:", 0);
}

- (void)setupAssistantDidFinishWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  char v24;
  uint8_t buf[16];

  v4 = a3;
  DMPerformMigrationIfNeeded();
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v5 = qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_INFO, "Setup assistant has finished. Preventing further cloud configuration changes.", buf, 2u);
  }
  v6 = (objc_msgSend(MEMORY[0x1E0D44770], "getManagementStateForMAID") >> 2) & 1;
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "details");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAsideDetails");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "mutableCopy");

  if (v9 || !v12)
  {
    if (v9 | v12)
      goto LABEL_9;
    objc_msgSend(MEMORY[0x1E0D44768], "canonicalConfigurationWithSupervision:", 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (id)v12;
  }
  v9 = (uint64_t)v13;
LABEL_9:
  objc_msgSend((id)v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D447A8]);
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __81__MCProfileConnection_CloudConfiguration__setupAssistantDidFinishWithCompletion___block_invoke;
  v22[3] = &unk_1E41E49B8;
  v24 = v6;
  v22[4] = self;
  v15 = v4;
  v23 = v15;
  v16 = (void *)MEMORY[0x1A1AF040C](v22);
  v17 = v16;
  if (v15)
  {
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __81__MCProfileConnection_CloudConfiguration__setupAssistantDidFinishWithCompletion___block_invoke_48;
    v20[3] = &unk_1E41E49E0;
    v20[4] = self;
    v21 = v16;
    -[MCProfileConnection storeCloudConfigurationDetails:waitUntilCompleted:completion:](self, "storeCloudConfigurationDetails:waitUntilCompleted:completion:", v9, 0, v20);

  }
  else
  {
    -[MCProfileConnection storeCloudConfigurationDetails:waitUntilCompleted:completion:](self, "storeCloudConfigurationDetails:waitUntilCompleted:completion:", v9, 1, 0);
    -[MCProfileConnection xpcConnection](self, "xpcConnection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setupAssistantDidFinishCompletion:", v17);

  }
}

void __81__MCProfileConnection_CloudConfiguration__setupAssistantDidFinishWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
    MDMSendDevicePostureChangedNotification();
  objc_msgSend(*(id *)(a1 + 32), "removeSetAsideCloudConfigurationProfileWithCompletion:", &__block_literal_global_45_2);
  objc_msgSend(*(id *)(a1 + 32), "removePostSetupAutoInstallSetAsideProfileWithCompletion:", &__block_literal_global_47);
  if (v3)
  {
    v4 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Could not tell profiled that Setup Assistant has completed. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __81__MCProfileConnection_CloudConfiguration__setupAssistantDidFinishWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_19ECC4000, v3, OS_LOG_TYPE_ERROR, "Failed to remove set aside cloud config profile with error: %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }

}

void __81__MCProfileConnection_CloudConfiguration__setupAssistantDidFinishWithCompletion___block_invoke_46(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_19ECC4000, v3, OS_LOG_TYPE_ERROR, "Failed to remove auto install set aside profile with error: %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }

}

void __81__MCProfileConnection_CloudConfiguration__setupAssistantDidFinishWithCompletion___block_invoke_48(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setupAssistantDidFinishCompletion:", *(_QWORD *)(a1 + 40));

}

- (id)diagnosticsUploadURL
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "diagnosticsUploadURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isProvisionallyEnrolled
{
  void *v2;
  char v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isProvisionallyEnrolled");

  return v3;
}

- (id)provisionalEnrollmentExpirationDate
{
  void *v2;
  void *v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "provisionalEnrollmentExpirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)userMode
{
  void *v2;
  int v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userMode");

  return v3 != 0;
}

- (id)tvProviderUserToken
{
  void *v2;
  void *v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tvProviderUserToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)deviceOrganizationName
{
  void *v2;
  void *v3;
  void *v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D44820]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deviceDepartmentName
{
  void *v2;
  void *v3;
  void *v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D44818]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deviceOrganizationAddress
{
  void *v2;
  void *v3;
  void *v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D447E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deviceOrganizationAddressLine1
{
  void *v2;
  void *v3;
  void *v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D447F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deviceOrganizationAddressLine2
{
  void *v2;
  void *v3;
  void *v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D447F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deviceOrganizationAddressLine3
{
  void *v2;
  void *v3;
  void *v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D44800]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deviceOrganizationCity
{
  void *v2;
  void *v3;
  void *v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D44808]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deviceOrganizationRegion
{
  void *v2;
  void *v3;
  void *v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D44828]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deviceOrganizationZipCode
{
  void *v2;
  void *v3;
  void *v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D44830]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deviceOrganizationCountry
{
  void *v2;
  void *v3;
  void *v4;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D44810]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deviceOrganizationVendorID
{
  return 0;
}

- (id)managingOrganizationInformation
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__15;
  v12 = __Block_byref_object_dispose__15;
  v13 = 0;
  -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_50);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__MCProfileConnection_CloudConfiguration__managingOrganizationInformation__block_invoke_51;
  v7[3] = &unk_1E41E4A08;
  v7[4] = &v8;
  objc_msgSend(v4, "managingOrganizationInformationWithCompletion:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __74__MCProfileConnection_CloudConfiguration__managingOrganizationInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch organization info. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __74__MCProfileConnection_CloudConfiguration__managingOrganizationInformation__block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch organization info. Error: %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (BOOL)applySingleAppModeConfiguration:(id)a3 clientType:(id)a4 clientUUID:(id)a5 localizedClientDescription:(id)a6 outError:(id *)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  BOOL v22;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "MCSetBoolRestriction:value:", v20, objc_msgSend(v21, "BOOLValue"));

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v17);
  }

  v22 = -[MCProfileConnection applyRestrictionDictionary:appsAndOptions:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:](self, "applyRestrictionDictionary:appsAndOptions:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:", v14, 0, v11, v12, v13, 0, 0, 0, a7);
  return v22;
}

- (BOOL)isAirDropUnmanagedForced
{
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveRestrictedBoolForSetting:", CFSTR("forceAirDropUnmanaged"));

  v4 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v5 = CFSTR("NO");
    if (v3 == 1)
      v5 = CFSTR("YES");
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "isAirDropUnmanagedForced: %@", (uint8_t *)&v7, 0xCu);
  }
  return v3 == 1;
}

- (BOOL)isURLManaged:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  id v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCManagedDomainsCache sharedCache](MCManagedDomainsCache, "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isURLManaged:", v4);

  v7 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v8 = CFSTR("NO");
    if (v6)
      v8 = CFSTR("YES");
    v10 = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_DEBUG, "isURLManaged(%@): %@", (uint8_t *)&v10, 0x16u);
  }

  return v6;
}

- (BOOL)mayShareToMessagesOriginatingAccountIsManaged:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v4;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  int v9;
  const __CFString *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v4 = -[MCProfileConnection mayShareToMessagesForOriginatingAppBundleID:originatingAccountIsManaged:](self, "mayShareToMessagesForOriginatingAppBundleID:originatingAccountIsManaged:", 0, a3);
  v5 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v6 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    if (v4)
      v6 = CFSTR("YES");
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_DEBUG, "mayShareToMessagesOriginatingAccountIsManaged:%@ => %@", (uint8_t *)&v9, 0x16u);
  }
  return v4;
}

- (BOOL)mayShareToMessagesForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const __CFString *v12;
  int v13;
  const __CFString *v14;
  BOOL v15;
  _QWORD v17[5];
  _QWORD v18[5];
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  if (-[MCProfileConnection isOpenInRestrictionInEffect](self, "isOpenInRestrictionInEffect"))
  {
    v7 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __110__MCProfileConnection_ManagedOpenIn__mayShareToMessagesForOriginatingAppBundleID_originatingAccountIsManaged___block_invoke;
    v18[3] = &unk_1E41E4A70;
    v18[4] = &v20;
    v19 = v4;
    v8 = (void *)MEMORY[0x1A1AF040C](v18);
    -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __110__MCProfileConnection_ManagedOpenIn__mayShareToMessagesForOriginatingAppBundleID_originatingAccountIsManaged___block_invoke_5;
    v17[3] = &unk_1E41E4A98;
    v17[4] = &v20;
    objc_msgSend(v10, "mayShareToMessagesForOriginatingAppBundleID:originatingAccountIsManaged:completion:", v6, v4, v17);

  }
  v11 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v12 = CFSTR("NO");
    v13 = *((unsigned __int8 *)v21 + 24);
    if (v4)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    if (v13)
      v12 = CFSTR("YES");
    v25 = v6;
    v26 = 2112;
    v27 = v14;
    v28 = 2112;
    v29 = v12;
    _os_log_impl(&dword_19ECC4000, v11, OS_LOG_TYPE_DEBUG, "mayShareToMessagesForOriginatingAppBundleID:%@ originatingAccountIsManaged:%@ => %@", buf, 0x20u);
  }
  v15 = *((_BYTE *)v21 + 24) != 0;
  _Block_object_dispose(&v20, 8);

  return v15;
}

void __110__MCProfileConnection_ManagedOpenIn__mayShareToMessagesForOriginatingAppBundleID_originatingAccountIsManaged___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "May share to Messages error. Error: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_BYTE *)(a1 + 40) ^ 1;

}

void __110__MCProfileConnection_ManagedOpenIn__mayShareToMessagesForOriginatingAppBundleID_originatingAccountIsManaged___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      objc_msgSend(v5, "MCVerboseDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_ERROR, "May share to Messages error. Error: %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (BOOL)mayShareToAirDropOriginatingAccountIsManaged:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v4;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  int v9;
  const __CFString *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v4 = -[MCProfileConnection mayShareToAirDropForOriginatingAppBundleID:originatingAccountIsManaged:](self, "mayShareToAirDropForOriginatingAppBundleID:originatingAccountIsManaged:", 0, a3);
  v5 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v6 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    if (v4)
      v6 = CFSTR("YES");
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_DEBUG, "mayShareToAirDropOriginatingAccountIsManaged:%@ => %@", (uint8_t *)&v9, 0x16u);
  }
  return v4;
}

- (BOOL)mayShareToAirDropForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const __CFString *v12;
  int v13;
  const __CFString *v14;
  BOOL v15;
  _QWORD v17[5];
  _QWORD v18[5];
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  if (-[MCProfileConnection isAirDropUnmanagedForced](self, "isAirDropUnmanagedForced")
    && !-[MCProfileConnection mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged"))
  {
    v7 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __109__MCProfileConnection_ManagedOpenIn__mayShareToAirDropForOriginatingAppBundleID_originatingAccountIsManaged___block_invoke;
    v18[3] = &unk_1E41E4A70;
    v18[4] = &v20;
    v19 = v4;
    v8 = (void *)MEMORY[0x1A1AF040C](v18);
    -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __109__MCProfileConnection_ManagedOpenIn__mayShareToAirDropForOriginatingAppBundleID_originatingAccountIsManaged___block_invoke_7;
    v17[3] = &unk_1E41E4A98;
    v17[4] = &v20;
    objc_msgSend(v10, "mayShareToAirDropForOriginatingAppBundleID:originatingAccountIsManaged:completion:", v6, v4, v17);

  }
  v11 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v12 = CFSTR("NO");
    v13 = *((unsigned __int8 *)v21 + 24);
    if (v4)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    if (v13)
      v12 = CFSTR("YES");
    v25 = v6;
    v26 = 2112;
    v27 = v14;
    v28 = 2112;
    v29 = v12;
    _os_log_impl(&dword_19ECC4000, v11, OS_LOG_TYPE_DEBUG, "mayShareToAirDropForOriginatingAppBundleID:%@ originatingAccountIsManaged:%@ => %@", buf, 0x20u);
  }
  v15 = *((_BYTE *)v21 + 24) != 0;
  _Block_object_dispose(&v20, 8);

  return v15;
}

void __109__MCProfileConnection_ManagedOpenIn__mayShareToAirDropForOriginatingAppBundleID_originatingAccountIsManaged___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "MCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "May share to AirDrop error. Error: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_BYTE *)(a1 + 40) ^ 1;

}

void __109__MCProfileConnection_ManagedOpenIn__mayShareToAirDropForOriginatingAppBundleID_originatingAccountIsManaged___block_invoke_7(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      objc_msgSend(v5, "MCVerboseDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_ERROR, "May share to AirDrop error. Error: %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (id)allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:(id)a3 originatingAppBundleID:(id)a4 originatingAccountIsManaged:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t *v12;
  id v13;
  NSObject *v14;
  const __CFString *v15;
  uint64_t v16;
  id v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v5 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__16;
  v24 = __Block_byref_object_dispose__16;
  v25 = 0;
  if (-[MCProfileConnection isOpenInRestrictionInEffect](self, "isOpenInRestrictionInEffect"))
  {
    -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_51);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __148__MCProfileConnection_ManagedOpenIn__allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs_originatingAppBundleID_originatingAccountIsManaged___block_invoke_8;
    v19[3] = &unk_1E41E3D28;
    v19[4] = &v20;
    objc_msgSend(v11, "allowedOpenInAppBundleIDs:originatingAppBundleID:originatingIsManaged:completion:", v8, v9, v5, v19);

  }
  else
  {
    v12 = v21;
    v13 = v8;
    v10 = (void *)v12[5];
    v12[5] = (uint64_t)v13;
  }

  v14 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v15 = CFSTR("NO");
    v16 = v21[5];
    if (v5)
      v15 = CFSTR("YES");
    *(_DWORD *)buf = 138413058;
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    v30 = 2112;
    v31 = v15;
    v32 = 2112;
    v33 = v16;
    _os_log_impl(&dword_19ECC4000, v14, OS_LOG_TYPE_DEBUG, "allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:%@ originatingAppBundleID:%@ originatingAccountIsManaged:%@ => %@", buf, 0x2Au);
  }
  v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v17;
}

void __148__MCProfileConnection_ManagedOpenIn__allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs_originatingAppBundleID_originatingAccountIsManaged___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Allowed open in app bundleIDs error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __148__MCProfileConnection_ManagedOpenIn__allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs_originatingAppBundleID_originatingAccountIsManaged___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Allowed open in app bundleIDs error. Error: %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (id)allowedImportFromAppBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 importingAppBundleID:(id)a4 importingAccountIsManaged:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  uint64_t v14;
  id v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v5 = a5;
  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__16;
  v22 = __Block_byref_object_dispose__16;
  v23 = 0;
  -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_10_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __145__MCProfileConnection_ManagedOpenIn__allowedImportFromAppBundleIDsAfterApplyingFilterToBundleIDs_importingAppBundleID_importingAccountIsManaged___block_invoke_11;
  v17[3] = &unk_1E41E3D28;
  v17[4] = &v18;
  objc_msgSend(v11, "allowedImportFromAppBundleIDs:importingAppBundleID:importingIsManaged:completion:", v8, v9, v5, v17);

  v12 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v13 = CFSTR("NO");
    v14 = v19[5];
    if (v5)
      v13 = CFSTR("YES");
    *(_DWORD *)buf = 138413058;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v13;
    v30 = 2112;
    v31 = v14;
    _os_log_impl(&dword_19ECC4000, v12, OS_LOG_TYPE_DEBUG, "allowedImportFromAppBundleIDsAfterApplyingFilterToBundleIDs:%@ importingAppBundleID:%@ importingAccountIsManaged:%@ => %@", buf, 0x2Au);
  }
  v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v15;
}

void __145__MCProfileConnection_ManagedOpenIn__allowedImportFromAppBundleIDsAfterApplyingFilterToBundleIDs_importingAppBundleID_importingAccountIsManaged___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "MCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Allowed import from app bundleIDs error. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __145__MCProfileConnection_ManagedOpenIn__allowedImportFromAppBundleIDsAfterApplyingFilterToBundleIDs_importingAppBundleID_importingAccountIsManaged___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1ECD40B38;
    if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "MCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Allowed import from app bundleIDs error. Error: %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (id)allowedAppBundleIDsForBidirectionalDataMovementAfterApplyingFilterToBundleIDs:(id)a3 localAppBundleID:(id)a4 localAccountIsManaged:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  -[MCProfileConnection allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:originatingAppBundleID:originatingAccountIsManaged:](self, "allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:originatingAppBundleID:originatingAccountIsManaged:", v8, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileConnection allowedImportFromAppBundleIDsAfterApplyingFilterToBundleIDs:importingAppBundleID:importingAccountIsManaged:](self, "allowedImportFromAppBundleIDsAfterApplyingFilterToBundleIDs:importingAppBundleID:importingAccountIsManaged:", v10, v9, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v13 = CFSTR("NO");
    v15 = 138413058;
    v16 = v8;
    v17 = 2112;
    if (v5)
      v13 = CFSTR("YES");
    v18 = v9;
    v19 = 2112;
    v20 = v13;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_19ECC4000, v12, OS_LOG_TYPE_DEBUG, "allowedAppBundleIDsForBidirectionalDataMovementAfterApplyingFilterToBundleIDs:%@ originatingAppBundleID:%@ localAccountIsManaged:%@ => %@", (uint8_t *)&v15, 0x2Au);
  }

  return v11;
}

- (id)managedAppBundleIDs
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  objc_msgSend(MEMORY[0x1E0D44778], "attributesByAppID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "managedAppBundleIDs => %@", (uint8_t *)&v6, 0xCu);
  }
  return v3;
}

- (BOOL)isBidirectionalDataTransferAllowedWithBundleID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  id v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (-[MCProfileConnection isOpenInRestrictionInEffect](self, "isOpenInRestrictionInEffect"))
  {
    MCContainingBundleIDForBundleID(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((MCIsAppAccountBasedTargetForOpenIn(v5) & 1) != 0
      || (MCIsAppExemptFromImportFromTargetRestrictions(v5) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v7 = -[MCProfileConnection isAppManaged:](self, "isAppManaged:", v5);
      v6 = v7 ^ objc_msgSend(MEMORY[0x1E0D1C1F0], "isCurrentPersonaEnterprise") ^ 1;
    }

  }
  else
  {
    v6 = 1;
  }
  v8 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v9 = CFSTR("NO");
    if (v6)
      v9 = CFSTR("YES");
    v11 = 138412546;
    v12 = v4;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_DEBUG, "isBidirectionalDataTransferAllowedWithBundleID:%@ => %@", (uint8_t *)&v11, 0x16u);
  }

  return v6;
}

- (int64_t)dragDropBidirectionalManagementStateForBaseBundleID:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  if (MCIsAppAccountBasedForDragDrop(v4))
  {
    v5 = 2;
  }
  else if ((MCIsAppExemptFromDragDropManagement(v4) & 1) != 0)
  {
    v5 = 3;
  }
  else
  {
    v5 = -[MCProfileConnection isAppManaged:](self, "isAppManaged:", v4);
  }

  return v5;
}

- (int64_t)dragDropSourceManagementStateForBundleID:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MCContainingBundleIDForBundleID(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0)
    v6 = 3;
  else
    v6 = -[MCProfileConnection dragDropBidirectionalManagementStateForBaseBundleID:](self, "dragDropBidirectionalManagementStateForBaseBundleID:", v5);
  v7 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412546;
    v10 = v4;
    v11 = 2048;
    v12 = v6;
    _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_DEBUG, "dragDropSourceManagementStateForBundleID:%@ => %li", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (int64_t)dragDropTargetManagementStateForBundleID:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MCContainingBundleIDForBundleID(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0)
    v6 = 0;
  else
    v6 = -[MCProfileConnection dragDropBidirectionalManagementStateForBaseBundleID:](self, "dragDropBidirectionalManagementStateForBaseBundleID:", v5);
  v7 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412546;
    v10 = v4;
    v11 = 2048;
    v12 = v6;
    _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_DEBUG, "dragDropTargetManagementStateForBundleID:%@ => %li", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (BOOL)isContactsReadAffectedByOpenInRestrictionsForTargetBundleID:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  int v9;
  id v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v5 = (MCIsAppExemptFromImportFromTargetRestrictionsForContacts(v4) & 1) == 0
    && -[MCProfileConnection _shouldApplyContactsFilterForTargetBundleID:targetAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:](self, "_shouldApplyContactsFilterForTargetBundleID:targetAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:", v4, 0, 0, 0);
  v6 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v7 = CFSTR("NO");
    if (v5)
      v7 = CFSTR("YES");
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_DEBUG, "isContactsReadAffectedByOpenInRestrictionsForTargetBundleID:%@ => %@", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (BOOL)mayShowLocalContactsAccountsForBundleID:(id)a3 sourceAccountManagement:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  BOOL v10;
  __int16 v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v12 = 0;
  -[MCProfileConnection _shouldApplyContactsFilterForBundleID:sourceAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:](self, "_shouldApplyContactsFilterForBundleID:sourceAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:", v6, v4, (char *)&v12 + 1, &v12);
  v7 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v8 = CFSTR("UNMANAGED");
    if ((_DWORD)v4 == 2)
      v8 = CFSTR("MANAGED");
    if (!(_DWORD)v4)
      v8 = CFSTR("NONE");
    *(_DWORD *)buf = 138412802;
    v14 = v6;
    v15 = 2112;
    v16 = v8;
    if ((_BYTE)v12)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_DEBUG, "mayShowLocalContactsAccountsForBundleID:%@ sourceAccountManagement:%@ => %@", buf, 0x20u);
  }
  v10 = v12;

  return v10;
}

- (id)filteredOpenInContactsAccounts:(id)a3 originatingAppBundleID:(id)a4 sourceAccountManagement:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  int v20;
  BOOL v21;
  char v22;
  NSObject *v23;
  const __CFString *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int16 v30;
  uint8_t buf[4];
  _BYTE v32[10];
  _BYTE v33[18];
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v5 = *(_QWORD *)&a5;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v10 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)v32 = v9;
    *(_WORD *)&v32[8] = 1024;
    *(_DWORD *)v33 = v5;
    *(_WORD *)&v33[4] = 2114;
    *(_QWORD *)&v33[6] = v8;
    _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_DEBUG, "Filtering contacts accounts for bundle ID: %{public}@, source account management: %d, contacts accounts: %{public}@", buf, 0x1Cu);
  }
  v30 = 0;
  v11 = -[MCProfileConnection _shouldApplyContactsFilterForBundleID:sourceAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:](self, "_shouldApplyContactsFilterForBundleID:sourceAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:", v9, v5, (char *)&v30 + 1, &v30);
  v12 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v32 = v11;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = HIBYTE(v30);
    *(_WORD *)v33 = 1024;
    *(_DWORD *)&v33[2] = v30;
    _os_log_impl(&dword_19ECC4000, v12, OS_LOG_TYPE_DEBUG, "Apply contacts filter: %d, allowManaged: %d, allowUnmanaged: %d", buf, 0x14u);
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v20 = objc_msgSend(v19, "MCIsManaged", (_QWORD)v26);
          if (v20)
            v21 = HIBYTE(v30) == 0;
          else
            v21 = 1;
          if (v21)
          {
            v22 = (_BYTE)v30 ? v20 : 1;
            if ((v22 & 1) != 0)
              continue;
          }
          objc_msgSend(v13, "addObject:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      }
      while (v16);
    }

  }
  else
  {
    v13 = v8;
  }
  v23 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v24 = CFSTR("UNMANAGED");
    if ((_DWORD)v5 == 2)
      v24 = CFSTR("MANAGED");
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v32 = v8;
    *(_WORD *)&v32[8] = 2112;
    *(_QWORD *)v33 = v9;
    *(_WORD *)&v33[8] = 2112;
    if (!(_DWORD)v5)
      v24 = CFSTR("NONE");
    *(_QWORD *)&v33[10] = v24;
    v34 = 2112;
    v35 = v13;
    _os_log_impl(&dword_19ECC4000, v23, OS_LOG_TYPE_DEBUG, "filteredOpenInContactsAccounts:%@ originatingAppBundleID:%@ sourceAccountManagement:%@ => %@", buf, 0x2Au);
  }

  return v13;
}

- (id)filteredOpenInOriginatingContactsAccounts:(id)a3 targetAppBundleID:(id)a4 targetAccountManagement:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  int v20;
  BOOL v21;
  char v22;
  NSObject *v23;
  const __CFString *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int16 v30;
  uint8_t buf[4];
  _BYTE v32[10];
  _BYTE v33[18];
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v5 = *(_QWORD *)&a5;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v10 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)v32 = v9;
    *(_WORD *)&v32[8] = 1024;
    *(_DWORD *)v33 = v5;
    *(_WORD *)&v33[4] = 2114;
    *(_QWORD *)&v33[6] = v8;
    _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_DEBUG, "Filtering originating contacts accounts for target bundle ID: %{public}@, target account management: %d, accounts: %{public}@", buf, 0x1Cu);
  }
  v30 = 0;
  v11 = -[MCProfileConnection _shouldApplyContactsFilterForTargetBundleID:targetAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:](self, "_shouldApplyContactsFilterForTargetBundleID:targetAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:", v9, v5, (char *)&v30 + 1, &v30);
  v12 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v32 = v11;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = HIBYTE(v30);
    *(_WORD *)v33 = 1024;
    *(_DWORD *)&v33[2] = v30;
    _os_log_impl(&dword_19ECC4000, v12, OS_LOG_TYPE_DEBUG, "Apply contacts filter: %d, allowManaged: %d, allowUnmanaged: %d", buf, 0x14u);
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v20 = objc_msgSend(v19, "MCIsManaged", (_QWORD)v26);
          if (v20)
            v21 = HIBYTE(v30) == 0;
          else
            v21 = 1;
          if (v21)
          {
            v22 = (_BYTE)v30 ? v20 : 1;
            if ((v22 & 1) != 0)
              continue;
          }
          objc_msgSend(v13, "addObject:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      }
      while (v16);
    }

  }
  else
  {
    v13 = v8;
  }
  v23 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v24 = CFSTR("UNMANAGED");
    if ((_DWORD)v5 == 2)
      v24 = CFSTR("MANAGED");
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v32 = v8;
    *(_WORD *)&v32[8] = 2112;
    *(_QWORD *)v33 = v9;
    *(_WORD *)&v33[8] = 2112;
    if (!(_DWORD)v5)
      v24 = CFSTR("NONE");
    *(_QWORD *)&v33[10] = v24;
    v34 = 2112;
    v35 = v13;
    _os_log_impl(&dword_19ECC4000, v23, OS_LOG_TYPE_DEBUG, "filteredOpenInOriginatingContactsAccounts:%@ targetAppBundleID:%@ targetAccountManagement:%@ => %@", buf, 0x2Au);
  }

  return v13;
}

- (BOOL)mayShowLocalContactsAccountsForTargetBundleID:(id)a3 targetAccountManagement:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  BOOL v10;
  __int16 v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v12 = 0;
  -[MCProfileConnection _shouldApplyContactsFilterForTargetBundleID:targetAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:](self, "_shouldApplyContactsFilterForTargetBundleID:targetAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:", v6, v4, (char *)&v12 + 1, &v12);
  v7 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v8 = CFSTR("UNMANAGED");
    if ((_DWORD)v4 == 2)
      v8 = CFSTR("MANAGED");
    if (!(_DWORD)v4)
      v8 = CFSTR("NONE");
    *(_DWORD *)buf = 138412802;
    v14 = v6;
    v15 = 2112;
    v16 = v8;
    if ((_BYTE)v12)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_DEBUG, "mayShowLocalContactsAccountsForTargetBundleID:%@ targetAccountManagement:%@ => %@", buf, 0x20u);
  }
  v10 = v12;

  return v10;
}

- (BOOL)mayShowLocalAccountsForBundleID:(id)a3 sourceAccountManagement:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  BOOL v10;
  __int16 v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v12 = 0;
  -[MCProfileConnection shouldApplyFilterForBundleID:sourceAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:](self, "shouldApplyFilterForBundleID:sourceAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:", v6, v4, (char *)&v12 + 1, &v12);
  v7 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v8 = CFSTR("UNMANAGED");
    if ((_DWORD)v4 == 2)
      v8 = CFSTR("MANAGED");
    if (!(_DWORD)v4)
      v8 = CFSTR("NONE");
    *(_DWORD *)buf = 138412802;
    v14 = v6;
    v15 = 2112;
    v16 = v8;
    if ((_BYTE)v12)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_DEBUG, "mayShowLocalAccountsForBundleID:%@ sourceAccountManagement:%@ => %@", buf, 0x20u);
  }
  v10 = v12;

  return v10;
}

- (BOOL)mayShowLocalAccountsForTargetBundleID:(id)a3 targetAccountManagement:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  BOOL v10;
  __int16 v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v12 = 0;
  -[MCProfileConnection shouldApplyFilterForTargetBundleID:targetAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:](self, "shouldApplyFilterForTargetBundleID:targetAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:", v6, v4, (char *)&v12 + 1, &v12);
  v7 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v8 = CFSTR("UNMANAGED");
    if ((_DWORD)v4 == 2)
      v8 = CFSTR("MANAGED");
    if (!(_DWORD)v4)
      v8 = CFSTR("NONE");
    *(_DWORD *)buf = 138412802;
    v14 = v6;
    v15 = 2112;
    v16 = v8;
    if ((_BYTE)v12)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_DEBUG, "mayShowLocalAccountsForTargetBundleID:%@ targetAccountManagement:%@ => %@", buf, 0x20u);
  }
  v10 = v12;

  return v10;
}

- (BOOL)canSendMail:(id)a3 sourceAccountManagement:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;
  BOOL v14;
  _QWORD v16[5];
  uint8_t v17[4];
  id v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  _BYTE buf[24];
  char v24;
  uint64_t v25;

  v4 = *(_QWORD *)&a4;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v7 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_DEBUG, "Filtering mail sheet accounts for bundle ID: %{public}@, source account management: %d", buf, 0x12u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v24 = 0;
  -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__MCProfileConnection_ManagedOpenIn__canSendMail_sourceAccountManagement___block_invoke_22;
  v16[3] = &unk_1E41E4A98;
  v16[4] = buf;
  objc_msgSend(v9, "hasMailAccountsWithFilteringEnabled:sourceAccountManagement:completion:", 1, v4, v16);
  v10 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v11 = CFSTR("UNMANAGED");
    if ((_DWORD)v4 == 2)
      v11 = CFSTR("MANAGED");
    if (!(_DWORD)v4)
      v11 = CFSTR("NONE");
    v12 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
    *(_DWORD *)v17 = 138412802;
    v18 = v6;
    v19 = 2112;
    v20 = v11;
    if (v12)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v21 = 2112;
    v22 = v13;
    _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_DEBUG, "canSendMail:%@ sourceAccountManagement:%@ => %@", v17, 0x20u);
  }
  v14 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v14;
}

void __74__MCProfileConnection_ManagedOpenIn__canSendMail_sourceAccountManagement___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
  {
    v4 = v3;
    objc_msgSend(a2, "MCVerboseDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Could not filter accounts. Error: %{public}@", (uint8_t *)&v6, 0xCu);

  }
}

uint64_t __74__MCProfileConnection_ManagedOpenIn__canSendMail_sourceAccountManagement___block_invoke_22(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)hasAnyMailAccountIgnoringFiltering
{
  void *v3;
  void *v4;
  NSObject *v5;
  const __CFString *v6;
  BOOL v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_23_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__MCProfileConnection_ManagedOpenIn__hasAnyMailAccountIgnoringFiltering__block_invoke_24;
  v9[3] = &unk_1E41E4A98;
  v9[4] = &v10;
  objc_msgSend(v4, "hasMailAccountsWithFilteringEnabled:sourceAccountManagement:completion:", 0, 0, v9);
  v5 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    if (*((_BYTE *)v11 + 24))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_DEBUG, "canSendMailIgnoringAllFiltering => %@", buf, 0xCu);
  }
  v7 = *((_BYTE *)v11 + 24) != 0;

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __72__MCProfileConnection_ManagedOpenIn__hasAnyMailAccountIgnoringFiltering__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
  {
    v4 = v3;
    objc_msgSend(a2, "MCVerboseDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Could not filter accounts. Error: %{public}@", (uint8_t *)&v6, 0xCu);

  }
}

uint64_t __72__MCProfileConnection_ManagedOpenIn__hasAnyMailAccountIgnoringFiltering__block_invoke_24(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)filteredMailSheetAccountsForBundleID:(id)a3 sourceAccountManagement:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  id v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  BOOL v19;
  NSObject *v20;
  const __CFString *v21;
  const __CFString *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int16 v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  _BYTE v35[128];
  uint64_t v36;

  v4 = *(_QWORD *)&a4;
  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v7 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v30 = v6;
    v31 = 1024;
    LODWORD(v32) = v4;
    _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_DEBUG, "Filtering mail sheet accounts for bundle ID: %{public}@, source account management: %d", buf, 0x12u);
  }
  v8 = MCMailAccountClass();
  v28 = 0;
  v9 = -[MCProfileConnection shouldApplyFilterForBundleID:sourceAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:](self, "shouldApplyFilterForBundleID:sourceAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:", v6, v4, (char *)&v28 + 1, &v28);
  objc_msgSend(v8, "activeAccounts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v18, "sourceIsManaged", (_QWORD)v24))
            v19 = HIBYTE(v28) == 0;
          else
            v19 = 1;
          if (!v19 || (objc_msgSend(v18, "sourceIsManaged") & 1) == 0 && (_BYTE)v28)
            objc_msgSend(v12, "addObject:", v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
      }
      while (v15);
    }

  }
  else
  {
    v12 = v10;
  }
  v20 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v21 = CFSTR("UNMANAGED");
    if ((_DWORD)v4 == 2)
      v21 = CFSTR("MANAGED");
    if (!(_DWORD)v4)
      v21 = CFSTR("NONE");
    v22 = CFSTR("YES");
    *(_DWORD *)buf = 138412802;
    v30 = v6;
    v32 = v21;
    v31 = 2112;
    if (!v12)
      v22 = CFSTR("NO");
    v33 = 2112;
    v34 = v22;
    _os_log_impl(&dword_19ECC4000, v20, OS_LOG_TYPE_DEBUG, "filteredMailSheetAccountsForBundleID:%@ sourceAccountManagement:%@ => %@", buf, 0x20u);
  }

  return v12;
}

- (BOOL)shouldApplyFilterForBundleID:(id)a3 sourceAccountManagement:(int)a4 outAllowManagedAccounts:(BOOL *)a5 outAllowUnmanagedAccounts:(BOOL *)a6
{
  id v10;
  int v11;
  _BOOL4 v12;
  BOOL v13;
  _BOOL4 v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v21;
  int v22;
  _BOOL4 v23;
  int v24;
  id v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (!-[MCProfileConnection isOpenInRestrictionInEffect](self, "isOpenInRestrictionInEffect")
    || (MCIsAppExemptFromOpenInSourceRestrictions(v10) & 1) != 0)
  {
    goto LABEL_3;
  }
  if (MCIsAppAccountBasedSourceForOpenIn(v10))
  {
    if (a4 != 1)
    {
      if (a4 != 2)
      {
LABEL_3:
        v11 = 0;
        LOBYTE(v12) = 1;
LABEL_4:
        v13 = 1;
        v14 = v11;
        goto LABEL_5;
      }
LABEL_34:
      v12 = -[MCProfileConnection mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged");
      v11 = !v12;
      goto LABEL_4;
    }
  }
  else
  {
    +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isAppManaged:", v10);

    if (v22)
      goto LABEL_34;
  }
  v23 = -[MCProfileConnection mayOpenFromUnmanagedToManaged](self, "mayOpenFromUnmanagedToManaged");
  v11 = 0;
  v13 = 0;
  LOBYTE(v12) = 1;
  v14 = 1;
  if (v23)
    goto LABEL_4;
LABEL_5:
  if (a5)
    *a5 = v13;
  if (a6)
    *a6 = v12;
  v15 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v16 = CFSTR("UNMANAGED");
    if (a4 == 2)
      v16 = CFSTR("MANAGED");
    if (!a4)
      v16 = CFSTR("NONE");
    v17 = CFSTR("NO");
    if (v14)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    if (a5)
    {
      if (*a5)
        v19 = CFSTR("YES");
      else
        v19 = CFSTR("NO");
      if (a6)
        goto LABEL_22;
    }
    else
    {
      v19 = CFSTR("NOT RETURNED");
      if (a6)
      {
LABEL_22:
        if (*a6)
          v17 = CFSTR("YES");
        goto LABEL_31;
      }
    }
    v17 = CFSTR("NOT RETURNED");
LABEL_31:
    v24 = 138413314;
    v25 = v10;
    v26 = 2112;
    v27 = v16;
    v28 = 2112;
    v29 = v18;
    v30 = 2112;
    v31 = v19;
    v32 = 2112;
    v33 = v17;
    _os_log_impl(&dword_19ECC4000, v15, OS_LOG_TYPE_DEBUG, "shouldApplyFilterForBundleID:%@ sourceAccountManagement:%@ => %@, allowManagedAccounts:%@, allowUnamangedAccounts:%@", (uint8_t *)&v24, 0x34u);
  }

  return v14;
}

- (BOOL)shouldApplyFilterForTargetBundleID:(id)a3 targetAccountManagement:(int)a4 outAllowManagedAccounts:(BOOL *)a5 outAllowUnmanagedAccounts:(BOOL *)a6
{
  id v10;
  int v11;
  _BOOL4 v12;
  BOOL v13;
  _BOOL4 v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v21;
  int v22;
  _BOOL4 v23;
  int v24;
  id v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (!-[MCProfileConnection isOpenInRestrictionInEffect](self, "isOpenInRestrictionInEffect")
    || (MCIsAppExemptFromImportFromTargetRestrictions(v10) & 1) != 0)
  {
    goto LABEL_3;
  }
  if (MCIsAppAccountBasedTargetForOpenIn(v10))
  {
    if (a4 != 1)
    {
      if (a4 != 2)
      {
LABEL_3:
        v11 = 0;
        LOBYTE(v12) = 1;
LABEL_4:
        v13 = 1;
        v14 = v11;
        goto LABEL_5;
      }
LABEL_34:
      v12 = -[MCProfileConnection mayOpenFromUnmanagedToManaged](self, "mayOpenFromUnmanagedToManaged");
      v11 = !v12;
      goto LABEL_4;
    }
  }
  else
  {
    +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isAppManaged:", v10);

    if (v22)
      goto LABEL_34;
  }
  v23 = -[MCProfileConnection mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged");
  v11 = 0;
  v13 = 0;
  LOBYTE(v12) = 1;
  v14 = 1;
  if (v23)
    goto LABEL_4;
LABEL_5:
  if (a5)
    *a5 = v13;
  if (a6)
    *a6 = v12;
  v15 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v16 = CFSTR("UNMANAGED");
    if (a4 == 2)
      v16 = CFSTR("MANAGED");
    if (!a4)
      v16 = CFSTR("NONE");
    v17 = CFSTR("NO");
    if (v14)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    if (a5)
    {
      if (*a5)
        v19 = CFSTR("YES");
      else
        v19 = CFSTR("NO");
      if (a6)
        goto LABEL_22;
    }
    else
    {
      v19 = CFSTR("NOT RETURNED");
      if (a6)
      {
LABEL_22:
        if (*a6)
          v17 = CFSTR("YES");
        goto LABEL_31;
      }
    }
    v17 = CFSTR("NOT RETURNED");
LABEL_31:
    v24 = 138413314;
    v25 = v10;
    v26 = 2112;
    v27 = v16;
    v28 = 2112;
    v29 = v18;
    v30 = 2112;
    v31 = v19;
    v32 = 2112;
    v33 = v17;
    _os_log_impl(&dword_19ECC4000, v15, OS_LOG_TYPE_DEBUG, "shouldApplyFilterForTargetBundleID:%@ targetAccountManagement:%@ => %@, allowManagedAccounts:%@, allowUnamangedAccounts:%@", (uint8_t *)&v24, 0x34u);
  }

  return v14;
}

- (id)filteredOpenInAccounts:(id)a3 originatingAppBundleID:(id)a4 sourceAccountManagement:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  int v20;
  BOOL v21;
  char v22;
  NSObject *v23;
  const __CFString *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int16 v30;
  uint8_t buf[4];
  _BYTE v32[10];
  _BYTE v33[18];
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v5 = *(_QWORD *)&a5;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v10 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)v32 = v9;
    *(_WORD *)&v32[8] = 1024;
    *(_DWORD *)v33 = v5;
    *(_WORD *)&v33[4] = 2114;
    *(_QWORD *)&v33[6] = v8;
    _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_DEBUG, "Filtering accounts for bundle ID: %{public}@, source account management: %d, accounts: %{public}@", buf, 0x1Cu);
  }
  v30 = 0;
  v11 = -[MCProfileConnection shouldApplyFilterForBundleID:sourceAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:](self, "shouldApplyFilterForBundleID:sourceAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:", v9, v5, (char *)&v30 + 1, &v30);
  v12 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v32 = v11;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = HIBYTE(v30);
    *(_WORD *)v33 = 1024;
    *(_DWORD *)&v33[2] = v30;
    _os_log_impl(&dword_19ECC4000, v12, OS_LOG_TYPE_DEBUG, "Apply filter: %d, allowManaged: %d, allowUnmanaged: %d", buf, 0x14u);
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v20 = objc_msgSend(v19, "MCIsManaged", (_QWORD)v26);
          if (v20)
            v21 = HIBYTE(v30) == 0;
          else
            v21 = 1;
          if (v21)
          {
            v22 = (_BYTE)v30 ? v20 : 1;
            if ((v22 & 1) != 0)
              continue;
          }
          objc_msgSend(v13, "addObject:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      }
      while (v16);
    }

  }
  else
  {
    v13 = v8;
  }
  v23 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v24 = CFSTR("UNMANAGED");
    if ((_DWORD)v5 == 2)
      v24 = CFSTR("MANAGED");
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v32 = v8;
    *(_WORD *)&v32[8] = 2112;
    *(_QWORD *)v33 = v9;
    *(_WORD *)&v33[8] = 2112;
    if (!(_DWORD)v5)
      v24 = CFSTR("NONE");
    *(_QWORD *)&v33[10] = v24;
    v34 = 2112;
    v35 = v13;
    _os_log_impl(&dword_19ECC4000, v23, OS_LOG_TYPE_DEBUG, "filteredOpenInAccounts:%@ originatingAppBundleID:%@ sourceAccountManagement:%@ => %@", buf, 0x2Au);
  }

  return v13;
}

- (id)filteredOpenInOriginatingAccounts:(id)a3 targetAppBundleID:(id)a4 targetAccountManagement:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  int v20;
  BOOL v21;
  char v22;
  NSObject *v23;
  const __CFString *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int16 v30;
  uint8_t buf[4];
  _BYTE v32[10];
  _BYTE v33[18];
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v5 = *(_QWORD *)&a5;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v10 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)v32 = v9;
    *(_WORD *)&v32[8] = 1024;
    *(_DWORD *)v33 = v5;
    *(_WORD *)&v33[4] = 2114;
    *(_QWORD *)&v33[6] = v8;
    _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_DEBUG, "Filtering originating accounts for target bundle ID: %{public}@, target account management: %d, accounts: %{public}@", buf, 0x1Cu);
  }
  v30 = 0;
  v11 = -[MCProfileConnection shouldApplyFilterForTargetBundleID:targetAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:](self, "shouldApplyFilterForTargetBundleID:targetAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:", v9, v5, (char *)&v30 + 1, &v30);
  v12 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v32 = v11;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = HIBYTE(v30);
    *(_WORD *)v33 = 1024;
    *(_DWORD *)&v33[2] = v30;
    _os_log_impl(&dword_19ECC4000, v12, OS_LOG_TYPE_DEBUG, "Apply filter: %d, allowManaged: %d, allowUnmanaged: %d", buf, 0x14u);
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v20 = objc_msgSend(v19, "MCIsManaged", (_QWORD)v26);
          if (v20)
            v21 = HIBYTE(v30) == 0;
          else
            v21 = 1;
          if (v21)
          {
            v22 = (_BYTE)v30 ? v20 : 1;
            if ((v22 & 1) != 0)
              continue;
          }
          objc_msgSend(v13, "addObject:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      }
      while (v16);
    }

  }
  else
  {
    v13 = v8;
  }
  v23 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v24 = CFSTR("UNMANAGED");
    if ((_DWORD)v5 == 2)
      v24 = CFSTR("MANAGED");
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v32 = v8;
    *(_WORD *)&v32[8] = 2112;
    *(_QWORD *)v33 = v9;
    *(_WORD *)&v33[8] = 2112;
    if (!(_DWORD)v5)
      v24 = CFSTR("NONE");
    *(_QWORD *)&v33[10] = v24;
    v34 = 2112;
    v35 = v13;
    _os_log_impl(&dword_19ECC4000, v23, OS_LOG_TYPE_DEBUG, "filteredOpenInOriginatingAccounts:%@ targetAppBundleID:%@ targetAccountManagement:%@ => %@", buf, 0x2Au);
  }

  return v13;
}

- (void)allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 hostAppBundleID:(id)a4 accountIsManaged:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id *v15;
  id v16;
  void *v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  BOOL v26;
  _QWORD v27[4];
  id v28;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (-[MCProfileConnection isOpenInRestrictionInEffect](self, "isOpenInRestrictionInEffect"))
  {
    -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __137__MCProfileConnection_ManagedOpenIn__allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_hostAppBundleID_accountIsManaged_completion___block_invoke;
    v27[3] = &unk_1E41E3950;
    v15 = &v28;
    v16 = v12;
    v28 = v16;
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = v14;
    v22[1] = 3221225472;
    v22[2] = __137__MCProfileConnection_ManagedOpenIn__allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_hostAppBundleID_accountIsManaged_completion___block_invoke_28;
    v22[3] = &unk_1E41E4AC0;
    v23 = v10;
    v24 = v11;
    v26 = v7;
    v25 = v16;
    objc_msgSend(v17, "allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:hostAppBundleID:accountIsManaged:completion:", v23, v24, v7, v22);

LABEL_5:
    goto LABEL_6;
  }
  if (v12)
  {
    dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __137__MCProfileConnection_ManagedOpenIn__allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_hostAppBundleID_accountIsManaged_completion___block_invoke_30;
    block[3] = &unk_1E41E3CE0;
    v15 = &v21;
    v21 = v12;
    v20 = v10;
    dispatch_async(v18, block);

    v17 = v20;
    goto LABEL_5;
  }
LABEL_6:

}

void __137__MCProfileConnection_ManagedOpenIn__allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_hostAppBundleID_accountIsManaged_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_msgSend(v3, "MCVerboseDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Could not filter keyboards. Error: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, MEMORY[0x1E0C9AA60]);

}

void __137__MCProfileConnection_ManagedOpenIn__allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_hostAppBundleID_accountIsManaged_completion___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 56))
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    v9 = 138413058;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:%@ hostAppBundleID:%@ accountIsManaged:%@ => %@", (uint8_t *)&v9, 0x2Au);
  }
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

uint64_t __137__MCProfileConnection_ManagedOpenIn__allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_hostAppBundleID_accountIsManaged_completion___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 hostAppBundleID:(id)a4 accountIsManaged:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__16;
  v25 = __Block_byref_object_dispose__16;
  v26 = (id)MEMORY[0x1E0C9AA60];
  if (-[MCProfileConnection isOpenInRestrictionInEffect](self, "isOpenInRestrictionInEffect"))
  {
    -[MCProfileConnection publicXPCConnection](self, "publicXPCConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_32_1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __126__MCProfileConnection_ManagedOpenIn__allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_hostAppBundleID_accountIsManaged___block_invoke_33;
    v16[3] = &unk_1E41E4AE8;
    v17 = v8;
    v20 = v5;
    v18 = v9;
    v19 = &v21;
    objc_msgSend(v11, "allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:hostAppBundleID:accountIsManaged:completion:", v17, v18, v5, v16);

  }
  else
  {
    v12 = v22;
    v13 = v8;
    v11 = (void *)v12[5];
    v12[5] = (uint64_t)v13;
  }

  v14 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v14;
}

void __126__MCProfileConnection_ManagedOpenIn__allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_hostAppBundleID_accountIsManaged___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)qword_1ECD40B38;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B38, OS_LOG_TYPE_ERROR))
  {
    v4 = v3;
    objc_msgSend(a2, "MCVerboseDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Could not filter keyboards synchronously. Error: %{public}@", (uint8_t *)&v6, 0xCu);

  }
}

void __126__MCProfileConnection_ManagedOpenIn__allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_hostAppBundleID_accountIsManaged___block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 56))
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    v10 = 138413058;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:%@ hostAppBundleID:%@ accountIsManaged:%@ => %@", (uint8_t *)&v10, 0x2Au);
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

- (BOOL)isManagedPasteboardRequired
{
  void *v2;
  BOOL v3;

  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveRestrictedBoolForSetting:", CFSTR("requireManagedPasteboard")) == 1;

  return v3;
}

- (BOOL)isContinuityPasteboardWithManagedDataAllowed
{
  return 1;
}

- (BOOL)_unmanagedMayReadManagedContacts
{
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveRestrictedBoolForSetting:", CFSTR("allowUnmanagedToReadManagedContacts"));

  v4 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v5 = CFSTR("NO");
    if (v3 != 2)
      v5 = CFSTR("YES");
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "unmanagedMayReadManagedContacts: %@", (uint8_t *)&v7, 0xCu);
  }
  return v3 != 2;
}

- (BOOL)_managedMayWriteUnmanagedContacts
{
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveRestrictedBoolForSetting:", CFSTR("allowManagedToWriteUnmanagedContacts"));

  v4 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v5 = CFSTR("NO");
    if (v3 != 2)
      v5 = CFSTR("YES");
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "managedMayWriteUnmanagedContacts: %@", (uint8_t *)&v7, 0xCu);
  }
  return v3 != 2;
}

- (BOOL)_shouldApplyContactsFilterForBundleID:(id)a3 sourceAccountManagement:(int)a4 outAllowManagedAccounts:(BOOL *)a5 outAllowUnmanagedAccounts:(BOOL *)a6
{
  id v10;
  int v11;
  BOOL v12;
  BOOL v13;
  _BOOL4 v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v21;
  int v22;
  _BOOL4 v23;
  int v24;
  id v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (!-[MCProfileConnection isOpenInRestrictionInEffect](self, "isOpenInRestrictionInEffect")
    || (MCIsAppExemptFromOpenInSourceRestrictions(v10) & 1) != 0)
  {
    goto LABEL_3;
  }
  if (MCIsAppAccountBasedSourceForOpenIn(v10))
  {
    if (a4 != 1)
    {
      if (a4 != 2)
        goto LABEL_3;
      goto LABEL_34;
    }
  }
  else
  {
    +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isAppManaged:", v10);

    if (v22)
    {
LABEL_34:
      if (!-[MCProfileConnection mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged")
        && !-[MCProfileConnection _managedMayWriteUnmanagedContacts](self, "_managedMayWriteUnmanagedContacts"))
      {
        v12 = 0;
        v11 = 1;
        goto LABEL_4;
      }
LABEL_3:
      v11 = 0;
      v12 = 1;
LABEL_4:
      v13 = 1;
      v14 = v11;
      goto LABEL_5;
    }
  }
  v23 = -[MCProfileConnection mayOpenFromUnmanagedToManaged](self, "mayOpenFromUnmanagedToManaged");
  v11 = 0;
  v13 = 0;
  v12 = 1;
  v14 = 1;
  if (v23)
    goto LABEL_4;
LABEL_5:
  if (a5)
    *a5 = v13;
  if (a6)
    *a6 = v12;
  v15 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v16 = CFSTR("UNMANAGED");
    if (a4 == 2)
      v16 = CFSTR("MANAGED");
    if (!a4)
      v16 = CFSTR("NONE");
    v17 = CFSTR("NO");
    if (v14)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    if (a5)
    {
      if (*a5)
        v19 = CFSTR("YES");
      else
        v19 = CFSTR("NO");
      if (a6)
        goto LABEL_22;
    }
    else
    {
      v19 = CFSTR("NOT RETURNED");
      if (a6)
      {
LABEL_22:
        if (*a6)
          v17 = CFSTR("YES");
        goto LABEL_31;
      }
    }
    v17 = CFSTR("NOT RETURNED");
LABEL_31:
    v24 = 138413314;
    v25 = v10;
    v26 = 2112;
    v27 = v16;
    v28 = 2112;
    v29 = v18;
    v30 = 2112;
    v31 = v19;
    v32 = 2112;
    v33 = v17;
    _os_log_impl(&dword_19ECC4000, v15, OS_LOG_TYPE_DEBUG, "shouldApplyContactsFilterForBundleID:%@ sourceAccountManagement:%@ => %@, allowManagedAccounts:%@, allowUnamangedAccounts:%@", (uint8_t *)&v24, 0x34u);
  }

  return v14;
}

- (BOOL)_shouldApplyContactsFilterForTargetBundleID:(id)a3 targetAccountManagement:(int)a4 outAllowManagedAccounts:(BOOL *)a5 outAllowUnmanagedAccounts:(BOOL *)a6
{
  id v10;
  int v11;
  _BOOL4 v12;
  BOOL v13;
  _BOOL4 v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v21;
  char v22;
  _BOOL4 v23;
  int v24;
  id v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[MCProfileConnection checkInIfNeeded](self, "checkInIfNeeded");
  if (!-[MCProfileConnection isOpenInRestrictionInEffect](self, "isOpenInRestrictionInEffect")
    || (MCIsAppExemptFromImportFromTargetRestrictions(v10) & 1) != 0)
  {
    goto LABEL_3;
  }
  if (MCIsAppAccountBasedTargetForOpenIn(v10))
  {
    if (a4 != 1)
    {
      if (a4 != 2)
        goto LABEL_3;
LABEL_34:
      v12 = -[MCProfileConnection mayOpenFromUnmanagedToManaged](self, "mayOpenFromUnmanagedToManaged");
      v11 = !v12;
      goto LABEL_4;
    }
  }
  else
  {
    +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isAppManaged:", v10);

    if ((v22 & 1) != 0)
      goto LABEL_34;
  }
  if (-[MCProfileConnection mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged"))
  {
LABEL_3:
    v11 = 0;
    LOBYTE(v12) = 1;
LABEL_4:
    v13 = 1;
    v14 = v11;
    goto LABEL_5;
  }
  v23 = -[MCProfileConnection _unmanagedMayReadManagedContacts](self, "_unmanagedMayReadManagedContacts");
  v11 = 0;
  v13 = 0;
  LOBYTE(v12) = 1;
  v14 = 1;
  if (v23)
    goto LABEL_4;
LABEL_5:
  if (a5)
    *a5 = v13;
  if (a6)
    *a6 = v12;
  v15 = qword_1ECD40B18;
  if (os_log_type_enabled((os_log_t)qword_1ECD40B18, OS_LOG_TYPE_DEBUG))
  {
    v16 = CFSTR("UNMANAGED");
    if (a4 == 2)
      v16 = CFSTR("MANAGED");
    if (!a4)
      v16 = CFSTR("NONE");
    v17 = CFSTR("NO");
    if (v14)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    if (a5)
    {
      if (*a5)
        v19 = CFSTR("YES");
      else
        v19 = CFSTR("NO");
      if (a6)
        goto LABEL_22;
    }
    else
    {
      v19 = CFSTR("NOT RETURNED");
      if (a6)
      {
LABEL_22:
        if (*a6)
          v17 = CFSTR("YES");
        goto LABEL_31;
      }
    }
    v17 = CFSTR("NOT RETURNED");
LABEL_31:
    v24 = 138413314;
    v25 = v10;
    v26 = 2112;
    v27 = v16;
    v28 = 2112;
    v29 = v18;
    v30 = 2112;
    v31 = v19;
    v32 = 2112;
    v33 = v17;
    _os_log_impl(&dword_19ECC4000, v15, OS_LOG_TYPE_DEBUG, "shouldApplyContactsFilterForTargetBundleID:%@ targetAccountManagement:%@ => %@, allowManagedAccounts:%@, allowUnamangedAccounts:%@", (uint8_t *)&v24, 0x34u);
  }

  return v14;
}

@end
