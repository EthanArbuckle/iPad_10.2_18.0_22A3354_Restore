@implementation C2NetworkingDelegateURLSessionDataTask

+ (unint64_t)nextTaskIdentifier
{
  void *v2;
  unint64_t v3;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  v3 = nextTaskIdentifier_nextTaskIdentifier++;
  objc_sync_exit(v2);

  return v3;
}

- (C2NetworkingDelegateURLSessionDataTask)init
{
  C2NetworkingDelegateURLSessionDataTask *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *clientQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)C2NetworkingDelegateURLSessionDataTask;
  v2 = -[C2NetworkingDelegateURLSessionDataTask init](&v7, sel_init);
  if (v2)
  {
    v2->_taskIdentifier = objc_msgSend((id)objc_opt_class(), "nextTaskIdentifier");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.C2NetworkingDelegateURLSessionDataTask", v3);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)setupRequest:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  void (**v16)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  -[C2NetworkingDelegateURLSessionDataTask clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[C2NetworkingDelegateURLSessionDataTask syntheticError](self, "syntheticError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v4[2](v4, 0);
  }
  else
  {
    -[C2NetworkingDelegateURLSessionDataTask session](self, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "networkingDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[C2NetworkingDelegateURLSessionDataTask session](self, "session");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "networkingDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2NetworkingDelegateURLSessionDataTask currentRequest](self, "currentRequest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2NetworkingDelegateURLSessionDataTask session](self, "session");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __55__C2NetworkingDelegateURLSessionDataTask_setupRequest___block_invoke;
      v15[3] = &unk_1E9898AF8;
      v15[4] = self;
      v16 = v4;
      objc_msgSend(v11, "willHandleRequest:configuration:completionHandler:", v12, v14, v15);

    }
    else
    {
      -[C2NetworkingDelegateURLSessionDataTask willSendRequest:](self, "willSendRequest:", v4);
    }
  }

}

void __55__C2NetworkingDelegateURLSessionDataTask_setupRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v5 = a2;
  v6 = a3;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setSyntheticError:", v5);
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setTimingData:", v6);
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__C2NetworkingDelegateURLSessionDataTask_setupRequest___block_invoke_2;
  v9[3] = &unk_1E9898AD0;
  v8 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  dispatch_async(v7, v9);

}

uint64_t __55__C2NetworkingDelegateURLSessionDataTask_setupRequest___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "willSendRequest:", *(_QWORD *)(a1 + 40));
}

- (void)willSendRequest:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  void (**v10)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  -[C2NetworkingDelegateURLSessionDataTask clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[C2NetworkingDelegateURLSessionDataTask syntheticError](self, "syntheticError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v4[2](v4, 0);
  }
  else
  {
    -[C2NetworkingDelegateURLSessionDataTask session](self, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegateQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__C2NetworkingDelegateURLSessionDataTask_willSendRequest___block_invoke;
    v9[3] = &unk_1E9898AD0;
    v9[4] = self;
    v10 = v4;
    objc_msgSend(v8, "addOperationWithBlock:", v9);

  }
}

void __58__C2NetworkingDelegateURLSessionDataTask_willSendRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "currentRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__C2NetworkingDelegateURLSessionDataTask_willSendRequest___block_invoke_2;
  v8[3] = &unk_1E9898B48;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v3, "URLSession:task:_willSendRequestForEstablishedConnection:completionHandler:", v4, v5, v6, v8);

}

void __58__C2NetworkingDelegateURLSessionDataTask_willSendRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__C2NetworkingDelegateURLSessionDataTask_willSendRequest___block_invoke_3;
  v7[3] = &unk_1E9898B20;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __58__C2NetworkingDelegateURLSessionDataTask_willSendRequest___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_drainInputStream:(id)a3 sinkData:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  void (**v22)(id, _QWORD);
  _QWORD v23[5];
  id v24;
  id v25;
  void (**v26)(id, _QWORD);
  uint64_t v27;
  _BYTE v28[32768];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  -[C2NetworkingDelegateURLSessionDataTask clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[C2NetworkingDelegateURLSessionDataTask syntheticError](self, "syntheticError");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v10[2](v10, 0);
  }
  else
  {
    bzero(v28, 0x8000uLL);
    v13 = objc_msgSend(v8, "read:maxLength:", v28, 0x8000);
    if (v13 < 1)
    {
      objc_msgSend(v8, "close");
      -[C2NetworkingDelegateURLSessionDataTask setCountOfBytesSent:](self, "setCountOfBytesSent:", objc_msgSend(v9, "length"));
      -[C2NetworkingDelegateURLSessionDataTask clientQueue](self, "clientQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __87__C2NetworkingDelegateURLSessionDataTask__drainInputStream_sinkData_completionHandler___block_invoke_3;
      v20[3] = &unk_1E9898B20;
      v22 = v10;
      v21 = v9;
      dispatch_async(v19, v20);

      v18 = v22;
    }
    else
    {
      v14 = v13;
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v28, v13);
      objc_msgSend(v9, "appendData:", v15);

      -[C2NetworkingDelegateURLSessionDataTask session](self, "session");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "delegateQueue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __87__C2NetworkingDelegateURLSessionDataTask__drainInputStream_sinkData_completionHandler___block_invoke;
      v23[3] = &unk_1E9898B98;
      v23[4] = self;
      v27 = v14;
      v24 = v9;
      v25 = v8;
      v26 = v10;
      objc_msgSend(v17, "addOperationWithBlock:", v23);

      v18 = v24;
    }

  }
}

void __87__C2NetworkingDelegateURLSessionDataTask__drainInputStream_sinkData_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = objc_msgSend(*(id *)(a1 + 40), "length");
  objc_msgSend(v3, "URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:", v4, v6, v5, v7, *MEMORY[0x1E0CB3350]);

  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__C2NetworkingDelegateURLSessionDataTask__drainInputStream_sinkData_completionHandler___block_invoke_2;
  v9[3] = &unk_1E9898B70;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 56);
  dispatch_async(v8, v9);

}

uint64_t __87__C2NetworkingDelegateURLSessionDataTask__drainInputStream_sinkData_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_drainInputStream:sinkData:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __87__C2NetworkingDelegateURLSessionDataTask__drainInputStream_sinkData_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setupRequestBodyForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  void (**v19)(id, _QWORD);
  _QWORD block[5];
  id v21;
  void (**v22)(id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[C2NetworkingDelegateURLSessionDataTask clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[C2NetworkingDelegateURLSessionDataTask syntheticError](self, "syntheticError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v7[2](v7, 0);
  }
  else
  {
    objc_msgSend(v6, "HTTPBodyStream");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "open");
      -[C2NetworkingDelegateURLSessionDataTask clientQueue](self, "clientQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __87__C2NetworkingDelegateURLSessionDataTask_setupRequestBodyForRequest_completionHandler___block_invoke;
      block[3] = &unk_1E9898BC0;
      block[4] = self;
      v21 = v11;
      v22 = v7;
      dispatch_async(v12, block);

    }
    else
    {
      objc_msgSend(v6, "HTTPBody");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[C2NetworkingDelegateURLSessionDataTask session](self, "session");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "delegateQueue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __87__C2NetworkingDelegateURLSessionDataTask_setupRequestBodyForRequest_completionHandler___block_invoke_2;
        v16[3] = &unk_1E9898BE8;
        v16[4] = self;
        v17 = v13;
        v19 = v7;
        v18 = v6;
        objc_msgSend(v15, "addOperationWithBlock:", v16);

      }
      else
      {
        v7[2](v7, 0);
      }

    }
  }

}

void __87__C2NetworkingDelegateURLSessionDataTask_setupRequestBodyForRequest_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = (id)objc_opt_new();
  objc_msgSend(v2, "_drainInputStream:sinkData:completionHandler:", v3, v4, a1[6]);

}

void __87__C2NetworkingDelegateURLSessionDataTask_setupRequestBodyForRequest_completionHandler___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(a1[4], "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:", v4, a1[4], objc_msgSend(a1[5], "length"), objc_msgSend(a1[5], "length"), objc_msgSend(a1[5], "length"));

  objc_msgSend(a1[4], "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__C2NetworkingDelegateURLSessionDataTask_setupRequestBodyForRequest_completionHandler___block_invoke_3;
  v6[3] = &unk_1E9898B20;
  v8 = a1[7];
  v7 = a1[6];
  dispatch_async(v5, v6);

}

void __87__C2NetworkingDelegateURLSessionDataTask_setupRequestBodyForRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "HTTPBody");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)processRequest:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  void (**v26)(id, _QWORD);
  _QWORD v27[5];
  void (**v28)(id, _QWORD);
  _QWORD v29[5];
  void (**v30)(id, _QWORD);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  -[C2NetworkingDelegateURLSessionDataTask clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[C2NetworkingDelegateURLSessionDataTask syntheticError](self, "syntheticError");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v10[2](v10, 0);
  }
  else
  {
    -[C2NetworkingDelegateURLSessionDataTask session](self, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "networkingDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    -[C2NetworkingDelegateURLSessionDataTask session](self, "session");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "networkingDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v15 & 1) != 0)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke;
      v29[3] = &unk_1E9898C38;
      v29[4] = self;
      v30 = v10;
      objc_msgSend(v17, "processRequest:callback:", v8, v29);

      v18 = v30;
    }
    else
    {
      v19 = objc_opt_respondsToSelector();

      -[C2NetworkingDelegateURLSessionDataTask session](self, "session");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "networkingDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v19 & 1) != 0)
      {
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_3;
        v27[3] = &unk_1E9898C60;
        v27[4] = self;
        v28 = v10;
        objc_msgSend(v21, "handleRequest:completionHandler:", v8, v27);

        v18 = v28;
      }
      else
      {
        v22 = objc_opt_respondsToSelector();

        if ((v22 & 1) == 0)
          -[C2NetworkingDelegateURLSessionDataTask processRequest:configuration:completionHandler:].cold.1(self);
        -[C2NetworkingDelegateURLSessionDataTask session](self, "session");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "networkingDelegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_5;
        v25[3] = &unk_1E9898C60;
        v25[4] = self;
        v26 = v10;
        objc_msgSend(v24, "handleRequest:configuration:completionHandler:", v8, v9, v25);

        v18 = v26;
      }
    }

  }
}

void __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_2;
  block[3] = &unk_1E9898C10;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  id v2;

  v1 = a1[6];
  +[C2NetworkingResponse responseWithURLResponse:body:](C2NetworkingResponse, "responseWithURLResponse:body:", a1[4], a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_4;
  v7[3] = &unk_1E9898B20;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_6;
  v7[3] = &unk_1E9898B20;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __89__C2NetworkingDelegateURLSessionDataTask_processRequest_configuration_completionHandler___block_invoke_7()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)qword_1ED4F5720;
  qword_1ED4F5720 = (uint64_t)v0;

}

- (void)handleResponse:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  void (**v14)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[C2NetworkingDelegateURLSessionDataTask clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[C2NetworkingDelegateURLSessionDataTask syntheticError](self, "syntheticError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v7[2](v7);
  }
  else
  {
    -[C2NetworkingDelegateURLSessionDataTask setResponse:](self, "setResponse:", v6);
    -[C2NetworkingDelegateURLSessionDataTask session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegateQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __75__C2NetworkingDelegateURLSessionDataTask_handleResponse_completionHandler___block_invoke;
    v12[3] = &unk_1E9898BC0;
    v12[4] = self;
    v13 = v6;
    v14 = v7;
    objc_msgSend(v11, "addOperationWithBlock:", v12);

  }
}

void __75__C2NetworkingDelegateURLSessionDataTask_handleResponse_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__C2NetworkingDelegateURLSessionDataTask_handleResponse_completionHandler___block_invoke_2;
  v7[3] = &unk_1E9898CB0;
  v7[4] = v5;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v3, "URLSession:dataTask:didReceiveResponse:completionHandler:", v4, v5, v6, v7);

}

void __75__C2NetworkingDelegateURLSessionDataTask_handleResponse_completionHandler___block_invoke_2(uint64_t a1, unint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD block[5];
  id v8;
  unint64_t v9;

  if (a2 >= 2)
    __75__C2NetworkingDelegateURLSessionDataTask_handleResponse_completionHandler___block_invoke_2_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__C2NetworkingDelegateURLSessionDataTask_handleResponse_completionHandler___block_invoke_3;
  block[3] = &unk_1E9898C88;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = a2;
  block[4] = v5;
  v8 = v6;
  dispatch_async(v4, block);

}

uint64_t __75__C2NetworkingDelegateURLSessionDataTask_handleResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  if (!*(_QWORD *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "cancel");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)streamResponseBody:(id)a3 offset:(unsigned int)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  C2NetworkingDelegateURLSessionDataTask *v22;
  void (**v23)(_QWORD);
  unsigned int v24;
  int v25;

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  -[C2NetworkingDelegateURLSessionDataTask clientQueue](self, "clientQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[C2NetworkingDelegateURLSessionDataTask syntheticError](self, "syntheticError");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v9[2](v9);
  }
  else
  {
    -[C2NetworkingDelegateURLSessionDataTask session](self, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "networkingDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[C2NetworkingDelegateURLSessionDataTask session](self, "session");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "networkingDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "responseBufferSize");

    }
    else
    {
      v17 = 0x8000;
    }
    -[C2NetworkingDelegateURLSessionDataTask session](self, "session");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "delegateQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __86__C2NetworkingDelegateURLSessionDataTask_streamResponseBody_offset_completionHandler___block_invoke;
    v20[3] = &unk_1E9898CD8;
    v24 = a4;
    v25 = v17;
    v21 = v8;
    v22 = self;
    v23 = v9;
    objc_msgSend(v19, "addOperationWithBlock:", v20);

  }
}

void __86__C2NetworkingDelegateURLSessionDataTask_streamResponseBody_offset_completionHandler___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  _QWORD block[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  int v14;
  int v15;

  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  v3 = *(_DWORD *)(a1 + 56);
  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "clientQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__C2NetworkingDelegateURLSessionDataTask_streamResponseBody_offset_completionHandler___block_invoke_4;
    block[3] = &unk_1E9898D00;
    v9 = *(id *)(a1 + 48);
    dispatch_async(v4, block);

    v5 = v9;
  }
  else
  {
    if ((v2 - v3) >= *(_DWORD *)(a1 + 60))
      v6 = *(_DWORD *)(a1 + 60);
    else
      v6 = v2 - v3;
    objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __86__C2NetworkingDelegateURLSessionDataTask_streamResponseBody_offset_completionHandler___block_invoke_2;
    v10[3] = &unk_1E9898CD8;
    v7 = *(void **)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v12 = v7;
    v14 = *(_DWORD *)(a1 + 56);
    v15 = v6;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v11, "__didReceiveData:completionHandler:", v5, v10);

  }
}

void __86__C2NetworkingDelegateURLSessionDataTask_streamResponseBody_offset_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__C2NetworkingDelegateURLSessionDataTask_streamResponseBody_offset_completionHandler___block_invoke_3;
  v4[3] = &unk_1E9898CD8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v7 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, v4);

}

uint64_t __86__C2NetworkingDelegateURLSessionDataTask_streamResponseBody_offset_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamResponseBody:offset:completionHandler:", *(_QWORD *)(a1 + 40), (*(_DWORD *)(a1 + 60) + *(_DWORD *)(a1 + 56)), *(_QWORD *)(a1 + 48));
}

uint64_t __86__C2NetworkingDelegateURLSessionDataTask_streamResponseBody_offset_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)__didReceiveData:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a4;
  v6 = a3;
  -[C2NetworkingDelegateURLSessionDataTask session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sessionDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "URLSession:dataTask:_didReceiveData:completionHandler:", v7, self, v6, v9);

  }
  else
  {
    objc_msgSend(v8, "URLSession:dataTask:didReceiveData:", v7, self, v6);

    v9[2]();
  }

}

- (void)handleCompletion
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  -[C2NetworkingDelegateURLSessionDataTask clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[C2NetworkingDelegateURLSessionDataTask syntheticError](self, "syntheticError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2NetworkingDelegateURLSessionDataTask session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__C2NetworkingDelegateURLSessionDataTask_handleCompletion__block_invoke;
  v8[3] = &unk_1E9898D28;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "addOperationWithBlock:", v8);

}

void __58__C2NetworkingDelegateURLSessionDataTask_handleCompletion__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLSession:task:didCompleteWithError:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)resume
{
  NSObject *clientQueue;
  _QWORD block[5];

  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke;
  block[3] = &unk_1E98986D0;
  block[4] = self;
  dispatch_async(clientQueue, block);
}

uint64_t __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_2;
  v3[3] = &unk_1E9898DA0;
  v3[4] = v1;
  return objc_msgSend(v1, "setupRequest:", v3);
}

void __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  void *v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_3;
  v6[3] = &unk_1E9898D78;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  objc_msgSend(v4, "setupRequestBodyForRequest:completionHandler:", v5, v6);

}

void __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v5, "setHTTPBody:", v4);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v6, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_4;
  v9[3] = &unk_1E9898D50;
  v9[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "processRequest:configuration:completionHandler:", v5, v8, v9);

}

void __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "urlResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_5;
  v7[3] = &unk_1E9898D28;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "handleResponse:completionHandler:", v5, v7);

}

void __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "body");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_6;
  v4[3] = &unk_1E98986D0;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "streamResponseBody:offset:completionHandler:", v3, 0, v4);

}

uint64_t __48__C2NetworkingDelegateURLSessionDataTask_resume__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCompletion");
}

- (void)cancel
{
  void *v3;
  id v4;

  -[C2NetworkingDelegateURLSessionDataTask syntheticError](self, "syntheticError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("C2NetworkingDelegateURLSessionErrorDomain"), -1, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[C2NetworkingDelegateURLSessionDataTask setSyntheticError:](self, "setSyntheticError:", v4);

  }
}

- (unint64_t)taskIdentifier
{
  return self->_taskIdentifier;
}

- (NSString)taskDescription
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTaskDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (int64_t)countOfBytesReceived
{
  return self->_countOfBytesReceived;
}

- (void)setCountOfBytesReceived:(int64_t)a3
{
  self->_countOfBytesReceived = a3;
}

- (int64_t)countOfBytesSent
{
  return self->_countOfBytesSent;
}

- (void)setCountOfBytesSent:(int64_t)a3
{
  self->_countOfBytesSent = a3;
}

- (int64_t)countOfBytesExpectedToSend
{
  return self->_countOfBytesExpectedToSend;
}

- (void)setCountOfBytesExpectedToSend:(int64_t)a3
{
  self->_countOfBytesExpectedToSend = a3;
}

- (int64_t)countOfBytesExpectedToReceive
{
  return self->_countOfBytesExpectedToReceive;
}

- (void)setCountOfBytesExpectedToReceive:(int64_t)a3
{
  self->_countOfBytesExpectedToReceive = a3;
}

- (int64_t)countOfBytesClientExpectsToSend
{
  return self->_countOfBytesClientExpectsToSend;
}

- (void)setCountOfBytesClientExpectsToSend:(int64_t)a3
{
  self->_countOfBytesClientExpectsToSend = a3;
}

- (int64_t)countOfBytesClientExpectsToReceive
{
  return self->_countOfBytesClientExpectsToReceive;
}

- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3
{
  self->_countOfBytesClientExpectsToReceive = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSURLRequest)originalRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOriginalRequest:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSURLRequest)currentRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCurrentRequest:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 96, 1);
}

- (void)setResponse:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (C2RequestOptions)c2RequestOptions
{
  return self->_c2RequestOptions;
}

- (void)setC2RequestOptions:(id)a3
{
  objc_storeStrong((id *)&self->_c2RequestOptions, a3);
}

- (NSError)syntheticError
{
  return (NSError *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSyntheticError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSDictionary)timingData
{
  return self->_timingData;
}

- (void)setTimingData:(id)a3
{
  objc_storeStrong((id *)&self->_timingData, a3);
}

- (C2NetworkingDelegateURLSession)session
{
  return (C2NetworkingDelegateURLSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (double)_timeoutIntervalForResource
{
  return self->__timeoutIntervalForResource;
}

- (void)set_timeoutIntervalForResource:(double)a3
{
  self->__timeoutIntervalForResource = a3;
}

- (NSURLSessionAppleIDContext)_appleIDContext
{
  return (NSURLSessionAppleIDContext *)objc_getProperty(self, a2, 144, 1);
}

- (void)_setAppleIDContext:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->__appleIDContext, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_timingData, 0);
  objc_storeStrong((id *)&self->_syntheticError, 0);
  objc_storeStrong((id *)&self->_c2RequestOptions, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_storeStrong((id *)&self->_taskDescription, 0);
}

- (void)processRequest:(void *)a1 configuration:completionHandler:.cold.1(void *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (_MergedGlobals_0 != -1)
    dispatch_once(&_MergedGlobals_0, &__block_literal_global_5);
  v2 = (void *)qword_1ED4F5720;
  if (os_log_type_enabled((os_log_t)qword_1ED4F5720, OS_LOG_TYPE_ERROR))
  {
    v3 = v2;
    objc_msgSend(a1, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "networkingDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = a1;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1D4DC3000, v3, OS_LOG_TYPE_ERROR, "Unable to identify appropriate selector on network delegate. self=%@, session=%@, networkingDelegate=%@", (uint8_t *)&v7, 0x20u);

  }
  __assert_rtn("-[C2NetworkingDelegateURLSessionDataTask processRequest:configuration:completionHandler:]", "C2NetworkingDelegateURLSession.m", 209, "false");
}

void __75__C2NetworkingDelegateURLSessionDataTask_handleResponse_completionHandler___block_invoke_2_cold_1()
{
  __assert_rtn("-[C2NetworkingDelegateURLSessionDataTask handleResponse:completionHandler:]_block_invoke_2", "C2NetworkingDelegateURLSession.m", 222, "responseDisposition == NSURLSessionResponseAllow || responseDisposition == NSURLSessionResponseCancel");
}

@end
