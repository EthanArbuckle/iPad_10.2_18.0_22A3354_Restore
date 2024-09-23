@implementation DNDSRemoteAvailabilityServiceProvider

- (DNDSRemoteAvailabilityServiceProvider)initWithClientDetailsProvider:(id)a3
{
  id v5;
  DNDSRemoteAvailabilityServiceProvider *v6;
  DNDSRemoteAvailabilityServiceProvider *v7;
  NSMutableSet *v8;
  NSMutableSet *connections;
  void *v10;
  DNDSRemoteAvailabilityServiceProvider *v11;
  uint64_t v12;
  BSServiceConnectionListener *requestListener;
  _QWORD v15[4];
  DNDSRemoteAvailabilityServiceProvider *v16;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DNDSRemoteAvailabilityServiceProvider;
  v6 = -[DNDSRemoteAvailabilityServiceProvider init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_accessLock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    connections = v7->_connections;
    v7->_connections = v8;

    v10 = (void *)MEMORY[0x1E0D03460];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __71__DNDSRemoteAvailabilityServiceProvider_initWithClientDetailsProvider___block_invoke;
    v15[3] = &unk_1E86A5E58;
    v11 = v7;
    v16 = v11;
    objc_msgSend(v10, "listenerWithConfigurator:", v15);
    v12 = objc_claimAutoreleasedReturnValue();
    requestListener = v11->_requestListener;
    v11->_requestListener = (BSServiceConnectionListener *)v12;

    objc_storeStrong((id *)&v11->_clientDetailsProvider, a3);
  }

  return v7;
}

void __71__DNDSRemoteAvailabilityServiceProvider_initWithClientDetailsProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setDomain:", CFSTR("com.apple.donotdisturb.availability.service.launching"));
  DNDRemoteAvailabilityServiceServerInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setService:", v4);

  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)dealloc
{
  objc_super v3;

  -[DNDSRemoteAvailabilityServiceProvider invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)DNDSRemoteAvailabilityServiceProvider;
  -[DNDSRemoteAvailabilityServiceProvider dealloc](&v3, sel_dealloc);
}

- (void)resume
{
  id v2;

  -[BSServiceConnectionListener activate](self->_requestListener, "activate");
  v2 = (id)objc_msgSend(MEMORY[0x1E0D03488], "activateManualDomain:", CFSTR("com.apple.donotdisturb.availability.service.launching"));
}

- (void)invalidate
{
  -[BSServiceConnectionListener invalidate](self->_requestListener, "invalidate");
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  BSServiceConnectionListener *v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id location;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = (BSServiceConnectionListener *)a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  if (self->_requestListener == v8)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __83__DNDSRemoteAvailabilityServiceProvider_listener_didReceiveConnection_withContext___block_invoke;
    v12[3] = &unk_1E86A5EA8;
    v12[4] = self;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v9, "configureConnection:", v12);
    objc_destroyWeak(&v13);
    -[DNDSRemoteAvailabilityServiceProvider _addConnection:](self, "_addConnection:", v9);
    objc_msgSend(v9, "activate");
    v11 = DNDSLogAvailabilityProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v9;
      _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "XPC connection successfully accepted: connection=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v9, "invalidate");
  }
  objc_destroyWeak(&location);

}

void __83__DNDSRemoteAvailabilityServiceProvider_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  DNDRemoteAvailabilityServiceServerInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__DNDSRemoteAvailabilityServiceProvider_listener_didReceiveConnection_withContext___block_invoke_2;
  v9[3] = &unk_1E86A5E80;
  a1 += 40;
  objc_copyWeak(&v10, (id *)a1);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __83__DNDSRemoteAvailabilityServiceProvider_listener_didReceiveConnection_withContext___block_invoke_3;
  v7[3] = &unk_1E86A5E80;
  objc_copyWeak(&v8, (id *)a1);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);

}

void __83__DNDSRemoteAvailabilityServiceProvider_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleClientConnectionInterrupted:", v3);

}

void __83__DNDSRemoteAvailabilityServiceProvider_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleClientConnectionInvalidated:", v3);

}

- (void)getIsLocalUserAvailableWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void (**v35)(_QWORD, _QWORD, _QWORD);
  uint64_t *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  const __CFString *v59;
  uint64_t v60;
  const __CFString *v61;
  _BYTE buf[32];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v52 = a4;
  v8 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "UTF8String");
  v11 = os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(v12, "remoteProcess");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "auditToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v50 = (void *)v11;
  v51 = v7;
  if (v14)
  {
    objc_msgSend(v14, "realToken");
  }
  else
  {
    v54 = 0u;
    v55 = 0u;
  }

  *(_OWORD *)buf = v54;
  *(_OWORD *)&buf[16] = v55;
  v16 = TCCAccessCheckAuditToken();
  v17 = objc_msgSend(v12, "dnds_hasUserNotificationsCommunicationEntitlement");
  objc_msgSend(v12, "remoteProcess");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:", v19);
  *(_OWORD *)buf = v54;
  *(_OWORD *)&buf[16] = v55;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForAuditToken:error:", buf, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v21, "containingBundleRecord");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bundleIdentifier");
    v23 = objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:", v23);
    if ((v17 & 1) != 0)
    {
      v17 = 1;
    }
    else
    {
      objc_msgSend(v22, "entitlements");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKey:ofClass:", CFSTR("com.apple.developer.usernotifications.communication"), objc_opt_class());
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v26, "BOOLValue");

    }
    v20 = (void *)v24;
    v19 = (void *)v23;
  }
  else
  {
    v22 = v21;
  }
  v27 = DNDGrantedUserNotificationsAuthorizationForBundleIdentifier(v19);
  if (!v16 || !v17 || !v27)
  {
    v36 = (uint64_t *)MEMORY[0x1E0D1D3E0];
    if ((v27 & 1) != 0)
    {
      v30 = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR))
        -[DNDSRemoteAvailabilityServiceProvider getIsLocalUserAvailableWithRequestDetails:completionHandler:].cold.3();
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v38 = *v36;
      v60 = *MEMORY[0x1E0CB2D50];
      v61 = CFSTR("User Notifications are disabled for this App.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, 1004, v39);
      v30 = (id)objc_claimAutoreleasedReturnValue();

    }
    v35 = (void (**)(_QWORD, _QWORD, _QWORD))v52;
    if (v16)
    {
      v34 = v51;
      if ((v17 & 1) != 0)
        goto LABEL_24;
    }
    else
    {
      v34 = v51;
      if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR))
        -[DNDSRemoteAvailabilityServiceProvider getIsLocalUserAvailableWithRequestDetails:completionHandler:].cold.2();
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0D1D3E0];
      v58 = *MEMORY[0x1E0CB2D50];
      v59 = CFSTR("Focus Status is not shared with this App.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", v41, 1004, v42);
      v43 = objc_claimAutoreleasedReturnValue();

      v30 = (id)v43;
      v35 = (void (**)(_QWORD, _QWORD, _QWORD))v52;
      if ((v17 & 1) != 0)
      {
LABEL_24:
        v33 = v50;
        if (!v35)
          goto LABEL_33;
        goto LABEL_32;
      }
    }
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteAvailabilityServiceProvider getIsLocalUserAvailableWithRequestDetails:completionHandler:].cold.1();
    v44 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0D1D3E0];
    v56 = *MEMORY[0x1E0CB2D50];
    v57 = CFSTR("App is missing Communication Notifications entitlement.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "errorWithDomain:code:userInfo:", v45, 1004, v46);
    v47 = objc_claimAutoreleasedReturnValue();

    v30 = (id)v47;
    v33 = v50;
    v35 = (void (**)(_QWORD, _QWORD, _QWORD))v52;
    if (!v52)
      goto LABEL_33;
LABEL_32:
    ((void (**)(_QWORD, _QWORD, id))v35)[2](v35, MEMORY[0x1E0C9AAB0], v30);
LABEL_33:
    objc_msgSend(v12, "invalidate");
    goto LABEL_39;
  }
  -[DNDSRemoteAvailabilityServiceProvider delegate](self, "delegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  v29 = objc_msgSend(v28, "remoteAvailabilityServiceProvider:isLocalUserAvailableForApplicationIdentifier:withError:", self, v20, &v53);
  v30 = v53;

  v31 = DNDSLogAvailabilityProvider;
  v32 = os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_DEFAULT);
  if (v30)
  {
    v33 = v50;
    v34 = v51;
    if (v32)
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v51;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v30;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v12;
      _os_log_impl(&dword_1CB895000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error determining Focus Status; will report YES for available: error=%{public}@ connection=%{public}@",
        buf,
        0x20u);
    }
    v35 = (void (**)(_QWORD, _QWORD, _QWORD))v52;
    (*((void (**)(id, _QWORD, id))v52 + 2))(v52, MEMORY[0x1E0C9AAB0], v30);
  }
  else
  {
    v33 = v50;
    v34 = v51;
    if (v32)
    {
      v48 = CFSTR("NO");
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v51;
      *(_WORD *)&buf[12] = 2114;
      if ((_DWORD)v29)
        v48 = CFSTR("YES");
      *(_QWORD *)&buf[14] = v48;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v12;
      _os_log_impl(&dword_1CB895000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Determinined Focus Status: available=%{public}@ connection=%{public}@", buf, 0x20u);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v29);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void (**)(_QWORD, _QWORD, _QWORD))v52;
    (*((void (**)(id, void *, _QWORD))v52 + 2))(v52, v49, 0);

  }
LABEL_39:

}

- (void)_handleClientConnectionInterrupted:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = DNDSLogAvailabilityProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Client XPC connection was interrupted: connection=%{public}@", (uint8_t *)&v6, 0xCu);
  }
  -[DNDSRemoteAvailabilityServiceProvider _removeConnection:](self, "_removeConnection:", v4);

}

- (void)_handleClientConnectionInvalidated:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = DNDSLogAvailabilityProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Client XPC connection was invalidated: connection=%{public}@", (uint8_t *)&v6, 0xCu);
  }
  -[DNDSRemoteAvailabilityServiceProvider _removeConnection:](self, "_removeConnection:", v4);

}

- (void)_addConnection:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  -[NSMutableSet addObject:](self->_connections, "addObject:", v5);

  os_unfair_lock_unlock(p_accessLock);
}

- (void)_removeConnection:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  -[NSMutableSet removeObject:](self->_connections, "removeObject:", v5);

  os_unfair_lock_unlock(p_accessLock);
}

- (DNDSRemoteAvailabilityServiceProviderDelegate)delegate
{
  return (DNDSRemoteAvailabilityServiceProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_clientDetailsProvider, 0);
  objc_storeStrong((id *)&self->_requestListener, 0);
}

- (void)getIsLocalUserAvailableWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without Communication Notifications entitlement tried to get Focus Status, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getIsLocalUserAvailableWithRequestDetails:completionHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without sharing authorization tried to get Focus Status, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getIsLocalUserAvailableWithRequestDetails:completionHandler:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without User Notifications authorization tried to get Focus Status, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

@end
