@implementation NEVPNManager

- (NEVPNManager)init
{
  __assert_rtn("-[NEVPNManager init]", "NEVPNManager.m", 119, "0");
}

- (NEVPNManager)initWithGrade:(int64_t)a3 connection:(id)a4 tunnelType:(int64_t)a5
{
  _DWORD *v9;
  NEVPNManager *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NEConfiguration *v18;
  NEConfiguration *configuration;
  NEVPN *v20;
  void *v21;
  NEVPNApp *v22;
  void *v23;
  NEVPNConnection *connection;
  objc_super v26;

  v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)NEVPNManager;
  v10 = -[NEVPNManager init](&v26, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "infoDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0C9AAC8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "infoDictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0C9AE88]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v18 = -[NEConfiguration initWithName:grade:]([NEConfiguration alloc], "initWithName:grade:", v13, a3);
    configuration = v10->_configuration;
    v10->_configuration = v18;

    if (v9 && v9[3] == 1)
    {
      v20 = objc_alloc_init(NEVPN);
      -[NEConfiguration setVPN:](v10->_configuration, "setVPN:", v20);

      -[NEConfiguration VPN](v10->_configuration, "VPN");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = objc_alloc_init(NEVPNApp);
      -[NEConfiguration setAppVPN:](v10->_configuration, "setAppVPN:", v22);

      -[NEConfiguration appVPN](v10->_configuration, "appVPN");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = v21;
    objc_msgSend(v21, "setTunnelType:", a5);

    -[NEConfiguration setApplication:](v10->_configuration, "setApplication:", v15);
    -[NEConfiguration setApplicationName:](v10->_configuration, "setApplicationName:", v13);
    objc_storeStrong((id *)&v10->_connection, a4);
    connection = v10->_connection;
    if (connection)
      objc_storeWeak((id *)&connection->_weakmanager, v10);
    *(_WORD *)&v10->_hasLoaded = 1;

  }
  return v10;
}

- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = completionHandler;
  if (v4)
  {
    +[NEVPNManager configurationManager]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__NEVPNManager_loadFromPreferencesWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E3CC46D0;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "loadConfigurationsWithCompletionQueue:handler:", MEMORY[0x1E0C80D38], v6);

  }
}

- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = completionHandler;
  -[NEVPNManager protocolConfiguration](self, "protocolConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 2)
  {
    -[NEVPNManager protocolConfiguration](self, "protocolConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v7, "userPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          if (*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12))
            SCUserPreferencesRemove();
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "setUserPreferences:", 0);
  }
  if (self)
    self->_notificationSent = 0;
  +[NEVPNManager configurationManager]();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEVPNManager configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__NEVPNManager_removeFromPreferencesWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E3CC4748;
  v16[4] = self;
  v17 = v4;
  v15 = v4;
  objc_msgSend(v13, "removeConfiguration:withCompletionQueue:handler:", v14, MEMORY[0x1E0C80D38], v16);

}

- (BOOL)isProtocolTypeValid:(int64_t)a3
{
  objc_opt_self();
  return ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 1) | g_noAppFilter & 1;
}

- (void)additionalSetup
{
  char isKindOfClass;
  void *v3;
  _QWORD *v4;
  void *v5;
  NEKeychainItem *v6;
  void *v7;
  NEKeychainItem *v8;
  id v9;
  NEKeychainItem *v10;
  uint64_t v11;
  SEL v12;
  id v13;
  NEKeychainItem *v14;
  void *v15;
  NEKeychainItem *v16;
  void *v17;
  NEKeychainItem *v18;
  id v19;
  NEKeychainItem *v20;
  uint64_t v21;
  SEL v22;
  id v23;
  NEKeychainItem *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NEKeychainItem *v29;
  uint64_t v30;
  SEL v31;
  NEKeychainItem *v32;
  _QWORD *v33;
  void *v34;
  NEKeychainItem *v35;
  void *v36;
  void *v37;
  NEKeychainItem *v38;
  id v39;
  NEKeychainItem *v40;
  uint64_t v41;
  SEL v42;
  id v43;
  NEKeychainItem *v44;
  void *v45;
  const char *v46;
  void *v47;
  void *v48;

  -[NEVPNManager protocolConfiguration](self, "protocolConfiguration");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = v48;
  if ((isKindOfClass & 1) != 0)
  {
    v4 = v48;
    objc_msgSend(v4, "setDisconnectOnWake:", 0);
    if (v4 && !v4[10])
    {
      objc_msgSend(v4, "passwordReference");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v6 = [NEKeychainItem alloc];
        objc_msgSend(v4, "passwordReference");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[NEKeychainItem initWithPersistentReference:domain:accessGroup:](v6, "initWithPersistentReference:domain:accessGroup:", v7, 1, 0);

        v9 = -[NEKeychainItem copyData](v8, "copyData");
        if (v9)
        {
          v10 = [NEKeychainItem alloc];
          v11 = v4[10];
          v13 = objc_getProperty(v4, v12, 88, 1);
          v14 = -[NEKeychainItem initWithData:domain:accessGroup:](v10, "initWithData:domain:accessGroup:", v9, v11, v13);
          objc_msgSend(v4, "setPasswordKeychainItem:", v14);

        }
      }
      objc_msgSend(v4, "sharedSecretReference");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = [NEKeychainItem alloc];
        objc_msgSend(v4, "sharedSecretReference");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[NEKeychainItem initWithPersistentReference:domain:accessGroup:](v16, "initWithPersistentReference:domain:accessGroup:", v17, 1, 0);

        v19 = -[NEKeychainItem copyData](v18, "copyData");
        if (v19)
        {
          v20 = [NEKeychainItem alloc];
          v21 = v4[10];
          v23 = objc_getProperty(v4, v22, 88, 1);
          v24 = -[NEKeychainItem initWithData:domain:accessGroup:](v20, "initWithData:domain:accessGroup:", v19, v21, v23);
          objc_msgSend(v4, "setSharedSecretKeychainItem:", v24);

        }
      }
      objc_msgSend(v4, "identityDataPassword");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v4, "identityDataPasswordKeychainItem");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v4, "identityDataPassword");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "identityDataPasswordKeychainItem");
          v28 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setPassword:", v27);
        }
        else
        {
          v29 = [NEKeychainItem alloc];
          objc_msgSend(v4, "identityDataPassword");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v4[10];
          v28 = objc_getProperty(v4, v31, 88, 1);
          v32 = -[NEKeychainItem initWithPassword:domain:accessGroup:](v29, "initWithPassword:domain:accessGroup:", v27, v30, v28);
          objc_msgSend(v4, "setIdentityDataPasswordKeychainItem:", v32);

        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = v4;
        objc_msgSend(v33, "ppkConfiguration");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          v35 = [NEKeychainItem alloc];
          objc_msgSend(v33, "ppkConfiguration");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "keychainReference");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = -[NEKeychainItem initWithPersistentReference:domain:accessGroup:](v35, "initWithPersistentReference:domain:accessGroup:", v37, 1, 0);

          v39 = -[NEKeychainItem copyData](v38, "copyData");
          if (v39)
          {
            v40 = [NEKeychainItem alloc];
            v41 = v4[10];
            v43 = objc_getProperty(v33, v42, 88, 1);
            v44 = -[NEKeychainItem initWithData:domain:accessGroup:](v40, "initWithData:domain:accessGroup:", v39, v41, v43);
            objc_msgSend(v33, "ppkConfiguration");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v45;
            if (v45)
              objc_setProperty_atomic_copy(v45, v46, v44, 32);

          }
        }

      }
    }

    v3 = v48;
  }

}

- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  NEVPNManager *v5;
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  char v16;
  uint64_t i;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *Error;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  CFErrorRef v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  const char *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  NSObject *v60;
  id v61;
  id obj;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  NSObject *oslog;
  _QWORD v68[5];
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  id v79;
  _QWORD v80[4];
  id v81;
  id v82;
  _QWORD block[4];
  id v84;
  id v85;
  _BYTE v86[128];
  uint64_t v87;
  void *v88;
  uint64_t v89;
  const __CFString *v90;
  const __CFString *v91;
  void *v92;
  uint8_t buf[4];
  void *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v4 = completionHandler;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5 || !v5->_hasLoaded)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEVPNErrorDomain"), 4, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_41;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke;
    block[3] = &unk_1E3CC46A8;
    v7 = block;
    v85 = v4;
    v6 = v6;
    v84 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_39:
    v45 = (void *)v7[5];
    goto LABEL_40;
  }
  -[NEVPNManager configuration](v5, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_37;
  -[NEVPNManager protocolConfiguration](v5, "protocolConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {

    goto LABEL_37;
  }
  -[NEVPNManager protocolConfiguration](v5, "protocolConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NEVPNManager isProtocolTypeValid:](v5, "isProtocolTypeValid:", objc_msgSend(v10, "type"));

  if (!v11)
  {
LABEL_37:
    v43 = (void *)MEMORY[0x1E0CB35C8];
    v89 = *MEMORY[0x1E0CB2D50];
    v90 = CFSTR("Missing protocol or protocol has invalid type");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "errorWithDomain:code:userInfo:", CFSTR("NEVPNErrorDomain"), 1, v44);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_41;
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_2;
    v80[3] = &unk_1E3CC46A8;
    v7 = v80;
    v82 = v4;
    v6 = v6;
    v81 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v80);

    goto LABEL_39;
  }
  -[NEVPNManager additionalSetup](v5, "additionalSetup");
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NEVPNManager configuration](v5, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "checkValidityAndCollectErrors:", v6);

  if ((v13 & 1) == 0)
  {
    if (objc_msgSend(v6, "count"))
    {
      v87 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v46;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v47 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEVPNErrorDomain"), 1, v47);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    ne_log_obj();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v94 = v45;
      _os_log_error_impl(&dword_19BD16000, v48, OS_LOG_TYPE_ERROR, "Failed to save the new configuration: %@", buf, 0xCu);
    }

    if (v4)
    {
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = 3221225472;
      v77[2] = __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_38;
      v77[3] = &unk_1E3CC46A8;
      v79 = v4;
      v78 = v45;
      dispatch_async(MEMORY[0x1E0C80D38], v77);

    }
    goto LABEL_40;
  }
  -[NEVPNManager protocolConfiguration](v5, "protocolConfiguration");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v63, "type") != 2)
    goto LABEL_53;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v61 = v63;
  objc_msgSend(v61, "userPreferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
  obj = v14;
  if (!v15)
  {

LABEL_51:
    -[NEVPNManager configuration](v5, "configuration");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[NEL2TPUserPreferences clearCurrentForConfiguration:]((uint64_t)NEL2TPUserPreferences, v49);

    goto LABEL_52;
  }
  v16 = 0;
  v65 = *(_QWORD *)v74;
  while (2)
  {
    v64 = v15;
    for (i = 0; i != v64; ++i)
    {
      if (*(_QWORD *)v74 != v65)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
      v66 = objc_msgSend(v18, "isCurrent");
      if (!v18)
        goto LABEL_69;
      objc_msgSend(v18, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19 == 0;

      if (!v20)
      {
        objc_msgSend(v18, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = SCUserPreferencesSetName() == 0;

        if (v22)
        {
          Error = SCCopyLastError();
          ne_log_obj();
          oslog = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            goto LABEL_68;
          *(_DWORD *)buf = 138412290;
          v94 = Error;
          v55 = "Failed to set the user preferences name: %@";
LABEL_64:
          _os_log_error_impl(&dword_19BD16000, oslog, OS_LOG_TYPE_ERROR, v55, buf, 0xCu);
          goto LABEL_68;
        }
      }
      if (objc_msgSend(v18, "isCurrent") && !SCUserPreferencesSetCurrent())
      {
        Error = SCCopyLastError();
        ne_log_obj();
        oslog = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          goto LABEL_68;
        *(_DWORD *)buf = 138412290;
        v94 = Error;
        v55 = "Failed to set the current user preferences: %@";
        goto LABEL_64;
      }
      objc_msgSend(v18, "settings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23 == 0;

      if (!v24)
      {
        objc_msgSend(v18, "settings");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "passwordKeychainItem");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setDomain:", 1);

        objc_msgSend(v18, "settings");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "sharedSecretKeychainItem");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setDomain:", 1);

        v29 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v18, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        Error = (void *)objc_msgSend(v29, "initWithUUIDString:", v30);

        oslog = -[NEConfiguration initWithIdentifier:]((id *)[NEConfiguration alloc], Error);
        objc_msgSend(v18, "name");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setName:](oslog, "setName:", v32);

        objc_msgSend(v18, "settings");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "syncWithKeychainInDomain:configuration:suffix:", 1, oslog, 0);

        objc_msgSend(v18, "settings");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (id)objc_msgSend(v34, "copyLegacyDictionaryComplete:", 0);

        if (!v35)
          v35 = objc_alloc_init(MEMORY[0x1E0C99D80]);
        if (!SCUserPreferencesSetInterfaceTypeConfiguration())
        {
          v37 = SCCopyLastError();
          ne_log_obj();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v94 = v37;
            _os_log_error_impl(&dword_19BD16000, v56, OS_LOG_TYPE_ERROR, "Failed to set the PPP settings in the user preferences: %@", buf, 0xCu);
          }
LABEL_61:

LABEL_68:
LABEL_69:
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEVPNErrorDomain"), 4, 0);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          ne_log_obj();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v94 = v59;
            _os_log_error_impl(&dword_19BD16000, v60, OS_LOG_TYPE_ERROR, "Failed to save the new configuration: %@", buf, 0xCu);
          }

          if (v4)
          {
            v70[0] = MEMORY[0x1E0C809B0];
            v70[1] = 3221225472;
            v70[2] = __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_39;
            v70[3] = &unk_1E3CC46A8;
            v72 = v4;
            v71 = v59;
            dispatch_async(MEMORY[0x1E0C80D38], v70);

          }
          v45 = v61;
          goto LABEL_40;
        }
        objc_msgSend(v18, "settings");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (CFErrorRef)objc_msgSend(v36, "copyLegacyIPSecDictionary");

        if (!v37)
          v37 = (CFErrorRef)objc_alloc_init(MEMORY[0x1E0C99D80]);
        if (!SCUserPreferencesSetInterfaceTypeConfiguration())
        {
          v56 = SCCopyLastError();
          ne_log_obj();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v94 = v56;
            _os_log_error_impl(&dword_19BD16000, v57, OS_LOG_TYPE_ERROR, "Failed to set the IPsec settings in the user preferences: %@", buf, 0xCu);
          }

          goto LABEL_61;
        }

      }
      objc_msgSend(v18, "settings");
      Error = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(Error, "authenticationMethod") == 3)
      {
        objc_msgSend(v18, "settings");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "identityReference");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39 == 0;

        if (v40)
          goto LABEL_32;
        v91 = CFSTR("TLSIdentityHandle");
        objc_msgSend(v18, "settings");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "identityReference");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = v42;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
        Error = (void *)objc_claimAutoreleasedReturnValue();

        if (!SCUserPreferencesSetInterfaceTypeConfiguration())
        {
          oslog = SCCopyLastError();
          ne_log_obj();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v94 = oslog;
            _os_log_error_impl(&dword_19BD16000, v58, OS_LOG_TYPE_ERROR, "Failed to set the EAP settings in the user preferences: %@", buf, 0xCu);
          }

          goto LABEL_68;
        }
      }

LABEL_32:
      v16 |= v66;
    }
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
    if (v15)
      continue;
    break;
  }

  if ((v16 & 1) == 0)
    goto LABEL_51;
LABEL_52:

LABEL_53:
  v50 = +[NEVPNManager loadedManagers]();
  v5->_notificationSent = 0;
  +[NEVPNManager configurationManager]();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEVPNManager configuration](v5, "configuration");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = MEMORY[0x1E0C80D38];
  v54 = MEMORY[0x1E0C80D38];
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_2_41;
  v68[3] = &unk_1E3CC4748;
  v68[4] = v5;
  v69 = v4;
  objc_msgSend(v51, "saveConfiguration:withCompletionQueue:handler:", v52, v53, v68);

  v45 = v63;
LABEL_40:

LABEL_41:
  objc_sync_exit(v5);

}

- (NEVPNProtocol)protocolConfiguration
{
  NEVPNManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  -[NEVPNManager configuration](v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appVPN");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NEVPNManager configuration](v2, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "appVPN");
  else
    objc_msgSend(v5, "VPN");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "protocol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NEVPNProtocol *)v7;
}

- (void)setProtocolConfiguration:(NEVPNProtocol *)protocolConfiguration
{
  NEVPNManager *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NEVPNProtocol *v9;

  v9 = protocolConfiguration;
  v4 = self;
  objc_sync_enter(v4);
  -[NEVPNManager configuration](v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appVPN");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NEVPNManager configuration](v4, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v7, "appVPN");
  else
    objc_msgSend(v7, "VPN");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProtocol:", v9);

  objc_sync_exit(v4);
}

- (NSArray)onDemandRules
{
  NEVPNManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  -[NEVPNManager configuration](v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appVPN");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NEVPNManager configuration](v2, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "appVPN");
  else
    objc_msgSend(v5, "VPN");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "onDemandRules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSArray *)v7;
}

- (void)setOnDemandRules:(NSArray *)onDemandRules
{
  NEVPNManager *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;

  v9 = onDemandRules;
  v4 = self;
  objc_sync_enter(v4);
  -[NEVPNManager configuration](v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appVPN");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NEVPNManager configuration](v4, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v7, "appVPN");
  else
    objc_msgSend(v7, "VPN");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOnDemandRules:", v9);

  objc_sync_exit(v4);
}

- (BOOL)isOnDemandEnabled
{
  NEVPNManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v2 = self;
  objc_sync_enter(v2);
  -[NEVPNManager configuration](v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appVPN");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NEVPNManager configuration](v2, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "appVPN");
  else
    objc_msgSend(v5, "VPN");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isOnDemandEnabled");

  objc_sync_exit(v2);
  return v7;
}

- (void)setOnDemandEnabled:(BOOL)onDemandEnabled
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NEVPNManager *obj;

  v3 = onDemandEnabled;
  obj = self;
  objc_sync_enter(obj);
  -[NEVPNManager configuration](obj, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appVPN");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NEVPNManager configuration](obj, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v6, "appVPN");
  else
    objc_msgSend(v6, "VPN");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOnDemandEnabled:", v3);

  objc_sync_exit(obj);
}

- (BOOL)isEnabled
{
  NEVPNManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v2 = self;
  objc_sync_enter(v2);
  -[NEVPNManager configuration](v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appVPN");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NEVPNManager configuration](v2, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "appVPN");
  else
    objc_msgSend(v5, "VPN");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEnabled");

  objc_sync_exit(v2);
  return v7;
}

- (void)setEnabled:(BOOL)enabled
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NEVPNManager *obj;

  v3 = enabled;
  obj = self;
  objc_sync_enter(obj);
  -[NEVPNManager configuration](obj, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appVPN");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NEVPNManager configuration](obj, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v6, "appVPN");
  else
    objc_msgSend(v6, "VPN");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v3);

  objc_sync_exit(obj);
}

- (NSString)localizedDescription
{
  NEVPNManager *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[NEVPNManager configuration](v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSString *)v4;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
  NEVPNManager *v4;
  void *v5;
  NSString *v6;

  v6 = localizedDescription;
  v4 = self;
  objc_sync_enter(v4);
  -[NEVPNManager configuration](v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v6);

  objc_sync_exit(v4);
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  -[NEVPNManager localizedDescription](self, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("localizedDescription"), v5, a4);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNManager isEnabled](self, "isEnabled"), CFSTR("enabled"), v5, a4);
  -[NEVPNManager protocolConfiguration](self, "protocolConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("protocolConfiguration"), v5, a4);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNManager isOnDemandEnabled](self, "isOnDemandEnabled"), CFSTR("onDemandEnabled"), v5, a4);
  -[NEVPNManager onDemandRules](self, "onDemandRules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("onDemandRules"), v5, a4);

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[NEVPNManager descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("{%@\n}"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSUUID)identifier
{
  void *v2;
  void *v3;

  -[NEVPNManager configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSString)appBundleIdentifier
{
  void *v2;
  void *v3;

  -[NEVPNManager configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isFromProfile
{
  void *v2;
  void *v3;
  BOOL v4;

  -[NEVPNManager configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "payloadInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isFromMDM
{
  void *v2;
  void *v3;
  BOOL v4;

  -[NEVPNManager configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "payloadInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "profileSource") == 2;

  return v4;
}

- (NEProfileIngestionPayloadInfo)configurationPayloadInfo
{
  void *v2;
  void *v3;

  -[NEVPNManager configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "payloadInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NEProfileIngestionPayloadInfo *)v3;
}

- (id)copyCurrentUserStartOptions
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *started;
  id v9;
  void *v10;
  void *v11;

  -[NEVPNManager protocolConfiguration](self, "protocolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 != 2)
    return 0;
  -[NEVPNManager protocolConfiguration](self, "protocolConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", &__block_literal_global_65_23519);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    started = 0;
  }
  else
  {
    objc_msgSend(v5, "userPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      started = (void *)SCUserPreferencesCopyStartOptions();
    else
      started = 0;

  }
  v9 = started;

  return v9;
}

- (id)createL2TPUserPreferencesWithName:(id)a3
{
  id v4;
  NEL2TPUserPreferences *v5;
  void *v6;
  NEL2TPUserPreferences *v7;
  NEVPNProtocolL2TP *v8;
  _QWORD *v9;

  v4 = a3;
  v5 = [NEL2TPUserPreferences alloc];
  -[NEVPNManager configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NEL2TPUserPreferences initWithConfiguration:](v5, "initWithConfiguration:", v6);

  -[NEL2TPUserPreferences setName:](v7, "setName:", v4);
  v8 = objc_alloc_init(NEVPNProtocolL2TP);
  -[NEL2TPUserPreferences setSettings:](v7, "setSettings:", v8);

  -[NEL2TPUserPreferences settings](v7, "settings");
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v9[10] = 1;

  return v7;
}

- (NEVPNConnection)connection
{
  return (NEVPNConnection *)objc_getProperty(self, a2, 16, 1);
}

- (NEConfiguration)configuration
{
  return (NEConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

uint64_t __43__NEVPNManager_copyCurrentUserStartOptions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrent");
}

uint64_t __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)loadedManagers
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__NEVPNManager_loadedManagers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (loadedManagers_managers_init_23560 != -1)
    dispatch_once(&loadedManagers_managers_init_23560, block);
  return (id)loadedManagers_loadedManagers_23561;
}

+ (id)configurationManager
{
  objc_opt_self();
  if ((g_noAppFilter & 1) != 0)
    +[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers");
  else
    +[NEConfigurationManager sharedManager](NEConfigurationManager, "sharedManager");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_2_41(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  if (v3)
  {
    +[NEVPNManager mapError:]((uint64_t)NEVPNManager, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v14 = 138412290;
        v15 = v5;
        _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "Failed to save configuration: %@", (uint8_t *)&v14, 0xCu);
      }

    }
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      *(_BYTE *)(v7 + 9) = 1;
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (!v8 || (*(_BYTE *)(v8 + 9) & 1) == 0)
    {
      ne_log_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v13 = *(void **)(a1 + 32);
        v14 = 138412290;
        v15 = v13;
        _os_log_debug_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEBUG, "Post NEVPNConfigurationChangeNotification to app for manager %@", (uint8_t *)&v14, 0xCu);
      }

      v10 = *(_QWORD *)(a1 + 32);
      if (v10)
        *(_BYTE *)(v10 + 9) = 1;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:", CFSTR("com.apple.networkextension.app-configuration-changed"), *(_QWORD *)(a1 + 32));

    }
    v5 = 0;
  }
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v5);
  objc_sync_exit(v4);

}

+ (id)mapError:(uint64_t)a1
{
  id v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  uint8_t buf[8];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("NEConfigurationErrorDomain"));

  if (v4)
  {
    switch(objc_msgSend(v2, "code"))
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 7:
        objc_msgSend(v2, "localizedDescription");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = 1;
        goto LABEL_7;
      case 5:
        objc_msgSend(v2, "localizedDescription");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = 4;
        goto LABEL_7;
      case 6:
      case 8:
      case 10:
      case 11:
      case 12:
      case 20:
      case 21:
        objc_msgSend(v2, "localizedDescription");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = 5;
        goto LABEL_7;
      case 9:
        ne_log_obj();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEFAULT, "The configuration was not saved because it was unchanged from the previously saved version", buf, 2u);
        }
        v9 = 0;
        break;
      default:
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v2, "localizedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("Unknown: %@"), v12);
        v5 = objc_claimAutoreleasedReturnValue();

        goto LABEL_5;
    }
  }
  else
  {
    v5 = CFSTR("Unknown.");
LABEL_5:
    v6 = 6;
LABEL_7:
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("NEVPNErrorDomain"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

void __30__NEVPNManager_loadedManagers__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)loadedManagers_loadedManagers_23561;
  loadedManagers_loadedManagers_23561 = (uint64_t)v2;

  +[NEVPNManager configurationManager]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__NEVPNManager_loadedManagers__block_invoke_2;
  v6[3] = &__block_descriptor_40_e17_v16__0__NSArray_8l;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "setChangedQueue:andHandler:", MEMORY[0x1E0C80D38], v6);

  +[NEVPNManager configurationManager]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncomingMessageHandler:", &__block_literal_global_23563);

}

void __30__NEVPNManager_loadedManagers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend((id)loadedManagers_loadedManagers_23561, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9
          || (objc_msgSend(*(id *)(a1 + 32), "sharedManager"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v14[0] = v7;
          v14[1] = 3221225472;
          v14[2] = __30__NEVPNManager_loadedManagers__block_invoke_3;
          v14[3] = &unk_1E3CC45C8;
          v15 = v9;
          v10 = v9;
          objc_msgSend(v10, "loadFromPreferencesWithCompletionHandler:", v14);

        }
        else
        {
          ne_log_obj();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v13 = 0;
            _os_log_debug_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEBUG, "Post NEVPNConfigurationChangeNotification to app", v13, 2u);
          }

          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v10 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "postNotificationName:object:", CFSTR("com.apple.networkextension.app-configuration-changed"), 0);
        }

        ++v8;
      }
      while (v5 != v8);
      v12 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v5 = v12;
    }
    while (v12);
  }

}

void __30__NEVPNManager_loadedManagers__block_invoke_10(uint64_t a1, void *a2)
{
  xpc_object_t reply;
  const char *v3;
  void *v4;
  NEProviderAppConfigurationClient *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  int64_t v14;
  _xpc_connection_s *v15;
  xpc_object_t xdict;
  objc_super v17;

  xdict = a2;
  reply = xpc_dictionary_create_reply(xdict);
  if (!xdict
    || MEMORY[0x1A1ACFDA4]() != MEMORY[0x1E0C812F8]
    || xpc_dictionary_get_int64(xdict, "config-operation") != 8)
  {
    v11 = 0;
    goto LABEL_13;
  }
  v4 = (void *)loadedManagers_configurationClient;
  if (!loadedManagers_configurationClient)
  {
    v5 = [NEProviderAppConfigurationClient alloc];
    if (v5)
    {
      v17.receiver = v5;
      v17.super_class = (Class)NEProviderAppConfigurationClient;
      v6 = objc_msgSendSuper2(&v17, sel_init);
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)*((_QWORD *)v6 + 9);
        *((_QWORD *)v6 + 9) = v7;

        objc_msgSend(*((id *)v6 + 9), "setDelegate:", v6);
        objc_msgSend(*((id *)v6 + 9), "resume");
        *((_BYTE *)v6 + 64) = 1;
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel_handleConfigChanged_, CFSTR("com.apple.networkextension.app-configuration-changed"), 0);

      }
    }
    else
    {
      v6 = 0;
    }
    v10 = (void *)loadedManagers_configurationClient;
    loadedManagers_configurationClient = (uint64_t)v6;

    v4 = (void *)loadedManagers_configurationClient;
  }
  -[NEProviderAppConfigurationClient listenerEndpoint](v4, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_13:
    v14 = 22;
    if (!reply)
      goto LABEL_17;
    goto LABEL_14;
  }
  -[NEProviderAppConfigurationClient listenerEndpoint]((void *)loadedManagers_configurationClient, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_endpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  if (!reply)
    goto LABEL_17;
LABEL_14:
  xpc_dictionary_set_int64(reply, "result-code", v14);
  if (v11)
    xpc_dictionary_set_value(reply, "result-data", v11);
  xpc_dictionary_get_remote_connection(xdict);
  v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v15, reply);

LABEL_17:
}

void __30__NEVPNManager_loadedManagers__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || (*(_BYTE *)(v2 + 9) & 1) == 0)
  {
    ne_log_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v6;
      _os_log_debug_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEBUG, "Post NEVPNConfigurationChangeNotification to app for manager %@", (uint8_t *)&v7, 0xCu);
    }

    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      *(_BYTE *)(v4 + 9) = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("com.apple.networkextension.app-configuration-changed"), *(_QWORD *)(a1 + 32));

  }
}

void __59__NEVPNManager_removeFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  if (v3)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v3;
      _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "Failed to remove the configuration: %@", buf, 0xCu);
    }

    +[NEVPNManager mapError:]((uint64_t)NEVPNManager, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (!v8)
  {
    +[NEVPNManager loadedManagers]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v11);

  }
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEVPNConnection destroySession](v12);

  v13 = *(_QWORD *)(a1 + 32);
  if (!v13 || (*(_BYTE *)(v13 + 9) & 1) == 0)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v18 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v23 = v18;
      _os_log_debug_impl(&dword_19BD16000, v14, OS_LOG_TYPE_DEBUG, "Post NEVPNConfigurationChangeNotification to app for manager %@", buf, 0xCu);
    }

    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
      *(_BYTE *)(v15 + 9) = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:", CFSTR("com.apple.networkextension.app-configuration-changed"), *(_QWORD *)(a1 + 32));

  }
  v17 = *(void **)(a1 + 40);
  if (v17)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __59__NEVPNManager_removeFromPreferencesWithCompletionHandler___block_invoke_27;
    v19[3] = &unk_1E3CC46A8;
    v21 = v17;
    v20 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v19);

  }
  objc_sync_exit(v4);

}

uint64_t __59__NEVPNManager_removeFromPreferencesWithCompletionHandler___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __57__NEVPNManager_loadFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
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
  v31 = a2;
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (v5)
  {
    +[NEVPNManager mapError:]((uint64_t)NEVPNManager, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
LABEL_20:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_21;
    }
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v7;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "Failed to load the configuration: %@", buf, 0xCu);
    }
LABEL_19:

    goto LABEL_20;
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    *(_BYTE *)(v9 + 8) = 1;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = v31;
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (!v10)
  {
LABEL_15:

    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "VPN");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setEnabled:", 0);

    +[NEVPNManager loadedManagers]();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectForKey:", v21);

    objc_msgSend(*(id *)(a1 + 32), "connection");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NEVPNConnection destroySession](v8);
LABEL_18:
    v7 = 0;
    goto LABEL_19;
  }
  v11 = *(_QWORD *)v33;
LABEL_9:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v33 != v11)
      objc_enumerationMutation(v8);
    v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v12);
    v14 = *(void **)(a1 + 32);
    objc_msgSend(v13, "VPN");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "protocol");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v14, "isProtocolTypeValid:", objc_msgSend(v16, "type"));

    if ((_DWORD)v14)
      break;
    if (v10 == ++v12)
    {
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v10)
        goto LABEL_9;
      goto LABEL_15;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", v13);
  v22 = *(_QWORD *)(a1 + 32);
  +[NEVPNManager loadedManagers]();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v25);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v26 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = v26[7] == 0;

    if (!v27)
      goto LABEL_18;
  }
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v28, v30, 0, *(void **)(a1 + 40));

  v7 = 0;
LABEL_21:
  objc_sync_exit(v6);

}

+ (id)create
{
  id *v2;
  NEVPNManager *v3;

  v2 = -[NEVPNConnection initWithType:]([NEVPNConnection alloc], 1);
  v3 = -[NEVPNManager initWithGrade:connection:tunnelType:]([NEVPNManager alloc], "initWithGrade:connection:tunnelType:", 1, v2, 1);

  return v3;
}

+ (NEVPNManager)sharedManager
{
  if (sharedManager_vpn_init != -1)
    dispatch_once(&sharedManager_vpn_init, &__block_literal_global_25);
  return (NEVPNManager *)(id)sharedManager_g_nevpn;
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    objc_opt_self();
    g_noAppFilter = 1;
    v5 = +[NEVPNManager loadedManagers]();
    +[NEVPNManager configurationManager]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__NEVPNManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E3CC4310;
    v9 = a1;
    v8 = v4;
    objc_msgSend(v6, "loadConfigurationsWithCompletionQueue:handler:", MEMORY[0x1E0C80D38], v7);

  }
}

void __60__NEVPNManager_loadAllFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  BOOL v14;
  NEVPNManager *v15;
  SCNetworkConnectionRef v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  NEL2TPUserPreferences *v22;
  CFTypeRef *v23;
  CFTypeRef *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  id obj;
  id v49;
  id v50;
  id v51;
  CFTypeRef cf;
  uint64_t v53;
  uint64_t v54;
  NSObject *group;
  id *v56;
  void *v57;
  NEVPNManager *v58;
  uint64_t i;
  void *v60;
  void *v61;
  _QWORD block[4];
  id v63;
  id v64;
  uint64_t *v65;
  _QWORD v66[5];
  NSObject *v67;
  uint64_t *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  objc_super v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v47 = a2;
  v5 = a3;
  v45 = a1;
  v46 = *(id *)(a1 + 40);
  objc_sync_enter(v46);
  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__23590;
  v77 = __Block_byref_object_dispose__23591;
  v6 = v5;
  v78 = v6;
  v44 = v6;
  if (v6)
  {
    +[NEVPNManager mapError:]((uint64_t)NEVPNManager, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v74[5];
    v74[5] = v7;

    v9 = v74[5];
  }
  else
  {
    v9 = 0;
  }
  if (v47 && !v9 && objc_msgSend(v47, "count", v44))
  {
    group = dispatch_group_create();
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    obj = v47;
    v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
    if (v54)
    {
      v53 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v54; ++i)
        {
          if (*(_QWORD *)v70 != v53)
            objc_enumerationMutation(obj);
          v61 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
          objc_msgSend(v61, "VPN");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v61, "VPN");
          else
            objc_msgSend(v61, "appVPN");
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          if (v60)
          {
            objc_opt_class();
            v11 = objc_opt_isKindOfClass() & 1;
            v12 = v11 ? 2 : 1;
            if (v11
              || objc_msgSend(v60, "tunnelType") != 2
              || (objc_msgSend(v60, "protocol"),
                  v13 = (void *)objc_claimAutoreleasedReturnValue(),
                  v14 = objc_msgSend(v13, "type") == 4,
                  v13,
                  !v14))
            {
              v56 = -[NEVPNConnection initWithType:]([NEVPNConnection alloc], v12);
              v15 = -[NEVPNManager initWithGrade:connection:tunnelType:]([NEVPNManager alloc], "initWithGrade:connection:tunnelType:", objc_msgSend(v61, "grade"), v56, objc_msgSend(v60, "tunnelType"));
              -[NEVPNManager setConfiguration:](v15, "setConfiguration:", v61);
              v58 = v15;
              -[NEVPNManager protocolConfiguration](v15, "protocolConfiguration");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v57, "type") == 2)
              {
                v50 = v57;
                v51 = v61;
                objc_opt_self();
                v16 = +[NEL2TPUserPreferences createConnectionForConfiguration:]((uint64_t)NEL2TPUserPreferences, v51);
                v17 = (void *)SCNetworkConnectionCopyAllUserPreferences();
                cf = (CFTypeRef)SCNetworkConnectionCopyCurrentUserPreferences();
                CFRelease(v16);
                if (cf)
                {
                  SCUserPreferencesGetUniqueID();
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v18 = 0;
                }
                if (objc_msgSend(v17, "count"))
                {
                  v19 = 0;
                  v20 = 0;
                  while (1)
                  {
                    objc_msgSend(v17, "objectAtIndexedSubscript:", v19);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();

                    v22 = [NEL2TPUserPreferences alloc];
                    if (v22)
                      break;
                    v24 = 0;
                    if (v18)
                      goto LABEL_45;
LABEL_47:
                    if (!v20)
                      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    objc_msgSend(v20, "addObject:", v24);

                    if (++v19 >= (unint64_t)objc_msgSend(v17, "count"))
                      goto LABEL_54;
                  }
                  v79.receiver = v22;
                  v79.super_class = (Class)NEL2TPUserPreferences;
                  v23 = (CFTypeRef *)objc_msgSendSuper2(&v79, sel_init);
                  v24 = v23;
                  if (v23)
                  {
                    v23[5] = v21;
                    v25 = SCUserPreferencesCopyName();
                    v26 = (void *)v24[3];
                    v24[3] = (CFTypeRef)v25;

                    SCUserPreferencesGetUniqueID();
                    v27 = objc_claimAutoreleasedReturnValue();
                    v28 = (void *)v24[2];
                    v24[2] = (CFTypeRef)v27;

                    CFRetain(v24[5]);
                    if (SCUserPreferencesIsForced())
                      *((_BYTE *)v24 + 9) = 1;
                    v29 = (void *)SCUserPreferencesCopyInterfaceTypeConfiguration();
                    if (isa_nsdictionary(v29))
                    {
                      v30 = (void *)objc_msgSend(v29, "mutableCopy");
                      objc_msgSend(v30, "setObject:forKeyedSubscript:", &unk_1E3D035B0, CFSTR("__NEVPNKeychainDomain"));
                      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v30);

                      v32 = -[NEVPNProtocolPPP initFromLegacyDictionary:]([NEVPNProtocolL2TP alloc], "initFromLegacyDictionary:", v31);
                      if (v32)
                      {
                        v33 = (void *)SCUserPreferencesCopyInterfaceTypeConfiguration();
                        if (isa_nsdictionary(v33))
                          objc_msgSend(v32, "setIPSecSettingsFromLegacyDictionary:", v33);

                      }
                      v34 = (void *)v24[4];
                      v24[4] = v32;

                    }
                    else
                    {
                      v31 = v29;
                    }
                    v35 = (void *)SCUserPreferencesCopyInterfaceTypeConfiguration();
                    if (isa_nsdictionary(v35))
                    {
                      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("TLSIdentityHandle"));
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      v37 = (void *)v24[4];
                      if (v37)
                        objc_msgSend(v37, "setIdentityReference:", v36);

                    }
                  }
                  if (!v18)
                    goto LABEL_47;
LABEL_45:
                  -[CFTypeRef identifier](v24, "identifier");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = objc_msgSend(v18, "isEqualToString:", v38);

                  if (v39)
                    -[CFTypeRef setCurrent:](v24, "setCurrent:", 1);
                  goto LABEL_47;
                }
                v20 = 0;
LABEL_54:
                if (cf)
                  CFRelease(cf);

                objc_msgSend(v50, "setUserPreferences:", v20);
              }
              objc_msgSend(v49, "addObject:", v58);
              +[NEVPNManager loadedManagers]();
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "identifier");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setObject:forKeyedSubscript:", v58, v41);

              if (v58)
                v58->_hasLoaded = 1;
              dispatch_group_enter(group);
              -[NEVPNManager connection](v58, "connection");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "identifier");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v66[0] = MEMORY[0x1E0C809B0];
              v66[1] = 3221225472;
              v66[2] = __60__NEVPNManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_62;
              v66[3] = &unk_1E3CC42C0;
              v66[4] = v61;
              v68 = &v73;
              v67 = group;
              if (v42)
                -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v42, v43, 0, v66);

            }
          }

        }
        v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
      }
      while (v54);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__NEVPNManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_63;
    block[3] = &unk_1E3CC42E8;
    v65 = &v73;
    v63 = v49;
    v64 = *(id *)(v45 + 32);
    dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  _Block_object_dispose(&v73, 8);

  objc_sync_exit(v46);
}

void __60__NEVPNManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_62(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "Error creating connection for configuration %@: %@", (uint8_t *)&v7, 0x16u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __60__NEVPNManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_63(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __29__NEVPNManager_sharedManager__block_invoke()
{
  NEVPNManager *v0;
  id *v1;
  uint64_t v2;
  void *v3;

  if (NEInitCFTypes_onceToken != -1)
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22195);
  v0 = [NEVPNManager alloc];
  v1 = -[NEVPNConnection initWithType:]([NEVPNConnection alloc], 1);
  v2 = -[NEVPNManager initWithGrade:connection:tunnelType:](v0, "initWithGrade:connection:tunnelType:", 2, v1, 1);
  v3 = (void *)sharedManager_g_nevpn;
  sharedManager_g_nevpn = v2;

  return +[NEVPNManager loadedManagers]();
}

@end
