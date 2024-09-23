@implementation AFSiriTaskExecution

- (AFSiriTaskExecution)initWithRequest:(id)a3 taskDeliverer:(id)a4 usageResultListener:(id)a5
{
  id v9;
  id v10;
  id v11;
  AFSiriTaskExecution *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  id completionHandler;
  uint64_t v18;
  NSXPCListener *taskResponseListener;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  AFSiriTaskExecution *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AFSiriTaskExecution;
  v12 = -[AFSiriTaskExecution init](&v21, sel_init);
  if (v12)
  {
    v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[AFSiriTaskExecution initWithRequest:taskDeliverer:usageResultListener:]";
      v24 = 2048;
      v25 = v12;
      _os_log_impl(&dword_19AF50000, v13, OS_LOG_TYPE_INFO, "%s <AFSiriTaskExecution %p>", buf, 0x16u);
    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("Siri Task Execution", v14);

    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v12->_taskDeliverer, a4);
    objc_storeStrong((id *)&v12->_usageResultListener, a5);
    completionHandler = v12->_completionHandler;
    v12->_completionHandler = &__block_literal_global_3042;

    v12->_state = 1;
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v18 = objc_claimAutoreleasedReturnValue();
    taskResponseListener = v12->_taskResponseListener;
    v12->_taskResponseListener = (NSXPCListener *)v18;

    -[NSXPCListener setDelegate:](v12->_taskResponseListener, "setDelegate:", v12);
    -[NSXPCListener resume](v12->_taskResponseListener, "resume");
  }

  return v12;
}

- (AFSiriTaskExecution)init
{

  return 0;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  AFSiriTaskExecution *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[AFSiriTaskExecution dealloc]";
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s <AFSiriTaskExecution %p>", buf, 0x16u);
  }
  -[NSXPCListener setDelegate:](self->_taskResponseListener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_taskResponseListener, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)AFSiriTaskExecution;
  -[AFSiriTaskExecution dealloc](&v4, sel_dealloc);
}

- (void)handleSiriResponse:(id)a3 atTime:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AFSiriTaskExecution_handleSiriResponse_atTime___block_invoke;
  block[3] = &unk_1E3A353E8;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)handleFailureOfRequest:(id)a3 error:(id)a4 atTime:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  AFSiriTaskExecution *v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__AFSiriTaskExecution_handleFailureOfRequest_error_atTime___block_invoke;
  v13[3] = &unk_1E3A32C20;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v9[4];
  id v10;
  AFSiriTaskExecution *v11;

  v5 = a4;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__AFSiriTaskExecution_listener_shouldAcceptNewConnection___block_invoke;
  v9[3] = &unk_1E3A36FC8;
  v10 = v5;
  v11 = self;
  v7 = v5;
  dispatch_async(queue, v9);

  return 1;
}

- (void)start
{
  NSObject *queue;
  _QWORD v3[6];

  queue = self->_queue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__AFSiriTaskExecution_start__block_invoke;
  v3[3] = &unk_1E3A353C0;
  v3[4] = self;
  v3[5] = a2;
  dispatch_async(queue, v3);
}

- (void)setDeliveryHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__AFSiriTaskExecution_setDeliveryHandler___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__AFSiriTaskExecution_setCompletionHandler___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_completeWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[AFSiriTaskExecution _completeWithResponse:error:]";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AFSiriTaskExecution__completeWithResponse_error___block_invoke;
  block[3] = &unk_1E3A36B90;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

- (void)_completeWithResponse:(id)a3
{
  -[AFSiriTaskExecution _completeWithResponse:error:](self, "_completeWithResponse:error:", a3, 0);
}

- (void)_completeWithError:(id)a3
{
  -[AFSiriTaskExecution _completeWithResponse:error:](self, "_completeWithResponse:error:", 0, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskResponseListener, 0);
  objc_storeStrong((id *)&self->_taskResponseWatchdogTimer, 0);
  objc_storeStrong(&self->_keepAliveCycle, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_deliveryHandler, 0);
  objc_storeStrong((id *)&self->_usageResultListener, 0);
  objc_storeStrong((id *)&self->_taskDeliverer, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __51__AFSiriTaskExecution__completeWithResponse_error___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1[4] + 16);
    v20 = 136315394;
    v21 = "-[AFSiriTaskExecution _completeWithResponse:error:]_block_invoke";
    v22 = 2112;
    v23 = v3;
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s cancelling watchdog for %@", (uint8_t *)&v20, 0x16u);
  }
  objc_msgSend(*(id *)(a1[4] + 72), "cancel");
  v4 = a1[4];
  v5 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = 0;

  v6 = a1[4];
  if (*(_QWORD *)(v6 + 56) == 3)
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v8 = a1[5];
      v9 = (const __CFString *)a1[6];
      if (!v9)
        v9 = &stru_1E3A37708;
      v20 = 136315906;
      v21 = "-[AFSiriTaskExecution _completeWithResponse:error:]_block_invoke";
      v22 = 2112;
      v23 = v6;
      v24 = 2112;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s %@ is already completed; not completing again with response %@ %@",
        (uint8_t *)&v20,
        0x2Au);
    }
  }
  else
  {
    *(_QWORD *)(v6 + 56) = 3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1[4] + 24), "siriTaskDidFinish");
    v10 = a1[4];
    v11 = *(_QWORD *)(v10 + 48);
    if (v11)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v11 + 16))(v11, a1[5], a1[6]);
      v10 = a1[4];
      v12 = *(void **)(v10 + 48);
    }
    else
    {
      v12 = 0;
    }
    *(_QWORD *)(v10 + 48) = 0;

  }
  v13 = AFSiriLogContextConnection;
  v14 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
  v15 = a1[4];
  if (v14)
  {
    v20 = 136315394;
    v21 = "-[AFSiriTaskExecution _completeWithResponse:error:]_block_invoke";
    v22 = 2048;
    v23 = v15;
    _os_log_impl(&dword_19AF50000, v13, OS_LOG_TYPE_INFO, "%s <AFSiriTaskExecution %p> releasing listener", (uint8_t *)&v20, 0x16u);
    v15 = a1[4];
  }
  objc_msgSend(*(id *)(v15 + 80), "setDelegate:", 0);
  objc_msgSend(*(id *)(a1[4] + 80), "invalidate");
  v16 = a1[4];
  v17 = *(void **)(v16 + 80);
  *(_QWORD *)(v16 + 80) = 0;

  v18 = a1[4];
  v19 = *(void **)(v18 + 64);
  *(_QWORD *)(v18 + 64) = 0;

}

void __44__AFSiriTaskExecution_setCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A1AC0C3C](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

}

void __42__AFSiriTaskExecution_setDeliveryHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A1AC0C3C](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __28__AFSiriTaskExecution_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  AFSiriTask *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id location;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 56) != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("AFSiriTaskExecution.m"), 136, CFSTR("Task executions can only be started once"));

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v2 + 56) = 2;
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 40) || *(_QWORD *)(v3 + 48))
    objc_storeStrong((id *)(v3 + 64), (id)v3);
  v4 = [AFSiriTask alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 16);
  objc_msgSend(*(id *)(v5 + 80), "endpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AFSiriTask _initWithRequest:remoteResponseListenerEndpoint:usageResultListenerEndpoint:](v4, "_initWithRequest:remoteResponseListenerEndpoint:usageResultListenerEndpoint:", v6, v7, v8);

  objc_initWeak(&location, *(id *)(a1 + 32));
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 24);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __28__AFSiriTaskExecution_start__block_invoke_2;
  v14[3] = &unk_1E3A2D900;
  v14[4] = v10;
  v12 = v9;
  v15 = v12;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v11, "deliverSiriTask:completionHandler:", v12, v14);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

void __28__AFSiriTaskExecution_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  v8[2] = __28__AFSiriTaskExecution_start__block_invoke_3;
  v8[3] = &unk_1E3A2D8D8;
  v8[1] = 3221225472;
  v8[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  dispatch_async(v6, v8);
  objc_destroyWeak(&v11);

}

void __28__AFSiriTaskExecution_start__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  AFWatchdogTimer *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20[2];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  v5 = AFSiriLogContextConnection;
  v6 = *(_QWORD **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 48);
      v17 = v6[3];
      *(_DWORD *)buf = 136315906;
      v22 = "-[AFSiriTaskExecution start]_block_invoke_3";
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      v27 = 2114;
      v28 = v7;
      _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s Delivery of task %@ by %@ failed with error %{public}@", buf, 0x2Au);
      v6 = *(_QWORD **)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
    }
    objc_msgSend(v6, "_completeWithError:", v7);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 48);
      v9 = v6[3];
      *(_DWORD *)buf = 136315650;
      v22 = "-[AFSiriTaskExecution start]_block_invoke";
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s Task %@ was delivered successfully by %@", buf, 0x20u);
      v6 = *(_QWORD **)(a1 + 32);
    }
    if (v6[7] != 3)
    {
      v10 = AFPreferencesSiriTaskResponseTimeout();
      v11 = [AFWatchdogTimer alloc];
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __28__AFSiriTaskExecution_start__block_invoke_27;
      v18[3] = &unk_1E3A32F70;
      objc_copyWeak(v20, (id *)(a1 + 56));
      v19 = *(id *)(a1 + 48);
      v20[1] = *(id *)&v10;
      v13 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:](v11, "initWithTimeoutInterval:onQueue:timeoutHandler:", v12, v18, v10);
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 72);
      *(_QWORD *)(v14 + 72) = v13;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "start");
      objc_destroyWeak(v20);
    }
  }
}

void __28__AFSiriTaskExecution_start__block_invoke_27(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_FAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = 136315650;
    v10 = "-[AFSiriTaskExecution start]_block_invoke";
    v11 = 2112;
    v12 = v7;
    v13 = 2050;
    v14 = v8;
    _os_log_fault_impl(&dword_19AF50000, v3, OS_LOG_TYPE_FAULT, "%s Handling of %@ timed out after %{public}.2f seconds", (uint8_t *)&v9, 0x20u);
    if (!WeakRetained)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (WeakRetained)
  {
LABEL_3:
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[2], "_af_analyticsContextDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logEventWithType:context:", 502, v5);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("kAFAssistantErrorDomain"), 702, 0);
    objc_msgSend(WeakRetained, "_completeWithError:", v6);

  }
LABEL_4:

}

uint64_t __58__AFSiriTaskExecution_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3EDD68);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setExportedInterface:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setExportedObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "resume");
}

uint64_t __59__AFSiriTaskExecution_handleFailureOfRequest_error_atTime___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "_af_analyticsContextDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logEventWithType:machAbsoluteTime:context:", 506, v3, v4);

  return objc_msgSend(*(id *)(a1 + 40), "_completeWithError:", *(_QWORD *)(a1 + 48));
}

void __49__AFSiriTaskExecution_handleSiriResponse_atTime___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_af_analyticsContextDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logEventWithType:machAbsoluteTime:context:", 506, v3, v4);

  if (objc_msgSend(*(id *)(a1 + 40), "_isForRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)))
  {
    objc_msgSend(*(id *)(a1 + 32), "_completeWithResponse:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v10[0] = CFSTR("SiriRequest");
    v10[1] = CFSTR("SiriResponse");
    v11[0] = v7;
    v11[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("kAFAssistantErrorDomain"), 704, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_completeWithError:", v9);
  }
}

@end
