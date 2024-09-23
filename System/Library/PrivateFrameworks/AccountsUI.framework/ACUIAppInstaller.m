@implementation ACUIAppInstaller

- (id)initForAppWithDescription:(id)a3
{
  ACUIAppInstaller *v3;
  ACUIAppInstaller *v5;
  NSString *v6;
  objc_super v7;
  id location[2];
  ACUIAppInstaller *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)ACUIAppInstaller;
  v9 = -[ACUIAppInstaller init](&v7, sel_init);
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    objc_storeStrong((id *)&v9->_app, location[0]);
    v6 = -[ACUIAppDescription bundleID](v9->_app, "bundleID");

    if (v6)
    {
      v9->_availableInStoreResult = 1;
      v9->_needsAvailableInStoreCheck = 1;
    }
    else
    {
      v9->_availableInStoreResult = 0;
      v9->_needsAvailableInStoreCheck = 0;
    }
    -[ACUIAppInstaller _quicklyGenerateCachedReachabilityResultConsideringPublisherURL:](v9, "_quicklyGenerateCachedReachabilityResultConsideringPublisherURL:", 0);
  }
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (BOOL)isInstalled
{
  NSString *v2;
  BOOL v3;
  double v4;
  NSDate *v5;
  NSDate *dateOfLastInstallationCheck;
  char v7;
  NSString *v9;
  NSString *v10;
  id v11;
  NSString *v12;
  BOOL v13;
  BOOL v14;
  os_log_t v15;
  os_log_type_t type;
  os_log_t oslog;
  char v18;
  id v19;
  SEL v20;
  ACUIAppInstaller *v21;
  uint8_t v23[48];
  uint8_t v24[40];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v21 = self;
  v20 = a2;
  v2 = -[ACUIAppDescription bundleID](self->_app, "bundleID");
  v14 = v2 != 0;

  if (v14)
  {
    v3 = v21->_dateOfLastInstallationCheck == 0;
    v18 = 0;
    v13 = 1;
    if (!v3)
    {
      v19 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = 1;
      objc_msgSend(v19, "timeIntervalSinceDate:", v21->_dateOfLastInstallationCheck);
      v13 = v4 > 20.0;
    }
    if ((v18 & 1) != 0)

    if (v13)
    {
      oslog = (os_log_t)_ACUILogSystem();
      type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v12 = -[ACUIAppDescription name](v21->_app, "name");
        __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v24, (uint64_t)"-[ACUIAppInstaller isInstalled]", 56, (uint64_t)v12);
        _os_log_impl(&dword_1D573D000, oslog, type, "%s (%d) \"Installation check for app %@ hasn't been done in a while.\", v24, 0x1Cu);

      }
      objc_storeStrong((id *)&oslog, 0);
      v5 = (NSDate *)(id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
      dateOfLastInstallationCheck = v21->_dateOfLastInstallationCheck;
      v21->_dateOfLastInstallationCheck = v5;

      v11 = (id)objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v10 = -[ACUIAppDescription bundleID](v21->_app, "bundleID");
      v7 = objc_msgSend(v11, "applicationIsInstalled:");
      v21->_resultOfLastInstallationCheck = v7 & 1;

      v15 = (os_log_t)_ACUILogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v9 = -[ACUIAppDescription bundleID](v21->_app, "bundleID");
        __os_log_helper_16_2_4_8_32_4_0_8_64_4_0((uint64_t)v23, (uint64_t)"-[ACUIAppInstaller isInstalled]", 61, (uint64_t)v9, v21->_resultOfLastInstallationCheck);
        _os_log_debug_impl(&dword_1D573D000, v15, OS_LOG_TYPE_DEBUG, "%s (%d) \"Installation lookup result for bundle ID %@: %d\", v23, 0x22u);

      }
      objc_storeStrong((id *)&v15, 0);
    }
    return v21->_resultOfLastInstallationCheck;
  }
  else
  {
    return 0;
  }
}

- (void)_setCachedReachabilityResult:(BOOL)a3
{
  ACUIAppInstallerDelegate *v3;
  ACUIAppInstallerDelegate *v4;
  char v5;
  BOOL v6;

  v6 = a3 != self->_cachedReachabilityResult;
  self->_cachedReachabilityResult = a3;
  if (v6)
  {
    v4 = -[ACUIAppInstaller delegate](self, "delegate");
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v3 = -[ACUIAppInstaller delegate](self, "delegate");
      -[ACUIAppInstallerDelegate appIsDownloadableDidChange:](v3, "appIsDownloadableDidChange:", self);

    }
  }
}

- (BOOL)_isGreenTeaAvailable
{
  const __CFString *v2;
  os_log_t oslog;
  char v5;
  char v6;
  SEL v7;
  ACUIAppInstaller *v8;
  uint8_t v9[40];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8 = self;
  v7 = a2;
  v5 = MGGetBoolAnswer() & 1;
  v6 = v5;
  oslog = (os_log_t)_ACUILogSystem();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    if ((v6 & 1) != 0)
      v2 = CFSTR("YES");
    else
      v2 = CFSTR("NO");
    __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v9, (uint64_t)"-[ACUIAppInstaller _isGreenTeaAvailable]", 125, (uint64_t)v2);
    _os_log_debug_impl(&dword_1D573D000, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"System reports having Green Tea capability as: %@\", v9, 0x1Cu);
  }
  objc_storeStrong((id *)&oslog, 0);
  return v6 & 1;
}

- (BOOL)_quicklyGenerateCachedReachabilityResultConsideringPublisherURL:(BOOL)a3
{
  NSString *v3;
  BOOL v5;
  BOOL v7;

  v7 = a3;
  v3 = -[ACUIAppDescription persistentID](self->_app, "persistentID");
  v5 = v3 != 0;

  if (v5)
  {
    if ((!v7 || self->_publisherURL) && -[ACUIAppInstaller _isGreenTeaAvailable](self, "_isGreenTeaAvailable"))
    {
      return 0;
    }
    else
    {
      -[ACUIAppInstaller _setCachedReachabilityResult:](self, "_setCachedReachabilityResult:", 1);
      return 1;
    }
  }
  else
  {
    -[ACUIAppInstaller _setCachedReachabilityResult:](self, "_setCachedReachabilityResult:", 0);
    return 1;
  }
}

- (void)_performReachabilityCheck:(id)a3
{
  NSObject *queue;
  NSString *v4;
  NSString *v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  os_log_type_t v15;
  id v16;
  id v17;
  id location[2];
  ACUIAppInstaller *v19;
  uint8_t v20[40];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = (id)objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", v19->_publisherURL);
  v16 = _ACUILogSystem();
  v15 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG))
  {
    v5 = -[NSURL absoluteString](v19->_publisherURL, "absoluteString");
    v4 = -[ACUIAppDescription name](v19->_app, "name");
    __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v20, (uint64_t)"-[ACUIAppInstaller _performReachabilityCheck:]", 152, (uint64_t)v5, (uint64_t)v4);
    _os_log_debug_impl(&dword_1D573D000, (os_log_t)v16, v15, "%s (%d) \"Contacting %@ to verify reachability of %@\", v20, 0x26u);

  }
  objc_storeStrong(&v16, 0);
  objc_initWeak(&v14, v19);
  queue = dispatch_get_global_queue(0, 0);
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __46__ACUIAppInstaller__performReachabilityCheck___block_invoke;
  v10 = &unk_1E9A15110;
  v11 = v17;
  objc_copyWeak(&v13, &v14);
  v12 = location[0];
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0);
  objc_destroyWeak(&v13);
  objc_storeStrong(&v11, 0);
  objc_destroyWeak(&v14);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __46__ACUIAppInstaller__performReachabilityCheck___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  BOOL v3;
  id v4;
  id WeakRetained;
  BOOL v7;
  os_log_type_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13[3];
  uint8_t v14[40];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13[2] = (id)a1;
  v13[1] = (id)a1;
  v13[0] = 0;
  v12 = 0;
  v1 = *(_QWORD *)(a1 + 32);
  v11 = 0;
  v10 = 0;
  v2 = (id)objc_msgSend(MEMORY[0x1E0CB39A0], "sendSynchronousRequest:returningResponse:error:", v1, &v11, &v10);
  objc_storeStrong(v13, v11);
  objc_storeStrong(&v12, v10);
  v9 = _ACUILogSystem();
  v8 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
  {
    v4 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13[0], "statusCode"));
    __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v14, (uint64_t)"-[ACUIAppInstaller _performReachabilityCheck:]_block_invoke", 160, (uint64_t)v4);
    _os_log_debug_impl(&dword_1D573D000, (os_log_t)v9, v8, "%s (%d) \"Reachability check response had HTTP status code: %@\", v14, 0x1Cu);

  }
  objc_storeStrong(&v9, 0);
  v7 = 0;
  v3 = 0;
  if (!v12)
    v3 = objc_msgSend(v13[0], "statusCode") == 200;
  v7 = v3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setCachedReachabilityResult:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong(&WeakRetained, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
}

- (BOOL)requiresReachabilityCheckToDetermineDownloadability
{
  BOOL v3;

  v3 = 0;
  if (self->_publisherURL)
    return -[ACUIAppInstaller _isGreenTeaAvailable](self, "_isGreenTeaAvailable");
  return v3;
}

- (BOOL)isDownloadable
{
  -[ACUIAppInstaller fetchDownloadability:](self, "fetchDownloadability:", &__block_literal_global, a2);
  return self->_cachedReachabilityResult;
}

- (void)fetchDownloadability:(id)a3
{
  BOOL v3;
  double v4;
  NSDate *v5;
  NSDate *dateOfLastReachabilityCheck;
  NSString *v7;
  ACUIAppInstaller *obj;
  BOOL v9;
  os_log_t oslog;
  char v11;
  id v12;
  char v13;
  id location[2];
  ACUIAppInstaller *v15;
  uint8_t v16[40];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[ACUIAppInstaller _quicklyGenerateCachedReachabilityResultConsideringPublisherURL:](v15, "_quicklyGenerateCachedReachabilityResultConsideringPublisherURL:", 1))
  {
    (*((void (**)(id, BOOL))location[0] + 2))(location[0], v15->_cachedReachabilityResult);
  }
  else
  {
    v13 = 0;
    obj = v15;
    objc_sync_enter(obj);
    v3 = v15->_dateOfLastReachabilityCheck == 0;
    v11 = 0;
    v9 = 1;
    if (!v3)
    {
      v12 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = 1;
      objc_msgSend(v12, "timeIntervalSinceDate:", v15->_dateOfLastReachabilityCheck);
      v9 = v4 > 60.0;
    }
    if ((v11 & 1) != 0)

    if (v9)
    {
      v13 = 1;
      oslog = (os_log_t)_ACUILogSystem();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v7 = -[ACUIAppDescription name](v15->_app, "name");
        __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v16, (uint64_t)"-[ACUIAppInstaller fetchDownloadability:]", 195, (uint64_t)v7);
        _os_log_impl(&dword_1D573D000, oslog, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Reachability check for app %@ hasn't been done in a while.\", v16, 0x1Cu);

      }
      objc_storeStrong((id *)&oslog, 0);
      v5 = (NSDate *)(id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
      dateOfLastReachabilityCheck = v15->_dateOfLastReachabilityCheck;
      v15->_dateOfLastReachabilityCheck = v5;

    }
    objc_sync_exit(obj);

    if ((v13 & 1) != 0)
      -[ACUIAppInstaller _performReachabilityCheck:](v15, "_performReachabilityCheck:", location[0]);
    else
      (*((void (**)(id, BOOL))location[0] + 2))(location[0], v15->_cachedReachabilityResult);
  }
  objc_storeStrong(location, 0);
}

- (void)start
{
  NSString *v2;
  ACUIAppInstallerDelegate *v3;
  id v4;
  NSString *v5;
  id v6;
  NSString *v7;
  BOOL v8;
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(_QWORD *, void *, void *);
  void *v13;
  ACUIAppInstaller *v14;
  id v15;
  os_log_type_t v16;
  id location[2];
  ACUIAppInstaller *v18;
  uint8_t v19[40];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18 = self;
  location[1] = (id)a2;
  v2 = -[ACUIAppDescription persistentID](self->_app, "persistentID");
  v8 = v2 != 0;

  if (v8)
  {
    location[0] = _ACUILogSystem();
    v16 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
    {
      v7 = -[ACUIAppDescription name](v18->_app, "name");
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v19, (uint64_t)"-[ACUIAppInstaller start]", 217, (uint64_t)v7);
      _os_log_debug_impl(&dword_1D573D000, (os_log_t)location[0], v16, "%s (%d) \"ACUIApplication %@ will begin downloading.\", v19, 0x1Cu);

    }
    objc_storeStrong(location, 0);
    v3 = -[ACUIAppInstaller delegate](v18, "delegate");
    -[ACUIAppInstallerDelegate appInstallerWillStart:](v3, "appInstallerWillStart:", v18);

    v15 = objc_alloc_init(MEMORY[0x1E0DAF530]);
    v4 = v15;
    v5 = -[ACUIAppDescription persistentID](v18->_app, "persistentID");
    objc_msgSend(v4, "setValue:forParameter:");

    v6 = v15;
    v9 = MEMORY[0x1E0C809B0];
    v10 = -1073741824;
    v11 = 0;
    v12 = __25__ACUIAppInstaller_start__block_invoke;
    v13 = &unk_1E9A15178;
    v14 = v18;
    objc_msgSend(v6, "startWithItemLookupBlock:", &v9);
    objc_storeStrong((id *)&v14, 0);
    objc_storeStrong(&v15, 0);
  }
}

void __25__ACUIAppInstaller_start__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  os_log_t oslog;
  id v19;
  uint64_t v20;
  os_log_type_t v21;
  id v22[3];
  id v23;
  os_log_type_t v24;
  id v25[2];
  id v26;
  id location[2];
  uint8_t v28[40];
  uint64_t v29;
  uint8_t v30[32];
  uint8_t v31[40];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v26 = 0;
  objc_storeStrong(&v26, a3);
  v25[1] = a1;
  if (location[0] && objc_msgSend(location[0], "count") == 1)
  {
    v25[0] = _ACUILogSystem();
    v24 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v25[0], OS_LOG_TYPE_DEBUG))
    {
      v15 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(location[0], "count"));
      v14 = (id)objc_msgSend(*(id *)(a1[4] + 8), "persistentID");
      __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v31, (uint64_t)"-[ACUIAppInstaller start]_block_invoke", 226, (uint64_t)v15, (uint64_t)v14);
      _os_log_debug_impl(&dword_1D573D000, (os_log_t)v25[0], v24, "%s (%d) \"%@ items matching PID %@ found.\", v31, 0x26u);

    }
    objc_storeStrong(v25, 0);
    v23 = (id)objc_msgSend(location[0], "objectAtIndexedSubscript:", 0);
    v10 = (id)objc_msgSend(v23, "ITunesStoreIdentifier");
    v9 = (id)objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");

    v22[2] = v11;
    v12 = (id)objc_msgSend(v23, "valueForProperty:", CFSTR("bundle-id"));
    v13 = (void *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");

    v22[1] = v13;
    v3 = SBSSpringBoardServerPort();
    MEMORY[0x1D8277138](v3, v11, v13);
    v22[0] = _ACUILogSystem();
    v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v22[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v30, (uint64_t)"-[ACUIAppInstaller start]_block_invoke", 237);
      _os_log_impl(&dword_1D573D000, (os_log_t)v22[0], v21, "%s (%d) \"Suspending current application to begin app install!\", v30, 0x12u);
    }
    objc_storeStrong(v22, 0);
    v6 = (id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    objc_msgSend(v6, "suspend");

    v4 = objc_alloc(MEMORY[0x1E0DAF5D0]);
    v20 = objc_msgSend(v4, "initWithItem:", v23);
    v7 = objc_alloc(MEMORY[0x1E0DAF5D8]);
    v29 = v20;
    v8 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v19 = (id)objc_msgSend(v7, "initWithPurchases:");

    objc_msgSend(v19, "start");
    objc_storeStrong(&v19, 0);
    objc_storeStrong((id *)&v20, 0);
    objc_storeStrong(&v23, 0);
  }
  else
  {
    oslog = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v5 = (id)objc_msgSend(*(id *)(a1[4] + 8), "persistentID");
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v28, (uint64_t)"-[ACUIAppInstaller start]_block_invoke", 245, (uint64_t)v5);
      _os_log_error_impl(&dword_1D573D000, oslog, OS_LOG_TYPE_ERROR, "%s (%d) \"SS lookup failed to find an item for the app with PID: %@\", v28, 0x1Cu);

    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (void)_setAvailableInStoreResult:(BOOL)a3
{
  ACUIAppInstallerDelegate *v3;
  char v4;
  char v5;
  ACUIAppInstallerDelegate *v6;
  BOOL v7;

  v7 = a3 != self->_availableInStoreResult;
  self->_availableInStoreResult = a3;
  self->_needsAvailableInStoreCheck = 0;
  v5 = 0;
  v4 = 0;
  if (v7)
  {
    v6 = -[ACUIAppInstaller delegate](self, "delegate");
    v5 = 1;
    v4 = objc_opt_respondsToSelector();
  }
  if ((v5 & 1) != 0)

  if ((v4 & 1) != 0)
  {
    v3 = -[ACUIAppInstaller delegate](self, "delegate");
    -[ACUIAppInstallerDelegate appIsAvailableInStoreDidChange:](v3, "appIsAvailableInStoreDidChange:", self);

  }
}

- (void)_performAvailabilityCheck:(id)a3
{
  id v3;
  id v4;
  NSString *v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  id v12;
  id from;
  id v14;
  id location[2];
  ACUIAppInstaller *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = objc_alloc_init(MEMORY[0x1E0DAF550]);
  v5 = -[ACUIAppDescription bundleID](v16->_app, "bundleID");
  v17[0] = v5;
  v4 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  objc_msgSend(v14, "setValue:forRequestParameter:");

  objc_msgSend(v14, "setKeyProfile:", *MEMORY[0x1E0DAFA90]);
  objc_msgSend(v14, "setLocalizationStyle:", 0);
  objc_initWeak(&from, v16);
  v3 = v14;
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __46__ACUIAppInstaller__performAvailabilityCheck___block_invoke;
  v10 = &unk_1E9A151A0;
  objc_copyWeak(&v12, &from);
  v11 = location[0];
  objc_msgSend(v3, "startWithLookupBlock:", &v6);
  objc_storeStrong(&v11, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __46__ACUIAppInstaller__performAvailabilityCheck___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v5;
  id WeakRetained;
  char v7;
  id v8;
  char v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v13 = 0;
  objc_storeStrong(&v13, a3);
  v12 = a1;
  v11 = 0;
  v9 = 0;
  v7 = 0;
  v5 = 0;
  if (!v13)
  {
    v5 = 0;
    if (location[0])
    {
      v10 = (id)objc_msgSend(location[0], "allItems");
      v9 = 1;
      v5 = 0;
      if (v10)
      {
        v8 = (id)objc_msgSend(location[0], "allItems");
        v7 = 1;
        v5 = objc_msgSend(v8, "count") != 0;
      }
    }
  }
  if ((v7 & 1) != 0)

  if ((v9 & 1) != 0)
  if (v5)
    v11 = 1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setAvailableInStoreResult:", v11 & 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_storeStrong(&WeakRetained, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isAvailableInStore
{
  -[ACUIAppInstaller checkAvailabilityInStore:](self, "checkAvailabilityInStore:", &__block_literal_global_25, a2);
  return self->_availableInStoreResult;
}

- (void)checkAvailabilityInStore:(id)a3
{
  id location[2];
  ACUIAppInstaller *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_needsAvailableInStoreCheck)
    -[ACUIAppInstaller _performAvailabilityCheck:](v4, "_performAvailabilityCheck:", location[0]);
  else
    (*((void (**)(id, BOOL))location[0] + 2))(location[0], v4->_availableInStoreResult);
  objc_storeStrong(location, 0);
}

+ (id)currentStoreFront
{
  uint64_t v2;
  id v3;
  id v4;
  id v6;
  id v7;
  id v8;
  os_log_t oslog;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id location[3];
  uint8_t v14[40];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  v8 = (id)objc_msgSend(MEMORY[0x1E0DAF4A0], "currentDevice");
  v12 = (id)objc_msgSend(v8, "storeFrontIdentifier");

  if (v12)
  {
    v7 = (id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("-,"));
    v10 = objc_msgSend(v12, "rangeOfCharacterFromSet:");
    v11 = v2;

    if (v11)
    {
      v3 = (id)objc_msgSend(v12, "substringToIndex:", v10);
      v4 = location[0];
      location[0] = v3;

    }
    else
    {
      objc_storeStrong(location, v12);
    }
  }
  oslog = (os_log_t)_ACUILogSystem();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v14, (uint64_t)"+[ACUIAppInstaller currentStoreFront]", 316, (uint64_t)v12, (uint64_t)location[0]);
    _os_log_debug_impl(&dword_1D573D000, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"ACUIAppInstaller currentStoreFront started with identifier '%@' and is returning storeFront '%@'\", v14, 0x26u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v6 = location[0];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (NSURL)publisherURL
{
  return self->_publisherURL;
}

- (void)setPublisherURL:(id)a3
{
  objc_storeStrong((id *)&self->_publisherURL, a3);
}

- (ACUIAppInstallerDelegate)delegate
{
  return (ACUIAppInstallerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_publisherURL, 0);
  objc_storeStrong((id *)&self->_dateOfLastInstallationCheck, 0);
  objc_storeStrong((id *)&self->_dateOfLastReachabilityCheck, 0);
  objc_storeStrong((id *)&self->_app, 0);
}

@end
