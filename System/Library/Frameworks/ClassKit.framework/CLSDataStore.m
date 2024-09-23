@implementation CLSDataStore

+ (Class)endpointClass
{
  return (Class)objc_opt_class();
}

- (void)setTestSharedDataStore:(id)a3
{
  objc_storeStrong((id *)&qword_1ED0FB718, a3);
}

+ (CLSDataStore)shared
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  if (CurrentProcessNameMatches(CFSTR("progressd")))
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v3 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D4054000, v3, OS_LOG_TYPE_FAULT, "ERROR: CLSDataStore is not available to progressd", buf, 2u);
    }
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D408D3EC;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB720 != -1)
    dispatch_once(&qword_1ED0FB720, block);
  return (CLSDataStore *)(id)qword_1ED0FB718;
}

+ (BOOL)isAvailable
{
  return ((uint64_t (*)(_QWORD, char *))MEMORY[0x1E0DE7D20])(MEMORY[0x1E0C8F2B8], sel_cls_hasEligibleAccount);
}

+ (id)newDatastore
{
  id v2;
  const char *v3;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithEndpoint_(v2, v3, 0);
}

+ (BOOL)isPDTool
{
  if (qword_1ED0FB728 != -1)
    dispatch_once(&qword_1ED0FB728, &unk_1E9749AB0);
  return byte_1ED0FB710;
}

- (BOOL)isDashboardAPIEnabled
{
  void *v2;
  const char *v3;
  uint64_t v4;

  v2 = (void *)objc_opt_class();
  return objc_msgSend_isDashboardApp(v2, v3, v4);
}

- (BOOL)isSearchAPIEnabled
{
  void *v2;
  const char *v3;
  uint64_t v4;

  v2 = (void *)objc_opt_class();
  return objc_msgSend_isSearchAPIEnabled(v2, v3, v4);
}

- (BOOL)isPrivateSearchAPIEnabled
{
  void *v2;
  const char *v3;
  uint64_t v4;

  v2 = (void *)objc_opt_class();
  return objc_msgSend_isPrivateSearchAPIEnabled(v2, v3, v4);
}

- (BOOL)isAllowedToInsertObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  int v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  int v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;

  v4 = a3;
  CLSDashboardClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v8 = objc_msgSend_containsObject_(v5, v7, v6);

  CLSSearchClasses();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();

  v12 = objc_msgSend_containsObject_(v9, v11, v10);
  return (objc_msgSend_isDashboardAPIEnabled(self, v13, v14) & 1) != 0
      || !v8
      || (objc_msgSend_isSearchAPIEnabled(self, v15, v16) & 1) != 0
      || v12 != 1;
}

- (CLSDataStore)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v8, (uint64_t)CFSTR("The method -[%@ %@] is not available."), v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v3, v10, v4, v9, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (CLSDataStore)initWithEndpoint:(id)a3
{
  id v4;
  CLSDataStore *v5;
  CLSDataStore *v6;
  uint64_t v7;
  NSMutableDictionary *deletedObjectsByID;
  uint64_t v9;
  NSMutableDictionary *objectGenerationsByID;
  uint64_t v11;
  CLSGraph *graph;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSDate *lastPruneDate;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  NSMutableSet *dataObservers;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  CLSEndpointConnection *endpointConnection;
  uint64_t v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSMutableArray *pendingSaves;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  NSString *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  NSString *appBundleIdentifier;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  NSString *appName;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  NSString *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  NSString *v77;
  _QWORD v79[4];
  id v80;
  _QWORD v81[4];
  id v82;
  id location;
  objc_super v84;

  v4 = a3;
  v84.receiver = self;
  v84.super_class = (Class)CLSDataStore;
  v5 = -[CLSDataStore init](&v84, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock = 0;
    v7 = objc_opt_new();
    deletedObjectsByID = v6->_deletedObjectsByID;
    v6->_deletedObjectsByID = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    objectGenerationsByID = v6->_objectGenerationsByID;
    v6->_objectGenerationsByID = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    graph = v6->_graph;
    v6->_graph = (CLSGraph *)v11;

    objc_msgSend_date(MEMORY[0x1E0C99D68], v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    lastPruneDate = v6->_lastPruneDate;
    v6->_lastPruneDate = (NSDate *)v15;

    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v19, v20, (uint64_t)v6, sel_applicationWillResignActive_, CFSTR("UIApplicationWillResignActiveNotification"), 0);
    objc_msgSend_addObserver_selector_name_object_(v19, v21, (uint64_t)v6, sel_applicationDidBecomeActive_, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);
    objc_msgSend_addObserver_selector_name_object_(v19, v22, (uint64_t)v6, sel_developerModeChanged_, CFSTR("CLSDeveloperModeDidChangeNotification"), 0);
    objc_msgSend_addObserver_selector_name_object_(v19, v23, (uint64_t)v6, sel_reset, CFSTR("CLSSignificantBackingStoreChangeNotification"), 0);
    v24 = objc_opt_new();
    dataObservers = v6->_dataObservers;
    v6->_dataObservers = (NSMutableSet *)v24;

    v26 = (void *)objc_opt_class();
    v29 = (void *)objc_msgSend_endpointClass(v26, v27, v28);
    objc_msgSend_instanceForEndpoint_(v29, v30, (uint64_t)v4);
    v31 = objc_claimAutoreleasedReturnValue();
    endpointConnection = v6->_endpointConnection;
    v6->_endpointConnection = (CLSEndpointConnection *)v31;

    objc_initWeak(&location, v6);
    v33 = MEMORY[0x1E0C809B0];
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = sub_1D408DB18;
    v81[3] = &unk_1E974AA98;
    objc_copyWeak(&v82, &location);
    objc_msgSend_setOnInterupt_(v6->_endpointConnection, v34, (uint64_t)v81);
    v79[0] = v33;
    v79[1] = 3221225472;
    v79[2] = sub_1D408DB48;
    v79[3] = &unk_1E974AA98;
    objc_copyWeak(&v80, &location);
    objc_msgSend_setOnConnect_(v6->_endpointConnection, v35, (uint64_t)v79);
    if (objc_msgSend_isDashboardAPIEnabled(v6, v36, v37))
      objc_msgSend__registerForAccountChangedDarwinNotification(v6, v38, v39);
    v40 = objc_opt_new();
    pendingSaves = v6->_pendingSaves;
    v6->_pendingSaves = (NSMutableArray *)v40;

    v42 = (void *)MEMORY[0x1D82573E4]();
    objc_msgSend_bundleRecordForCurrentProcess(MEMORY[0x1E0CA5898], v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v48 = v45;
      objc_msgSend_containingBundleRecord(v48, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bundleIdentifier(v51, v52, v53);
      v54 = objc_claimAutoreleasedReturnValue();
      appBundleIdentifier = v6->_appBundleIdentifier;
      v6->_appBundleIdentifier = (NSString *)v54;

      objc_msgSend_localizedName(v51, v56, v57);
      v58 = objc_claimAutoreleasedReturnValue();
      appName = v6->_appName;
      v6->_appName = (NSString *)v58;

      if (!objc_msgSend_length(v6->_appName, v60, v61))
        objc_storeStrong((id *)&v6->_appName, v6->_appBundleIdentifier);

    }
    else
    {
      objc_msgSend_bundleIdentifier(v45, v46, v47);
      v62 = objc_claimAutoreleasedReturnValue();
      v63 = v6->_appBundleIdentifier;
      v6->_appBundleIdentifier = (NSString *)v62;

      objc_msgSend_localizedName(v45, v64, v65);
      v66 = objc_claimAutoreleasedReturnValue();
      v48 = v6->_appName;
      v6->_appName = (NSString *)v66;
    }

    objc_autoreleasePoolPop(v42);
    if (!objc_msgSend_length(v6->_appBundleIdentifier, v67, v68))
    {
      objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUIDString(v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingString_(CFSTR("com.apple."), v75, (uint64_t)v74);
      v76 = objc_claimAutoreleasedReturnValue();
      v77 = v6->_appBundleIdentifier;
      v6->_appBundleIdentifier = (NSString *)v76;

    }
    if (!objc_msgSend_length(v6->_appName, v69, v70))
      objc_storeStrong((id *)&v6->_appName, v6->_appBundleIdentifier);
    objc_destroyWeak(&v80);
    objc_destroyWeak(&v82);
    objc_destroyWeak(&location);

  }
  return v6;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  objc_super v10;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v4, v5, (uint64_t)self);

  objc_msgSend_defaultCenter(CLSDarwinNotificationCenter, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_notificationName_(v8, v9, (uint64_t)self, CFSTR("com.apple.progressd.accountChanged"));

  v10.receiver = self;
  v10.super_class = (Class)CLSDataStore;
  -[CLSDataStore dealloc](&v10, sel_dealloc);
}

- (void)lock
{
  os_unfair_recursive_lock_lock_with_options();
}

- (void)unlock
{
  os_unfair_recursive_lock_unlock();
}

+ (BOOL)isDashboardApp
{
  if (qword_1ED0FB730 != -1)
    dispatch_once(&qword_1ED0FB730, &unk_1E974AAB8);
  return byte_1ED0FB711;
}

+ (BOOL)isPrivateSearchAPIEnabled
{
  if (qword_1ED0FB738 != -1)
    dispatch_once(&qword_1ED0FB738, &unk_1E974AAD8);
  return byte_1ED0FB712;
}

+ (BOOL)isSearchAPIEnabled
{
  if (qword_1ED0FB740 != -1)
    dispatch_once(&qword_1ED0FB740, &unk_1E974AAF8);
  return byte_1ED0FB713;
}

- (void)_connectionConnected
{
  ((void (*)(CLSDataStore *, char *))MEMORY[0x1E0DE7D20])(self, sel__reenableObservers);
}

- (void)_registerForAccountChangedDarwinNotification
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend_defaultCenter(CLSDarwinNotificationCenter, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D408E040;
  v7[3] = &unk_1E974AB60;
  objc_copyWeak(&v8, &location);
  objc_msgSend_addObserver_notificationName_block_(v5, v6, (uint64_t)self, CFSTR("com.apple.progressd.accountChanged"), v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_reenableObservers
{
  uint64_t v2;
  NSMutableSet *v4;
  NSMutableSet *v5;
  NSMutableSet *dataObservers;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  const char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend_lock(self, a2, v2);
  v4 = self->_dataObservers;
  v5 = (NSMutableSet *)objc_opt_new();
  dataObservers = self->_dataObservers;
  self->_dataObservers = v5;

  objc_msgSend_unlock(self, v7, v8);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend_objectEnumerator(v4, v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v21, v25, 16);
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v11);
        v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend_isInvalidated(v19, v14, v15) & 1) == 0)
        {
          objc_msgSend_setDataStore_(v19, v14, 0);
          objc_msgSend_registerDataObserver_(self, v20, (uint64_t)v19);
        }
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v21, v25, 16);
    }
    while (v16);
  }

}

- (void)_reconnect
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;

  objc_msgSend_connect(self->_endpointConnection, a2, v2);
  objc_msgSend_refreshMainAppContext(self, v4, v5);
  v6 = (void *)objc_opt_class();
  if (objc_msgSend_isDashboardApp(v6, v7, v8))
    objc_msgSend_currentUserWithCompletion_(self, v9, (uint64_t)&unk_1E974AB80);
}

- (CLSCurrentUser)cachedCurrentUser
{
  uint64_t v2;
  CLSCurrentUser *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_cachedCurrentUser;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setCachedCurrentUser:(id)a3
{
  CLSCurrentUser *v4;
  const char *v5;
  uint64_t v6;
  CLSCurrentUser *cachedCurrentUser;
  const char *v8;
  uint64_t v9;

  v4 = (CLSCurrentUser *)a3;
  objc_msgSend_lock(self, v5, v6);
  cachedCurrentUser = self->_cachedCurrentUser;
  self->_cachedCurrentUser = v4;

  objc_msgSend_unlock(self, v8, v9);
}

- (void)executeQuery:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_executeQuery_issueServerRequest_, a3);
}

- (void)executeQuery:(id)a3 issueServerRequest:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  _QWORD v11[4];
  id v12;

  v4 = a4;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D408E670;
  v11[3] = &unk_1E974ABA8;
  v12 = v6;
  v7 = v6;
  objc_msgSend_dataServer_(self, v8, (uint64_t)v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataServer_executeQuery_issueServerRequest_(self, v10, (uint64_t)v9, v7, v4);

}

- (void)dataServer:(id)a3 executeQuery:(id)a4 issueServerRequest:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  int v26;
  id v27;
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend_isExecuting(v9, v10, v11))
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v13 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      v26 = 138412290;
      v27 = v9;
      _os_log_error_impl(&dword_1D4054000, v13, OS_LOG_TYPE_ERROR, "ERROR: trying to execute query that is already being executed: %@", (uint8_t *)&v26, 0xCu);
    }
  }
  else
  {
    objc_msgSend_setExecuting_(v9, v12, 1);
    objc_msgSend_setDataStore_(v9, v14, (uint64_t)self);
    objc_msgSend_date(MEMORY[0x1E0C99D68], v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStartDate_(v9, v18, (uint64_t)v17);

    objc_msgSend_querySpec(v9, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_searchSpec(v9, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remote_executeQuery_querySpecification_searchSpecification_issueServerRequest_completion_(v8, v25, (uint64_t)v9, v21, v24, v5, &unk_1E974ABC8);

  }
}

- (void)awaitExecuteQuery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_block_t v8;
  uint64_t v9;
  id v10;
  id v11;
  const char *v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  dispatch_time_t v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &unk_1E974ABE8);
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1D408E998;
  v20[3] = &unk_1E974AC10;
  v21 = v7;
  v22 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend_setCompletion_(v6, v12, (uint64_t)v20);
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = sub_1D408E9C8;
  v18[3] = &unk_1E974ABA8;
  v19 = v6;
  v13 = v6;
  objc_msgSend_syncDataServer_(self, v14, (uint64_t)v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataServer_executeQuery_issueServerRequest_(self, v16, (uint64_t)v15, v13, 1);
  v17 = dispatch_time(0, 60000000000);
  dispatch_block_wait(v10, v17);

}

- (void)fetchCollectionsWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D408EAA8;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_dataServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_fetchCollectionsWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)fetchCollectionItemsWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D408EB48;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_dataServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_fetchCollectionItemsWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)deleteArchivedCollectionObjects:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D408EC04;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  objc_msgSend_dataServer_(self, v9, (uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_deleteCollectionRelatedObjectsWithCompletion_completion_(v10, v11, (uint64_t)v8, v7);

}

- (id)cachedMainAppContext
{
  uint64_t v2;
  CLSContext *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_mainAppContext;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (CLSContext)mainAppContext
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  objc_msgSend_cachedMainAppContext(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend__createMainAppContext(self, v5, v6);
    objc_msgSend_cachedMainAppContext(self, v7, v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v4;

  return (CLSContext *)v9;
}

- (void)_createMainAppContext
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  CLSContext *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  int isClassKitEnabled;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  CLSContext *v19;
  CLSContext *mainAppContext;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_lock(self, a2, v2);
  objc_msgSend_appIdentifier(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_appName;
  v8 = [CLSContext alloc];
  v10 = (void *)objc_msgSend_initWithInternalType_identifier_title_(v8, v9, 1, v6, v7);
  objc_msgSend_setTemporary_(v10, v11, 0);
  isClassKitEnabled = objc_msgSend_isClassKitEnabled(CLSEndpointConnection, v12, v13);
  v25[0] = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v25, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIdentifierPathAndGenerateObjectID_(v10, v17, (uint64_t)v16);

  objc_msgSend_addObject_(self, v18, (uint64_t)v10);
  v19 = (CLSContext *)objc_claimAutoreleasedReturnValue();
  mainAppContext = self->_mainAppContext;
  self->_mainAppContext = v19;

  objc_msgSend_unlock(self, v21, v22);
  if (isClassKitEnabled)
    objc_msgSend__refreshMainAppContext(self, v23, v24);

}

- (void)refreshMainAppContext
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;

  objc_msgSend_lock(self, a2, v2);
  if (self->_mainAppContext)
    objc_msgSend__refreshMainAppContext(self, v4, v5);
  objc_msgSend_unlock(self, v4, v5);
}

- (void)faultMainAppContext
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  CLSFaultProcessor *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  _QWORD v22[5];

  objc_msgSend_lock(self, a2, v2);
  if (self->_mainAppContext
    || (v6 = (void *)objc_opt_class(), !objc_msgSend_isDashboardApp(v6, v7, v8))
    || (v9 = (void *)objc_opt_class(), (objc_msgSend_isPDTool(v9, v10, v11) & 1) != 0))
  {
    objc_msgSend_unlock(self, v4, v5);
    v12 = [CLSFaultProcessor alloc];
    v14 = (void *)objc_msgSend_initWithDelegate_(v12, v13, (uint64_t)self);
    objc_msgSend_mainAppContext(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_faultObject_(v14, v18, (uint64_t)v17);

    if (v14)
    {
      objc_msgSend_waitUntilDone_(v14, v19, v20, 60.0);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = sub_1D408EEFC;
      v22[3] = &unk_1E974A630;
      v22[4] = self;
      objc_msgSend_enumerate_(v14, v21, (uint64_t)v22);

    }
  }
  else
  {
    objc_msgSend_unlock(self, v4, v5);
  }
}

- (void)_refreshMainAppContext
{
  uint64_t v2;
  CLSContext *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  CLSContext *v12;
  const char *v13;
  _QWORD v14[4];
  CLSContext *v15;
  id v16;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_mainAppContext;
  objc_msgSend_unlock(self, v5, v6);
  objc_msgSend_endpointConnection(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataServer_(v9, v10, (uint64_t)&unk_1E974AC30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1D408F000;
  v14[3] = &unk_1E974AC58;
  v15 = v4;
  v16 = &unk_1E974AC30;
  v12 = v4;
  objc_msgSend_remote_mainAppContextWithCompletion_(v11, v13, (uint64_t)v14);

}

- (id)appIdentifier
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSString *v10;

  objc_msgSend_endpointConnection(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_overrideBundleIdentifier(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_length(v7, v8, v9))
  {
    v10 = self->_appBundleIdentifier;

    v7 = v10;
  }
  return v7;
}

- (id)allContexts
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1D408F1F4;
  v20 = sub_1D408F204;
  v21 = 0;
  objc_msgSend_appIdentifier(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  objc_msgSend_predicateWithFormat_(MEMORY[0x1E0CB3880], v6, (uint64_t)CFSTR("appIdentifier = %@"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend_queryWithObjectType_predicate_error_(CLSQuery, v8, v5, v7, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;

  if (v9)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1D408F20C;
    v14[3] = &unk_1E974AC80;
    v14[4] = &v16;
    objc_msgSend_awaitExecuteQuery_completion_(self, v11, (uint64_t)v9, v14);
  }
  v12 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v12;
}

- (void)contextsMatchingIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  const char *v17;
  const char *v18;
  void *v19;
  id v20;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (objc_msgSend_length(v6, v8, v9))
  {
    v11 = objc_opt_class();
    objc_msgSend_predicateForObjectsWithIdentifier_(CLSQuery, v12, (uint64_t)v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend_queryWithObjectType_predicate_error_(CLSQuery, v14, v11, v13, &v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v20;

    if (v15)
    {
      objc_msgSend_setCompletion_(v15, v17, (uint64_t)v7);
      objc_msgSend_executeQuery_(self, v18, (uint64_t)v15);
    }
    else
    {
      v7[2](v7, 0, v16);
    }

  }
  else
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v10, 2, CFSTR("No identifier specified."));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v19);

  }
}

- (void)contextsMatchingPredicate:(NSPredicate *)predicate completion:(void *)completion
{
  void *v6;
  NSPredicate *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  id v12;
  const char *v13;
  id v14;

  v6 = completion;
  v7 = predicate;
  v8 = objc_opt_class();
  v14 = 0;
  objc_msgSend_queryWithObjectType_predicate_error_(CLSQuery, v9, v8, v7, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (v10)
  {
    objc_msgSend_setCompletion_(v10, v11, (uint64_t)v6);

    objc_msgSend_executeQuery_(self, v13, (uint64_t)v10);
  }
  else
  {
    (*((void (**)(void *, _QWORD, id))v6 + 2))(v6, 0, v12);

  }
}

- (id)syncFetchContextsForContextIDs:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  id v7;
  const char *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1D408F1F4;
  v18 = sub_1D408F204;
  v19 = 0;
  objc_msgSend_syncDataServer_(self, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D408F52C;
  v11[3] = &unk_1E974ACA8;
  v7 = v4;
  v12 = v7;
  v13 = &v14;
  objc_msgSend_remote_fetchContextsForContextIDs_completion_(v6, v8, (uint64_t)v7, v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)syncFetchThumbnailBlobForContext:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1D408F1F4;
  v18 = sub_1D408F204;
  v19 = 0;
  objc_msgSend_syncDataServer_(self, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectID(v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1D408F754;
  v13[3] = &unk_1E974ACD0;
  v13[4] = &v14;
  objc_msgSend_remote_fetchThumbnailBlobForContextID_completion_(v6, v10, (uint64_t)v9, v13);

  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (void)syncDeleteThumbnailBlobForContext:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  objc_msgSend_syncDataServer_(self, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectID(v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D408F818;
  v12[3] = &unk_1E974ACF8;
  v13 = v4;
  v10 = v4;
  objc_msgSend_remote_deleteThumbnailBlobForContextID_completion_(v6, v11, (uint64_t)v9, v12);

}

- (id)syncFetchProgressReportingCapabilitiesForContextID:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1D408F1F4;
  v15 = sub_1D408F204;
  v16 = 0;
  objc_msgSend_syncDataServer_(self, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1D408FA28;
  v10[3] = &unk_1E974AC80;
  v10[4] = &v11;
  objc_msgSend_remote_fetchProgressReportingCapabilitiesForContextID_completion_(v6, v7, (uint64_t)v4, v10);
  v8 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v8;
}

- (void)syncDeleteProgressReportingCapabilitiesForContextID:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend_syncDataServer_(self, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D408FAD0;
  v9[3] = &unk_1E974ACF8;
  v10 = v4;
  v7 = v4;
  objc_msgSend_remote_deleteProgressReportingCapabilitiesForContextID_completion_(v6, v8, (uint64_t)v7, v9);

}

- (unint64_t)serverSyncStatus
{
  void *v2;
  const char *v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend_syncDataServer_(self, a2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1D408FC7C;
  v6[3] = &unk_1E9749FF0;
  v6[4] = &v7;
  objc_msgSend_remote_getServerSyncStatusWithCompletion_(v2, v3, (uint64_t)v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)serverInternalState:(unint64_t)a3 error:(id *)a4
{
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  id v11;
  _QWORD v13[7];
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

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1D408F1F4;
  v24 = sub_1D408F204;
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (a3)
  {
    objc_msgSend_syncDataServer_(self, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = sub_1D408F1F4;
    v18 = sub_1D408F204;
    v19 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1D408FF18;
    v13[3] = &unk_1E974AD20;
    v13[4] = &v14;
    v13[5] = &v20;
    v13[6] = a3;
    objc_msgSend_remote_getServerInternalStateInfoWithCompletion_(v8, v9, (uint64_t)v13);
    if (v15[5])
    {
      objc_msgSend_cls_assignError_fromError_(MEMORY[0x1E0CB35C8], v10, (uint64_t)a4);
      v11 = 0;
    }
    else
    {
      v11 = (id)v21[5];
    }
    _Block_object_dispose(&v14, 8);

  }
  else
  {
    objc_msgSend_cls_assignError_code_format_(MEMORY[0x1E0CB35C8], v7, (uint64_t)a4, 2, CFSTR("options cannot equal CLSServerInternalStateInfoNone"));
    v11 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v11;
}

- (void)completeAllAssignedActivitiesMatching:(NSArray *)contextPath
{
  NSArray *v4;
  const char *v5;
  uint64_t v6;
  NSArray *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSArray *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  id v37;
  const char *v38;
  const char *v39;
  const char *v40;
  _QWORD v41[4];
  id v42;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = contextPath;
  v7 = v4;
  if (v4 && objc_msgSend_count(v4, v5, v6))
  {
    if ((objc_msgSend_isAppClient(self, v8, v9) & 1) != 0
      || (v12 = (void *)objc_opt_class(), (objc_msgSend_isPDTool(v12, v13, v14) & 1) != 0))
    {
      objc_msgSend_lock(self, v10, v11);
      self->_saveInProgress = 1;
      objc_msgSend_unlock(self, v15, v16);
      objc_initWeak(location, self);
      v17 = v7;
      objc_msgSend_mainAppContext(self, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend_firstObject(v17, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqualToString_(v26, v27, (uint64_t)v23) & 1) != 0)
        {
          v28 = v17;
        }
        else
        {
          v37 = objc_alloc(MEMORY[0x1E0C99DE8]);
          v28 = (void *)objc_msgSend_initWithArray_(v37, v38, (uint64_t)v17);
          objc_msgSend_insertObject_atIndex_(v28, v39, (uint64_t)v23, 0);

        }
      }
      else
      {
        v28 = v17;
      }
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = sub_1D40904A8;
      v41[3] = &unk_1E974AD68;
      objc_copyWeak(&v42, location);
      objc_msgSend_fetchAndCompleteAllAssignedActivitiesForContextPath_withCompletion_(self, v40, (uint64_t)v28, v41);
      objc_destroyWeak(&v42);

      objc_destroyWeak(location);
    }
    else
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v30 = (void *)CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
      {
        v31 = v30;
        v32 = (void *)objc_opt_class();
        LODWORD(location[0]) = 67109376;
        HIDWORD(location[0]) = objc_msgSend_isPDTool(v32, v33, v34);
        LOWORD(location[1]) = 1024;
        *(_DWORD *)((char *)&location[1] + 2) = objc_msgSend_isAppClient(self, v35, v36);
        _os_log_debug_impl(&dword_1D4054000, v31, OS_LOG_TYPE_DEBUG, "CLSDataStore completeAllAssignedActivitiesMatching isPDTool: %d, is an app or app extension client: %d", (uint8_t *)location, 0xEu);

      }
    }
  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v29 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v7;
      _os_log_debug_impl(&dword_1D4054000, v29, OS_LOG_TYPE_DEBUG, "CLSDataStore completeAllAssignedActivitiesMatching must provide a contextPath: %@", (uint8_t *)location, 0xCu);
    }
  }

}

- (void)fetchAndCompleteAllAssignedActivitiesForContextPath:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v8 = CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_1D4054000, v8, OS_LOG_TYPE_DEFAULT, "CLSDataStore fetchAllAssignedActivitiesForContextPath called for contextpath: %@", buf, 0xCu);
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1D4090790;
  v13[3] = &unk_1E9749F88;
  v14 = v7;
  v9 = v7;
  objc_msgSend_dataServer_(self, v10, (uint64_t)v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_fetchAndCompleteActiveAssignedActivitiesForContextPath_withCompletion_(v11, v12, (uint64_t)v6, v9);

}

- (void)fetchActivityForURL:(NSURL *)url completion:(void *)completion
{
  NSURL *v6;
  const char *v7;
  uint64_t v8;
  void (**v9)(void *, _QWORD, void *);
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  _QWORD v20[5];
  void (**v21)(void *, _QWORD, void *);
  uint8_t buf[4];
  int isAppClient;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = url;
  v9 = completion;
  if (!v6)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v7, 2, CFSTR("URL not valid."));
LABEL_11:
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v16);

    goto LABEL_12;
  }
  if ((objc_msgSend_isAppClient(self, v7, v8) & 1) == 0)
  {
    v10 = (void *)objc_opt_class();
    if ((objc_msgSend_isPDTool(v10, v11, v12) & 1) == 0)
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v14 = (void *)CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
      {
        v17 = v14;
        *(_DWORD *)buf = 67109120;
        isAppClient = objc_msgSend_isAppClient(self, v18, v19);
        _os_log_debug_impl(&dword_1D4054000, v17, OS_LOG_TYPE_DEBUG, "CLSDataStore fetchAssignedItemFor: is not an app or app extension client: %d", buf, 8u);

      }
      objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v15, 4, CFSTR("Not Authorized"));
      goto LABEL_11;
    }
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1D4090968;
  v20[3] = &unk_1E974ADB8;
  v20[4] = self;
  v21 = v9;
  objc_msgSend__fetchHandoutAttachmentForDocumentURL_completion_(self, v13, (uint64_t)v6, v20);

LABEL_12:
}

- (void)_fetchHandoutAttachmentForDocumentURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v8 = CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v6;
    _os_log_debug_impl(&dword_1D4054000, v8, OS_LOG_TYPE_DEBUG, "CLSDataStore _fetchHandoutAttachmentForDocumentURL called for url: %@", (uint8_t *)location, 0xCu);
  }
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1D4090DAC;
  v18[3] = &unk_1E9749F88;
  v10 = v7;
  v19 = v10;
  objc_msgSend_dataServer_(self, v11, (uint64_t)v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = sub_1D4090DC0;
  v15[3] = &unk_1E974AE30;
  v13 = v10;
  v16 = v13;
  objc_copyWeak(&v17, location);
  objc_msgSend_remote_fetchHandoutAttachmentForDocumentURL_withCompletion_(v12, v14, (uint64_t)v6, v15);
  objc_destroyWeak(&v17);

  objc_destroyWeak(location);
}

- (void)saveWithCompletion:(void *)completion
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id location;
  _QWORD v16[4];
  id v17;

  v4 = completion;
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1D4091364;
  v16[3] = &unk_1E9749F88;
  v6 = v4;
  v17 = v6;
  v7 = (void *)MEMORY[0x1D82575D0](v16);
  objc_initWeak(&location, self);
  clsNotificationQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = sub_1D4091420;
  block[3] = &unk_1E974AE58;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_save
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id location;

  objc_msgSend_lock(self, a2, v2);
  if (self->_saveInProgress || !objc_msgSend_count(self->_pendingSaves, v4, v5))
  {
    objc_msgSend_unlock(self, v4, v5);
  }
  else
  {
    self->_saveInProgress = 1;
    objc_msgSend_firstObject(self->_pendingSaves, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectAtIndex_(self->_pendingSaves, v7, 0);
    objc_initWeak(&location, self);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = sub_1D409170C;
    v31[3] = &unk_1E974AE80;
    v8 = v6;
    v32 = v8;
    objc_copyWeak(&v33, &location);
    v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D82575D0](v31);
    objc_msgSend__modifiedObjects(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__validateObjects_(self, v13, (uint64_t)v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend_unlock(self, v14, v15);
      ((void (**)(_QWORD, void *))v9)[2](v9, v16);
    }
    else
    {
      objc_msgSend_objectEnumerator(self->_deletedObjectsByID, v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allObjects(v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_addObjectsFromArray_(v12, v21, (uint64_t)v20);
      objc_msgSend__filterObjectsBeingSavedFromObjects_(self, v22, (uint64_t)v12);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend__arrangeObjectsIfNeeded_(self, v24, (uint64_t)v23);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_count(v12, v25, v26))
      {
        objc_msgSend_saveObjects_completion_(self, v27, (uint64_t)v12, v9);
        objc_msgSend_unlock(self, v29, v30);
      }
      else
      {
        objc_msgSend_unlock(self, v27, v28);
        v9[2](v9, 0);
      }

    }
    objc_destroyWeak(&v33);

    objc_destroyWeak(&location);
  }
}

- (CLSAuthTree)authTree
{
  uint64_t v2;
  CLSAuthTree *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_authTree;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (CLSAuthTree)handoutAssignedItemsAuthTree
{
  uint64_t v2;
  CLSAuthTree *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_handoutAssignedItemsAuthTree;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)refreshAuthTreeWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend_dataServer_(self, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D409193C;
  v9[3] = &unk_1E974AEA8;
  v7 = v4;
  v10 = v7;
  objc_copyWeak(&v11, &location);
  objc_msgSend_remote_authTreeWithCompletion_(v6, v8, (uint64_t)v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)refreshAuthTreeForAttachment:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend_dataServer_(self, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D4091B20;
  v12[3] = &unk_1E974AEA8;
  v10 = v7;
  v13 = v10;
  objc_copyWeak(&v14, &location);
  objc_msgSend_remote_authTreeForAttachment_withCompletion_(v9, v11, (uint64_t)v6, v12);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

- (void)saveObjects:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D4091CF4;
  v11[3] = &unk_1E974AED0;
  v8 = v7;
  v13 = v8;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  objc_msgSend_refreshAuthTreeWithCompletion_(self, v10, (uint64_t)v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_saveObjects:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  NSMutableDictionary *v16;
  id v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void (**v40)(_QWORD, _QWORD);
  const char *v41;
  void *v42;
  id v43;
  CLSDataStore *val;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  _QWORD *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _QWORD v61[5];
  id v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  val = self;
  v42 = v6;
  objc_msgSend__filterObjectsBeingSavedFromObjects_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3042000000;
  v61[3] = sub_1D40922FC;
  v61[4] = sub_1D4092308;
  objc_initWeak(&v62, self);
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = sub_1D408F1F4;
  v59 = sub_1D408F204;
  v60 = (id)objc_opt_new();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = sub_1D4092310;
  v49[3] = &unk_1E974AEF8;
  v53 = v61;
  v43 = v7;
  v52 = v43;
  v54 = &v55;
  v11 = v10;
  v50 = v11;
  v12 = v8;
  v51 = v12;
  objc_msgSend_setCompletion_((void *)v56[5], v13, (uint64_t)v49);
  objc_msgSend_lock(self, v14, v15);
  v16 = self->_objectGenerationsByID;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v17 = v11;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v45, v63, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v46 != v22)
          objc_enumerationMutation(v17);
        v24 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend_objectID(v24, v19, v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x1E0CB37E8];
        v29 = objc_msgSend_generation(v24, v27, v28);
        objc_msgSend_numberWithUnsignedInt_(v26, v30, v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v16, v32, (uint64_t)v31, v25);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v33, (uint64_t)v31, v25);

      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v45, v63, 16);
    }
    while (v21);
  }

  objc_msgSend_unlock(val, v34, v35);
  if (objc_msgSend_count(v17, v36, v37))
  {
    objc_msgSend_dataServer_(val, v38, (uint64_t)v43);
    v40 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_remote_saveObjects_saveResponse_completion_(v40, v41, (uint64_t)v17, v56[5], &unk_1E974AF18);
  }
  else
  {
    objc_msgSend_completion((void *)v56[5], v38, v39);
    v40 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v40[2](v40, 0);
  }

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(v61, 8);
  objc_destroyWeak(&v62);

}

- (id)_filterObjectsBeingSavedFromObjects:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSMutableDictionary *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  int v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  CLSDataStore *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  v30 = self;
  v7 = self->_objectGenerationsByID;
  v31 = (id)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = v4;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v32, v38, 16);
  if (v10)
  {
    v13 = v10;
    v14 = *(_QWORD *)v33;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v15);
        objc_msgSend_objectID(v16, v11, v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v7, v18, (uint64_t)v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend_generation(v16, v20, v21);
        if (!v19 || objc_msgSend_integerValue(v19, v23, v24) != v22)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (qword_1ED0FB9A0 != -1)
                dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
              v25 = CLSLogDefault;
              if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v37 = v16;
                _os_log_debug_impl(&dword_1D4054000, v25, OS_LOG_TYPE_DEBUG, "_filterObjectsBeingSavedFromObjects Adding %@.", buf, 0xCu);
              }
              objc_msgSend_addObject_(v31, v26, (uint64_t)v16);
            }
          }
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v32, v38, 16);
    }
    while (v13);
  }

  objc_msgSend_unlock(v30, v27, v28);
  return v31;
}

- (id)_arrangeObjectsIfNeeded:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  v7 = (void *)objc_opt_new();
  v31 = v4;
  objc_msgSend__cls_filter_(v4, v8, (uint64_t)&unk_1E974AF58);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v37, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v38;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v13);
        if (qword_1ED0FB9A0 != -1)
          dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
        v15 = CLSLogDefault;
        if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v14;
          _os_log_debug_impl(&dword_1D4054000, v15, OS_LOG_TYPE_DEBUG, "_arrangeObjectsIfNeeded Adding %@.", buf, 0xCu);
        }
        objc_msgSend_addObject_(v7, v16, v14);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v37, v44, 16);
    }
    while (v11);
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = v31;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v33, v41, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v18);
        v24 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v23);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (qword_1ED0FB9A0 != -1)
                dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
              v26 = CLSLogDefault;
              if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v43 = v24;
                _os_log_debug_impl(&dword_1D4054000, v26, OS_LOG_TYPE_DEBUG, "_arrangeObjectsIfNeeded Adding %@.", buf, 0xCu);
              }
              objc_msgSend_addObject_(v7, v27, v24);
            }
          }
        }
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v25, (uint64_t)&v33, v41, 16);
    }
    while (v21);
  }

  objc_msgSend_unlock(self, v28, v29);
  return v7;
}

- (id)_modifiedObjects
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;

  objc_msgSend_lock(self, a2, v2);
  v4 = (void *)objc_opt_new();
  objc_msgSend_graph(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1D4092EEC;
  v13[3] = &unk_1E974AFC0;
  v8 = v4;
  v14 = v8;
  objc_msgSend_traverseVerticesPassingTest_enumerationBlock_(v7, v9, (uint64_t)&unk_1E974AF98, v13);

  objc_msgSend_unlock(self, v10, v11);
  return v8;
}

- (id)_validateObjects:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  int v22;
  id v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  objc_msgSend_appIdentifier(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = v4;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v32, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v33;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x1D82573E4]();
        objc_msgSend_setAppIdentifier_(v16, v18, (uint64_t)v9);
        objc_msgSend_willSaveObject(v16, v19, v20);
        v31 = 0;
        v22 = objc_msgSend_validateObject_(v16, v21, (uint64_t)&v31);
        v23 = v31;
        v26 = v23;
        if (!v22)
        {
          objc_msgSend_unlock(self, v24, v25);
          objc_autoreleasePoolPop(v17);

          goto LABEL_11;
        }

        objc_autoreleasePoolPop(v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v27, (uint64_t)&v32, v36, 16);
      if (v13)
        continue;
      break;
    }
  }

  objc_msgSend_unlock(self, v28, v29);
  v26 = 0;
LABEL_11:

  return v26;
}

- (id)objectWithObjectID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  objc_msgSend_graph(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vertexWithVertexID_(v9, v10, (uint64_t)v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_unlock(self, v12, v13);
  return v11;
}

- (id)addObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  objc_msgSend__addObject_(self, v7, (uint64_t)v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_unlock(self, v9, v10);
  return v8;
}

- (id)_addObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  CLSDataStore *v7;
  const char *v8;
  CLSDataStore *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  void *v20;
  const char *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t isModified;
  const char *v26;
  const char *v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  const char *v32;

  v4 = a3;
  objc_msgSend_dataStore(v4, v5, v6);
  v7 = (CLSDataStore *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v7 != self)
  {
    if (v7)
    {
      objc_msgSend_cls_createErrorWithCode_errorObject_format_(MEMORY[0x1E0CB35C8], v8, 3, v4, CFSTR("Cannot add objects from other data stores."));
    }
    else
    {
      if ((objc_msgSend_isAllowedToInsertObject_(self, v8, (uint64_t)v4) & 1) != 0)
        goto LABEL_9;
      objc_msgSend_cls_createErrorWithCode_errorObject_format_(MEMORY[0x1E0CB35C8], v11, 3, v4, CFSTR("Not allowed to add objects of this kind to data store."));
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = v13;
      objc_msgSend_cls_log_(v13, v11, CLSLogDefault);
      v10 = 0;
LABEL_21:

      goto LABEL_22;
    }
LABEL_9:
    objc_msgSend_objectID(v4, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(self->_deletedObjectsByID, v15, (uint64_t)v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v19 = v16;
      v10 = v19;
    }
    else
    {
      objc_msgSend_graph(self, v17, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_vertexWithVertexID_(v20, v21, (uint64_t)v14);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v19 = v22;
      if (!v22 || v22 == v4)
      {
        objc_msgSend_parentObjectID(v4, v23, v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29
          && (objc_msgSend_vertexWithVertexID_(v20, v28, (uint64_t)v29),
              (v30 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v31 = v30;
          objc_msgSend_addChild_(v30, v28, (uint64_t)v4);

        }
        else
        {
          objc_msgSend_addVertex_(v20, v28, (uint64_t)v4);
        }
        objc_msgSend_setDataStore_(v4, v32, (uint64_t)self);
        v10 = v4;

      }
      else
      {
        isModified = objc_msgSend_isModified(v22, v23, v24);
        objc_msgSend_mergeWithObject_(v19, v26, (uint64_t)v4);
        objc_msgSend_setModified_(v19, v27, isModified);
        v10 = v19;
      }

    }
    goto LABEL_21;
  }
  v10 = v4;
LABEL_22:

  return v10;
}

- (void)removeObjectWithObjectID:(id)a3 class:(Class)a4
{
  const char *v6;
  const char *v7;
  void *v8;
  id v9;
  const char *v10;
  id v11;

  v11 = a3;
  objc_msgSend_objectWithObjectID_(self, v6, (uint64_t)v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = [a4 alloc];
    v8 = (void *)objc_msgSend_initWithDeletedObjectID_(v9, v10, (uint64_t)v11);
  }
  objc_msgSend_removeObject_(self, v7, (uint64_t)v8);

}

- (void)removeObject:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  id v9;

  v9 = a3;
  objc_msgSend_parent(v9, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend_markObjectAsDeleted_(self, v8, (uint64_t)v7);
    else
      objc_msgSend_removeChild_(v7, v8, (uint64_t)v9);
  }
  else
  {
    objc_msgSend_markObjectAsDeleted_(self, v6, (uint64_t)v9);
  }

}

- (void)markObjectAsDeleted:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSMutableDictionary *deletedObjectsByID;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  const char *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  deletedObjectsByID = self->_deletedObjectsByID;
  objc_msgSend_objectID(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(deletedObjectsByID, v11, (uint64_t)v4, v10);

  v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v14 = (void *)objc_msgSend_initWithObjects_(v12, v13, (uint64_t)v4, 0);
  objc_msgSend_graph(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = sub_1D4093638;
  v40[3] = &unk_1E974AFC0;
  v18 = v14;
  v41 = v18;
  objc_msgSend_traverseStartingAtVertex_enumerationBlock_(v17, v19, (uint64_t)v4, v40);

  objc_msgSend_setDeleted_(v4, v20, 1);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v21 = v18;
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v36, v42, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v21);
        v27 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v26);
        v28 = (void *)MEMORY[0x1D82573E4]();
        objc_msgSend_graph(self, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeVertex_(v31, v32, v27);

        objc_autoreleasePoolPop(v28);
        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v33, (uint64_t)&v36, v42, 16);
    }
    while (v24);
  }

  objc_msgSend_unlock(self, v34, v35);
}

- (BOOL)isRemovedObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSMutableDictionary *deletedObjectsByID;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  deletedObjectsByID = self->_deletedObjectsByID;
  objc_msgSend_objectID(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKey_(deletedObjectsByID, v11, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v12 != 0;

  objc_msgSend_unlock(self, v13, v14);
  return (char)v4;
}

- (void)_generatePartialTimeIntervalsForRunningActivities
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_lock(self, a2, v2);
  objc_msgSend_runningActivity(self, v4, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend__generatePartialTimeOnSave(v8, v6, v7);
  objc_msgSend_unlock(self, v6, v7);

}

+ (id)handoutGraphFromHandout:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  _UNKNOWN **v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  const char *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v74;
  id v75;
  uint64_t v76;
  id obj;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend_addObject_(v4, v5, (uint64_t)v3);
  objc_msgSend_recipients(v3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v4, v9, (uint64_t)v8);

  objc_msgSend_assets(v3, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v4, v13, (uint64_t)v12);

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  objc_msgSend_attachments(v3, v14, v15);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v91, v97, 16);
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v92;
    v21 = &protocolRef_CLSClientInterface;
    v74 = *(_QWORD *)v92;
    v75 = v3;
    do
    {
      v22 = 0;
      v76 = v19;
      do
      {
        if (*(_QWORD *)v92 != v20)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v22);
        objc_msgSend_addObject_(v4, v18, (uint64_t)v23);
        if (objc_msgSend_type(v23, v24, v25) == 5)
        {
          objc_msgSend_survey(v23, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            v79 = v23;
            v80 = v22;
            objc_msgSend_survey(v23, v26, v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v4, v30, (uint64_t)v29);
            v89 = 0u;
            v90 = 0u;
            v87 = 0u;
            v88 = 0u;
            v78 = v29;
            objc_msgSend_surveySteps(v29, v31, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v87, v96, 16);
            if (v35)
            {
              v37 = v35;
              v38 = *(_QWORD *)v88;
              v81 = *(_QWORD *)v88;
              v82 = v33;
              do
              {
                for (i = 0; i != v37; ++i)
                {
                  if (*(_QWORD *)v88 != v38)
                    objc_enumerationMutation(v33);
                  v40 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
                  objc_msgSend_addObject_(v4, v36, (uint64_t)v40);
                  if (objc_msgSend_conformsToProtocol_(v40, v41, (uint64_t)v21[6]))
                  {
                    v42 = v40;
                    objc_msgSend_answerFormat(v42, v43, v44);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v47)
                    {
                      objc_msgSend_addObject_(v4, v45, (uint64_t)v47);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend_answerChoiceItems(v47, v45, v46);
                        v48 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_addObjectsFromArray_(v4, v49, (uint64_t)v48);

                        v85 = 0u;
                        v86 = 0u;
                        v83 = 0u;
                        v84 = 0u;
                        objc_msgSend_answerChoiceItems(v47, v50, v51);
                        v52 = (void *)objc_claimAutoreleasedReturnValue();
                        v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v83, v95, 16);
                        if (v54)
                        {
                          v57 = v54;
                          v58 = *(_QWORD *)v84;
                          do
                          {
                            for (j = 0; j != v57; ++j)
                            {
                              if (*(_QWORD *)v84 != v58)
                                objc_enumerationMutation(v52);
                              objc_msgSend_assets(*(void **)(*((_QWORD *)&v83 + 1) + 8 * j), v55, v56);
                              v60 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend_addObjectsFromArray_(v4, v61, (uint64_t)v60);

                            }
                            v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v55, (uint64_t)&v83, v95, 16);
                          }
                          while (v57);
                        }

                        v21 = &protocolRef_CLSClientInterface;
                        v38 = v81;
                        v33 = v82;
                      }
                    }
                    objc_msgSend_assets(v42, v45, v46);
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_addObjectsFromArray_(v4, v63, (uint64_t)v62);

                  }
                }
                v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v87, v96, 16);
              }
              while (v37);
            }

            v20 = v74;
            v3 = v75;
            v19 = v76;
            v23 = v79;
            v22 = v80;
          }
        }
        objc_msgSend_assets(v23, v26, v27);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v4, v65, (uint64_t)v64);

        ++v22;
      }
      while (v22 != v19);
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v91, v97, 16);
    }
    while (v19);
  }

  objc_msgSend_schedule(v3, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    objc_msgSend_schedule(v3, v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v72, (uint64_t)v71);

  }
  objc_msgSend_makeObjectsPerformSelector_(v4, v69, (uint64_t)sel_willSaveObject);

  return v4;
}

- (void)removeContextWithObjectID:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend_length(v8, v4, v5))
  {
    v6 = objc_opt_class();
    objc_msgSend_removeObjectWithObjectID_class_(self, v7, (uint64_t)v8, v6);
  }

}

- (void)removeActivityWithObjectID:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend_length(v8, v4, v5))
  {
    v6 = objc_opt_class();
    objc_msgSend_removeObjectWithObjectID_class_(self, v7, (uint64_t)v8, v6);
  }

}

- (void)contextsMatchingIdentifierPath:(NSArray *)identifierPath completion:(void *)completion
{
  NSArray *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  int isEqualToString;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  NSObject *v30;
  _QWORD block[4];
  id v32;

  v6 = identifierPath;
  v7 = completion;
  objc_msgSend_mainAppContext(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v10, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    dispatch_get_global_queue(25, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D4093D58;
    block[3] = &unk_1E9749DE8;
    v32 = v7;
    dispatch_async(v30, block);

    goto LABEL_8;
  }
  objc_msgSend_firstObject(v6, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v6, v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_5;
  v22 = (void *)v19;
  objc_msgSend_firstObject(v6, v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v23, v24, (uint64_t)v15);

  if (isEqualToString)
  {
    v28 = objc_msgSend_count(v6, v26, v27);
    objc_msgSend_subarrayWithRange_(v6, v29, 1, v28 - 1);
    v16 = v6;
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  }
  objc_msgSend_contextsMatchingIdentifierPath_parentContext_completion_(self, v26, (uint64_t)v6, v10, v7);
LABEL_8:

}

- (void)contextsMatchingIdentifierPath:(id)a3 parentContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  const char *v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  id v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  const char *v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  CLSDataStore *v59;
  id v60;
  id v61;
  void (**v62)(_QWORD, _QWORD, _QWORD);
  _QWORD *v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[4];
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[4];
  id v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v8 = a4;
  v9 = a5;
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = sub_1D4094178;
  v72[3] = &unk_1E974AFE8;
  v53 = v9;
  v73 = v53;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D82575D0](v72);
  if (objc_msgSend_count(v54, v11, v12))
  {
    objc_msgSend_lock(self, v13, v14);
    v15 = (void *)objc_opt_new();
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v16 = v54;
    v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v68, v74, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v69 != v20)
            objc_enumerationMutation(v16);
          objc_msgSend_childContextWithIdentifier_(v8, v18, *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend_addObject_(v15, v22, (uint64_t)v23);
            v24 = v23;

            v8 = v24;
          }

        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v68, v74, 16);
      }
      while (v19);
    }

    objc_msgSend_unlock(self, v25, v26);
    v29 = objc_msgSend_count(v15, v27, v28);
    if (v29 == objc_msgSend_count(v16, v30, v31))
    {
      ((void (**)(_QWORD, void *, _QWORD))v10)[2](v10, v15, 0);
    }
    else
    {
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = sub_1D409425C;
      v66[3] = &unk_1E9749F88;
      v32 = v10;
      v67 = v32;
      objc_msgSend_dataServer_(self, v33, (uint64_t)v66);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend_count(v15, v35, v36);
      if (v39)
      {
        v40 = objc_msgSend_count(v16, v37, v38);
        objc_msgSend_subarrayWithRange_(v16, v41, v39, v40 - v39);
        v42 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v42 = v16;
      }
      v43 = v42;
      v64[0] = 0;
      v64[1] = v64;
      v64[2] = 0x3042000000;
      v64[3] = sub_1D40922FC;
      v64[4] = sub_1D4092308;
      objc_initWeak(&v65, self);
      objc_msgSend_delegate(self, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectID(v8, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = sub_1D4094270;
      v55[3] = &unk_1E974B038;
      v63 = v64;
      v62 = v32;
      v56 = v8;
      v50 = v43;
      v57 = v50;
      v58 = v15;
      v59 = self;
      v60 = v16;
      v51 = v46;
      v61 = v51;
      objc_msgSend_remote_contextsMatchingIdentifierPath_parentContextID_completion_(v34, v52, (uint64_t)v50, v49, v55);

      _Block_object_dispose(v64, 8);
      objc_destroyWeak(&v65);

    }
  }
  else
  {
    v10[2](v10, MEMORY[0x1E0C9AA60], 0);
  }

}

- (id)dataServer:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  objc_msgSend_endpointConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataServer_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)syncDataServer:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  objc_msgSend_endpointConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_syncDataServer_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)utilityServer:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  objc_msgSend_endpointConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_utilityServer_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)syncUtilityServer:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  objc_msgSend_endpointConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_syncUtilityServer_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CLSContext)activeContext
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  objc_msgSend_cachedMainAppContext(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1D408F1F4;
  v20 = sub_1D408F204;
  v21 = 0;
  objc_msgSend_lock(self, v5, v6);
  objc_msgSend_graph(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D4094CD0;
  v15[3] = &unk_1E974B060;
  v15[4] = &v16;
  objc_msgSend_traverseStartingAtVertex_enumerationBlock_(v9, v10, (uint64_t)v4, v15);

  objc_msgSend_unlock(self, v11, v12);
  v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return (CLSContext *)v13;
}

- (CLSActivity)runningActivity
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_runningActivities(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLSActivity *)v6;
}

- (id)runningActivities
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend_lock(self, a2, v2);
  v6 = (void *)objc_msgSend_copy(self->_runningActivities, v4, v5);
  objc_msgSend_unlock(self, v7, v8);
  if (v6)
    v9 = v6;
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];
  v10 = v9;

  return v10;
}

- (void)addRunningActivitiesObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  NSMutableArray *runningActivities;
  NSMutableArray *v13;
  NSMutableArray *v14;
  const char *v15;
  const char *v16;
  id v17;

  v4 = a3;
  if (v4)
  {
    v17 = v4;
    objc_msgSend_lock(self, v5, v6);
    if ((objc_msgSend_containsObject_(self->_runningActivities, v7, (uint64_t)v17) & 1) == 0)
    {
      objc_msgSend_willChangeValueForKey_(self, v8, (uint64_t)CFSTR("runningActivity"));
      objc_msgSend_willChangeValueForKey_(self, v10, (uint64_t)CFSTR("runningActivities"));
      runningActivities = self->_runningActivities;
      if (!runningActivities)
      {
        v13 = (NSMutableArray *)objc_opt_new();
        v14 = self->_runningActivities;
        self->_runningActivities = v13;

        runningActivities = self->_runningActivities;
      }
      objc_msgSend_addObject_(runningActivities, v11, (uint64_t)v17);
      objc_msgSend_didChangeValueForKey_(self, v15, (uint64_t)CFSTR("runningActivities"));
      objc_msgSend_didChangeValueForKey_(self, v16, (uint64_t)CFSTR("runningActivity"));
    }
    objc_msgSend_unlock(self, v8, v9);
    v4 = v17;
  }

}

- (void)removeRunningActivitiesObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v14 = v4;
    objc_msgSend_lock(self, v5, v6);
    if (objc_msgSend_containsObject_(self->_runningActivities, v7, (uint64_t)v14))
    {
      objc_msgSend_willChangeValueForKey_(self, v8, (uint64_t)CFSTR("runningActivity"));
      objc_msgSend_willChangeValueForKey_(self, v10, (uint64_t)CFSTR("runningActivities"));
      objc_msgSend_removeObject_(self->_runningActivities, v11, (uint64_t)v14);
      objc_msgSend_didChangeValueForKey_(self, v12, (uint64_t)CFSTR("runningActivities"));
      objc_msgSend_didChangeValueForKey_(self, v13, (uint64_t)CFSTR("runningActivity"));
    }
    objc_msgSend_unlock(self, v8, v9);
    v4 = v14;
  }

}

- (void)applicationWillResignActive:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[8];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v4 = CLSLogApp;
  if (os_log_type_enabled((os_log_t)CLSLogApp, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4054000, v4, OS_LOG_TYPE_INFO, "App will resign active.", buf, 2u);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend_runningActivities(self, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v16, v21, 16);
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend_isBackgroudTimeTrackingEnabled(v15, v10, v11) & 1) == 0)
          objc_msgSend_pause(v15, v10, v11);
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v16, v21, 16);
    }
    while (v12);
  }

}

- (void)applicationDidBecomeActive:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[8];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v4 = CLSLogApp;
  if (os_log_type_enabled((os_log_t)CLSLogApp, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4054000, v4, OS_LOG_TYPE_INFO, "App did become active.", buf, 2u);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend_runningActivities(self, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v16, v21, 16);
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend_isBackgroudTimeTrackingEnabled(v15, v10, v11) & 1) == 0)
          objc_msgSend_resume(v15, v10, v11);
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v16, v21, 16);
    }
    while (v12);
  }

}

- (BOOL)isAppClient
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  char isEqualToString;

  objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundlePath(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_pathExtension(v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lowercaseString(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend_isEqualToString_(v12, v13, (uint64_t)CFSTR("app")) & 1) != 0)
      isEqualToString = 1;
    else
      isEqualToString = objc_msgSend_isEqualToString_(v12, v14, (uint64_t)CFSTR("appex"));

  }
  else
  {
    isEqualToString = 0;
  }

  return isEqualToString;
}

- (void)triggerProgressTransparencyMessageForAttachmentID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v4 = a3;
  if (objc_msgSend_isAppClient(self, v5, v6))
  {
    if (objc_msgSend_length(v4, v7, v8))
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = sub_1D409538C;
      v11[3] = &unk_1E974B088;
      v11[4] = self;
      objc_msgSend_fetchTransparencyMessageInfoForAttachmentID_withCompletion_(self, v9, (uint64_t)v4, v11);
    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = sub_1D40953A0;
      v10[3] = &unk_1E974B088;
      v10[4] = self;
      objc_msgSend_fetchTransparencyMessageInfoWithCompletion_(self, v9, (uint64_t)v10);
    }
  }

}

- (void)presentTransparencyMessageInfo:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  id v34;
  NSObject *v35;
  void *v36;
  const char *v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("showModal"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v6, v7, v8);

  if (v9)
  {
    v11 = sub_1D4095624();
    objc_msgSend_shared(v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_showPrivacyModalViewWithInfo_(v14, v15, (uint64_t)v4);
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v10, (uint64_t)CFSTR("classNames"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v4, v16, (uint64_t)CFSTR("localizedTitle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v4, v18, (uint64_t)CFSTR("localizedMessageFormat"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v14, v20, v21) && v17 && v19)
    {
      objc_msgSend_localizedStringByJoiningStrings_(MEMORY[0x1E0CB3738], v22, (uint64_t)v14);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1D82573E4]();
      objc_msgSend_bundleRecordForCurrentProcess(MEMORY[0x1E0CA5898], v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedName(v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v24);
      v38 = 0;
      objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(MEMORY[0x1E0CB3940], v31, (uint64_t)v19, CFSTR("%@ %@"), &v38, v30, v23);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v38;
      if (v34)
      {
        if (qword_1ED0FB9A0 != -1)
          dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
        v35 = CLSLogDefault;
        if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v40 = v19;
          v41 = 2112;
          v42 = v34;
          _os_log_error_impl(&dword_1D4054000, v35, OS_LOG_TYPE_ERROR, "Failed to validate messageFormat: '%@', error: %@", buf, 0x16u);
        }
      }
      else
      {
        objc_msgSend_dataServer_(self, v33, (uint64_t)&unk_1E974B0A8);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_remote_triggerUserNotificationWithTitle_message_wrappedImageURL_(v36, v37, (uint64_t)v17, v32, 0);

      }
    }

  }
}

- (void)presentTransparencyMessageForHandoutAssignedItemInfo:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  id v24;
  const char *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  const char *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("showModal"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v6, v7, v8);

  if (v9)
  {
    v11 = sub_1D4095624();
    objc_msgSend_shared(v11, v12, v13);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_showPrivacyModalViewWithInfo_(v30, v14, (uint64_t)v4);

  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v10, (uint64_t)CFSTR("classNames"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v4, v16, (uint64_t)CFSTR("attachmentTitle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v4, v18, (uint64_t)CFSTR("localizedTitle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v4, v20, (uint64_t)CFSTR("localizedMessageFormat"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 && v17 && v19 && v21)
    {
      v31 = 0;
      objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(MEMORY[0x1E0CB3940], v22, (uint64_t)v21, CFSTR("%@ %@"), &v31, v17, v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v31;
      if (v24)
      {
        v26 = v24;
        if (qword_1ED0FB9A0 != -1)
          dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
        v27 = CLSLogDefault;
        if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v33 = v21;
          v34 = 2112;
          v35 = v26;
          _os_log_error_impl(&dword_1D4054000, v27, OS_LOG_TYPE_ERROR, "Failed to validate messageFormat: '%@', error: %@", buf, 0x16u);
        }

      }
      else
      {
        objc_msgSend_dataServer_(self, v25, (uint64_t)&unk_1E974B0C8);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_remote_triggerUserNotificationWithTitle_message_wrappedImageURL_(v28, v29, (uint64_t)v19, v23, 0);

      }
    }

  }
}

- (void)fetchTransparencyMessageInfoWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D4095B7C;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_dataServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_fetchTransparencyMessageInfoWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)fetchTransparencyMessageInfoForAttachmentID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D4095C38;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  objc_msgSend_dataServer_(self, v9, (uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_fetchTransparencyMessageInfoForAttachmentID_withCompletion_(v10, v11, (uint64_t)v8, v7);

}

- (void)shouldSyncTeacherBrowsedContextsWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D4095CD8;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_dataServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_shouldSyncTeacherBrowsedContextsWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)setShouldSyncTeacherBrowsedContexts:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  const char *v8;
  id v9;

  v4 = a3;
  v6 = a4;
  objc_msgSend_dataServer_(self, v7, (uint64_t)v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_setShouldSyncTeacherBrowsedContexts_completion_(v9, v8, v4, v6);

}

- (void)developerModeChanged:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  const char *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[8];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v4 = CLSLogApp;
  if (os_log_type_enabled((os_log_t)CLSLogApp, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4054000, v4, OS_LOG_TYPE_INFO, "Developer mode changed;", buf, 2u);
  }
  objc_msgSend_reset(self, v5, v6);
  objc_msgSend_lock(self, v7, v8);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend_objectEnumerator(self->_dataObservers, v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v21, v26, 16);
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v11);
        objc_msgSend_reset(*(void **)(*((_QWORD *)&v21 + 1) + 8 * i), v14, v15);
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v21, v26, 16);
    }
    while (v16);
  }

  objc_msgSend_unlock(self, v19, v20);
}

- (void)reset
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  CLSCurrentUser *cachedCurrentUser;
  const char *v14;
  CLSContext *mainAppContext;
  const char *v16;
  id v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  NSDate *v27;
  NSDate *lastPruneDate;
  const char *v29;
  uint64_t v30;
  uint64_t v31;

  objc_msgSend_lock(self, a2, v2);
  objc_msgSend_removeAllObjects(self->_deletedObjectsByID, v4, v5);
  objc_msgSend_removeAllObjects(self->_objectGenerationsByID, v6, v7);
  objc_msgSend_graph(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reset(v10, v11, v12);

  cachedCurrentUser = self->_cachedCurrentUser;
  self->_cachedCurrentUser = 0;

  mainAppContext = self->_mainAppContext;
  if (mainAppContext)
  {
    objc_msgSend_setDataStore_(mainAppContext, v14, 0);
    v17 = (id)objc_msgSend__addObject_(self, v16, (uint64_t)self->_mainAppContext);
    objc_msgSend_setDataStore_(self->_mainAppContext, v18, (uint64_t)self);
  }
  v19 = (void *)objc_opt_class();
  if (!objc_msgSend_isDashboardApp(v19, v20, v21)
    || (v24 = (void *)objc_opt_class(), objc_msgSend_isPDTool(v24, v25, v26)))
  {
    objc_msgSend__createMainAppContext(self, v22, v23);
  }
  objc_msgSend_date(MEMORY[0x1E0C99D68], v22, v23);
  v27 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastPruneDate = self->_lastPruneDate;
  self->_lastPruneDate = v27;

  objc_msgSend_unlock(self, v29, v30);
  MEMORY[0x1E0DE7D20](self, sel_faultMainAppContext, v31);
}

+ (CLSCurrentUser)currentUser
{
  const char *v2;
  uint64_t v3;
  Class v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  if (CurrentProcessNameMatches(CFSTR("progressd")))
  {
    v4 = objc_lookUpClass("PDDaemon");
    objc_msgSend_shared(v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, NSSelectorFromString(CFSTR("currentUser")));
  }
  else
  {
    objc_msgSend_shared(CLSDataStore, v2, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentUser(v7, v8, v9);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLSCurrentUser *)v10;
}

- (id)currentUser
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  id v8;
  void *v10;
  const char *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  if (!objc_msgSend_isDashboardAPIEnabled(self, a2, v2))
    return 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1D408F1F4;
  v17 = sub_1D408F204;
  objc_msgSend_cachedCurrentUser(self, v4, v5);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v14[5];
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend_syncDataServer_(self, v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1D409613C;
    v12[3] = &unk_1E974B0F0;
    v12[4] = &v13;
    objc_msgSend_currentUserWithServer_completion_(self, v11, (uint64_t)v10, v12);
    v8 = (id)v14[5];

  }
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)currentUserWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  qos_class_t v14;
  NSObject *v15;
  id *v16;
  void *v17;
  id v18;
  const char *v19;
  const char *v20;
  _QWORD v21[4];
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  uint8_t buf[16];

  v4 = a3;
  if ((objc_msgSend_isDashboardAPIEnabled(self, v5, v6) & 1) != 0)
  {
    objc_msgSend_cachedCurrentUser(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_person(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v13 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4054000, v13, OS_LOG_TYPE_INFO, "Called CLSDataStore currentUserWithCompletion, localCurrentUser.person is not nil returning cached localCurrentUser", buf, 2u);
      }
      v14 = qos_class_self();
      dispatch_get_global_queue(v14, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1D409643C;
      block[3] = &unk_1E974A088;
      v16 = &v25;
      v25 = v4;
      v24 = v9;
      dispatch_async(v15, block);

      v17 = v24;
    }
    else
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = sub_1D4096450;
      v21[3] = &unk_1E9749F88;
      v16 = &v22;
      v18 = v4;
      v22 = v18;
      objc_msgSend_dataServer_(self, v19, (uint64_t)v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_currentUserWithServer_completion_(self, v20, (uint64_t)v17, v18);
    }

  }
  else
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v7, 4, CFSTR("Not Authorized"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);
  }

}

- (void)currentUserWithServer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  const char *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[8];
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v8 = CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4054000, v8, OS_LOG_TYPE_INFO, "Calling CLSDataStore currentUserWithServer", buf, 2u);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D40965B0;
  v11[3] = &unk_1E974B118;
  v9 = v7;
  v12 = v9;
  objc_copyWeak(&v13, &location);
  objc_msgSend_remote_currentUserWithCompletion_(v6, v10, (uint64_t)v11);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

- (void)getCurrentUseriCloudQuotaInfoWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  if ((objc_msgSend_isDashboardAPIEnabled(self, v5, v6) & 1) != 0)
  {
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1D409684C;
    v16[3] = &unk_1E9749F88;
    v9 = v4;
    v17 = v9;
    objc_msgSend_dataServer_(self, v10, (uint64_t)v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = sub_1D4096868;
    v14[3] = &unk_1E974B140;
    v15 = v9;
    objc_msgSend_remote_getCurrentUseriCloudQuotaInfoWithCompletion_(v11, v12, (uint64_t)v14);

  }
  else
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v7, 4, CFSTR("Not Authorized"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, 0, v13);

  }
}

- (void)registerDataObserver:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  CLSDataStore *v7;
  const char *v8;
  uint64_t v9;
  CLSDataStore *v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_dataStore(v4, v5, v6);
  v7 = (CLSDataStore *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (v7 != self)
  {
    if (v7)
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v11 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v4;
        _os_log_impl(&dword_1D4054000, v11, OS_LOG_TYPE_INFO, "Refusing to register observer belonging to different data store; %@",
          buf,
          0xCu);
      }
    }
    else
    {
      objc_msgSend_lock(self, v8, v9);
      objc_msgSend_addObject_(self->_dataObservers, v12, (uint64_t)v4);
      objc_msgSend_setDataStore_(v4, v13, (uint64_t)self);
      objc_msgSend_unlock(self, v14, v15);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = sub_1D4096A5C;
      v30[3] = &unk_1E974ABA8;
      v16 = v4;
      v31 = v16;
      v17 = (void *)MEMORY[0x1D82575D0](v30);
      objc_msgSend_dataServer_(self, v18, (uint64_t)v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_observerID(v16, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_querySpec(v16, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend_changeTag(v16, v26, v27);
      objc_msgSend_remote_registerDataObserver_withID_querySpecification_oldChangeTag_completion_(v19, v29, (uint64_t)v16, v22, v25, v28, v17);

    }
  }

}

- (void)deregisterDataObserver:(id)a3
{
  id v4;
  NSMutableSet *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CLSDataStore *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  void *v23;
  const char *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_dataObservers;
  objc_msgSend_dataStore(v4, v6, v7);
  v10 = (CLSDataStore *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v11 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v4;
      _os_log_impl(&dword_1D4054000, v11, OS_LOG_TYPE_INFO, "Refusing to deregister non registered observer: %@;",
        buf,
        0xCu);
    }
  }
  if (v10 == self)
  {
    objc_msgSend_lock(self, v8, v9);
    objc_msgSend_setDataStore_(v4, v13, 0);
    objc_msgSend_removeObject_(v5, v14, (uint64_t)v4);
    objc_msgSend_unlock(self, v15, v16);
    objc_msgSend_observerID(v4, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1D4096E40;
    v27[3] = &unk_1E974ABA8;
    v21 = v4;
    v28 = v21;
    objc_msgSend_dataServer_(self, v22, (uint64_t)v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v20;
    v25[1] = 3221225472;
    v25[2] = sub_1D4096F2C;
    v25[3] = &unk_1E974A658;
    v26 = v21;
    objc_msgSend_remote_deregisterDataObserverWithID_completion_(v23, v24, (uint64_t)v19, v25);

  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v12 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v4;
      _os_log_impl(&dword_1D4054000, v12, OS_LOG_TYPE_INFO, "Refusing to deregister observer belonging to different data store; %@",
        buf,
        0xCu);
    }
  }

}

- (void)pruneDeletedObjectsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSDate *v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1D409716C;
  v21[3] = &unk_1E9749F88;
  v6 = v4;
  v22 = v6;
  objc_msgSend_dataServer_(self, v7, (uint64_t)v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(self, v9, v10);
  v11 = self->_lastPruneDate;
  objc_msgSend_unlock(self, v12, v13);
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3042000000;
  v19[3] = sub_1D40922FC;
  v19[4] = sub_1D4092308;
  objc_initWeak(&v20, self);
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = sub_1D4097178;
  v16[3] = &unk_1E974B168;
  v18 = v19;
  v14 = v6;
  v17 = v14;
  objc_msgSend_remote_fetchDeletedObjectIDsNewerThanDate_completion_(v8, v15, (uint64_t)v11, v16);

  _Block_object_dispose(v19, 8);
  objc_destroyWeak(&v20);

}

- (void)syncFetchWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D4097400;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_syncFetchWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)syncServerConfigWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D40974A0;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_syncBootstrapWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)fetchReportsWithPredicate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D409755C;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  objc_msgSend_utilityServer_(self, v9, (uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_fetchReportsWithPredicate_completion_(v10, v11, (uint64_t)v8, v7);

}

- (void)featureIsEnabled:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  _QWORD v11[4];
  id v12;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D409760C;
  v11[3] = &unk_1E9749F88;
  v12 = v6;
  v7 = v6;
  objc_msgSend_utilityServer_(self, v8, (uint64_t)v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_featureIsEnabled_completion_(v9, v10, v4, v7);

}

- (void)triggerUserNotificationReviewDueHandoutsWithReferenceDate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend_dataServer_(self, v8, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D40976D0;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v10 = v6;
  objc_msgSend_remote_triggerUserNotificationReviewDueHandoutsWithReferenceDate_completion_(v9, v11, (uint64_t)v7, v12);

}

- (void)triggerUserNotificationHandoutPastDueSummaryWithReferenceDate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend_dataServer_(self, v8, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D409778C;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v10 = v6;
  objc_msgSend_remote_triggerUserNotificationHandoutPastDueSummaryWithReferenceDate_completion_(v9, v11, (uint64_t)v7, v12);

}

- (void)triggerUserNotificationHandoutDueSoonWithReferenceDate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend_dataServer_(self, v8, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D4097848;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v10 = v6;
  objc_msgSend_remote_triggerUserNotificationHandoutDueSoonWithReferenceDate_completion_(v9, v11, (uint64_t)v7, v12);

}

- (void)triggerUserNotificationRevisionRequested:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend_dataServer_(self, v8, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D4097904;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v10 = v6;
  objc_msgSend_remote_triggerUserNotificationRevisionRequestedWithAttachmentID_completion_(v9, v11, (uint64_t)v7, v12);

}

- (void)triggerUserNotificationRevisedSubmissionWithAttachmentID:(id)a3 studentName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend_dataServer_(self, v11, (uint64_t)v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D40979D4;
  v15[3] = &unk_1E9749F88;
  v16 = v8;
  v13 = v8;
  objc_msgSend_remote_triggerUserNotificationRevisedSubmissionWithAttachmentID_studentName_completion_(v12, v14, (uint64_t)v10, v9, v15);

}

- (void)triggerUserNotificationHandoutAssigned:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend_dataServer_(self, v8, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D4097A90;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v10 = v6;
  objc_msgSend_remote_triggerUserNotificationHandoutAssignedWithHandoutID_completion_(v9, v11, (uint64_t)v7, v12);

}

- (void)renewCredentialsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1D4097B40;
  v10[3] = &unk_1E9749F88;
  v11 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D82575D0](v10);
  objc_msgSend_utilityServer_(self, v7, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_renewCredentialsWithCompletion_(v8, v9, (uint64_t)v5);

}

+ (id)handoutSubgraphContainingAsset:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = a3;
  objc_msgSend_parent(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99DE8], v7, (uint64_t)v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    do
    {
      objc_msgSend_insertObject_atIndex_(v10, v8, (uint64_t)v6, 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend_parent(v6, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v13;
    }
    while (v13);

  }
  v14 = (void *)objc_msgSend_copy(v10, v8, v9);

  return v14;
}

- (void)setMainAppContext:(id)a3
{
  objc_storeStrong((id *)&self->_mainAppContext, a3);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (CLSEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (void)setEndpointConnection:(id)a3
{
  objc_storeStrong((id *)&self->_endpointConnection, a3);
}

- (CLSGraph)graph
{
  return self->_graph;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_endpointConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mainAppContext, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lastPruneDate, 0);
  objc_storeStrong((id *)&self->_runningActivities, 0);
  objc_storeStrong((id *)&self->_handoutAssignedItemsAuthTree, 0);
  objc_storeStrong((id *)&self->_authTree, 0);
  objc_storeStrong((id *)&self->_pendingSaves, 0);
  objc_storeStrong((id *)&self->_cachedCurrentUser, 0);
  objc_storeStrong((id *)&self->_objectGenerationsByID, 0);
  objc_storeStrong((id *)&self->_deletedObjectsByID, 0);
  objc_storeStrong((id *)&self->_dataObservers, 0);
}

- (void)fetchAssignedItemFor:(id)a3 completion:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void (**v9)(id, _QWORD, void *);
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  void (**v25)(id, _QWORD, void *);
  uint8_t *v26;
  uint8_t buf[8];
  uint8_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32[3];

  v32[2] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v9 = (void (**)(id, _QWORD, void *))a4;
  if (!v6 || !objc_msgSend_length(v6, v7, v8))
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v16 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D4054000, v16, OS_LOG_TYPE_DEBUG, "CLSDataStore -fetchAssignedItemFor, invalid handout attachment id", buf, 2u);
    }
    goto LABEL_10;
  }
  if ((objc_msgSend_isAppClient(self, v10, v11) & 1) == 0)
  {
    v12 = (void *)objc_opt_class();
    if ((objc_msgSend_isPDTool(v12, v13, v14) & 1) == 0)
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v19 = (void *)CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
      {
        v20 = v19;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = objc_msgSend_isAppClient(self, v21, v22);
        _os_log_debug_impl(&dword_1D4054000, v20, OS_LOG_TYPE_DEBUG, "CLSDataStore fetchAssignedItemFor: is not an app or app extension client: %d", buf, 8u);

      }
LABEL_10:
      objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v17, 4, CFSTR("Not Authorized"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v18);

      goto LABEL_11;
    }
  }
  *(_QWORD *)buf = 0;
  v28 = buf;
  v29 = 0x3042000000;
  v30 = sub_1D40922FC;
  v31 = sub_1D4092308;
  objc_initWeak(v32, self);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1D4098024;
  v23[3] = &unk_1E974B208;
  v26 = buf;
  v25 = v9;
  v24 = v6;
  objc_msgSend_refreshAuthTreeForAttachment_withCompletion_(self, v15, (uint64_t)v24, v23);

  _Block_object_dispose(buf, 8);
  objc_destroyWeak(v32);
LABEL_11:

}

- (void)_validateAndCreateHandoutAssignedItemFor:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v8 = CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_debug_impl(&dword_1D4054000, v8, OS_LOG_TYPE_DEBUG, "CLSDataStore _validateAndCreateHandoutAssignedItemFor called for handoutAttachmentID: %@", buf, 0xCu);
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1D40986A0;
  v13[3] = &unk_1E9749F88;
  v14 = v7;
  v9 = v7;
  objc_msgSend_dataServer_(self, v10, (uint64_t)v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_validateAndCreateHandoutAssignedItem_withCompletion_(v11, v12, (uint64_t)v6, v9);

}

- (void)addHandout:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend_addObject_(self, a2, (uint64_t)a3);
}

- (void)publishHandout:(id)a3 completion:(id)a4
{
  id v5;
  const char *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  const char *v13;
  id v14;
  dispatch_block_t v15;
  id v16;
  const char *v17;
  id v18;
  void *v19;
  id v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27 = a4;
  v25 = v5;
  objc_msgSend_handoutGraphFromHandout_(CLSDataStore, v6, (uint64_t)v5);
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = sub_1D408F1F4;
  v49 = sub_1D408F204;
  v50 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v37, v51, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v12;
          v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &unk_1E974B228);
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = sub_1D4098A44;
          v32[3] = &unk_1E974B250;
          v33 = v7;
          v35 = &v41;
          v36 = &v45;
          v16 = v15;
          v34 = v16;
          objc_msgSend_createShareIfNeeded_(v14, v17, (uint64_t)v32);
          dispatch_block_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

        }
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v13, (uint64_t)&v37, v51, 16);
    }
    while (v9);
  }

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1D4098AE4;
  v30[3] = &unk_1E974B278;
  v18 = v27;
  v31 = v18;
  v19 = (void *)MEMORY[0x1D82575D0](v30);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_1D4098C04;
  v28[3] = &unk_1E9749F88;
  v20 = v19;
  v29 = v20;
  objc_msgSend_dataServer_(self, v21, (uint64_t)v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22;
  if (*((_BYTE *)v42 + 24))
    (*((void (**)(id, _QWORD, uint64_t))v20 + 2))(v20, 0, v46[5]);
  else
    objc_msgSend_remote_publishHandoutGraph_completion_(v22, v23, (uint64_t)v7, v20);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

}

- (void)repairHandoutAttachments:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  _QWORD block[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1D4098DB4;
  v25[3] = &unk_1E974B278;
  v8 = v6;
  v26 = v8;
  v9 = a3;
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = sub_1D4098ED4;
  v23[3] = &unk_1E9749F88;
  v10 = (id)MEMORY[0x1D82575D0](v25);
  v24 = v10;
  objc_msgSend_dataServer_(self, v11, (uint64_t)v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(MEMORY[0x1E0CB3880], v13, (uint64_t)CFSTR("type = %d OR type = %d"), 2, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v9, v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v16, v17, v18))
  {
    objc_msgSend_remote_repairHandoutAttachments_completion_(v12, v19, (uint64_t)v16, v10);
  }
  else
  {
    clsNotificationQueue();
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = sub_1D4098EE8;
    block[3] = &unk_1E9749DE8;
    v22 = v8;
    dispatch_async(v20, block);

  }
}

- (void)handoutAttachmentForDocumentURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend_isDashboardAPIEnabled(self, v8, v9) & 1) != 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1D4099020;
    v13[3] = &unk_1E974B2A0;
    v14 = v7;
    objc_msgSend__fetchHandoutAttachmentForDocumentURL_completion_(self, v11, (uint64_t)v6, v13);

  }
  else
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v10, 4, CFSTR("Use of API not allowed."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);

  }
}

- (void)addCollection:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend_addObject_(self, a2, (uint64_t)a3);
}

- (void)removeCollection:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_type(v4, v5, v6) == 2 || objc_msgSend_type(v4, v7, v8) == 5)
  {
    v11[0] = v4;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deleteArchivedCollectionObjects_withCompletion_(self, v10, (uint64_t)v9, &unk_1E9749890);

  }
  else
  {
    objc_msgSend_removeObject_(self, v7, (uint64_t)v4);
  }

}

- (void)addFavorite:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend_addObject_(self, a2, (uint64_t)a3);
}

- (void)_classesForCurrentUserWithRole:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D40991B4;
  v9[3] = &unk_1E974B2E8;
  v9[4] = self;
  v10 = v6;
  v11 = a3;
  v7 = v6;
  objc_msgSend_currentUserWithCompletion_(self, v8, (uint64_t)v9);

}

- (void)instructedClassesWithCompletion:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend_isDashboardAPIEnabled(self, v4, v5) & 1) != 0)
    objc_msgSend__classesForCurrentUserWithRole_completion_(self, v6, 2, v7);
  else
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

}

- (void)personsInClassWithClassID:(id)a3 role:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1D40993BC;
  v13[3] = &unk_1E974B338;
  v10 = v9;
  v15 = v10;
  v16[1] = (id)a4;
  v11 = v8;
  v14 = v11;
  objc_copyWeak(v16, &location);
  objc_msgSend_currentUserWithCompletion_(self, v12, (uint64_t)v13);
  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
}

- (void)classesForPersonID:(id)a3 role:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, id);
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  id v18;
  const char *v19;
  const char *v20;
  _QWORD v21[4];
  void (**v22)(id, _QWORD, id);
  id v23;
  id v24;
  id location;

  v8 = a3;
  v9 = (void (**)(id, _QWORD, id))a5;
  objc_initWeak(&location, self);
  v10 = objc_opt_class();
  v11 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v12, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(v11, v14, (uint64_t)CFSTR("personID == %@ && %K = %@"), v8, CFSTR("roles"), v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend_queryWithObjectType_predicate_error_(CLSQuery, v16, v10, v15, &v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v24;

  if (v18)
  {
    v9[2](v9, 0, v18);
  }
  else
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_1D4099954;
    v21[3] = &unk_1E974B360;
    v22 = v9;
    objc_copyWeak(&v23, &location);
    objc_msgSend_setCompletion_(v17, v19, (uint64_t)v21);
    objc_msgSend_executeQuery_(self, v20, (uint64_t)v17);
    objc_destroyWeak(&v23);

  }
  objc_destroyWeak(&location);

}

- (void)saveClass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  id v25;
  const char *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD *v32;
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = sub_1D4099E7C;
  v38[3] = &unk_1E974B388;
  v9 = v6;
  v39 = v9;
  v10 = v7;
  v40 = v10;
  v36[0] = v8;
  v36[1] = 3221225472;
  v36[2] = sub_1D4099FBC;
  v36[3] = &unk_1E9749F88;
  v11 = (id)MEMORY[0x1D82575D0](v38);
  v37 = v11;
  objc_msgSend_dataServer_(self, v12, (uint64_t)v36);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_1D408F1F4;
  v34[4] = sub_1D408F204;
  v14 = objc_opt_class();
  objc_msgSend_childrenOfClass_(v9, v15, v14);
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend_objectID(v9, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(v16, v20, (uint64_t)CFSTR("parentObjectID = %@"), v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_opt_class();
  v33 = 0;
  objc_msgSend_queryWithObjectType_predicate_error_(CLSQuery, v23, v22, v21, &v33);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v33;
  if (v24)
  {
    v27[0] = v8;
    v27[1] = 3221225472;
    v27[2] = sub_1D4099FD0;
    v27[3] = &unk_1E974B3B0;
    v30 = v10;
    v32 = v34;
    v28 = v13;
    v29 = v9;
    v31 = v11;
    objc_msgSend_awaitExecuteQuery_completion_(self, v26, (uint64_t)v24, v27);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v25);
  }

  _Block_object_dispose(v34, 8);
}

- (void)removeClass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1D409A4B4;
  v18[3] = &unk_1E974B388;
  v19 = v6;
  v20 = v7;
  v9 = v7;
  v10 = v6;
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = sub_1D409A5F4;
  v16[3] = &unk_1E9749F88;
  v17 = (id)MEMORY[0x1D82575D0](v18);
  v11 = v17;
  objc_msgSend_dataServer_(self, v12, (uint64_t)v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDeleted_(v10, v14, 1);
  objc_msgSend_remote_publishClass_membersToInsert_membersToDelete_completion_(v13, v15, (uint64_t)v10, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v11);

}

- (void)removeClass:(id)a3
{
  objc_msgSend_setDeleted_(a3, a2, 1);
}

- (id)orphanedAssets:(id *)a3
{
  void *v4;
  const char *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  objc_msgSend_syncDataServer_(self, a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1D408F1F4;
  v21 = sub_1D408F204;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1D408F1F4;
  v15 = sub_1D408F204;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1D409A74C;
  v10[3] = &unk_1E974B3D8;
  v10[4] = &v17;
  v10[5] = &v11;
  objc_msgSend_remote_fetchOrphanedAssetsWithCompletion_(v4, v5, (uint64_t)v10);
  v6 = (void *)v12[5];
  if (v6)
  {
    v7 = objc_retainAutorelease(v6);
    v8 = 0;
    if (a3)
      *a3 = v7;
  }
  else
  {
    v8 = (id)v18[5];
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (void)removeAsset:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend_isDashboardAPIEnabled(self, v4, v5))
    objc_msgSend_removeObject_(self, v6, (uint64_t)v7);

}

- (void)enrolledClassesWithCompletion:(id)a3
{
  objc_msgSend__classesForCurrentUserWithRole_completion_(self, a2, 1, a3);
}

- (void)studentActivityForAttachmentsWithIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D409A8BC;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  objc_msgSend_dataServer_(self, v9, (uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_studentActivityForAttachmentsWithIDs_completion_(v10, v11, (uint64_t)v8, v7);

}

- (void)addSurveyAnswerItem:(id)a3
{
  const char *v4;
  const char *v5;
  id v6;
  id v7;

  v7 = a3;
  objc_msgSend_setAction_(v7, v4, 1);
  v6 = (id)objc_msgSend_addObject_(self, v5, (uint64_t)v7);

}

- (void)removeSurveyAnswerItem:(id)a3
{
  const char *v4;
  const char *v5;
  const char *v6;
  id v7;

  v7 = a3;
  objc_msgSend_setState_(v7, v4, 1);
  objc_msgSend_setAction_(v7, v5, 3);
  objc_msgSend_removeObject_(self, v6, (uint64_t)v7);

}

- (void)startActivity:(id)a3 activityType:(int)a4 bundleID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  int isInstructor;
  const char *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  int v32;
  _QWORD v33[4];
  id v34;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1D409AB44;
  v33[3] = &unk_1E9749F88;
  v14 = v12;
  v34 = v14;
  objc_msgSend_dataServer_(self, v15, (uint64_t)v33);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentUser(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  isInstructor = objc_msgSend_isInstructor(v19, v20, v21);

  if (isInstructor)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v23, 0, CFSTR("API only applicable for student."));
LABEL_10:
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v14 + 2))(v14, 0, v27);
    goto LABEL_11;
  }
  if ((objc_msgSend_isDashboardAPIEnabled(self, v23, v24) & 1) == 0)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v25, 4, CFSTR("Use of API not allowed."));
    goto LABEL_10;
  }
  if (!v11 || !v10 || (a4 & 0xFFFFFFFD) != 1)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v25, 307, CFSTR("Invalid input"));
    goto LABEL_10;
  }
  v28[0] = v13;
  v28[1] = 3221225472;
  v28[2] = sub_1D409AB58;
  v28[3] = &unk_1E974B400;
  v31 = v14;
  v29 = v16;
  v30 = v11;
  v32 = a4;
  objc_msgSend_fetchAssignedItemFor_completion_(self, v26, (uint64_t)v10, v28);

  v27 = v31;
LABEL_11:

}

- (void)startActivityFailed:(id)a3 activityType:(int)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  int isInstructor;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v8 = a3;
  v9 = a5;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1D409AED0;
  v23[3] = &unk_1E9749F88;
  v10 = v9;
  v24 = v10;
  objc_msgSend_dataServer_(self, v11, (uint64_t)v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentUser(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  isInstructor = objc_msgSend_isInstructor(v15, v16, v17);

  if (isInstructor)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v19, 0, CFSTR("API only applicable for student."));
LABEL_9:
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v22);

    goto LABEL_10;
  }
  if ((objc_msgSend_isDashboardAPIEnabled(self, v19, v20) & 1) == 0)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v21, 4, CFSTR("Use of API not allowed."));
    goto LABEL_9;
  }
  if (!v8 || a4 != 3)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v21, 2, CFSTR("Invalid argument, nil attachmentID or incorrect attachment type"));
    goto LABEL_9;
  }
  objc_msgSend_remote_startActivityFailed_completion_(v12, v21, (uint64_t)v8, v10);
LABEL_10:

}

- (void)fetchAppBasedAssignmentUsage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D409AFD8;
  v15[3] = &unk_1E9749F88;
  v8 = v7;
  v16 = v8;
  objc_msgSend_dataServer_(self, v9, (uint64_t)v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isDashboardAPIEnabled(self, v11, v12) & 1) != 0)
  {
    objc_msgSend_remote_fetchAppBasedAssignmentUsage_completion_(v10, v13, (uint64_t)v6, v8);
  }
  else
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v13, 4, CFSTR("Use of API not allowed."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v14);

  }
}

- (void)canSearchRostersWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D409B078;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_dataServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_canSearchRostersWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)shouldPerformSearchAPIOperation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  sub_1D409B144();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D409B184;
  block[3] = &unk_1E974B428;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)objectsMatching:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  dispatch_time_t v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD *v20;
  id v21;
  id location;
  _QWORD block[4];
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[3];
  char v33;

  v6 = a3;
  v7 = a4;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 1;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_1D408F1F4;
  v30[4] = sub_1D408F204;
  v31 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1D409B4B0;
  v27[3] = &unk_1E974B450;
  v27[4] = self;
  v29 = v32;
  v9 = v7;
  v28 = v9;
  v10 = (void *)MEMORY[0x1D82575D0](v27);
  v11 = dispatch_time(0, 2700000000);
  sub_1D409B144();
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = sub_1D409B788;
  block[3] = &unk_1E974B478;
  v25 = v32;
  v26 = v30;
  v13 = v10;
  v24 = v13;
  dispatch_after(v11, v12, block);

  objc_initWeak(&location, self);
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = sub_1D409B874;
  v17[3] = &unk_1E974B4A0;
  objc_copyWeak(&v21, &location);
  v14 = v13;
  v19 = v14;
  v15 = v6;
  v18 = v15;
  v20 = v30;
  objc_msgSend_shouldPerformSearchAPIOperation_completion_(self, v16, (uint64_t)v15, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

}

- (void)membersOfGroupWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CLSSearchSpecification *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v8 = CLSLogSearch;
  if (os_log_type_enabled((os_log_t)CLSLogSearch, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_debug_impl(&dword_1D4054000, v8, OS_LOG_TYPE_DEBUG, "Query for members of CLSClass/CLSGroup: %@", buf, 0xCu);
  }
  v9 = [CLSSearchSpecification alloc];
  v11 = (void *)objc_msgSend_initWithOptions_behaviors_(v9, v10, 1, 1);
  v16 = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)&v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requireClassMemberRole_forClassIDs_(v11, v14, 3, v13);

  objc_msgSend_objectsMatching_completion_(self, v15, (uint64_t)v11, v7);
}

- (void)collaborationStatesForObjectWithID:(id)a3 ownerPersonID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1D409BC98;
  v16[3] = &unk_1E9749F88;
  v11 = v10;
  v17 = v11;
  objc_msgSend_dataServer_(self, v12, (uint64_t)v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  if (v13)
    objc_msgSend_remote_collaborationStatesForObjectWithID_ownerPersonID_completion_(v13, v14, (uint64_t)v8, v9, v11);

}

- (void)collaborationStatesForObjectWithID:(id)a3 classID:(id)a4 forOwnersWithRole:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1D409BD80;
  v18[3] = &unk_1E9749F88;
  v13 = v12;
  v19 = v13;
  objc_msgSend_dataServer_(self, v14, (uint64_t)v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  if (v15)
    objc_msgSend_remote_collaborationStatesForObjectWithID_classID_forOwnersWithRole_completion_(v15, v16, (uint64_t)v10, v11, a5, v13);

}

- (void)publishCollaborationStateChanges:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  char v21;
  id v22;
  void *v23;
  const char *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1D409BF80;
  v30[3] = &unk_1E9749F88;
  v8 = v7;
  v31 = v8;
  objc_msgSend_dataServer_(self, v9, (uint64_t)v30);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v6, v11, v12))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v6;
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v26, v32, 16);
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v13);
          v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v25 = 0;
          v21 = objc_msgSend_validateObject_(v20, v16, (uint64_t)&v25);
          v22 = v25;
          v23 = v22;
          if ((v21 & 1) == 0)
          {
            (*((void (**)(id, _QWORD, _QWORD, id))v8 + 2))(v8, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v22);

            goto LABEL_13;
          }

        }
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v26, v32, 16);
        if (v17)
          continue;
        break;
      }
    }

    objc_msgSend_remote_publishCollaborationStateChanges_completion_(v10, v24, (uint64_t)v13, v8);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0);
  }
LABEL_13:

}

- (void)publishAdminRequests:(id)a3 withRequestor:(id)a4 adminRequestAccounts:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  char isEqualToString;
  uint64_t v43;
  const char *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id obj;
  void *v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  id v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = sub_1D409C304;
  v67[3] = &unk_1E9749F88;
  v14 = v13;
  v68 = v14;
  objc_msgSend_dataServer_(self, v15, (uint64_t)v67);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v10, v17, v18))
  {
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    obj = v10;
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v63, v69, 16);
    if (v21)
    {
      v24 = v21;
      v62 = *(_QWORD *)v64;
      v58 = v12;
      v59 = v10;
      v56 = v16;
      v57 = v14;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v64 != v62)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v25);
          objc_msgSend_requestorID(v26, v22, v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27 || (objc_msgSend_objectID(v11, v22, v23), (v61 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            objc_msgSend_requestorID(v26, v22, v23);
            v28 = objc_claimAutoreleasedReturnValue();
            if (!v28)
              goto LABEL_22;
            v31 = (void *)v28;
            objc_msgSend_objectID(v11, v29, v30);
            v32 = objc_claimAutoreleasedReturnValue();
            if (!v32)
            {

LABEL_22:
              if (!v27)
                v27 = v61;

LABEL_25:
              v46 = (void *)MEMORY[0x1E0CB35C8];
              v47 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend_requestorID(v26, v22, v23);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectID(v11, v49, v50);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringWithFormat_(v47, v52, (uint64_t)CFSTR("Invalid RequestorID. (got:%@, expected:%@)"), v48, v51);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_cls_createErrorWithCode_description_(v46, v54, 2, v53);
              v55 = (void *)objc_claimAutoreleasedReturnValue();

              v14 = v57;
              (*((void (**)(id, _QWORD, void *))v57 + 2))(v57, 0, v55);

              v12 = v58;
              v10 = v59;
              v16 = v56;
              goto LABEL_26;
            }
            v35 = (void *)v32;
            objc_msgSend_requestorID(v26, v33, v34);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v11;
            objc_msgSend_objectID(v11, v38, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v36, v41, (uint64_t)v40);

            if (v27)
            else

            v11 = v37;
            if ((isEqualToString & 1) == 0)
              goto LABEL_25;
          }
          else
          {
            v61 = 0;
          }
          ++v25;
        }
        while (v24 != v25);
        v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v63, v69, 16);
        v24 = v43;
        v12 = v58;
        v10 = v59;
        v16 = v56;
        v14 = v57;
      }
      while (v43);
    }

    objc_msgSend_remote_publishAdminRequests_withRequestor_adminRequestAccounts_completion_(v16, v44, (uint64_t)obj, v11, v12, v14);
  }
  else
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v19, 2, CFSTR("Empty adminRequests."));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v14 + 2))(v14, 0, v45);

  }
LABEL_26:

}

- (void)adminRequestorForEmail:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(id, _QWORD, id);
  id v19;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v8 = objc_opt_class();
  objc_msgSend_predicateWithFormat_(MEMORY[0x1E0CB3880], v9, (uint64_t)CFSTR("email == %@"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend_queryWithObjectType_predicate_error_(CLSQuery, v11, v8, v10, &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;

  if (v13)
  {
    v7[2](v7, 0, v13);
  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1D409C458;
    v16[3] = &unk_1E974B310;
    v18 = v7;
    v17 = v6;
    objc_msgSend_setCompletion_(v12, v14, (uint64_t)v16);
    objc_msgSend_executeQuery_(self, v15, (uint64_t)v12);

  }
}

- (void)childrenOfAdminRequestID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  void (**v17)(id, _QWORD, id);
  _QWORD *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id location;
  id v23;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v8 = objc_opt_class();
  objc_msgSend_predicateForObjectsWithParentObjectID_(CLSDataObserver, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend_queryWithObjectType_predicate_error_(CLSQuery, v11, v8, v10, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23;

  if (v13)
  {
    v7[2](v7, 0, v13);
  }
  else
  {
    objc_initWeak(&location, self);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = sub_1D408F1F4;
    v20[4] = sub_1D408F204;
    v21 = (id)objc_opt_new();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1D409C6C4;
    v16[3] = &unk_1E974B4F0;
    v17 = v7;
    objc_copyWeak(&v19, &location);
    v18 = v20;
    objc_msgSend_setCompletion_(v12, v14, (uint64_t)v16);
    objc_msgSend_executeQuery_(self, v15, (uint64_t)v12);
    objc_destroyWeak(&v19);

    _Block_object_dispose(v20, 8);
    objc_destroyWeak(&location);
  }

}

- (void)deleteAdminRequestID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D409CAB0;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  objc_msgSend_dataServer_(self, v9, (uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_deleteAdminRequestID_completion_(v10, v11, (uint64_t)v8, v7);

}

- (void)publishAnswersForSurvey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D409CB6C;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  objc_msgSend_dataServer_(self, v9, (uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_publishSurveyAnswers_completion_(v10, v11, (uint64_t)v8, v7);

}

- (void)fetchSurveyAnswers:(id)a3 responderIDs:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1D409CC78;
  v16[3] = &unk_1E9749F88;
  v11 = v10;
  v17 = v11;
  objc_msgSend_dataServer_(self, v12, (uint64_t)v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && objc_msgSend_count(v8, v13, v14) || v9 && objc_msgSend_count(v9, v13, v14))
    objc_msgSend_remote_fetchSurveyAnswer_responderIDs_completion_(v15, v13, (uint64_t)v8, v9, v11);
  else
    (*((void (**)(id, uint64_t, _QWORD))v11 + 2))(v11, 1, 0);

}

- (void)relayRequestWithData:(id)a3 requestType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v12;
  id v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  char FileAtPath_contents_attributes;
  const char *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  const char *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;

  v8 = a3;
  v9 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  if (a4 == 1)
  {
    v12 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = sub_1D409CF54;
    v48[3] = &unk_1E9749F88;
    v13 = v9;
    v49 = v13;
    objc_msgSend_dataServer_(self, v14, (uint64_t)v48);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_isDirectory_(v16, v18, (uint64_t)v17, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_isDirectory_(v19, v26, (uint64_t)v25, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(v27, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    FileAtPath_contents_attributes = objc_msgSend_createFileAtPath_contents_attributes_(v30, v34, (uint64_t)v33, 0, 0);

    if ((FileAtPath_contents_attributes & 1) != 0)
    {
      v47 = 0;
      objc_msgSend_fileHandleForUpdatingURL_error_(MEMORY[0x1E0CB3608], v36, (uint64_t)v27, &v47);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v47;
      if (v37)
      {
        v43[0] = v12;
        v43[1] = 3221225472;
        v43[2] = sub_1D409CF68;
        v43[3] = &unk_1E974B518;
        v46 = v13;
        v39 = v37;
        v44 = v39;
        v45 = v27;
        v40 = (void *)MEMORY[0x1D82575D0](v43);
        objc_msgSend_remote_relayRequestWithData_requestType_fileHandle_completion_(v15, v41, (uint64_t)v8, 1, v39, v40);

      }
      else
      {
        (*((void (**)(id, _QWORD, id))v13 + 2))(v13, 0, v38);
      }

    }
    else
    {
      objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v36, 100, CFSTR("failed to create file"));
      v38 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, id))v13 + 2))(v13, 0, v38);
    }

  }
  else
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v10, 2, CFSTR("Invalid requestType"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v42);

  }
}

- (void)saveInsightEvents:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D409D274;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  objc_msgSend_dataServer_(self, v9, (uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_saveInsightEvents_completion_(v10, v11, (uint64_t)v8, v7);

}

- (void)urlSuitableForOpeningForExpectedURL:(id)a3 itemID:(id)a4 ownerName:(id)a5 zoneName:(id)a6 completion:(id)a7
{
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  void *v20;
  id v21;
  const char *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v12 = a7;
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1D409EA0C;
  v25[3] = &unk_1E9749F88;
  v14 = v12;
  v26 = v14;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  objc_msgSend_utilityServer_(self, v19, (uint64_t)v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = sub_1D409EA20;
  v23[3] = &unk_1E974B5A0;
  v24 = v14;
  v21 = v14;
  objc_msgSend_remote_urlSuitableForOpeningForExpectedURL_itemID_ownerName_zoneName_completion_(v20, v22, (uint64_t)v18, v17, v16, v15, v23);

}

- (void)cloudKitUrlSuitableForOpeningForAsset:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1D409EB70;
  v16[3] = &unk_1E9749F88;
  v8 = v6;
  v17 = v8;
  v9 = a3;
  objc_msgSend_utilityServer_(self, v10, (uint64_t)v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = sub_1D409EB84;
  v14[3] = &unk_1E974B5A0;
  v15 = v8;
  v12 = v8;
  objc_msgSend_remote_cloudKitUrlSuitableForOpeningForAsset_downloadObserver_completion_(v11, v13, (uint64_t)v9, v9, v14);

}

- (void)cloudKitThumbnailUrlSuitableForOpeningForAsset:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1D409ECD0;
  v16[3] = &unk_1E9749F88;
  v8 = v6;
  v17 = v8;
  v9 = a3;
  objc_msgSend_utilityServer_(self, v10, (uint64_t)v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = sub_1D409ECE4;
  v14[3] = &unk_1E974B5A0;
  v15 = v8;
  v12 = v8;
  objc_msgSend_remote_cloudKitThumbnailUrlSuitableForOpeningForAsset_completion_(v11, v13, (uint64_t)v9, v14);

}

- (void)cloudKitUrlSuitableForStreamingAsset:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1D409EE34;
  v16[3] = &unk_1E9749F88;
  v8 = v6;
  v17 = v8;
  v9 = a3;
  objc_msgSend_utilityServer_(self, v10, (uint64_t)v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = sub_1D409EE4C;
  v14[3] = &unk_1E974B5C8;
  v15 = v8;
  v12 = v8;
  objc_msgSend_remote_cloudKitUrlSuitableForStreamingAsset_downloadObserver_completion_(v11, v13, (uint64_t)v9, v9, v14);

}

- (void)deleteBackingStoreForAsset:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1D409EF3C;
  v16[3] = &unk_1E9749F88;
  v8 = v6;
  v17 = v8;
  v9 = a3;
  objc_msgSend_utilityServer_(self, v10, (uint64_t)v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = sub_1D409EF50;
  v14[3] = &unk_1E974B278;
  v15 = v8;
  v12 = v8;
  objc_msgSend_remote_deleteBackingStoreForAsset_completion_(v11, v13, (uint64_t)v9, v14);

}

- (void)createShareIfNeededForURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D409F00C;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  objc_msgSend_utilityServer_(self, v9, (uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_createShareIfNeededForURL_completion_(v10, v11, (uint64_t)v8, v7);

}

- (id)uploadAsset:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  int v7;
  const char *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  objc_msgSend_syncUtilityServer_(self, v5, (uint64_t)&unk_1E9749AD0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1D409F208;
  v16 = sub_1D409F218;
  v17 = 0;
  v7 = CLSExecutableLinkedOnOrAfter_iOS16_2_macOS_13_1();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D409F220;
  v11[3] = &unk_1E974B5F0;
  v11[4] = &v12;
  objc_msgSend_remote_uploadAsset_createThumbnailIfNeeded_uploadObserver_completion_(v6, v8, (uint64_t)v4, v7 ^ 1u, v4, v11);
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

@end
