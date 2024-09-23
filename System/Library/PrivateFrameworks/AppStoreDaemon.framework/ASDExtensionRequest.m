@implementation ASDExtensionRequest

- (ASDExtensionRequest)initWithExtension:(id)a3 queue:(id)a4 serviceTime:(double)a5 graceTime:(double)a6
{
  id v11;
  id v12;
  ASDExtensionRequest *v13;
  ASDExtensionRequest *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *runQueue;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ASDExtensionRequest;
  v13 = -[ASDExtensionRequest init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_extension, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_UTILITY, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35D8], "globalStateQueueForExtension:", v11);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create_with_target_V2("com.apple.appstored.ASDExtensionRequest.dispatch", v16, v17);
    runQueue = v14->_runQueue;
    v14->_runQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v14->_callbackQueue, a4);
    v14->_serviceTime = a5;
    v14->_graceTime = a6;
  }

  return v14;
}

- (ASDExtensionRequest)initWithExtension:(id)a3 queue:(id)a4
{
  return -[ASDExtensionRequest initWithExtension:queue:serviceTime:graceTime:](self, "initWithExtension:queue:serviceTime:graceTime:", a3, a4, 0.0, 0.0);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ASDExtensionRequest;
  -[ASDExtensionRequest dealloc](&v2, sel_dealloc);
}

- (void)beginRequestForHostContext:(Class)a3 XPCInterface:(id)a4 executionBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *runQueue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  Class v17;
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  ASDLogHandleForCategory(11);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19A03B000, v10, OS_LOG_TYPE_DEBUG, "ASDExtensionRequest begin request", buf, 2u);
  }

  runQueue = self->_runQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__ASDExtensionRequest_beginRequestForHostContext_XPCInterface_executionBlock___block_invoke;
  v14[3] = &unk_1E37BE2C0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a3;
  v12 = v9;
  v13 = v8;
  dispatch_async(runQueue, v14);

}

void __78__ASDExtensionRequest_beginRequestForHostContext_XPCInterface_executionBlock___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  if (!v2)
  {
    -[ASDExtensionRequest _onRunQueue_beginRequestForHostContext:XPCInterface:retryCount:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(void **)(a1 + 40), 0);
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  }
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__ASDExtensionRequest_beginRequestForHostContext_XPCInterface_executionBlock___block_invoke_2;
  block[3] = &unk_1E37BDF10;
  v5 = *(id *)(a1 + 48);
  v10 = v3;
  v11 = v5;
  v9 = v2;
  v6 = v3;
  v7 = v2;
  dispatch_async(v4, block);

}

- (void)_onRunQueue_beginRequestForHostContext:(void *)a3 XPCInterface:(uint64_t)a4 retryCount:
{
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;
  BOOL v17;
  os_log_type_t v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  dispatch_source_t v37;
  void *v38;
  NSObject *v39;
  dispatch_time_t v40;
  void *v41;
  NSObject *v42;
  dispatch_source_t v43;
  void *v44;
  NSObject *v45;
  double v46;
  dispatch_time_t v47;
  NSObject *v48;
  NSObject *v49;
  id v50;
  _QWORD block[5];
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id location[5];
  __int128 buf;
  void (*v58)(uint64_t);
  void *v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  if (!a1)
    goto LABEL_59;
  v7 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = 0;

  v9 = (_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = 0;

  v10 = *(void **)(a1 + 88);
  v55 = 0;
  objc_msgSend(v10, "beginExtensionRequestWithOptions:inputItems:error:", 0, 0, &v55);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v55;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v11)
    {
      ASDLogHandleForCategory(11);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_fault_impl(&dword_19A03B000, v13, OS_LOG_TYPE_FAULT, "Wrong request identifier type: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_32;
    }
    objc_msgSend(v12, "domain");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "code");
    if (-[NSObject isEqualToString:](v13, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v15 = (unint64_t)(v14 - 4096) < 0x81;
      v16 = v14 != 4102;
      v17 = v16 && v15;
      if (v16 && v15)
        v18 = OS_LOG_TYPE_DEFAULT;
      else
        v18 = OS_LOG_TYPE_FAULT;
    }
    else
    {
      objc_msgSend(v12, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D7D468]))
      {
        v20 = objc_msgSend(v12, "code") == 4;

        if (v20)
        {
          objc_msgSend(v12, "userInfo");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "domain");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

          if (v24)
          {
            v25 = objc_msgSend(v22, "code");
            v26 = v22;
            if (v25 == 80 || v25 == 85)
              v18 = OS_LOG_TYPE_ERROR;
            else
              v18 = OS_LOG_TYPE_FAULT;
          }
          else
          {
            v26 = v22;
            v18 = OS_LOG_TYPE_FAULT;
          }

          v17 = 0;
          goto LABEL_26;
        }
      }
      else
      {

      }
      v17 = 0;
      v18 = OS_LOG_TYPE_FAULT;
    }
LABEL_26:
    ASDLogHandleForCategory(11);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, v18))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_19A03B000, v28, v18, "Failed to begin extension request: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    if (a4 <= 0 && v17)
    {
      ASDLogHandleForCategory(11);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = 2;
        _os_log_impl(&dword_19A03B000, v29, OS_LOG_TYPE_INFO, "Attempt #%ld", (uint8_t *)&buf, 0xCu);
      }

      -[ASDExtensionRequest _onRunQueue_beginRequestForHostContext:XPCInterface:retryCount:](a1, a2, v50, 1);
    }
    goto LABEL_32;
  }
  objc_storeStrong((id *)(a1 + 56), v11);
  if (a4 < 1)
    goto LABEL_33;
  ASDLogHandleForCategory(11);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = 2;
    _os_log_impl(&dword_19A03B000, v13, OS_LOG_TYPE_DEFAULT, "Succeeded on attempt %ld", (uint8_t *)&buf, 0xCu);
  }
LABEL_32:

LABEL_33:
  if (*v9)
  {
    objc_msgSend(*(id *)(a1 + 88), "_extensionContextForUUID:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v30)
      {
        objc_initWeak(location, (id)a1);
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __86__ASDExtensionRequest__onRunQueue_beginRequestForHostContext_XPCInterface_retryCount___block_invoke;
        v53[3] = &unk_1E37BE310;
        objc_copyWeak(&v54, location);
        v31 = (void *)MEMORY[0x19AEC5B88](v53);
        objc_msgSend(v30, "_auxiliaryConnection");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "remoteObjectProxyWithErrorHandler:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "conformsToProtocol:", v50))
        {
          v34 = v33;
          v35 = *(NSObject **)(a1 + 64);
          *(_QWORD *)(a1 + 64) = v34;
        }
        else
        {
          ASDLogHandleForCategory(11);
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v33;
            _os_log_error_impl(&dword_19A03B000, v35, OS_LOG_TYPE_ERROR, "Wrong remote context proxy %{public}@", (uint8_t *)&buf, 0xCu);
          }
        }

        objc_destroyWeak(&v54);
        objc_destroyWeak(location);
      }
      goto LABEL_45;
    }
    ASDLogHandleForCategory(11);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v30;
      _os_log_error_impl(&dword_19A03B000, v36, OS_LOG_TYPE_ERROR, "Wrong host context %{public}@", (uint8_t *)&buf, 0xCu);
    }

  }
  v30 = 0;
LABEL_45:
  if (*(_QWORD *)(a1 + 64))
  {
    if (*(double *)(a1 + 24) > 0.0)
    {
      v37 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 8));
      v38 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v37;

      v39 = *(NSObject **)(a1 + 32);
      v40 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 24) * 1000000000.0));
      dispatch_source_set_timer(v39, v40, 0xFFFFFFFFFFFFFFFFLL, 0);
      v41 = (void *)MEMORY[0x1E0C809B0];
      v42 = *(NSObject **)(a1 + 32);
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v58 = __35__ASDExtensionRequest__startTimers__block_invoke;
      v59 = &unk_1E37BDD60;
      v60 = a1;
      dispatch_source_set_event_handler(v42, &buf);
      if (*(double *)(a1 + 40) > 0.0)
      {
        v43 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 8));
        v44 = *(void **)(a1 + 48);
        *(_QWORD *)(a1 + 48) = v43;

        v45 = *(NSObject **)(a1 + 48);
        v46 = *(double *)(a1 + 24) - *(double *)(a1 + 40);
        v47 = dispatch_time(0, 1000000000 * ((uint64_t)v46 & ~((uint64_t)v46 >> 63)));
        dispatch_source_set_timer(v45, v47, 0xFFFFFFFFFFFFFFFFLL, 0);
        v48 = *(NSObject **)(a1 + 48);
        location[0] = v41;
        location[1] = (id)3221225472;
        location[2] = __35__ASDExtensionRequest__startTimers__block_invoke_2;
        location[3] = &unk_1E37BDD60;
        location[4] = (id)a1;
        dispatch_source_set_event_handler(v48, location);
        dispatch_resume(*(dispatch_object_t *)(a1 + 48));
      }
      dispatch_resume(*(dispatch_object_t *)(a1 + 32));
    }
  }
  else
  {
    if (!v12)
    {
      ASDErrorWithUnderlyingErrorAndDescription(0, CFSTR("ASDErrorDomain"), 507, CFSTR("Couldn't create extension request"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (*v9)
      objc_msgSend(*(id *)(a1 + 88), "cancelExtensionRequestWithIdentifier:");
    if (!*(_BYTE *)(a1 + 72))
    {
      *(_BYTE *)(a1 + 72) = 1;
      if (*(_QWORD *)(a1 + 80))
      {
        v49 = *(NSObject **)(a1 + 16);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __86__ASDExtensionRequest__onRunQueue_beginRequestForHostContext_XPCInterface_retryCount___block_invoke_9;
        block[3] = &unk_1E37BDC98;
        block[4] = a1;
        v52 = v12;
        dispatch_async(v49, block);

      }
    }
    -[ASDExtensionRequest _cleanupPostExecution]((_QWORD *)a1);
  }

LABEL_59:
}

uint64_t __78__ASDExtensionRequest_beginRequestForHostContext_XPCInterface_executionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- ($9113E22C387CB8549570940FFDE4B24C)beginRequestForHostContext:(Class)a3 XPCInterface:(id)a4
{
  id v6;
  NSObject *runQueue;
  id v8;
  uint64_t *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  Class v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  id v24;
  id v25;
  $9113E22C387CB8549570940FFDE4B24C result;

  v6 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x4012000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v24 = 0;
  v25 = 0;
  v23 = 512;
  runQueue = self->_runQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__ASDExtensionRequest_beginRequestForHostContext_XPCInterface___block_invoke;
  v14[3] = &unk_1E37BE2E8;
  v14[4] = self;
  v15 = v6;
  v16 = &v18;
  v17 = a3;
  v8 = v6;
  dispatch_async_and_wait(runQueue, v14);
  v9 = v19;
  v10 = (id)v19[6];
  v11 = (id)v9[7];

  _Block_object_dispose(&v18, 8);
  v12 = v10;
  v13 = v11;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

void __63__ASDExtensionRequest_beginRequestForHostContext_XPCInterface___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  if (!v3)
  {
    -[ASDExtensionRequest _onRunQueue_beginRequestForHostContext:XPCInterface:retryCount:](v2, *(_QWORD *)(a1 + 56), *(void **)(a1 + 40), 0);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), v3);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

void __86__ASDExtensionRequest__onRunQueue_beginRequestForHostContext_XPCInterface_retryCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    ASDLogHandleForCategory(11);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v3;
      _os_log_error_impl(&dword_19A03B000, v5, OS_LOG_TYPE_ERROR, "Remote context error %{public}@", buf, 0xCu);
    }

    v6 = WeakRetained[1];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __86__ASDExtensionRequest__onRunQueue_beginRequestForHostContext_XPCInterface_retryCount___block_invoke_6;
    v7[3] = &unk_1E37BDC98;
    v8 = WeakRetained;
    v9 = v3;
    dispatch_async(v6, v7);

  }
}

void __86__ASDExtensionRequest__onRunQueue_beginRequestForHostContext_XPCInterface_retryCount___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[4];
  _QWORD *v6;
  id v7;

  -[ASDExtensionRequest _cleanupPostExecution](*(_QWORD **)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 72))
  {
    *(_BYTE *)(v2 + 72) = 1;
    v3 = *(_QWORD **)(a1 + 32);
    if (v3[10])
    {
      v4 = v3[2];
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __86__ASDExtensionRequest__onRunQueue_beginRequestForHostContext_XPCInterface_retryCount___block_invoke_2;
      v5[3] = &unk_1E37BDC98;
      v6 = v3;
      v7 = *(id *)(a1 + 40);
      dispatch_async(v4, v5);

    }
  }
}

- (void)_cleanupPostExecution
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a1)
  {
    v2 = a1[6];
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = (void *)a1[6];
      a1[6] = 0;

    }
    v4 = a1[4];
    if (v4)
    {
      dispatch_source_cancel(v4);
      v5 = (void *)a1[4];
      a1[4] = 0;

    }
    v6 = (void *)a1[8];
    a1[8] = 0;

    v7 = (void *)a1[7];
    a1[7] = 0;

  }
}

uint64_t __86__ASDExtensionRequest__onRunQueue_beginRequestForHostContext_XPCInterface_retryCount___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16))();
}

uint64_t __86__ASDExtensionRequest__onRunQueue_beginRequestForHostContext_XPCInterface_retryCount___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16))();
}

- (void)endRequest
{
  NSObject *v3;
  uint8_t v4[16];

  ASDLogHandleForCategory(11);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_19A03B000, v3, OS_LOG_TYPE_DEBUG, "ASDExtensionRequest end request", v4, 2u);
  }

  -[ASDExtensionRequest _endRequestWithCancelCall:]((uint64_t)self, 1);
}

- (void)_endRequestWithCancelCall:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[5];
  char v4;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __49__ASDExtensionRequest__endRequestWithCancelCall___block_invoke;
    v3[3] = &unk_1E37BE338;
    v3[4] = a1;
    v4 = a2;
    dispatch_async(v2, v3);
  }
}

- (void)requestEnded
{
  NSObject *v3;
  uint8_t v4[16];

  ASDLogHandleForCategory(11);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_19A03B000, v3, OS_LOG_TYPE_DEBUG, "ASDExtensionRequest request ended", v4, 2u);
  }

  -[ASDExtensionRequest _endRequestWithCancelCall:]((uint64_t)self, 0);
}

void __49__ASDExtensionRequest__endRequestWithCancelCall___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 56))
  {
    if (*(double *)(v2 + 40) > 0.0)
    {
      objc_msgSend(*(id *)(v2 + 64), "serviceExtensionPerformCleanup");
      v2 = *(_QWORD *)(a1 + 32);
    }
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(*(id *)(v2 + 88), "cancelExtensionRequestWithIdentifier:", *(_QWORD *)(v2 + 56));
      v2 = *(_QWORD *)(a1 + 32);
    }
    -[ASDExtensionRequest _cleanupPostExecution]((_QWORD *)v2);
  }
}

void __35__ASDExtensionRequest__startTimers__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  ASDLogHandleForCategory(11);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19A03B000, v2, OS_LOG_TYPE_ERROR, "Extension request timeout", buf, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 56))
  {
    objc_msgSend(*(id *)(v3 + 88), "cancelExtensionRequestWithIdentifier:");
    v3 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_BYTE *)(v3 + 72))
  {
    *(_BYTE *)(v3 + 72) = 1;
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v3 + 80))
    {
      v4 = *(NSObject **)(v3 + 16);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __35__ASDExtensionRequest__startTimers__block_invoke_10;
      block[3] = &unk_1E37BDD60;
      block[4] = v3;
      dispatch_async(v4, block);
      v3 = *(_QWORD *)(a1 + 32);
    }
  }
  -[ASDExtensionRequest _cleanupPostExecution]((_QWORD *)v3);
}

void __35__ASDExtensionRequest__startTimers__block_invoke_10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 80);
  ASDErrorWithUnderlyingErrorAndDescription(0, CFSTR("ASDErrorDomain"), 515, CFSTR("Request timeout"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);

}

void __35__ASDExtensionRequest__startTimers__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  ASDLogHandleForCategory(11);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19A03B000, v2, OS_LOG_TYPE_INFO, "Extension request time will expire", v5, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "serviceExtensionTimeWillExpire");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = 0;

}

- (id)errorBlock
{
  return self->_errorBlock;
}

- (void)setErrorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong(&self->_errorBlock, 0);
  objc_storeStrong(&self->_remoteContextInterface, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_graceTimer, 0);
  objc_storeStrong((id *)&self->_serviceTimer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_runQueue, 0);
}

@end
