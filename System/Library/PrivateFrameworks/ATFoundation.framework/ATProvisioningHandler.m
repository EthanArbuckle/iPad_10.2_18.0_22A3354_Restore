@implementation ATProvisioningHandler

- (id)initAsEndpointType:(int)a3
{
  ATProvisioningHandler *v4;
  ATProvisioningHandler *v5;
  NSString *expectedRequestCommand;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATProvisioningHandler;
  v4 = -[ATProvisioningHandler init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_endpointType = a3;
    expectedRequestCommand = v4->_expectedRequestCommand;
    v4->_expectedRequestCommand = (NSString *)CFSTR("ProvisioningRegisterEndpoint");

  }
  return v5;
}

- (void)messageLinkWasOpened:(id)a3
{
  id v4;
  int endpointType;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  endpointType = self->_endpointType;
  _ATLogCategoryFramework();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (endpointType == 1)
  {
    if (v7)
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1D19F1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ opened - starting provisioning", (uint8_t *)&v8, 0xCu);
    }

    -[ATProvisioningHandler _sendProvisioningRequest:OnMessageLink:](self, "_sendProvisioningRequest:OnMessageLink:", CFSTR("ProvisioningRegisterEndpoint"), v4);
  }
  else
  {
    if (v7)
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1D19F1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ opened - waiting for provisioning message from server", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  NSString *expectedRequestCommand;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  ATProvisioningHandler *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isInitialized") & 1) != 0
    || (objc_msgSend(v7, "command"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", self->_expectedRequestCommand),
        v8,
        (v9 & 1) == 0))
  {
    _ATLogCategoryFramework();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "command");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      expectedRequestCommand = self->_expectedRequestCommand;
      *(_DWORD *)buf = 138543874;
      v22 = v11;
      v23 = 2114;
      v24 = expectedRequestCommand;
      v25 = 1024;
      v26 = objc_msgSend(v6, "isInitialized");
      _os_log_impl(&dword_1D19F1000, v10, OS_LOG_TYPE_DEFAULT, "received unexpected provisioning request %{public}@. expected %{public}@, isInitialized=%d", buf, 0x1Cu);

    }
    objc_msgSend(v6, "close");
  }
  objc_msgSend(v7, "command");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __55__ATProvisioningHandler_messageLink_didReceiveRequest___block_invoke;
  v17[3] = &unk_1E928C388;
  v18 = v6;
  v19 = v7;
  v20 = self;
  v15 = v7;
  v16 = v6;
  -[ATProvisioningHandler _processProvisioningRequest:withParams:onMessageLink:withCompletion:](self, "_processProvisioningRequest:withParams:onMessageLink:withCompletion:", v13, v14, v16, v17);

}

- (void)_sendProvisioningRequest:(id)a3 OnMessageLink:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0CF76A0]);
  -[ATProvisioningHandler _paramsForRequest:](self, "_paramsForRequest:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithCommand:dataClass:parameters:", v6, CFSTR("Provisioning"), v9);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__ATProvisioningHandler__sendProvisioningRequest_OnMessageLink___block_invoke;
  v13[3] = &unk_1E928C3B0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v11, "sendRequest:withCompletion:", v10, v13);

}

- (void)_processProvisioningResponse:(id)a3 toCommand:(id)a4 onMessageLink:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ATProvisioningHandler *v15;
  id v16;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__ATProvisioningHandler__processProvisioningResponse_toCommand_onMessageLink___block_invoke;
  v13[3] = &unk_1E928C3D8;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  -[ATProvisioningHandler _processProvisioningResponse:withParams:onMessageLink:withCompletion:](self, "_processProvisioningResponse:withParams:onMessageLink:withCompletion:", v12, v10, v11, v13);

}

- (void)_processProvisioningRequest:(id)a3 withParams:(id)a4 onMessageLink:(id)a5 withCompletion:(id)a6
{
  -[ATProvisioningHandler doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
}

- (void)_processProvisioningResponse:(id)a3 withParams:(id)a4 onMessageLink:(id)a5 withCompletion:(id)a6
{
  -[ATProvisioningHandler doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
}

- (id)_paramsForRequest:(id)a3
{
  -[ATProvisioningHandler doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedRequestCommand, 0);
}

void __78__ATProvisioningHandler__processProvisioningResponse_toCommand_onMessageLink___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ATLogCategoryFramework();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 48);
      v10 = 138543874;
      v11 = v5;
      v12 = 2114;
      v13 = v6;
      v14 = 2114;
      v15 = v3;
      _os_log_impl(&dword_1D19F1000, v4, OS_LOG_TYPE_ERROR, "failed to process provisioning response to command %{public}@ on %{public}@ - closing. err=%{public}@", (uint8_t *)&v10, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 48), "close");
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ProvisioningRegisterEndpoint")))
    {
      v7 = *(void **)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      v9 = CFSTR("ProvisioningCreateSession");
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ProvisioningCreateSession")))
      {
        objc_msgSend(*(id *)(a1 + 48), "setInitialized:", 1);
        goto LABEL_11;
      }
      v7 = *(void **)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      v9 = CFSTR("ProvisioningBeginSession");
    }
    objc_msgSend(v7, "_sendProvisioningRequest:OnMessageLink:", v9, v8);
  }
LABEL_11:

}

void __64__ATProvisioningHandler__sendProvisioningRequest_OnMessageLink___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "isPartial") & 1) == 0)
  {
    if (v6)
    {
      _ATLogCategoryFramework();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 48);
        v9 = 138543618;
        v10 = v8;
        v11 = 2114;
        v12 = v6;
        _os_log_impl(&dword_1D19F1000, v7, OS_LOG_TYPE_ERROR, "failed to send provisioning request on %{public}@ - closing. err=%{public}@", (uint8_t *)&v9, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 48), "close");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_processProvisioningResponse:toCommand:onMessageLink:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
  }

}

void __55__ATProvisioningHandler_messageLink_didReceiveRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _ATLogCategoryFramework();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v25 = v8;
    _os_log_impl(&dword_1D19F1000, v7, OS_LOG_TYPE_DEFAULT, "messageLink -> %{public}@", buf, 0xCu);
  }

  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "command");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("ProvisioningRegisterEndpoint"));

    if (v11)
    {
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *(void **)(v12 + 16);
      v14 = CFSTR("ProvisioningCreateSession");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "command");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("ProvisioningCreateSession"));

      if (!v16)
      {
LABEL_12:
        v17 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "responseWithError:parameters:", 0, v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __55__ATProvisioningHandler_messageLink_didReceiveRequest___block_invoke_5;
        v21[3] = &unk_1E928C360;
        v22 = *(id *)(a1 + 32);
        v23 = *(id *)(a1 + 40);
        objc_msgSend(v17, "sendResponse:withCompletion:", v18, v21);

        goto LABEL_13;
      }
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *(void **)(v12 + 16);
      v14 = CFSTR("ProvisioningBeginSession");
    }
    *(_QWORD *)(v12 + 16) = v14;

    goto LABEL_12;
  }
  _ATLogCategoryFramework();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v5;
    _os_log_impl(&dword_1D19F1000, v9, OS_LOG_TYPE_ERROR, "failed to provision link - closing. err=%{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "close");
LABEL_13:
  _ATLogCategoryFramework();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v25 = v20;
    _os_log_impl(&dword_1D19F1000, v19, OS_LOG_TYPE_DEFAULT, "messageLink -> %{public}@", buf, 0xCu);
  }

}

void __55__ATProvisioningHandler_messageLink_didReceiveRequest___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ATLogCategoryFramework();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = v3;
      _os_log_impl(&dword_1D19F1000, v4, OS_LOG_TYPE_ERROR, "error sending response to provision message link. err=%{public}@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "close");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "command");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ProvisioningRegisterEndpoint"));

    if ((v6 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "command");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("ProvisioningBeginSession"));

      if (v8)
        objc_msgSend(*(id *)(a1 + 32), "setInitialized:", 1);
    }
  }

}

@end
