@implementation SecuritydXPCClient

- (SecuritydXPCClient)init
{
  return (SecuritydXPCClient *)-[SecuritydXPCClient initTargetingSession:](self, "initTargetingSession:", 1);
}

- (id)initTargetingSession:(int)a3
{
  SecuritydXPCClient *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  SecuritydXPCClient *v12;
  int foreground_uid;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)SecuritydXPCClient;
  v4 = -[SecuritydXPCClient init](&v19, sel_init);
  if (!v4)
  {
LABEL_13:
    v12 = v4;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF889E8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.securityd.general"), 0);
  -[SecuritydXPCClient setConnection:](v4, "setConnection:", v6);

  -[SecuritydXPCClient connection](v4, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SecuritydXPCClient connection](v4, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRemoteObjectInterface:", v5);

    -[SecuritydXPCClient connection](v4, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteObjectInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SecuritydXPCClient configureSecuritydXPCProtocol:](SecuritydXPCClient, "configureSecuritydXPCProtocol:", v10);

    if (!a3)
    {
      secLogObjForScope("SecuritydXPCClient");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEBUG, "Possibly targeting foreground session", buf, 2u);
      }

      if (xpc_user_sessions_enabled())
      {
        foreground_uid = xpc_user_sessions_get_foreground_uid();
        secLogObjForScope("SecuritydXPCClient");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          v21 = foreground_uid;
          _os_log_debug_impl(&dword_18A900000, v14, OS_LOG_TYPE_DEBUG, "Targeting foreground session for uid %d", buf, 8u);
        }

        -[SecuritydXPCClient connection](v4, "connection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_xpcConnection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_connection_set_target_user_session_uid();

      }
    }
    -[SecuritydXPCClient connection](v4, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "resume");

    goto LABEL_13;
  }

  v12 = 0;
LABEL_14:

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SecuritydXPCClient connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)SecuritydXPCClient;
  -[SecuritydXPCClient dealloc](&v4, sel_dealloc);
}

- (id)protocolWithSync:(BOOL)a3 errorHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v6 = a4;
  -[SecuritydXPCClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
  else
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

+ (void)configureSecuritydXPCProtocol:(id)a3
{
  id v3;
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
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF80430);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v4, sel_SecItemAddAndNotifyOnSync_syncCallback_complete_, 1, 0);
  +[SecXPCHelper safeErrorClasses](SecXPCHelper, "safeErrorClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E60];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99E60];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_callCallback_error_, 1, 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_SecItemAddAndNotifyOnSync_syncCallback_complete_, 2, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_secItemSetCurrentItemAcrossAllDevices_newCurrentItemHash_accessGroup_identifier_viewHint_oldCurrentItemReference_oldCurrentItemHash_complete_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_secItemUnsetCurrentItemsAcrossAllDevices_identifiers_viewHint_complete_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_secItemFetchCurrentItemAcrossAllDevices_identifier_viewHint_fetchCloudValue_complete_, 2, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_secItemDigest_accessGroup_complete_, 1, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_secKeychainDeleteMultiuser_complete_, 1, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_secItemFetchCurrentItemOutOfBand_forceFetch_complete_, 0, 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_secItemFetchCurrentItemOutOfBand_forceFetch_complete_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_secItemFetchCurrentItemOutOfBand_forceFetch_complete_, 1, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_secItemFetchPCSIdentityByKeyOutOfBand_forceFetch_complete_, 0, 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_secItemFetchPCSIdentityByKeyOutOfBand_forceFetch_complete_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_secItemFetchPCSIdentityByKeyOutOfBand_forceFetch_complete_, 1, 1);

}

@end
