@implementation FPRTCReportingSessionManager

+ (NSDictionary)sessionInfo
{
  uint64_t v2;
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE7CAD8];
  v10[0] = *MEMORY[0x24BE7CAC8];
  v10[1] = v2;
  v11[0] = &unk_250C65E18;
  v11[1] = &unk_250C65E30;
  v10[2] = *MEMORY[0x24BE7CB18];
  v3 = (void *)MEMORY[0x24BDD16E0];
  do
    v4 = __ldaxr((unsigned int *)&nextSessionID_sessionId);
  while (__stlxr(v4 + 1, (unsigned int *)&nextSessionID_sessionId));
  objc_msgSend(v3, "numberWithUnsignedInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE7CAB8];
  v11[2] = v5;
  v11[3] = CFSTR("com.apple.FileProviderDaemon");
  v7 = *MEMORY[0x24BE7CAA8];
  v10[3] = v6;
  v10[4] = v7;
  v10[5] = *MEMORY[0x24BE7CAE8];
  v11[4] = MEMORY[0x24BDBD1C0];
  v11[5] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (FPRTCReportingSessionManager)init
{
  FPRTCReportingSessionManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  dispatch_group_t v6;
  OS_dispatch_group *group;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FPRTCReportingSessionManager;
  v2 = -[FPRTCReportingSessionManager init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.FileProvider.rtcreporting", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v6;

  }
  return v2;
}

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global);
  return (id)defaultManager_defaultManager;
}

void __46__FPRTCReportingSessionManager_defaultManager__block_invoke()
{
  FPRTCReportingSessionManager *v0;
  void *v1;

  v0 = objc_alloc_init(FPRTCReportingSessionManager);
  v1 = (void *)defaultManager_defaultManager;
  defaultManager_defaultManager = (uint64_t)v0;

}

- (id)sessionForProviderID:(id)a3 version:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id *v9;
  const __CFString **v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  const __CFString *v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v20[0] = CFSTR("provider");
    v20[1] = CFSTR("providerVersion");
    v21[0] = a3;
    v21[1] = a4;
    v6 = (void *)MEMORY[0x24BDBCE70];
    v7 = a4;
    v8 = a3;
    v9 = (id *)v21;
    v10 = (const __CFString **)v20;
    v11 = v6;
    v12 = 2;
  }
  else
  {
    v18 = CFSTR("provider");
    v19 = a3;
    v13 = (void *)MEMORY[0x24BDBCE70];
    v7 = 0;
    v14 = a3;
    v9 = &v19;
    v10 = &v18;
    v11 = v13;
    v12 = 1;
  }
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v9, v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPRTCReportingSessionManager sessionWithCommonProperties:](self, "sessionWithCommonProperties:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)sessionWithCommonProperties:(id)a3
{
  id v4;
  FPRTCReportingSession *v5;

  v4 = a3;
  v5 = -[FPRTCReportingSession initWithWithCommonProperties:manager:]([FPRTCReportingSession alloc], "initWithWithCommonProperties:manager:", v4, self);

  return v5;
}

- (id)sessionForDomainID:(id)a3 providerVersion:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "fp_toProviderID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPRTCReportingSessionManager sessionForProviderID:version:](self, "sessionForProviderID:version:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)postReportWithCategory:(unint64_t)a3 type:(unint64_t)a4 payload:(id)a5 userinfo:(id)a6 error:(id)a7 decoratedPayload:(id)a8 session:(id)a9 observer:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *queue;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  unint64_t v36;
  unint64_t v37;

  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __117__FPRTCReportingSessionManager_postReportWithCategory_type_payload_userinfo_error_decoratedPayload_session_observer___block_invoke;
  block[3] = &unk_250C65790;
  block[4] = self;
  v30 = v19;
  v31 = v18;
  v32 = v15;
  v33 = v17;
  v34 = v20;
  v36 = a3;
  v37 = a4;
  v35 = v16;
  v22 = v16;
  v23 = v20;
  v24 = v17;
  v25 = v15;
  v26 = v18;
  v27 = v19;
  dispatch_async(queue, block);

}

void __117__FPRTCReportingSessionManager_postReportWithCategory_type_payload_userinfo_error_decoratedPayload_session_observer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;

  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(void **)(a1 + 40);
  if (v2
    && *(_QWORD *)(a1 + 48)
    && (objc_msgSend(v2, "executeModifyDecoratedPayloadHook:type:payload:error:decoratedPayload:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64)), !objc_msgSend(*(id *)(a1 + 48), "count")))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 72), "reportDiscardedOnSession:category:type:payload:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16));
  }
  else
  {
    v3 = *(void **)(a1 + 48);
    if (!v3)
      v3 = *(void **)(a1 + 56);
    v4 = v3;
    v5 = (void *)MEMORY[0x24BE7CA78];
    +[FPRTCReportingSessionManager sessionInfo](FPRTCReportingSessionManager, "sessionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 80);
    v8 = *(unsigned __int16 *)(a1 + 88);
    v9 = *(unsigned __int16 *)(a1 + 96);
    v14 = 0;
    v10 = objc_msgSend(v5, "sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:", v6, v7, v8, v9, v4, &v14);
    v11 = v14;

    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __117__FPRTCReportingSessionManager_postReportWithCategory_type_payload_userinfo_error_decoratedPayload_session_observer___block_invoke_cold_1(v4, v13);
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __117__FPRTCReportingSessionManager_postReportWithCategory_type_payload_userinfo_error_decoratedPayload_session_observer___block_invoke_cold_2(v11);
    }

    objc_msgSend(*(id *)(a1 + 72), "reportSentOnSession:category:type:payload:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), v4, v11);
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16));

  }
}

- (void)postMultipleReports:(id)a3 type:(unint64_t)a4 userinfo:(id)a5 session:(id)a6 observer:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *queue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  queue = self->_queue;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke;
  v21[3] = &unk_250C65808;
  v21[4] = self;
  v22 = v13;
  v23 = v12;
  v24 = v14;
  v25 = v15;
  v26 = a4;
  v17 = v15;
  v18 = v14;
  v19 = v12;
  v20 = v13;
  dispatch_async(queue, v21);

}

void __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16));
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v2 = objc_alloc(MEMORY[0x24BE7CA78]);
  +[FPRTCReportingSessionManager sessionInfo](FPRTCReportingSessionManager, "sessionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v2, "initWithSessionInfo:userInfo:frameworksToCheck:", v3, *(_QWORD *)(a1 + 40), 0);

  v4 = (void *)v15[5];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_15;
  v8[3] = &unk_250C657E0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v7 = *(void **)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v12 = &v14;
  v13 = v6;
  v10 = v5;
  v11 = v7;
  objc_msgSend(v4, "startConfigurationWithCompletionHandler:", v8);

  _Block_object_dispose(&v14, 8);
}

void __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  id v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  _QWORD v33[6];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[16];
  _BYTE v44[24];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v27 = v3;
    v41 = 0u;
    v42 = 0u;
    v40 = 0u;
    v39 = 0u;
    obj = *(id *)(a1 + 40);
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    v5 = 0;
    if (v30)
    {
      v29 = *(_QWORD *)v40;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v40 != v29)
            objc_enumerationMutation(obj);
          v31 = v6;
          v7 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v6);
          v8 = objc_msgSend(v7, "unsignedIntValue");
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v32 = v9;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
          if (v10)
          {
            v11 = v10;
            v12 = v8;
            v13 = *(_QWORD *)v36;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                v15 = v5;
                if (*(_QWORD *)v36 != v13)
                  objc_enumerationMutation(v32);
                v16 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * i);
                v17 = v16;
                if (*(_QWORD *)(a1 + 48))
                {
                  v18 = objc_msgSend(v16, "mutableCopy");
                  objc_msgSend(*(id *)(a1 + 48), "executeModifyDecoratedPayloadHook:type:payload:error:decoratedPayload:", v12, *(_QWORD *)(a1 + 72), v17, 0, v18);

                  v17 = (void *)v18;
                }
                v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
                v20 = *(unsigned __int16 *)(a1 + 72);
                v34 = v5;
                v21 = objc_msgSend(v19, "sendMessageWithCategory:type:payload:error:", (unsigned __int16)v12, v20, v17, &v34);
                v5 = v34;

                fp_current_or_default_log();
                v22 = objc_claimAutoreleasedReturnValue();
                v23 = v22;
                if (v21)
                {
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                    __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_15_cold_2((uint64_t)v44, (uint64_t)v17);
                }
                else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_15_cold_3((uint64_t)v43, (uint64_t)v5);
                }

                objc_msgSend(*(id *)(a1 + 56), "reportSentOnSession:category:type:payload:error:", *(_QWORD *)(a1 + 48), v12, *(_QWORD *)(a1 + 72), v17, v5);
              }
              v11 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
            }
            while (v11);
          }

          v6 = v31 + 1;
        }
        while (v31 + 1 != v30);
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v30);
    }

    v24 = *(_QWORD *)(a1 + 64);
    v25 = *(void **)(*(_QWORD *)(v24 + 8) + 40);
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_16;
    v33[3] = &unk_250C657B8;
    v33[4] = *(_QWORD *)(a1 + 32);
    v33[5] = v24;
    objc_msgSend(v25, "flushMessagesWithCompletion:", v33);

    v4 = v27;
  }
  else
  {
    fp_current_or_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_15_cold_1(v26);

    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16));
  }

}

void __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_16_cold_1(v3);

  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)postReportWithCategory:(unint64_t)a3 type:(unint64_t)a4 payload:(id)a5 error:(id)a6 decoratedPayload:(id)a7 session:(id)a8 observer:(id)a9
{
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v16 = *MEMORY[0x24BE7CB30];
  v24[0] = *MEMORY[0x24BE7CB20];
  v24[1] = v16;
  v25[0] = CFSTR("fileprovider");
  v25[1] = CFSTR("fpfs");
  v17 = (void *)MEMORY[0x24BDBCE70];
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPRTCReportingSessionManager postReportWithCategory:type:payload:userinfo:error:decoratedPayload:session:observer:](self, "postReportWithCategory:type:payload:userinfo:error:decoratedPayload:session:observer:", a3, a4, v22, v23, v21, v20, v19, v18);

}

- (void)flushMessagesWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  NSObject *v6;
  OS_dispatch_queue **p_queue;
  id v8;
  _QWORD block[4];
  id v10;

  v4 = a3;
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_23);
  p_queue = &self->_queue;
  queue = self->_queue;
  v6 = p_queue[1];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__FPRTCReportingSessionManager_flushMessagesWithCompletion___block_invoke_2;
  block[3] = &unk_250C65850;
  v10 = v4;
  v8 = v4;
  dispatch_group_notify(v6, queue, block);

}

uint64_t __60__FPRTCReportingSessionManager_flushMessagesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)waitUntilTelemetrySessionIsAvailable:(unint64_t)a3 retryDuration:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  BOOL v17;
  char v18;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BE7CB30];
  v26[0] = *MEMORY[0x24BE7CB20];
  v26[1] = v6;
  v27[0] = CFSTR("fileprovider");
  v27[1] = CFSTR("fpfs");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v8 = 1000000000 * a4;
    v9 = a3 - 1;
    v10 = MEMORY[0x24BDAC760];
    do
    {
      v11 = objc_alloc(MEMORY[0x24BE7CA78]);
      +[FPRTCReportingSessionManager sessionInfo](FPRTCReportingSessionManager, "sessionInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithSessionInfo:userInfo:frameworksToCheck:", v12, v7, 0);

      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      v14 = dispatch_semaphore_create(0);
      v19[0] = v10;
      v19[1] = 3221225472;
      v19[2] = __83__FPRTCReportingSessionManager_waitUntilTelemetrySessionIsAvailable_retryDuration___block_invoke;
      v19[3] = &unk_250C65878;
      v21 = &v22;
      v15 = v14;
      v20 = v15;
      objc_msgSend(v13, "startConfigurationWithCompletionHandler:", v19);
      v16 = dispatch_time(0, v8);
      dispatch_semaphore_wait(v15, v16);

      sleep(1u);
      v17 = *((_BYTE *)v23 + 24) != 0;

      _Block_object_dispose(&v22, 8);
      if (v9)
        v18 = v17;
      else
        v18 = 1;
      --v9;
    }
    while ((v18 & 1) == 0);
  }

}

intptr_t __83__FPRTCReportingSessionManager_waitUntilTelemetrySessionIsAvailable_retryDuration___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 != 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __117__FPRTCReportingSessionManager_postReportWithCategory_type_payload_userinfo_error_decoratedPayload_session_observer___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_23B49E000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] FPRTCReporting: RTC message sent %@", v4);

  OUTLINED_FUNCTION_1();
}

void __117__FPRTCReportingSessionManager_postReportWithCategory_type_payload_userinfo_error_decoratedPayload_session_observer___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23B49E000, v2, v3, "[ERROR] FPRTCReporting: error: unable to send RTC message: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_15_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23B49E000, log, OS_LOG_TYPE_ERROR, "[ERROR] Failed to configure RTC session", v1, 2u);
}

void __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_15_cold_2(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  void *v5;

  objc_msgSend((id)OUTLINED_FUNCTION_4(a1, a2), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138412290;
  *v3 = v5;
  OUTLINED_FUNCTION_5(&dword_23B49E000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] FPRTCReporting: RTC message sent %@", v4);

  OUTLINED_FUNCTION_2();
}

void __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_15_cold_3(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  void *v5;

  objc_msgSend((id)OUTLINED_FUNCTION_4(a1, a2), "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138412290;
  *v3 = v5;
  _os_log_error_impl(&dword_23B49E000, v2, OS_LOG_TYPE_ERROR, "[ERROR] FPRTCReporting: error: unable to send RTC message: %@", v4, 0xCu);

  OUTLINED_FUNCTION_2();
}

void __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_16_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23B49E000, v2, v3, "[ERROR] FPRTCReporting: flushsing session failed: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
