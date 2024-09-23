@implementation DMTCatalystSharingBackedDeviceSession

- (DMTCatalystSharingBackedDeviceSession)initWithDevice:(id)a3
{
  id v5;
  DMTCatalystSharingBackedDeviceSession *v6;
  DMTCatalystSharingBackedDeviceSession *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *sessionQueue;
  uint64_t v17;
  SFSession *session;
  void *v19;
  void *v20;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DMTCatalystSharingBackedDeviceSession;
  v6 = -[DMTCatalystSharingBackedDeviceSession init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteDevice, a3);
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATSharingDevice identifier](v7->_remoteDevice, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@.%@"), v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_retainAutorelease(v13);
    v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), 0);
    sessionQueue = v7->_sessionQueue;
    v7->_sessionQueue = (OS_dispatch_queue *)v15;

    v17 = objc_opt_new();
    session = v7->_session;
    v7->_session = (SFSession *)v17;

    -[DMTCatalystSharingBackedDeviceSession device](v7, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "underlyingDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSession setPeerDevice:](v7->_session, "setPeerDevice:", v20);

    -[SFSession setServiceIdentifier:](v7->_session, "setServiceIdentifier:", *MEMORY[0x24BE90388]);
    -[SFSession setDispatchQueue:](v7->_session, "setDispatchQueue:", v7->_sessionQueue);

  }
  return v7;
}

- (void)activate
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[DMTCatalystSharingBackedDeviceSession addPrimitiveHandlers](self, "addPrimitiveHandlers");
  objc_initWeak(&location, self);
  -[DMTCatalystSharingBackedDeviceSession session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__DMTCatalystSharingBackedDeviceSession_activate__block_invoke;
  v4[3] = &unk_24E5A01D0;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "activateWithCompletion:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __49__DMTCatalystSharingBackedDeviceSession_activate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (!v3)
    {
      _DMTLogGeneral_4();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
        __49__DMTCatalystSharingBackedDeviceSession_activate__block_invoke_cold_1((uint64_t)v5, v7, v10, v11, v12, v13, v14, v15);
      goto LABEL_7;
    }
    objc_msgSend(WeakRetained, "setInvalidated:", 1);
    objc_msgSend(v5, "deviceSessionInvalidatedHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "deviceSessionInvalidatedHandler");
      v7 = objc_claimAutoreleasedReturnValue();
      v16 = *MEMORY[0x24BDD1398];
      v17[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      DMTErrorWithCodeAndUserInfo(20, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);

LABEL_7:
    }
  }

}

- (void)deactivate
{
  id v2;

  -[DMTCatalystSharingBackedDeviceSession session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)beginPairWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (!-[DMTCatalystSharingBackedDeviceSession isInvalidated](self, "isInvalidated")
    && -[DMTCatalystSharingBackedDeviceSession isReady](self, "isReady"))
  {
    objc_initWeak(&location, self);
    -[DMTCatalystSharingBackedDeviceSession session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __65__DMTCatalystSharingBackedDeviceSession_beginPairWithCompletion___block_invoke;
    v6[3] = &unk_24E5A0218;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    objc_msgSend(v5, "pairSetupWithFlags:completion:", 8, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __65__DMTCatalystSharingBackedDeviceSession_beginPairWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = *(_QWORD *)(a1 + 32);
      +[DMTCatalystSharingBackedDeviceSession failureTypeForPairingError:](DMTCatalystSharingBackedDeviceSession, "failureTypeForPairingError:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    }
    else
    {
      _DMTLogGeneral_4();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __65__DMTCatalystSharingBackedDeviceSession_beginPairWithCompletion___block_invoke_cold_1((uint64_t)WeakRetained, v7, v8, v9, v10, v11, v12, v13);

      objc_msgSend(WeakRetained, "setPaired:", 1);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }

}

- (void)verifyPairing:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (!-[DMTCatalystSharingBackedDeviceSession isInvalidated](self, "isInvalidated")
    && -[DMTCatalystSharingBackedDeviceSession isReady](self, "isReady"))
  {
    objc_initWeak(&location, self);
    -[DMTCatalystSharingBackedDeviceSession session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __55__DMTCatalystSharingBackedDeviceSession_verifyPairing___block_invoke;
    v6[3] = &unk_24E5A0218;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    objc_msgSend(v5, "pairVerifyWithFlags:completion:", 8, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __55__DMTCatalystSharingBackedDeviceSession_verifyPairing___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void (*v7)(void);

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      _DMTLogGeneral_4();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __55__DMTCatalystSharingBackedDeviceSession_verifyPairing___block_invoke_cold_1((uint64_t)v3, v6);

      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      objc_msgSend(WeakRetained, "setPaired:", 1);
      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v7();
  }

}

- (void)tryPairingPIN:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!-[DMTCatalystSharingBackedDeviceSession isInvalidated](self, "isInvalidated")
    && -[DMTCatalystSharingBackedDeviceSession isReady](self, "isReady"))
  {
    -[DMTCatalystSharingBackedDeviceSession session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v4, "pairSetupTryPIN:", v5);

  }
}

- (void)sendMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[DMTCatalystSharingBackedDeviceSession isInvalidated](self, "isInvalidated")
    && -[DMTCatalystSharingBackedDeviceSession isReady](self, "isReady"))
  {
    -[DMTCatalystSharingBackedDeviceSession session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendWithFlags:object:", 1, v5);

  }
}

- (void)addPrimitiveHandlers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke;
  v20[3] = &unk_24E5A0240;
  objc_copyWeak(&v21, &location);
  -[DMTCatalystSharingBackedDeviceSession session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSessionStartedHandler:", v20);

  v18[0] = v3;
  v18[1] = 3221225472;
  v18[2] = __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_2;
  v18[3] = &unk_24E5A0240;
  objc_copyWeak(&v19, &location);
  -[DMTCatalystSharingBackedDeviceSession session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInvalidationHandler:", v18);

  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_3;
  v16[3] = &unk_24E5A0240;
  objc_copyWeak(&v17, &location);
  -[DMTCatalystSharingBackedDeviceSession session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInterruptionHandler:", v16);

  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_8;
  v14[3] = &unk_24E5A0630;
  objc_copyWeak(&v15, &location);
  -[DMTCatalystSharingBackedDeviceSession session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPromptForPINHandler:", v14);

  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_2_10;
  v12[3] = &unk_24E5A01D0;
  objc_copyWeak(&v13, &location);
  -[DMTCatalystSharingBackedDeviceSession session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setErrorHandler:", v12);

  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_3_11;
  v10[3] = &unk_24E5A0658;
  objc_copyWeak(&v11, &location);
  -[DMTCatalystSharingBackedDeviceSession session](self, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setReceivedObjectHandler:", v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setReady:", 1);
    objc_msgSend(v4, "deviceSessionReadyHandler");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    if (v2)
      (*(void (**)(uint64_t))(v2 + 16))(v2);

    WeakRetained = v4;
  }

}

void __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    DMTErrorWithCodeAndUserInfo(20, 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "invalidateWithError:", v1);

  }
}

void __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "isInvalidated"))
    {
      _DMTLogGeneral_4();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_21FD69000, v3, OS_LOG_TYPE_INFO, "Interrupted after invalidation, no-op", v4, 2u);
      }
    }
    else
    {
      DMTErrorWithCodeAndUserInfo(21, 0);
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "invalidateWithError:", v3);
    }

  }
}

void __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_8(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "pinPromptHandler");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      (*(void (**)(uint64_t, id, _QWORD))(v5 + 16))(v5, v7, a3);

    WeakRetained = v7;
  }

}

void __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_2_10(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "deviceSessionErrorHandler");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);

  }
}

void __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_3_11(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "messageReceivedHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isInvalidated") & 1) == 0 && v6)
      ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)removePrimitiveHandlers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[DMTCatalystSharingBackedDeviceSession sessionQueue](self, "sessionQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2207D2CA0]();

  -[DMTCatalystSharingBackedDeviceSession session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSessionStartedHandler:", 0);

  -[DMTCatalystSharingBackedDeviceSession session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInvalidationHandler:", 0);

  -[DMTCatalystSharingBackedDeviceSession session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInterruptionHandler:", 0);

  -[DMTCatalystSharingBackedDeviceSession session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPromptForPINHandler:", 0);

  -[DMTCatalystSharingBackedDeviceSession session](self, "session");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setErrorHandler:", 0);

}

- (void)invalidateWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  -[DMTCatalystSharingBackedDeviceSession sessionQueue](self, "sessionQueue", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2207D2CA0]();

  -[DMTCatalystSharingBackedDeviceSession setInvalidated:](self, "setInvalidated:", 1);
  -[DMTCatalystSharingBackedDeviceSession setReady:](self, "setReady:", 0);
  -[DMTCatalystSharingBackedDeviceSession removePrimitiveHandlers](self, "removePrimitiveHandlers");
  -[DMTCatalystSharingBackedDeviceSession deviceSessionInvalidatedHandler](self, "deviceSessionInvalidatedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DMTCatalystSharingBackedDeviceSession deviceSessionInvalidatedHandler](self, "deviceSessionInvalidatedHandler");
    v7 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    DMTErrorWithCodeAndUserInfo(20, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v6);

  }
}

+ (id)failureTypeForPairingError:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BE15768];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUnderlyingError:", v4);

  return v5;
}

- (CATSharingDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (id)deviceSessionInvalidatedHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setDeviceSessionInvalidatedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (id)deviceSessionReadyHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setDeviceSessionReadyHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (id)deviceSessionErrorHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceSessionErrorHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (id)pinPromptHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setPinPromptHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (id)messageReceivedHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setMessageReceivedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (SFSession)session
{
  return self->_session;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)isPaired
{
  return self->_paired;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (BOOL)isReady
{
  return self->_ready;
}

- (void)setReady:(BOOL)a3
{
  self->_ready = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong(&self->_messageReceivedHandler, 0);
  objc_storeStrong(&self->_pinPromptHandler, 0);
  objc_storeStrong(&self->_deviceSessionErrorHandler, 0);
  objc_storeStrong(&self->_deviceSessionReadyHandler, 0);
  objc_storeStrong(&self->_deviceSessionInvalidatedHandler, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
}

void __49__DMTCatalystSharingBackedDeviceSession_activate__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_21FD69000, a2, a3, "%{public}@ activated successfully", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __65__DMTCatalystSharingBackedDeviceSession_beginPairWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_21FD69000, a2, a3, "%{public}@ paired successfully", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __55__DMTCatalystSharingBackedDeviceSession_verifyPairing___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21FD69000, a2, OS_LOG_TYPE_ERROR, "Not already paired: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
