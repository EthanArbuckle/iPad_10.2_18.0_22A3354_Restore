@implementation IDSActivityMonitor

- (IDSActivityMonitor)initWithActivity:(id)a3 serviceIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  IDSActivityMonitor *v9;

  v6 = a4;
  v7 = a3;
  +[_IDSActivityMonitorXPCConnector weakSharedInstance](_IDSActivityMonitorXPCConnector, "weakSharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IDSActivityMonitor initWithActivity:serviceIdentifier:queue:xpcConnector:](self, "initWithActivity:serviceIdentifier:queue:xpcConnector:", v7, v6, 0, v8);

  return v9;
}

- (IDSActivityMonitor)initWithActivity:(id)a3 serviceIdentifier:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  IDSActivityMonitor *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[_IDSActivityMonitorXPCConnector weakSharedInstance](_IDSActivityMonitorXPCConnector, "weakSharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[IDSActivityMonitor initWithActivity:serviceIdentifier:queue:xpcConnector:](self, "initWithActivity:serviceIdentifier:queue:xpcConnector:", v10, v9, v8, v11);

  return v12;
}

- (IDSActivityMonitor)initWithActivity:(id)a3 serviceIdentifier:(id)a4 queue:(id)a5 xpcConnector:(id)a6
{
  id v11;
  id v12;
  OS_dispatch_queue *v13;
  id v14;
  NSObject *v15;
  IDSActivityMonitor *v16;
  IDSActivityMonitor *v17;
  uint64_t v18;
  NSString *activityIdentifier;
  OS_dispatch_queue *v20;
  IDSActivityMonitor *v21;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (OS_dispatch_queue *)a5;
  v14 = a6;
  if (v14 && objc_msgSend(v11, "length") && objc_msgSend(v12, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v11;
      v26 = 2112;
      v27 = v12;
      _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "Creaating new activity monitor with activity %@ service identifier %@", buf, 0x16u);
    }

    v23.receiver = self;
    v23.super_class = (Class)IDSActivityMonitor;
    v16 = -[IDSActivityMonitor init](&v23, sel_init);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_activity, a3);
      objc_storeStrong((id *)&v17->_XPCConnector, a6);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v12, v11);
      v18 = objc_claimAutoreleasedReturnValue();
      activityIdentifier = v17->_activityIdentifier;
      v17->_activityIdentifier = (NSString *)v18;

      v20 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      if (v13)
        v20 = v13;
      v17->_queue = v20;
    }
    self = v17;
    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)dealloc
{
  _IDSActivityMonitorXPCConnector *XPCConnector;
  void *v4;
  objc_super v5;

  XPCConnector = self->_XPCConnector;
  -[IDSActivityMonitor activityIdentifier](self, "activityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSActivityMonitorXPCConnector removeListener:forTopic:](XPCConnector, "removeListener:forTopic:", self, v4);

  v5.receiver = self;
  v5.super_class = (Class)IDSActivityMonitor;
  -[IDSActivityMonitor dealloc](&v5, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v4)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[IDSActivityMonitor activityIdentifier](self, "activityIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "Adding delegate %@ to activity monitor %@", (uint8_t *)&v10, 0x16u);

    }
    objc_storeWeak((id *)&self->_delegate, v4);
    -[IDSActivityMonitor XPCConnector](self, "XPCConnector");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSActivityMonitor activityIdentifier](self, "activityIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v8, "addListener:forTopic:", self, v9);
    else
      objc_msgSend(v8, "removeListener:forTopic:", self, v9);

  }
}

- (void)beginBroadcastingWithInfo:(id)a3 withCompletion:(id)a4
{
  void *v4;
  void (**v5)(id, void *);
  NSObject *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D36AA8];
  v5 = (void (**)(id, void *))a4;
  objc_msgSend(v4, "registration");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    sub_1907E8A68(v6);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ids.activity.error"), -600, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v7);

}

- (void)stopBroadcastingForSubActivity:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _BYTE buf[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Stopping broadcast with subActivity %@", buf, 0xCu);
    }

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    -[IDSActivityMonitor XPCConnector](self, "XPCConnector");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_190711C3C;
    v11[3] = &unk_1E2C61488;
    objc_copyWeak(&v14, (id *)buf);
    v12 = v6;
    v13 = v7;
    objc_msgSend(v9, "performAction:errorHandler:", v11, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ids.activity.error"), -100, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v10);

  }
}

- (BOOL)listeningForUpdates
{
  NSObject *v3;
  void *v4;
  char v5;
  _QWORD v7[6];
  __int128 buf;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "Getting listening status for self: %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v9 = 0x2020000000;
  v10 = 0;
  -[IDSActivityMonitor XPCConnector](self, "XPCConnector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_190711DF4;
  v7[3] = &unk_1E2C614D8;
  v7[4] = self;
  v7[5] = &buf;
  objc_msgSend(v4, "performSyncAction:", v7);

  v5 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  return v5;
}

- (void)setListeningForUpdates:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  _BOOL4 v10;
  __int16 v11;
  IDSActivityMonitor *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v10 = v3;
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "Set listening for updates %d on self %@", buf, 0x12u);
  }

  -[IDSActivityMonitor XPCConnector](self, "XPCConnector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_190712018;
  v7[3] = &unk_1E2C61520;
  v8 = v3;
  v7[4] = self;
  objc_msgSend(v6, "performSyncAction:", v7);

}

- (NSArray)subscriptions
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
  v10 = sub_1906EE1D4;
  v11 = sub_1906EE0BC;
  v12 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[IDSActivityMonitor XPCConnector](self, "XPCConnector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1907121E0;
  v6[3] = &unk_1E2C614D8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performSyncAction:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)handleIncomingUpdate:(id)a3 onActivity:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *queue;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  IDSActivityMonitor *v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = a5;
  -[IDSActivityMonitor delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_19071247C;
  v14[3] = &unk_1E2C61008;
  v15 = v9;
  v16 = self;
  v17 = v7;
  v18 = v8;
  v11 = v8;
  v12 = v7;
  v13 = v9;
  dispatch_async(queue, v14);

}

- (IDSActivityMonitorListenerDelegate)delegate
{
  return (IDSActivityMonitorListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)activity
{
  return self->_activity;
}

- (_IDSActivityMonitorXPCConnector)XPCConnector
{
  return self->_XPCConnector;
}

- (void)setXPCConnector:(id)a3
{
  objc_storeStrong((id *)&self->_XPCConnector, a3);
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_activityIdentifier, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_XPCConnector, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
