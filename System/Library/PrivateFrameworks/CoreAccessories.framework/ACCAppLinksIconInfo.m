@implementation ACCAppLinksIconInfo

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ACCAppLinksIconInfo_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_0 != -1)
    dispatch_once(&sharedManager_once_0, block);
  return (id)sharedManager_sharedInstance_0;
}

void __36__ACCAppLinksIconInfo_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedManager_sharedInstance_0;
  sharedManager_sharedInstance_0 = v1;

}

- (ACCAppLinksIconInfo)init
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sharedManager);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Use +[%@ %@] instead of -%@."), v7, v8, v9);

  return 0;
}

- (id)_init
{
  ACCAppLinksIconInfo *v3;
  uint64_t v4;
  NSXPCConnection *xpcConnection;
  void *v6;
  objc_super v8;

  init_logging();
  v8.receiver = self;
  v8.super_class = (Class)ACCAppLinksIconInfo;
  v3 = -[ACCAppLinksIconInfo init](&v8, sel_init);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.coreaccessories.ACCAppLinksIconService"));
    xpcConnection = v3->_xpcConnection;
    v3->_xpcConnection = (NSXPCConnection *)v4;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4C0F0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v3->_xpcConnection, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection resume](v3->_xpcConnection, "resume");
  }
  return v3;
}

- (void)getIconDataForBundleID:(id)a3 forIconSize:(double)a4 withReply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD v19[4];
  NSObject *v20;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    -[ACCAppLinksIconInfo xpcConnection](self, "xpcConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __68__ACCAppLinksIconInfo_getIconDataForBundleID_forIconSize_withReply___block_invoke;
    v19[3] = &unk_1E5FB3690;
    v12 = v9;
    v20 = v12;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __68__ACCAppLinksIconInfo_getIconDataForBundleID_forIconSize_withReply___block_invoke_12;
    v17[3] = &unk_1E5FB3990;
    v18 = v12;
    objc_msgSend(v13, "getIconDataForBundleID:forIconSize:withReply:", v8, v17, a4);

    v14 = v20;
  }
  else
  {
    if (gLogObjects)
      v15 = gNumLogObjects < 5;
    else
      v15 = 1;
    if (v15)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v14 = MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
    }
    else
    {
      v14 = *(id *)(gLogObjects + 32);
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ACCAppLinksIconInfo getIconDataForBundleID:forIconSize:withReply:].cold.1(v14);
  }

}

void __68__ACCAppLinksIconInfo_getIconDataForBundleID_forIconSize_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 5;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    __68__ACCAppLinksIconInfo_getIconDataForBundleID_forIconSize_withReply___block_invoke_cold_1((uint64_t)v3, v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__ACCAppLinksIconInfo_getIconDataForBundleID_forIconSize_withReply___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)getIconDataForBundleID:(os_log_t)log forIconSize:withReply:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AF649000, log, OS_LOG_TYPE_ERROR, "no reply handler!", v1, 2u);
}

void __68__ACCAppLinksIconInfo_getIconDataForBundleID_forIconSize_withReply___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1AF649000, a2, OS_LOG_TYPE_FAULT, "can't invoke remote object %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

@end
