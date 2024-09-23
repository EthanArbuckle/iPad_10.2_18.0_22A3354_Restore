@implementation MDIndexExtension

void __123___MDIndexExtension_initWithExtension_queue_containerPath_containerID_supportedFileTypes_extensionLabel_isAppleCodeSigned___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  v4 = (void *)MEMORY[0x18D782104]();
  logForCSLogCategoryIndex();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __123___MDIndexExtension_initWithExtension_queue_containerPath_containerID_supportedFileTypes_extensionLabel_isAppleCodeSigned___block_invoke_cold_1((uint64_t)v3, a1, v5);

  objc_autoreleasePoolPop(v4);
}

void __123___MDIndexExtension_initWithExtension_queue_containerPath_containerID_supportedFileTypes_extensionLabel_isAppleCodeSigned___block_invoke_1(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x18D782104]();
  logForCSLogCategoryIndex();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __123___MDIndexExtension_initWithExtension_queue_containerPath_containerID_supportedFileTypes_extensionLabel_isAppleCodeSigned___block_invoke_1_cold_1((uint64_t)v5, a1, v8);

  objc_autoreleasePoolPop(v7);
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void (**v10)(id, _QWORD, id);
  void *v11;
  _QWORD *v12;
  void *v13;
  NSObject *v14;
  dispatch_source_t v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  id v19;
  dispatch_time_t v20;
  uint64_t *v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  void (**v29)(id, _QWORD, id);
  void *(*v30)(uint64_t, uint64_t);
  id v31;
  _QWORD v32[6];
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _BYTE *v37;
  _QWORD handler[4];
  id v39;
  id v40;
  _BYTE *v41;
  _QWORD v42[4];
  NSObject *v43;
  id v44;
  id v45;
  _BYTE buf[24];
  void *(*v47)(uint64_t, uint64_t);
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x18D782104]();
  logForCSLogCategoryIndex();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __49___MDIndexExtension__performJob_completionBlock___block_invoke_cold_3((uint64_t)v5, (uint64_t)a1, v9);

    objc_msgSend(a1[5], "_extensionContextForUUID:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a1 + 4;
    if (objc_msgSend(a1[4], "_verifyIntegrityWithHostContext:", v11)
      && (objc_msgSend(v11, "_auxiliaryConnection"), (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      dispatch_get_global_queue(0, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v14);

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v47 = __Block_byref_object_copy__1;
      *(_QWORD *)&v48 = __Block_byref_object_dispose__1;
      *((_QWORD *)&v48 + 1) = 0;
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __49___MDIndexExtension__performJob_completionBlock___block_invoke_33;
      v42[3] = &unk_1E2401548;
      v16 = v15;
      v43 = v16;
      v44 = a1[5];
      v45 = a1[7];
      *((_QWORD *)&v48 + 1) = objc_msgSend(v42, "copy");
      v17 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __49___MDIndexExtension__performJob_completionBlock___block_invoke_2;
      handler[3] = &unk_1E2401598;
      v18 = v13;
      v19 = a1[4];
      v39 = v18;
      v40 = v19;
      v41 = buf;
      dispatch_source_set_event_handler(v16, handler);
      v20 = dispatch_time(0, 610000000000);
      dispatch_source_set_timer(v16, v20, 0x8E06D55400uLL, 0x3B9ACA00uLL);
      dispatch_resume(v16);
      v33[0] = v17;
      v33[1] = 3221225472;
      v33[2] = __49___MDIndexExtension__performJob_completionBlock___block_invoke_37;
      v33[3] = &unk_1E24015C0;
      v34 = v5;
      v21 = (uint64_t *)(a1 + 6);
      v22 = a1[6];
      v23 = a1[4];
      v35 = v22;
      v36 = v23;
      v37 = buf;
      objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", v33);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      logForCSLogCategoryIndex();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        __49___MDIndexExtension__performJob_completionBlock___block_invoke_cold_2();

      logForCSLogCategoryIndex();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        __49___MDIndexExtension__performJob_completionBlock___block_invoke_cold_1();

      v27 = *v21;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __49___MDIndexExtension__performJob_completionBlock___block_invoke_39;
      v32[3] = &unk_1E24015E8;
      v32[4] = *v12;
      v32[5] = buf;
      objc_msgSend(v24, "performJob:acknowledgementHandler:", v27, v32);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      logForCSLogCategoryIndex();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v30 = (void *(*)(uint64_t, uint64_t))a1[6];
        v31 = a1[4];
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v5;
        *(_WORD *)&buf[22] = 2112;
        v47 = v30;
        LOWORD(v48) = 2112;
        *(_QWORD *)((char *)&v48 + 2) = v31;
        _os_log_error_impl(&dword_18C42F000, v28, OS_LOG_TYPE_ERROR, "Failed to get an XPC connnection for hostContext:%@, requestID:%@, job:%@, extension:%@", buf, 0x2Au);
      }

      v29 = (void (**)(id, _QWORD, id))a1[7];
      if (!v29)
        goto LABEL_20;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CSIndexErrorDomain"), -1, 0);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v29[2](v29, 0, v18);
    }

LABEL_20:
    goto LABEL_21;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __49___MDIndexExtension__performJob_completionBlock___block_invoke_cold_4((uint64_t)a1, (uint64_t)v6, v9);

  v10 = (void (**)(id, _QWORD, id))a1[7];
  if (v10)
    v10[2](v10, 0, v6);
LABEL_21:
  objc_autoreleasePoolPop(v7);

}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "cancelExtensionRequestWithIdentifier:", MEMORY[0x1E0C9AA60]);
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  __int128 v5;

  v2 = (void *)MEMORY[0x18D782104]();
  objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49___MDIndexExtension__performJob_completionBlock___block_invoke_3;
  v4[3] = &unk_1E2401570;
  v5 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v3, "getLastUpdateTimeWithCompletionHandler:", v4);

  objc_autoreleasePoolPop(v2);
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_3(uint64_t a1, double a2)
{
  void *v4;
  double Current;
  double v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const void *v11;
  void (**v12)(void *, _QWORD, void *);
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = (void *)MEMORY[0x18D782104]();
  Current = CFAbsoluteTimeGetCurrent();
  if (Current >= a2)
  {
    v6 = Current - a2;
    if (Current - a2 >= 600.0)
    {
      logForCSLogCategoryIndex();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __49___MDIndexExtension__performJob_completionBlock___block_invoke_3_cold_1(v7, a2, v6, v8, v9);

      v10 = *(id *)(a1 + 32);
      objc_sync_enter(v10);
      v11 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (v11)
      {
        v12 = (void (**)(void *, _QWORD, void *))_Block_copy(v11);
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = 0;

      }
      else
      {
        v12 = 0;
      }
      objc_sync_exit(v10);

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CSIndexErrorDomain"), -1, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, 0, v15);

      }
    }
  }
  objc_autoreleasePoolPop(v4);
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_37(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  const void *v7;
  void (**v8)(void *, _QWORD, id);
  uint64_t v9;
  void *v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x18D782104]();
  logForCSLogCategoryIndex();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __49___MDIndexExtension__performJob_completionBlock___block_invoke_37_cold_1();

  v6 = *(id *)(a1 + 48);
  objc_sync_enter(v6);
  v7 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v7)
  {
    v8 = (void (**)(void *, _QWORD, id))_Block_copy(v7);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(v6);

  if (v8)
    v8[2](v8, 0, v3);

  objc_autoreleasePoolPop(v4);
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  const void *v8;
  void (**v9)(void *, id, id);
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x18D782104]();
  v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  v8 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v8)
  {
    v9 = (void (**)(void *, id, id))_Block_copy(v8);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

  }
  else
  {
    v9 = 0;
  }
  objc_sync_exit(v7);

  if (v9)
    v9[2](v9, v12, v5);

  objc_autoreleasePoolPop(v6);
}

void __48___MDIndexExtension_performJob_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  v2 = (void *)MEMORY[0x18D782104]();
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v3);

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48___MDIndexExtension_performJob_completionBlock___block_invoke_2;
  v6[3] = &unk_1E2401638;
  v6[4] = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_performJob:completionBlock:", v5, v6);

  objc_autoreleasePoolPop(v2);
}

void __48___MDIndexExtension_performJob_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v6);

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

void __123___MDIndexExtension_initWithExtension_queue_containerPath_containerID_supportedFileTypes_extensionLabel_isAppleCodeSigned___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v4;
  uint64_t v5;
  uint8_t v6[24];

  v4 = OUTLINED_FUNCTION_7_0(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_18C42F000, a3, v5, "Request interrupted, requestID:%@, extension:%@", v6);

  OUTLINED_FUNCTION_6();
}

void __123___MDIndexExtension_initWithExtension_queue_containerPath_containerID_supportedFileTypes_extensionLabel_isAppleCodeSigned___block_invoke_1_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v4;
  uint64_t v5;
  uint8_t v6[24];

  v4 = OUTLINED_FUNCTION_7_0(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_18C42F000, a3, v5, "Request completed, requestID:%@, extension:%@", v6);

  OUTLINED_FUNCTION_6();
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13(&dword_18C42F000, v0, v1, "~~~ Calling remoteContext's performJob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1(&dword_18C42F000, v0, (uint64_t)v0, "Invoking extension:%@ with job:%@", v1);
  OUTLINED_FUNCTION_1();
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_1_1(&dword_18C42F000, a3, (uint64_t)a3, "Finished setting up a new request, requestID:%@, extension:%@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_cold_4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_18C42F000, log, OS_LOG_TYPE_ERROR, "Failed to setup a new session for extension:%@, error:%@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_3_cold_1(NSObject *a1, double a2, double a3, uint64_t a4, uint64_t a5)
{
  int v5;
  unint64_t v6;
  __int16 v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 134218240;
  v6 = (unint64_t)a2;
  v7 = 2048;
  v8 = (unint64_t)a3;
  OUTLINED_FUNCTION_1_1(&dword_18C42F000, a1, a5, "lastUpdateTime:%llu, delta:%llus", (uint8_t *)&v5);
  OUTLINED_FUNCTION_1();
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_37_cold_1()
{
  __int16 v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[22];
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_0();
  v5 = v0;
  v6 = v1;
  v7 = v0;
  v8 = v2;
  _os_log_error_impl(&dword_18C42F000, v3, OS_LOG_TYPE_ERROR, "Connection failed for requestID:%@, job:%@, extension:%@, error:%@", v4, 0x2Au);
}

@end
