@implementation CXNotificationServiceExtensionVoIPXPCHost

- (CXNotificationServiceExtensionVoIPXPCHost)initWithDelegate:(id)a3
{
  id v4;
  CXNotificationServiceExtensionVoIPXPCHost *v5;
  CXNotificationServiceExtensionVoIPXPCHost *v6;
  NSObject *v7;
  uint64_t v8;
  NSXPCListener *xpcListener;
  objc_super v11;
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXNotificationServiceExtensionVoIPXPCHost;
  v5 = -[CXNotificationServiceExtensionVoIPXPCHost init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    CXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = CFSTR("com.apple.callkit.notificationserviceextension.voip");
      _os_log_impl(&dword_1A402D000, v7, OS_LOG_TYPE_DEFAULT, "Initializing XPC Service %@", buf, 0xCu);
    }

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.callkit.notificationserviceextension.voip"));
    xpcListener = v6->_xpcListener;
    v6->_xpcListener = (NSXPCListener *)v8;

    -[NSXPCListener setDelegate:](v6->_xpcListener, "setDelegate:", v6);
    -[NSXPCListener resume](v6->_xpcListener, "resume");
  }

  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  CXDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1A402D000, v6, OS_LOG_TYPE_DEFAULT, "Asked to accept new connection from %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x1E0CB3B50], "cx_notificationServiceExtensionInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v7);

  objc_msgSend(v5, "resume");
  return 1;
}

- (void)notificationServiceExtension:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v23;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "cx_bundleIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v23 = 0;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:error:", v10, &v23);
      v13 = v23;
      if (v12)
      {
        objc_msgSend(v12, "extensionPointRecord");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.usernotifications.service"));

        if ((v16 & 1) != 0)
        {
          objc_msgSend(v12, "containingBundleRecord");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "bundleIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            -[CXNotificationServiceExtensionVoIPXPCHost notificationServiceExtensionHost:didReceiveIncomingMessage:forBundleIdentifier:reply:](self, "notificationServiceExtensionHost:didReceiveIncomingMessage:forBundleIdentifier:reply:", self, v6, v18, v7);
LABEL_16:

            goto LABEL_17;
          }
          if (!v7)
            goto LABEL_17;
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v22 = 0;
LABEL_15:
          objc_msgSend(v21, "cx_notificationServiceExtensionErrorWithCode:", v22);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, v18);
          goto LABEL_16;
        }
        CXDefaultLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[CXNotificationServiceExtensionVoIPXPCHost notificationServiceExtension:reply:].cold.2((uint64_t)v11, v20);
      }
      else
      {
        CXDefaultLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[CXNotificationServiceExtensionVoIPXPCHost notificationServiceExtension:reply:].cold.1((uint64_t)v11, (uint64_t)v13, v20);
      }

      if (!v7)
      {
LABEL_17:

        goto LABEL_18;
      }
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = 1;
      goto LABEL_15;
    }
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "cx_notificationServiceExtensionErrorWithCode:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v19);

  }
LABEL_18:

}

- (void)notificationServiceExtensionHost:(id)a3 didReceiveIncomingMessage:(id)a4 forBundleIdentifier:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[CXNotificationServiceExtensionVoIPXPCHost delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "notificationServiceExtensionHost:didReceiveIncomingMessage:forBundleIdentifier:reply:", self, v11, v10, v9);

}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (CXNotificationServiceExtensionHostDelegate)delegate
{
  return (CXNotificationServiceExtensionHostDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

- (void)notificationServiceExtension:(os_log_t)log reply:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1A402D000, log, OS_LOG_TYPE_ERROR, "Aborting request, could not find application record for bundle id %@, error %@", (uint8_t *)&v3, 0x16u);
}

- (void)notificationServiceExtension:(uint64_t)a1 reply:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A402D000, a2, OS_LOG_TYPE_ERROR, "Aborting request %@ did not arrive from Notification Service Extension", (uint8_t *)&v2, 0xCu);
}

@end
