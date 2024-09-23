@implementation CATDeviceSessionBackedDevicePairingTerminal

- (CATDeviceSessionBackedDevicePairingTerminal)initWithDeviceSession:(id)a3
{
  id v5;
  CATDeviceSessionBackedDevicePairingTerminal *v6;
  CATDeviceSessionBackedDevicePairingTerminal *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATDeviceSessionBackedDevicePairingTerminal;
  v6 = -[CATDeviceSessionBackedDevicePairingTerminal init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->mDeviceSession, a3);

  return v7;
}

- (CATSharingDevice)device
{
  return (CATSharingDevice *)-[CATSharingDeviceSession remoteDevice](self->mDeviceSession, "remoteDevice");
}

- (void)verifyPairingAndFetchStableIdentifierWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  _QWORD block[4];
  id v14;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __99__CATDeviceSessionBackedDevicePairingTerminal_verifyPairingAndFetchStableIdentifierWithCompletion___block_invoke;
  v9[3] = &unk_24C1C5F10;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  v7 = v9;
  CATGetCatalystQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_24C1C5998;
  v14 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __99__CATDeviceSessionBackedDevicePairingTerminal_verifyPairingAndFetchStableIdentifierWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_verifyPairingAndFetchStableIdentifierWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)beginPairing:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __75__CATDeviceSessionBackedDevicePairingTerminal_beginPairing_withCompletion___block_invoke;
  v13[3] = &unk_24C1C5F38;
  objc_copyWeak(&v16, &location);
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v11 = v13;
  CATGetCatalystQueue();
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_24C1C5998;
  v19 = v11;
  dispatch_async(v12, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __75__CATDeviceSessionBackedDevicePairingTerminal_beginPairing_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_beginPairing:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)tryPIN:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  _QWORD block[4];
  id v14;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__CATDeviceSessionBackedDevicePairingTerminal_tryPIN___block_invoke;
  v9[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  v7 = v9;
  CATGetCatalystQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_24C1C5998;
  v14 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __54__CATDeviceSessionBackedDevicePairingTerminal_tryPIN___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_tryPIN:", *(_QWORD *)(a1 + 32));

}

- (void)invalidate
{
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;
  _QWORD block[4];
  id v9;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x24BDAC760];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__CATDeviceSessionBackedDevicePairingTerminal_invalidate__block_invoke;
  v5[3] = &unk_24C1C58B0;
  objc_copyWeak(&v6, &location);
  v3 = v5;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_24C1C5998;
  v9 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __57__CATDeviceSessionBackedDevicePairingTerminal_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidate");

}

- (void)_verifyPairingAndFetchStableIdentifierWithCompletion:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id mVerifyPairingCompletion;
  void (**v9)(id, void *, _QWORD);

  v9 = (void (**)(id, void *, _QWORD))a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  if (-[CATDeviceSessionBackedDevicePairingTerminal isInvalidated](self, "isInvalidated"))
  {
    v5 = 706;
  }
  else
  {
    if (!self->mVerifyPairingCompletion)
    {
      v7 = (void *)MEMORY[0x20BD10A78](v9);
      mVerifyPairingCompletion = self->mVerifyPairingCompletion;
      self->mVerifyPairingCompletion = v7;

      -[CATDeviceSessionBackedDevicePairingTerminal addSessionHandlers](self, "addSessionHandlers");
      -[CATSharingDeviceSession activate](self->mDeviceSession, "activate");
      goto LABEL_7;
    }
    v5 = 707;
  }
  CATErrorWithCodeAndUserInfo(v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v6, 0);

LABEL_7:
}

- (void)_beginPairing:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id mBeginPairingCompletion;
  void *v13;
  id mPINPromptHandler;
  CATSharingDeviceSession *mDeviceSession;
  _QWORD v16[4];
  id v17;
  id location;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  CATGetCatalystQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v8);

  if (-[CATDeviceSessionBackedDevicePairingTerminal isInvalidated](self, "isInvalidated"))
  {
    v9 = 706;
  }
  else if (self->mVerifyPairingCompletion)
  {
    v9 = 707;
  }
  else if ((-[CATSharingDeviceSession isReady](self->mDeviceSession, "isReady") & 1) != 0)
  {
    if (!self->mBeginPairingCompletion)
    {
      v11 = (void *)MEMORY[0x20BD10A78](v7);
      mBeginPairingCompletion = self->mBeginPairingCompletion;
      self->mBeginPairingCompletion = v11;

      v13 = (void *)MEMORY[0x20BD10A78](v6);
      mPINPromptHandler = self->mPINPromptHandler;
      self->mPINPromptHandler = v13;

      objc_initWeak(&location, self);
      mDeviceSession = self->mDeviceSession;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __76__CATDeviceSessionBackedDevicePairingTerminal__beginPairing_withCompletion___block_invoke;
      v16[3] = &unk_24C1C5F60;
      objc_copyWeak(&v17, &location);
      -[CATSharingDeviceSession beginPairWithCompletion:](mDeviceSession, "beginPairWithCompletion:", v16);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
      goto LABEL_10;
    }
    v9 = 709;
  }
  else
  {
    v9 = 708;
  }
  CATErrorWithCodeAndUserInfo(v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v10, 0);

LABEL_10:
}

void __76__CATDeviceSessionBackedDevicePairingTerminal__beginPairing_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD block[4];
  id v12;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__CATDeviceSessionBackedDevicePairingTerminal__beginPairing_withCompletion___block_invoke_2;
  v8[3] = &unk_24C1C5D58;
  v5 = v3;
  v9 = v5;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v6 = v8;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_24C1C5998;
  v12 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v10);
}

void __76__CATDeviceSessionBackedDevicePairingTerminal__beginPairing_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (v2 && objc_msgSend(v2, "failureType"))
  {
    objc_msgSend(*(id *)(a1 + 32), "underlyingError");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "pairingCompleteWithError:", v4);

}

- (void)_tryPIN:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  if (-[CATDeviceSessionBackedDevicePairingTerminal isInvalidated](self, "isInvalidated"))
  {
    _CATLogGeneral_3();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_209592000, v7, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    -[CATSharingDeviceSession tryPairingPIN:](self->mDeviceSession, "tryPairingPIN:", v5);
  }

}

- (void)_invalidate
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  if (-[CATDeviceSessionBackedDevicePairingTerminal isInvalidated](self, "isInvalidated"))
  {
    _CATLogGeneral_3();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v9 = v6;
      _os_log_impl(&dword_209592000, v5, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", buf, 0xCu);

    }
  }
  else
  {
    -[CATDeviceSessionBackedDevicePairingTerminal removeSessionHandlers](self, "removeSessionHandlers");
    -[CATSharingDeviceSession deactivate](self->mDeviceSession, "deactivate");
    CATErrorWithCodeAndUserInfo(705, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CATDeviceSessionBackedDevicePairingTerminal invalidateWithError:](self, "invalidateWithError:");

  }
}

- (void)addSessionHandlers
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke;
  v11[3] = &unk_24C1C5C28;
  objc_copyWeak(&v12, &location);
  -[CATSharingDeviceSession setDeviceSessionInvalidatedHandler:](self->mDeviceSession, "setDeviceSessionInvalidatedHandler:", v11);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_3;
  v9[3] = &unk_24C1C5C28;
  objc_copyWeak(&v10, &location);
  -[CATSharingDeviceSession setDeviceSessionErrorHandler:](self->mDeviceSession, "setDeviceSessionErrorHandler:", v9);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_5;
  v7[3] = &unk_24C1C58B0;
  objc_copyWeak(&v8, &location);
  -[CATSharingDeviceSession setDeviceSessionReadyHandler:](self->mDeviceSession, "setDeviceSessionReadyHandler:", v7);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_7;
  v5[3] = &unk_24C1C5FB0;
  objc_copyWeak(&v6, &location);
  -[CATSharingDeviceSession setPinPromptHandler:](self->mDeviceSession, "setPinPromptHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD block[4];
  id v12;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_2;
  v8[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = v3;
  v9 = v5;
  v6 = v8;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_24C1C5998;
  v12 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v10);
}

void __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "deviceSessionInvalidated:", *(_QWORD *)(a1 + 32));

}

void __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD block[4];
  id v12;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_4;
  v8[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = v3;
  v9 = v5;
  v6 = v8;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_24C1C5998;
  v12 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v10);
}

void __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "deviceSessionEncounteredError:", *(_QWORD *)(a1 + 32));

}

void __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  _QWORD block[4];
  id v7;

  v1 = MEMORY[0x24BDAC760];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_6;
  v4[3] = &unk_24C1C58B0;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v2 = v4;
  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = v1;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_24C1C5998;
  v7 = v2;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "deviceSessionReady");

}

void __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10[2];
  _QWORD block[4];
  id v12;

  v5 = a2;
  v6 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_8;
  v9[3] = &unk_24C1C5F88;
  objc_copyWeak(v10, (id *)(a1 + 32));
  v10[1] = a3;
  v7 = v9;
  CATGetCatalystQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_24C1C5998;
  v12 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(v10);
}

void __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sessionHasPromptedForPINWithWaitTime:", *(_QWORD *)(a1 + 40));

}

- (void)deviceSessionInvalidated:(id)a3
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  v7 = -[CATDeviceSessionBackedDevicePairingTerminal isInvalidated](self, "isInvalidated");
  _CATLogGeneral_3();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_209592000, v9, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", (uint8_t *)&v11, 0xCu);

    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[CATDeviceSessionBackedDevicePairingTerminal deviceSessionInvalidated:].cold.1((uint64_t)self, v9);

  -[CATDeviceSessionBackedDevicePairingTerminal removeSessionHandlers](self, "removeSessionHandlers");
  if (!v5)
  {
    CATErrorWithCodeAndUserInfo(1, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    -[CATDeviceSessionBackedDevicePairingTerminal invalidateWithError:](self, "invalidateWithError:", v9);
LABEL_9:

    goto LABEL_10;
  }
  -[CATDeviceSessionBackedDevicePairingTerminal invalidateWithError:](self, "invalidateWithError:", v5);
LABEL_10:

}

- (void)deviceSessionEncounteredError:(id)a3
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  v7 = -[CATDeviceSessionBackedDevicePairingTerminal isInvalidated](self, "isInvalidated");
  _CATLogGeneral_3();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_209592000, v9, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", (uint8_t *)&v11, 0xCu);

    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[CATDeviceSessionBackedDevicePairingTerminal deviceSessionEncounteredError:].cold.1((uint64_t)self, v5, v9);

  -[CATDeviceSessionBackedDevicePairingTerminal removeSessionHandlers](self, "removeSessionHandlers");
  if (!v5)
  {
    CATErrorWithCodeAndUserInfo(1, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    -[CATDeviceSessionBackedDevicePairingTerminal invalidateWithError:](self, "invalidateWithError:", v9);
LABEL_9:

    goto LABEL_10;
  }
  -[CATDeviceSessionBackedDevicePairingTerminal invalidateWithError:](self, "invalidateWithError:", v5);
LABEL_10:

}

- (void)deviceSessionReady
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  v5 = -[CATDeviceSessionBackedDevicePairingTerminal isInvalidated](self, "isInvalidated");
  _CATLogGeneral_3();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_209592000, v6, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", (uint8_t *)&v10, 0xCu);

    }
  }
  else
  {
    if (v7)
    {
      -[CATSharingDeviceSession description](self->mDeviceSession, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_209592000, v6, OS_LOG_TYPE_INFO, "Device Session %{public}@ ready", (uint8_t *)&v10, 0xCu);

    }
    -[CATDeviceSessionBackedDevicePairingTerminal verifyPairing](self, "verifyPairing");
  }
}

- (void)verifyPairing
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  CATSharingDeviceSession *mDeviceSession;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  if (-[CATDeviceSessionBackedDevicePairingTerminal isInvalidated](self, "isInvalidated"))
  {
    _CATLogGeneral_3();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v10 = v6;
      _os_log_impl(&dword_209592000, v5, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", buf, 0xCu);

    }
  }
  else
  {
    mDeviceSession = self->mDeviceSession;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60__CATDeviceSessionBackedDevicePairingTerminal_verifyPairing__block_invoke;
    v8[3] = &unk_24C1C5FD8;
    v8[4] = self;
    -[CATSharingDeviceSession verifyPairing:](mDeviceSession, "verifyPairing:", v8);
  }
}

void __60__CATDeviceSessionBackedDevicePairingTerminal_verifyPairing__block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[5];
  char v6;
  _QWORD block[4];
  id v8;

  v2 = MEMORY[0x24BDAC760];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__CATDeviceSessionBackedDevicePairingTerminal_verifyPairing__block_invoke_2;
  v5[3] = &unk_24C1C5D80;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = a2;
  v3 = v5;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_24C1C5998;
  v8 = v3;
  dispatch_async(v4, block);

}

uint64_t __60__CATDeviceSessionBackedDevicePairingTerminal_verifyPairing__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "verifyPairingFinished:", *(unsigned __int8 *)(a1 + 40));
}

- (void)verifyPairingFinished:(BOOL)a3
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id mVerifyPairingCompletion;
  void *v10;
  void (**v11)(id, void *, _QWORD);
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  if (-[CATDeviceSessionBackedDevicePairingTerminal isInvalidated](self, "isInvalidated"))
  {
    _CATLogGeneral_3();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_209592000, v7, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", buf, 0xCu);

    }
  }
  else if (a3)
  {
    -[CATDeviceSessionBackedDevicePairingTerminal fetchStableIdentifier](self, "fetchStableIdentifier");
  }
  else
  {
    v11 = (void (**)(id, void *, _QWORD))MEMORY[0x20BD10A78](self->mVerifyPairingCompletion);
    mVerifyPairingCompletion = self->mVerifyPairingCompletion;
    self->mVerifyPairingCompletion = 0;

    CATErrorWithCodeAndUserInfo(704, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v10, 0);

  }
}

- (void)sessionHasPromptedForPINWithWaitTime:(unint64_t)a3
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  if (-[CATDeviceSessionBackedDevicePairingTerminal isInvalidated](self, "isInvalidated"))
  {
    _CATLogGeneral_3();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl(&dword_209592000, v7, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", buf, 0xCu);

    }
  }
  else
  {
    v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD10A78](self->mPINPromptHandler);
    if (v9)
    {
      v10 = v9;
      v9[2](v9, a3);
      v9 = (void (**)(_QWORD, _QWORD))v10;
    }

  }
}

- (void)fetchStableIdentifier
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  _QWORD v10[5];
  __int128 buf;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  if (-[CATDeviceSessionBackedDevicePairingTerminal isInvalidated](self, "isInvalidated"))
  {
    _CATLogGeneral_3();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_209592000, v5, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", (uint8_t *)&buf, 0xCu);

    }
  }
  else
  {
    v7 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __68__CATDeviceSessionBackedDevicePairingTerminal_fetchStableIdentifier__block_invoke;
    v10[3] = &unk_24C1C5A60;
    v10[4] = self;
    v8 = v10;
    CATGetCatalystQueue();
    v9 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = v7;
    *((_QWORD *)&buf + 1) = 3221225472;
    v12 = __CATPerformBlock_block_invoke_8;
    v13 = &unk_24C1C5998;
    v14 = v8;
    dispatch_async(v9, &buf);

  }
}

uint64_t __68__CATDeviceSessionBackedDevicePairingTerminal_fetchStableIdentifier__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchStableIdentifierFinished:", 0);
}

- (void)fetchStableIdentifierFinished:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id mVerifyPairingCompletion;
  CATDeviceSessionBackedDevicePairingTerminal *v10;
  id v11;
  id mBeginPairingCompletion;
  id mPINPromptHandler;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  if (!-[CATDeviceSessionBackedDevicePairingTerminal isInvalidated](self, "isInvalidated"))
  {
    v15 = (id)MEMORY[0x20BD10A78](self->mVerifyPairingCompletion);
    v8 = (void *)MEMORY[0x20BD10A78](self->mBeginPairingCompletion);
    if (v15)
    {
      mVerifyPairingCompletion = self->mVerifyPairingCompletion;
      self->mVerifyPairingCompletion = 0;

      v10 = self;
      v11 = v15;
    }
    else
    {
      if (!v8)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATDeviceSessionBackedDevicePairingTerminal.m"), 349, CFSTR("Stable identifier was fetched, but no completions were set."));

        goto LABEL_10;
      }
      mBeginPairingCompletion = self->mBeginPairingCompletion;
      self->mBeginPairingCompletion = 0;

      mPINPromptHandler = self->mPINPromptHandler;
      self->mPINPromptHandler = 0;

      v10 = self;
      v11 = v8;
    }
    -[CATDeviceSessionBackedDevicePairingTerminal vendConnectionForCompletion:](v10, "vendConnectionForCompletion:", v11);
LABEL_10:

    return;
  }
  _CATLogGeneral_3();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v7;
    _os_log_impl(&dword_209592000, v6, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", buf, 0xCu);

  }
}

- (void)pairingCompleteWithError:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  if (-[CATDeviceSessionBackedDevicePairingTerminal isInvalidated](self, "isInvalidated"))
  {
    _CATLogGeneral_3();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_209592000, v6, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", (uint8_t *)&v8, 0xCu);

    }
  }
  else
  {
    -[CATDeviceSessionBackedDevicePairingTerminal fetchStableIdentifier](self, "fetchStableIdentifier");
  }
}

- (void)vendConnectionForCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  NSObject *v5;
  CATSharingDeviceSessionConnection *v6;
  CATSharingDeviceSession *mDeviceSession;
  void *v8;
  void *v9;
  CATSharingDeviceSessionConnection *v10;

  v4 = (void (**)(id, _QWORD, id))a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  -[CATDeviceSessionBackedDevicePairingTerminal removeSessionHandlers](self, "removeSessionHandlers");
  v6 = [CATSharingDeviceSessionConnection alloc];
  mDeviceSession = self->mDeviceSession;
  v8 = (void *)objc_opt_new();
  v10 = -[CATSharingDeviceSessionConnection initWithDeviceSession:timerSource:](v6, "initWithDeviceSession:timerSource:", mDeviceSession, v8);

  v4[2](v4, 0, v10);
  CATErrorWithCodeAndUserInfo(702, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATDeviceSessionBackedDevicePairingTerminal invalidateWithError:](self, "invalidateWithError:", v9);

}

- (void)invalidateWithError:(id)a3
{
  NSObject *v4;
  void (**mVerifyPairingCompletion)(id, id, _QWORD);
  void (**mBeginPairingCompletion)(id, id, _QWORD);
  id v7;

  v7 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  mVerifyPairingCompletion = (void (**)(id, id, _QWORD))self->mVerifyPairingCompletion;
  if (mVerifyPairingCompletion)
    mVerifyPairingCompletion[2](mVerifyPairingCompletion, v7, 0);
  mBeginPairingCompletion = (void (**)(id, id, _QWORD))self->mBeginPairingCompletion;
  if (mBeginPairingCompletion)
    mBeginPairingCompletion[2](mBeginPairingCompletion, v7, 0);
  -[CATDeviceSessionBackedDevicePairingTerminal setInvalidated:](self, "setInvalidated:", 1);

}

- (void)removeSessionHandlers
{
  NSObject *v3;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATSharingDeviceSession setDeviceSessionReadyHandler:](self->mDeviceSession, "setDeviceSessionReadyHandler:", 0);
  -[CATSharingDeviceSession setPinPromptHandler:](self->mDeviceSession, "setPinPromptHandler:", 0);
  -[CATSharingDeviceSession setDeviceSessionErrorHandler:](self->mDeviceSession, "setDeviceSessionErrorHandler:", 0);
  -[CATSharingDeviceSession setDeviceSessionInvalidatedHandler:](self->mDeviceSession, "setDeviceSessionInvalidatedHandler:", 0);
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mPINPromptHandler, 0);
  objc_storeStrong(&self->mBeginPairingCompletion, 0);
  objc_storeStrong(&self->mVerifyPairingCompletion, 0);
  objc_storeStrong((id *)&self->mDeviceSession, 0);
}

- (void)deviceSessionInvalidated:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 8), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_209592000, a2, OS_LOG_TYPE_ERROR, "Device Session %{public}@ invalidated", (uint8_t *)&v4, 0xCu);

}

- (void)deviceSessionEncounteredError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 8);
  objc_msgSend(a2, "verboseDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_209592000, a3, OS_LOG_TYPE_ERROR, "Device Session %{public}@ encountered error: %{public}@, invalidating", (uint8_t *)&v6, 0x16u);

}

@end
