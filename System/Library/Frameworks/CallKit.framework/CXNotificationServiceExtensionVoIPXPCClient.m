@implementation CXNotificationServiceExtensionVoIPXPCClient

- (CXNotificationServiceExtensionVoIPXPCClient)init
{
  CXNotificationServiceExtensionVoIPXPCClient *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CXNotificationServiceExtensionVoIPXPCClient;
  result = -[CXNotificationServiceExtensionVoIPXPCClient init](&v3, sel_init);
  if (result)
    result->_accessorLock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)dealloc
{
  os_unfair_lock_s *p_accessorLock;
  objc_super v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  os_unfair_lock_unlock(p_accessorLock);
  v4.receiver = self;
  v4.super_class = (Class)CXNotificationServiceExtensionVoIPXPCClient;
  -[CXNotificationServiceExtensionVoIPXPCClient dealloc](&v4, sel_dealloc);
}

- (NSXPCConnection)connection
{
  os_unfair_lock_s *p_accessorLock;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  uint64_t v8;
  NSXPCConnection *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  connection = self->_connection;
  if (!connection)
  {
    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.callkit.notificationserviceextension.voip"), 0);
    v6 = self->_connection;
    self->_connection = v5;

    objc_msgSend(MEMORY[0x1E0CB3B50], "cx_notificationServiceExtensionInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__CXNotificationServiceExtensionVoIPXPCClient_connection__block_invoke;
    v13[3] = &unk_1E4B88CA8;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v13);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __57__CXNotificationServiceExtensionVoIPXPCClient_connection__block_invoke_5;
    v11[3] = &unk_1E4B88CA8;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v11);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  v9 = connection;
  os_unfair_lock_unlock(p_accessorLock);
  return v9;
}

void __57__CXNotificationServiceExtensionVoIPXPCClient_connection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CXDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = WeakRetained;
      _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for notification service extension message host %@", (uint8_t *)&v3, 0xCu);
    }

    objc_msgSend(WeakRetained, "invalidate");
    objc_msgSend(WeakRetained, "setConnection:", 0);
  }

}

void __57__CXNotificationServiceExtensionVoIPXPCClient_connection__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CXDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = WeakRetained;
      _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for notification service extension message host %@", (uint8_t *)&v3, 0xCu);
    }

    objc_msgSend(WeakRetained, "setConnection:", 0);
  }

}

- (void)invalidate
{
  id v2;

  -[CXNotificationServiceExtensionVoIPXPCClient connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (BOOL)taskHasEntitlement:(id)a3
{
  __CFString *v3;
  __SecTask *v4;
  __SecTask *v5;
  CFTypeRef v6;
  CFTypeID v7;

  v3 = (__CFString *)a3;
  v4 = SecTaskCreateFromSelf(0);
  v5 = v4;
  if (v4)
  {
    v6 = SecTaskCopyValueForEntitlement(v4, v3, 0);
    CFRelease(v5);
    if (v6)
    {
      v7 = CFGetTypeID(v6);
      LOBYTE(v5) = v7 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v6) != 0;
      CFRelease(v6);
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }

  return (char)v5;
}

- (BOOL)requestDidArriveFromExtensionPoint
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("NSExtension"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("PlugInKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

- (void)requestApplicationLaunchForIncomingCall:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (!-[CXNotificationServiceExtensionVoIPXPCClient taskHasEntitlement:](self, "taskHasEntitlement:", CFSTR("com.apple.developer.usernotifications.filtering")))
  {
    if (!v7)
      goto LABEL_9;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = 2;
LABEL_8:
    objc_msgSend(v11, "cx_notificationServiceExtensionErrorWithCode:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v13);

    goto LABEL_9;
  }
  if (!-[CXNotificationServiceExtensionVoIPXPCClient requestDidArriveFromExtensionPoint](self, "requestDidArriveFromExtensionPoint"))
  {
    if (!v7)
      goto LABEL_9;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = 1;
    goto LABEL_8;
  }
  -[CXNotificationServiceExtensionVoIPXPCClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __98__CXNotificationServiceExtensionVoIPXPCClient_requestApplicationLaunchForIncomingCall_completion___block_invoke;
  v14[3] = &unk_1E4B89080;
  v9 = v7;
  v15 = v9;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notificationServiceExtension:reply:", v6, v9);

LABEL_9:
}

void __98__CXNotificationServiceExtensionVoIPXPCClient_requestApplicationLaunchForIncomingCall_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __98__CXNotificationServiceExtensionVoIPXPCClient_requestApplicationLaunchForIncomingCall_completion___block_invoke_cold_1((uint64_t)v3, v4);

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __98__CXNotificationServiceExtensionVoIPXPCClient_requestApplicationLaunchForIncomingCall_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A402D000, a2, OS_LOG_TYPE_ERROR, "Could not send VoIP notification service extension message due to connection error %@", (uint8_t *)&v2, 0xCu);
}

@end
