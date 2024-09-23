@implementation CPSAuthenticationSession

- (CPSAuthenticationSession)initWithRequest:(id)a3
{
  id v6;
  void *v7;
  CPSAuthenticationSession *v8;
  uint64_t Serial;
  OS_dispatch_queue *dispatchQueue;
  CPSAuthenticationSession *result;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v13.receiver = self;
    v13.super_class = (Class)CPSAuthenticationSession;
    v8 = -[CPSAuthenticationSession init](&v13, sel_init);
    if (v8)
    {
      Serial = BSDispatchQueueCreateSerial();
      dispatchQueue = v8->_dispatchQueue;
      v8->_dispatchQueue = (OS_dispatch_queue *)Serial;

      objc_storeStrong((id *)&v8->_request, a3);
    }

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("request != nil"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[CPSAuthenticationSession initWithRequest:].cold.1(a2, (uint64_t)self, (uint64_t)v12);
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    result = (CPSAuthenticationSession *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)start
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__CPSAuthenticationSession_start__block_invoke;
  block[3] = &unk_250A11768;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __33__CPSAuthenticationSession_start__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 24))
  {
    ClientSessionLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __33__CPSAuthenticationSession_start__block_invoke_cold_2();
LABEL_7:

    return;
  }
  if (*(_BYTE *)(v1 + 25))
  {
    ClientSessionLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __33__CPSAuthenticationSession_start__block_invoke_cold_1();
    goto LABEL_7;
  }
  -[CPSAuthenticationSession _activated](v1);
}

- (void)_activated
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    ClientSessionLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2383E3000, v2, OS_LOG_TYPE_INFO, "Activated", buf, 2u);
    }

    *(_BYTE *)(a1 + 24) = 1;
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.companiond.xpc"), 0);
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v3;

    v5 = *(void **)(a1 + 16);
    +[CPSAuthenticationServiceInterface clientInterface](CPSAuthenticationServiceInterface, "clientInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v6);

    v7 = *(void **)(a1 + 16);
    +[CPSAuthenticationServiceInterface daemonInterface](CPSAuthenticationServiceInterface, "daemonInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v8);

    objc_msgSend(*(id *)(a1 + 16), "setExportedObject:", a1);
    objc_msgSend(*(id *)(a1 + 16), "_setQueue:", *(_QWORD *)(a1 + 8));
    v9 = MEMORY[0x24BDAC760];
    v10 = *(void **)(a1 + 16);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __38__CPSAuthenticationSession__activated__block_invoke;
    v18[3] = &unk_250A11768;
    v18[4] = a1;
    objc_msgSend(v10, "setInterruptionHandler:", v18);
    v11 = *(void **)(a1 + 16);
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __38__CPSAuthenticationSession__activated__block_invoke_13;
    v17[3] = &unk_250A11768;
    v17[4] = a1;
    objc_msgSend(v11, "setInvalidationHandler:", v17);
    objc_msgSend(*(id *)(a1 + 16), "resume");
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __38__CPSAuthenticationSession__activated__block_invoke_14;
    v16[3] = &unk_250A11790;
    v16[4] = a1;
    v12 = (void *)MEMORY[0x23B833214](v16);
    ClientSessionLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_impl(&dword_2383E3000, v13, OS_LOG_TYPE_DEFAULT, "Starting authentication session: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 16), "remoteObjectProxyWithErrorHandler:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startAuthenticationSessionWithRequest:completionHandler:", *(_QWORD *)(a1 + 32), v12);

  }
}

- (void)cancel
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__CPSAuthenticationSession_cancel__block_invoke;
  block[3] = &unk_250A11768;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __34__CPSAuthenticationSession_cancel__block_invoke(uint64_t a1)
{
  -[CPSAuthenticationSession _invalidated](*(_QWORD *)(a1 + 32));
}

- (void)_invalidated
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  if (a1 && !*(_BYTE *)(a1 + 25))
  {
    ClientSessionLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_2383E3000, v2, OS_LOG_TYPE_INFO, "Invalidated", v11, 2u);
    }

    v3 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

    v4 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = 0;

    v5 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    v6 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = 0;

    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      NSErrorF();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

      v9 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

    }
    objc_msgSend(*(id *)(a1 + 16), "setInterruptionHandler:", 0);
    objc_msgSend(*(id *)(a1 + 16), "setInvalidationHandler:", 0);
    objc_msgSend(*(id *)(a1 + 16), "invalidate");
    v10 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    *(_BYTE *)(a1 + 25) = 1;
  }
}

void __38__CPSAuthenticationSession__activated__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  ClientSessionLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __38__CPSAuthenticationSession__activated__block_invoke_cold_1();

  NSErrorF();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAuthenticationSession _sessionFailedWithError:](*(_QWORD *)(a1 + 32), v3);

}

- (void)_sessionFailedWithError:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = a2;
  if (a1)
  {
    ClientSessionLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[CPSAuthenticationSession _sessionFailedWithError:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    v11 = *(_QWORD *)(a1 + 56);
    if (v11)
    {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);
      v12 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = 0;

    }
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v3);
      v14 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

    }
    -[CPSAuthenticationSession _invalidated](a1);
  }

}

void __38__CPSAuthenticationSession__activated__block_invoke_13(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  ClientSessionLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __38__CPSAuthenticationSession__activated__block_invoke_13_cold_1();

  NSErrorF();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAuthenticationSession _sessionFailedWithError:](*(_QWORD *)(a1 + 32), v5);

}

void __38__CPSAuthenticationSession__activated__block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    ClientSessionLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __38__CPSAuthenticationSession__activated__block_invoke_14_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    -[CPSAuthenticationSession _sessionFailedWithError:](*(_QWORD *)(a1 + 32), v3);
  }

}

- (void)_deviceTappedNotification:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    ClientSessionLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_2383E3000, v4, OS_LOG_TYPE_DEFAULT, "Device tapped notification: %@", (uint8_t *)&v6, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 64);
    if (v5)
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }

}

- (void)_deviceStartedAuthentication:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    ClientSessionLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_2383E3000, v4, OS_LOG_TYPE_DEFAULT, "Device started authentication: %@", (uint8_t *)&v6, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 72);
    if (v5)
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }

}

- (void)_sessionFinishedWithResponse:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    ClientSessionLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_2383E3000, v4, OS_LOG_TYPE_DEFAULT, "Session finished: %@", (uint8_t *)&v9, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

    }
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v7 + 16))(v7, v3, 0);
      v8 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

    }
    -[CPSAuthenticationSession _invalidated](a1);
  }

}

- (void)authenticationSessionDeviceTappedNotification:(id)a3
{
  -[CPSAuthenticationSession _deviceTappedNotification:]((uint64_t)self, a3);
}

- (void)authenticationSessionDeviceStartedAuthentication:(id)a3
{
  -[CPSAuthenticationSession _deviceStartedAuthentication:]((uint64_t)self, a3);
}

- (void)authenticationSessionDidFinishWithResponse:(id)a3
{
  -[CPSAuthenticationSession _sessionFinishedWithResponse:]((uint64_t)self, a3);
}

- (void)authenticationSessionDidFailWithError:(id)a3
{
  -[CPSAuthenticationSession _sessionFailedWithError:]((uint64_t)self, a3);
}

- (CPSAuthenticationRequest)request
{
  return self->_request;
}

- (id)sessionCompletionHandler
{
  return self->_sessionCompletionHandler;
}

- (void)setSessionCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)sessionFinishedHandler
{
  return self->_sessionFinishedHandler;
}

- (void)setSessionFinishedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)sessionFailedHandler
{
  return self->_sessionFailedHandler;
}

- (void)setSessionFailedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)deviceAcceptedNotificationHandler
{
  return self->_deviceAcceptedNotificationHandler;
}

- (void)setDeviceAcceptedNotificationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)deviceStartedAuthenticationHandler
{
  return self->_deviceStartedAuthenticationHandler;
}

- (void)setDeviceStartedAuthenticationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceStartedAuthenticationHandler, 0);
  objc_storeStrong(&self->_deviceAcceptedNotificationHandler, 0);
  objc_storeStrong(&self->_sessionFailedHandler, 0);
  objc_storeStrong(&self->_sessionFinishedHandler, 0);
  objc_storeStrong(&self->_sessionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)initWithRequest:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("CPSAuthenticationSession.m");
  v16 = 1024;
  v17 = 37;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_2383E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

void __33__CPSAuthenticationSession_start__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2383E3000, v0, v1, "Session already invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __33__CPSAuthenticationSession_start__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2383E3000, v0, v1, "Session already activated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __38__CPSAuthenticationSession__activated__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2383E3000, v0, v1, "Connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_sessionFailedWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2383E3000, a2, a3, "Session failed: %@", a5, a6, a7, a8, 2u);
}

void __38__CPSAuthenticationSession__activated__block_invoke_13_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2383E3000, v0, v1, "Connection invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __38__CPSAuthenticationSession__activated__block_invoke_14_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2383E3000, a2, a3, "Failed to start session: %@", a5, a6, a7, a8, 2u);
}

@end
