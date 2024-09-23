@implementation NWURLSessionStreamTask

- (id)initWithLoader:(int)a3 identifier:(void *)a4 session:
{
  id v8;
  id *v9;
  id *v10;

  v8 = a2;
  if (a1)
  {
    v9 = -[NWURLSessionTask initWithRequest:identifier:session:](a1, 0, a3, a4);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong(v9 + 32, a2);
      *((_BYTE *)v10 + 461) = objc_msgSend(v8, "allowsWrite") ^ 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NWURLSessionStreamTask;
  if (-[NWURLSessionTask isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
}

- (id)response
{
  if (self)
    self = *(NWURLSessionStreamTask **)&self->_readClosed;
  return self;
}

- (void)startNextLoad:(BOOL)a3
{
  _BOOL4 v3;
  NWURLSessionTaskConfiguration *configuration;
  double v6;
  NWURLLoader *loader;

  v3 = a3;
  if (self)
  {
    nw_context_assert_queue(self->super._sessionContext);
    configuration = self->super._configuration;
    if (configuration)
    {
      if (-[NSURLRequest _explicitlySetTimeoutInterval](configuration->_request, "_explicitlySetTimeoutInterval"))-[NSURLRequest timeoutInterval](configuration->_request, "timeoutInterval");
      else
        -[NSURLSessionConfiguration timeoutIntervalForRequest](configuration->_configuration, "timeoutIntervalForRequest");
    }
    else
    {
      v6 = 0.0;
    }
    self->super._timeoutIntervalForRequest = v6;
    if (v3)
      goto LABEL_7;
  }
  else
  {
    nw_context_assert_queue(0);
    if (v3)
    {
LABEL_7:
      -[NWURLSessionTask startStartTimer]((uint64_t)self);
      -[NWURLSessionTask startResourceTimer](self);
    }
  }
  if (self)
    loader = self->super._loader;
  else
    loader = 0;
  -[NWURLLoader start:](loader, "start:", &__block_literal_global_462);
}

- (void)readDataOfMinLength:(unint64_t)a3 maxLength:(unint64_t)a4 timeout:(double)a5 completionHandler:(id)a6
{
  id v10;
  NSObject *queue;
  id v12;
  _QWORD block[5];
  id v14;
  double v15;
  unint64_t v16;
  unint64_t v17;

  v10 = a6;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke;
  block[3] = &unk_1E14A2FA8;
  block[4] = self;
  v14 = v10;
  v15 = a5;
  v16 = a3;
  v17 = a4;
  v12 = v10;
  dispatch_async(queue, block);

}

- (void)writeData:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  double v17;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke;
  v14[3] = &unk_1E14A5300;
  v15 = v8;
  v16 = v9;
  v17 = a4;
  v14[4] = self;
  v12 = v8;
  v13 = v10;
  dispatch_async(queue, v14);

}

- (void)closeWrite
{
  NSObject *queue;
  _QWORD block[5];

  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__NWURLSessionStreamTask_closeWrite__block_invoke;
  block[3] = &unk_1E14ACFD0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)closeRead
{
  NSObject *queue;
  _QWORD block[5];

  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__NWURLSessionStreamTask_closeRead__block_invoke;
  block[3] = &unk_1E14ACFD0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)startSecureConnection
{
  NSObject *queue;
  _QWORD block[5];

  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__NWURLSessionStreamTask_startSecureConnection__block_invoke;
  block[3] = &unk_1E14ACFD0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)loaderBetterPathAvailable
{
  uint64_t v3;
  const char *v4;
  NWURLSessionStreamTask *v5;
  void *v6;
  id v7;
  _QWORD *v8;
  id v9;
  id *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  NWURLSessionStreamTask *v14;

  if (self)
  {
    v3 = 240;
    if (!self->super._internalDelegateWrapper)
      v3 = 232;
    v10 = (id *)*(id *)((char *)&self->super.super.isa + v3);
    v5 = self;
    if (v10)
    {
      -[NWURLSessionDelegateWrapper delegateFor_betterRouteDiscovered](v10, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = v10[4];
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __66__NWURLSessionDelegateWrapper_betterRouteDiscoveredForStreamTask___block_invoke;
        v11[3] = &unk_1E14AAAA0;
        v12 = v6;
        v13 = v7;
        v14 = v5;
        v8 = v10[6];
        v9 = v7;
        -[NWURLSessionDelegateQueue runDelegateBlock:](v8, v11);

      }
    }

  }
  else
  {

  }
}

- (void)loaderConnectedWithHTTPConnectionMetadata:(id)a3 CNAMEChain:(id)a4 unlistedTracker:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *startTimeoutTimer;
  void *requestTimeoutTimer;
  void *resourceTimeoutTimer;
  id v14;

  v14 = a3;
  v8 = a4;
  v10 = a5;
  if (self)
  {
    startTimeoutTimer = self->super._startTimeoutTimer;
    if (startTimeoutTimer)
    {
      self->super._startTimeoutTimer = 0;
      nw_queue_cancel_source((uint64_t)startTimeoutTimer, v9);
    }
    requestTimeoutTimer = self->super._requestTimeoutTimer;
    if (requestTimeoutTimer)
    {
      self->super._requestTimeoutTimer = 0;
      nw_queue_cancel_source((uint64_t)requestTimeoutTimer, v9);
    }
    resourceTimeoutTimer = self->super._resourceTimeoutTimer;
    if (resourceTimeoutTimer)
    {
      self->super._resourceTimeoutTimer = 0;
      nw_queue_cancel_source((uint64_t)resourceTimeoutTimer, v9);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readClosed, 0);
}

void __47__NWURLSessionStreamTask_startSecureConnection__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NWConcrete_nw_protocol_options *options;
  NWConcrete_nw_protocol_options *v7;
  _QWORD *v8;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[32];
  v8 = v1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v8;
    if (v8)
    {
      *((_BYTE *)v8 + 10) = 1;
      if (*((_BYTE *)v8 + 8))
      {
        if (!*((_BYTE *)v8 + 11))
        {
          *((_BYTE *)v8 + 11) = 1;
          *((_BYTE *)v8 + 8) = 0;
          v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v4 = (void *)v8[7];
          v8[7] = v3;

          v5 = (void *)nw_protocol_boringssl_copy_definition();
          options = nw_protocol_create_options(v5);

          v7 = options;
          -[NWURLLoaderTCP configureTLS:]((uint64_t)v8, v7);

          nw_connection_append_and_start_application_protocol((void *)v8[8], v7);
          v2 = v8;
        }
      }
    }
    goto LABEL_8;
  }
  v2 = v8;
  if (!v8)
  {
LABEL_8:

    return;
  }
  _os_crash();
  __break(1u);
}

void __35__NWURLSessionStreamTask_closeRead__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    goto LABEL_9;
  if (*(_QWORD *)(v2 + 280) != 2 && !*(_BYTE *)(v2 + 460))
  {
    *(_BYTE *)(v2 + 460) = 1;
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v4 = 240;
      if (!*(_QWORD *)(v3 + 240))
        v4 = 232;
      v5 = *(id *)(v3 + v4);
      v6 = *(void **)(a1 + 32);
      goto LABEL_8;
    }
LABEL_9:
    v6 = 0;
    v5 = 0;
LABEL_8:
    -[NWURLSessionDelegateWrapper readClosedForStreamTask:]((uint64_t)v5, v6);

    -[NWURLSessionStreamTask checkForCompletion](*(_QWORD *)(a1 + 32));
  }
}

- (void)checkForCompletion
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;

  if (a1)
  {
    nw_context_assert_queue(*(void **)(a1 + 304));
    if (*(_QWORD *)(a1 + 280) == 1)
    {
      if (*(_BYTE *)(a1 + 460) && *(_BYTE *)(a1 + 461)
        || (objc_msgSend((id)a1, "error"), v2 = (void *)objc_claimAutoreleasedReturnValue(), v2, v2))
      {
        v3 = 240;
        if (!*(_QWORD *)(a1 + 240))
          v3 = 232;
        v4 = *(id *)(a1 + v3);
        objc_msgSend((id)a1, "error");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[NWURLSessionDelegateWrapper task:didCompleteWithError:metrics:]((uint64_t)v4, (void *)a1, v5, 0);

        -[NWURLSessionTask complete](a1);
      }
    }
  }
}

uint64_t __36__NWURLSessionStreamTask_closeWrite__block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v1 = *(_QWORD *)(result + 32);
  if (!v1)
  {
    v2 = 0;
    goto LABEL_5;
  }
  if (*(_QWORD *)(v1 + 280) != 2 && !*(_BYTE *)(v1 + 461))
  {
    v2 = *(void **)(v1 + 256);
LABEL_5:
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __36__NWURLSessionStreamTask_closeWrite__block_invoke_2;
    v3[3] = &unk_1E14A3330;
    v3[4] = v1;
    return objc_msgSend(v2, "writeData:complete:completionHandler:", 0, 1, v3);
  }
  return result;
}

void __36__NWURLSessionStreamTask_closeWrite__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  const char *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && (*(_BYTE *)(v2 + 461) = 1, (v3 = *(_QWORD *)(a1 + 32)) != 0))
  {
    v4 = 240;
    if (!*(_QWORD *)(v3 + 240))
      v4 = 232;
    v5 = (id *)*(id *)(v3 + v4);
    v7 = *(id *)(a1 + 32);
    if (v5)
    {
      -[NWURLSessionDelegateWrapper delegateFor_writeClosed](v5, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = v5[4];
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __56__NWURLSessionDelegateWrapper_writeClosedForStreamTask___block_invoke;
        v12[3] = &unk_1E14AAAA0;
        v13 = v8;
        v14 = v9;
        v15 = v7;
        v10 = v5[6];
        v11 = v9;
        -[NWURLSessionDelegateQueue runDelegateBlock:](v10, v12);

      }
    }
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }

  -[NWURLSessionStreamTask checkForCompletion](*(_QWORD *)(a1 + 32));
}

void __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  dispatch_block_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t v20;
  id v21;
  _QWORD block[5];
  _QWORD v23[5];
  NSObject *v24;
  _QWORD v25[5];
  NSObject *v26;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    -[NWURLSessionTask delegateWrapper](v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke_2;
    v25[3] = &unk_1E14ACE18;
    v15 = *(id *)(a1 + 48);
    v25[4] = *(_QWORD *)(a1 + 32);
    v26 = v15;
    -[NWURLSessionDelegateWrapper runDelegateBlock:]((uint64_t)v14, v25);

    v13 = v26;
    goto LABEL_11;
  }
  if (v3)
  {
    if (v3[35] == 2)
    {
      -[NWURLSessionTask delegateWrapper](v3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke_3;
      v23[3] = &unk_1E14ACE18;
      v17 = *(id *)(a1 + 48);
      v23[4] = *(_QWORD *)(a1 + 32);
      v24 = v17;
      -[NWURLSessionDelegateWrapper runDelegateBlock:]((uint64_t)v16, v23);

      v13 = v24;
      goto LABEL_11;
    }
    if (*(double *)(a1 + 56) <= 0.0)
    {
      v5 = 0;
      goto LABEL_9;
    }
    v4 = v3[28];
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v8 = 0;
    if (*(double *)(a1 + 56) <= 0.0)
      goto LABEL_10;
  }
  v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
  v6 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke_4;
  block[3] = &unk_1E14ACFD0;
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_source_set_event_handler(v5, v7);

  dispatch_activate(v5);
  v3 = *(_QWORD **)(a1 + 32);
  if (v3)
  {
LABEL_9:
    v8 = (void *)v3[32];
    goto LABEL_10;
  }
  v8 = 0;
LABEL_10:
  v9 = *(void **)(a1 + 40);
  v10 = v8;
  v11 = (void *)objc_msgSend(v9, "_createDispatchData");
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke_5;
  v18[3] = &unk_1E14A2FD0;
  v12 = *(_QWORD *)(a1 + 32);
  v19 = v5;
  v20 = v12;
  v21 = *(id *)(a1 + 48);
  v13 = v5;
  objc_msgSend(v10, "writeData:complete:completionHandler:", v11, 0, v18);

LABEL_11:
}

void __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  NWURLError *v3;
  id v4;
  id *v5;
  uint64_t v6;
  id v7;
  id v8;
  objc_super v9;

  v2 = *(id **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v3 = [NWURLError alloc];
    v4 = v2[32];
    v5 = v2;
    if (v3
      && (v6 = *MEMORY[0x1E0CB32E8],
          v9.receiver = v3,
          v9.super_class = (Class)NWURLError,
          (v7 = objc_msgSendSuper2(&v9, sel_initWithDomain_code_userInfo_, v6, -1005, 0)) != 0))
    {
      v8 = v7;
      objc_msgSend(v7, "fillErrorForLoader:andTask:", v4, v5);
    }
    else
    {
      v8 = 0;
    }

    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v8);
  }
  else
  {
    v8 = 0;
    (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, 0);
  }

}

void __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  id *v3;
  NWURLError *v4;
  id v5;
  id *v6;
  uint64_t v7;
  NWURLError *v8;
  const char *v9;
  void *v10;
  objc_super v11;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = *(id **)(a1 + 32);
    if (v3)
    {
      v4 = [NWURLError alloc];
      v5 = v3[32];
      v6 = v3;
      if (v4)
      {
        v7 = *MEMORY[0x1E0CB32E8];
        v11.receiver = v4;
        v11.super_class = (Class)NWURLError;
        v8 = (NWURLError *)objc_msgSendSuper2(&v11, sel_initWithDomain_code_userInfo_, v7, -1001, 0);
        v4 = v8;
        if (v8)
          -[NWURLError fillErrorForLoader:andTask:](v8, "fillErrorForLoader:andTask:", v5, v6);
      }

      v10 = *(void **)(a1 + 32);
      if (v10)
        objc_setProperty_atomic_copy(v10, v9, v4, 136);
    }
    else
    {
      v4 = 0;
    }

  }
  -[NWURLSessionStreamTask checkForCompletion](*(_QWORD *)(a1 + 32));
}

void __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD **v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
    dispatch_source_cancel(v4);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && !v5)
  {
    v11 = *(void **)(a1 + 40);
    if (v11)
    {
      objc_setProperty_atomic_copy(v11, v6, v3, 136);
      v7 = *(_QWORD *)(a1 + 40);
      if (v7)
        goto LABEL_6;
    }
LABEL_14:
    v9 = 0;
    goto LABEL_9;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (!v7)
    goto LABEL_14;
LABEL_6:
  v8 = 240;
  if (!*(_QWORD *)(v7 + 240))
    v8 = 232;
  v9 = (_QWORD **)*(id *)(v7 + v8);
LABEL_9:
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke_6;
  v12[3] = &unk_1E14ACE18;
  v10 = *(id *)(a1 + 48);
  v12[4] = *(_QWORD *)(a1 + 40);
  v13 = v10;
  if (v9)
    -[NWURLSessionDelegateQueue runDelegateBlock:](v9[6], v12);

  -[NWURLSessionStreamTask checkForCompletion](*(_QWORD *)(a1 + 40));
}

void __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD **v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  dispatch_block_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t v19;
  id v20;
  _QWORD block[5];
  _QWORD v22[5];
  NSObject *v23;
  _QWORD v24[5];
  NSObject *v25;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_QWORD *)(v2 + 280) == 2)
    goto LABEL_5;
  objc_msgSend((id)v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = *(_QWORD *)(a1 + 32);
  if (!v3)
  {
    if (v2)
    {
      if (*(_BYTE *)(v2 + 460))
      {
        -[NWURLSessionTask delegateWrapper]((_QWORD *)v2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_3;
        v22[3] = &unk_1E14ACE18;
        v16 = *(id *)(a1 + 40);
        v22[4] = *(_QWORD *)(a1 + 32);
        v23 = v16;
        -[NWURLSessionDelegateWrapper runDelegateBlock:]((uint64_t)v15, v22);

        v7 = v23;
        goto LABEL_20;
      }
      if (*(double *)(a1 + 48) <= 0.0)
      {
        v9 = 0;
        goto LABEL_18;
      }
      v8 = *(NSObject **)(v2 + 224);
    }
    else
    {
      v8 = 0;
      v9 = 0;
      v12 = 0;
      if (*(double *)(a1 + 48) <= 0.0)
        goto LABEL_19;
    }
    v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v8);
    v10 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_4;
    block[3] = &unk_1E14ACFD0;
    block[4] = *(_QWORD *)(a1 + 32);
    v11 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_source_set_event_handler(v9, v11);

    dispatch_activate(v9);
    v2 = *(_QWORD *)(a1 + 32);
    if (!v2)
    {
      v12 = 0;
LABEL_19:
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(a1 + 64);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_5;
      v17[3] = &unk_1E14A2F80;
      v18 = v9;
      v19 = v2;
      v20 = *(id *)(a1 + 40);
      v7 = v9;
      objc_msgSend(v12, "readDataOfMinimumIncompleteLength:maximumLength:completionHandler:", v13, v14, v17);

      goto LABEL_20;
    }
LABEL_18:
    v12 = *(void **)(v2 + 256);
    goto LABEL_19;
  }
  if (v2)
  {
LABEL_5:
    v4 = 240;
    if (!*(_QWORD *)(v2 + 240))
      v4 = 232;
    v5 = (_QWORD **)*(id *)(v2 + v4);
    goto LABEL_8;
  }
  v5 = 0;
LABEL_8:
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_2;
  v24[3] = &unk_1E14ACE18;
  v6 = *(id *)(a1 + 40);
  v24[4] = *(_QWORD *)(a1 + 32);
  v25 = v6;
  if (v5)
    -[NWURLSessionDelegateQueue runDelegateBlock:](v5[6], v24);

  v7 = v25;
LABEL_20:

}

void __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, uint64_t, id))(v1 + 16))(v1, 0, 1, v2);

}

void __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  NWURLError *v3;
  id v4;
  id *v5;
  uint64_t v6;
  id v7;
  id v8;
  objc_super v9;

  v2 = *(id **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v3 = [NWURLError alloc];
    v4 = v2[32];
    v5 = v2;
    if (v3
      && (v6 = *MEMORY[0x1E0CB32E8],
          v9.receiver = v3,
          v9.super_class = (Class)NWURLError,
          (v7 = objc_msgSendSuper2(&v9, sel_initWithDomain_code_userInfo_, v6, -1005, 0)) != 0))
    {
      v8 = v7;
      objc_msgSend(v7, "fillErrorForLoader:andTask:", v4, v5);
    }
    else
    {
      v8 = 0;
    }

    (*(void (**)(uint64_t, _QWORD, uint64_t, id))(v1 + 16))(v1, 0, 1, v8);
  }
  else
  {
    v8 = 0;
    (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v1 + 16))(v1, 0, 1, 0);
  }

}

void __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  id *v3;
  NWURLError *v4;
  id v5;
  id *v6;
  uint64_t v7;
  NWURLError *v8;
  const char *v9;
  void *v10;
  objc_super v11;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = *(id **)(a1 + 32);
    if (v3)
    {
      v4 = [NWURLError alloc];
      v5 = v3[32];
      v6 = v3;
      if (v4)
      {
        v7 = *MEMORY[0x1E0CB32E8];
        v11.receiver = v4;
        v11.super_class = (Class)NWURLError;
        v8 = (NWURLError *)objc_msgSendSuper2(&v11, sel_initWithDomain_code_userInfo_, v7, -1001, 0);
        v4 = v8;
        if (v8)
          -[NWURLError fillErrorForLoader:andTask:](v8, "fillErrorForLoader:andTask:", v5, v6);
      }

      v10 = *(void **)(a1 + 32);
      if (v10)
        objc_setProperty_atomic_copy(v10, v9, v4, 136);
    }
    else
    {
      v4 = 0;
    }

  }
  -[NWURLSessionStreamTask checkForCompletion](*(_QWORD *)(a1 + 32));
}

void __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_5(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD **v15;
  id v16;
  uint64_t v17;
  id *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  id v27;
  char v28;
  _QWORD v29[5];
  id v30;

  v7 = a2;
  v8 = a4;
  v9 = *(NSObject **)(a1 + 32);
  if (v9)
    dispatch_source_cancel(v9);
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 && *(_BYTE *)(v10 + 460))
  {
    -[NWURLSessionTask delegateWrapper]((_QWORD *)v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_6;
    v29[3] = &unk_1E14ACE18;
    v18 = &v30;
    v21 = *(id *)(a1 + 48);
    v29[4] = *(_QWORD *)(a1 + 40);
    v30 = v21;
    -[NWURLSessionDelegateWrapper runDelegateBlock:]((uint64_t)v20, v29);

    goto LABEL_17;
  }
  objc_msgSend((id)v10, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && !v11)
  {
    v22 = *(void **)(a1 + 40);
    if (v22)
    {
      objc_setProperty_atomic_copy(v22, v12, v8, 136);
      v13 = *(_QWORD *)(a1 + 40);
      if (v13)
        goto LABEL_8;
    }
LABEL_21:
    v15 = 0;
    goto LABEL_11;
  }
  v13 = *(_QWORD *)(a1 + 40);
  if (!v13)
    goto LABEL_21;
LABEL_8:
  v14 = 240;
  if (!*(_QWORD *)(v13 + 240))
    v14 = 232;
  v15 = (_QWORD **)*(id *)(v13 + v14);
LABEL_11:
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_7;
  v24[3] = &unk_1E14A9268;
  v27 = *(id *)(a1 + 48);
  v16 = v7;
  v28 = a3;
  v17 = *(_QWORD *)(a1 + 40);
  v25 = v16;
  v26 = v17;
  if (v15)
    -[NWURLSessionDelegateQueue runDelegateBlock:](v15[6], v24);
  v18 = &v27;

  v19 = *(_QWORD *)(a1 + 40);
  if (!a3)
    goto LABEL_16;
  if (!v19)
    goto LABEL_23;
  if (!*(_BYTE *)(v19 + 460))
  {
    *(_BYTE *)(v19 + 460) = 1;
    v19 = *(_QWORD *)(a1 + 40);
LABEL_23:
    -[NWURLSessionTask delegateWrapper]((_QWORD *)v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWURLSessionDelegateWrapper readClosedForStreamTask:]((uint64_t)v23, *(void **)(a1 + 40));

    v19 = *(_QWORD *)(a1 + 40);
  }
LABEL_16:
  -[NWURLSessionStreamTask checkForCompletion](v19);

LABEL_17:
}

void __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  NWURLError *v3;
  id v4;
  id *v5;
  uint64_t v6;
  id v7;
  id v8;
  objc_super v9;

  v2 = *(id **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v3 = [NWURLError alloc];
    v4 = v2[32];
    v5 = v2;
    if (v3
      && (v6 = *MEMORY[0x1E0CB32E8],
          v9.receiver = v3,
          v9.super_class = (Class)NWURLError,
          (v7 = objc_msgSendSuper2(&v9, sel_initWithDomain_code_userInfo_, v6, -1005, 0)) != 0))
    {
      v8 = v7;
      objc_msgSend(v7, "fillErrorForLoader:andTask:", v4, v5);
    }
    else
    {
      v8 = 0;
    }

    (*(void (**)(uint64_t, _QWORD, uint64_t, id))(v1 + 16))(v1, 0, 1, v8);
  }
  else
  {
    v8 = 0;
    (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v1 + 16))(v1, 0, 1, 0);
  }

}

void __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = *(unsigned __int8 *)(a1 + 56);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v3 + 16))(v3, v2, v1, v4);

}

@end
