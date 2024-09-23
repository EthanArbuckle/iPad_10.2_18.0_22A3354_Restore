@implementation ADIDManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__ADIDManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_1 != -1)
    dispatch_once(&sharedInstance__onceToken_1, block);
  return (id)sharedInstance__instance_1;
}

- (id)deviceIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADIDManager idForClientType:](self, "idForClientType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("iAdID"));

  -[ADIDManager idForClientType:](self, "idForClientType:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ADIDManager idForClientType:](self, "idForClientType:", 5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("DPID"));

  }
  else
  {
    objc_msgSend(v3, "setValue:forKey:", CFSTR("(null)"), CFSTR("DPID"));
  }

  -[ADIDManager idForClientType:](self, "idForClientType:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("ToroID"));

  -[ADIDManager idForClientType:](self, "idForClientType:", 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("DeviceNewsPlusSubscriberID"));

  -[ADIDManager idForClientType:](self, "idForClientType:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v9, CFSTR("AnonymousDemandID"));

  -[ADIDManager idForClientType:](self, "idForClientType:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v10, CFSTR("ContentID"));

  +[ADCoreSettings sharedInstance](ADCoreSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isPersonalizedAdsEnabled"))
    v12 = CFSTR("ON");
  else
    v12 = CFSTR("OFF");
  objc_msgSend(v3, "setValue:forKey:", v12, CFSTR("Personalized Ads"));

  -[ADIDManager activeDSIDRecord](self, "activeDSIDRecord");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "segmentData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[ADIDManager activeDSIDRecord](self, "activeDSIDRecord");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "segmentData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("Segments"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", CFSTR("(null)"), CFSTR("Segments"));
  }

  -[ADIDManager activeDSIDRecord](self, "activeDSIDRecord");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "DSID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[ADIDManager activeDSIDRecord](self, "activeDSIDRecord");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "DSID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("DSID"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", CFSTR("(null)"), CFSTR("DSID"));
  }

  -[ADIDManager activeDSIDRecord](self, "activeDSIDRecord");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "iCloudDSID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[ADIDManager activeDSIDRecord](self, "activeDSIDRecord");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "iCloudDSID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("iCloud DSID"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", CFSTR("(null)"), CFSTR("iCloud DSID"));
  }

  return v3;
}

- (id)idForClientType:(int64_t)a3
{
  ADIDManager *v4;
  void *v5;
  void *v6;

  v4 = self;
  objc_sync_enter(v4);
  -[DSIDRecord idForClientType:](v4->_activeDSIDRecord, "idForClientType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_sync_exit(v4);
  return v6;
}

- (DSIDRecord)activeDSIDRecord
{
  return (DSIDRecord *)objc_getProperty(self, a2, 8, 1);
}

void __29__ADIDManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__instance_1;
  sharedInstance__instance_1 = (uint64_t)v0;

}

- (ADIDManager)init
{
  ADIDManager *v2;
  ADIDManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ADIDManager;
  v2 = -[ADIDManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ADIDManager loadIDs](v2, "loadIDs");
  return v3;
}

- (BOOL)loadIDs
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[ADCoreSettings sharedInstance](ADCoreSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iTunesAccountDSID");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v4 || !-[__CFString length](v4, "length"))
  {

    v4 = CFSTR("0");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Loading the record for DSID: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("iAdIDLogging"), v5, 0);

  -[ADIDManager reloadRecords:](self, "reloadRecords:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No record was found for the current user (%@). Forcing a reconciliation."), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdInternalLogging"), v7, 16);

    v8 = -[ADIDManager loadFakeRecord:](self, "loadFakeRecord:", v4);
    -[ADIDManager forceReconcile:](self, "forceReconcile:", &__block_literal_global_2);
  }

  return v6 != 0;
}

- (id)reloadRecords:(id)a3
{
  id v4;
  void *v5;
  ADIDManager *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA460E4]();
  v6 = self;
  objc_sync_enter(v6);
  -[ADIDManager getDSIDDicFromStorage](v6, "getDSIDDicFromStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "objectForKey:", CFSTR("kADiAdIDManager_AppUsageVector"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("kADiAdIDManager_AppUsageVector"));
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = objc_opt_class();
    objc_msgSend(v8, "AD_jsonString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("[%@]: Deprecated App Usage Vector detected. Rewriting the record as %@."), v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdIDLogging"), v13, 0);

    v14 = (void *)objc_msgSend(v8, "copy");
    -[ADIDManager setDSIDDicToStorage:](v6, "setDSIDDicToStorage:", v14);

  }
  v15 = (void *)objc_msgSend(v8, "copy");
  -[ADIDManager dsidRecord:fromDict:](v6, "dsidRecord:fromDict:", v4, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  -[ADIDManager setActiveDSIDRecord:](v6, "setActiveDSIDRecord:", v16);

  objc_autoreleasePoolPop(v5);
  -[ADIDManager activeDSIDRecord](v6, "activeDSIDRecord");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)setActiveDSIDRecord:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)logIDs:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  if (self->_activeDSIDRecord)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB3940];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v11);

    v7 = (void *)MEMORY[0x1E0CB3940];
    -[ADIDManager deviceIdentifiers](self, "deviceIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "AD_jsonString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %@"), v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdIDLogging"), v10, 0);

  }
}

- (id)dsidRecord:(id)a3 fromDict:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSArray *v12;
  NSArray *monthlyResetArray;
  void *v14;
  void *v15;
  DSIDRecord *v16;

  v6 = a3;
  if (a4)
  {
    v7 = a4;
    objc_msgSend(v7, "valueForKey:", CFSTR("iAdIDRecordsVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "compare:", v9);

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid version key %@"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog(CFSTR("ToroLogging"), v11, 16);

    }
    objc_msgSend(v7, "valueForKey:", CFSTR("kADiADIDMonthResetKey"));
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    monthlyResetArray = self->_monthlyResetArray;
    self->_monthlyResetArray = v12;

    objc_msgSend(v7, "valueForKey:", CFSTR("kADiAdIDManager_RecordsKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "valueForKey:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        v16 = -[DSIDRecord initWithDSID:serializedRecord:version:]([DSIDRecord alloc], "initWithDSID:serializedRecord:version:", v6, v15, 3);
      else
        v16 = 0;

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)forceReconcile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA460E4]();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ap.adprivacyd.idmanager"), 4096);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF9276D8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);

  objc_msgSend(v5, "resume");
  objc_msgSend(v5, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__ADIDManager_AdCore__forceReconcile___block_invoke;
  v10[3] = &unk_1E82B1D30;
  v8 = v3;
  v11 = v5;
  v12 = v8;
  v9 = v5;
  objc_msgSend(v7, "forceReconcile:", v10);

  objc_autoreleasePoolPop(v4);
}

uint64_t __38__ADIDManager_AdCore__forceReconcile___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __30__ADIDManager_AdCore__loadIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reconciliation should be done. Waiting for the 'kADIDManager_ChangedNotification' notification to reload the keychain. Error: %@"), a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("iAdInternalLogging"), v2, 0);

}

- (id)loadFakeRecord:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  ADIDManager *obj;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  _QWORD v54[6];
  _QWORD v55[6];
  const __CFString *v56;
  void *v57;
  id v58;
  void *v59;
  _QWORD v60[3];
  _QWORD v61[5];

  v61[3] = *MEMORY[0x1E0C80C00];
  v40 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Loading fake records for DSID %@"), v40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("iAdStateLogging"), v4, 0);

  v5 = objc_msgSend(CFSTR("BAAAAAAD"), "length");
  obj = self;
  objc_sync_enter(obj);
  v60[0] = CFSTR("iAdIDRecordsVersion");
  v60[1] = CFSTR("kADiADIDMonthResetKey");
  v61[0] = CFSTR("3");
  v61[1] = MEMORY[0x1E0C9AA60];
  v60[2] = CFSTR("kADiAdIDManager_RecordsKey");
  v58 = v40;
  v56 = CFSTR("kADDSIDRecord_iAdIDRecordsKey");
  v54[0] = CFSTR("0");
  v52 = CFSTR("kADiAdIDRecord_iAdIDKey");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "UUIDString");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringByReplacingCharactersInRange:withString:", 0, v5, CFSTR("BAAAAAAD"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v36;
  v54[1] = CFSTR("1");
  v50 = CFSTR("kADiAdIDRecord_iAdIDKey");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "UUIDString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringByReplacingCharactersInRange:withString:", 0, v5, CFSTR("BAAAAAAD"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v32;
  v54[2] = CFSTR("2");
  v48 = CFSTR("kADiAdIDRecord_iAdIDKey");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "UUIDString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringByReplacingCharactersInRange:withString:", 0, v5, CFSTR("BAAAAAAD"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v28;
  v54[3] = CFSTR("3");
  v46 = CFSTR("kADiAdIDRecord_iAdIDKey");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "UUIDString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringByReplacingCharactersInRange:withString:", 0, v5, CFSTR("BAAAAAAD"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v24;
  v54[4] = CFSTR("4");
  v44 = CFSTR("kADiAdIDRecord_iAdIDKey");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringByReplacingCharactersInRange:withString:", 0, v5, CFSTR("BAAAAAAD"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v6;
  v54[5] = CFSTR("6");
  v42 = CFSTR("kADiAdIDRecord_iAdIDKey");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingCharactersInRange:withString:", 0, v5, CFSTR("BAAAAAAD"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[ADIDManager dsidRecord:fromDict:](obj, "dsidRecord:fromDict:", v40, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADIDManager setActiveDSIDRecord:](obj, "setActiveDSIDRecord:", v15);

  objc_sync_exit(obj);
  v16 = (void *)MEMORY[0x1E0CB3940];
  -[ADIDManager activeDSIDRecord](obj, "activeDSIDRecord");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("Fake record has been loaded: %@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("iAdStateLogging"), v18, 0);

  -[ADIDManager activeDSIDRecord](obj, "activeDSIDRecord");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)encryptedIDForClientType:(int64_t)a3
{
  ADIDManager *v4;
  void *v5;
  void *v6;

  v4 = self;
  objc_sync_enter(v4);
  -[DSIDRecord encryptedIDForClientType:](v4->_activeDSIDRecord, "encryptedIDForClientType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_sync_exit(v4);
  return v6;
}

- (int64_t)PersonalizedAdsMonthResetCount
{
  ADIDManager *v2;
  int64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSArray count](v2->_monthlyResetArray, "count");
  objc_sync_exit(v2);

  return v3;
}

- (void)reloadRecords:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  +[ADServer workQueue](ADServer, "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__ADIDManager_reloadRecords_completionHandler___block_invoke;
  v11[3] = &unk_1E82B2170;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "addOperationWithBlock:", v11);

}

void __47__ADIDManager_reloadRecords_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "reloadRecords:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "copy");

  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (id)retrieveDeviceIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ADIDManager deviceIdentifiers](self, "deviceIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "AD_jsonStringWithPrettyPrint:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Device IDs:%@\n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("iAdIDLogging"), v6, 1);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.AdPlatforms"));
  if (objc_msgSend(v7, "BOOLForKey:", CFSTR("AutomationLoggingEnabled")))
    objc_msgSend(v3, "AD_jsonStringWithPrettyPrint:", 1);
  else
    objc_msgSend(v3, "descriptionInStringsFileFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)monthlyResetArray
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMonthlyResetArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthlyResetArray, 0);
  objc_storeStrong((id *)&self->_activeDSIDRecord, 0);
}

- (id)getDSIDDicFromStorage
{
  void *v2;
  unsigned int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v10;

  v10 = 0;
  GetKeychainPropertyListForKey(CFSTR("kADiAdIDStorageKey"), (OSStatus *)&v10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v10;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@]: Error %d reading keychain: %@"), v5, v10, CFSTR("kADiAdIDStorageKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdIDLogging"), v7, 16);
  }
  else
  {
    objc_msgSend(v2, "AD_jsonString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@]: Successfully read keychain: %@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdIDLogging"), v8, 0);

  }
  return v2;
}

- (BOOL)setDSIDDicToStorage:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "copy");
  v5 = SetKeychainPropertyListForKey(CFSTR("kADiAdIDStorageKey"), (uint64_t)v4);

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_opt_class();
  v8 = v7;
  if ((_DWORD)v5)
  {
    objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@]: Error %d storing keychain: %@"), v7, v5, CFSTR("kADiAdIDStorageKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdIDLogging"), v9, 16);
  }
  else
  {
    objc_msgSend(v3, "AD_jsonString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@]: Successfully stored disd to keychain: %@"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdIDLogging"), v10, 0);

  }
  return (_DWORD)v5 == 0;
}

- (BOOL)clearDSIDRecords
{
  uint64_t v2;
  void *v3;

  v2 = ADWriteDataToKeychain(CFSTR("kADiAdIDStorageKey"), 0);
  if ((_DWORD)v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error resetting records: %d"), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdInternalLogging"), v3, 16);

  }
  return (_DWORD)v2 == 0;
}

@end
