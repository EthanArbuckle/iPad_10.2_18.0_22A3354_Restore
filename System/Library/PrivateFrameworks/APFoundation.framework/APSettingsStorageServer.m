@implementation APSettingsStorageServer

+ (id)baseServerURL
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  __CFString *v13;
  const char *v14;
  uint64_t v15;
  __CFString **v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;

  if ((objc_msgSend_isAppleInternalInstall(APSystemInternal, a2, v2, v3) & 1) != 0)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v7 = (void *)objc_msgSend_initWithSuiteName_(v4, v5, (uint64_t)CFSTR("com.apple.AdPlatforms"), v6);
    objc_msgSend_stringForKey_(v7, v8, (uint64_t)CFSTR("ServerEnvironment"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = CFSTR("https://iadsdk.apple.com/adserver/");
    if (!v10 || (objc_msgSend_isEqualToString_(v10, v11, (uint64_t)CFSTR("Production"), v12) & 1) != 0)
      goto LABEL_14;
    if (objc_msgSend_isEqualToString_(v10, v11, (uint64_t)CFSTR("QE1"), v12))
    {
      v16 = kAPServerEnvironmentQE1BaseURL;
    }
    else if (objc_msgSend_isEqualToString_(v10, v14, (uint64_t)CFSTR("QE2"), v15))
    {
      v16 = kAPServerEnvironmentQE2BaseURL;
    }
    else if (objc_msgSend_isEqualToString_(v10, v19, (uint64_t)CFSTR("QE3"), v20))
    {
      v16 = kAPServerEnvironmentQE3BaseURL;
    }
    else
    {
      if (!objc_msgSend_isEqualToString_(v10, v21, (uint64_t)CFSTR("QE4"), v22))
      {
LABEL_14:
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v11, (uint64_t)CFSTR("%@%@"), v12, v13, CFSTR("2/client/configuration"));
        goto LABEL_15;
      }
      v16 = kAPServerEnvironmentQE4BaseURL;
    }
    v23 = *v16;

    v13 = v23;
    goto LABEL_14;
  }
  v13 = CFSTR("https://iadsdk.apple.com/adserver/");
  v10 = 0;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v17, (uint64_t)CFSTR("%@%@"), v18, v13, CFSTR("2/client/configuration"));
LABEL_15:
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v25, (uint64_t)v24, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (APSettingsStorageServer)initWithDefaultValues:(id)a3
{
  NSObject *v4;
  uint8_t v6[16];

  APLogForCategory(0x29uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CF251000, v4, OS_LOG_TYPE_INFO, "This is a no-op. Please use initWithURL:headers:defaultValues: instead.", v6, 2u);
  }

  return self;
}

- (void)fetchNewServerData
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  APStorageManager *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  id v33;
  const char *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  id v58;
  _QWORD v59[5];
  id v60;
  id v61;
  _BYTE *v62;
  id v63;
  id v64;
  _BYTE buf[24];
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  objc_msgSend_url(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_absoluteString(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sha256hash(v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_now(MEMORY[0x1E0C99D68], v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastUpdate(self, v18, v19, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    goto LABEL_2;
  v27 = [APStorageManager alloc];
  v30 = (void *)objc_msgSend_initWithPathPrefix_(v27, v28, (uint64_t)CFSTR("s/s"), v29);
  v64 = 0;
  v32 = objc_msgSend_fileExistsAtPath_error_(v30, v31, (uint64_t)v13, (uint64_t)&v64);
  v33 = v64;
  v35 = v33;
  if ((v32 & 1) == 0)
  {

    v23 = 0;
    goto LABEL_12;
  }
  v63 = v33;
  objc_msgSend_lastModifiedDateForFileAtPath_error_(v30, v34, (uint64_t)v13, (uint64_t)&v63);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v63;

  if (v36)
  {
    APLogForCategory(0x29uLL);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478083;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v36;
      _os_log_impl(&dword_1CF251000, v37, OS_LOG_TYPE_ERROR, "Error getting timestamp of file %{private}@. Error: %{public}@", buf, 0x16u);
    }

  }
  if (!v23)
  {
LABEL_12:
    objc_opt_class();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v38);
    if (qword_1ED2BC620)
    {
      if ((objc_msgSend_containsObject_((void *)qword_1ED2BC620, v39, (uint64_t)v5, v40) & 1) != 0)
      {
        objc_sync_exit(v38);

        goto LABEL_18;
      }
      objc_msgSend_addObject_((void *)qword_1ED2BC620, v41, (uint64_t)v5, v42);
    }
    else
    {
      objc_msgSend_setWithObject_(MEMORY[0x1E0C99E20], v39, (uint64_t)v5, v40);
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = (void *)qword_1ED2BC620;
      qword_1ED2BC620 = v43;

    }
    objc_sync_exit(v38);

    objc_msgSend_headers(self, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v66 = sub_1CF270D74;
    v67 = sub_1CF270D84;
    objc_msgSend_sharedAPNetworkClient(APNetworkClient, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_temporarySessionForDaemon(v52, v53, v54, v55);
    v68 = (id)objc_claimAutoreleasedReturnValue();

    v56 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = sub_1CF270D8C;
    v59[3] = &unk_1E8C48288;
    v59[4] = self;
    v60 = v13;
    v61 = v5;
    v62 = buf;
    v58 = (id)objc_msgSend_GET_headers_withCompletionHandler_(v56, v57, (uint64_t)v61, (uint64_t)v48, v59);

    _Block_object_dispose(buf, 8);
    goto LABEL_18;
  }
LABEL_2:
  objc_msgSend_timeIntervalSinceDate_(v17, v21, (uint64_t)v23, v22);
  if (v26 > 3600.0)
    goto LABEL_12;
  objc_msgSend_setDidFetchFromServer_(self, v24, 0, v25);
LABEL_18:

}

- (void)retrieveServerData
{
  APStorageManager *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  int v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = [APStorageManager alloc];
  v6 = (void *)objc_msgSend_initWithPathPrefix_(v3, v4, (uint64_t)CFSTR("s/s"), v5);
  objc_msgSend_url(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_absoluteString(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sha256hash(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v20 = objc_msgSend_fileExistsAtPath_error_(v6, v19, (uint64_t)v18, (uint64_t)&v38);
  v21 = v38;
  if (v21)
  {
    v25 = v21;
    APLogForCategory(0x29uLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478083;
      v40 = v18;
      v41 = 2114;
      v42 = v25;
      _os_log_impl(&dword_1CF251000, v26, OS_LOG_TYPE_ERROR, "Error determining status of file %{private}@. Error: %{public}@", buf, 0x16u);
    }
    goto LABEL_6;
  }
  if (v20)
  {
    objc_msgSend_lock(self, v22, v23, v24);
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v26, v27, v28, v29);
    v37 = 0;
    objc_msgSend_objectStoredAtPath_error_(v6, v30, (uint64_t)v18, (uint64_t)&v37);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v37;
    objc_msgSend_setServerData_(self, v32, (uint64_t)v31, v33);

    objc_msgSend_unlock(v26, v34, v35, v36);
LABEL_6:

  }
  objc_msgSend_fetchNewServerData(self, v22, v23, v24);

}

- (APSettingsStorageServer)initWithURL:(id)a3 headers:(id)a4 defaultValues:(id)a5
{
  id v9;
  id v10;
  id v11;
  APSettingsStorageServer *v12;
  APSettingsStorageServer *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSDictionary *defaults;
  APUnfairLock *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  APUnfairLock *lock;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)APSettingsStorageServer;
  v12 = -[APSettingsStorageServer init](&v28, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    objc_storeStrong((id *)&v13->_headers, a4);
    v17 = objc_msgSend_copy(v11, v14, v15, v16);
    defaults = v13->_defaults;
    v13->_defaults = (NSDictionary *)v17;

    v13->_didFetchFromServer = 1;
    v19 = [APUnfairLock alloc];
    v22 = objc_msgSend_initWithOptions_(v19, v20, 1, v21);
    lock = v13->_lock;
    v13->_lock = (APUnfairLock *)v22;

    objc_msgSend_retrieveServerData(v13, v24, v25, v26);
  }

  return v13;
}

- (id)valueForKey:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_valueForKey_error_, a3, 0);
}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char isKindOfClass;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
  uint8_t v36[16];

  objc_msgSend_lastNamespacedComponent(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v9, v10, v11, v12);
  objc_msgSend_serverData(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend_serverData(self, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v21, v22, (uint64_t)v5, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_unlock(v9, v25, v26, v27);
    if (v24)
      goto LABEL_9;
  }
  else
  {
    objc_msgSend_unlock(v9, v18, v19, v20);
  }
  objc_msgSend_defaults(self, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v31, v32, (uint64_t)v5, v33);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    APLogForCategory(0x29uLL);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_1CF251000, v34, OS_LOG_TYPE_ERROR, "Request for server data not complete and no default values provided. Try again later.", v36, 2u);
    }

    v24 = 0;
  }
LABEL_9:

  return v24;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_setValue_forKey_error_, a3, a4);
}

- (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v5;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Settings with server storage is read only. You should not be trying to overwrite server provided data. Now generating simulated crash."), (uint64_t)a4, a5);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  APSimulateCrash((const char *)5, v5, 0);

}

- (BOOL)didFetchFromServer
{
  return self->_didFetchFromServer;
}

- (void)setDidFetchFromServer:(BOOL)a3
{
  self->_didFetchFromServer = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (NSDate)lastUpdate
{
  return self->_lastUpdate;
}

- (void)setLastUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdate, a3);
}

- (NSDictionary)defaults
{
  return self->_defaults;
}

- (NSDictionary)serverData
{
  return self->_serverData;
}

- (void)setServerData:(id)a3
{
  objc_storeStrong((id *)&self->_serverData, a3);
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_serverData, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
