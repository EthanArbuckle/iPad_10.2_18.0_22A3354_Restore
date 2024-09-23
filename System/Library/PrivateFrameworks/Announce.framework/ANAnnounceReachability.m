@implementation ANAnnounceReachability

- (ANAnnounceReachability)init
{
  ANAnnounceReachability *v2;
  uint64_t v3;
  OS_os_log *log;
  NSObject *v5;
  uint64_t v6;
  NSXPCConnection *connection;
  void *v8;
  void *v9;
  void *v10;
  NSXPCConnection *v11;
  uint64_t v12;
  NSXPCConnection *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  objc_super v22;
  uint8_t buf[4];
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)ANAnnounceReachability;
  v2 = -[ANAnnounceReachability init](&v22, sel_init);
  if (v2)
  {
    ANLogWithCategory("ReachabilityClient");
    v3 = objc_claimAutoreleasedReturnValue();
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = CFSTR("com.apple.announced.reachability");
      _os_log_impl(&dword_2156FF000, v5, OS_LOG_TYPE_DEFAULT, "Creating Connection to %@", buf, 0xCu);
    }
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.announced.reachability"), 4096);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v6;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DE8AC8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DE57C0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v8);
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setDelegate:", v2);
    -[NSXPCConnection setExportedInterface:](v2->_connection, "setExportedInterface:", v9);
    -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v10);
    objc_initWeak((id *)buf, v2);
    v11 = v2->_connection;
    v12 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __30__ANAnnounceReachability_init__block_invoke;
    v20[3] = &unk_24D3702A8;
    objc_copyWeak(&v21, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](v11, "setInterruptionHandler:", v20);
    v13 = v2->_connection;
    v15 = v12;
    v16 = 3221225472;
    v17 = __30__ANAnnounceReachability_init__block_invoke_80;
    v18 = &unk_24D3702A8;
    objc_copyWeak(&v19, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](v13, "setInvalidationHandler:", &v15);
    -[NSXPCConnection resume](v2->_connection, "resume", v15, v16, v17, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);

  }
  return v2;
}

void __30__ANAnnounceReachability_init__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  NSObject *v3;
  id v4;
  void *v5;
  uint8_t v6[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "log");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2156FF000, v3, OS_LOG_TYPE_DEFAULT, "Connection to announced was interrupted", v6, 2u);
  }

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectionInterrupted");

}

void __30__ANAnnounceReachability_init__block_invoke_80(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  NSObject *v3;
  id v4;
  void *v5;
  uint8_t v6[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "log");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2156FF000, v3, OS_LOG_TYPE_DEFAULT, "Connection to announced was invalidated", v6, 2u);
  }

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectionInvalidated");

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  -[ANAnnounceReachability log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2156FF000, v3, OS_LOG_TYPE_DEFAULT, "Dealloc Reachability", buf, 2u);
  }

  -[ANAnnounceReachability invalidate](self, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)ANAnnounceReachability;
  -[ANAnnounceReachability dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  id v3;

  objc_storeWeak((id *)&self->_delegate, 0);
  -[ANAnnounceReachability connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  if (!obj)
  {
    objc_storeWeak((id *)&self->_delegate, 0);
    goto LABEL_5;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  objc_storeWeak((id *)&self->_delegate, obj);
  v5 = obj;
  if (WeakRetained != obj)
  {
    -[ANAnnounceReachability _start](self, "_start");
LABEL_5:
    v5 = obj;
  }

}

- (ANAnnounceReachabilityDelegate)delegate
{
  return (ANAnnounceReachabilityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)announceReachabilityForHomeName:(id)a3
{
  id v4;
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  unint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__ANAnnounceReachability_announceReachabilityForHomeName___block_invoke;
  v11[3] = &unk_24D370788;
  v11[4] = self;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __58__ANAnnounceReachability_announceReachabilityForHomeName___block_invoke_84;
  v10[3] = &unk_24D370220;
  v10[4] = &v12;
  objc_msgSend(v7, "announceReachabilityForHomeName:reply:", v4, v10);

  v8 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __58__ANAnnounceReachability_announceReachabilityForHomeName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__ANAnnounceReachability_announceReachabilityForHomeName___block_invoke_cold_1();

}

uint64_t __58__ANAnnounceReachability_announceReachabilityForHomeName___block_invoke_84(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (unint64_t)announceReachabilityForRoomName:(id)a3 inHomeName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSXPCConnection *connection;
  void *v10;
  unint64_t v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v8 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__ANAnnounceReachability_announceReachabilityForRoomName_inHomeName___block_invoke;
  v14[3] = &unk_24D370788;
  v14[4] = self;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __69__ANAnnounceReachability_announceReachabilityForRoomName_inHomeName___block_invoke_86;
  v13[3] = &unk_24D370220;
  v13[4] = &v15;
  objc_msgSend(v10, "announceReachabilityForRoomName:inHomeName:reply:", v6, v7, v13);

  v11 = v16[3];
  _Block_object_dispose(&v15, 8);

  return v11;
}

void __69__ANAnnounceReachability_announceReachabilityForRoomName_inHomeName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__ANAnnounceReachability_announceReachabilityForRoomName_inHomeName___block_invoke_cold_1();

}

uint64_t __69__ANAnnounceReachability_announceReachabilityForRoomName_inHomeName___block_invoke_86(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (unint64_t)announceReachabilityForHomeUUID:(id)a3
{
  id v4;
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  unint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__ANAnnounceReachability_announceReachabilityForHomeUUID___block_invoke;
  v11[3] = &unk_24D370788;
  v11[4] = self;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __58__ANAnnounceReachability_announceReachabilityForHomeUUID___block_invoke_87;
  v10[3] = &unk_24D370220;
  v10[4] = &v12;
  objc_msgSend(v7, "announceReachabilityForHomeUUID:reply:", v4, v10);

  v8 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __58__ANAnnounceReachability_announceReachabilityForHomeUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__ANAnnounceReachability_announceReachabilityForHomeUUID___block_invoke_cold_1();

}

uint64_t __58__ANAnnounceReachability_announceReachabilityForHomeUUID___block_invoke_87(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (unint64_t)announceReachabilityForRoomUUID:(id)a3 inHomeUUID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSXPCConnection *connection;
  void *v10;
  unint64_t v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v8 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__ANAnnounceReachability_announceReachabilityForRoomUUID_inHomeUUID___block_invoke;
  v14[3] = &unk_24D370788;
  v14[4] = self;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __69__ANAnnounceReachability_announceReachabilityForRoomUUID_inHomeUUID___block_invoke_88;
  v13[3] = &unk_24D370220;
  v13[4] = &v15;
  objc_msgSend(v10, "announceReachabilityForRoomUUID:inHomeUUID:reply:", v6, v7, v13);

  v11 = v16[3];
  _Block_object_dispose(&v15, 8);

  return v11;
}

void __69__ANAnnounceReachability_announceReachabilityForRoomUUID_inHomeUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__ANAnnounceReachability_announceReachabilityForRoomUUID_inHomeUUID___block_invoke_cold_1();

}

uint64_t __69__ANAnnounceReachability_announceReachabilityForRoomUUID_inHomeUUID___block_invoke_88(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (id)stringForAnnounceReachabilityLevel:(unint64_t)a3
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  if (a3)
  {
    v3 = a3;
    v4 = (void *)objc_opt_new();
    v5 = v4;
    if ((v3 & 1) != 0)
      objc_msgSend(v4, "addObject:", CFSTR("Local"));
    if ((v3 & 2) != 0)
      objc_msgSend(v5, "addObject:", CFSTR("Remote"));
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" | "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@]"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("[Unknown]");
  }
  return v8;
}

- (void)_start
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  -[ANAnnounceReachability connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__ANAnnounceReachability__start__block_invoke;
  v7[3] = &unk_24D370788;
  v7[4] = self;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __32__ANAnnounceReachability__start__block_invoke_100;
  v6[3] = &unk_24D3709E8;
  v6[4] = self;
  objc_msgSend(v5, "resumeWithCompletionHandler:", v6);

}

void __32__ANAnnounceReachability__start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __32__ANAnnounceReachability__start__block_invoke_cold_1();

}

void __32__ANAnnounceReachability__start__block_invoke_100(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "announceReachabilityDidStartScanning:", *(_QWORD *)(a1 + 32));

  }
}

- (void)reachabilityLevel:(unint64_t)a3 didChangeForHomeName:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[ANAnnounceReachability log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    +[ANAnnounceReachability stringForAnnounceReachabilityLevel:](ANAnnounceReachability, "stringForAnnounceReachabilityLevel:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_2156FF000, v7, OS_LOG_TYPE_DEFAULT, "Reachability updated for Home = %@: %@", (uint8_t *)&v12, 0x16u);

  }
  -[ANAnnounceReachability delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[ANAnnounceReachability delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "announceReachability:didUpdateReachabilityLevel:forHomeName:", self, a3, v6);

  }
}

- (void)reachabilityLevel:(unint64_t)a3 didChangeForRoomName:(id)a4 inHomeName:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[ANAnnounceReachability log](self, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    +[ANAnnounceReachability stringForAnnounceReachabilityLevel:](ANAnnounceReachability, "stringForAnnounceReachabilityLevel:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v9;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_2156FF000, v10, OS_LOG_TYPE_DEFAULT, "Reachability updated for Home = %@, Room = %@: %@", (uint8_t *)&v15, 0x20u);

  }
  -[ANAnnounceReachability delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[ANAnnounceReachability delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "announceReachability:didUpdateReachabilityLevel:forRoomName:inHomeName:", self, a3, v8, v9);

  }
}

- (void)reachabilityLevel:(unint64_t)a3 didChangeForHomeUUID:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[ANAnnounceReachability log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    +[ANAnnounceReachability stringForAnnounceReachabilityLevel:](ANAnnounceReachability, "stringForAnnounceReachabilityLevel:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_2156FF000, v7, OS_LOG_TYPE_DEFAULT, "Reachability updated for Home = %@: %@", (uint8_t *)&v12, 0x16u);

  }
  -[ANAnnounceReachability delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[ANAnnounceReachability delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "announceReachability:didUpdateReachabilityLevel:forHomeUUID:", self, a3, v6);

  }
}

- (void)reachabilityLevel:(unint64_t)a3 didChangeForRoomUUID:(id)a4 inHomeUUID:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[ANAnnounceReachability log](self, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    +[ANAnnounceReachability stringForAnnounceReachabilityLevel:](ANAnnounceReachability, "stringForAnnounceReachabilityLevel:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v9;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_2156FF000, v10, OS_LOG_TYPE_DEFAULT, "Reachability updated for Home = %@, Room = %@: %@", (uint8_t *)&v15, 0x20u);

  }
  -[ANAnnounceReachability delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[ANAnnounceReachability delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "announceReachability:didUpdateReachabilityLevel:forRoomUUID:inHomeUUID:", self, a3, v8, v9);

  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __58__ANAnnounceReachability_announceReachabilityForHomeName___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2156FF000, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __69__ANAnnounceReachability_announceReachabilityForRoomName_inHomeName___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2156FF000, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __58__ANAnnounceReachability_announceReachabilityForHomeUUID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2156FF000, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __69__ANAnnounceReachability_announceReachabilityForRoomUUID_inHomeUUID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2156FF000, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __32__ANAnnounceReachability__start__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2156FF000, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
