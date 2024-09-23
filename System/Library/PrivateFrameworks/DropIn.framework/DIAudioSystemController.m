@implementation DIAudioSystemController

- (DIAudioSystemController)initWithConnectionManager:(id)a3
{
  id v4;
  DIAudioSystemController *v5;
  uint64_t v6;
  NSRecursiveLock *lock;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIAudioSystemController;
  v5 = -[DIAudioSystemController init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    lock = v5->_lock;
    v5->_lock = (NSRecursiveLock *)v6;

    *(_WORD *)&v5->_needsInitialUplinkMuteStatus = 257;
    v8 = objc_storeWeak((id *)&v5->_connectionManager, v4);
    objc_msgSend(v4, "dispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAudioStatusDelegate:", v5);

  }
  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  DILogHandleAudioSystemController();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = &stru_250B97E20;
    _os_log_impl(&dword_23A742000, v3, OS_LOG_TYPE_DEFAULT, "%@Tearing down Audio System Controller", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)DIAudioSystemController;
  -[DIAudioSystemController dealloc](&v4, sel_dealloc);
}

- (BOOL)isUplinkMuted
{
  DIAudioSystemController *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[DIAudioSystemController lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__DIAudioSystemController_isUplinkMuted__block_invoke;
  v5[3] = &unk_250B963B0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "di_synchronize:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __40__DIAudioSystemController_isUplinkMuted__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, char);
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id location;

  if ((objc_msgSend(*(id *)(a1 + 32), "needsInitialUplinkMuteStatus") & 1) != 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "connectionManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "manager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __40__DIAudioSystemController_isUplinkMuted__block_invoke_2;
    v13[3] = &unk_250B96360;
    v13[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = 3221225472;
    v9 = __40__DIAudioSystemController_isUplinkMuted__block_invoke_4;
    v10 = &unk_250B968E0;
    objc_copyWeak(&v12, &location);
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "getUplinkMutedWithCompletionHandler:", &v7);

    if ((objc_msgSend(*(id *)(a1 + 32), "needsInitialUplinkMuteStatus", v7, v8, v9, v10) & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8);
  }
}

void __40__DIAudioSystemController_isUplinkMuted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  DILogHandleAudioSystemController();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412546;
    v6 = &stru_250B97E20;
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_23A742000, v4, OS_LOG_TYPE_ERROR, "%@Failed to get uplink muted %@", (uint8_t *)&v5, 0x16u);
  }

}

void __40__DIAudioSystemController_isUplinkMuted__block_invoke_4(uint64_t a1, char a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_msgSend(WeakRetained, "setNeedsInitialUplinkMuteStatus:", 0);

}

- (void)setUplinkMuted:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  BOOL v9;

  v3 = a3;
  -[DIAudioSystemController connectionManager](self, "connectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__DIAudioSystemController_setUplinkMuted___block_invoke_7;
  v8[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
  v9 = v3;
  objc_msgSend(v7, "setUplinkMuted:completionHandler:", v3, v8);

}

void __42__DIAudioSystemController_setUplinkMuted___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  DILogHandleAudioSystemController();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412546;
    v5 = &stru_250B97E20;
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_23A742000, v3, OS_LOG_TYPE_ERROR, "%@Failed to set uplink muted %@", (uint8_t *)&v4, 0x16u);
  }

}

void __42__DIAudioSystemController_setUplinkMuted___block_invoke_7(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  int v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  DILogHandleAudioSystemController();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(unsigned __int8 *)(a1 + 32);
      v11 = 138412546;
      v12 = &stru_250B97E20;
      v13 = 1024;
      v14 = v6;
      v7 = "%@Failed to set uplink muted to %d";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_23A742000, v8, v9, v7, (uint8_t *)&v11, 0x12u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(unsigned __int8 *)(a1 + 32);
    v11 = 138412546;
    v12 = &stru_250B97E20;
    v13 = 1024;
    v14 = v10;
    v7 = "%@Uplink muted set to %d";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }

}

- (BOOL)isDownlinkMuted
{
  DIAudioSystemController *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[DIAudioSystemController lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__DIAudioSystemController_isDownlinkMuted__block_invoke;
  v5[3] = &unk_250B963B0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "di_synchronize:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __42__DIAudioSystemController_isDownlinkMuted__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, char);
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id location;

  if ((objc_msgSend(*(id *)(a1 + 32), "needsInitialDownlinkMuteStatus") & 1) != 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "connectionManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "manager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __42__DIAudioSystemController_isDownlinkMuted__block_invoke_2;
    v13[3] = &unk_250B96360;
    v13[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = 3221225472;
    v9 = __42__DIAudioSystemController_isDownlinkMuted__block_invoke_8;
    v10 = &unk_250B968E0;
    objc_copyWeak(&v12, &location);
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "getDownlinkMutedWithCompletionHandler:", &v7);

    if ((objc_msgSend(*(id *)(a1 + 32), "needsInitialDownlinkMuteStatus", v7, v8, v9, v10) & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9);
  }
}

void __42__DIAudioSystemController_isDownlinkMuted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  DILogHandleAudioSystemController();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412546;
    v6 = &stru_250B97E20;
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_23A742000, v4, OS_LOG_TYPE_ERROR, "%@Failed to get downlink muted %@", (uint8_t *)&v5, 0x16u);
  }

}

void __42__DIAudioSystemController_isDownlinkMuted__block_invoke_8(uint64_t a1, char a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_msgSend(WeakRetained, "setNeedsInitialDownlinkMuteStatus:", 0);

}

- (void)setDownlinkMuted:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  BOOL v9;

  v3 = a3;
  -[DIAudioSystemController connectionManager](self, "connectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_9_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__DIAudioSystemController_setDownlinkMuted___block_invoke_10;
  v8[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
  v9 = v3;
  objc_msgSend(v7, "setDownlinkMuted:completionHandler:", v3, v8);

}

void __44__DIAudioSystemController_setDownlinkMuted___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  DILogHandleAudioSystemController();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412546;
    v5 = &stru_250B97E20;
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_23A742000, v3, OS_LOG_TYPE_ERROR, "%@Failed to set downlink muted %@", (uint8_t *)&v4, 0x16u);
  }

}

void __44__DIAudioSystemController_setDownlinkMuted___block_invoke_10(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  int v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  DILogHandleAudioSystemController();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(unsigned __int8 *)(a1 + 32);
      v11 = 138412546;
      v12 = &stru_250B97E20;
      v13 = 1024;
      v14 = v6;
      v7 = "%@Failed to set downlink muted to %d";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_23A742000, v8, v9, v7, (uint8_t *)&v11, 0x12u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(unsigned __int8 *)(a1 + 32);
    v11 = 138412546;
    v12 = &stru_250B97E20;
    v13 = 1024;
    v14 = v10;
    v7 = "%@Uplink muted set to %d";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }

}

- (void)didUpdateDownlinkMuteStatus:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  BOOL v13;
  _QWORD v14[5];
  BOOL v15;

  -[DIAudioSystemController lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__DIAudioSystemController_didUpdateDownlinkMuteStatus___block_invoke;
  v14[3] = &unk_250B96460;
  v14[4] = self;
  v15 = a3;
  objc_msgSend(v5, "di_synchronize:", v14);

  -[DIAudioSystemController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[DIAudioSystemController connectionManager](self, "connectionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "manager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clientQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __55__DIAudioSystemController_didUpdateDownlinkMuteStatus___block_invoke_2;
    v12[3] = &unk_250B96460;
    v12[4] = self;
    v13 = a3;
    +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v11, v12);

  }
}

uint64_t __55__DIAudioSystemController_didUpdateDownlinkMuteStatus___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsInitialDownlinkMuteStatus:", 0);
}

void __55__DIAudioSystemController_didUpdateDownlinkMuteStatus___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controller:didUpdateDownlinkMuteStatus:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)didUpdateUplinkMuteStatus:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  BOOL v13;
  _QWORD v14[5];
  BOOL v15;

  -[DIAudioSystemController lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __53__DIAudioSystemController_didUpdateUplinkMuteStatus___block_invoke;
  v14[3] = &unk_250B96460;
  v14[4] = self;
  v15 = a3;
  objc_msgSend(v5, "di_synchronize:", v14);

  -[DIAudioSystemController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[DIAudioSystemController connectionManager](self, "connectionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "manager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clientQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __53__DIAudioSystemController_didUpdateUplinkMuteStatus___block_invoke_2;
    v12[3] = &unk_250B96460;
    v12[4] = self;
    v13 = a3;
    +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v11, v12);

  }
}

uint64_t __53__DIAudioSystemController_didUpdateUplinkMuteStatus___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsInitialUplinkMuteStatus:", 0);
}

void __53__DIAudioSystemController_didUpdateUplinkMuteStatus___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controller:didUpdateUplinkMuteStatus:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (DIAudioSystemControllerDelegate)delegate
{
  return (DIAudioSystemControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DIXPCConnectionManager)connectionManager
{
  return (DIXPCConnectionManager *)objc_loadWeakRetained((id *)&self->_connectionManager);
}

- (BOOL)needsInitialUplinkMuteStatus
{
  return self->_needsInitialUplinkMuteStatus;
}

- (void)setNeedsInitialUplinkMuteStatus:(BOOL)a3
{
  self->_needsInitialUplinkMuteStatus = a3;
}

- (BOOL)needsInitialDownlinkMuteStatus
{
  return self->_needsInitialDownlinkMuteStatus;
}

- (void)setNeedsInitialDownlinkMuteStatus:(BOOL)a3
{
  self->_needsInitialDownlinkMuteStatus = a3;
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_destroyWeak((id *)&self->_connectionManager);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
