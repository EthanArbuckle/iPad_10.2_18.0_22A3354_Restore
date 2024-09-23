@implementation IDSXPCDaemonController

+ (id)onQueueWeakSharedInstance
{
  id WeakRetained;
  IDSXPCDaemonController *v3;
  IDSXPCDaemonController *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained(&qword_1EE1E1FD0);

  if (WeakRetained)
  {
    v3 = (IDSXPCDaemonController *)objc_loadWeakRetained(&qword_1EE1E1FD0);
  }
  else
  {
    v4 = [IDSXPCDaemonController alloc];
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[IDSXPCDaemonController initWithQueue:](v4, "initWithQueue:", v6);

    objc_storeWeak(&qword_1EE1E1FD0, v3);
  }
  return v3;
}

+ (id)weakSharedInstance
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1906EE264;
  v11 = sub_1906EE104;
  v12 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_19075C9BC;
  v6[3] = &unk_1E2C62ED8;
  v6[4] = &v7;
  v6[5] = a1;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v6, 1);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (void)asyncWeakSharedInstance:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19075CA90;
  v7[3] = &unk_1E2C62510;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

+ (void)performDaemonControllerTask:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19075CB74;
  v7[3] = &unk_1E2C62510;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (IDSXPCDaemonController)initWithQueue:(id)a3 connectionCreationBlock:(id)a4
{
  return (IDSXPCDaemonController *)MEMORY[0x1E0DE7D20](self, sel__initWithQueue_isSync_connectionCreationBlock_);
}

- (IDSXPCDaemonController)initWithQueue:(id)a3
{
  return (IDSXPCDaemonController *)MEMORY[0x1E0DE7D20](self, sel__initWithQueue_isSync_);
}

- (id)initSyncControllerWithQueue:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__initWithQueue_isSync_);
}

- (id)_initWithQueue:(id)a3 isSync:(BOOL)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__initWithQueue_isSync_connectionCreationBlock_);
}

- (id)_initWithQueue:(id)a3 isSync:(BOOL)a4 connectionCreationBlock:(id)a5
{
  _BOOL4 v6;
  id v9;
  void (**v10)(_QWORD);
  int v11;
  NSObject *v12;
  NSObject *v13;
  IDSXPCDaemonController *v14;
  IDSXPCDaemonController *v15;
  IDSXPCDaemonController *v16;
  void *v17;
  void *v18;
  IDSXPCDaemonController *v19;
  IDSXPCConnection *v20;
  uint64_t v21;
  IDSXPCConnection *connection;
  NSMutableDictionary *v23;
  NSMutableDictionary *syncCollaboratorDictionary;
  NSMutableDictionary *collaboratorPromiseDictionary;
  uint64_t v26;
  IDSXPCConnection *v27;
  NSMutableDictionary *v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  IDSXPCDaemonController *v34;
  id v35;
  objc_super v36;
  _BYTE buf[24];
  uint64_t v38;

  v6 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(_QWORD))a5;
  v11 = _IDSRunningInDaemon();
  objc_msgSend(MEMORY[0x1E0D34D40], "xpc");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907F0BD0((uint64_t)self, v13);

    v14 = 0;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "Alloc'ing IDSXPCDaemonController {pointer: %p}", buf, 0xCu);
    }

    v36.receiver = self;
    v36.super_class = (Class)IDSXPCDaemonController;
    v15 = -[IDSXPCDaemonController init](&v36, sel_init);
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_queue, a3);
      v10[2](v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[IDSXPCDaemonInterface interface](IDSXPCDaemonInterface, "interface");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setRemoteObjectInterface:", v18);

      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v16);
      v30 = MEMORY[0x1E0C809B0];
      v31 = 3221225472;
      v32 = sub_19075CEDC;
      v33 = &unk_1E2C60B38;
      objc_copyWeak(&v35, (id *)buf);
      v19 = v16;
      v34 = v19;
      objc_msgSend(v17, "setInterruptionHandler:", &v30);
      v20 = [IDSXPCConnection alloc];
      if (v6)
      {
        v21 = -[IDSXPCConnection initForSyncMessagingWithQueue:takingOverAndResumingConnection:](v20, "initForSyncMessagingWithQueue:takingOverAndResumingConnection:", v9, v17, v30, v31, v32, v33);
        connection = v19->_connection;
        v19->_connection = (IDSXPCConnection *)v21;

        v19->_sync = 1;
        v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        syncCollaboratorDictionary = v19->_syncCollaboratorDictionary;
        v19->_syncCollaboratorDictionary = v23;

        collaboratorPromiseDictionary = v19->_collaboratorPromiseDictionary;
        v19->_collaboratorPromiseDictionary = 0;
      }
      else
      {
        v26 = -[IDSXPCConnection initWithQueue:takingOverAndResumingConnection:](v20, "initWithQueue:takingOverAndResumingConnection:", v9, v17, v30, v31, v32, v33);
        v27 = v19->_connection;
        v19->_connection = (IDSXPCConnection *)v26;

        v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        collaboratorPromiseDictionary = v19->_collaboratorPromiseDictionary;
        v19->_collaboratorPromiseDictionary = v28;
      }

      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)buf);

    }
    self = v16;
    v14 = self;
  }

  return v14;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  IDSXPCDaemonController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34D40], "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "Dealloc'ing IDSXPCDaemonController {pointer: %p}", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)IDSXPCDaemonController;
  -[IDSXPCDaemonController dealloc](&v4, sel_dealloc);
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D34D40], "xpc");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "Activating daemon controller", v9, 2u);
  }

  if (self->_sync)
  {
    -[IDSXPCDaemonController connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activateWithCompletion:", v4);

  }
  else
  {
    -[IDSXPCDaemonController queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v8);

    -[IDSXPCDaemonController _daemonProxyWithErrorHandler:](self, "_daemonProxyWithErrorHandler:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activateWithCompletion:", v4);
  }

}

- (id)pairingCollaboratorWithErrorHandler:(id)a3
{
  return -[IDSXPCDaemonController pairingCollaboratorWithTimeout:errorHandler:](self, "pairingCollaboratorWithTimeout:errorHandler:", a3, 60.0);
}

- (id)pairingCollaboratorWithTimeout:(double)a3 errorHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[IDSXPCPairingInterface interface](IDSXPCPairingInterface, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSXPCDaemonController _collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:](self, "_collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:", CFSTR("pairing"), v7, v6, &unk_1E2C5FFF0, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)pairedDeviceManagerCollaboratorWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[IDSXPCPairedDeviceManagerInterface interface](IDSXPCPairedDeviceManagerInterface, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSXPCDaemonController _collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:](self, "_collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:", CFSTR("pairedDeviceManager"), v5, v4, &unk_1E2C5F090, 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)reunionSyncCollaboratorWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[IDSXPCReunionSyncInterface interface](IDSXPCReunionSyncInterface, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSXPCDaemonController _collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:](self, "_collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:", CFSTR("reunionSync"), v5, v4, &unk_1E2C5F4B0, 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)opportunisticCollaboratorWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[IDSXPCOpportunisticInterface interface](IDSXPCOpportunisticInterface, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSXPCDaemonController _collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:](self, "_collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:", CFSTR("opportunistic"), v5, v4, &unk_1E2C5F150, 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)registrationCollaboratorWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[IDSXPCRegistrationInterface interface](IDSXPCRegistrationInterface, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSXPCDaemonController _collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:](self, "_collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:", CFSTR("registration"), v5, v4, &unk_1E2C62F38, 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)activityMonitorCollaboratorWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[IDSXPCActivityMonitorInterface interface](IDSXPCActivityMonitorInterface, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSXPCDaemonController _collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:](self, "_collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:", CFSTR("activityMonitor"), v5, v4, &unk_1E2C5F4F0, 3600.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)serverMessagingCollaboratorWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[IDSXPCServerMessagingInterface interface](IDSXPCServerMessagingInterface, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSXPCDaemonController _collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:](self, "_collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:", CFSTR("serverMessaging"), v5, v4, &unk_1E2C62F58, 3600.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)offGridMessengerCollaboratorWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[IDSXPCOffGridMessengerInterface interface](IDSXPCOffGridMessengerInterface, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSXPCDaemonController _collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:](self, "_collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:", CFSTR("offgridMessenger"), v5, v4, &unk_1E2C5F230, 3600.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)offGridStateManagerCollaboratorWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[IDSXPCOffGridStateManagerInterface interface](IDSXPCOffGridStateManagerInterface, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSXPCDaemonController _collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:](self, "_collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:", CFSTR("offgridStateManager"), v5, v4, &unk_1E2C600D0, 3600.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)keyTransparencyCollaboratorWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[IDSXPCKeyTransparencyInterface interface](IDSXPCKeyTransparencyInterface, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSXPCDaemonController _collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:](self, "_collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:", CFSTR("keyTransparency"), v5, v4, &unk_1E2C5F550, 3600.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pinnedIdentityCollaboratorWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[IDSXPCPinnedIdentityInterface interface](IDSXPCPinnedIdentityInterface, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSXPCDaemonController _collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:](self, "_collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:", CFSTR("pinnedIdentity"), v5, v4, &unk_1E2C62F78, 3600.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)firewallCollaboratorForService:(id)a3 withErrorHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  +[IDSXPCFirewallInterface interface](IDSXPCFirewallInterface, "interface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_19075D994;
  v12[3] = &unk_1E2C62FA0;
  v13 = v6;
  v9 = v6;
  -[IDSXPCDaemonController _collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:](self, "_collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:", CFSTR("firewall"), v8, v7, v12, 60.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)groupSessionKeyValueDeliveryProviderCollaboratorWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[IDSXPCGroupSessionKeyValueDeliveryProviderInterface interface](IDSXPCGroupSessionKeyValueDeliveryProviderInterface, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSXPCDaemonController _collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:](self, "_collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:", CFSTR("groupSessionKeyValueDeliveryProvider"), v5, v4, &unk_1E2C60150, 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)featureTogglerCollaboratorForService:(id)a3 withErrorHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  +[IDSXPCFeatureTogglerInterface interface](IDSXPCFeatureTogglerInterface, "interface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_19075DB00;
  v12[3] = &unk_1E2C62FA0;
  v13 = v6;
  v9 = v6;
  -[IDSXPCDaemonController _collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:](self, "_collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:", CFSTR("featuretoggler"), v8, v7, v12, 60.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)baaSignerCollaboratorForTopic:(id)a3 withErrorHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  +[IDSXPCBAASignerInterface interface](IDSXPCBAASignerInterface, "interface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_19075DBE4;
  v12[3] = &unk_1E2C62FA0;
  v13 = v6;
  v9 = v6;
  -[IDSXPCDaemonController _collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:](self, "_collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:", CFSTR("baasigner"), v8, v7, v12, 60.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)interalTestingCollaboratorWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[IDSXPCInternalTestingInterface interface](IDSXPCInternalTestingInterface, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSXPCDaemonController _collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:](self, "_collaboratorWithIdentifier:interface:timeout:errorHandler:resolverBlock:", CFSTR("internalTesting"), v5, v4, &unk_1E2C5F330, 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)performTask:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[IDSXPCDaemonController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19075DD14;
  v7[3] = &unk_1E2C60E00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)addInterruptionHandler:(id)a3 forTarget:(id)a4
{
  id v6;
  NSMapTable *interruptionHandlerByTarget;
  NSMapTable *v8;
  NSMapTable *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11 && v6)
  {
    interruptionHandlerByTarget = self->_interruptionHandlerByTarget;
    if (!interruptionHandlerByTarget)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v9 = self->_interruptionHandlerByTarget;
      self->_interruptionHandlerByTarget = v8;

      interruptionHandlerByTarget = self->_interruptionHandlerByTarget;
    }
    v10 = (void *)MEMORY[0x19400FE1C](v11);
    -[NSMapTable setObject:forKey:](interruptionHandlerByTarget, "setObject:forKey:", v10, v6);

  }
}

- (void)removeInterruptionHandlerForTarget:(id)a3
{
  id v4;
  NSUInteger v5;
  NSMapTable *interruptionHandlerByTarget;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[NSMapTable removeObjectForKey:](self->_interruptionHandlerByTarget, "removeObjectForKey:", v4);
    v5 = -[NSMapTable count](self->_interruptionHandlerByTarget, "count");
    v4 = v7;
    if (!v5)
    {
      interruptionHandlerByTarget = self->_interruptionHandlerByTarget;
      self->_interruptionHandlerByTarget = 0;

      v4 = v7;
    }
  }

}

- (id)_daemonProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[IDSXPCDaemonController connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_19075DEC4;
  v9[3] = &unk_1E2C62FC8;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_timingOutDaemonProxyWithTimeout:(double)a3 errorHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  -[IDSXPCDaemonController connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_19075DFCC;
  v11[3] = &unk_1E2C62FC8;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "remoteObjectProxyWithTimeoutInSeconds:errorHandler:", v11, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_collaboratorWithIdentifier:(id)a3 interface:(id)a4 timeout:(double)a5 errorHandler:(id)a6 resolverBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *, _QWORD *);
  NSObject *v16;
  void *v17;
  NSObject *v18;
  IDSXPCConnectionRemoteObjectPromise *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t (*__ptr32 *v24)();
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  IDSXPCConnectionRemoteObjectPromise *v35;
  void *v37;
  IDSXPCConnectionRemoteObjectPromise *v38;
  _QWORD v39[5];
  id v40;
  IDSXPCConnectionRemoteObjectPromise *v41;
  id v42;
  double v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _BYTE *v47;
  _QWORD v48[4];
  id v49;
  IDSXPCDaemonController *v50;
  id v51;
  _BYTE *v52;
  _BYTE buf[24];
  char v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, void *, _QWORD *))a7;
  objc_msgSend(MEMORY[0x1E0D34D40], "xpc");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a5;
    _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_INFO, "Get collaborator {identifier: %{public}@, timeout: %f}", buf, 0x16u);
  }

  if (self->_sync)
  {
    -[IDSXPCDaemonController _sync_collaboratorWithIdentifier:errorHandler:resolverBlock:](self, "_sync_collaboratorWithIdentifier:errorHandler:resolverBlock:", v12, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[IDSXPCDaemonController queue](self, "queue");
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v18);

    v19 = [IDSXPCConnectionRemoteObjectPromise alloc];
    -[IDSXPCDaemonController queue](self, "queue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[IDSXPCConnectionRemoteObjectPromise initWithInterface:queue:](v19, "initWithInterface:queue:", v13, v20);

    -[IDSXPCDaemonController collaboratorPromiseDictionary](self, "collaboratorPromiseDictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = MEMORY[0x1E0C809B0];
    v24 = &off_19080A000;
    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "xpc");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v12;
        _os_log_impl(&dword_1906E0000, v25, OS_LOG_TYPE_DEFAULT, "Creating collaborator promise {identifier: %{public}@}", buf, 0xCu);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v54 = 0;
      v26 = objc_alloc(MEMORY[0x1E0D13210]);
      -[IDSXPCDaemonController queue](self, "queue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v26, "initWithQueue:", v27);

      v48[0] = v23;
      v48[1] = 3221225472;
      v48[2] = sub_19075E484;
      v48[3] = &unk_1E2C62FF0;
      v52 = buf;
      v29 = v28;
      v49 = v29;
      v50 = self;
      v30 = v12;
      v51 = v30;
      -[IDSXPCDaemonController _timingOutDaemonProxyWithTimeout:errorHandler:](self, "_timingOutDaemonProxyWithTimeout:errorHandler:", v48, a5);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSXPCDaemonController connection](self, "connection");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = sub_19075E4EC;
      v44[3] = &unk_1E2C63018;
      v47 = buf;
      v32 = v29;
      v45 = v32;
      v33 = v31;
      v46 = v33;
      v15[2](v15, v37, v44);
      objc_msgSend(v32, "promise");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSXPCDaemonController collaboratorPromiseDictionary](self, "collaboratorPromiseDictionary");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v22, v30);

      v23 = MEMORY[0x1E0C809B0];
      _Block_object_dispose(buf, 8);
      v24 = &off_19080A000;
    }
    v39[0] = v23;
    v39[1] = *((_QWORD *)v24 + 183);
    v39[2] = sub_19075E570;
    v39[3] = &unk_1E2C63040;
    v43 = a5;
    v42 = v14;
    v39[4] = self;
    v40 = v12;
    v41 = v38;
    v35 = v38;
    objc_msgSend(v22, "registerResultBlock:", v39);
    -[IDSXPCConnectionRemoteObjectPromise remoteObjectProxy](v35, "remoteObjectProxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (id)_sync_collaboratorWithIdentifier:(id)a3 errorHandler:(id)a4 resolverBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD *);
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t *v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD *))a5;
  objc_msgSend(MEMORY[0x1E0D34D40], "xpc");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_INFO, "Get sync collaborator", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v23 = buf;
  v24 = 0x3032000000;
  v25 = sub_1906EE264;
  v26 = sub_1906EE104;
  v27 = 0;
  -[IDSXPCDaemonController connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_19075E9B4;
  v18[3] = &unk_1E2C63068;
  v14 = v9;
  v20 = v14;
  v21 = buf;
  v18[4] = self;
  v15 = v8;
  v19 = v15;
  v10[2](v10, v13, v18);
  v16 = *((id *)v23 + 5);

  _Block_object_dispose(buf, 8);
  return v16;
}

- (IDSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)collaboratorPromiseDictionary
{
  return self->_collaboratorPromiseDictionary;
}

- (void)setCollaboratorPromiseDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_collaboratorPromiseDictionary, a3);
}

- (NSMutableDictionary)syncCollaboratorDictionary
{
  return self->_syncCollaboratorDictionary;
}

- (void)setSyncCollaboratorDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_syncCollaboratorDictionary, a3);
}

- (NSMapTable)interruptionHandlerByTarget
{
  return self->_interruptionHandlerByTarget;
}

- (void)setInterruptionHandlerByTarget:(id)a3
{
  objc_storeStrong((id *)&self->_interruptionHandlerByTarget, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptionHandlerByTarget, 0);
  objc_storeStrong((id *)&self->_syncCollaboratorDictionary, 0);
  objc_storeStrong((id *)&self->_collaboratorPromiseDictionary, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
