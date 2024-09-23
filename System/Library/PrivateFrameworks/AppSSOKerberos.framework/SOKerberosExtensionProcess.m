@implementation SOKerberosExtensionProcess

- (SOKerberosExtensionProcess)init
{
  SOKerberosExtensionProcess *v2;
  uint64_t v3;
  NSMutableDictionary *kerberosByRealm;
  uint64_t v5;
  NSMapTable *requestContextMapping;
  SOKerberosHelper *v7;
  SOKerberosHelper *kerberosHelper;
  SOKeychainHelper *v9;
  SOKeychainHelper *keychainHelper;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SOKerberosExtensionProcess;
  v2 = -[SOKerberosExtensionProcess init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    kerberosByRealm = v2->_kerberosByRealm;
    v2->_kerberosByRealm = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    requestContextMapping = v2->_requestContextMapping;
    v2->_requestContextMapping = (NSMapTable *)v5;

    v7 = objc_alloc_init(SOKerberosHelper);
    kerberosHelper = v2->_kerberosHelper;
    v2->_kerberosHelper = v7;

    v9 = objc_alloc_init(SOKeychainHelper);
    keychainHelper = v2->_keychainHelper;
    v2->_keychainHelper = v9;

  }
  return v2;
}

- (void)handleMigration
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SOKerberosExtensionProcess_handleMigration__block_invoke;
  block[3] = &unk_24D3EC258;
  block[4] = self;
  if (handleMigration_onceToken != -1)
    dispatch_once(&handleMigration_onceToken, block);
}

void __45__SOKerberosExtensionProcess_handleMigration__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.AppSSOKerberos.version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "intValue");
  else
    v5 = 0xFFFFFFFFLL;
  SO_LOG_SOKerberosExtensionProcess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __45__SOKerberosExtensionProcess_handleMigration__block_invoke_cold_1(a1, v5, v6);

  if ((int)v5 <= 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeSettingFile:", v5);
    objc_msgSend(v2, "setObject:forKey:", &unk_24D3F2D00, CFSTR("com.apple.AppSSOKerberos.version"));
  }

}

- (void)removeSettingFile:(int)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (a3 <= 0)
  {
    SO_LOG_SOKerberosExtensionProcess();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[SOKerberosExtensionProcess removeSettingFile:].cold.1((uint64_t)self, v4, v5);

    +[SOKerberosFileManager documentsDirectoryURLForFileName:](SOKerberosFileManager, "documentsDirectoryURLForFileName:", CFSTR("realmSettings.plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeItemAtURL:error:", v6, 0);

  }
}

- (void)beginAuthorizationWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  int v10;
  SOKerberosExtensionProcess *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  int v25;
  void *v26;
  _Unwind_Exception *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v4 = a3;
  SO_LOG_SOKerberosExtensionProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess beginAuthorizationWithRequest:].cold.3(v4, v5);

  -[SOKerberosExtensionProcess handleMigration](self, "handleMigration");
  objc_msgSend(v4, "requestedOperation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("logout")))
  {
    objc_msgSend(v4, "requestedOperation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v8 = (_QWORD *)getASAuthorizationOperationLogoutSymbolLoc_ptr;
    v31 = getASAuthorizationOperationLogoutSymbolLoc_ptr;
    if (!getASAuthorizationOperationLogoutSymbolLoc_ptr)
    {
      v9 = (void *)AuthenticationServicesLibrary();
      v8 = dlsym(v9, "ASAuthorizationOperationLogout");
      v29[3] = (uint64_t)v8;
      getASAuthorizationOperationLogoutSymbolLoc_ptr = (uint64_t)v8;
    }
    _Block_object_dispose(&v28, 8);
    if (v8)
    {
      v10 = objc_msgSend(v7, "isEqualToString:", *v8, v28);

      if (v10)
        goto LABEL_9;
      objc_msgSend(v4, "requestedOperation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("get_site_code"));

      if (v15)
      {
        -[SOKerberosExtensionProcess handleGetSiteCode:](self, "handleGetSiteCode:", v4);
        goto LABEL_11;
      }
      objc_msgSend(v4, "requestedOperation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("remove_realm"));

      if (v17)
      {
        -[SOKerberosExtensionProcess handleRemoveRealm:](self, "handleRemoveRealm:", v4);
        goto LABEL_11;
      }
      objc_msgSend(v4, "requestedOperation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("reset_keychain_preference"));

      if (v19)
      {
        -[SOKerberosExtensionProcess handleResetKeychainChoice:](self, "handleResetKeychainChoice:", v4);
        goto LABEL_11;
      }
      objc_msgSend(v4, "requestedOperation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("get_realm_info"));

      if (v21)
      {
        -[SOKerberosExtensionProcess handleGetRealmInfo:](self, "handleGetRealmInfo:", v4);
        goto LABEL_11;
      }
      objc_msgSend(v4, "requestedOperation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v29 = &v28;
      v30 = 0x2020000000;
      v23 = (_QWORD *)getASAuthorizationProviderAuthorizationOperationConfigurationRemovedSymbolLoc_ptr;
      v31 = getASAuthorizationProviderAuthorizationOperationConfigurationRemovedSymbolLoc_ptr;
      if (!getASAuthorizationProviderAuthorizationOperationConfigurationRemovedSymbolLoc_ptr)
      {
        v24 = (void *)AuthenticationServicesLibrary();
        v23 = dlsym(v24, "ASAuthorizationProviderAuthorizationOperationConfigurationRemoved");
        v29[3] = (uint64_t)v23;
        getASAuthorizationProviderAuthorizationOperationConfigurationRemovedSymbolLoc_ptr = (uint64_t)v23;
      }
      _Block_object_dispose(&v28, 8);
      if (v23)
      {
        v25 = objc_msgSend(v22, "isEqualToString:", *v23, v28);

        if (!v25)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "invalidKerberosOperation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "completeWithError:", v26);

          goto LABEL_11;
        }
        v11 = self;
        v12 = v4;
        v13 = 1;
        goto LABEL_10;
      }
    }
    else
    {
      -[SOKerberosExtensionProcess beginAuthorizationWithRequest:].cold.1();
    }
    v27 = (_Unwind_Exception *)-[SOKerberosExtensionProcess beginAuthorizationWithRequest:].cold.1();
    _Block_object_dispose(&v28, 8);
    _Unwind_Resume(v27);
  }

LABEL_9:
  v11 = self;
  v12 = v4;
  v13 = 0;
LABEL_10:
  -[SOKerberosExtensionProcess handleLogout:removeRealm:](v11, "handleLogout:removeRealm:", v12, v13);
LABEL_11:

}

- (void)cancelAuthorizationWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  SO_LOG_SOKerberosExtensionProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess cancelAuthorizationWithRequest:].cold.3();

  SO_LOG_SOKerberosExtensionProcess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess cancelAuthorizationWithRequest:].cold.2(self);

  -[SOKerberosExtensionProcess requestContextMapping](self, "requestContextMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    SO_LOG_SOKerberosExtensionProcess();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SOKerberosExtensionProcess cancelAuthorizationWithRequest:].cold.1();

    objc_msgSend(v8, "cancelRequest:", 1);
  }

}

- (void)handleKerberosOperations:(id)a3 andDelegate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  SOKerberosAuthentication *v14;
  void *v15;
  void *v16;
  SOKerberosAuthentication *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  dispatch_time_t v28;
  intptr_t v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;

  v6 = a3;
  v7 = a4;
  SO_LOG_SOKerberosExtensionProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:].cold.5(v6);

  -[SOKerberosExtensionProcess kerberosByRealm](self, "kerberosByRealm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "realm");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    SO_LOG_SOKerberosExtensionProcess();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:].cold.4(v6);

    v14 = [SOKerberosAuthentication alloc];
    objc_msgSend(v6, "realm");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uppercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SOKerberosAuthentication initWithRealm:](v14, "initWithRealm:", v16);
    -[SOKerberosExtensionProcess kerberosByRealm](self, "kerberosByRealm");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "realm");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uppercaseString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v20);

  }
  -[SOKerberosExtensionProcess createContextForRequest:](self, "createContextForRequest:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SOKerberosExtensionProcess checkSourceAppACLWithContext:](self, "checkSourceAppACLWithContext:", v21))
  {
    objc_msgSend(v21, "extensionData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "usePlatformSSOTGT"))
    {
      objc_msgSend(v21, "currentSettings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v23, "platformSSOLoginInProgress") & 1) != 0)
      {
        objc_msgSend(v21, "currentSettings");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "platformSSOLoginSemaphore");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
          goto LABEL_20;
        objc_msgSend(v21, "currentSettings");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "platformSSOLoginSemaphore");
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = dispatch_time(0, 120000000000);
        v29 = dispatch_semaphore_wait(v27, v28);

        if (!v29)
        {
LABEL_20:
          if (objc_msgSend(v21, "forceLoginViewController"))
          {
            SO_LOG_SOKerberosExtensionProcess();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:].cold.1(v6);

            objc_msgSend(v7, "handleResult:context:error:", 2, v21, 0);
          }
          else
          {
            -[SOKerberosExtensionProcess attemptKerberosWithContext:andDelegate:](self, "attemptKerberosWithContext:andDelegate:", v21, v7);
          }
          goto LABEL_25;
        }
        SO_LOG_SOKerberosExtensionProcess();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:].cold.2(v6);

        objc_msgSend(v21, "currentSettings");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setPlatformSSOLoginInProgress:", 0);
      }
      else
      {

      }
    }

    goto LABEL_20;
  }
  SO_LOG_SOKerberosExtensionProcess();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:].cold.3();

  objc_msgSend(v21, "completeRequestWithDoNotHandle");
LABEL_25:

}

- (void)handleGetSiteCode:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  SOKerberosAuthentication *v11;
  void *v12;
  void *v13;
  SOKerberosAuthentication *v14;
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
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  dispatch_time_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  int v34;
  SOKerberosRealmSettings *v35;
  void *v36;
  SOKerberosRealmSettings *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __CFString *v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  void *v64;
  const __CFString *v65;
  NSObject *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOKerberosExtensionProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess handleGetSiteCode:].cold.6(v4);

  -[SOKerberosExtensionProcess kerberosByRealm](self, "kerberosByRealm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "realm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uppercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    SO_LOG_SOKerberosExtensionProcess();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:].cold.4(v4);

    v11 = [SOKerberosAuthentication alloc];
    objc_msgSend(v4, "realm");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uppercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SOKerberosAuthentication initWithRealm:](v11, "initWithRealm:", v13);
    -[SOKerberosExtensionProcess kerberosByRealm](self, "kerberosByRealm");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "realm");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uppercaseString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v17);

  }
  -[SOKerberosExtensionProcess kerberosByRealm](self, "kerberosByRealm");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "realm");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "uppercaseString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[SOKerberosExtensionProcess createContextForRequest:](self, "createContextForRequest:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "extensionData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = objc_msgSend(v23, "useSiteAutoDiscovery");

  if ((_DWORD)v19)
  {
    objc_msgSend(v22, "networkIdentity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "determineNetworkFingerprint");

    objc_msgSend(v4, "httpHeaders");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", CFSTR("force"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("1"));

    if (v27)
    {
      SO_LOG_SOKerberosExtensionProcess();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[SOKerberosExtensionProcess handleGetSiteCode:].cold.4();

      v29 = dispatch_group_create();
      objc_msgSend(v21, "determineSiteCodeUsingContext:", v22);
      v30 = dispatch_time(0, 15000000000);
      if (dispatch_group_wait(v29, v30) >= 1)
      {
        SO_LOG_SOKerberosExtensionProcess();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          -[SOKerberosExtensionProcess handleGetSiteCode:].cold.3();

      }
    }
    objc_msgSend(v4, "httpHeaders");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKey:", CFSTR("verbose"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("1"));

    if (v34)
    {
      v56 = v22;
      v35 = [SOKerberosRealmSettings alloc];
      objc_msgSend(v4, "realm");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[SOKerberosRealmSettings initWithRealm:](v35, "initWithRealm:", v36);

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      -[SOKerberosRealmSettings dumpSiteCodeCache](v37, "dumpSiteCodeCache");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v58;
        v42 = &stru_24D3EC758;
        v43 = &stru_24D3EC758;
        do
        {
          v44 = 0;
          v45 = v43;
          do
          {
            if (*(_QWORD *)v58 != v41)
              objc_enumerationMutation(v38);
            objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * v44), "description", v56);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString stringByAppendingString:](v42, "stringByAppendingString:", v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSObject stringByAppendingString:](v45, "stringByAppendingString:", v47);
            v43 = objc_claimAutoreleasedReturnValue();

            ++v44;
            v42 = CFSTR("\n");
            v45 = v43;
          }
          while (v40 != v44);
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
          v42 = CFSTR("\n");
        }
        while (v40);
      }
      else
      {
        v43 = &stru_24D3EC758;
      }

      v65 = CFSTR("site_code_cache");
      v66 = v43;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "completeWithHTTPAuthorizationHeaders:", v54);

      SO_LOG_SOKerberosExtensionProcess();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        -[SOKerberosExtensionProcess handleGetSiteCode:].cold.1();

      v22 = v56;
      goto LABEL_36;
    }
    objc_msgSend(v4, "callerBundleIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "networkIdentity");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "networkFingerprint");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "retrieveCachedSiteCodeFromCacheForBundleIdentifier:networkFingerprint:", v48, v50);
    v37 = (SOKerberosRealmSettings *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v22, "siteCode");
    v37 = (SOKerberosRealmSettings *)objc_claimAutoreleasedReturnValue();
  }
  -[SOKerberosRealmSettings code](v37, "code");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    v63 = CFSTR("site_code");
    -[SOKerberosRealmSettings code](v37, "code");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v52;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "completeWithHTTPAuthorizationHeaders:", v53);

  }
  else
  {
    v61 = CFSTR("site_code");
    v62 = CFSTR("no site code");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "completeWithHTTPAuthorizationHeaders:", v52);
  }

  SO_LOG_SOKerberosExtensionProcess();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess handleGetSiteCode:].cold.1();
LABEL_36:

}

- (void)handleRemoveRealm:(id)a3
{
  id v3;
  NSObject *v4;
  SOKerberosRealmSettings *v5;
  void *v6;
  SOKerberosRealmSettings *v7;
  NSObject *v8;

  v3 = a3;
  SO_LOG_SOKerberosExtensionProcess();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess handleRemoveRealm:].cold.2(v3);

  v5 = [SOKerberosRealmSettings alloc];
  objc_msgSend(v3, "realm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SOKerberosRealmSettings initWithRealm:](v5, "initWithRealm:", v6);
  -[SOKerberosRealmSettings removeAllValues](v7, "removeAllValues");

  objc_msgSend(v3, "complete");
  SO_LOG_SOKerberosExtensionProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess handleRemoveRealm:].cold.1();

}

- (void)handleLogoutWithContext:(id)a3 removeRealm:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
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
  void *v20;
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
  NSObject *v34;
  void *v35;
  void *v36;
  BOOL v37;
  id v38;
  NSObject *v39;
  id v40;

  v4 = a4;
  v6 = a3;
  objc_sync_enter(0);
  objc_msgSend(v6, "impersonationBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v6, "impersonationBundleIdentifier");
  else
    objc_msgSend(v6, "callerBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HeimCredSetImpersonateBundle();

  -[SOKerberosExtensionProcess kerberosHelper](self, "kerberosHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "credentialUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destroyCredential:", v10);

  HeimCredSetImpersonateBundle();
  objc_sync_exit(0);
  objc_msgSend(v6, "currentSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserPrincipalName:", 0);

  objc_msgSend(v6, "currentSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUserName:", 0);

  objc_msgSend(v6, "setCredentialUUID:", 0);
  objc_msgSend(v6, "setUserNameIsReadOnly:", 0);
  objc_msgSend(v6, "setUserName:", 0);
  objc_msgSend(v6, "currentSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCredentialUUID:", 0);

  objc_msgSend(v6, "currentSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPkinitPersistientRef:", 0);

  objc_msgSend(v6, "currentSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSmartCardTokenID:", 0);

  objc_msgSend(v6, "currentSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDateLastLogin:", 0);

  objc_msgSend(v6, "currentSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDateNextPacRefresh:", 0);

  objc_msgSend(v6, "currentSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDatePasswordLastChangedAtLogin:", 0);

  objc_msgSend(v6, "currentSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDatePasswordLastChanged:", 0);

  objc_msgSend(v6, "currentSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDatePasswordExpires:", 0);

  objc_msgSend(v6, "currentSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPasswordNeverExpires:", 0);

  objc_msgSend(v6, "currentSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNetworkHomeDirectory:", 0);

  objc_msgSend(v6, "currentSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDateADPasswordCanChange:", 0);

  objc_msgSend(v6, "currentSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDateLocalPasswordLastChanged:", 0);

  objc_msgSend(v6, "currentSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDateExpirationChecked:", 0);

  objc_msgSend(v6, "currentSettings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDateExpirationNotificationSent:", 0);

  objc_msgSend(v6, "currentSettings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setUserCancelledLogin:", 0);

  objc_msgSend(v6, "currentSettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDateLoginCancelled:", 0);

  objc_msgSend(v6, "currentSettings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPasswordChangeInProgress:", 0);

  -[SOKerberosExtensionProcess keychainHelper](self, "keychainHelper");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "removeCredentialsFromKeychainWithService:", v31);

  objc_msgSend(v6, "extensionUserData");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setUserSetKeychainChoice:", 0);

  objc_msgSend(v6, "extensionUserData");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setUseKeychain:", 1);

  if (v4)
  {
    SO_LOG_SOKerberosExtensionProcess();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      -[SOKerberosExtensionProcess handleLogoutWithContext:removeRealm:].cold.2(v6);

    objc_msgSend(v6, "currentSettings");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "removeAllValues");

    objc_msgSend(v6, "realm");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v37 = +[SOKerberosHeimdalPluginSettings deleteSettingsForRealm:error:](SOKerberosHeimdalPluginSettings, "deleteSettingsForRealm:error:", v36, &v40);
    v38 = v40;

    if (!v37)
    {
      SO_LOG_SOKerberosExtensionProcess();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[SOKerberosExtensionProcess handleLogoutWithContext:removeRealm:].cold.1();

    }
  }
  else
  {
    +[SOKerberosAuthentication saveValuesForPlugins:](SOKerberosAuthentication, "saveValuesForPlugins:", v6);
  }

}

- (void)handleLogout:(id)a3 removeRealm:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;

  v4 = a4;
  v6 = a3;
  SO_LOG_SOKerberosExtensionProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess handleLogout:removeRealm:].cold.3(v6, v4, v7);

  -[SOKerberosExtensionProcess createContextForRequest:](self, "createContextForRequest:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SOKerberosExtensionProcess checkSourceAppACLWithContext:](self, "checkSourceAppACLWithContext:", v8))
  {
    -[SOKerberosExtensionProcess handleLogoutWithContext:removeRealm:](self, "handleLogoutWithContext:removeRealm:", v8, v4);
    objc_msgSend(v8, "completeRequest");
    SO_LOG_SOKerberosExtensionProcess();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SOKerberosExtensionProcess handleLogout:removeRealm:].cold.1();

  }
  else
  {
    SO_LOG_SOKerberosExtensionProcess();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:].cold.3();

    objc_msgSend(v8, "completeRequestWithDoNotHandle");
  }

}

- (void)destroyCredentialsWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  SO_LOG_SOKerberosExtensionProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess destroyCredentialsWithContext:].cold.4();

  if (-[SOKerberosExtensionProcess checkSourceAppACLWithContext:](self, "checkSourceAppACLWithContext:", v4))
  {
    objc_msgSend(v4, "credentialUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "credentialUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      SO_LOG_SOKerberosExtensionProcess();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[SOKerberosExtensionProcess destroyCredentialsWithContext:].cold.2();

      objc_sync_enter(0);
      objc_msgSend(v4, "impersonationBundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        objc_msgSend(v4, "impersonationBundleIdentifier");
      else
        objc_msgSend(v4, "callerBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HeimCredSetImpersonateBundle();

      -[SOKerberosExtensionProcess kerberosHelper](self, "kerberosHelper");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "credentialUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "destroyCredential:", v21);

      HeimCredSetImpersonateBundle();
      objc_sync_exit(0);

    }
    else
    {
      objc_msgSend(v4, "userPrincipalName");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        objc_msgSend(v4, "userPrincipalName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", &stru_24D3EC758);

        if ((v16 & 1) == 0)
        {
          SO_LOG_SOKerberosExtensionProcess();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            -[SOKerberosExtensionProcess destroyCredentialsWithContext:].cold.1(v4);

          objc_sync_enter(0);
          objc_msgSend(v4, "impersonationBundleIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
            objc_msgSend(v4, "impersonationBundleIdentifier");
          else
            objc_msgSend(v4, "callerBundleIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          HeimCredSetImpersonateBundle();

          -[SOKerberosExtensionProcess kerberosHelper](self, "kerberosHelper");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "userPrincipalName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "destroyCredentialForUPN:", v23);

          HeimCredSetImpersonateBundle();
          objc_sync_exit(0);
        }
      }
    }
  }
  else
  {
    SO_LOG_SOKerberosExtensionProcess();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SOKerberosExtensionProcess destroyCredentialsWithContext:].cold.3();

    objc_msgSend(v4, "completeRequestWithDoNotHandle");
  }

}

- (void)handleResetKeychainChoice:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v3 = a3;
  SO_LOG_SOKerberosExtensionProcess();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess handleResetKeychainChoice:].cold.2(v3);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("useKeychain"));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("userSetKeychainChoice"));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("rememberKeychainChoice"));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronize");

  objc_msgSend(v3, "complete");
  SO_LOG_SOKerberosExtensionProcess();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess handleResetKeychainChoice:].cold.1();

}

- (void)handleGetRealmInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  SOKerberosAuthentication *v14;
  void *v15;
  void *v16;
  SOKerberosAuthentication *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;

  v4 = a3;
  SO_LOG_SOKerberosExtensionProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess handleGetRealmInfo:].cold.4(v4);

  objc_msgSend(v4, "httpHeaders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("verbose"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("1"));

  -[SOKerberosExtensionProcess kerberosByRealm](self, "kerberosByRealm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "realm");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    SO_LOG_SOKerberosExtensionProcess();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:].cold.4(v4);

    v14 = [SOKerberosAuthentication alloc];
    objc_msgSend(v4, "realm");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uppercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SOKerberosAuthentication initWithRealm:](v14, "initWithRealm:", v16);
    -[SOKerberosExtensionProcess kerberosByRealm](self, "kerberosByRealm");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "realm");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uppercaseString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v20);

  }
  -[SOKerberosExtensionProcess createContextForRequest:](self, "createContextForRequest:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "extensionData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "useSiteAutoDiscovery");

  if (v23)
  {
    objc_msgSend(v21, "networkIdentity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "determineNetworkFingerprint");

  }
  -[SOKerberosExtensionProcess settingsForContext:includeSiteCodeCache:](self, "settingsForContext:includeSiteCodeCache:", v21, v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  SO_LOG_SOKerberosExtensionProcess();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess handleGetRealmInfo:].cold.2();

  objc_msgSend(v4, "completeWithHTTPAuthorizationHeaders:", v25);
  SO_LOG_SOKerberosExtensionProcess();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess handleGetRealmInfo:].cold.1();

}

- (id)settingsForContext:(id)a3 includeSiteCodeCache:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SOKerberosRealmSettings *v7;
  void *v8;
  SOKerberosRealmSettings *v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
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
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __CFString *v38;
  __CFString *v39;
  uint64_t v40;
  __CFString *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  void *v65;
  id v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint64_t v73;

  v4 = a4;
  v73 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = [SOKerberosRealmSettings alloc];
  objc_msgSend(v6, "realm");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SOKerberosRealmSettings initWithRealm:](v7, "initWithRealm:", v8);

  -[SOKerberosExtensionProcess kerberosByRealm](self, "kerberosByRealm");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "realm");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uppercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v12);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_new();
  objc_msgSend(v6, "realm");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v6, "realm");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("realm"));

  }
  -[SOKerberosRealmSettings userPrincipalName](v9, "userPrincipalName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SOKerberosRealmSettings userPrincipalName](v9, "userPrincipalName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("upn"));

  }
  -[SOKerberosRealmSettings userName](v9, "userName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[SOKerberosRealmSettings userName](v9, "userName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("user_name"));

  }
  -[SOKerberosRealmSettings credentialUUID](v9, "credentialUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[SOKerberosRealmSettings credentialUUID](v9, "credentialUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, CFSTR("gss_cred_uuid"));

  }
  objc_msgSend(v6, "extensionData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "useSiteAutoDiscovery");

  if (v24)
  {
    objc_msgSend(v6, "callerBundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "networkIdentity");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "networkFingerprint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "retrieveCachedSiteCodeFromCacheForBundleIdentifier:networkFingerprint:", v25, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "code");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v28, "code");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v30, CFSTR("site_code"));

      if (!v4)
        goto LABEL_27;
    }
    else
    {
      objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("no site code"), CFSTR("site_code"));
      if (!v4)
      {
LABEL_27:

        goto LABEL_28;
      }
    }
    v65 = v28;
    v66 = v6;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    -[SOKerberosRealmSettings dumpSiteCodeCache](v9, "dumpSiteCodeCache");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v69;
      v38 = &stru_24D3EC758;
      v39 = &stru_24D3EC758;
      do
      {
        v40 = 0;
        v41 = v38;
        do
        {
          if (*(_QWORD *)v69 != v37)
            objc_enumerationMutation(v34);
          objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * v40), "description");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v39, "stringByAppendingString:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          -[__CFString stringByAppendingString:](v41, "stringByAppendingString:", v43);
          v38 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v40;
          v41 = v38;
          v39 = CFSTR("\n");
        }
        while (v36 != v40);
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
        v39 = CFSTR("\n");
      }
      while (v36);
    }
    else
    {
      v38 = &stru_24D3EC758;
    }

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v38, CFSTR("site_code_cache"));
    v28 = v65;
    v6 = v66;
    goto LABEL_27;
  }
  objc_msgSend(v6, "siteCode");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v6, "siteCode");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "code");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v33, CFSTR("site_code"));

  }
  else
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("no site code"), CFSTR("site_code"));
  }
LABEL_28:
  v44 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  objc_msgSend(v44, "setFormatOptions:", 1907);
  -[SOKerberosRealmSettings dateLastLogin](v9, "dateLastLogin");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[SOKerberosRealmSettings dateLastLogin](v9, "dateLastLogin");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringFromDate:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v47, CFSTR("login_date"));
  }
  -[SOKerberosRealmSettings datePasswordLastChanged](v9, "datePasswordLastChanged");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[SOKerberosRealmSettings dateExpirationChecked](v9, "dateExpirationChecked");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      -[SOKerberosRealmSettings datePasswordLastChanged](v9, "datePasswordLastChanged");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stringFromDate:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v52, CFSTR("password_changed_date"));

    }
  }
  -[SOKerberosRealmSettings dateLocalPasswordLastChanged](v9, "dateLocalPasswordLastChanged");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    -[SOKerberosRealmSettings dateLocalPasswordLastChanged](v9, "dateLocalPasswordLastChanged");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringFromDate:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v55, CFSTR("local_password_changed_date"));

  }
  -[SOKerberosRealmSettings datePasswordExpires](v9, "datePasswordExpires");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[SOKerberosRealmSettings datePasswordExpires](v9, "datePasswordExpires");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringFromDate:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v58, CFSTR("password_expires_date"));

  }
  -[SOKerberosRealmSettings networkHomeDirectory](v9, "networkHomeDirectory");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    -[SOKerberosRealmSettings networkHomeDirectory](v9, "networkHomeDirectory");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v60, CFSTR("home_directory"));

  }
  if (-[SOKerberosRealmSettings delayUserSetupCleared](v9, "delayUserSetupCleared"))
  {
    if (-[SOKerberosRealmSettings delayUserSetupCleared](v9, "delayUserSetupCleared"))
      v61 = CFSTR("1");
    else
      v61 = CFSTR("0");
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v61, CFSTR("delayUserSetupCleared"));
  }
  if (-[SOKerberosRealmSettings networkAvailable](v9, "networkAvailable"))
  {
    if (-[SOKerberosRealmSettings networkAvailable](v9, "networkAvailable"))
      v62 = CFSTR("1");
    else
      v62 = CFSTR("0");
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v62, CFSTR("networkAvailable"));
  }
  if (-[SOKerberosRealmSettings userCancelledLogin](v9, "userCancelledLogin"))
  {
    if (-[SOKerberosRealmSettings userCancelledLogin](v9, "userCancelledLogin"))
      v63 = CFSTR("1");
    else
      v63 = CFSTR("0");
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v63, CFSTR("userCancelledLogin"));
  }

  return v13;
}

- (BOOL)checkSourceAppACLWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  NSObject *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "extensionData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "credentialBundleIdACL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    objc_msgSend(v3, "extensionData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "includeManagedAppsInBundleIdACL");

    if (!v7)
    {
LABEL_20:
      LOBYTE(v11) = 1;
      goto LABEL_25;
    }
  }
  SO_LOG_SOKerberosExtensionProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess checkSourceAppACLWithContext:].cold.3(v3, v8);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v3, "extensionData", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "credentialBundleIdACL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "callerBundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lowercaseString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v14, "isEqualToString:", v16);

        if (v17)
        {
          SO_LOG_SOKerberosExtensionProcess();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG))
            -[SOKerberosExtensionProcess checkSourceAppACLWithContext:].cold.2();

          LODWORD(v11) = 1;
          goto LABEL_18;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_18:

  objc_msgSend(v3, "extensionData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "includeManagedAppsInBundleIdACL"))
  {
    v19 = objc_msgSend(v3, "isManagedApp");

    if (((v11 | v19) & 1) != 0)
      goto LABEL_20;
  }
  else
  {

    if ((v11 & 1) != 0)
      goto LABEL_20;
  }
  SO_LOG_SOKerberosExtensionProcess();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:].cold.3();

LABEL_25:
  return v11;
}

- (id)createContextForRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  SOKerberosExtensionData *v7;
  void *v8;
  SOKerberosExtensionData *v9;
  NSObject *v10;
  SOKerberosContext *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  SOSiteCode *v15;
  void *v16;
  SOSiteCode *v17;
  SONetworkIdentity *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __SecCertificate *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  __SecIdentity *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  _Unwind_Exception *v48;
  void *v49;
  void *v50;
  char v51;
  SecCertificateRef certificateRef;
  SecCertificateRef *p_certificateRef;
  uint64_t v54;
  uint64_t v55;

  v4 = a3;
  SO_LOG_SOKerberosExtensionProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess createContextForRequest:].cold.6(v4);

  objc_msgSend(v4, "httpHeaders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [SOKerberosExtensionData alloc];
  objc_msgSend(v4, "extensionData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SOKerberosExtensionData initWithDictionary:](v7, "initWithDictionary:", v8);

  if (!v9)
  {
    SO_LOG_SOKerberosExtensionProcess();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SOKerberosExtensionProcess createContextForRequest:].cold.5(v4);

  }
  v11 = -[SOKerberosContext initWithRequest:extensionData:]([SOKerberosContext alloc], "initWithRequest:extensionData:", v4, v9);
  -[SOKerberosExtensionData siteCode](v9, "siteCode");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SOKerberosExtensionData siteCode](v9, "siteCode");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v14 != CFSTR("no site code"))
    {
      -[SOKerberosExtensionData setUseSiteAutoDiscovery:](v9, "setUseSiteAutoDiscovery:", 0);
      v15 = [SOSiteCode alloc];
      -[SOKerberosExtensionData siteCode](v9, "siteCode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SOSiteCode initWithSiteCode:forNetworkFingerprint:](v15, "initWithSiteCode:forNetworkFingerprint:", v16, CFSTR("profile"));
      -[SOKerberosContext setSiteCode:](v11, "setSiteCode:", v17);

    }
  }
  if (-[SOKerberosExtensionData useSiteAutoDiscovery](v9, "useSiteAutoDiscovery"))
  {
    v18 = [SONetworkIdentity alloc];
    objc_msgSend(v4, "realm");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uppercaseString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOKerberosContext callerBundleIdentifier](v11, "callerBundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOKerberosContext auditToken](v11, "auditToken");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[SONetworkIdentity initForRealm:bundleIdentifier:auditToken:](v18, "initForRealm:bundleIdentifier:auditToken:", v20, v21, v22);
    -[SOKerberosContext setNetworkIdentity:](v11, "setNetworkIdentity:", v23);

  }
  objc_msgSend(v4, "requestedOperation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v24, "isEqualToString:", CFSTR("login")) & 1) == 0)
  {
    objc_msgSend(v4, "requestedOperation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v25, "isEqualToString:", CFSTR("get_credential_uuid")) & 1) == 0)
    {
      objc_msgSend(v4, "requestedOperation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v26, "isEqualToString:", CFSTR("change_password")) & 1) == 0)
      {
        objc_msgSend(v4, "requestedOperation");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        certificateRef = 0;
        p_certificateRef = &certificateRef;
        v54 = 0x2020000000;
        v28 = (__SecCertificate *)getASAuthorizationOperationLoginSymbolLoc_ptr;
        v55 = getASAuthorizationOperationLoginSymbolLoc_ptr;
        if (!getASAuthorizationOperationLoginSymbolLoc_ptr)
        {
          v29 = (void *)AuthenticationServicesLibrary();
          v28 = (__SecCertificate *)dlsym(v29, "ASAuthorizationOperationLogin");
          p_certificateRef[3] = v28;
          getASAuthorizationOperationLoginSymbolLoc_ptr = (uint64_t)v28;
        }
        _Block_object_dispose(&certificateRef, 8);
        if (!v28)
        {
          v48 = (_Unwind_Exception *)-[SOKerberosExtensionProcess beginAuthorizationWithRequest:].cold.1();
          _Block_object_dispose(&certificateRef, 8);
          _Unwind_Resume(v48);
        }
        if ((objc_msgSend(v27, "isEqualToString:", *(_QWORD *)v28) & 1) == 0)
        {
          objc_msgSend(v4, "url");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "scheme");
          v50 = v27;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "lowercaseString");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v47, "isEqualToString:", CFSTR("realm"));

          if ((v51 & 1) == 0)
            goto LABEL_27;
          goto LABEL_23;
        }

      }
    }

  }
LABEL_23:
  -[SOKerberosContext setReturnCredentialOnly:](v11, "setReturnCredentialOnly:", 1);
  objc_msgSend(v6, "objectForKey:", CFSTR("force"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("1"));

  if (v31)
    -[SOKerberosContext setForceLoginViewController:](v11, "setForceLoginViewController:", 1);
  objc_msgSend(v6, "objectForKey:", CFSTR("refresh"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("1"));

  if (v33)
    -[SOKerberosContext setRefreshCredential:](v11, "setRefreshCredential:", 1);
LABEL_27:
  -[SOKerberosExtensionProcess requestContextMapping](self, "requestContextMapping");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKey:", v11, v4);

  -[SOKerberosContext userName](v11, "userName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {

  }
  else
  {
    -[SOKerberosExtensionData certificateUUID](v9, "certificateUUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      SO_LOG_SOKerberosExtensionProcess();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        -[SOKerberosExtensionProcess createContextForRequest:].cold.3();

      -[SOKerberosExtensionProcess keychainHelper](self, "keychainHelper");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOKerberosExtensionData certificateUUID](v9, "certificateUUID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (__SecIdentity *)objc_msgSend(v39, "identityForUUIDString:", v40);

      if (v41)
      {
        certificateRef = 0;
        SecIdentityCopyCertificate(v41, &certificateRef);
        if (certificateRef)
        {
          v42 = (void *)SecCertificateCopyNTPrincipalNames();
          if (objc_msgSend(v42, "count"))
          {
            objc_msgSend(v42, "objectAtIndex:", 0);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[SOKerberosContext setUserName:](v11, "setUserName:", v43);
            SO_LOG_SOKerberosExtensionProcess();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              -[SOKerberosExtensionProcess createContextForRequest:].cold.2();

          }
          CFRelease(certificateRef);

        }
        CFRelease(v41);
      }
      else
      {
        SO_LOG_SOKerberosExtensionProcess();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          -[SOKerberosExtensionProcess createContextForRequest:].cold.1();

      }
    }
  }

  return v11;
}

- (void)attemptKerberosWithContext:(id)a3 andDelegate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  id v32;

  v6 = a3;
  v7 = a4;
  SO_LOG_SOKerberosExtensionProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess attemptKerberosWithContext:andDelegate:].cold.9();

  if ((objc_msgSend(v6, "requestCancelled") & 1) == 0)
  {
    if (-[SOKerberosExtensionProcess checkSourceAppACLWithContext:](self, "checkSourceAppACLWithContext:", v6))
    {
      objc_msgSend(v6, "userPrincipalName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v6, "hostName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("HTTP@%@"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setServicePrincipalName:", v12);

        -[SOKerberosExtensionProcess kerberosByRealm](self, "kerberosByRealm");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "realm");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uppercaseString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = 0;
        v32 = 0;
        v17 = objc_msgSend(v16, "attemptKerberosWithContext:returningToken:orError:", v6, &v32, &v31);
        v18 = v32;
        v19 = v31;
        switch(v17)
        {
          case 0:
            SO_LOG_SOKerberosExtensionProcess();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              -[SOKerberosExtensionProcess attemptKerberosWithContext:andDelegate:].cold.3();

            -[SOKerberosExtensionProcess completeRequestWithToken:andContext:](self, "completeRequestWithToken:andContext:", v18, v6);
            break;
          case 1:
          case 2:
          case 3:
          case 6:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 15:
          case 16:
          case 18:
            v20 = v7;
            v21 = v17;
            goto LABEL_8;
          case 4:
            SO_LOG_SOKerberosExtensionProcess();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              -[SOKerberosExtensionProcess attemptKerberosWithContext:andDelegate:].cold.4();

            -[SOKerberosExtensionProcess completeRequestWithHTTPResponseFromContext:](self, "completeRequestWithHTTPResponseFromContext:", v6);
            break;
          case 7:
            SO_LOG_SOKerberosExtensionProcess();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              -[SOKerberosExtensionProcess attemptKerberosWithContext:andDelegate:].cold.5(v19);

            if (objc_msgSend(v19, "code") == -116 || objc_msgSend(v19, "code") == -113)
              goto LABEL_38;
            v20 = v7;
            v21 = 7;
LABEL_8:
            objc_msgSend(v20, "handleResult:context:error:", v21, v6, v19);
            break;
          case 14:
            SO_LOG_SOKerberosExtensionProcess();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              -[SOKerberosExtensionProcess attemptKerberosWithContext:andDelegate:].cold.6(v19);

            objc_msgSend(v6, "completeRequestWithError:", v19);
            break;
          case 17:
            SO_LOG_SOKerberosExtensionProcess();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              -[SOKerberosExtensionProcess attemptKerberosWithContext:andDelegate:].cold.7(v6);

            -[SOKerberosExtensionProcess saveValuesAfterSuccessfulAuthentication:](self, "saveValuesAfterSuccessfulAuthentication:", v6);
LABEL_38:
            objc_msgSend(v6, "completeRequestWithDoNotHandle");
            break;
          default:
            SO_LOG_SOKerberosExtensionProcess();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              -[SOKerberosExtensionProcess attemptKerberosWithContext:andDelegate:].cold.2();

            objc_msgSend(MEMORY[0x24BDD1540], "unhandledKerberosResult");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            SO_LOG_SOKerberosExtensionProcess();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              -[SOKerberosExtensionProcess attemptKerberosWithContext:andDelegate:].cold.1();

            objc_msgSend(v6, "completeRequestWithError:", v26);
            break;
        }

      }
      else
      {
        objc_msgSend(v7, "handleResult:context:error:", 2, v6, 0);
      }

    }
    else
    {
      SO_LOG_SOKerberosExtensionProcess();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:].cold.3();

      objc_msgSend(v6, "completeRequestWithDoNotHandle");
    }
  }

}

- (void)completeRequestWithToken:(id)a3 andContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[SOKerberosExtensionProcess saveValuesAfterSuccessfulAuthentication:](self, "saveValuesAfterSuccessfulAuthentication:", v6);
  objc_msgSend(v7, "base64EncodedStringWithOptions:", 16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Negotiate %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SO_LOG_SOKerberosExtensionProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess completeRequestWithToken:andContext:].cold.1();

  v12 = CFSTR("Authorization");
  v13[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "completeRequestWithHeaders:", v11);

}

- (void)completeRequestWithHTTPResponseFromContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  -[SOKerberosExtensionProcess saveValuesAfterSuccessfulAuthentication:](self, "saveValuesAfterSuccessfulAuthentication:", v4);
  -[SOKerberosExtensionProcess settingsForContext:includeSiteCodeCache:](self, "settingsForContext:includeSiteCodeCache:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SO_LOG_SOKerberosExtensionProcess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SOKerberosExtensionProcess handleGetRealmInfo:].cold.2();

  objc_msgSend(v4, "completeRequestWithHTTPResponseHeaders:", v5);
}

- (void)saveValuesAfterSuccessfulAuthentication:(id)a3
{
  void *v4;
  void *v5;
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
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  objc_msgSend(v25, "credentialUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "currentSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCredentialUUID:", v4);

  objc_msgSend(v25, "userPrincipalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "currentSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserPrincipalName:", v6);

  objc_msgSend(v25, "userName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "currentSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserName:", v8);

  objc_msgSend(v25, "currentSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserCancelledLogin:", 0);

  objc_msgSend(v25, "currentSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDateLoginCancelled:", 0);

  objc_msgSend(v25, "loginTimeStamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v25, "loginTimeStamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "currentSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDateLastLogin:", v13);

  }
  objc_msgSend(v25, "currentSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDateUserSignedOut:", 0);

  objc_msgSend(v25, "currentSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelayUserSetupCleared:", 1);

  objc_msgSend(v25, "currentSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPasswordChangeInProgress:", 0);

  objc_msgSend(v25, "extensionData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "allowAutomaticLogin"))
    goto LABEL_6;
  objc_msgSend(v25, "extensionUserData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "useKeychain");

  v21 = v25;
  if (v20)
  {
    objc_msgSend(v25, "pkinitPersistientRef");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "currentSettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPkinitPersistientRef:", v22);

    objc_msgSend(v25, "certificateTokenID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "currentSettings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSmartCardTokenID:", v18);

LABEL_6:
    v21 = v25;
  }
  -[SOKerberosExtensionProcess handleAddKeychainCreds:](self, "handleAddKeychainCreds:", v21);

}

- (void)handleAddKeychainCreds:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "extensionUserData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "useKeychain");

  objc_msgSend(v13, "extensionData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "allowAutomaticLogin");

  if ((objc_msgSend(v13, "credsCameFromKeychain") & 1) == 0 && v7 && v5)
  {
    -[SOKerberosExtensionProcess keychainHelper](self, "keychainHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "serviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userPrincipalName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "password");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "extensionData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addCredentialsToKeychainWithService:withUsername:withPassword:requireUserPresence:", v9, v10, v11, objc_msgSend(v12, "requireUserPresence"));

  }
}

- (id)mapKnownPasswordErrorToString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kGSSMinorErrorCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  SO_LOG_SOKerberosExtensionProcess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = v5;
    _os_log_impl(&dword_215A1B000, v6, OS_LOG_TYPE_DEFAULT, "Password change error code: %@", (uint8_t *)&v25, 0xCu);
  }

  SO_LOG_SOKerberosExtensionProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[SOKerberosExtensionProcess mapKnownPasswordErrorToString:].cold.1();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1765328360);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqualToNumber:", v8);

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("PASSWORD_CHANGE_PASSWORD_CHANGE_FAILED_OLD_PASSWORD_ALERT_TEXT");
LABEL_15:
    objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_24D3EC758, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1765328353);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "isEqualToNumber:", v13);

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("PASSWORD_CHANGE_PASSWORD_CHANGE_FAILED_SERVER_ALERT_TEXT");
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1765328228);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v5, "isEqualToNumber:", v15);

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("KDC_UNREACHABLE");
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1765328343);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v5, "isEqualToNumber:", v17);

  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("REALM_CASE_MISMATCH");
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1765328160);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v5, "isEqualToNumber:", v19);

  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("DEFAULT_REALM_MISSING");
    goto LABEL_15;
  }
  objc_msgSend(v3, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NSDescription"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v3, "userInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("NSDescription"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "localizedDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_16:
  return v21;
}

- (id)kerberosForRealm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  SOKerberosAuthentication *v9;
  void *v10;
  SOKerberosAuthentication *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[SOKerberosExtensionProcess kerberosByRealm](self, "kerberosByRealm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    SO_LOG_SOKerberosExtensionProcess();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[SOKerberosExtensionProcess kerberosForRealm:].cold.1();

    v9 = [SOKerberosAuthentication alloc];
    objc_msgSend(v4, "uppercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SOKerberosAuthentication initWithRealm:](v9, "initWithRealm:", v10);
    -[SOKerberosExtensionProcess kerberosByRealm](self, "kerberosByRealm");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uppercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  }
  -[SOKerberosExtensionProcess kerberosByRealm](self, "kerberosByRealm");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSMutableDictionary)kerberosByRealm
{
  return self->_kerberosByRealm;
}

- (void)setKerberosByRealm:(id)a3
{
  objc_storeStrong((id *)&self->_kerberosByRealm, a3);
}

- (NSMapTable)requestContextMapping
{
  return self->_requestContextMapping;
}

- (void)setRequestContextMapping:(id)a3
{
  objc_storeStrong((id *)&self->_requestContextMapping, a3);
}

- (SOKerberosHelper)kerberosHelper
{
  return (SOKerberosHelper *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKerberosHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (SOKeychainHelper)keychainHelper
{
  return self->_keychainHelper;
}

- (void)setKeychainHelper:(id)a3
{
  objc_storeStrong((id *)&self->_keychainHelper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainHelper, 0);
  objc_storeStrong((id *)&self->_kerberosHelper, 0);
  objc_storeStrong((id *)&self->_requestContextMapping, 0);
  objc_storeStrong((id *)&self->_kerberosByRealm, 0);
}

void __45__SOKerberosExtensionProcess_handleMigration__block_invoke_cold_1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 136315650;
  v5 = "-[SOKerberosExtensionProcess handleMigration]_block_invoke";
  v6 = 1024;
  v7 = a2;
  v8 = 2112;
  v9 = v3;
  _os_log_debug_impl(&dword_215A1B000, log, OS_LOG_TYPE_DEBUG, "%s Stored version: %d on %@", (uint8_t *)&v4, 0x1Cu);
}

- (void)removeSettingFile:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "-[SOKerberosExtensionProcess removeSettingFile:]";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_10(&dword_215A1B000, a2, a3, "%s  on %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (uint64_t)beginAuthorizationWithRequest:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[SOKerberosExtensionProcess beginAuthorizationWithRequest:].cold.3(v0);
}

- (void)beginAuthorizationWithRequest:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "realm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "requestedOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = a1;
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_debug_impl(&dword_215A1B000, a2, OS_LOG_TYPE_DEBUG, "******************* beginAuthorizationWithRequest: %@, realm: %@, operation: %@", (uint8_t *)&v6, 0x20u);

}

- (void)cancelAuthorizationWithRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "canceling context: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)cancelAuthorizationWithRequest:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "requestContextMapping");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "count");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_215A1B000, v2, v3, "request count: %lu", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)cancelAuthorizationWithRequest:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "cancelAuthorizationWithRequest: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)handleKerberosOperations:(void *)a1 andDelegate:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "realm");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_215A1B000, v2, v3, "showing login view controller: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)handleKerberosOperations:(void *)a1 andDelegate:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "realm");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_215A1B000, v2, v3, "timeout waiting for platform sso login: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)handleKerberosOperations:andDelegate:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x24BDD1540], "sourceAppNotAllowed");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_215A1B000, v1, v2, "Result error: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_8();
}

- (void)handleKerberosOperations:(void *)a1 andDelegate:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "realm");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_215A1B000, v2, v3, "creating new kerberosAuthentication for realm: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)handleKerberosOperations:(void *)a1 andDelegate:.cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "realm");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_215A1B000, v2, v3, "handleKerberosOperations: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)handleGetSiteCode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "******************* end handleGetSiteCode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleGetSiteCode:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "timeout waiting for sitecode, proceeding", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleGetSiteCode:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "requesting a new sitecode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleGetSiteCode:(void *)a1 .cold.6(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "realm");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_215A1B000, v2, v3, "handleGetSiteCode: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)handleRemoveRealm:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "******************* end handleRemoveRealm", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleRemoveRealm:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "realm");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_215A1B000, v2, v3, "handleRemoveRealm: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)handleLogoutWithContext:removeRealm:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215A1B000, v0, v1, "error when deleting plugin settings: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)handleLogoutWithContext:(void *)a1 removeRealm:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "realm");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_215A1B000, v2, v3, "Removing Realm: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)handleLogout:removeRealm:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "******************* end handleLogout", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleLogout:(NSObject *)a3 removeRealm:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "realm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  v8 = 2112;
  v9 = v5;
  OUTLINED_FUNCTION_10(&dword_215A1B000, a3, v6, "handleLogout: %@, removeRealm: %@", v7);

  OUTLINED_FUNCTION_3_1();
}

- (void)destroyCredentialsWithContext:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "userPrincipalName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_215A1B000, v2, v3, "destroy credential with upn: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)destroyCredentialsWithContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "destroy credential with UUID: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)destroyCredentialsWithContext:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x24BDD1540], "sourceAppNotAllowed");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_215A1B000, v1, v2, "Result error: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_8();
}

- (void)destroyCredentialsWithContext:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "destroyCredentialsWithContext", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleResetKeychainChoice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "******************* end handleResetKeychainChoice", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleResetKeychainChoice:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "realm");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_215A1B000, v2, v3, "handleResetKeychainChoice: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)handleGetRealmInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "******************* end handleGetRealmInfo", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleGetRealmInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "completing request with data: %{private}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)handleGetRealmInfo:(void *)a1 .cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "realm");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_215A1B000, v2, v3, "handleGetRealmInfo: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)checkSourceAppACLWithContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "checking bundle id check passed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)checkSourceAppACLWithContext:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "callerBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "extensionData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "credentialBundleIdACL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v4;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_10(&dword_215A1B000, a2, v7, "checking bundle id: %@ is in ACL: %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_3_1();
}

- (void)createContextForRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "certificate not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)createContextForRequest:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "using principalname %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)createContextForRequest:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "retrieving principalname from certificate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)createContextForRequest:(void *)a1 .cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "extensionData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_215A1B000, v2, v3, "error deserializing extension data: %{private}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)createContextForRequest:(void *)a1 .cold.6(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "realm");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_215A1B000, v2, v3, "createContextForRequest: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)attemptKerberosWithContext:andDelegate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215A1B000, v0, v1, "Result error: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)attemptKerberosWithContext:andDelegate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215A1B000, v0, v1, "Result unhandled: %lu", v2);
  OUTLINED_FUNCTION_2();
}

- (void)attemptKerberosWithContext:andDelegate:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "Received token, completing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)attemptKerberosWithContext:andDelegate:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "Received cred UUID, completing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)attemptKerberosWithContext:(void *)a1 andDelegate:.cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_215A1B000, v2, v3, "Received error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)attemptKerberosWithContext:(void *)a1 andDelegate:.cold.6(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_215A1B000, v2, v3, "Unsupported Encryption: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)attemptKerberosWithContext:(void *)a1 andDelegate:.cold.7(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "servicePrincipalName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_215A1B000, v2, v3, "Server Principal Unknown: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)attemptKerberosWithContext:andDelegate:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "attemptKerberos", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)completeRequestWithToken:andContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "completing request with token: %{private}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)mapKnownPasswordErrorToString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215A1B000, v0, v1, "Password change error: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)kerberosForRealm:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "creating new kerberosAuthentication for realm: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

@end
