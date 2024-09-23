@implementation CLSEndpointConnection

+ (CLSEndpointConnection)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40B79D8;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB8B0 != -1)
    dispatch_once(&qword_1ED0FB8B0, block);
  return (CLSEndpointConnection *)(id)qword_1ED0FB8A8;
}

+ (id)instanceForEndpoint:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  if (v6)
  {
    v7 = objc_alloc((Class)a1);
    v9 = objc_msgSend_initWithEndpoint_(v7, v8, (uint64_t)v6);
  }
  else
  {
    objc_msgSend_sharedInstance(a1, v4, v5);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (CLSEndpointConnection)init
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

- (CLSEndpointConnection)initWithEndpoint:(id)a3
{
  id v5;
  CLSEndpointConnection *v6;
  CLSEndpointConnection *v7;
  const char *v8;
  uint64_t v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSEndpointConnection;
  v6 = -[CLSEndpointConnection init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock = 0;
    objc_storeStrong((id *)&v6->_endpoint, a3);
    objc_msgSend__registerForDarwinNotifications(v7, v8, v9);
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  objc_super v13;

  objc_msgSend_invalidate(self, a2, v2);
  objc_msgSend_defaultCenter(CLSDarwinNotificationCenter, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_notificationName_(v6, v7, (uint64_t)self, CFSTR("com.apple.progressd.available"));
  objc_msgSend_removeObserver_notificationName_(v6, v8, (uint64_t)self, CFSTR("com.apple.progressd.devModeChanged"));
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v11, v12, (uint64_t)self);

  v13.receiver = self;
  v13.super_class = (Class)CLSEndpointConnection;
  -[CLSEndpointConnection dealloc](&v13, sel_dealloc);
}

- (void)lock
{
  os_unfair_recursive_lock_lock_with_options();
}

- (void)unlock
{
  os_unfair_recursive_lock_unlock();
}

- (void)_registerForDarwinNotifications
{
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend_defaultCenter(CLSDarwinNotificationCenter, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D40B7D70;
  v11[3] = &unk_1E974AB60;
  objc_copyWeak(&v12, &location);
  objc_msgSend_addObserver_notificationName_block_(v5, v7, (uint64_t)self, CFSTR("com.apple.progressd.available"), v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = sub_1D40B7EF0;
  v9[3] = &unk_1E974AB60;
  objc_copyWeak(&v10, &location);
  objc_msgSend_addObserver_notificationName_block_(v5, v8, (uint64_t)self, CFSTR("com.apple.progressd.devModeChanged"), v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

- (BOOL)isBorked
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  BOOL v6;

  objc_msgSend_lock(self, a2, v2);
  v6 = !self->_serverConnection || self->_connectionBorked || self->_interrupted;
  objc_msgSend_unlock(self, v4, v5);
  return v6;
}

- (id)serverConnection
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSXPCListenerEndpoint *endpoint;
  id v11;
  const char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  NSXPCConnection *serverConnection;
  NSXPCConnection *v26;
  const char *v27;
  uint64_t v28;
  NSXPCConnection *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  void (**onConnect)(void);
  NSXPCConnection *v39;
  const char *v40;
  uint64_t v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  NSXPCListenerEndpoint *v45;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id from;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  if (!objc_msgSend_isClassKitEnabled(v3, v4, v5))
    goto LABEL_22;
  objc_msgSend_lock(self, v6, v7);
  if (objc_msgSend_isBorked(self, v8, v9))
  {
    endpoint = self->_endpoint;
    v11 = objc_alloc(MEMORY[0x1E0CB3B38]);
    if (endpoint)
      v13 = (void *)objc_msgSend_initWithListenerEndpoint_(v11, v12, (uint64_t)self->_endpoint);
    else
      v13 = (void *)objc_msgSend_initWithMachServiceName_options_(v11, v12, (uint64_t)CFSTR("com.apple.progressd"), 4096);
    v14 = v13;
    if (v13)
    {
      objc_initWeak(location, v13);
      objc_initWeak(&from, self);
      v15 = MEMORY[0x1E0C809B0];
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = sub_1D40B8468;
      v50[3] = &unk_1E974BC60;
      objc_copyWeak(&v51, &from);
      objc_copyWeak(&v52, location);
      objc_msgSend_setInterruptionHandler_(v14, v16, (uint64_t)v50);
      v47[0] = v15;
      v47[1] = 3221225472;
      v47[2] = sub_1D40B84B8;
      v47[3] = &unk_1E974BC60;
      objc_copyWeak(&v48, &from);
      objc_copyWeak(&v49, location);
      objc_msgSend_setInvalidationHandler_(v14, v17, (uint64_t)v47);
      CLSEndpointServerInterface();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRemoteObjectInterface_(v14, v19, (uint64_t)v18);

      CLSClientInterface();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setExportedInterface_(v14, v21, (uint64_t)v20);

      v22 = (void *)objc_opt_new();
      objc_msgSend_setDelagate_(v22, v23, (uint64_t)self);
      objc_msgSend_setExportedObject_(v14, v24, (uint64_t)v22);
      serverConnection = self->_serverConnection;
      *(_WORD *)&self->_connectionBorked = 0;
      v26 = serverConnection;
      v29 = v26;
      if (v26)
        objc_msgSend_invalidate(v26, v27, v28);
      objc_storeStrong((id *)&self->_serverConnection, v14);
      objc_msgSend_resume(v14, v30, v31);
      objc_msgSend_overrideBundleIdentifier(self, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_length(v34, v35, v36))
        objc_msgSend__updateBundleIdentifier_forConnection_completion_(self, v37, (uint64_t)v34, self->_serverConnection, &unk_1E9749BD0);
      onConnect = (void (**)(void))self->_onConnect;
      if (onConnect)
        onConnect[2]();

      objc_destroyWeak(&v49);
      objc_destroyWeak(&v48);
      objc_destroyWeak(&v52);
      objc_destroyWeak(&v51);
      objc_destroyWeak(&from);
      objc_destroyWeak(location);

      goto LABEL_14;
    }
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v42 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      v45 = self->_endpoint;
      if (!v45)
        v45 = (NSXPCListenerEndpoint *)CFSTR("com.apple.progressd");
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v45;
      _os_log_impl(&dword_1D4054000, v42, OS_LOG_TYPE_INFO, "Could not establish connection with %@", (uint8_t *)location, 0xCu);
    }
    objc_msgSend_unlock(self, v43, v44);
LABEL_22:
    v39 = 0;
    return v39;
  }
LABEL_14:
  v39 = self->_serverConnection;
  objc_msgSend_unlock(self, v40, v41);
  return v39;
}

- (void)connectionInterrupted:(id)a3
{
  NSXPCConnection *v4;
  const char *v5;
  uint64_t v6;
  NSXPCConnection *serverConnection;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  void (**onInterupt)(void);
  uint8_t v12[16];

  if (a3)
  {
    v4 = (NSXPCConnection *)a3;
    objc_msgSend_lock(self, v5, v6);
    serverConnection = self->_serverConnection;

    if (serverConnection == v4)
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v10 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1D4054000, v10, OS_LOG_TYPE_INFO, "ClassKit daemon connection interrupted.", v12, 2u);
      }
      self->_interrupted = 1;
      onInterupt = (void (**)(void))self->_onInterupt;
      if (onInterupt)
        onInterupt[2]();
    }
    objc_msgSend_unlock(self, v8, v9);
  }
}

- (void)connectionBorked:(id)a3
{
  NSXPCConnection *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSXPCConnection *v9;

  v4 = (NSXPCConnection *)a3;
  if (v4)
  {
    v9 = v4;
    objc_msgSend_lock(self, v5, v6);
    if (self->_serverConnection == v9)
    {
      self->_connectionBorked = 1;
      objc_msgSend_connectionInterrupted_(self, v7, (uint64_t)v9);
    }
    objc_msgSend_unlock(self, v7, v8);
    v4 = v9;
  }

}

- (void)invalidate
{
  const char *v3;
  uint64_t v4;
  NSXPCConnection *serverConnection;

  objc_msgSend_setInvalidationHandler_(self->_serverConnection, a2, 0);
  objc_msgSend_invalidate(self->_serverConnection, v3, v4);
  serverConnection = self->_serverConnection;
  self->_serverConnection = 0;

}

+ (NSString)classKitEnvironment
{
  if (qword_1ED0FB8C0 != -1)
    dispatch_once(&qword_1ED0FB8C0, &unk_1E974BC80);
  return (NSString *)(id)qword_1ED0FB8B8;
}

+ (BOOL)isInDevelopmentEnvironment
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  char isEqualToString;
  void *v11;
  const char *v12;

  objc_msgSend_classKitEnvironment(a1, a2, v2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6 | (unint64_t)CFSTR("development"))
  {
    objc_msgSend_classKitEnvironment(a1, v4, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = 0;
    if (v9 && CFSTR("development"))
    {
      objc_msgSend_classKitEnvironment(a1, v7, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v11, v12, (uint64_t)CFSTR("development"));

    }
  }
  else
  {
    isEqualToString = 1;
  }

  return isEqualToString;
}

+ (BOOL)isClassKitEnabled
{
  uint64_t v2;
  uint64_t v4;

  if ((objc_msgSend_isInDevelopmentEnvironment(a1, a2, v2) & 1) != 0)
    return 1;
  else
    return MEMORY[0x1E0DE7D20](a1, sel_isAllowedToMakeXPCCalls, v4);
}

+ (BOOL)isAllowedToMakeXPCCalls
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char v6;

  objc_msgSend_cls_configURL(MEMORY[0x1E0C99E98], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_cls_fileExists(v3, v4, v5) ^ 1;

  return v6;
}

- (id)syncDataServer:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_syncServer_, a3);
}

- (id)syncUtilityServer:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_syncServer_, a3);
}

- (id)syncServer:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[4];
  id v25;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1D40B8B18;
  v24[3] = &unk_1E9749F88;
  v6 = v4;
  v25 = v6;
  v7 = (void *)MEMORY[0x1D82575D0](v24);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1D40B8C0C;
  v22 = sub_1D40B8C1C;
  v23 = 0;
  objc_msgSend_serverConnection(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = sub_1D40B8C24;
  v15[3] = &unk_1E974BCA8;
  v17 = &v18;
  v11 = v7;
  v16 = v11;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v10, v12, (uint64_t)v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    (*((void (**)(id, uint64_t))v11 + 2))(v11, v19[5]);

  _Block_object_dispose(&v18, 8);
  return v13;
}

- (id)server:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[4];
  id v25;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1D40B8DE0;
  v24[3] = &unk_1E9749F88;
  v6 = v4;
  v25 = v6;
  v7 = (void *)MEMORY[0x1D82575D0](v24);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1D40B8C0C;
  v22 = sub_1D40B8C1C;
  v23 = 0;
  objc_msgSend_serverConnection(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = sub_1D40B8ED4;
  v15[3] = &unk_1E974BCA8;
  v17 = &v18;
  v11 = v7;
  v16 = v11;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v10, v12, (uint64_t)v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    (*((void (**)(id, uint64_t))v11 + 2))(v11, v19[5]);

  _Block_object_dispose(&v18, 8);
  return v13;
}

- (void)listAppsWithCompletion:(id)a3
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
  v9[2] = sub_1D40B8FB8;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_server_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_listAppsWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)setOverrideBundleIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  uint64_t v7;
  void *v8;
  void (**v9)(id, uint64_t, _QWORD);
  NSString *overrideBundleIdentifier;
  int isEqualToString;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;

  v19 = (uint64_t)a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v8 = (void *)v19;
  v9 = v6;
  overrideBundleIdentifier = self->_overrideBundleIdentifier;
  if (!(v19 | (unint64_t)overrideBundleIdentifier)
    || v19
    && overrideBundleIdentifier
    && (isEqualToString = objc_msgSend_isEqualToString_(overrideBundleIdentifier, (const char *)v19, v19),
        v8 = (void *)v19,
        isEqualToString))
  {
    v9[2](v9, 1, 0);
  }
  else
  {
    v12 = (NSString *)objc_msgSend_copy(v8, (const char *)v8, v7);
    v13 = self->_overrideBundleIdentifier;
    self->_overrideBundleIdentifier = v12;

    v14 = self->_overrideBundleIdentifier;
    objc_msgSend_serverConnection(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__updateBundleIdentifier_forConnection_completion_(self, v18, (uint64_t)v14, v17, v9);

  }
}

- (void)_updateBundleIdentifier:(id)a3 forConnection:(id)a4 completion:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v7 = a5;
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1D40B917C;
  v17[3] = &unk_1E9749F88;
  v9 = v7;
  v18 = v9;
  v10 = a3;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(a4, v11, (uint64_t)v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = sub_1D40B9190;
  v15[3] = &unk_1E974B278;
  v16 = v9;
  v13 = v9;
  objc_msgSend_remote_setOverrideBundleIdentifier_completion_(v12, v14, (uint64_t)v10, v15);

}

- (void)deleteAppWithBundleIdentifier:(id)a3 completion:(id)a4
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
  v12[2] = sub_1D40B92E8;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  objc_msgSend_server_(self, v9, (uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_deleteAppWithBundleIdentifier_completion_(v10, v11, (uint64_t)v8, v7);

}

- (void)connect
{
  uint64_t v2;

  objc_msgSend_serverConnection(self, a2, v2);

}

- (void)addBarrierBlock:(id)a3
{
  void (**v4)(_QWORD);
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;

  v4 = (void (**)(_QWORD))a3;
  objc_msgSend_lock(self, v5, v6);
  if (objc_msgSend_isBorked(self, v7, v8))
    v4[2](v4);
  else
    objc_msgSend_addBarrierBlock_(self->_serverConnection, v9, (uint64_t)v4);

  objc_msgSend_unlock(self, v10, v11);
}

- (void)accountChanged
{
  const char *v2;
  uint64_t v3;
  id v4;

  objc_msgSend_server_(self, a2, (uint64_t)&unk_1E974BCE8);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_accountChanged(v4, v2, v3);

}

- (void)devModeChanged
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;

  objc_msgSend_lock(self, a2, v2);
  objc_msgSend_invalidate(self->_serverConnection, v4, v5);
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_userInfo_(v8, v9, (uint64_t)CFSTR("CLSDeveloperModeDidChangeNotification"), 0, 0);

  objc_msgSend_unlock(self, v10, v11);
}

- (NSString)overrideBundleIdentifier
{
  return self->_overrideBundleIdentifier;
}

- (void)setOverrideBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)onInterupt
{
  return self->_onInterupt;
}

- (void)setOnInterupt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)onConnect
{
  return self->_onConnect;
}

- (void)setOnConnect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onConnect, 0);
  objc_storeStrong(&self->_onInterupt, 0);
  objc_storeStrong((id *)&self->_overrideBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

@end
