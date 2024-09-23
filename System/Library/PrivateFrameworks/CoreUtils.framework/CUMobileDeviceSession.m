@implementation CUMobileDeviceSession

- (CUMobileDeviceSession)init
{
  CUMobileDeviceSession *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CUMobileDeviceSession;
  v2 = -[CUMobileDeviceSession init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
  }
  return v2;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CUMobileDeviceSession_activate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CUMobileDeviceSession_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (**invalidationHandler)(void);
  id v8;
  id promptForPINHandler;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled
    && gLogCategory_CUMobileDeviceSession <= 50
    && (gLogCategory_CUMobileDeviceSession != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceSession, 0x32u)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUMobileDeviceSession, (uint64_t)"-[CUMobileDeviceSession _invalidated]", 0x32u, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v14);
  }
  if (!self->_mdRunLoopThread)
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      v8 = self->_invalidationHandler;
    }
    else
    {
      v8 = 0;
    }
    self->_invalidationHandler = 0;

    promptForPINHandler = self->_promptForPINHandler;
    self->_promptForPINHandler = 0;

    if (gLogCategory_CUMobileDeviceSession <= 30
      && (gLogCategory_CUMobileDeviceSession != -1
       || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceSession, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUMobileDeviceSession, (uint64_t)"-[CUMobileDeviceSession _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v10, v11, v12, v13, v15);
    }
  }
}

- (void)pairSetupWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CUMobileDeviceSession_pairSetupWithFlags_completion___block_invoke;
  block[3] = &unk_1E25DCD20;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_pairSetupWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CUMobileDeviceSession__pairSetupWithFlags_completion___block_invoke;
  block[3] = &unk_1E25DF300;
  v9 = v5;
  v7 = v5;
  dispatch_async(dispatchQueue, block);

}

- (void)pairSetupTryPIN:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__CUMobileDeviceSession_pairSetupTryPIN___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CUMobileDeviceSession_pairVerifyWithFlags_completion___block_invoke;
  block[3] = &unk_1E25DCD20;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CUMobileDeviceSession__pairVerifyWithFlags_completion___block_invoke;
  block[3] = &unk_1E25DF300;
  v9 = v5;
  v7 = v5;
  dispatch_async(dispatchQueue, block);

}

- (void)unpairWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__CUMobileDeviceSession_unpairWithCompletion___block_invoke;
  v7[3] = &unk_1E25DE600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_unpairWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CUMobileDeviceSession__unpairWithCompletion___block_invoke;
  block[3] = &unk_1E25DF300;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, block);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (CUMobileDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_peerDevice, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_mdRunLoopThread, 0);
}

void __47__CUMobileDeviceSession__unpairWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  const char **v7;
  const char *v8;
  int v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = *MEMORY[0x1E0CB2F90];
    v15 = *MEMORY[0x1E0CB2D50];
    v4 = (void *)MEMORY[0x1E0CB3940];
    if (MEMORY[0x1E0D1B9C8] && (v5 = CUErrorCodesTableGet(), (v6 = *(const char **)(v5 + 8)) != 0))
    {
      if (*(_DWORD *)v5 != -6735)
      {
        v7 = (const char **)(v5 + 24);
        v6 = "";
        while (1)
        {
          v8 = *v7;
          if (!*v7)
            break;
          v9 = *((_DWORD *)v7 - 2);
          v7 += 2;
          if (v9 == -6735)
          {
            v6 = v8;
            break;
          }
        }
      }
    }
    else
    {
      v6 = "";
    }
    objc_msgSend(v4, "stringWithUTF8String:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("?");
    if (v10)
      v12 = (const __CFString *)v10;
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -6735, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v14);

  }
}

void __46__CUMobileDeviceSession_unpairWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__CUMobileDeviceSession_unpairWithCompletion___block_invoke_2;
  v4[3] = &unk_1E25DE600;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "performBlock:", v4);

}

uint64_t __46__CUMobileDeviceSession_unpairWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unpairWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __57__CUMobileDeviceSession__pairVerifyWithFlags_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  const char **v7;
  const char *v8;
  int v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0CB2F90];
  v15 = *MEMORY[0x1E0CB2D50];
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (MEMORY[0x1E0D1B9C8] && (v5 = CUErrorCodesTableGet(), (v6 = *(const char **)(v5 + 8)) != 0))
  {
    if (*(_DWORD *)v5 != -6735)
    {
      v7 = (const char **)(v5 + 24);
      v6 = "";
      while (1)
      {
        v8 = *v7;
        if (!*v7)
          break;
        v9 = *((_DWORD *)v7 - 2);
        v7 += 2;
        if (v9 == -6735)
        {
          v6 = v8;
          break;
        }
      }
    }
  }
  else
  {
    v6 = "";
  }
  objc_msgSend(v4, "stringWithUTF8String:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = CFSTR("?");
  if (v10)
    v12 = (const __CFString *)v10;
  v16[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -6735, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v14);

}

void __56__CUMobileDeviceSession_pairVerifyWithFlags_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  int v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __56__CUMobileDeviceSession_pairVerifyWithFlags_completion___block_invoke_2;
  v4[3] = &unk_1E25DCD20;
  v4[1] = 3221225472;
  v4[4] = v1;
  v6 = *(_DWORD *)(a1 + 48);
  v5 = v2;
  objc_msgSend(v3, "performBlock:", v4);

}

uint64_t __56__CUMobileDeviceSession_pairVerifyWithFlags_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairVerifyWithFlags:completion:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __41__CUMobileDeviceSession_pairSetupTryPIN___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairSetupTryPIN:", *(_QWORD *)(a1 + 40));
}

void __56__CUMobileDeviceSession__pairSetupWithFlags_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  const char **v7;
  const char *v8;
  int v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0CB2F90];
  v15 = *MEMORY[0x1E0CB2D50];
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (MEMORY[0x1E0D1B9C8] && (v5 = CUErrorCodesTableGet(), (v6 = *(const char **)(v5 + 8)) != 0))
  {
    if (*(_DWORD *)v5 != -6735)
    {
      v7 = (const char **)(v5 + 24);
      v6 = "";
      while (1)
      {
        v8 = *v7;
        if (!*v7)
          break;
        v9 = *((_DWORD *)v7 - 2);
        v7 += 2;
        if (v9 == -6735)
        {
          v6 = v8;
          break;
        }
      }
    }
  }
  else
  {
    v6 = "";
  }
  objc_msgSend(v4, "stringWithUTF8String:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = CFSTR("?");
  if (v10)
    v12 = (const __CFString *)v10;
  v16[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -6735, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v14);

}

void __55__CUMobileDeviceSession_pairSetupWithFlags_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  int v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __55__CUMobileDeviceSession_pairSetupWithFlags_completion___block_invoke_2;
  v4[3] = &unk_1E25DCD20;
  v4[1] = 3221225472;
  v4[4] = v1;
  v6 = *(_DWORD *)(a1 + 48);
  v5 = v2;
  objc_msgSend(v3, "performBlock:", v4);

}

uint64_t __55__CUMobileDeviceSession_pairSetupWithFlags_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairSetupWithFlags:completion:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __35__CUMobileDeviceSession_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  id *v9;
  uint64_t v10;

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 9))
  {
    v8 = result;
    if (gLogCategory_CUMobileDeviceSession <= 30
      && (gLogCategory_CUMobileDeviceSession != -1
       || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceSession, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUMobileDeviceSession, (uint64_t)"-[CUMobileDeviceSession invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v10);
    }
    *(_BYTE *)(*(_QWORD *)(v8 + 32) + 9) = 1;
    v9 = *(id **)(v8 + 32);
    if (v9[2])
      return objc_msgSend(v9[2], "invalidate");
    else
      return objc_msgSend(v9, "_invalidated");
  }
  return result;
}

uint64_t __33__CUMobileDeviceSession_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CURunLoopThread *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[4];
  uint64_t v16;

  if (gLogCategory_CUMobileDeviceSession <= 30
    && (gLogCategory_CUMobileDeviceSession != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceSession, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUMobileDeviceSession, (uint64_t)"-[CUMobileDeviceSession activate]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v14);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  v9 = objc_alloc_init(CURunLoopThread);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDispatchQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend((id)objc_opt_class(), "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setLabel:", v12);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __33__CUMobileDeviceSession_activate__block_invoke_2;
  v15[3] = &unk_1E25DF2A0;
  v16 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v16 + 16), "setInvalidationHandler:", v15);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "activate");
}

uint64_t __33__CUMobileDeviceSession_activate__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

@end
