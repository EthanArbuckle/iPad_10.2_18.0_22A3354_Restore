@implementation CARSetupHeadUnitPairingPrompt

- (CARSetupHeadUnitPairingPrompt)initWithKeyIdentifier:(id)a3
{
  id v5;
  CARSetupHeadUnitPairingPrompt *v6;
  CARSetupHeadUnitPairingPrompt *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CARSetupHeadUnitPairingPrompt;
  v6 = -[CARSetupHeadUnitPairingPrompt init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_keyIdentifier, a3);
    -[CARSetupHeadUnitPairingPrompt _setupConnection](v7, "_setupConnection");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CARSetupHeadUnitPairingPrompt invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CARSetupHeadUnitPairingPrompt;
  -[CARSetupHeadUnitPairingPrompt dealloc](&v3, sel_dealloc);
}

- (BOOL)wantsToPresentHeadUnitPairing
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__CARSetupHeadUnitPairingPrompt_wantsToPresentHeadUnitPairing__block_invoke;
  v4[3] = &unk_250986F80;
  v4[4] = self;
  v4[5] = &v5;
  -[CARSetupHeadUnitPairingPrompt _synchronous_servicePerform:](self, "_synchronous_servicePerform:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __62__CARSetupHeadUnitPairingPrompt_wantsToPresentHeadUnitPairing__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "keyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__CARSetupHeadUnitPairingPrompt_wantsToPresentHeadUnitPairing__block_invoke_2;
  v6[3] = &unk_250986F58;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "wantsToPresentHeadUnitPairingPromptForKeyIdentifier:completion:", v5, v6);

}

void __62__CARSetupHeadUnitPairingPrompt_wantsToPresentHeadUnitPairing__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "BOOLValue");
    CARSetupLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_237AF2000, v6, OS_LOG_TYPE_DEFAULT, "wantsToPresentHeadUnitPairing: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    CARSetupLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __62__CARSetupHeadUnitPairingPrompt_wantsToPresentHeadUnitPairing__block_invoke_2_cold_1();
  }

}

- (id)headUnitPairingPromptViewController
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __68__CARSetupHeadUnitPairingPrompt_headUnitPairingPromptViewController__block_invoke;
  v4[3] = &unk_250986FA8;
  objc_copyWeak(&v5, &location);
  +[CARSetupPrompts connectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:](CARSetupPrompts, "connectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:", 0, 0, v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __68__CARSetupHeadUnitPairingPrompt_headUnitPairingPromptViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDidFinishWithResult:", a2);

}

- (void)presentHeadUnitPairingPrompt
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237AF2000, v3, OS_LOG_TYPE_INFO, "calling presentHeadUnitPairingPrompt", buf, 2u);
  }

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__CARSetupHeadUnitPairingPrompt_presentHeadUnitPairingPrompt__block_invoke;
  v4[3] = &unk_250987020;
  v4[4] = self;
  -[CARSetupHeadUnitPairingPrompt _servicePerform:](self, "_servicePerform:", v4);
}

void __61__CARSetupHeadUnitPairingPrompt_presentHeadUnitPairingPrompt__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "keyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__CARSetupHeadUnitPairingPrompt_presentHeadUnitPairingPrompt__block_invoke_2;
  v6[3] = &unk_250986FF8;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "presentHeadUnitPairingPromptForKeyIdentifier:completion:", v5, v6);

}

void __61__CARSetupHeadUnitPairingPrompt_presentHeadUnitPairingPrompt__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  _QWORD v8[5];
  char v9;
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CARSetupLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_237AF2000, v6, OS_LOG_TYPE_DEFAULT, "presentHeadUnitPairingPrompt completed: %{public}@ error: %@", buf, 0x16u);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__CARSetupHeadUnitPairingPrompt_presentHeadUnitPairingPrompt__block_invoke_8;
  v8[3] = &unk_250986FD0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

uint64_t __61__CARSetupHeadUnitPairingPrompt_presentHeadUnitPairingPrompt__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_delegateDidFinishWithResult:", *(unsigned __int8 *)(a1 + 40));
}

- (void)invalidate
{
  void *v3;

  -[CARSetupHeadUnitPairingPrompt connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CARSetupHeadUnitPairingPrompt setConnection:](self, "setConnection:", 0);
}

- (void)_setupConnection
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.carkit.headUnitPairingPrompt.service"), 4096);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256884D38);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__CARSetupHeadUnitPairingPrompt__setupConnection__block_invoke;
  v8[3] = &unk_250987048;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __49__CARSetupHeadUnitPairingPrompt__setupConnection__block_invoke_64;
  v6[3] = &unk_250987048;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  objc_msgSend(v3, "resume");
  -[CARSetupHeadUnitPairingPrompt setConnection:](self, "setConnection:", v3);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __49__CARSetupHeadUnitPairingPrompt__setupConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;

  CARSetupLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __49__CARSetupHeadUnitPairingPrompt__setupConnection__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionReset");

}

void __49__CARSetupHeadUnitPairingPrompt__setupConnection__block_invoke_64(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;

  CARSetupLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __49__CARSetupHeadUnitPairingPrompt__setupConnection__block_invoke_64_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

- (void)_servicePerform:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  id v6;

  v4 = (void (**)(id, id))a3;
  -[CARSetupHeadUnitPairingPrompt connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v6);
}

void __49__CARSetupHeadUnitPairingPrompt__servicePerform___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __49__CARSetupHeadUnitPairingPrompt__servicePerform___block_invoke_cold_1();

}

- (void)_synchronous_servicePerform:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  id v6;

  v4 = (void (**)(id, id))a3;
  -[CARSetupHeadUnitPairingPrompt connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_66);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v6);
}

void __61__CARSetupHeadUnitPairingPrompt__synchronous_servicePerform___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __49__CARSetupHeadUnitPairingPrompt__servicePerform___block_invoke_cold_1();

}

- (void)_handleConnectionReset
{
  -[CARSetupHeadUnitPairingPrompt setConnection:](self, "setConnection:", 0);
}

- (void)_handleDidFinishWithResult:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  const __CFString *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  CARSetupLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("declined");
    if (v3)
      v6 = CFSTR("accepted");
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl(&dword_237AF2000, v5, OS_LOG_TYPE_DEFAULT, "head unit pairing prompt was %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__CARSetupHeadUnitPairingPrompt__handleDidFinishWithResult___block_invoke;
  v7[3] = &unk_250987110;
  v8 = v3;
  v7[4] = self;
  -[CARSetupHeadUnitPairingPrompt _synchronous_servicePerform:](self, "_synchronous_servicePerform:", v7);
  -[CARSetupHeadUnitPairingPrompt _mainQueue_delegateDidFinishWithResult:](self, "_mainQueue_delegateDidFinishWithResult:", v3);
}

void __60__CARSetupHeadUnitPairingPrompt__handleDidFinishWithResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "keyIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleReceivedResponse:forKeyIdentifier:completion:", v2, v5, &__block_literal_global_71);

}

void __60__CARSetupHeadUnitPairingPrompt__handleDidFinishWithResult___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  CARSetupLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_237AF2000, v6, OS_LOG_TYPE_INFO, "head unit pairing service handled the response", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __60__CARSetupHeadUnitPairingPrompt__handleDidFinishWithResult___block_invoke_2_cold_1();
  }

}

- (void)_mainQueue_delegateDidFinishWithResult:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;

  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[CARSetupHeadUnitPairingPrompt delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v8 = (void *)v5;
    v7 = objc_opt_respondsToSelector();
    v6 = v8;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8, "headUnitPairingPrompt:didFinishWithResult:", self, v3);
      v6 = v8;
    }
  }

}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (CARSetupHeadUnitPairingPromptDelegate)delegate
{
  return (CARSetupHeadUnitPairingPromptDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

void __62__CARSetupHeadUnitPairingPrompt_wantsToPresentHeadUnitPairing__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_237AF2000, v0, v1, "error from wantsToPresentHeadUnitPairing: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __49__CARSetupHeadUnitPairingPrompt__setupConnection__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_237AF2000, a1, a3, "CarKit head unit pairing prompt service was interrupted", a5, a6, a7, a8, 0);
}

void __49__CARSetupHeadUnitPairingPrompt__setupConnection__block_invoke_64_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_237AF2000, a1, a3, "CarKit head unit pairing prompt service was invalidated", a5, a6, a7, a8, 0);
}

void __49__CARSetupHeadUnitPairingPrompt__servicePerform___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_237AF2000, v0, v1, "error calling CarKit head unit pairing prompt service: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__CARSetupHeadUnitPairingPrompt__handleDidFinishWithResult___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_237AF2000, v0, v1, "head unit pairing service failed to handle the response, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
