@implementation _KSTextReplacementServer

- (void)queryTextReplacementsWithCallback:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62___KSTextReplacementServer_queryTextReplacementsWithCallback___block_invoke;
  v7[3] = &unk_24E204BB8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (_KSTextReplacementManager)textReplacementManager
{
  NSObject *v3;
  _KSTextReplacementManager *textReplacementManager;
  _KSTextReplacementManager *v6;
  void *v7;
  _KSTextReplacementManager *v8;
  _KSTextReplacementManager *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (-[_KSTextReplacementServer isSetupAssistantRunning](self, "isSetupAssistantRunning"))
  {
    KSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = "-[_KSTextReplacementServer textReplacementManager]";
      _os_log_impl(&dword_21DFEB000, v3, OS_LOG_TYPE_INFO, "%s  >>> Setup Assistance is running, not loading text replacements", (uint8_t *)&v10, 0xCu);
    }

    return (_KSTextReplacementManager *)0;
  }
  else
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    textReplacementManager = self->_textReplacementManager;
    if (!textReplacementManager)
    {
      v6 = [_KSTextReplacementManager alloc];
      -[_KSTextReplacementServer directoryPath](self, "directoryPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[_KSTextReplacementManager initWithDirectoryPath:](v6, "initWithDirectoryPath:", v7);
      v9 = self->_textReplacementManager;
      self->_textReplacementManager = v8;

      textReplacementManager = self->_textReplacementManager;
    }
    return textReplacementManager;
  }
}

- (BOOL)isSetupAssistantRunning
{
  return softLinkBYSetupAssistantNeedsToRun();
}

- (NSString)directoryPath
{
  return self->_directoryPath;
}

+ (id)textReplacementServer
{
  if (textReplacementServer_onceToken != -1)
    dispatch_once(&textReplacementServer_onceToken, &__block_literal_global_8);
  return (id)textReplacementServer_sharedInstance;
}

- (_KSTextReplacementServer)init
{
  void *v3;
  _KSTextReplacementServer *v4;

  +[_KSUtilities keyboardServicesDirectory](_KSUtilities, "keyboardServicesDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_KSTextReplacementServer initWithDatabaseDirectoryPath:](self, "initWithDatabaseDirectoryPath:", v3);

  return v4;
}

- (_KSTextReplacementServer)initWithDatabaseDirectoryPath:(id)a3
{
  id v5;
  _KSTextReplacementServer *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  _KSTRClient *v10;
  _KSTRClient *daemonClient;
  id v12;
  void *v13;
  uint64_t v14;
  NSXPCListener *listener;
  NSObject *v16;
  _QWORD block[4];
  _KSTextReplacementServer *v19;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_KSTextReplacementServer;
  v6 = -[_KSTextReplacementServer init](&v20, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.keyboardServices.textReplacementServer.storeWorkQueue", v7);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v8;

    v10 = -[_KSTRClient initWithOwner:]([_KSTRClient alloc], "initWithOwner:", v6);
    daemonClient = v6->_daemonClient;
    v6->_daemonClient = v10;

    objc_storeStrong((id *)&v6->_directoryPath, a3);
    v12 = objc_alloc(MEMORY[0x24BDD1998]);
    +[_KSUtilities machServiceNameTextReplacement](_KSUtilities, "machServiceNameTextReplacement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithMachServiceName:", v13);
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v14;

    -[NSXPCListener setDelegate:](v6->_listener, "setDelegate:", v6);
    v16 = v6->_workQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58___KSTextReplacementServer_initWithDatabaseDirectoryPath___block_invoke;
    block[3] = &unk_24E204790;
    v19 = v6;
    dispatch_async(v16, block);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)_KSTextReplacementServer;
  -[_KSTextReplacementServer dealloc](&v5, sel_dealloc);
}

- (void)scheduleSyncTask
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44___KSTextReplacementServer_scheduleSyncTask__block_invoke;
  block[3] = &unk_24E204790;
  block[4] = self;
  if (scheduleSyncTask_onceToken != -1)
    dispatch_once(&scheduleSyncTask_onceToken, block);
}

- (void)setTextReplacementManager:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54___KSTextReplacementServer_setTextReplacementManager___block_invoke;
  v7[3] = &unk_24E205838;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)cleanup
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35___KSTextReplacementServer_cleanup__block_invoke;
  block[3] = &unk_24E204790;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_performCleanup
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  KSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[_KSTextReplacementServer _performCleanup]";
    _os_log_impl(&dword_21DFEB000, v3, OS_LOG_TYPE_INFO, "%s  Cleaning up all resources", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("_KSTRShouldCleanupResources"), 0);

  -[_KSTextReplacementServer setTextReplacementManager:](self, "setTextReplacementManager:", 0);
}

- (void)start
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  -[NSXPCListener resume](self->_listener, "resume");
  KSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "-[_KSTextReplacementServer start]";
    _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_INFO, "%s  TextReplacementServer accepting request now", (uint8_t *)&v3, 0xCu);
  }

}

- (void)shutdown
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36___KSTextReplacementServer_shutdown__block_invoke;
  block[3] = &unk_24E204790;
  block[4] = self;
  dispatch_async(workQueue, block);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
}

- (void)addEntries:(id)a3 removeEntries:(id)a4 withCompletionHandler:(id)a5
{
  -[_KSTextReplacementServer addEntries:removeEntries:forClient:withCompletionHandler:](self, "addEntries:removeEntries:forClient:withCompletionHandler:", a3, a4, self->_daemonClient, a5);
}

- (void)addEntries:(id)a3 removeEntries:(id)a4 forClient:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *workQueue;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _KSTextReplacementServer *v20;
  id v21;
  uint64_t v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v12)
  {
    v14 = objc_msgSend(v12, "generation");
    workQueue = self->_workQueue;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __85___KSTextReplacementServer_addEntries_removeEntries_forClient_withCompletionHandler___block_invoke;
    v16[3] = &unk_24E205C78;
    v17 = v10;
    v18 = v11;
    v22 = v14;
    v19 = v12;
    v20 = self;
    v21 = v13;
    dispatch_async(workQueue, v16);

  }
}

- (void)removeAllEntries
{
  NSObject *workQueue;
  _QWORD v4[6];
  _QWORD v5[5];
  id v6;

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__5;
  v5[4] = __Block_byref_object_dispose__5;
  v6 = (id)os_transaction_create();
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44___KSTextReplacementServer_removeAllEntries__block_invoke;
  v4[3] = &unk_24E205770;
  v4[4] = self;
  v4[5] = v5;
  dispatch_async(workQueue, v4);
  _Block_object_dispose(v5, 8);

}

- (void)cancelPendingUpdates
{
  -[_KSTextReplacementServer _cancelPendingUpdateForClient:](self, "_cancelPendingUpdateForClient:", self->_daemonClient);
}

- (void)requestSyncWithCompletionBlock:(id)a3
{
  -[_KSTextReplacementServer requestSync:withCompletionBlock:](self, "requestSync:withCompletionBlock:", 0, a3);
}

- (void)requestSync:(unint64_t)a3 withCompletionBlock:(id)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60___KSTextReplacementServer_requestSync_withCompletionBlock___block_invoke;
  block[3] = &unk_24E204C30;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(workQueue, block);

}

- (BOOL)_cancelPendingUpdateForClient:(id)a3
{
  if (a3)
    objc_msgSend(a3, "cancel");
  return a3 != 0;
}

- (id)textReplacementEntries
{
  return -[_KSTextReplacementServer textReplacementEntriesForClient:](self, "textReplacementEntriesForClient:", self->_daemonClient);
}

- (id)textReplacementEntriesForClient:(id)a3
{
  NSObject *workQueue;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_not_V2(workQueue);
  LODWORD(workQueue) = objc_msgSend(v5, "hasReadAccess");

  if (!(_DWORD)workQueue)
    return MEMORY[0x24BDBD1A8];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_workQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60___KSTextReplacementServer_textReplacementEntriesForClient___block_invoke;
  v12[3] = &unk_24E205838;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  dispatch_sync(v7, v12);
  v9 = v13;
  v10 = v8;

  return v10;
}

- (void)queryTextReplacementsWithPredicate:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72___KSTextReplacementServer_queryTextReplacementsWithPredicate_callback___block_invoke;
  block[3] = &unk_24E204CA8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(workQueue, block);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  int v8;
  _KSTRClient *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend((id)objc_opt_class(), "isBlackListed:", objc_msgSend(v7, "effectiveUserIdentifier"));
  if (v8)
  {
    objc_msgSend(v7, "invalidate");
  }
  else
  {
    v9 = -[_KSTRClient initWithOwner:forConnection:]([_KSTRClient alloc], "initWithOwner:forConnection:", self, v7);
    _KSTextReplacementServerInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v10);

    objc_msgSend(v7, "setExportedObject:", v9);
    objc_initWeak(&location, v7);
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __63___KSTextReplacementServer_listener_shouldAcceptNewConnection___block_invoke;
    v15 = &unk_24E2057C0;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v7, "setInvalidationHandler:", &v12);
    objc_msgSend(v7, "resume", v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  return v8 ^ 1;
}

- (void)registerForPushNotifications
{
  uint64_t v3;
  id v4;
  void *v5;
  APSConnection *v6;
  APSConnection *pushConnection;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  APSConnection *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08720];
  v4 = objc_alloc(MEMORY[0x24BE08738]);
  dispatch_get_global_queue(0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (APSConnection *)objc_msgSend(v4, "initWithEnvironmentName:namedDelegatePort:queue:", v3, CFSTR("com.apple.keyboardServices.textReplacementServer.aps"), v5);
  pushConnection = self->_pushConnection;
  self->_pushConnection = v6;

  -[APSConnection setDelegate:](self->_pushConnection, "setDelegate:", self);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "executablePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = self->_pushConnection;
  v16[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSConnection setEnabledTopics:](v14, "setEnabledTopics:", v15);

  NSLog(CFSTR("Waiting for push notifications from topic %@"), v13);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  objc_msgSend(v5, "userInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB9170], "notificationFromRemoteNotificationDictionary:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR(">>> APS Push received: %@ %@"), v7, v6);
  -[_KSTextReplacementServer requestSync:withCompletionBlock:](self, "requestSync:withCompletionBlock:", 1, &__block_literal_global_63);

}

- (void)buddySetupDidFinish
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  KSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "-[_KSTextReplacementServer buddySetupDidFinish]";
    _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_INFO, "%s  >>> buddysetup did finish", (uint8_t *)&v3, 0xCu);
  }

  CFPreferencesAppSynchronize(CFSTR("com.apple.keyboard"));
}

+ (BOOL)isBlackListed:(unsigned int)a3
{
  return 0;
}

- (APSConnection)pushConnection
{
  return self->_pushConnection;
}

- (void)setPushConnection:(id)a3
{
  objc_storeStrong((id *)&self->_pushConnection, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (void)setDirectoryPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryPath, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_textReplacementManager, 0);
  objc_storeStrong((id *)&self->_daemonClient, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
