@implementation FSModuleExtension

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (gSecondaryListener)
  {
    objc_msgSend((id)gSecondaryListener, "invalidate");
    v3 = (void *)gSecondaryListener;
    gSecondaryListener = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)FSModuleExtension;
  -[FSModuleExtension dealloc](&v4, sel_dealloc);
}

- (void)didFinishLaunching
{
  OUTLINED_FUNCTION_12(&dword_23B2A6000, a1, a3, "FSModule initial setup", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_19();
}

- (BOOL)fskitdIsClient:(id)a3
{
  id v3;
  void *v4;
  __SecTask *v5;
  __SecTask *v6;
  __CFString *v7;
  __CFString *v8;
  CFTypeID v9;
  NSObject *v10;
  char v11;
  audit_token_t v13[2];

  v3 = a3;
  v4 = v3;
  memset(&v13[1], 0, sizeof(audit_token_t));
  if (v3)
    objc_msgSend(v3, "auditToken");
  v13[0] = v13[1];
  v5 = SecTaskCreateWithAuditToken(0, v13);
  if (v5)
  {
    v6 = v5;
    v7 = (__CFString *)SecTaskCopyValueForEntitlement(v5, CFSTR("application-identifier"), 0);
    if (v7)
    {
      v8 = v7;
      v9 = CFGetTypeID(v7);
      if (v9 == CFStringGetTypeID())
      {
LABEL_8:
        CFRelease(v6);
        goto LABEL_10;
      }
      CFRelease(v8);
    }
    v8 = &stru_250C33628;
    goto LABEL_8;
  }
  v8 = &stru_250C33628;
LABEL_10:
  fskit_std_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[FSModuleExtension fskitdIsClient:].cold.1();

  v11 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("com.apple.filesystems.fskitd"));
  return v11;
}

- (NSXPCListener)secondaryListener
{
  void *v3;
  FSModuleExtension *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x23B861B50](self, a2);
  v4 = self;
  objc_sync_enter(v4);
  if (!gSecondaryListener)
  {
    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)gSecondaryListener;
    gSecondaryListener = v5;

    if (gSecondaryListener)
    {
      objc_msgSend((id)gSecondaryListener, "setDelegate:", v4);
      objc_msgSend((id)gSecondaryListener, "resume");
    }
  }
  fskit_std_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = gSecondaryListener;
    _os_log_impl(&dword_23B2A6000, v7, OS_LOG_TYPE_DEFAULT, "Set secondary listener up %@", (uint8_t *)&v10, 0xCu);
  }

  v8 = (id)gSecondaryListener;
  objc_sync_exit(v4);

  objc_autoreleasePoolPop(v3);
  return (NSXPCListener *)v8;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return -[FSModuleExtension shouldAcceptConnection:](self, "shouldAcceptConnection:", a4);
}

- (BOOL)isFSSubclass
{
  return self->_isFSSubclass;
}

- (BOOL)isSimpleFSSubclass
{
  return self->_isSimpleFSSubclass;
}

- (BOOL)isNormalFS
{
  return self->_isNormalFS;
}

- (BOOL)isSimpleFS
{
  return self->_isSimpleFS;
}

- (BOOL)supportsBlockOps
{
  return self->_supportsBlockOps;
}

- (BOOL)supportsSimpleMaintenanceOps
{
  return self->_supportsSimpleMaintenanceOps;
}

- (BOOL)supportsServerOps
{
  return self->_supportsServerOps;
}

- (BOOL)delegateConformantFS
{
  return self->_delegateConformantFS;
}

- (NSObject)strongDelegate
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setStrongDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (FSContainerIdentifier)instanceID
{
  return (FSContainerIdentifier *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInstanceID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSMutableDictionary)taskSet
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTaskSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableArray)connectors
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (NSMutableDictionary)volumes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (FSResource)resource
{
  return (FSResource *)objc_getProperty(self, a2, 96, 1);
}

- (void)setResource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (FSModuleConnector)fskitdCurrentConnection
{
  return (FSModuleConnector *)objc_loadWeakRetained((id *)&self->_fskitdCurrentConnection);
}

- (void)setFskitdCurrentConnection:(id)a3
{
  objc_storeWeak((id *)&self->_fskitdCurrentConnection, a3);
}

- (LiveFSMachPort)fsMachPort
{
  return (LiveFSMachPort *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFsMachPort:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fsMachPort, 0);
  objc_destroyWeak((id *)&self->_fskitdCurrentConnection);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_volumes, 0);
  objc_storeStrong((id *)&self->_connectors, 0);
  objc_storeStrong((id *)&self->_taskSet, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_strongDelegate, 0);
}

+ (id)moduleExtensionForAppex:(id)a3
{
  id v4;
  FSModuleExtension *v5;
  id *p_isa;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v5 = -[FSModuleExtension init]([FSModuleExtension alloc], "init");
  p_isa = (id *)&v5->super.super.isa;
  if (v5)
  {
    -[_EXExtension setDelegate:](v5, "setDelegate:", v4);
    objc_storeStrong(p_isa + 6, a3);
    fskit_std_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[FSModuleExtension(Project) moduleExtensionForAppex:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  return p_isa;
}

- (BOOL)shouldAcceptConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setOurModule:", self);
  objc_msgSend(v5, "setOurConnection:", v4);
  if (-[FSModuleExtension fskitdIsClient:](self, "fskitdIsClient:", v4))
    objc_storeWeak((id *)&self->_fskitdCurrentConnection, v5);
  objc_msgSend(v4, "setExportedObject:", v5);
  +[FSKitConstants FSModuleExtensionXPCProtocol](FSKitConstants, "FSModuleExtensionXPCProtocol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v6);

  +[FSKitConstants FSModuleExtensionHostXPCProtocol](FSKitConstants, "FSModuleExtensionHostXPCProtocol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v7);

  objc_msgSend(v4, "resume");
  -[NSMutableArray addObject:](self->_connectors, "addObject:", v5);
  fskit_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[FSModuleExtension(Project) shouldAcceptConnection:]";
    _os_log_impl(&dword_23B2A6000, v8, OS_LOG_TYPE_DEFAULT, "%s returning YES", (uint8_t *)&v10, 0xCu);
  }

  return 1;
}

- (void)sendWipeResource:(id)a3 includingBlockRanges:(id)a4 excludingBlockRanges:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id WeakRetained;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  _QWORD v34[4];
  id v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  fskit_std_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[FSModuleExtension(Project) sendWipeResource:includingBlockRanges:excludingBlockRanges:replyHandler:].cold.3(v14, v15, v16, v17, v18, v19, v20, v21);

  WeakRetained = objc_loadWeakRetained((id *)&self->_fskitdCurrentConnection);
  if (WeakRetained)
  {
    v23 = objc_loadWeakRetained((id *)&self->_fskitdCurrentConnection);
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __102__FSModuleExtension_Project__sendWipeResource_includingBlockRanges_excludingBlockRanges_replyHandler___block_invoke;
    v34[3] = &unk_250C31EC8;
    v35 = v13;
    objc_msgSend(v23, "sendWipeResource:includingBlockRanges:excludingBlockRanges:replyHandler:", v10, v11, v12, v34);

    fskit_std_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[FSModuleExtension(Project) sendWipeResource:includingBlockRanges:excludingBlockRanges:replyHandler:].cold.2(v24, v25, v26, v27, v28, v29, v30, v31);

    v32 = v35;
  }
  else
  {
    fskit_std_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[FSModuleExtension(Project) sendWipeResource:includingBlockRanges:excludingBlockRanges:replyHandler:].cold.1(self, v33);

    fs_errorForPOSIXError(45);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v13 + 2))(v13, v32);
  }

}

uint64_t __102__FSModuleExtension_Project__sendWipeResource_includingBlockRanges_excludingBlockRanges_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendIsVolumeUsed:(id)a3 bundle:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id WeakRetained;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  fskit_std_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[FSModuleExtension(Project) sendIsVolumeUsed:bundle:replyHandler:].cold.3();

  WeakRetained = objc_loadWeakRetained((id *)&self->_fskitdCurrentConnection);
  if (WeakRetained)
  {
    v13 = objc_loadWeakRetained((id *)&self->_fskitdCurrentConnection);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __67__FSModuleExtension_Project__sendIsVolumeUsed_bundle_replyHandler___block_invoke;
    v24[3] = &unk_250C31EF0;
    v25 = v10;
    objc_msgSend(v13, "sendIsVolumeUsed:bundle:replyHandler:", v8, v9, v24);

    fskit_std_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[FSModuleExtension(Project) sendIsVolumeUsed:bundle:replyHandler:].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);

    v22 = v25;
  }
  else
  {
    fskit_std_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[FSModuleExtension(Project) sendIsVolumeUsed:bundle:replyHandler:].cold.1(self, v23);

    fs_errorForPOSIXError(45);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v22);
  }

}

uint64_t __67__FSModuleExtension_Project__sendIsVolumeUsed_bundle_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getFSMachPort
{
  return self->_fsMachPort;
}

- (void)sendConfigureUserClient:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;

  v6 = a3;
  v7 = a4;
  fskit_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FSModuleExtension(Project) sendConfigureUserClient:replyHandler:].cold.3();

  WeakRetained = objc_loadWeakRetained((id *)&self->_fskitdCurrentConnection);
  if (WeakRetained)
  {
    v10 = objc_loadWeakRetained((id *)&self->_fskitdCurrentConnection);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __67__FSModuleExtension_Project__sendConfigureUserClient_replyHandler___block_invoke;
    v21[3] = &unk_250C31EC8;
    v22 = v7;
    objc_msgSend(v10, "sendConfigureUserClient:replyHandler:", v6, v21);

    fskit_std_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[FSModuleExtension(Project) sendConfigureUserClient:replyHandler:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);

    v19 = v22;
  }
  else
  {
    fskit_std_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[FSModuleExtension(Project) sendConfigureUserClient:replyHandler:].cold.1(self, v20);

    fs_errorForPOSIXError(45);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v19);
  }

}

uint64_t __67__FSModuleExtension_Project__sendConfigureUserClient_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fskitdIsClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v0, v1, "%s: connection application identifier (%@)", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

@end
