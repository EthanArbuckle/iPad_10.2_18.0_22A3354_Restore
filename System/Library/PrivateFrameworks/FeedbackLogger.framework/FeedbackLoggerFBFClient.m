@implementation FeedbackLoggerFBFClient

- (FeedbackLoggerFBFClient)init
{
  FeedbackLoggerFBFClient *v2;
  FeedbackLoggerFBFClient *v3;
  void *v4;
  uint64_t v5;
  NSDistributedNotificationCenter *notificationCenter;
  uint64_t v7;
  NSXPCConnection *daemonConnection;
  void *v9;
  uint64_t v10;
  id v11;
  NSXPCConnection *v12;
  id v13;
  uint64_t v14;
  FeedbackLoggerDaemonXPC *fbf;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)FeedbackLoggerFBFClient;
  v2 = -[FeedbackLoggerFBFClient init](&v21, sel_init);
  v3 = v2;
  if (v2)
  {
    flLogForObject(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v3->_log, v4);
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v5 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v3->_notificationCenter;
    v3->_notificationCenter = (NSDistributedNotificationCenter *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.feedbacklogger"), 0);
    daemonConnection = v3->_daemonConnection;
    v3->_daemonConnection = (NSXPCConnection *)v7;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF0FD640);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v3->_daemonConnection, "setRemoteObjectInterface:", v9);

    v10 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __31__FeedbackLoggerFBFClient_init__block_invoke;
    v19[3] = &unk_1E68A30F8;
    v11 = v4;
    v20 = v11;
    -[NSXPCConnection setInvalidationHandler:](v3->_daemonConnection, "setInvalidationHandler:", v19);
    -[NSXPCConnection setExportedObject:](v3->_daemonConnection, "setExportedObject:", v3);
    -[NSXPCConnection resume](v3->_daemonConnection, "resume");
    v12 = v3->_daemonConnection;
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __31__FeedbackLoggerFBFClient_init__block_invoke_50;
    v17[3] = &unk_1E68A3120;
    v18 = v11;
    v13 = v11;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v12, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    v14 = objc_claimAutoreleasedReturnValue();
    fbf = v3->_fbf;
    v3->_fbf = (FeedbackLoggerDaemonXPC *)v14;

  }
  return v3;
}

- (void)scheduleImmediateUploadWithHeaders:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  -[FeedbackLoggerFBFClient notificationCenter](self, "notificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("FLCloseAllStores"), 0);

  -[FeedbackLoggerFBFClient log](self, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B512E000, v9, OS_LOG_TYPE_INFO, "Waiting 2s for sqlite connections to close.", buf, 2u);
  }

  v10 = dispatch_time(0, 2000000000);
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__FeedbackLoggerFBFClient_scheduleImmediateUploadWithHeaders_completion___block_invoke;
  block[3] = &unk_1E68A3148;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_after(v10, v11, block);

}

- (void)requestSandboxExtensionForBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FeedbackLoggerFBFClient fbf](self, "fbf");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestSandboxExtensionForBundleID:completion:", v7, v6);

}

- (NSXPCConnection)daemonConnection
{
  return self->_daemonConnection;
}

- (void)setDaemonConnection:(id)a3
{
  objc_storeStrong((id *)&self->_daemonConnection, a3);
}

- (FeedbackLoggerDaemonXPC)fbf
{
  return self->_fbf;
}

- (void)setFbf:(id)a3
{
  objc_storeStrong((id *)&self->_fbf, a3);
}

- (NSDistributedNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_fbf, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

void __73__FeedbackLoggerFBFClient_scheduleImmediateUploadWithHeaders_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B512E000, v2, OS_LOG_TYPE_INFO, "Telling FBF to upload immediately.", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "fbf");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleImmediateUploadWithHeaders:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __31__FeedbackLoggerFBFClient_init__block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  v1 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1B512E000, v1, OS_LOG_TYPE_INFO, "XPC connection to parsec-fbf invalidated", v2, 2u);
  }
}

void __31__FeedbackLoggerFBFClient_init__block_invoke_50(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = v3;
    objc_msgSend(a2, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_error_impl(&dword_1B512E000, v4, OS_LOG_TYPE_ERROR, "parsec-fbf remote object proxy failed with error %@", (uint8_t *)&v6, 0xCu);

  }
}

@end
