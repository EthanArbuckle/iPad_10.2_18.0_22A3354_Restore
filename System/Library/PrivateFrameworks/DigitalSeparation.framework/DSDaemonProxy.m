@implementation DSDaemonProxy

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DigitalSeparation", "DSDaemonProxy");
    v3 = (void *)DSLog_6;
    DSLog_6 = (uint64_t)v2;

  }
}

- (DSDaemonProxy)init
{
  DSDaemonProxy *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DSDaemonProxy;
  v2 = -[DSDaemonProxy init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSDaemonProxy setUnreportedSignals:](v2, "setUnreportedSignals:", v3);

  }
  return v2;
}

- (void)addSignalWithIdentifier:(id)a3 sharingType:(id)a4 signalType:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  if (a3 && a4)
  {
    if (a5)
    {
      v8 = (objc_class *)MEMORY[0x24BE828A8];
      v9 = a5;
      v10 = a4;
      v11 = a3;
      v13 = objc_alloc_init(v8);
      objc_msgSend(v13, "setSharingIdentifier:", v11);

      objc_msgSend(v13, "setSharingType:", v10);
      objc_msgSend(v13, "setSignalType:", v9);

      -[DSDaemonProxy unreportedSignals](self, "unreportedSignals");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v13);

    }
  }
}

- (void)removeSignalWithIdentifier:(id)a3 sharingType:(id)a4 signalType:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  if (a3 && a4)
  {
    if (a5)
    {
      v8 = (objc_class *)MEMORY[0x24BE828A8];
      v9 = a5;
      v10 = a4;
      v11 = a3;
      v13 = objc_alloc_init(v8);
      objc_msgSend(v13, "setSharingIdentifier:", v11);

      objc_msgSend(v13, "setSharingType:", v10);
      objc_msgSend(v13, "setSignalType:", v9);

      -[DSDaemonProxy unreportedSignals](self, "unreportedSignals");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObject:", v13);

    }
  }
}

- (void)sendAggregatedSignals
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[DSDaemonProxy unreportedSignals](self, "unreportedSignals");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE828A0]), "initConnection");
    -[DSDaemonProxy setDaemonConnection:](self, "setDaemonConnection:", v6);

    v7 = DSLog_6;
    if (os_log_type_enabled((os_log_t)DSLog_6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v13 = v5;
      _os_log_impl(&dword_227D24000, v7, OS_LOG_TYPE_INFO, "Reporting signals to daemon: %{private}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    -[DSDaemonProxy daemonConnection](self, "daemonConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __38__DSDaemonProxy_sendAggregatedSignals__block_invoke;
    v9[3] = &unk_24F081EE0;
    objc_copyWeak(&v11, (id *)buf);
    v10 = v5;
    objc_msgSend(v8, "handleSignals:completion:", v10, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }

}

void __38__DSDaemonProxy_sendAggregatedSignals__block_invoke(uint64_t a1, char a2, void *a3)
{
  __CFString *v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5 || (a2 & 1) == 0)
  {
    v7 = DSLog_6;
    if (os_log_type_enabled((os_log_t)DSLog_6, OS_LOG_TYPE_ERROR))
    {
      v10 = CFSTR("Unknown");
      v11 = *(_QWORD *)(a1 + 32);
      if (v5)
        v10 = v5;
      v12 = 138412547;
      v13 = v10;
      v14 = 2113;
      v15 = v11;
      _os_log_error_impl(&dword_227D24000, v7, OS_LOG_TYPE_ERROR, "Error: %@ Proxy failed to handle %{private}@", (uint8_t *)&v12, 0x16u);
    }
  }
  objc_msgSend(WeakRetained, "daemonConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "disconnect");

  objc_msgSend(WeakRetained, "unreportedSignals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

}

- (NSArray)signalsToReport
{
  void *v2;
  void *v3;

  -[DSDaemonProxy unreportedSignals](self, "unreportedSignals");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (SCSharingReminderPeerService)daemonConnection
{
  return self->_daemonConnection;
}

- (void)setDaemonConnection:(id)a3
{
  objc_storeStrong((id *)&self->_daemonConnection, a3);
}

- (NSMutableSet)unreportedSignals
{
  return self->_unreportedSignals;
}

- (void)setUnreportedSignals:(id)a3
{
  objc_storeStrong((id *)&self->_unreportedSignals, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unreportedSignals, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

@end
