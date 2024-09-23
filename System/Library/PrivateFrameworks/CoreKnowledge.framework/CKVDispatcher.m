@implementation CKVDispatcher

- (CKVDispatcher)initWithQueue:(id)a3 adminServiceProvider:(id)a4 taskManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  CKVDispatcher *v12;
  id *p_isa;
  CKVDispatcher *v14;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CKVDispatcher;
  v12 = -[CKVDispatcher init](&v17, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (!v12
    || (objc_storeStrong((id *)&v12->_queue, a3),
        objc_storeStrong(p_isa + 3, a4),
        objc_storeStrong(p_isa + 4, a5),
        p_isa[3])
    && p_isa[4])
  {
    v14 = p_isa;
  }
  else
  {
    v15 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[CKVDispatcher initWithQueue:adminServiceProvider:taskManager:]";
      _os_log_error_impl(&dword_1A48B3000, v15, OS_LOG_TYPE_ERROR, "%s Invalid parameters", buf, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

- (CKVDispatcher)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)registerXPCActivities
{
  CKVRegisterPostOSInstallMigrationActivity();
  CKVRegisterIndexMaintenanceActivity();
}

- (void)setupXPCListeners
{
  NSXPCListener *v3;
  NSXPCListener *adminServiceListener;

  -[CKVDispatcher _listenerWithMachServiceName:delegate:](self, "_listenerWithMachServiceName:delegate:", CFSTR("com.apple.siriknowledged.vocabulary.admin"), self);
  v3 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
  adminServiceListener = self->_adminServiceListener;
  self->_adminServiceListener = v3;

}

- (id)_listenerWithMachServiceName:(id)a3 delegate:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0CB3B58];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithMachServiceName:", v7);

  objc_msgSend(v8, "setDelegate:", v6);
  objc_msgSend(v8, "resume");
  return v8;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  const char *v12;
  __int16 v13;
  NSXPCListener *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (NSXPCListener *)a3;
  v7 = a4;
  if (self->_adminServiceListener == v6)
  {
    v9 = -[CKVDispatcher _adminServiceShouldAcceptNewConnection:](self, "_adminServiceShouldAcceptNewConnection:", v7);
  }
  else
  {
    v8 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "-[CKVDispatcher listener:shouldAcceptNewConnection:]";
      v13 = 2112;
      v14 = v6;
      _os_log_error_impl(&dword_1A48B3000, v8, OS_LOG_TYPE_ERROR, "%s Unrecognized listener passed to delegate: %@", (uint8_t *)&v11, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)_adminServiceShouldAcceptNewConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.siri.vocabulary.admin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE783730);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExportedInterface:", v6);

    -[CKVAdminServiceProvider adminService](self->_adminServiceProvider, "adminService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExportedObject:", v7);

    objc_msgSend(v4, "resume");
    v8 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      v13 = 136315394;
      v14 = "-[CKVDispatcher _adminServiceShouldAcceptNewConnection:]";
      v15 = 1024;
      v16 = objc_msgSend(v4, "processIdentifier");
      v10 = "%s New connection established to process with pid=(%d)";
LABEL_6:
      _os_log_impl(&dword_1A48B3000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v13, 0x12u);

    }
  }
  else
  {
    v11 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v9 = v11;
      v13 = 136315394;
      v14 = "-[CKVDispatcher _adminServiceShouldAcceptNewConnection:]";
      v15 = 1024;
      v16 = objc_msgSend(v4, "processIdentifier");
      v10 = "%s Connecting process with pid=(%d) is not entitled for vocabulary admin service - rejecting connection.";
      goto LABEL_6;
    }
  }

  return v5 != 0;
}

- (void)handleBridgeActivityUpdate:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D42B30]))
    -[CKVTaskManager handleTask:reason:shouldDefer:completion:](self->_taskManager, "handleTask:reason:shouldDefer:completion:", 11, 19, 0, 0);
}

- (void)handleDarwinNotificationEventWithName:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  CKVTaskManager *taskManager;
  uint64_t v9;
  uint64_t v10;
  CKVTaskManager *v11;
  _QWORD v12[4];
  void (**v13)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.assistant.siri_settings_did_change")))
  {
    taskManager = self->_taskManager;
    v9 = 1;
    v10 = 2;
LABEL_11:
    -[CKVTaskManager handleTask:reason:shouldDefer:completion:](taskManager, "handleTask:reason:shouldDefer:completion:", v9, v10, 0, v7);
    goto LABEL_12;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("__ABDataBaseChangedByOtherProcessNotification")))
  {
    taskManager = self->_taskManager;
    v9 = 2;
    v10 = 4;
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("INVoocabularyChangedNotification")))
  {
    taskManager = self->_taskManager;
    v9 = 1;
    v10 = 3;
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.homekit.sync-data-cache-updated")))
  {
    taskManager = self->_taskManager;
    v9 = 4;
    v10 = 6;
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated")))
  {
    taskManager = self->_taskManager;
    v9 = 7;
    v10 = 12;
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CFE508]))
  {
    v11 = self->_taskManager;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__CKVDispatcher_handleDarwinNotificationEventWithName_completion___block_invoke;
    v12[3] = &unk_1E4D29740;
    v13 = v7;
    -[CKVTaskManager handleTask:reason:shouldDefer:completion:](v11, "handleTask:reason:shouldDefer:completion:", 101, 8, 0, v12);

    goto LABEL_12;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.icloud.fmip.siri_data_changed")))
  {
    taskManager = self->_taskManager;
    v9 = 10;
    v10 = 18;
    goto LABEL_11;
  }
  if (v7)
    v7[2](v7);
LABEL_12:

}

- (void)handleDistributedNotificationEventWithName:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  CKVTaskManager *taskManager;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(_QWORD))a4;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.LaunchServices.applicationRegistered")) & 1) != 0
    || objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.LaunchServices.applicationUnregistered")))
  {
    taskManager = self->_taskManager;
    v8 = 3;
    v9 = 5;
LABEL_7:
    -[CKVTaskManager handleTask:reason:shouldDefer:completion:](taskManager, "handleTask:reason:shouldDefer:completion:", v8, v9, 0, v6);
    goto LABEL_8;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("ABDatabaseChangedExternallyNotificationPriv")) & 1) != 0
    || objc_msgSend(v10, "isEqualToString:", CFSTR("ABDistributedDatabaseChangedNotificationPriv")))
  {
    taskManager = self->_taskManager;
    v8 = 2;
    v9 = 4;
    goto LABEL_7;
  }
  if (v6)
    v6[2](v6);
LABEL_8:

}

- (void)runMigration:(id)a3
{
  id v4;
  CKVTaskManager *taskManager;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  taskManager = self->_taskManager;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__CKVDispatcher_runMigration___block_invoke;
  v7[3] = &unk_1E4D29740;
  v8 = v4;
  v6 = v4;
  -[CKVTaskManager handleTask:reason:shouldDefer:completion:](taskManager, "handleTask:reason:shouldDefer:completion:", 103, 1, 0, v7);

}

- (void)runMaintenanceWithShouldDefer:(id)a3 completion:(id)a4
{
  id v6;
  CKVTaskManager *taskManager;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  taskManager = self->_taskManager;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__CKVDispatcher_runMaintenanceWithShouldDefer_completion___block_invoke;
  v9[3] = &unk_1E4D29740;
  v10 = v6;
  v8 = v6;
  -[CKVTaskManager handleTask:reason:shouldDefer:completion:](taskManager, "handleTask:reason:shouldDefer:completion:", 102, 14, a3, v9);

}

- (NSXPCListener)donateServiceListener
{
  return self->_donateServiceListener;
}

- (NSXPCListener)adminServiceListener
{
  return self->_adminServiceListener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donateServiceListener, 0);
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_adminServiceProvider, 0);
  objc_storeStrong((id *)&self->_adminServiceListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __58__CKVDispatcher_runMaintenanceWithShouldDefer_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(getSEMDispatcherClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "administrator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__CKVDispatcher_runMaintenanceWithShouldDefer_completion___block_invoke_2;
  v4[3] = &unk_1E4D29460;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "triggerMaintenance:completion:", 0, v4);

}

uint64_t __58__CKVDispatcher_runMaintenanceWithShouldDefer_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  if (!+[CKVAssistantSettingsBridge isCustomerInstall](CKVAssistantSettingsBridge, "isCustomerInstall"))
  {
    +[CKVSnapshotManager sharedInstance](CKVSnapshotManager, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cleanup");

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __30__CKVDispatcher_runMigration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(getSEMDispatcherClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "administrator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__CKVDispatcher_runMigration___block_invoke_2;
  v4[3] = &unk_1E4D29460;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "triggerMaintenance:completion:", 0, v4);

}

uint64_t __30__CKVDispatcher_runMigration___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __66__CKVDispatcher_handleDarwinNotificationEventWithName_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sharedInstance;
}

void __31__CKVDispatcher_sharedInstance__block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  CKVAdminServiceFactory *v4;
  void *v5;
  void *v6;
  CKVAdminServiceFactory *v7;
  void *v8;
  CKVDispatcher *v9;
  void *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v0 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    v11 = 136315138;
    v12 = "+[CKVDispatcher sharedInstance]_block_invoke";
    _os_log_impl(&dword_1A48B3000, v0, OS_LOG_TYPE_INFO, "%s Starting up...", (uint8_t *)&v11, 0xCu);
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("CKVocabulary Dispatcher", v1);

  if (KVInitializeModularFilesystemLayout())
  {
    +[CKVTaskManager defaultManager](CKVTaskManager, "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = [CKVAdminServiceFactory alloc];
    objc_msgSend(getSEMDispatcherClass(), "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "administrator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CKVAdminServiceFactory initWithQueue:semAdministrator:taskManager:](v4, "initWithQueue:semAdministrator:taskManager:", v2, v6, v3);

    objc_msgSend(v3, "donateTaskProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setupBridgeListenersWithHandler:", &__block_literal_global_38);

    v9 = -[CKVDispatcher initWithQueue:adminServiceProvider:taskManager:]([CKVDispatcher alloc], "initWithQueue:adminServiceProvider:taskManager:", v2, v7, v3);
    v10 = (void *)sharedInstance_sharedInstance;
    sharedInstance_sharedInstance = (uint64_t)v9;

  }
}

uint64_t __31__CKVDispatcher_sharedInstance__block_invoke_36(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)sharedInstance_sharedInstance, "handleBridgeActivityUpdate:", a2);
}

@end
