@implementation DIAudioPowerController

- (DIAudioPowerController)initWithConnectionManager:(id)a3
{
  id v4;
  DIAudioPowerController *v5;
  DIAudioPowerController *v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DIAudioPowerController;
  v5 = -[DIAudioPowerController init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_connectionManager, v4);
    objc_msgSend(v4, "dispatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAudioPowerDelegate:", v6);

    WeakRetained = objc_loadWeakRetained((id *)&v6->_connectionManager);
    objc_msgSend(WeakRetained, "manager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addCheckInObserver:", v6);

  }
  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  DILogHandleAudioPowerController();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = &stru_250B97E20;
    _os_log_impl(&dword_23A742000, v3, OS_LOG_TYPE_DEFAULT, "%@Tearing down Audio Power Controller", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)DIAudioPowerController;
  -[DIAudioPowerController dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_storeWeak((id *)&self->_delegate, a3);
  if (a3)
  {
    -[DIAudioPowerController connectionManager](self, "connectionManager");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "manager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DIAudioPowerController connectionManager](self, "connectionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "manager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerAudioPowerWithContext:completionHandler:", v10, &__block_literal_global_5);

  }
  else
  {
    DILogHandleAudioPowerController();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = &stru_250B97E20;
      _os_log_impl(&dword_23A742000, v11, OS_LOG_TYPE_DEFAULT, "%@Audio power controller delegate set to nil", buf, 0xCu);
    }

  }
}

void __38__DIAudioPowerController_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  DILogHandleAudioPowerController();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = &stru_250B97E20;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_23A742000, v3, OS_LOG_TYPE_ERROR, "%@Audio power controller set delegate proxy error: %@", (uint8_t *)&v5, 0x16u);

  }
}

void __38__DIAudioPowerController_setDelegate___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    DILogHandleAudioPowerController();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "localizedDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412546;
      v6 = &stru_250B97E20;
      v7 = 2112;
      v8 = v4;
      _os_log_impl(&dword_23A742000, v3, OS_LOG_TYPE_ERROR, "%@Audio power controller set delegate register audio power with context error: %@", (uint8_t *)&v5, 0x16u);

    }
  }

}

- (void)didUpdateAudioPower:(float)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  float v11;

  -[DIAudioPowerController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[DIAudioPowerController connectionManager](self, "connectionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "manager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __46__DIAudioPowerController_didUpdateAudioPower___block_invoke;
    v10[3] = &unk_250B96748;
    v10[4] = self;
    v11 = a3;
    +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v9, v10);

  }
}

void __46__DIAudioPowerController_didUpdateAudioPower___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v3, "controller:didUpdateAudioPowerForDropInDevice:", *(_QWORD *)(a1 + 32), v2);

}

- (void)xpcManagerDidPerformDaemonCheckIn:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[DIAudioPowerController setDelegate:](self, "setDelegate:", WeakRetained);

}

- (DIAudioPowerControllerDelegate)delegate
{
  return (DIAudioPowerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (DIXPCConnectionManager)connectionManager
{
  return (DIXPCConnectionManager *)objc_loadWeakRetained((id *)&self->_connectionManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionManager);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
