@implementation MDMServerCore

- (MDMServerCore)initWithChannelType:(unint64_t)a3
{
  char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  dispatch_queue_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  MDMServerAppInstallBlocking *v13;
  void *v14;
  MDMPushServiceManager *v15;
  void *v16;
  MDMDEPPushTokenManager *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __int16 v22[8];
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MDMServerCore;
  v4 = -[MDMServerCore init](&v23, sel_init);
  if (v4)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("MDMServerCore member queue", v5);
    v7 = (void *)*((_QWORD *)v4 + 7);
    *((_QWORD *)v4 + 7) = v6;

    v8 = dispatch_queue_create("MDMServerCore notification queue", v5);
    v9 = (void *)*((_QWORD *)v4 + 8);
    *((_QWORD *)v4 + 8) = v8;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2A800]), "initWithQoS:hangThreshold:owner:", -1, CFSTR("MDMServerCore"), *(double *)");
    objc_msgSend(v10, "setShouldDumpStackshot:", 1);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE2A808]), "initWithExecutionQueue:", v10);
    v12 = (void *)*((_QWORD *)v4 + 9);
    *((_QWORD *)v4 + 9) = v11;

    v13 = objc_alloc_init(MDMServerAppInstallBlocking);
    v14 = (void *)*((_QWORD *)v4 + 6);
    *((_QWORD *)v4 + 6) = v13;

    objc_msgSend(*((id *)v4 + 6), "setServer:", v4);
    *((_QWORD *)v4 + 5) = a3;
    *((_DWORD *)v4 + 2) = -1;
    *(_QWORD *)(v4 + 28) = -1;
    *((_DWORD *)v4 + 9) = -1;
    v15 = -[MDMPushServiceManager initWithChannel:]([MDMPushServiceManager alloc], "initWithChannel:", a3);
    v16 = (void *)*((_QWORD *)v4 + 10);
    *((_QWORD *)v4 + 10) = v15;

    v17 = -[MDMDEPPushTokenManager initWithPushServiceManager:]([MDMDEPPushTokenManager alloc], "initWithPushServiceManager:", *((_QWORD *)v4 + 10));
    v18 = (void *)*((_QWORD *)v4 + 11);
    *((_QWORD *)v4 + 11) = v17;

    objc_msgSend(v4, "_registerAsUserSwitchStakeholder");
    v19 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22[0] = 0;
      _os_log_impl(&dword_222CB9000, v19, OS_LOG_TYPE_DEFAULT, "Subscribing to locale changes.", (uint8_t *)v22, 2u);
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v4, sel__currentLocaleDidChange_, *MEMORY[0x24BDBCA70], 0);

  }
  return (MDMServerCore *)v4;
}

- (void)dealloc
{
  objc_super v3;

  if (-[MDMServerCore memberQueueIdentity](self, "memberQueueIdentity"))
    CFRelease(-[MDMServerCore memberQueueIdentity](self, "memberQueueIdentity"));
  v3.receiver = self;
  v3.super_class = (Class)MDMServerCore;
  -[MDMServerCore dealloc](&v3, sel_dealloc);
}

- (BOOL)startOutError:(id *)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;

  v4 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v4 + 8), OS_LOG_TYPE_DEBUG))
    -[MDMServerCore startOutError:].cold.1();
  v5 = objc_alloc(MEMORY[0x24BE2A840]);
  -[MDMServerCore _reasonStringWithReason:](self, "_reasonStringWithReason:", CFSTR("StartMDMDServer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithReason:", v6);

  +[MDMMCInterface profiledCheckIn](MDMMCInterface, "profiledCheckIn");
  -[MDMServerCore pushServiceManager](self, "pushServiceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addPushServiceObserver:", self);

  if (objc_msgSend(MEMORY[0x24BE2A7E8], "isDEPPushEnabled"))
  {
    -[MDMServerCore pushServiceManager](self, "pushServiceManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MDMServerCore depPushTokenManager](self, "depPushTokenManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addPushServiceObserver:", v10);

    -[MDMServerCore depPushTokenManager](self, "depPushTokenManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startMonitoringDEPPushTokenChange");

  }
  v18 = 0;
  v12 = -[MDMServerCore _readConfigurationOutError:isUproot:](self, "_readConfigurationOutError:isUproot:", &v18, 0);
  v13 = v18;
  if (v12)
  {
    -[MDMServerCore jobQueue](self, "jobQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __31__MDMServerCore_startOutError___block_invoke;
    v16[3] = &unk_24EB693B8;
    v16[4] = self;
    v17 = v7;
    objc_msgSend(v14, "fromFunction:enqueueJob:", "-[MDMServerCore startOutError:]", v16);

  }
  return v12;
}

void __31__MDMServerCore_startOutError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__MDMServerCore_startOutError___block_invoke_2;
  v6[3] = &unk_24EB69370;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "_pollFromServerIfNeeded:isReachabilityEvent:completionHandler:", 0, 0, v6);

}

uint64_t __31__MDMServerCore_startOutError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_schedulePollingServerForCommand
{
  void *v3;
  _QWORD v4[5];

  -[MDMServerCore jobQueue](self, "jobQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__MDMServerCore__schedulePollingServerForCommand__block_invoke;
  v4[3] = &unk_24EB69408;
  v4[4] = self;
  objc_msgSend(v3, "fromFunction:enqueueJob:", "-[MDMServerCore _schedulePollingServerForCommand]", v4);

}

void __49__MDMServerCore__schedulePollingServerForCommand__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__MDMServerCore__schedulePollingServerForCommand__block_invoke_2;
  v6[3] = &unk_24EB693E0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_pollFromServerIfNeeded:isReachabilityEvent:completionHandler:", 0, 0, v6);

}

uint64_t __49__MDMServerCore__schedulePollingServerForCommand__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_pollFromServerIfNeeded:(BOOL)a3 isReachabilityEvent:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;

  v6 = a3;
  v8 = a5;
  if (v6)
  {
    v9 = objc_alloc(MEMORY[0x24BE2A868]);
    -[MDMServerCore _reasonStringWithReason:](self, "_reasonStringWithReason:", CFSTR("Polling"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithReason:", v10);

    -[MDMServerCore _cachedResponse](self, "_cachedResponse");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      -[MDMServerCore _idleResponse](self, "_idleResponse");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMServerCore _setCachedResponse:](self, "_setCachedResponse:", v13);

    }
  }
  else
  {
    v11 = 0;
  }
  -[MDMServerCore jobQueue](self, "jobQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __79__MDMServerCore__pollFromServerIfNeeded_isReachabilityEvent_completionHandler___block_invoke;
  v17[3] = &unk_24EB69430;
  v20 = a4;
  v17[4] = self;
  v18 = v11;
  v19 = v8;
  v15 = v8;
  v16 = v11;
  objc_msgSend(v14, "queueBlock:", v17);

}

void __79__MDMServerCore__pollFromServerIfNeeded_isReachabilityEvent_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(unsigned __int8 *)(a1 + 56);
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __79__MDMServerCore__pollFromServerIfNeeded_isReachabilityEvent_completionHandler___block_invoke_2;
  v4[3] = &unk_24EB693E0;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_executionQueueUpdateTokenIfNeededAndCheckForOutstandingActivityIsReachabilityEvent:assertion:completionBlock:", v1, v3, v4);

}

uint64_t __79__MDMServerCore__pollFromServerIfNeeded_isReachabilityEvent_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_executionQueueUpdateTokenIfNeededAndCheckForOutstandingActivityIsReachabilityEvent:(BOOL)a3 assertion:(id)a4 completionBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v14[16];
  _QWORD v15[5];
  id v16;
  void (**v17)(_QWORD);
  BOOL v18;
  _QWORD block[6];
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;

  v6 = a3;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  v10 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    _os_log_impl(&dword_222CB9000, v10, OS_LOG_TYPE_INFO, "Checking for outstanding activity. Is reachability event: %d", buf, 8u);
  }
  *(_QWORD *)buf = 0;
  v21 = buf;
  v22 = 0x2020000000;
  v23 = 0;
  -[MDMServerCore memberQueue](self, "memberQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __127__MDMServerCore__executionQueueUpdateTokenIfNeededAndCheckForOutstandingActivityIsReachabilityEvent_assertion_completionBlock___block_invoke;
  block[3] = &unk_24EB68168;
  block[4] = self;
  block[5] = buf;
  dispatch_async_and_wait(v11, block);

  if (v21[24])
  {
    if (-[MDMServerCore _isTokenUpdateScheduled](self, "_isTokenUpdateScheduled"))
    {
      v15[0] = v12;
      v15[1] = 3221225472;
      v15[2] = __127__MDMServerCore__executionQueueUpdateTokenIfNeededAndCheckForOutstandingActivityIsReachabilityEvent_assertion_completionBlock___block_invoke_2;
      v15[3] = &unk_24EB69430;
      v15[4] = self;
      v18 = v6;
      v16 = v8;
      v17 = v9;
      -[MDMServerCore _executionQueueTellServerAboutDeviceTokenWithAssertion:completionBlock:](self, "_executionQueueTellServerAboutDeviceTokenWithAssertion:completionBlock:", v16, v15);

    }
    else
    {
      -[MDMServerCore _executionQueueCheckForOutstandingActivityIsReachabilityEvent:assertion:completionBlock:](self, "_executionQueueCheckForOutstandingActivityIsReachabilityEvent:assertion:completionBlock:", v6, v8, v9);
    }
  }
  else
  {
    v13 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_222CB9000, v13, OS_LOG_TYPE_INFO, "No valid MDM configuration found.", v14, 2u);
    }
    if (v9)
      v9[2](v9);
  }
  _Block_object_dispose(buf, 8);

}

uint64_t __127__MDMServerCore__executionQueueUpdateTokenIfNeededAndCheckForOutstandingActivityIsReachabilityEvent_assertion_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "memberQueueIsMDMConfigurationValid");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __127__MDMServerCore__executionQueueUpdateTokenIfNeededAndCheckForOutstandingActivityIsReachabilityEvent_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executionQueueCheckForOutstandingActivityIsReachabilityEvent:assertion:completionBlock:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_executionQueueCheckForOutstandingActivityIsReachabilityEvent:(BOOL)a3 assertion:(id)a4 completionBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  _QWORD block[6];
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  char v21;

  v6 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  -[MDMServerCore _cachedResponse](self, "_cachedResponse");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    *(_QWORD *)buf = 0;
    v19 = buf;
    v20 = 0x2020000000;
    v21 = 0;
    -[MDMServerCore memberQueue](self, "memberQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __105__MDMServerCore__executionQueueCheckForOutstandingActivityIsReachabilityEvent_assertion_completionBlock___block_invoke;
    block[3] = &unk_24EB68168;
    block[4] = self;
    block[5] = buf;
    dispatch_async_and_wait(v11, block);

    if (v6 && v19[24] && DMCIsDeviceLocked())
    {
      v12 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_222CB9000, v12, OS_LOG_TYPE_DEFAULT, "Not polling in response to reachability change. Waiting for device to unlock first.", v16, 2u);
      }
      v13 = 1;
    }
    else
    {
      v14 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_222CB9000, v14, OS_LOG_TYPE_DEFAULT, "Polling MDM server.", v16, 2u);
      }
      -[MDMServerCore _executionQueuePollServerForCommandWithAssertion:completionBlock:](self, "_executionQueuePollServerForCommandWithAssertion:completionBlock:", v8, v9);
      v13 = 0;
    }
    _Block_object_dispose(buf, 8);
    if (!v9)
      goto LABEL_18;
LABEL_16:
    if (v13)
      v9[2](v9);
    goto LABEL_18;
  }
  v15 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v15, OS_LOG_TYPE_DEFAULT, "No cached response to send.", buf, 2u);
  }
  v13 = 1;
  if (v9)
    goto LABEL_16;
LABEL_18:

}

uint64_t __105__MDMServerCore__executionQueueCheckForOutstandingActivityIsReachabilityEvent_assertion_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "memberQueueLastResponseWasNotNow");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_executionQueueTellServerAboutDeviceTokenWithAssertion:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[8];
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  if (-[MDMServerCore executionQueueIsCheckinInProgress](self, "executionQueueIsCheckinInProgress"))
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke;
    v16[3] = &unk_24EB69458;
    v17 = v7;
    v8 = v7;
    -[MDMServerCore _executeBlockWhenPushTokenIsAvailable:](self, "_executeBlockWhenPushTokenIsAvailable:", v16);
    v9 = v17;
  }
  else
  {
    v10 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v10, OS_LOG_TYPE_DEFAULT, "Telling server about new device token.", buf, 2u);
    }
    -[MDMServerCore setExecutionQueueIsCheckinInProgress:](self, "setExecutionQueueIsCheckinInProgress:", 1);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_42;
    v12[3] = &unk_24EB694F8;
    v12[4] = self;
    v13 = v6;
    v14 = v7;
    v11 = v7;
    -[MDMServerCore _executeBlockWhenPushTokenIsAvailable:](self, "_executeBlockWhenPushTokenIsAvailable:", v12);

    v9 = v13;
  }

}

uint64_t __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "jobQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_2;
  v7[3] = &unk_24EB694D0;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  objc_msgSend(v4, "queueBlock:", v7);

}

void __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  char v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  __SecIdentity *v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  id v52;
  NSObject *v53;
  NSObject *v54;
  int v55;
  NSObject *v56;
  uint64_t v57;
  NSObject *v58;
  id v59;
  NSObject *v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  _QWORD v68[5];
  id v69;
  uint8_t *v70;
  SecCertificateRef certificateRef;
  _QWORD v72[5];
  id v73;
  uint8_t v74[8];
  uint8_t *v75;
  uint64_t v76;
  char v77;
  _QWORD block[14];
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  char v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  id v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  char v122;
  _QWORD v123[2];
  _QWORD v124[2];
  uint8_t buf[4];
  void *v126;
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  v2 = DMCHasMDMMigrated();
  v119 = 0;
  v120 = &v119;
  v121 = 0x2020000000;
  v122 = 0;
  v115 = 0;
  v116 = &v115;
  v117 = 0x2020000000;
  v118 = 0;
  v109 = 0;
  v110 = &v109;
  v111 = 0x3032000000;
  v112 = __Block_byref_object_copy__10;
  v113 = __Block_byref_object_dispose__10;
  v114 = 0;
  v102 = 0;
  v103 = 0;
  v104 = &v103;
  v105 = 0x3032000000;
  v106 = __Block_byref_object_copy__10;
  v107 = __Block_byref_object_dispose__10;
  v108 = 0;
  v97 = 0;
  v98 = &v97;
  v99 = 0x3032000000;
  v100 = __Block_byref_object_copy__10;
  v101 = __Block_byref_object_dispose__10;
  v93 = 0;
  v94 = &v93;
  v95 = 0x2020000000;
  v96 = 0;
  v87 = 0;
  v88 = &v87;
  v89 = 0x3032000000;
  v90 = __Block_byref_object_copy__10;
  v91 = __Block_byref_object_dispose__10;
  v92 = 0;
  v83 = 0;
  v84 = &v83;
  v85 = 0x2020000000;
  v86 = 0;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  objc_msgSend(*(id *)(a1 + 32), "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_43;
  block[3] = &unk_24EB69480;
  v67 = a1;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = &v119;
  block[6] = &v115;
  block[7] = &v109;
  block[8] = &v103;
  block[9] = &v97;
  block[10] = &v93;
  block[11] = &v87;
  block[12] = &v83;
  block[13] = &v79;
  dispatch_async_and_wait(v3, block);

  v4 = v2;
  v5 = v2 && *((_BYTE *)v120 + 24) && *(_QWORD *)(a1 + 40) != 0;
  objc_msgSend(MEMORY[0x24BE2A7A8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hrnMode");

  if (v5 || v7 == 2)
  {
    *(_QWORD *)v74 = 0;
    v75 = v74;
    v76 = 0x2020000000;
    v77 = 0;
    if (!objc_msgSend(*(id *)(v67 + 32), "_isTokenUpdateScheduled"))
    {
LABEL_67:
      objc_msgSend(*(id *)(v67 + 32), "setExecutionQueueIsCheckinInProgress:", 0);
      if (v75[24])
      {
        objc_msgSend(*(id *)(v67 + 32), "_executionQueueTellServerAboutDeviceTokenWithAssertion:completionBlock:", *(_QWORD *)(v67 + 48), *(_QWORD *)(v67 + 56));
      }
      else
      {
        v57 = *(_QWORD *)(v67 + 56);
        if (v57)
          (*(void (**)(void))(v57 + 16))();
      }
      _Block_object_dispose(v74, 8);
      goto LABEL_72;
    }
    v8 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v8, OS_LOG_TYPE_DEFAULT, "Telling MDM Check-In Server about new device token.", buf, 2u);
    }
    if (objc_msgSend(*(id *)(v67 + 32), "userSwitchAlreadyInitiated"))
    {
      v9 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_INFO, "User switch already initiated. Not telling server about new token right now.", buf, 2u);
      }
      v10 = 0;
      v11 = 0;
LABEL_66:

      goto LABEL_67;
    }
    if ((objc_msgSend(MEMORY[0x24BE2A818], "isAppleTV") & 1) != 0)
      goto LABEL_24;
    objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userMode") == 1;

    if (v15 || (v116[3] & 4) == 0)
      goto LABEL_24;
    if (MDMKeybagCreateMDMEscrowWithPasscode(&stru_24EB6A400, 0))
    {
      v58 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CB9000, v58, OS_LOG_TYPE_DEFAULT, "Generated new unlock token because there's no passcode", buf, 2u);
      }
    }
    v73 = 0;
    MDMKeybagRetrieveMDMEscrowDataIfPresent(&v73);
    v16 = objc_claimAutoreleasedReturnValue();
    v59 = v73;
    if (v16)
    {
      v63 = v59;
      v60 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CB9000, v60, OS_LOG_TYPE_DEFAULT, "Found unlock token; including in TokenUpdate message.",
          buf,
          2u);
      }
    }
    else
    {
      if (!v59)
      {
LABEL_24:
        v16 = 0;
        v63 = 0;
        goto LABEL_25;
      }
      v63 = v59;
      v61 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v126 = v63;
        _os_log_impl(&dword_222CB9000, v61, OS_LOG_TYPE_ERROR, "Could not retrieve unlock token to include in TokenUpdate message: %@", buf, 0xCu);
      }
      v16 = 0;
    }
LABEL_25:
    objc_msgSend(*(id *)(v67 + 32), "memberQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v64 = (void *)v16;
    v72[0] = MEMORY[0x24BDAC760];
    v72[1] = 3221225472;
    v72[2] = __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_49;
    v72[3] = &unk_24EB68230;
    v72[4] = *(_QWORD *)(v67 + 32);
    dispatch_async_and_wait(v17, v72);

    if (objc_msgSend(*(id *)(v67 + 32), "channelType"))
      v18 = objc_msgSend(*(id *)(v67 + 32), "_isAwaitingUserConfigured");
    else
      v18 = +[MDMMCInterface isAwaitingDeviceConfigured](MDMMCInterface, "isAwaitingDeviceConfigured");
    v19 = *MEMORY[0x24BE61010];
    v20 = *MEMORY[0x24BE60FF0];
    v123[0] = *MEMORY[0x24BE61008];
    v123[1] = v20;
    v124[0] = v19;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v124[1] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v124, v123, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)objc_msgSend(v22, "mutableCopy");

    if (v7 != 2)
    {
      v23 = v110[5];
      if (v23)
        objc_msgSend(v66, "setObject:forKeyedSubscript:", v23, CFSTR("Topic"));
      v24 = v104[5];
      if (v24)
        objc_msgSend(v66, "setObject:forKeyedSubscript:", v24, CFSTR("PushMagic"));
      v25 = *(_QWORD *)(v67 + 40);
      if (v25)
        objc_msgSend(v66, "setObject:forKeyedSubscript:", v25, *MEMORY[0x24BE61000]);
    }
    if ((v116[3] & 4) != 0)
      objc_msgSend(v66, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE61020]);
    if (objc_msgSend(*(id *)(v67 + 32), "memberQueueUseEnrollmentID"))
    {
      objc_msgSend(*(id *)(v67 + 32), "memberQueueEnrollmentID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BE60FF8]);
      v27 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v126 = v26;
        v28 = "The token update dictionary has Enrollment ID: %{public}@";
LABEL_42:
        _os_log_impl(&dword_222CB9000, v27, OS_LOG_TYPE_INFO, v28, buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE2A818], "deviceUDID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BE61018]);
      v27 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v126 = v26;
        v28 = "The token update dictionary has UDID: %{public}@";
        goto LABEL_42;
      }
    }

    if (objc_msgSend(*(id *)(v67 + 32), "channelType") == 1)
    {
      objc_msgSend(*(id *)(v67 + 32), "_userFieldsForResponse");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "addEntriesFromDictionary:", v29);

    }
    certificateRef = 0;
    v30 = (__SecIdentity *)v94[3];
    if (v30)
    {
      SecIdentityCopyCertificate(v30, &certificateRef);
      if (certificateRef)
      {
        v31 = (void *)SecCertificateCopyProperties();
        v32 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v126 = v31;
          _os_log_impl(&dword_222CB9000, v32, OS_LOG_TYPE_DEBUG, "The certificate that the device is using to authenticate itself to the server has the following properties: %{public}@", buf, 0xCu);
        }
        CFRelease(certificateRef);

      }
    }
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v66, 100, 0, 0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_alloc(MEMORY[0x24BE60D90]);
    v34 = v98[5];
    v35 = v94[3];
    v36 = v88[5];
    v37 = *((unsigned __int8 *)v84 + 24);
    v38 = *((unsigned __int8 *)v80 + 24);
    objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "rmAccountID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE2(v62) = 0;
    LOWORD(v62) = 1;
    v41 = (void *)objc_msgSend(v33, "initWithURL:data:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isCheckin:isCheckout:isShortTransaction:rmAccountID:", v34, v65, v35, v36, v37 != 0, v38 != 0, v62, v40);

    if (objc_msgSend(MEMORY[0x24BE2A7F0], "shouldSimulateMDMCommunication"))
    {
      objc_msgSend(MEMORY[0x24BE60D90], "emptySuccessResponseBlock");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setSimulatedTransactionBlock:", v42);

    }
    objc_msgSend(v41, "performSynchronously");
    objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = *(void **)(v67 + 32);
    v45 = *(_QWORD *)(v67 + 48);
    objc_msgSend(v43, "rmAccountID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "enrollmentMode");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v67 + 32), "notificationQueue");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_httpErrorFromTransaction:assertion:rmAccountID:enrollmentMode:reauthQueue:", v41, v45, v46, v47, v48);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v49 = (void *)objc_opt_new();
      objc_msgSend(v49, "logErrorEventForTopic:reason:error:details:", *MEMORY[0x24BE2A5B0], CFSTR("Token Update failed"), v10, v66);
    }
    else
    {
      +[MDMEvents sharedInstance](MDMEvents, "sharedInstance");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v67 + 40), "DMCSHA256Hash");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v67 + 32), "memberQueue");
      v51 = objc_claimAutoreleasedReturnValue();
      v68[0] = MEMORY[0x24BDAC760];
      v68[1] = 3221225472;
      v68[2] = __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_60;
      v68[3] = &unk_24EB694A8;
      v68[4] = *(_QWORD *)(v67 + 32);
      v52 = v50;
      v69 = v52;
      v70 = v74;
      dispatch_async_and_wait(v51, v68);

      objc_msgSend(v49, "recordDateForEvent:", CFSTR("PushTokenSentToServerKey"));
      objc_msgSend(v49, "recordData:forEvent:", *(_QWORD *)(v67 + 40), CFSTR("PushTokenDataSentToServerKey"));
      if (v64)
      {
        objc_msgSend(v49, "recordDateForEvent:", CFSTR("UnlockTokenSentToServerDate"));
        v53 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222CB9000, v53, OS_LOG_TYPE_DEFAULT, "Successfully delivered unlock token in TokenUpdate", buf, 2u);
        }
        MDMKeybagDeleteMDMEscrowData();
      }
      v54 = *(id *)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = objc_msgSend(v41, "statusCode");
        *(_DWORD *)buf = 67109120;
        LODWORD(v126) = v55;
        _os_log_impl(&dword_222CB9000, v54, OS_LOG_TYPE_DEFAULT, "Transaction completed. Status: %d", buf, 8u);
      }

    }
    if (v10)
    {
      v56 = *(NSObject **)(DMCLogObjects() + 8);
      v11 = v64;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v126 = v10;
        _os_log_impl(&dword_222CB9000, v56, OS_LOG_TYPE_ERROR, "Cannot tell server of a new push token. Error: %{public}@", buf, 0xCu);
      }
      objc_msgSend(*(id *)(v67 + 32), "_executionQueueScheduleTokenUpdateRetryIfNeeded");
    }
    else
    {
      v10 = 0;
      v11 = v64;
    }
    goto LABEL_66;
  }
  objc_msgSend(*(id *)(v67 + 32), "setExecutionQueueIsCheckinInProgress:", 0);
  if (objc_msgSend(*(id *)(v67 + 32), "_isTokenUpdateScheduled"))
    objc_msgSend(*(id *)(v67 + 32), "_executionQueueScheduleTokenUpdateRetryIfNeeded");
  if ((v4 & 1) == 0)
  {
    v12 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v74 = 0;
      _os_log_impl(&dword_222CB9000, v12, OS_LOG_TYPE_DEFAULT, "Skipped token update due to incomplete migration.", v74, 2u);
    }
    objc_msgSend(*(id *)(v67 + 32), "_listenForCleanupMigrationFinishedNotificaitonAndRetryTokenUpdate");
  }
  v13 = *(_QWORD *)(v67 + 56);
  if (v13)
    (*(void (**)(void))(v13 + 16))();
LABEL_72:
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);

  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v97, 8);

  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(&v109, 8);

  _Block_object_dispose(&v115, 8);
  _Block_object_dispose(&v119, 8);
}

uint64_t __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_43(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "memberQueueIsMDMConfigurationValid");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "memberQueueAccessRights");
  objc_msgSend(*(id *)(a1 + 32), "memberQueueTopic");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "memberQueuePushMagic");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueCheckInURL");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "memberQueueIdentity");
  objc_msgSend(*(id *)(a1 + 32), "memberQueueCheckInPinnedSecCertificateRefs");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "memberQueuePinningRevocationCheckRequired");
  result = objc_msgSend(*(id *)(a1 + 32), "memberQueueSignMessage");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = result;
  return result;
}

uint64_t __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_49(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_memberQueueSetTokenUpdateRequestCount:", 1);
}

uint64_t __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_60(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_memberQueueSetLastPushTokenHash:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_memberQueueDecrementTokenUpdateRequestCount");
  result = objc_msgSend(*(id *)(a1 + 32), "_memberQueueTokenUpdateCount");
  if (result >= 1)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

- (void)_executionQueueScheduleTokenUpdateRetryIfNeeded
{
  char v3;
  NSObject *v4;
  double v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (-[MDMServerCore _tokenUpdateRetryCount](self, "_tokenUpdateRetryCount") > 0)
  {
    -[MDMServerCore _decreaseTokenUpdateRetryCount](self, "_decreaseTokenUpdateRetryCount");
    v3 = DMCHasMDMMigrated();
    v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_DEFAULT, "Will retry token update...", v7, 2u);
      if ((v3 & 1) != 0)
        goto LABEL_4;
    }
    else if ((v3 & 1) != 0)
    {
LABEL_4:
      v5 = 10.0;
LABEL_9:
      -[MDMServerCore _scheduleNextPollWithInterval:](self, "_scheduleNextPollWithInterval:", v5);
      return;
    }
    v5 = 300.0;
    goto LABEL_9;
  }
  v6 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_ERROR, "We've retried enough. Abort...", buf, 2u);
  }
}

- (void)_executionQueuePollServerForCommandWithAssertion:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  NSObject *v25;
  id v26;
  _QWORD v27[6];
  _QWORD block[8];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  __int128 buf;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__10;
  v37 = __Block_byref_object_dispose__10;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  -[MDMServerCore memberQueue](self, "memberQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke;
  block[3] = &unk_24EB69520;
  block[4] = self;
  block[5] = &v39;
  block[6] = &v33;
  block[7] = &v29;
  dispatch_async_and_wait(v8, block);

  if (*((_BYTE *)v40 + 24) && !*((_BYTE *)v30 + 24))
  {
    v14 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v34[5];
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_222CB9000, v14, OS_LOG_TYPE_DEFAULT, "Polling MDM server %{public}@ for next command.", (uint8_t *)&buf, 0xCu);
    }
    -[MDMServerCore _cachedResponse](self, "_cachedResponse");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      -[MDMServerCore _idleResponse](self, "_idleResponse");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    if (-[MDMServerCore userSwitchAlreadyInitiated](self, "userSwitchAlreadyInitiated"))
    {
      v16 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_222CB9000, v16, OS_LOG_TYPE_DEFAULT, "User switch already initiated. Not polling the MDM server for commands right now.", (uint8_t *)&buf, 2u);
      }
      -[MDMServerCore _cachedResponse](self, "_cachedResponse");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17 == 0;

      if (v18)
      {
        -[MDMServerCore _idleResponse](self, "_idleResponse");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MDMServerCore _setCachedResponse:](self, "_setCachedResponse:", v19);

      }
      if (v7)
      {
        dispatch_get_global_queue(0, 0);
        v20 = objc_claimAutoreleasedReturnValue();
        dispatch_async(v20, v7);

      }
    }
    else
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v44 = 0x2020000000;
      v45 = 0;
      -[MDMServerCore memberQueue](self, "memberQueue");
      v21 = objc_claimAutoreleasedReturnValue();
      v27[0] = v9;
      v27[1] = 3221225472;
      v27[2] = __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_61;
      v27[3] = &unk_24EB68168;
      v27[4] = self;
      v27[5] = &buf;
      dispatch_async_and_wait(v21, v27);

      v22 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
      if (v22)
        -[MDMServerCore _scheduleNextPollWithInterval:](self, "_scheduleNextPollWithInterval:", (double)(unint64_t)(120 * v22));
      -[MDMServerCore _setLastPollingAttempt](self, "_setLastPollingAttempt");
      v23[0] = v9;
      v23[1] = 3221225472;
      v23[2] = __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_2;
      v23[3] = &unk_24EB69598;
      v23[4] = self;
      v24 = v6;
      v26 = v7;
      v13 = v13;
      v25 = v13;
      -[MDMServerCore _sendResponse:completionBlock:](self, "_sendResponse:completionBlock:", v13, v23);

      _Block_object_dispose(&buf, 8);
    }
    goto LABEL_7;
  }
  v10 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *((unsigned __int8 *)v40 + 24);
    v12 = *((unsigned __int8 *)v30 + 24);
    LODWORD(buf) = 67240448;
    DWORD1(buf) = v11;
    WORD4(buf) = 1026;
    *(_DWORD *)((char *)&buf + 10) = v12;
    _os_log_impl(&dword_222CB9000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring MDM server poll. Config Valid? %{public}d. Is Uprooting? %{public}d", (uint8_t *)&buf, 0xEu);
  }
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v13, v7);
LABEL_7:

  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
}

uint64_t __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "memberQueueIsMDMConfigurationValid");
  objc_msgSend(*(id *)(a1 + 32), "memberQueueServerURL");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  result = objc_msgSend(*(id *)(a1 + 32), "memberQueueIsUprooting");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_61(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "memberQueuePollingInterval");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "unsignedIntegerValue");

}

void __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "jobQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_3;
  v7[3] = &unk_24EB69570;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v11 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  objc_msgSend(v4, "queueBlock:", v7);

}

void __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_3(id *a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void (**v14)(void);
  id v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  char isKindOfClass;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  int v43;
  NSObject *v44;
  id *v45;
  void (**v46)(void);
  _QWORD v47[5];
  id v48;
  _QWORD v49[5];
  id v50;
  _QWORD block[5];
  id v52;
  id v53;
  uint8_t buf[4];
  _BYTE v55[14];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  objc_msgSend(v2, "rmAccountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrollmentMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "notificationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_httpErrorFromTransaction:assertion:rmAccountID:enrollmentMode:reauthQueue:", v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(NSObject **)(DMCLogObjects() + 8);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v11)
    {
      v15 = a1[5];
      v16 = v10;
      v17 = objc_msgSend(v15, "statusCode");
      objc_msgSend(a1[7], "objectForKeyedSubscript:", CFSTR("CommandUUID"));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      v20 = CFSTR("(Idle)");
      if (v18)
        v20 = (const __CFString *)v18;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v55 = v17;
      *(_WORD *)&v55[4] = 2114;
      *(_QWORD *)&v55[6] = v20;
      _os_log_impl(&dword_222CB9000, v16, OS_LOG_TYPE_DEFAULT, "Transaction completed. Status: %d, ResponseUUID: %{public}@", buf, 0x12u);

    }
    objc_msgSend(a1[4], "_setCachedResponse:", 0);
    v21 = (void *)MEMORY[0x24BDD1770];
    objc_msgSend(a1[5], "responseData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0;
    objc_msgSend(v21, "DMCSafePropertyListWithData:options:format:error:", v22, 0, 0, &v53);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v53;

    objc_msgSend(a1[5], "responseData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "length"))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v27 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v55 = v24;
          _os_log_impl(&dword_222CB9000, v27, OS_LOG_TYPE_ERROR, "Could not parse command. Error: %{public}@", buf, 0xCu);
        }
        v28 = a1[4];
        +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "_setCachedResponse:", v29);

        objc_msgSend(a1[4], "_schedulePollingServerForCommand");
        objc_msgSend(a1[4], "_pollingFailed");
        goto LABEL_26;
      }
    }
    else
    {

    }
    objc_msgSend(a1[5], "responseData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "length"))
    {
      v31 = objc_msgSend(v23, "count");

      if (v31)
      {
        objc_msgSend(a1[4], "_pollingSucceeded");
        v32 = objc_alloc(MEMORY[0x24BE2A868]);
        v33 = a1[4];
        v34 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Command"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("RequestType"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringWithFormat:", CFSTR("Request-%@"), v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "_reasonStringWithReason:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)objc_msgSend(v32, "initWithReason:", v38);

        v40 = a1[4];
        v47[0] = MEMORY[0x24BDAC760];
        v47[1] = 3221225472;
        v47[2] = __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_3_70;
        v47[3] = &unk_24EB69548;
        v47[4] = v40;
        v48 = a1[8];
        objc_msgSend(v40, "_executionQueueHandleRequest:assertion:completionBlock:", v23, v39, v47);

LABEL_28:
        goto LABEL_29;
      }
    }
    else
    {

    }
    v41 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v41, OS_LOG_TYPE_DEFAULT, "Server has no commands for this device.", buf, 2u);
    }
    objc_msgSend(a1[4], "_pollingSucceeded");
    objc_msgSend(a1[7], "objectForKey:", CFSTR("Status"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("NotNow"));

    objc_msgSend(a1[4], "memberQueue");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_65;
      block[3] = &unk_24EB68258;
      block[4] = a1[4];
      v45 = &v52;
      v52 = a1[6];
      dispatch_async(v44, block);
    }
    else
    {
      v49[0] = MEMORY[0x24BDAC760];
      v49[1] = 3221225472;
      v49[2] = __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_2_66;
      v49[3] = &unk_24EB68258;
      v49[4] = a1[4];
      v45 = &v50;
      v50 = a1[6];
      dispatch_barrier_async(v44, v49);
    }

LABEL_26:
    v46 = (void (**)(void))a1[8];
    if (v46)
      v46[2]();
    goto LABEL_28;
  }
  if (v11)
  {
    v12 = v10;
    objc_msgSend(v9, "DMCVerboseDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v55 = v13;
    _os_log_impl(&dword_222CB9000, v12, OS_LOG_TYPE_DEFAULT, "Could not send response to MDM server. Error: %{public}@", buf, 0xCu);

  }
  objc_msgSend(a1[4], "_pollingFailed");
  v14 = (void (**)(void))a1[8];
  if (v14)
    v14[2]();
LABEL_29:

}

void __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_65(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueLastResponseWasNotNow:", 1);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_idleResponse");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_memberQueueSetCachedResponse:", v3);

}

uint64_t __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_2_66(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMemberQueueLastResponseWasNotNow:", 0);
}

uint64_t __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_3_70(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_setCachedResponse:", a2);
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "_schedulePollingServerForCommand");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)sendResponseSynchronously:(id)a3 outStatusCode:(int64_t *)a4 outError:(id *)a5
{
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;

  -[MDMServerCore _sendResponseSynchornously:](self, "_sendResponseSynchornously:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "responseData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "statusCode");
  objc_msgSend(v7, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a5)
    *a5 = objc_retainAutorelease(v10);
  if (a4)
    *a4 = v9;

  return v8;
}

- (void)_sendResponse:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  -[MDMServerCore _transactionForResponse:](self, "_transactionForResponse:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__MDMServerCore__sendResponse_completionBlock___block_invoke;
  v10[3] = &unk_24EB67F18;
  v11 = v7;
  v12 = v6;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v8, "performCompletionBlock:", v10);

}

uint64_t __47__MDMServerCore__sendResponse_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (id)_sendResponseSynchornously:(id)a3
{
  void *v3;

  -[MDMServerCore _transactionForResponse:](self, "_transactionForResponse:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSynchronously");
  return v3;
}

- (id)_transactionForResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD block[10];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;

  v4 = a3;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__10;
  v41 = __Block_byref_object_dispose__10;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__10;
  v27 = __Block_byref_object_dispose__10;
  v28 = 0;
  -[MDMServerCore memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__MDMServerCore__transactionForResponse___block_invoke;
  block[3] = &unk_24EB695C0;
  block[4] = self;
  block[5] = &v43;
  block[6] = &v37;
  block[7] = &v33;
  block[8] = &v29;
  block[9] = &v23;
  dispatch_async_and_wait(v5, block);

  if (-[MDMServerCore channelType](self, "channelType") == 1)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    -[MDMServerCore _userFieldsForResponse](self, "_userFieldsForResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v7);

    v8 = objc_msgSend(v6, "copy");
    v4 = (id)v8;
  }
  -[MDMServerCore _responseDataFromResponseDictionary:](self, "_responseDataFromResponseDictionary:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x24BE60D90]);
  v11 = v24[5];
  v12 = v44[3];
  v13 = v38[5];
  v14 = *((unsigned __int8 *)v34 + 24);
  v15 = *((unsigned __int8 *)v30 + 24);
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rmAccountID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v21) = 0;
  LOWORD(v21) = 0;
  v18 = (void *)objc_msgSend(v10, "initWithURL:data:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isCheckin:isCheckout:isShortTransaction:rmAccountID:", v11, v9, v12, v13, v14 != 0, v15 != 0, v21, v17);

  if (objc_msgSend(MEMORY[0x24BE2A7F0], "shouldSimulateMDMCommunication"))
  {
    objc_msgSend(MEMORY[0x24BE60D90], "emptySuccessResponseBlock");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSimulatedTransactionBlock:", v19);

  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  return v18;
}

void __41__MDMServerCore__transactionForResponse___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "memberQueueIdentity");
  objc_msgSend(*(id *)(a1 + 32), "memberQueueServerPinnedSecCertificateRefs");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "memberQueuePinningRevocationCheckRequired");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "memberQueueSignMessage");
  objc_msgSend(*(id *)(a1 + 32), "memberQueueServerURL");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)_processRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  BOOL v24;

  v8 = a3;
  v9 = a5;
  v10 = objc_alloc(MEMORY[0x24BE2A868]);
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Command"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("RequestType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("ProcessRequest-%@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v10, "initWithReason:", v14);

  -[MDMServerCore jobQueue](self, "jobQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __59__MDMServerCore__processRequest_encodeResponse_completion___block_invoke;
  v20[3] = &unk_24EB69610;
  v20[4] = self;
  v21 = v8;
  v22 = v15;
  v23 = v9;
  v24 = a4;
  v17 = v9;
  v18 = v15;
  v19 = v8;
  objc_msgSend(v16, "fromFunction:enqueueJob:", "-[MDMServerCore _processRequest:encodeResponse:completion:]", v20);

}

void __59__MDMServerCore__processRequest_encodeResponse_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  char v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__MDMServerCore__processRequest_encodeResponse_completion___block_invoke_2;
  v9[3] = &unk_24EB695E8;
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v12 = *(_BYTE *)(a1 + 64);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v11 = v3;
  v8 = v3;
  objc_msgSend(v4, "_executionQueueHandleRequest:assertion:completionBlock:", v5, v6, v9);

}

void __59__MDMServerCore__processRequest_encodeResponse_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "_responseDataFromResponseDictionary:", v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v3 + 16))(v3, 0, v5, 0);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_executionQueueHandleRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  unint64_t v13;
  __objc2_class **v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD block[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__10;
  v38 = __Block_byref_object_dispose__10;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  -[MDMServerCore memberQueue](self, "memberQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__MDMServerCore__executionQueueHandleRequest_assertion_completionBlock___block_invoke;
  block[3] = &unk_24EB69638;
  block[4] = self;
  block[5] = &v34;
  block[6] = &v30;
  dispatch_async_and_wait(v11, block);

  v13 = -[MDMServerCore channelType](self, "channelType");
  if (v13)
  {
    if (v13 != 1)
    {
      v16 = 0;
      goto LABEL_7;
    }
    v14 = &off_24EB671F0;
  }
  else
  {
    v14 = &off_24EB67140;
  }
  v15 = objc_alloc(*v14);
  v16 = (void *)objc_msgSend(v15, "initWithManagingProfileIdentifier:", v35[5]);
LABEL_7:
  objc_msgSend(v16, "setServer:", self);
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("CommandUUID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("Command"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        -[MDMServerCore memberQueue](self, "memberQueue");
        v19 = objc_claimAutoreleasedReturnValue();
        v27[0] = v12;
        v27[1] = 3221225472;
        v27[2] = __72__MDMServerCore__executionQueueHandleRequest_assertion_completionBlock___block_invoke_2;
        v27[3] = &unk_24EB68258;
        v27[4] = self;
        v20 = v17;
        v28 = v20;
        dispatch_async(v19, v27);

        v21 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v41 = v20;
          _os_log_impl(&dword_222CB9000, v21, OS_LOG_TYPE_DEFAULT, "Processing command UUID: %{public}@", buf, 0xCu);
        }
        v22 = v31[3];
        v25[0] = v12;
        v25[1] = 3221225472;
        v25[2] = __72__MDMServerCore__executionQueueHandleRequest_assertion_completionBlock___block_invoke_76;
        v25[3] = &unk_24EB69548;
        v25[4] = self;
        v26 = v10;
        objc_msgSend(v16, "processRequest:accessRights:assertion:completionBlock:", v18, v22, v9, v25);

        v23 = 0;
      }
      else
      {
        v23 = 1;
      }

    }
    else
    {
      v23 = 1;
    }

  }
  else
  {
    v23 = 1;
  }
  if (v10 && v23)
  {
    +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v24);

  }
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

}

uint64_t __72__MDMServerCore__executionQueueHandleRequest_assertion_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueManagingProfileIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  result = objc_msgSend(*(id *)(a1 + 32), "memberQueueAccessRights");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __72__MDMServerCore__executionQueueHandleRequest_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMemberQueueCommandUUID:", *(_QWORD *)(a1 + 40));
}

void __72__MDMServerCore__executionQueueHandleRequest_assertion_completionBlock___block_invoke_76(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseFromBasicResponse:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("Settings"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v18 = v4;
      v19 = v3;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v17 = v6;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v21;
        v12 = *MEMORY[0x24BE61018];
        v13 = *MEMORY[0x24BE60F00];
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v21 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(a1 + 32), "responseFromBasicResponse:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "removeObjectForKey:", CFSTR("CommandUUID"));
            objc_msgSend(v15, "removeObjectForKey:", v12);
            objc_msgSend(v15, "removeObjectForKey:", v13);
            objc_msgSend(v7, "addObject:", v15);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v10);
      }

      v4 = v18;
      objc_msgSend(v18, "setObject:forKey:", v7, CFSTR("Settings"));

      v3 = v19;
      v6 = v17;
    }

  }
  else
  {
    v4 = 0;
  }
  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v4);

}

- (void)notifyNewConfigurationWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG))
    -[MDMServerCore notifyNewConfigurationWithCompletion:].cold.1();
  v6 = objc_alloc(MEMORY[0x24BE2A868]);
  -[MDMServerCore _reasonStringWithReason:](self, "_reasonStringWithReason:", CFSTR("NewConfig"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithReason:", v7);

  -[MDMServerCore jobQueue](self, "jobQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__MDMServerCore_notifyNewConfigurationWithCompletion___block_invoke;
  v12[3] = &unk_24EB69660;
  v13 = v8;
  v14 = v4;
  v12[4] = self;
  v10 = v8;
  v11 = v4;
  objc_msgSend(v9, "fromFunction:enqueueJob:", "-[MDMServerCore notifyNewConfigurationWithCompletion:]", v12);

}

void __54__MDMServerCore_notifyNewConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(void);

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_readConfigurationOutError:isUproot:", 0, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v4[2]();

}

- (void)scheduleTokenUpdateWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG))
    -[MDMServerCore scheduleTokenUpdateWithCompletion:].cold.1();
  -[MDMServerCore jobQueue](self, "jobQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__MDMServerCore_scheduleTokenUpdateWithCompletion___block_invoke;
  v8[3] = &unk_24EB696B0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "fromFunction:enqueueJob:", "-[MDMServerCore scheduleTokenUpdateWithCompletion:]", v8);

}

void __51__MDMServerCore_scheduleTokenUpdateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD block[5];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "memberQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__MDMServerCore_scheduleTokenUpdateWithCompletion___block_invoke_2;
  block[3] = &unk_24EB68230;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v4, block);

  objc_msgSend(*(id *)(a1 + 32), "_cachedResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BE2A7A8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hrnMode");

  if (v8 != 1)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "_idleResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setCachedResponse:", v6);
LABEL_4:

  }
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __51__MDMServerCore_scheduleTokenUpdateWithCompletion___block_invoke_3;
  v12[3] = &unk_24EB69688;
  v10 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = v3;
  v11 = v3;
  objc_msgSend(v10, "_pollFromServerIfNeeded:isReachabilityEvent:completionHandler:", 0, 0, v12);

}

uint64_t __51__MDMServerCore_scheduleTokenUpdateWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_memberQueueIncrementTokenUpdateRequestCount");
}

uint64_t __51__MDMServerCore_scheduleTokenUpdateWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)scheduleTokenUpdateIfNecessaryWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG))
    -[MDMServerCore scheduleTokenUpdateIfNecessaryWithCompletion:].cold.1();
  -[MDMServerCore jobQueue](self, "jobQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__MDMServerCore_scheduleTokenUpdateIfNecessaryWithCompletion___block_invoke;
  v8[3] = &unk_24EB696B0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "fromFunction:enqueueJob:", "-[MDMServerCore scheduleTokenUpdateIfNecessaryWithCompletion:]", v8);

}

void __62__MDMServerCore_scheduleTokenUpdateIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__MDMServerCore_scheduleTokenUpdateIfNecessaryWithCompletion___block_invoke_2;
  v6[3] = &unk_24EB69688;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "_pollFromServerIfNeeded:isReachabilityEvent:completionHandler:", 0, 0, v6);

}

uint64_t __62__MDMServerCore_scheduleTokenUpdateIfNecessaryWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)simulatePushWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG))
    -[MDMServerCore simulatePushWithCompletion:].cold.1();
  -[MDMServerCore jobQueue](self, "jobQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__MDMServerCore_simulatePushWithCompletion___block_invoke;
  v8[3] = &unk_24EB696B0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "fromFunction:enqueueJob:", "-[MDMServerCore simulatePushWithCompletion:]", v8);

}

void __44__MDMServerCore_simulatePushWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__MDMServerCore_simulatePushWithCompletion___block_invoke_2;
  v6[3] = &unk_24EB69688;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "_pollFromServerIfNeeded:isReachabilityEvent:completionHandler:", 1, 0, v6);

}

uint64_t __44__MDMServerCore_simulatePushWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)simulatePushIfNetworkTetheredWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[16];
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG))
    -[MDMServerCore simulatePushIfNetworkTetheredWithCompletion:].cold.1();
  if (DMCDeviceIsNetworkTethered())
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "installedMDMProfileIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[MDMServerCore jobQueue](self, "jobQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __61__MDMServerCore_simulatePushIfNetworkTetheredWithCompletion___block_invoke;
      v15[3] = &unk_24EB696B0;
      v15[4] = self;
      v16 = v4;
      objc_msgSend(v8, "fromFunction:enqueueJob:", "-[MDMServerCore simulatePushIfNetworkTetheredWithCompletion:]", v15);

    }
    else if (v4)
    {
      v13 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CB9000, v13, OS_LOG_TYPE_DEFAULT, "Asked to poll server if tethered, but no MDM installation exists.", buf, 2u);
      }
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "DMCErrorWithDomain:code:descriptionArray:errorType:", v10, 12081, v11, *MEMORY[0x24BE2A588], 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      (*((void (**)(id, void *))v4 + 2))(v4, v12);

  }
}

void __61__MDMServerCore_simulatePushIfNetworkTetheredWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__MDMServerCore_simulatePushIfNetworkTetheredWithCompletion___block_invoke_2;
  v6[3] = &unk_24EB69688;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "_pollFromServerIfNeeded:isReachabilityEvent:completionHandler:", 1, 0, v6);

}

uint64_t __61__MDMServerCore_simulatePushIfNetworkTetheredWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)retryNotNowWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];
  _QWORD v13[5];
  id v14;
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG))
    -[MDMServerCore retryNotNowWithCompletion:].cold.1();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[MDMServerCore memberQueue](self, "memberQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__MDMServerCore_retryNotNowWithCompletion___block_invoke;
  block[3] = &unk_24EB68168;
  block[4] = self;
  block[5] = &v16;
  dispatch_async_and_wait(v6, block);

  -[MDMServerCore _cachedResponse](self, "_cachedResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (v9 = *((unsigned __int8 *)v17 + 24), v8, v9))
  {
    -[MDMServerCore jobQueue](self, "jobQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __43__MDMServerCore_retryNotNowWithCompletion___block_invoke_2;
    v13[3] = &unk_24EB696B0;
    v13[4] = self;
    v14 = v4;
    objc_msgSend(v10, "fromFunction:enqueueJob:", "-[MDMServerCore retryNotNowWithCompletion:]", v13);

  }
  else
  {
    v11 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_222CB9000, v11, OS_LOG_TYPE_INFO, "Last response was not a NotNow. Ignoring poll request.", v12, 2u);
    }
    if (v4)
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }
  _Block_object_dispose(&v16, 8);

}

uint64_t __43__MDMServerCore_retryNotNowWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "memberQueueLastResponseWasNotNow");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __43__MDMServerCore_retryNotNowWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__MDMServerCore_retryNotNowWithCompletion___block_invoke_3;
  v6[3] = &unk_24EB69688;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "_pollFromServerIfNeeded:isReachabilityEvent:completionHandler:", 0, 0, v6);

}

uint64_t __43__MDMServerCore_retryNotNowWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)migrateMDMWithContext:(int)a3 completion:(id)a4
{
  uint64_t v4;
  void (**v6)(id, _QWORD);
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = *(_QWORD *)&a3;
  v6 = (void (**)(id, _QWORD))a4;
  v7 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v7 + 8), OS_LOG_TYPE_DEBUG))
    -[MDMServerCore migrateMDMWithContext:completion:].cold.1();
  v8 = objc_alloc(MEMORY[0x24BE2A868]);
  -[MDMServerCore _reasonStringWithReason:](self, "_reasonStringWithReason:", CFSTR("MigrateMDMWithContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithReason:", v9);

  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "migrateMDMWithContext:", v4);

  if (v6)
    v6[2](v6, 0);

}

- (void)reauthenticationCompleteWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG))
    -[MDMServerCore reauthenticationCompleteWithCompletion:].cold.1();
  -[MDMServerCore _clearCoreFollowup](self, "_clearCoreFollowup");
  -[MDMServerCore _postReauthFollowUpChangedNotification](self, "_postReauthFollowUpChangedNotification");
  -[MDMServerCore simulatePushWithCompletion:](self, "simulatePushWithCompletion:", v4);

}

- (void)uprootMDMWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  MDMServerCore *v20;
  id v21;
  id v22;

  v4 = a3;
  v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG))
    -[MDMServerCore uprootMDMWithCompletion:].cold.1();
  v6 = objc_alloc(MEMORY[0x24BE2A868]);
  -[MDMServerCore _reasonStringWithReason:](self, "_reasonStringWithReason:", CFSTR("UprootMDM"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithReason:", v7);

  +[MDMEvents sharedInstance](MDMEvents, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordDateForEvent:", CFSTR("LastUproot"));

  v10 = (void *)MEMORY[0x24BDBCE70];
  -[MDMServerCore _mdmFilePathForChannelType:](self, "_mdmFilePathForChannelType:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "DMCDictionaryFromFile:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BE60FE8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMServerCore jobQueue](self, "jobQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __41__MDMServerCore_uprootMDMWithCompletion___block_invoke;
  v18[3] = &unk_24EB696D8;
  v19 = v13;
  v20 = self;
  v21 = v8;
  v22 = v4;
  v15 = v8;
  v16 = v4;
  v17 = v13;
  objc_msgSend(v14, "fromFunction:enqueueJob:", "-[MDMServerCore uprootMDMWithCompletion:]", v18);

}

void __41__MDMServerCore_uprootMDMWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  BOOL v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void (**v41)(_QWORD);
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  _QWORD block[5];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  _BYTE v54[128];
  _QWORD v55[4];
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v41 = a2;
  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_INFO, "Uprooting MDM installation", buf, 2u);
  }
  v40 = a1;
  v4 = *(_QWORD *)(a1 + 32);
  v53 = 0;
  v5 = +[MDMDeclarativeManagementCommand unenrollWithProfileIdentifier:error:](MDMDeclarativeManagementCommand, "unenrollWithProfileIdentifier:error:", v4, &v53);
  v6 = v53;
  v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      v8 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v57 = v7;
        _os_log_impl(&dword_222CB9000, v8, OS_LOG_TYPE_ERROR, "Could not execute remote management unenrollment, error: %{public}@", buf, 0xCu);
      }
    }
  }
  v39 = v7;
  objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  +[MDMMCInterface managedAppIDs](MDMMCInterface, "managedAppIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v50 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v16 = (void *)objc_opt_new();
        objc_msgSend(v16, "setBundleIdentifier:", v15);
        v48 = 0;
        v17 = (id)objc_msgSend(v9, "performRequest:error:", v16, &v48);
        v18 = v48;
        if (v18)
        {
          v19 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v57 = v15;
            v58 = 2114;
            v59 = v18;
            _os_log_impl(&dword_222CB9000, v19, OS_LOG_TYPE_ERROR, "Could not stop managing app: %{public}@, error: %{public}@", buf, 0x16u);
          }
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    }
    while (v12);
  }

  objc_msgSend(*(id *)(v40 + 40), "_clearCoreFollowup");
  objc_msgSend(*(id *)(v40 + 40), "_clearMAIDNotification");
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "postNotificationName:object:", *MEMORY[0x24BE61450], 0);

  +[MDMAttestation sharedInstance](MDMAttestation, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "reset");

  objc_msgSend(*(id *)(v40 + 40), "memberQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__MDMServerCore_uprootMDMWithCompletion___block_invoke_94;
  block[3] = &unk_24EB68230;
  block[4] = *(_QWORD *)(v40 + 40);
  dispatch_async_and_wait(v22, block);

  v23 = (void *)objc_opt_new();
  v46 = 0;
  v24 = (id)objc_msgSend(v9, "performRequest:error:", v23, &v46);
  v25 = v46;

  if (v25)
  {
    v26 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v57 = v25;
      _os_log_impl(&dword_222CB9000, v26, OS_LOG_TYPE_ERROR, "Ignoring stop managing books error: %{public}@", buf, 0xCu);
    }
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v40 + 40), "_mdmFilePathForChannelType:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v28;
  objc_msgSend(*(id *)(v40 + 40), "_mdmPropertiesFilePathForChannelType:", objc_msgSend(*(id *)(v40 + 40), "channelType"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v29;
  MDMAppManagementFilePath();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v30;
  objc_msgSend(*(id *)(v40 + 40), "_mdmOutstandingActivitiesFilePathForChannelType:", objc_msgSend(*(id *)(v40 + 40), "channelType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v33 = v32;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v43 != v36)
          objc_enumerationMutation(v33);
        objc_msgSend(v27, "removeItemAtPath:error:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j), 0);
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    }
    while (v35);
  }

  v38 = *(_QWORD *)(v40 + 56);
  if (v38)
    (*(void (**)(uint64_t, _QWORD))(v38 + 16))(v38, 0);
  v41[2](v41);

}

uint64_t __41__MDMServerCore_uprootMDMWithCompletion___block_invoke_94(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_memberQueueSetCachedResponse:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_memberQueueSetTokenUpdateRequestCount:", 0);
}

- (void)processDeviceRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v10 + 8), OS_LOG_TYPE_DEBUG))
    -[MDMServerCore processDeviceRequest:encodeResponse:completion:].cold.1();
  if (os_variant_has_internal_ui())
  {
    -[MDMServerCore _processRequest:encodeResponse:completion:](self, "_processRequest:encodeResponse:completion:", v8, v6, v9);
  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0);
  }

}

- (void)pushTokenWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG))
  {
    -[MDMServerCore pushTokenWithCompletion:].cold.1();
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    v6 = objc_alloc(MEMORY[0x24BE2A840]);
    -[MDMServerCore _reasonStringWithReason:](self, "_reasonStringWithReason:", CFSTR("PushToken"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithReason:", v7);

    -[MDMServerCore jobQueue](self, "jobQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __41__MDMServerCore_pushTokenWithCompletion___block_invoke;
    v11[3] = &unk_24EB69660;
    v11[4] = self;
    v12 = v8;
    v13 = v4;
    v10 = v8;
    objc_msgSend(v9, "fromFunction:enqueueJob:", "-[MDMServerCore pushTokenWithCompletion:]", v11);

  }
LABEL_4:

}

void __41__MDMServerCore_pushTokenWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__10;
  v15 = __Block_byref_object_dispose__10;
  v16 = 0;
  objc_msgSend(*(id *)(a1 + 32), "memberQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__MDMServerCore_pushTokenWithCompletion___block_invoke_2;
  block[3] = &unk_24EB69700;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = &v11;
  dispatch_async_and_wait(v4, block);

  v5 = v12[5];
  v6 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, v5, 0);
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    DMCErrorArray();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x24BE2A728], 12011, v8, *MEMORY[0x24BE2A588], 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v9);

  }
  v3[2](v3);
  _Block_object_dispose(&v11, 8);

}

void __41__MDMServerCore_pushTokenWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "memberQueueIsMDMConfigurationValid"))
  {
    objc_msgSend(*(id *)(a1 + 32), "memberQueuePushToken");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)touchWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG))
  {
    -[MDMServerCore touchWithCompletion:].cold.1();
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    -[MDMServerCore jobQueue](self, "jobQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __37__MDMServerCore_touchWithCompletion___block_invoke;
    v7[3] = &unk_24EB69728;
    v8 = v4;
    objc_msgSend(v6, "fromFunction:enqueueJob:", "-[MDMServerCore touchWithCompletion:]", v7);

  }
LABEL_4:

}

void __37__MDMServerCore_touchWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t, _QWORD);
  void (**v4)(void);

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t, _QWORD))(v2 + 16);
  v4 = a2;
  v3(v2, 0);
  v4[2]();

}

- (void)processUserRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v10 + 8), OS_LOG_TYPE_DEBUG))
    -[MDMServerCore processUserRequest:encodeResponse:completion:].cold.1();
  -[MDMServerCore _processRequest:encodeResponse:completion:](self, "_processRequest:encodeResponse:completion:", v9, v5, v8);

}

- (void)isAwaitingUserConfiguredWithCompletion:(id)a3
{
  void (**v4)(id, BOOL, _QWORD);
  uint64_t v5;

  v4 = (void (**)(id, BOOL, _QWORD))a3;
  v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG))
    -[MDMServerCore isAwaitingUserConfiguredWithCompletion:].cold.1();
  v4[2](v4, -[MDMServerCore _isAwaitingUserConfigured](self, "_isAwaitingUserConfigured"), 0);

}

- (BOOL)_isAwaitingUserConfigured
{
  int v2;

  v2 = objc_msgSend(MEMORY[0x24BE2A820], "awaitUserConfigurationEnabled");
  if (v2)
    LOBYTE(v2) = objc_msgSend(MEMORY[0x24BE2A820], "isCurrentUserConfigured") ^ 1;
  return v2;
}

- (void)depPushTokenWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG))
    -[MDMServerCore depPushTokenWithCompletion:].cold.1();
  -[MDMServerCore depPushTokenManager](self, "depPushTokenManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "depPushToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v7, 0);
}

- (void)syncDEPPushTokenWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG))
    -[MDMServerCore syncDEPPushTokenWithCompletion:].cold.1();
  -[MDMServerCore depPushTokenManager](self, "depPushTokenManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syncDEPPushTokenWithCompletion:", v4);

}

- (BOOL)isAppInstallBlocked
{
  void *v2;
  char v3;

  -[MDMServerCore appInstallBlocker](self, "appInstallBlocker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppInstallBlocked");

  return v3;
}

- (void)blockAppInstallsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MDMServerCore appInstallBlocker](self, "appInstallBlocker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockAppInstallsWithCompletion:", v4);

}

- (void)unblockAppInstallsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MDMServerCore appInstallBlocker](self, "appInstallBlocker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unblockAppInstallsWithCompletion:", v4);

}

- (void)requestInstallOfAppsInRestoreWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t *v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = (void (**)(id, _QWORD))a3;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_DEFAULT, "request install, received request to install all pending applications", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v18 = buf;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__10;
  v21 = __Block_byref_object_dispose__10;
  v22 = 0;
  objc_msgSend(MEMORY[0x24BE2C7E0], "currentUserConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCED8];
  MDMFilePath();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithContentsOfFile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE612E0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)MEMORY[0x24BE51FB0];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__MDMServerCore_requestInstallOfAppsInRestoreWithCompletion___block_invoke;
  v13[3] = &unk_24EB69790;
  v16 = buf;
  v11 = v9;
  v14 = v11;
  v12 = v5;
  v15 = v12;
  objc_msgSend(v10, "enumerateCoordinatorsUsingBlock:", v13);
  if (v3)
    v3[2](v3, *((_QWORD *)v18 + 5));

  _Block_object_dispose(buf, 8);
}

uint64_t __61__MDMServerCore_requestInstallOfAppsInRestoreWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  char v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  char v28;
  NSObject *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  unint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(DMCLogObjects() + 8);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 | v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543362;
      v38 = v5;
      _os_log_impl(&dword_222CB9000, v7, OS_LOG_TYPE_DEFAULT, "request install, enumerating coordinators, coordinator: %{public}@", buf, 0xCu);
    }
    if (v6)
    {
      v9 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v38 = v6;
        _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_ERROR, "request install, unable to enumerate install coordinators: %{public}@", buf, 0xCu);
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
      goto LABEL_10;
    }
    objc_msgSend((id)v5, "bundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v38 = (unint64_t)v12;
      _os_log_impl(&dword_222CB9000, v13, OS_LOG_TYPE_DEFAULT, "request install, enumerating coordinators, coordinator for bundle ID: %{public}@", buf, 0xCu);
    }
    if ((objc_msgSend((id)v5, "conformsToProtocol:", &unk_255789D40) & 1) == 0)
    {
      v19 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CB9000, v19, OS_LOG_TYPE_ERROR, "request install, enumerating coordinators, coordinator is not IXCoordinatorWithAppAssetPromise", buf, 2u);
      }
      goto LABEL_42;
    }
    v14 = (id)v5;
    v36 = 0;
    v15 = objc_msgSend(v14, "appAssetPromiseResponsibleClientWithError:", &v36);
    v16 = v36;
    if (v15 == 23)
    {
      v20 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v38 = (unint64_t)v12;
        _os_log_impl(&dword_222CB9000, v20, OS_LOG_TYPE_DEFAULT, "request install, unable to ask MDM server to install app %{public}@, canceling install coordinator", buf, 0xCu);
      }
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51FA8]), "initWithName:client:diskSpaceNeeded:", v12, 23, 0);
      v22 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v38 = (unint64_t)v21;
        _os_log_impl(&dword_222CB9000, v22, OS_LOG_TYPE_DEFAULT, "request install, enumerating coordinators, promise created: %{public}@", buf, 0xCu);
      }
      v35 = 0;
      v23 = objc_msgSend(v14, "setAppAssetPromise:error:", v21, &v35);
      v24 = v35;
      v25 = DMCLogObjects();
      v26 = *(NSObject **)(v25 + 8);
      if ((v23 & 1) != 0)
      {
        v33 = v24;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222CB9000, v26, OS_LOG_TYPE_DEFAULT, "request install, enumerating coordinators, promise set", buf, 2u);
        }
        IXCreateUserPresentableError();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0;
        v28 = objc_msgSend(v21, "cancelForReason:client:error:", v27, 23, &v34);
        v32 = v34;
        v29 = *(NSObject **)(DMCLogObjects() + 8);
        if ((v28 & 1) != 0)
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_222CB9000, v29, OS_LOG_TYPE_DEFAULT, "request install, enumerating coordinators, promise canceled", buf, 2u);
          }
          v30 = objc_alloc_init(MEMORY[0x24BE2C878]);
          objc_msgSend(v30, "setInternal:", MEMORY[0x24BDBD1C8]);
          objc_msgSend(v30, "setBundleIdentifier:", v12);
          objc_msgSend(v30, "setManagementOptions:", 1);
          objc_msgSend(v30, "setPersonaIdentifier:", *(_QWORD *)(a1 + 32));
          objc_msgSend(*(id *)(a1 + 40), "performRequest:completion:", v30, &__block_literal_global_7);

          v31 = v32;
        }
        else
        {
          v31 = v32;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v38 = (unint64_t)v32;
            _os_log_impl(&dword_222CB9000, v29, OS_LOG_TYPE_ERROR, "request install, unable to cancel app asset promise: %{public}@", buf, 0xCu);
          }
        }

        v24 = v33;
      }
      else if (os_log_type_enabled(*(os_log_t *)(v25 + 8), OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v38 = (unint64_t)v24;
        _os_log_impl(&dword_222CB9000, v26, OS_LOG_TYPE_ERROR, "request install, unable to set app asset promise: %{public}@", buf, 0xCu);
      }

      goto LABEL_41;
    }
    if (v15)
    {
      v17 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v38 = v15;
        v18 = "request install, enumerating coordinators, coordinator does not belong to Device Management, client: %lu";
        goto LABEL_34;
      }
    }
    else
    {
      v17 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v38 = (unint64_t)v16;
        v18 = "request install, unable to determine client for coordinator, skipping: %{public}@";
LABEL_34:
        _os_log_impl(&dword_222CB9000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
      }
    }
LABEL_41:

LABEL_42:
    v10 = 1;
    goto LABEL_11;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v7, OS_LOG_TYPE_DEFAULT, "request install, enumerating coordinators, enumeration done", buf, 2u);
  }
LABEL_10:
  v10 = 0;
LABEL_11:

  return v10;
}

void __61__MDMServerCore_requestInstallOfAppsInRestoreWithCompletion___block_invoke_164(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = v3;
      v5 = "request install, enumerating coordinators, unable to start managing app: %{public}@";
      v6 = v4;
      v7 = OS_LOG_TYPE_ERROR;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_222CB9000, v6, v7, v5, (uint8_t *)&v9, v8);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    v5 = "request install, enumerating coordinators, start managing app request succeeded";
    v6 = v4;
    v7 = OS_LOG_TYPE_DEFAULT;
    v8 = 2;
    goto LABEL_6;
  }

}

- (void)getAssertionDescriptionsWithCompletion:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BE2A868];
    v5 = a3;
    objc_msgSend(v4, "assertionDescriptions");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v6, 0);

  }
}

- (BOOL)_readConfigurationOutError:(id *)a3 isUproot:(BOOL)a4
{
  NSObject *v7;
  char v8;
  _QWORD v10[7];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  -[MDMServerCore memberQueue](self, "memberQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__MDMServerCore__readConfigurationOutError_isUproot___block_invoke;
  v10[3] = &unk_24EB697B8;
  v10[4] = self;
  v10[5] = &v18;
  v11 = a4;
  v10[6] = &v12;
  dispatch_async_and_wait(v7, v10);

  if (a3 && !*((_BYTE *)v19 + 24))
    *a3 = objc_retainAutorelease((id)v13[5]);
  if (!-[MDMServerCore channelType](self, "channelType"))
    -[MDMServerCore _pollOrScheduleNextPollForHRN](self, "_pollOrScheduleNextPollForHRN");
  v8 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __53__MDMServerCore__readConfigurationOutError_isUproot___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_memberQueueForgetCurrentConfiguration");
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshDetailsFromDisk");

  v3 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(*(id *)(a1 + 32), "_mdmFilePathForChannelType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DMCDictionaryFromFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_memberQueueParseMDMConfigurationDict:", v5);
  objc_msgSend(*(id *)(a1 + 32), "_memberQueueSetupAPSConnectionIfNeeeded:valid:", *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v6 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v7 = *(NSObject **)(DMCLogObjects() + 8);
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_222CB9000, v7, OS_LOG_TYPE_INFO, "Valid MDM configuration found.", (uint8_t *)&v16, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_memberQueueStartListeningForInterestingEvents");
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v16 = 138543362;
      v17 = v8;
      _os_log_impl(&dword_222CB9000, v7, OS_LOG_TYPE_ERROR, "No valid MDM installation found. MDM will not listen to push messages. Error: %{public}@", (uint8_t *)&v16, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_memberQueueStopListeningForInterestingEvents");
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_mdmOutstandingActivitiesFilePathForChannelType:", objc_msgSend(*(id *)(a1 + 32), "channelType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeItemAtPath:error:", v10, 0);

    objc_msgSend(*(id *)(a1 + 32), "pushServiceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopListeningForAllMDMPushMessagesWithEnvironment:", 0);

    objc_msgSend(*(id *)(a1 + 32), "pushServiceManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stopListeningForAllMDMPushMessagesWithEnvironment:", 1);

    objc_msgSend(*(id *)(a1 + 32), "_memberQueueForgetCurrentConfiguration");
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "_createBadInstallationError");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueIsMDMConfigurationValid:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

}

- (void)_memberQueueForgetCurrentConfiguration
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_DEFAULT, "MDMDServer: memberQueueForgetCurrentConfiguration.", v4, 2u);
  }
  -[MDMServerCore setMemberQueueIsMDMConfigurationValid:](self, "setMemberQueueIsMDMConfigurationValid:", 0);
  if (-[MDMServerCore memberQueueIdentity](self, "memberQueueIdentity"))
  {
    CFRelease(-[MDMServerCore memberQueueIdentity](self, "memberQueueIdentity"));
    -[MDMServerCore setMemberQueueIdentity:](self, "setMemberQueueIdentity:", 0);
  }
  -[MDMServerCore setMemberQueueAccessRights:](self, "setMemberQueueAccessRights:", 0);
  -[MDMServerCore setMemberQueueCheckInPinnedSecCertificateRefs:](self, "setMemberQueueCheckInPinnedSecCertificateRefs:", 0);
  -[MDMServerCore setMemberQueueCheckInURL:](self, "setMemberQueueCheckInURL:", 0);
  -[MDMServerCore setMemberQueueEnrollmentID:](self, "setMemberQueueEnrollmentID:", 0);
  -[MDMServerCore setMemberQueueIsMDMConfigurationValid:](self, "setMemberQueueIsMDMConfigurationValid:", 0);
  -[MDMServerCore setMemberQueueLastPollingAttempt:](self, "setMemberQueueLastPollingAttempt:", 0);
  -[MDMServerCore setMemberQueueLastPollingAttemptMonotonicTime:](self, "setMemberQueueLastPollingAttemptMonotonicTime:", 0);
  -[MDMServerCore setMemberQueueLastPollingAttemptRTCResetCount:](self, "setMemberQueueLastPollingAttemptRTCResetCount:", 0);
  -[MDMServerCore setMemberQueueLastPollingSuccess:](self, "setMemberQueueLastPollingSuccess:", 0);
  -[MDMServerCore setMemberQueueLastPollingSuccessMonotonicTime:](self, "setMemberQueueLastPollingSuccessMonotonicTime:", 0);
  -[MDMServerCore setMemberQueueLastPollingSuccessRTCResetCount:](self, "setMemberQueueLastPollingSuccessRTCResetCount:", 0);
  -[MDMServerCore setMemberQueueMDMOptions:](self, "setMemberQueueMDMOptions:", 0);
  -[MDMServerCore setMemberQueueManagingProfileIdentifier:](self, "setMemberQueueManagingProfileIdentifier:", 0);
  -[MDMServerCore setMemberQueueOrganizationInfo:](self, "setMemberQueueOrganizationInfo:", 0);
  -[MDMServerCore setMemberQueuePinningRevocationCheckRequired:](self, "setMemberQueuePinningRevocationCheckRequired:", 0);
  -[MDMServerCore setMemberQueuePollingInterval:](self, "setMemberQueuePollingInterval:", 0);
  -[MDMServerCore setMemberQueuePushMagic:](self, "setMemberQueuePushMagic:", 0);
  -[MDMServerCore setMemberQueuePushToken:](self, "setMemberQueuePushToken:", 0);
  -[MDMServerCore setMemberQueueServerPinnedSecCertificateRefs:](self, "setMemberQueueServerPinnedSecCertificateRefs:", 0);
  -[MDMServerCore setMemberQueueServerURL:](self, "setMemberQueueServerURL:", 0);
  -[MDMServerCore setMemberQueueSignMessage:](self, "setMemberQueueSignMessage:", 0);
  -[MDMServerCore setMemberQueueTopic:](self, "setMemberQueueTopic:", 0);
  -[MDMServerCore setMemberQueueUseDevelopmentAPNS:](self, "setMemberQueueUseDevelopmentAPNS:", 0);
  -[MDMServerCore setMemberQueueUseEnrollmentID:](self, "setMemberQueueUseEnrollmentID:", 0);
}

- (BOOL)_memberQueueParseMDMConfigurationDict:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  char v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  char v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  char v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  char v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  char v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  char v108;
  void *v109;
  void *v110;
  uint64_t v111;
  char v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  char v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  char v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  char v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  char v135;
  BOOL v136;
  void *v137;
  void *v138;
  uint64_t v139;
  NSObject *v140;
  const char *v141;
  NSObject *v142;
  os_log_type_t v143;
  uint32_t v144;
  NSObject *v145;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint8_t buf[4];
  void *v154;
  uint64_t v155;

  v155 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    v66 = (void *)MEMORY[0x24BDD1540];
    v67 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = *MEMORY[0x24BE2A588];
    v69 = v66;
    v70 = v67;
    v71 = 12079;
LABEL_35:
    objc_msgSend(v69, "DMCErrorWithDomain:code:descriptionArray:errorType:", v70, v71, v11, v68, 0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    goto LABEL_85;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v72 = (void *)MEMORY[0x24BDD1540];
    v67 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = *MEMORY[0x24BE2A588];
    v69 = v72;
    v70 = v67;
    v71 = 12011;
    goto LABEL_35;
  }
  v5 = *MEMORY[0x24BE60F40];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE60F40]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_83;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_83;
  v7 = (void *)MEMORY[0x24BE2A810];
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personaID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMServerCore setMemberQueueIdentity:](self, "setMemberQueueIdentity:", objc_msgSend(v7, "copyIdentityWithPersistentID:useSystemKeychain:enforcePersonalPersona:", v6, 1, v9 != 0));

  if (!-[MDMServerCore memberQueueIdentity](self, "memberQueueIdentity"))
  {
    v74 = (void *)MEMORY[0x24BDD1540];
    v67 = *MEMORY[0x24BE2A728];
    v151 = 0;
    DMCErrorArray();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = *MEMORY[0x24BE2A588];
    v76 = v74;
    v77 = v67;
    v78 = 12016;
LABEL_84:
    objc_msgSend(v76, "DMCErrorWithDomain:code:descriptionArray:errorType:", v77, v78, v11, v75, v151, v152);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_85;
  }
  v10 = *MEMORY[0x24BE613D8];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE613D8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_97;
  }
  v12 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "personaID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "copyCertificatesWithPersistentIDs:useSystemKeychain:enforcePersonalPersona:", v11, 1, v14 != 0);
  -[MDMServerCore setMemberQueueServerPinnedSecCertificateRefs:](self, "setMemberQueueServerPinnedSecCertificateRefs:", v15);

  v10 = *MEMORY[0x24BE60EF0];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE60EF0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_97;
  }
  v16 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "personaID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "copyCertificatesWithPersistentIDs:useSystemKeychain:enforcePersonalPersona:", v11, 1, v18 != 0);
  -[MDMServerCore setMemberQueueCheckInPinnedSecCertificateRefs:](self, "setMemberQueueCheckInPinnedSecCertificateRefs:", v19);

  v10 = *MEMORY[0x24BE612E8];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE612E8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_97;
  }
  -[MDMServerCore setMemberQueuePinningRevocationCheckRequired:](self, "setMemberQueuePinningRevocationCheckRequired:", objc_msgSend(v11, "BOOLValue"));

  v5 = *MEMORY[0x24BE60FE8];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE60FE8]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMServerCore setMemberQueueManagingProfileIdentifier:](self, "setMemberQueueManagingProfileIdentifier:", v20);

  -[MDMServerCore memberQueueManagingProfileIdentifier](self, "memberQueueManagingProfileIdentifier");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
    goto LABEL_83;
  v22 = (void *)v21;
  -[MDMServerCore memberQueueManagingProfileIdentifier](self, "memberQueueManagingProfileIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_83;
  objc_msgSend(MEMORY[0x24BE2A7A8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "hrnMode");

  switch(v26)
  {
    case 2:
      v5 = *MEMORY[0x24BE612F0];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE612F0]);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMServerCore setMemberQueuePollingInterval:](self, "setMemberQueuePollingInterval:", v79);

      -[MDMServerCore memberQueuePollingInterval](self, "memberQueuePollingInterval");
      v80 = objc_claimAutoreleasedReturnValue();
      if (!v80)
        goto LABEL_83;
      v81 = (void *)v80;
      -[MDMServerCore memberQueuePollingInterval](self, "memberQueuePollingInterval");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v83 = objc_opt_isKindOfClass();

      if ((v83 & 1) == 0)
        goto LABEL_83;
      v5 = *MEMORY[0x24BE60F48];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE60F48]);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMServerCore setMemberQueueLastPollingAttempt:](self, "setMemberQueueLastPollingAttempt:", v84);

      -[MDMServerCore memberQueueLastPollingAttempt](self, "memberQueueLastPollingAttempt");
      v85 = objc_claimAutoreleasedReturnValue();
      if (v85)
      {
        v86 = (void *)v85;
        -[MDMServerCore memberQueueLastPollingAttempt](self, "memberQueueLastPollingAttempt");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v88 = objc_opt_isKindOfClass();

        if ((v88 & 1) == 0)
          goto LABEL_83;
      }
      v5 = *MEMORY[0x24BE60F60];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE60F60]);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMServerCore setMemberQueueLastPollingSuccess:](self, "setMemberQueueLastPollingSuccess:", v89);

      -[MDMServerCore memberQueueLastPollingSuccess](self, "memberQueueLastPollingSuccess");
      v90 = objc_claimAutoreleasedReturnValue();
      if (v90)
      {
        v91 = (void *)v90;
        -[MDMServerCore memberQueueLastPollingSuccess](self, "memberQueueLastPollingSuccess");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v93 = objc_opt_isKindOfClass();

        if ((v93 & 1) == 0)
          goto LABEL_83;
      }
      v5 = *MEMORY[0x24BE60F50];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE60F50]);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMServerCore setMemberQueueLastPollingAttemptMonotonicTime:](self, "setMemberQueueLastPollingAttemptMonotonicTime:", v94);

      -[MDMServerCore memberQueueLastPollingAttemptMonotonicTime](self, "memberQueueLastPollingAttemptMonotonicTime");
      v95 = objc_claimAutoreleasedReturnValue();
      if (v95)
      {
        v96 = (void *)v95;
        -[MDMServerCore memberQueueLastPollingAttemptMonotonicTime](self, "memberQueueLastPollingAttemptMonotonicTime");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v98 = objc_opt_isKindOfClass();

        if ((v98 & 1) == 0)
          goto LABEL_83;
      }
      v5 = *MEMORY[0x24BE60F58];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE60F58]);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMServerCore setMemberQueueLastPollingAttemptRTCResetCount:](self, "setMemberQueueLastPollingAttemptRTCResetCount:", v99);

      -[MDMServerCore memberQueueLastPollingAttemptRTCResetCount](self, "memberQueueLastPollingAttemptRTCResetCount");
      v100 = objc_claimAutoreleasedReturnValue();
      if (v100)
      {
        v101 = (void *)v100;
        -[MDMServerCore memberQueueLastPollingAttemptRTCResetCount](self, "memberQueueLastPollingAttemptRTCResetCount");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v103 = objc_opt_isKindOfClass();

        if ((v103 & 1) == 0)
          goto LABEL_83;
      }
      v5 = *MEMORY[0x24BE60F68];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE60F68]);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMServerCore setMemberQueueLastPollingSuccessMonotonicTime:](self, "setMemberQueueLastPollingSuccessMonotonicTime:", v104);

      -[MDMServerCore memberQueueLastPollingSuccessMonotonicTime](self, "memberQueueLastPollingSuccessMonotonicTime");
      v105 = objc_claimAutoreleasedReturnValue();
      if (v105)
      {
        v106 = (void *)v105;
        -[MDMServerCore memberQueueLastPollingSuccessMonotonicTime](self, "memberQueueLastPollingSuccessMonotonicTime");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v108 = objc_opt_isKindOfClass();

        if ((v108 & 1) == 0)
          goto LABEL_83;
      }
      v5 = *MEMORY[0x24BE60F70];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE60F70]);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMServerCore setMemberQueueLastPollingSuccessRTCResetCount:](self, "setMemberQueueLastPollingSuccessRTCResetCount:", v109);

      -[MDMServerCore memberQueueLastPollingSuccessRTCResetCount](self, "memberQueueLastPollingSuccessRTCResetCount");
      v63 = objc_claimAutoreleasedReturnValue();
      if (v63)
        goto LABEL_32;
      break;
    case 1:
      v5 = *MEMORY[0x24BE61448];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE61448]);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMServerCore setMemberQueueTopic:](self, "setMemberQueueTopic:", v110);

      -[MDMServerCore memberQueueTopic](self, "memberQueueTopic");
      v111 = objc_claimAutoreleasedReturnValue();
      if (!v111)
        goto LABEL_83;
      v64 = (void *)v111;
      -[MDMServerCore memberQueueTopic](self, "memberQueueTopic");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_53:
      objc_opt_class();
      v112 = objc_opt_isKindOfClass();

      if ((v112 & 1) != 0)
        break;
LABEL_83:
      v137 = (void *)MEMORY[0x24BDD1540];
      v67 = *MEMORY[0x24BE2A728];
      v151 = v5;
      v152 = 0;
      DMCErrorArray();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = *MEMORY[0x24BE2A588];
      v76 = v137;
      v77 = v67;
      v78 = 12011;
      goto LABEL_84;
    case 0:
      v5 = *MEMORY[0x24BE61448];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE61448]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMServerCore setMemberQueueTopic:](self, "setMemberQueueTopic:", v27);

      -[MDMServerCore memberQueueTopic](self, "memberQueueTopic");
      v28 = objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v29 = (void *)v28;
        -[MDMServerCore memberQueueTopic](self, "memberQueueTopic");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v31 = objc_opt_isKindOfClass();

        if ((v31 & 1) == 0)
          goto LABEL_83;
      }
      v5 = *MEMORY[0x24BE612F0];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE612F0]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMServerCore setMemberQueuePollingInterval:](self, "setMemberQueuePollingInterval:", v32);

      -[MDMServerCore memberQueuePollingInterval](self, "memberQueuePollingInterval");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v34 = (void *)v33;
        -[MDMServerCore memberQueuePollingInterval](self, "memberQueuePollingInterval");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v36 = objc_opt_isKindOfClass();

        if ((v36 & 1) == 0)
          goto LABEL_83;
      }
      v5 = *MEMORY[0x24BE60F48];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE60F48]);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMServerCore setMemberQueueLastPollingAttempt:](self, "setMemberQueueLastPollingAttempt:", v37);

      -[MDMServerCore memberQueueLastPollingAttempt](self, "memberQueueLastPollingAttempt");
      v38 = objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        v39 = (void *)v38;
        -[MDMServerCore memberQueueLastPollingAttempt](self, "memberQueueLastPollingAttempt");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v41 = objc_opt_isKindOfClass();

        if ((v41 & 1) == 0)
          goto LABEL_83;
      }
      v5 = *MEMORY[0x24BE60F60];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE60F60]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMServerCore setMemberQueueLastPollingSuccess:](self, "setMemberQueueLastPollingSuccess:", v42);

      -[MDMServerCore memberQueueLastPollingSuccess](self, "memberQueueLastPollingSuccess");
      v43 = objc_claimAutoreleasedReturnValue();
      if (v43)
      {
        v44 = (void *)v43;
        -[MDMServerCore memberQueueLastPollingSuccess](self, "memberQueueLastPollingSuccess");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v46 = objc_opt_isKindOfClass();

        if ((v46 & 1) == 0)
          goto LABEL_83;
      }
      v5 = *MEMORY[0x24BE60F50];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE60F50]);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMServerCore setMemberQueueLastPollingAttemptMonotonicTime:](self, "setMemberQueueLastPollingAttemptMonotonicTime:", v47);

      -[MDMServerCore memberQueueLastPollingAttemptMonotonicTime](self, "memberQueueLastPollingAttemptMonotonicTime");
      v48 = objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        v49 = (void *)v48;
        -[MDMServerCore memberQueueLastPollingAttemptMonotonicTime](self, "memberQueueLastPollingAttemptMonotonicTime");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v51 = objc_opt_isKindOfClass();

        if ((v51 & 1) == 0)
          goto LABEL_83;
      }
      v5 = *MEMORY[0x24BE60F58];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE60F58]);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMServerCore setMemberQueueLastPollingAttemptRTCResetCount:](self, "setMemberQueueLastPollingAttemptRTCResetCount:", v52);

      -[MDMServerCore memberQueueLastPollingAttemptRTCResetCount](self, "memberQueueLastPollingAttemptRTCResetCount");
      v53 = objc_claimAutoreleasedReturnValue();
      if (v53)
      {
        v54 = (void *)v53;
        -[MDMServerCore memberQueueLastPollingAttemptRTCResetCount](self, "memberQueueLastPollingAttemptRTCResetCount");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v56 = objc_opt_isKindOfClass();

        if ((v56 & 1) == 0)
          goto LABEL_83;
      }
      v5 = *MEMORY[0x24BE60F68];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE60F68]);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMServerCore setMemberQueueLastPollingSuccessMonotonicTime:](self, "setMemberQueueLastPollingSuccessMonotonicTime:", v57);

      -[MDMServerCore memberQueueLastPollingSuccessMonotonicTime](self, "memberQueueLastPollingSuccessMonotonicTime");
      v58 = objc_claimAutoreleasedReturnValue();
      if (v58)
      {
        v59 = (void *)v58;
        -[MDMServerCore memberQueueLastPollingSuccessMonotonicTime](self, "memberQueueLastPollingSuccessMonotonicTime");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v61 = objc_opt_isKindOfClass();

        if ((v61 & 1) == 0)
          goto LABEL_83;
      }
      v5 = *MEMORY[0x24BE60F70];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE60F70]);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMServerCore setMemberQueueLastPollingSuccessRTCResetCount:](self, "setMemberQueueLastPollingSuccessRTCResetCount:", v62);

      -[MDMServerCore memberQueueLastPollingSuccessRTCResetCount](self, "memberQueueLastPollingSuccessRTCResetCount");
      v63 = objc_claimAutoreleasedReturnValue();
      if (v63)
      {
LABEL_32:
        v64 = (void *)v63;
        -[MDMServerCore memberQueueLastPollingSuccessRTCResetCount](self, "memberQueueLastPollingSuccessRTCResetCount");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_53;
      }
      break;
  }
  v10 = *MEMORY[0x24BE613E0];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE613E0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_97;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_97;
  v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v11);
  -[MDMServerCore setMemberQueueServerURL:](self, "setMemberQueueServerURL:", v113);

  v10 = *MEMORY[0x24BE60EF8];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE60EF8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_97;
    v114 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v11);
    -[MDMServerCore setMemberQueueCheckInURL:](self, "setMemberQueueCheckInURL:", v114);
  }
  else
  {
    -[MDMServerCore memberQueueServerURL](self, "memberQueueServerURL");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = (void *)objc_msgSend(v114, "copy");
    -[MDMServerCore setMemberQueueCheckInURL:](self, "setMemberQueueCheckInURL:", v115);

  }
  v10 = *MEMORY[0x24BE60E18];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE60E18]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_97;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_97;
  -[MDMServerCore setMemberQueueAccessRights:](self, "setMemberQueueAccessRights:", objc_msgSend(v11, "unsignedIntValue"));

  v10 = *MEMORY[0x24BE61458];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE61458]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_97;
  }
  -[MDMServerCore setMemberQueueUseDevelopmentAPNS:](self, "setMemberQueueUseDevelopmentAPNS:", objc_msgSend(v11, "BOOLValue"));

  v10 = *MEMORY[0x24BE61430];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE61430]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_97;
  }
  -[MDMServerCore setMemberQueueSignMessage:](self, "setMemberQueueSignMessage:", objc_msgSend(v11, "BOOLValue"));

  v5 = *MEMORY[0x24BE61398];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE61398]);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMServerCore setMemberQueuePushMagic:](self, "setMemberQueuePushMagic:", v116);

  -[MDMServerCore memberQueuePushMagic](self, "memberQueuePushMagic");
  v117 = objc_claimAutoreleasedReturnValue();
  if (!v117)
    goto LABEL_83;
  v118 = (void *)v117;
  -[MDMServerCore memberQueuePushMagic](self, "memberQueuePushMagic");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v120 = objc_opt_isKindOfClass();

  if ((v120 & 1) == 0)
    goto LABEL_83;
  v5 = *MEMORY[0x24BE61060];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE61060]);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMServerCore setMemberQueueOrganizationInfo:](self, "setMemberQueueOrganizationInfo:", v121);

  -[MDMServerCore memberQueueOrganizationInfo](self, "memberQueueOrganizationInfo");
  v122 = objc_claimAutoreleasedReturnValue();
  if (v122)
  {
    v123 = (void *)v122;
    -[MDMServerCore memberQueueOrganizationInfo](self, "memberQueueOrganizationInfo");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v125 = objc_opt_isKindOfClass();

    if ((v125 & 1) == 0)
      goto LABEL_83;
  }
  v5 = *MEMORY[0x24BE61058];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE61058]);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMServerCore setMemberQueueMDMOptions:](self, "setMemberQueueMDMOptions:", v126);

  -[MDMServerCore memberQueueMDMOptions](self, "memberQueueMDMOptions");
  v127 = objc_claimAutoreleasedReturnValue();
  if (v127)
  {
    v128 = (void *)v127;
    -[MDMServerCore memberQueueMDMOptions](self, "memberQueueMDMOptions");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v130 = objc_opt_isKindOfClass();

    if ((v130 & 1) == 0)
      goto LABEL_83;
  }
  v10 = *MEMORY[0x24BE61470];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE61470]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_97:
      v147 = (void *)MEMORY[0x24BDD1540];
      v67 = *MEMORY[0x24BE2A728];
      DMCErrorArray();
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "DMCErrorWithDomain:code:descriptionArray:errorType:", v67, 12011, v148, *MEMORY[0x24BE2A588], v10, 0);
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_85;
    }
  }
  -[MDMServerCore setMemberQueueUseEnrollmentID:](self, "setMemberQueueUseEnrollmentID:", objc_msgSend(v11, "BOOLValue"));

  v5 = *MEMORY[0x24BE60F00];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE60F00]);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMServerCore setMemberQueueEnrollmentID:](self, "setMemberQueueEnrollmentID:", v131);

  -[MDMServerCore memberQueueEnrollmentID](self, "memberQueueEnrollmentID");
  v132 = objc_claimAutoreleasedReturnValue();
  if (v132)
  {
    v133 = (void *)v132;
    -[MDMServerCore memberQueueEnrollmentID](self, "memberQueueEnrollmentID");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v135 = objc_opt_isKindOfClass();

    if ((v135 & 1) == 0)
      goto LABEL_83;
  }
  if (-[MDMServerCore channelType](self, "channelType") == 1)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE613D0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((!objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad")
       || objc_msgSend(v11, "containsObject:", *MEMORY[0x24BE612D8]))
      && ((objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad") & 1) != 0
       || objc_msgSend(v11, "containsObject:", *MEMORY[0x24BE61468])))
    {

      goto LABEL_82;
    }
    v149 = (void *)MEMORY[0x24BDD1540];
    v67 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "DMCErrorWithDomain:code:descriptionArray:errorType:", v67, 12076, v150, *MEMORY[0x24BE2A588], 0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_85:
    if (!v73)
    {
LABEL_95:
      v136 = 0;
      goto LABEL_96;
    }
    objc_msgSend(v73, "domain");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v138, "isEqualToString:", v67))
    {
      v139 = objc_msgSend(v73, "code");

      if (v139 == 12079)
      {
        v140 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v141 = "No MDM installation found";
          v142 = v140;
          v143 = OS_LOG_TYPE_DEFAULT;
          v144 = 2;
LABEL_93:
          _os_log_impl(&dword_222CB9000, v142, v143, v141, buf, v144);
          goto LABEL_94;
        }
        goto LABEL_94;
      }
    }
    else
    {

    }
    v145 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v154 = v73;
      v141 = "Failed to parse MDM configuration: %{public}@";
      v142 = v145;
      v143 = OS_LOG_TYPE_ERROR;
      v144 = 12;
      goto LABEL_93;
    }
LABEL_94:

    goto LABEL_95;
  }
LABEL_82:
  v136 = 1;
LABEL_96:

  return v136;
}

- (void)_memberQueueWriteDict:(id)a3 toMDMConfigurationFileForChannel:(unint64_t)a4 shouldNotify:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a5;
  v14 = a3;
  -[MDMServerCore _mdmFilePathForChannelType:](self, "_mdmFilePathForChannelType:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 0, 0, 0);

  }
  objc_msgSend(v14, "DMCWriteToBinaryFile:", v8);
  if (!a4)
  {
    objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "refreshDetailsFromDisk");

    if (!v5)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v5)
LABEL_5:
    MDMSendManagingOrgInfoChangedNotification();
LABEL_6:

}

- (void)_memberQueueUpdateMDMConfiguration:(id)a3 organizationInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE61060]);
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE2A4B8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MDMServerCore _memberQueueWriteDict:toMDMConfigurationFileForChannel:shouldNotify:](self, "_memberQueueWriteDict:toMDMConfigurationFileForChannel:shouldNotify:", v10, 0, 1);
    if (v7)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE613B8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE612E0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMServerCore _changeOrganizationNameForRMAccountIdentifier:personaID:organizationName:](self, "_changeOrganizationNameForRMAccountIdentifier:personaID:organizationName:", v8, v9, v7);

    }
  }
  else
  {
    objc_msgSend(v10, "removeObjectForKey:", *MEMORY[0x24BE61060]);
    -[MDMServerCore _memberQueueWriteDict:toMDMConfigurationFileForChannel:shouldNotify:](self, "_memberQueueWriteDict:toMDMConfigurationFileForChannel:shouldNotify:", v10, 0, 1);
  }

}

- (NSDictionary)organizationInfo
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__10;
  v11 = __Block_byref_object_dispose__10;
  v12 = 0;
  -[MDMServerCore memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__MDMServerCore_organizationInfo__block_invoke;
  v6[3] = &unk_24EB68168;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __33__MDMServerCore_organizationInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueOrganizationInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setOrganizationInfo:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[MDMServerCore memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__MDMServerCore_setOrganizationInfo___block_invoke;
  v7[3] = &unk_24EB68258;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __37__MDMServerCore_setOrganizationInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueOrganizationInfo:", *(_QWORD *)(a1 + 40));
  v2 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(*(id *)(a1 + 32), "_mdmFilePathForChannelType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfFile:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_memberQueueUpdateMDMConfiguration:organizationInfo:", v5, *(_QWORD *)(a1 + 40));
    v4 = v5;
  }

}

- (NSDictionary)MDMOptions
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__10;
  v11 = __Block_byref_object_dispose__10;
  v12 = 0;
  -[MDMServerCore memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __27__MDMServerCore_MDMOptions__block_invoke;
  v6[3] = &unk_24EB68168;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __27__MDMServerCore_MDMOptions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueMDMOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setMDMOptions:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  dispatch_semaphore_t v12;
  _QWORD block[5];
  id v14;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[MDMServerCore memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__MDMServerCore_setMDMOptions___block_invoke;
  block[3] = &unk_24EB68258;
  block[4] = self;
  v14 = v4;
  v7 = v4;
  dispatch_barrier_async(v5, block);

  v8 = dispatch_semaphore_create(0);
  -[MDMServerCore memberQueue](self, "memberQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __31__MDMServerCore_setMDMOptions___block_invoke_2;
  v11[3] = &unk_24EB68230;
  v12 = v8;
  v10 = v8;
  dispatch_async(v9, v11);

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
}

void __31__MDMServerCore_setMDMOptions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueMDMOptions:", *(_QWORD *)(a1 + 40));
  v2 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(*(id *)(a1 + 32), "_mdmFilePathForChannelType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfFile:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v6;
  if (v6)
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE61058]);
    else
      objc_msgSend(v6, "removeObjectForKey:", *MEMORY[0x24BE61058]);
    objc_msgSend(*(id *)(a1 + 32), "_memberQueueWriteDict:toMDMConfigurationFileForChannel:shouldNotify:", v6, 0, 1);
    v4 = v6;
  }

}

void __31__MDMServerCore_setMDMOptions___block_invoke_2(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x24BDAC760];
  v1[1] = 3221225472;
  v1[2] = __31__MDMServerCore_setMDMOptions___block_invoke_3;
  v1[3] = &unk_24EB68580;
  v2 = *(id *)(a1 + 32);
  +[MDMFindMyUtilities enableActivationLockWithCompletion:](MDMFindMyUtilities, "enableActivationLockWithCompletion:", v1);

}

intptr_t __31__MDMServerCore_setMDMOptions___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)userSwitchAlreadyInitiated
{
  NSObject *v3;
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad"))
  {
    -[MDMServerCore memberQueue](self, "memberQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __43__MDMServerCore_userSwitchAlreadyInitiated__block_invoke;
    v6[3] = &unk_24EB68168;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_async_and_wait(v3, v6);

  }
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __43__MDMServerCore_userSwitchAlreadyInitiated__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "memberQueueUserSwitchAlreadyInitiated");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setUserSwitchAlreadyInitiated:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[MDMServerCore memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__MDMServerCore_setUserSwitchAlreadyInitiated___block_invoke;
  v6[3] = &unk_24EB697E0;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

uint64_t __47__MDMServerCore_setUserSwitchAlreadyInitiated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMemberQueueUserSwitchAlreadyInitiated:", *(unsigned __int8 *)(a1 + 40));
}

- (NSDictionary)softwareUpdatePathFromDisk
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCE70];
  -[MDMServerCore _mdmFilePathForChannelType:](self, "_mdmFilePathForChannelType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCDictionaryFromFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SoftwareUpdateSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (NSString)organizationName
{
  void *v2;
  void *v3;

  -[MDMServerCore organizationInfo](self, "organizationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE2A4B8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)serverName
{
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__10;
  v11 = __Block_byref_object_dispose__10;
  v12 = 0;
  -[MDMServerCore memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __27__MDMServerCore_serverName__block_invoke;
  v6[3] = &unk_24EB68168;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  objc_msgSend((id)v8[5], "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __27__MDMServerCore_serverName__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueServerURL");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)daemonIdentifier
{
  __CFString *v2;
  __CFString **v3;

  v2 = -[MDMServerCore channelType](self, "channelType");
  if (!v2)
  {
    v3 = kMDMDIdentifier;
    goto LABEL_5;
  }
  if (v2 == (__CFString *)1)
  {
    v3 = kMDMDUserIdentifier;
LABEL_5:
    v2 = *v3;
  }
  return (NSString *)v2;
}

- (void)_executeBlockWhenPushTokenIsAvailable:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD block[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BE2A840]);
  -[MDMServerCore _reasonStringWithReason:](self, "_reasonStringWithReason:", CFSTR("PushToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithReason:", v6);

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__10;
  v26 = __Block_byref_object_dispose__10;
  v27 = 0;
  -[MDMServerCore memberQueue](self, "memberQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke;
  block[3] = &unk_24EB68168;
  block[4] = self;
  block[5] = &v22;
  dispatch_async_and_wait(v8, block);

  if (v23[5]
    || (objc_msgSend(MEMORY[0x24BE2A7A8], "sharedInstance"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "hrnMode") == 1,
        v10,
        !v11))
  {
    if (v4)
    {
      -[MDMServerCore jobQueue](self, "jobQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v9;
      v15[1] = 3221225472;
      v15[2] = __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke_4;
      v15[3] = &unk_24EB69830;
      v16 = v4;
      v17 = &v22;
      objc_msgSend(v14, "queueBlock:", v15);

    }
  }
  else
  {
    v12 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[MDMServerCore _executeBlockWhenPushTokenIsAvailable:]";
      _os_log_impl(&dword_222CB9000, v12, OS_LOG_TYPE_DEFAULT, "%s: Waiting for push token...", buf, 0xCu);
    }
    -[MDMServerCore jobQueue](self, "jobQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke_181;
    v18[3] = &unk_24EB68428;
    v18[4] = self;
    v20 = v4;
    v19 = v7;
    objc_msgSend(v13, "queueBlock:", v18);

  }
  _Block_object_dispose(&v22, 8);

}

void __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueuePushToken");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke_181(id *a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  id location;

  objc_msgSend(a1[4], "executionQueuePushTokenWaitContinuationBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, a1[4]);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke_2;
  v4[3] = &unk_24EB69808;
  objc_copyWeak(&v8, &location);
  v3 = v2;
  v6 = v3;
  v7 = a1[6];
  v5 = a1[5];
  objc_msgSend(a1[4], "setExecutionQueuePushTokenWaitContinuationBlock:", v4);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__10;
    v12 = __Block_byref_object_dispose__10;
    v13 = 0;
    objc_msgSend(WeakRetained, "memberQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke_3;
    v7[3] = &unk_24EB68168;
    v7[4] = v3;
    v7[5] = &v8;
    dispatch_async_and_wait(v4, v7);

    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v9[5]);
    _Block_object_dispose(&v8, 8);

  }
}

void __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueuePushToken");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)_executePushTokenWaitContinuationBlock
{
  void *v3;
  _QWORD v4[5];

  -[MDMServerCore jobQueue](self, "jobQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__MDMServerCore__executePushTokenWaitContinuationBlock__block_invoke;
  v4[3] = &unk_24EB68230;
  v4[4] = self;
  objc_msgSend(v3, "queueBlock:", v4);

}

void __55__MDMServerCore__executePushTokenWaitContinuationBlock__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "executionQueuePushTokenWaitContinuationBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "executionQueuePushTokenWaitContinuationBlock");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setExecutionQueuePushTokenWaitContinuationBlock:", 0);
    v3[2]();

  }
}

- (void)_memberQueueSetupAPSConnectionIfNeeeded:(BOOL)a3 valid:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  int v8;
  void *v9;
  _QWORD v10[5];
  BOOL v11;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BE2A7A8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hrnMode");

  if (v8)
  {
    if (v8 == 1 && !a3)
      -[MDMServerCore _memberQueueSetupAPSConnectionIsMDMConfigurationValid:isUserDaemon:](self, "_memberQueueSetupAPSConnectionIsMDMConfigurationValid:isUserDaemon:", v4, -[MDMServerCore channelType](self, "channelType") == 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2A7A8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __63__MDMServerCore__memberQueueSetupAPSConnectionIfNeeeded_valid___block_invoke;
    v10[3] = &unk_24EB697E0;
    v10[4] = self;
    v11 = a3;
    objc_msgSend(v9, "addDidBecomeReadyKey:callback:", CFSTR("readConfigurationOutError:"), v10);

  }
}

void __63__MDMServerCore__memberQueueSetupAPSConnectionIfNeeeded_valid___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  v4 = 0;
  objc_msgSend(v1, "_readConfigurationOutError:isUproot:", &v4, *(unsigned __int8 *)(a1 + 40));
  v2 = v4;
  if (v2)
  {
    v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v6 = v2;
      _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_ERROR, "No valid MDM configuration found. Error: %{public}@", buf, 0xCu);
    }
  }

}

- (void)_memberQueueSetupAPSConnectionIsMDMConfigurationValid:(BOOL)a3 isUserDaemon:(BOOL)a4
{
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  _QWORD block[5];
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_DEFAULT, "MDMDServerCore has a valid MDM configuration", buf, 2u);
    }
    -[MDMServerCore setMemberQueueIsUprooting:](self, "setMemberQueueIsUprooting:", 0);
    -[MDMServerCore memberQueueTopic](self, "memberQueueTopic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = -[MDMServerCore memberQueueUseDevelopmentAPNS](self, "memberQueueUseDevelopmentAPNS");
      v8 = *(NSObject **)(DMCLogObjects() + 8);
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v9)
        {
          v10 = v8;
          -[MDMServerCore memberQueueTopic](self, "memberQueueTopic");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v33 = v11;
          _os_log_impl(&dword_222CB9000, v10, OS_LOG_TYPE_DEFAULT, "MDMDServerCore using Dev APS, enabling topic: %{public}@", buf, 0xCu);

        }
        -[MDMServerCore pushServiceManager](self, "pushServiceManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MDMServerCore memberQueueTopic](self, "memberQueueTopic");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "startListeningForMDMPushMessageWithTopic:environment:", v13, 1);

        -[MDMServerCore pushServiceManager](self, "pushServiceManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "requestPublicTokenWithEnvironment:", 1);

        -[MDMServerCore pushServiceManager](self, "pushServiceManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = 0;
      }
      else
      {
        if (v9)
        {
          v18 = v8;
          -[MDMServerCore memberQueueTopic](self, "memberQueueTopic");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v33 = v19;
          _os_log_impl(&dword_222CB9000, v18, OS_LOG_TYPE_DEFAULT, "MDMDServerCore using Prod APS, enabling topic: %{public}@", buf, 0xCu);

        }
        -[MDMServerCore pushServiceManager](self, "pushServiceManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[MDMServerCore memberQueueTopic](self, "memberQueueTopic");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "startListeningForMDMPushMessageWithTopic:environment:", v21, 0);

        -[MDMServerCore pushServiceManager](self, "pushServiceManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "requestPublicTokenWithEnvironment:", 0);

        -[MDMServerCore pushServiceManager](self, "pushServiceManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = 1;
      }
      objc_msgSend(v15, "stopListeningForAllMDMPushMessagesWithEnvironment:", v17);

    }
    if (objc_msgSend(MEMORY[0x24BE2A7F0], "fakePushToken"))
    {
      v23 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CB9000, v23, OS_LOG_TYPE_DEFAULT, "Using fake push token for this device...", buf, 2u);
      }
      objc_msgSend(CFSTR("FakePushToken"), "dataUsingEncoding:", 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMServerCore setMemberQueuePushToken:](self, "setMemberQueuePushToken:", v24);

    }
    -[MDMServerCore memberQueuePushToken](self, "memberQueuePushToken");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[MDMServerCore _memberQueueLastPushTokenHash](self, "_memberQueueLastPushTokenHash");
      v26 = objc_claimAutoreleasedReturnValue();
      -[MDMServerCore memberQueuePushToken](self, "memberQueuePushToken");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "DMCSHA256Hash");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if ((-[NSObject isEqualToData:](v26, "isEqualToData:", v28) & 1) == 0)
      {
        -[MDMServerCore memberQueuePushToken](self, "memberQueuePushToken");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[MDMServerCore _memberQueueLogLatestPushTokenIfNeeded:](self, "_memberQueueLogLatestPushTokenIfNeeded:", v29);

      }
    }
    else
    {
      v30 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CB9000, v30, OS_LOG_TYPE_DEFAULT, "MDMDServerCore waiting for push token to be assigned to this device...", buf, 2u);
      }
      dispatch_get_global_queue(0, 0);
      v26 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __84__MDMServerCore__memberQueueSetupAPSConnectionIsMDMConfigurationValid_isUserDaemon___block_invoke;
      block[3] = &unk_24EB68230;
      block[4] = self;
      dispatch_async(v26, block);
    }

  }
}

uint64_t __84__MDMServerCore__memberQueueSetupAPSConnectionIsMDMConfigurationValid_isUserDaemon___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeBlockWhenPushTokenIsAvailable:", 0);
}

- (id)_memberQueuePushMagicMismatchDateMarker
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCED8];
  -[MDMServerCore _mdmFilePathForChannelType:](self, "_mdmFilePathForChannelType:", -[MDMServerCore channelType](self, "channelType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE613A0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_memberQueueSetPushMagicMismatchDateMarker:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  -[MDMServerCore _mdmFilePathForChannelType:](self, "_mdmFilePathForChannelType:", -[MDMServerCore channelType](self, "channelType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithContentsOfFile:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE613A0]);
  -[MDMServerCore _memberQueueWriteDict:toMDMConfigurationFileForChannel:shouldNotify:](self, "_memberQueueWriteDict:toMDMConfigurationFileForChannel:shouldNotify:", v7, -[MDMServerCore channelType](self, "channelType"), 0);

}

- (void)_memberQueueLogLatestPushTokenIfNeeded:(id)a3
{
  __CFString *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  -[MDMServerCore memberQueueLastLoggedPushToken](self, "memberQueueLastLoggedPushToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[__CFString isEqualToData:](v4, "isEqualToData:", v5);

  if ((v6 & 1) == 0)
  {
    -[MDMServerCore setMemberQueueLastLoggedPushToken:](self, "setMemberQueueLastLoggedPushToken:", v4);
    v7 = (void *)objc_opt_new();
    v8 = *MEMORY[0x24BE2A5B0];
    if (v4)
      v9 = v4;
    else
      v9 = &stru_24EB6A400;
    v12[0] = CFSTR("Token");
    v12[1] = CFSTR("Channel");
    v13[0] = v9;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MDMServerCore channelType](self, "channelType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logRegularEventForTopic:reason:details:", v8, CFSTR("New Push Token Received"), v11);

  }
}

- (BOOL)_shouldListenToEnvironment:(unint64_t)a3
{
  NSObject *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[MDMServerCore memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__MDMServerCore__shouldListenToEnvironment___block_invoke;
  block[3] = &unk_24EB69858;
  block[4] = self;
  block[5] = &v8;
  block[6] = a3;
  dispatch_async_and_wait(v5, block);

  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return a3;
}

uint64_t __44__MDMServerCore__shouldListenToEnvironment___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "memberQueueUseDevelopmentAPNS");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(a1 + 48) == result;
  return result;
}

- (void)pushServiceManager:(id)a3 didReceivePublicToken:(id)a4 forEnvironment:(unint64_t)a5
{
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  MDMServerCore *v11;

  v7 = a4;
  if (-[MDMServerCore _shouldListenToEnvironment:](self, "_shouldListenToEnvironment:", a5))
  {
    -[MDMServerCore jobQueue](self, "jobQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke;
    v9[3] = &unk_24EB68258;
    v10 = v7;
    v11 = self;
    objc_msgSend(v8, "queueBlock:", v9);

  }
}

void __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int8x16_t v18;
  _QWORD v19[5];
  uint8_t v20[16];
  _QWORD v21[5];
  id v22;
  id v23;
  _BYTE *v24;
  _QWORD block[4];
  int8x16_t v26;
  _BYTE buf[24];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v2, OS_LOG_TYPE_DEFAULT, "Push token received.", buf, 2u);
  }
  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v3;
    objc_msgSend(v4, "memberQueueTopic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "memberQueuePushMagic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2114;
    v28 = v8;
    _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_DEFAULT, "Push token data: '%{public}@' Topic: '%{public}@' Magic: '%{public}@'", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "memberQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke_192;
  block[3] = &unk_24EB68258;
  v18 = *(int8x16_t *)(a1 + 32);
  v11 = (id)v18.i64[0];
  v26 = vextq_s8(v18, v18, 8uLL);
  dispatch_async_and_wait(v9, block);

  objc_msgSend(*(id *)(a1 + 40), "_executePushTokenWaitContinuationBlock");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v28) = 0;
  objc_msgSend(*(id *)(a1 + 32), "DMCSHA256Hash");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "memberQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke_2;
  v21[3] = &unk_24EB69880;
  v21[4] = *(_QWORD *)(a1 + 40);
  v14 = v12;
  v22 = v14;
  v23 = *(id *)(a1 + 32);
  v24 = buf;
  dispatch_async_and_wait(v13, v21);

  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    v15 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_222CB9000, v15, OS_LOG_TYPE_DEBUG, "Push token is new, need to update", v20, 2u);
    }
    objc_msgSend(*(id *)(a1 + 40), "jobQueue", *(_OWORD *)&v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke_2_193;
    v19[3] = &unk_24EB69408;
    v19[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v16, "fromFunction:enqueueJob:", "-[MDMServerCore pushServiceManager:didReceivePublicToken:forEnvironment:]_block_invoke", v19);

  }
  else
  {
    v17 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_222CB9000, v17, OS_LOG_TYPE_DEBUG, "Push token is not new, don't need to update", v20, 2u);
    }
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke_192(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMemberQueuePushToken:", *(_QWORD *)(a1 + 40));
}

void __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_memberQueueLastPushTokenHash");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToData:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_memberQueueLogLatestPushTokenIfNeeded:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_memberQueueIncrementTokenUpdateRequestCount");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

void __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke_2_193(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke_3;
  v6[3] = &unk_24EB693E0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_pollFromServerIfNeeded:isReachabilityEvent:completionHandler:", 0, 0, v6);

}

uint64_t __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)pushServiceManager:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5 environment:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  int v20;
  uint64_t v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  char isKindOfClass;
  void *v26;
  char v27;
  void *v28;
  NSObject *v29;
  int v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  double v38;
  double v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  _QWORD v49[5];
  _QWORD v50[5];
  id v51;
  _QWORD v52[6];
  _QWORD block[8];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint8_t v64[4];
  uint64_t v65;
  __int16 v66;
  double v67;
  __int128 v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  __int128 buf;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (-[MDMServerCore _shouldListenToEnvironment:](self, "_shouldListenToEnvironment:", a6))
  {
    v13 = objc_alloc(MEMORY[0x24BE2A868]);
    -[MDMServerCore _reasonStringWithReason:](self, "_reasonStringWithReason:", CFSTR("ReceivedMessageForTopic"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v13, "initWithReason:", v14);

    v15 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_222CB9000, v15, OS_LOG_TYPE_DEFAULT, "Received push notification.", (uint8_t *)&buf, 2u);
    }
    v16 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_222CB9000, v16, OS_LOG_TYPE_DEBUG, "Push notification data: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__10;
    v76 = __Block_byref_object_dispose__10;
    v77 = 0;
    v58 = 0;
    v59 = &v58;
    v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__10;
    v62 = __Block_byref_object_dispose__10;
    v63 = 0;
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v57 = 0;
    -[MDMServerCore memberQueue](self, "memberQueue", v47);
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke;
    block[3] = &unk_24EB69520;
    block[4] = self;
    block[5] = &buf;
    block[6] = &v58;
    block[7] = &v54;
    dispatch_async_and_wait(v17, block);

    if (*((_BYTE *)v55 + 24))
    {
      v18 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v68) = 0;
        _os_log_impl(&dword_222CB9000, v18, OS_LOG_TYPE_DEFAULT, "Ignoring push notification because MDM uproot already began", (uint8_t *)&v68, 2u);
      }
      v19 = 0;
      v20 = 0;
      goto LABEL_43;
    }
    if ((objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40)) & 1) != 0)
    {
      v21 = *MEMORY[0x24BE61390];
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BE61390]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22 == 0;

      if (v23)
      {
        v32 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v68) = 138543362;
          *(_QWORD *)((char *)&v68 + 4) = v21;
          _os_log_impl(&dword_222CB9000, v32, OS_LOG_TYPE_ERROR, "Rejecting MDM push dictionary because it does not contain the \"%{public}@\" key", (uint8_t *)&v68, 0xCu);
        }
        v19 = 0;
        v20 = 0;
      }
      else
      {
        objc_msgSend(v12, "objectForKey:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v12, "objectForKey:", v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isEqualToString:", v59[5]);

          if ((v27 & 1) != 0)
          {
            if ((unint64_t)objc_msgSend(v12, "count") >= 2)
            {
              v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v12);
              objc_msgSend(v28, "removeObjectForKey:", v21);
              v29 = *(NSObject **)(DMCLogObjects() + 8);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                LODWORD(v68) = 138543362;
                *(_QWORD *)((char *)&v68 + 4) = v28;
                _os_log_impl(&dword_222CB9000, v29, OS_LOG_TYPE_INFO, "Ignoring extra keys in push dictionary: %{public}@", (uint8_t *)&v68, 0xCu);
              }

            }
            v20 = 0;
            v19 = 0;
            v30 = 1;
            goto LABEL_45;
          }
          v34 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v68) = 0;
            _os_log_impl(&dword_222CB9000, v34, OS_LOG_TYPE_ERROR, "Rejecting MDM push dictionary because it does not have the right magic string.", (uint8_t *)&v68, 2u);
          }
          *(_QWORD *)&v68 = 0;
          *((_QWORD *)&v68 + 1) = &v68;
          v69 = 0x3032000000;
          v70 = __Block_byref_object_copy__10;
          v71 = __Block_byref_object_dispose__10;
          v72 = 0;
          -[MDMServerCore memberQueue](self, "memberQueue");
          v35 = objc_claimAutoreleasedReturnValue();
          v52[0] = MEMORY[0x24BDAC760];
          v52[1] = 3221225472;
          v52[2] = __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke_196;
          v52[3] = &unk_24EB68168;
          v52[4] = self;
          v52[5] = &v68;
          dispatch_async_and_wait(v35, v52);

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v36 = *(NSObject **)(DMCLogObjects() + 8);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              v37 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 40);
              *(_DWORD *)v64 = 138543362;
              v65 = v37;
              _os_log_impl(&dword_222CB9000, v36, OS_LOG_TYPE_DEFAULT, "Push magic mismatch marker already exists with date: %{public}@", v64, 0xCu);
            }
            objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 40), "timeIntervalSinceNow");
            v39 = v38;
            if (v38 < -90000.0)
            {
              v40 = *(NSObject **)(DMCLogObjects() + 8);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v64 = 134218240;
                v65 = 0x40F5F90000000000;
                v66 = 2048;
                v67 = -v39;
                _os_log_impl(&dword_222CB9000, v40, OS_LOG_TYPE_DEFAULT, "Existing push magic mismatch marker is older than %f seconds (%f seconds old), scheduling token update", v64, 0x16u);
              }
              objc_msgSend(MEMORY[0x24BE60D60], "sharedClient");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "scheduleTokenUpdate");

              v19 = 0;
              v20 = 1;
              goto LABEL_42;
            }
            v19 = 0;
          }
          else
          {
            v42 = *(id *)(DMCLogObjects() + 8);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(MEMORY[0x24BDBCE60], "date");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v64 = 138543362;
              v65 = (uint64_t)v43;
              _os_log_impl(&dword_222CB9000, v42, OS_LOG_TYPE_DEFAULT, "Setting push magic mismatch marker with date: %{public}@", v64, 0xCu);

            }
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v19 = (id)objc_claimAutoreleasedReturnValue();
          }
          v20 = 0;
LABEL_42:
          _Block_object_dispose(&v68, 8);

          goto LABEL_43;
        }
        v33 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v68) = 138543362;
          *(_QWORD *)((char *)&v68 + 4) = v21;
          _os_log_impl(&dword_222CB9000, v33, OS_LOG_TYPE_ERROR, "Rejecting MDM push dictionary because the \"%{public}@\" key is not a string.", (uint8_t *)&v68, 0xCu);
        }
        v19 = 0;
        v20 = 0;
      }
    }
    else
    {
      v31 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v68) = 138543362;
        *(_QWORD *)((char *)&v68 + 4) = v11;
        _os_log_impl(&dword_222CB9000, v31, OS_LOG_TYPE_ERROR, "Ignoring push notification with mismatched topic: %{public}@", (uint8_t *)&v68, 0xCu);
      }
      v19 = 0;
      v20 = 0;
    }
LABEL_43:
    v30 = 0;
    if ((v20 & 1) == 0 && !v19)
    {
LABEL_47:
      objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "isUserEnrollment");
      MDMAnalyticsSendPushEvent();

      _Block_object_dispose(&v54, 8);
      _Block_object_dispose(&v58, 8);

      _Block_object_dispose(&buf, 8);
      goto LABEL_48;
    }
LABEL_45:
    -[MDMServerCore memberQueue](self, "memberQueue");
    v44 = objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke_198;
    v50[3] = &unk_24EB68258;
    v50[4] = self;
    v19 = v19;
    v51 = v19;
    dispatch_barrier_async(v44, v50);

    if ((v30 | v20) == 1)
    {
      -[MDMServerCore jobQueue](self, "jobQueue");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x24BDAC760];
      v49[1] = 3221225472;
      v49[2] = __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke_2;
      v49[3] = &unk_24EB69408;
      v49[4] = self;
      objc_msgSend(v45, "fromFunction:enqueueJob:", "-[MDMServerCore pushServiceManager:didReceiveMessageForTopic:userInfo:environment:]", v49);

    }
    goto LABEL_47;
  }
LABEL_48:

}

uint64_t __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueTopic");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "memberQueuePushMagic");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  result = objc_msgSend(*(id *)(a1 + 32), "memberQueueIsUprooting");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke_196(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_memberQueuePushMagicMismatchDateMarker");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke_198(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_memberQueueSetPushMagicMismatchDateMarker:", *(_QWORD *)(a1 + 40));
}

void __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke_3;
  v6[3] = &unk_24EB693E0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_pollFromServerIfNeeded:isReachabilityEvent:completionHandler:", 1, 0, v6);

}

uint64_t __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_httpErrorFromTransaction:(id)a3 assertion:(id)a4 rmAccountID:(id)a5 enrollmentMode:(id)a6 reauthQueue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = objc_msgSend(v12, "statusCode");
    switch(v18)
    {
      case 410:
        if (-[MDMServerCore _handleHTTPStatusGoneResponse](self, "_handleHTTPStatusGoneResponse"))
        {
          -[MDMServerCore _processTraditionalErrorFromTransaction:](self, "_processTraditionalErrorFromTransaction:", v12);
          v20 = objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
        break;
      case 403:
        objc_msgSend(v12, "error");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "code");

        if (v23 == 23008)
        {
          v24 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v26) = 0;
            _os_log_impl(&dword_222CB9000, v24, OS_LOG_TYPE_DEFAULT, "Received 403 with UnrecognizedDevice error for transaction", (uint8_t *)&v26, 2u);
          }
          goto LABEL_16;
        }
        break;
      case 401:
        v19 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v26 = 138543362;
          v27 = v15;
          _os_log_impl(&dword_222CB9000, v19, OS_LOG_TYPE_DEFAULT, "Received 401 for transaction. EnrollmentMode: %{public}@", (uint8_t *)&v26, 0xCu);
        }
        if (v15 && !objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BE60F18]))
        {
          -[MDMServerCore _processUserChannelUnauthorizedFromTransaction:rmAccountID:reauthQueue:](self, "_processUserChannelUnauthorizedFromTransaction:rmAccountID:reauthQueue:", v12, v14, v16);
          v20 = objc_claimAutoreleasedReturnValue();
LABEL_18:
          v21 = (void *)v20;
          goto LABEL_19;
        }
LABEL_16:
        -[MDMServerCore _processTraditionalUnauthorizedFromTransaction:assertion:](self, "_processTraditionalUnauthorizedFromTransaction:assertion:", v12, v13);
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
    }
    objc_msgSend(v12, "error");
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v21 = 0;
LABEL_19:

  return v21;
}

- (BOOL)_handleHTTPStatusGoneResponse
{
  unint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = -[MDMServerCore channelType](self, "channelType");
  if (v2 == 1)
  {
    v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_DEFAULT, "MDM server returned 410 response, does not want to manage the current user.", v5, 2u);
    }
  }
  return v2 == 1;
}

- (id)_processTraditionalErrorFromTransaction:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "isCheckIn"))
    -[MDMServerCore _setTokenUpdateRequestCountToZero](self, "_setTokenUpdateRequestCountToZero");
  else
    -[MDMServerCore _clearCachedResponse](self, "_clearCachedResponse");
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_processTraditionalUnauthorizedFromTransaction:(id)a3 assertion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isCheckIn"))
  {
    v8 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      objc_msgSend(v6, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "DMCVerboseDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v11;
      _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_ERROR, "Cannot tell MDM server about updated token. Error: %{public}@", (uint8_t *)&v18, 0xCu);

    }
  }
  v12 = (void *)objc_opt_new();
  v13 = *MEMORY[0x24BE2A5B8];
  objc_msgSend(MEMORY[0x24BE60D90], "unauthorizedByServerError");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logErrorEventForTopic:reason:error:details:", v13, CFSTR("Received 401 / 403(code: Unrecognized) error from server"), v14, 0);

  -[MDMServerCore _executionQueueRemoveMDMProfileWithAssertion:](self, "_executionQueueRemoveMDMProfileWithAssertion:", v7);
  v15 = -[MDMServerCore _processTraditionalErrorFromTransaction:](self, "_processTraditionalErrorFromTransaction:", v6);
  objc_msgSend(MEMORY[0x24BE60D90], "unauthorizedByServerError");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_processUserChannelUnauthorizedFromTransaction:(id)a3 rmAccountID:(id)a4 reauthQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;
  void *v19;
  id v20;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v23 = 0;
    objc_msgSend(MEMORY[0x24BE60D40], "rmAccountWithIdentifier:fromStore:error:", v9, 0, &v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v23;
    v13 = v12;
    if (v11)
    {
      objc_msgSend(v8, "responseHeaders");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE2A5E0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = 0;
      v16 = objc_msgSend(MEMORY[0x24BE60D48], "enrollmentMethodFromAuthenticateString:outParams:", v15, &v22);
      v17 = v22;
      if (v16 > 5 || ((1 << v16) & 0x26) == 0)
      {
        objc_msgSend(v8, "error");
        v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v11, "username");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MDMServerCore _processUnauthorizedFromTransaction:authParams:rmAccountID:rmAccountUsername:reauthQueue:](self, "_processUnauthorizedFromTransaction:authParams:rmAccountID:rmAccountUsername:reauthQueue:", v8, v17, v9, v19, v10);
        v20 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v20 = v12;
    }

  }
  else
  {
    objc_msgSend(v8, "error");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (void)_executionQueueRemoveMDMProfileWithAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];
  _QWORD block[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  -[MDMServerCore memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__MDMServerCore__executionQueueRemoveMDMProfileWithAssertion___block_invoke;
  block[3] = &unk_24EB69520;
  block[4] = self;
  block[5] = &v22;
  block[6] = &v12;
  block[7] = &v18;
  dispatch_async_and_wait(v5, block);

  if (*((_BYTE *)v19 + 24))
  {
    v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_DEFAULT, "MDMServerCore ignoring extraneous remove MDM profile request", v10, 2u);
    }
  }
  else if (*((_BYTE *)v23 + 24))
  {
    v7 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_222CB9000, v7, OS_LOG_TYPE_DEFAULT, "MDMServerCore removing MDM profile...", v10, 2u);
    }
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setProfileIdentifier:", v13[5]);
    objc_msgSend(v8, "setType:", 0);
    objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "performRequest:completion:", v8, &__block_literal_global_206);

    -[MDMServerCore _readConfigurationOutError:isUproot:](self, "_readConfigurationOutError:isUproot:", 0, 1);
    -[MDMServerCore _setTokenUpdateRequestCountToZero](self, "_setTokenUpdateRequestCountToZero");
    -[MDMServerCore _clearCachedResponse](self, "_clearCachedResponse");

  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

}

void __62__MDMServerCore__executionQueueRemoveMDMProfileWithAssertion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "memberQueueIsMDMConfigurationValid");
  objc_msgSend(*(id *)(a1 + 32), "memberQueueManagingProfileIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "memberQueueIsUprooting"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "pushServiceManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stopListeningForAllMDMPushMessagesWithEnvironment:", 0);

      objc_msgSend(*(id *)(a1 + 32), "pushServiceManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stopListeningForAllMDMPushMessagesWithEnvironment:", 1);

      objc_msgSend(*(id *)(a1 + 32), "setMemberQueueIsUprooting:", 1);
    }
  }
}

void __62__MDMServerCore__executionQueueRemoveMDMProfileWithAssertion___block_invoke_204(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_ERROR, "MDMServerCore could not remove MDM profile. Error: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }

}

- (id)_processUnauthorizedFromTransaction:(id)a3 authParams:(id)a4 rmAccountID:(id)a5 rmAccountUsername:(id)a6 reauthQueue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  NSObject *v23;
  void *v24;
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "authenticator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "conformsToProtocol:", &unk_255789F68) & 1) == 0)
  {
    v19 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      v20 = "Error refreshing Bearer token";
      v21 = v19;
      v22 = 2;
LABEL_10:
      _os_log_impl(&dword_222CB9000, v21, OS_LOG_TYPE_ERROR, v20, v26, v22);
    }
LABEL_11:
    objc_msgSend(v12, "error", *(_OWORD *)v26);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if ((objc_msgSend(v17, "validAuthParams:", v13) & 1) == 0)
  {
    v23 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v26 = 138543362;
      *(_QWORD *)&v26[4] = v13;
      v20 = "Invalid Bearer token refresh params: %{public}@";
      v21 = v23;
      v22 = 12;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if ((objc_msgSend(v17, "canRefreshToken") & 1) != 0)
    -[MDMServerCore _triggerRefreshTokenForTransaction:authenticator:authParams:rmAccountID:rmAccountUsername:reauthQueue:](self, "_triggerRefreshTokenForTransaction:authenticator:authParams:rmAccountID:rmAccountUsername:reauthQueue:", v12, v17, v13, v14, v15, v16);
  else
    -[MDMServerCore _triggerReauthenticationForTransaction:authenticator:authParams:rmAccountID:rmAccountUsername:](self, "_triggerReauthenticationForTransaction:authenticator:authParams:rmAccountID:rmAccountUsername:", v12, v17, v13, v14, v15);
  v18 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v24 = (void *)v18;

  return v24;
}

- (id)_triggerReauthenticationForTransaction:(id)a3 authenticator:(id)a4 authParams:(id)a5 rmAccountID:(id)a6 rmAccountUsername:(id)a7
{
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v19;

  v11 = a4;
  v12 = a7;
  v19 = 0;
  objc_msgSend(v11, "prepareForReauthenticationWithAuthParams:accountID:error:", a5, a6, &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v19;
  v15 = v14;
  if (v13)
  {
    objc_opt_class();
    -[MDMServerCore _presentFollowUpForAuthURL:accountUsername:isMAIDAccount:](self, "_presentFollowUpForAuthURL:accountUsername:isMAIDAccount:", v13, v12, objc_opt_isKindOfClass() & 1);
    -[MDMServerCore _postReauthFollowUpChangedNotification](self, "_postReauthFollowUpChangedNotification");
    objc_msgSend(MEMORY[0x24BE60D90], "reauthRequiredThirdPartyError");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = v14;
  }
  v17 = v16;

  return v17;
}

- (id)_triggerRefreshTokenForTransaction:(id)a3 authenticator:(id)a4 authParams:(id)a5 rmAccountID:(id)a6 rmAccountUsername:(id)a7 reauthQueue:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id buf;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v30 = a7;
  v18 = a8;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__10;
  v46 = __Block_byref_object_dispose__10;
  v47 = 0;
  v19 = (void *)objc_opt_new();
  v20 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __119__MDMServerCore__triggerRefreshTokenForTransaction_authenticator_authParams_rmAccountID_rmAccountUsername_reauthQueue___block_invoke;
  v39[3] = &unk_24EB698C8;
  v41 = &v42;
  v21 = v19;
  v40 = v21;
  objc_msgSend(v15, "refreshTokenWithAuthParams:accountID:completionHandler:", v16, v17, v39);
  objc_msgSend(v21, "waitForCompletion");
  v22 = (void *)v43[5];
  if (!v22)
  {
    v25 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_222CB9000, v25, OS_LOG_TYPE_INFO, "Successfully refreshed MAID credentials automatically. Saving bearer token and re-doing HTTP transaction...", (uint8_t *)&buf, 2u);
    }
    -[MDMServerCore _clearCoreFollowup](self, "_clearCoreFollowup");
    objc_msgSend(v14, "performSynchronously");
    objc_msgSend(v14, "error");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v22, "domain");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23 != (void *)*MEMORY[0x24BE2A578])
  {

LABEL_9:
    -[MDMServerCore _triggerReauthenticationForTransaction:authenticator:authParams:rmAccountID:rmAccountUsername:](self, "_triggerReauthenticationForTransaction:authenticator:authParams:rmAccountID:rmAccountUsername:", v14, v15, v16, v17, v30);
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v28 = (id)v26;
    goto LABEL_11;
  }
  v27 = objc_msgSend((id)v43[5], "code");

  if (v27 != 15009)
    goto LABEL_9;
  objc_initWeak(&buf, self);
  v31[0] = v20;
  v31[1] = 3221225472;
  v31[2] = __119__MDMServerCore__triggerRefreshTokenForTransaction_authenticator_authParams_rmAccountID_rmAccountUsername_reauthQueue___block_invoke_2;
  v31[3] = &unk_24EB698F0;
  objc_copyWeak(&v37, &buf);
  v32 = v14;
  v33 = v16;
  v34 = v17;
  v35 = v30;
  v36 = v18;
  -[MDMServerCore _listenForManagedAppleAccountLongLivedTokenChangedNotificationsOnQueue:perform:](self, "_listenForManagedAppleAccountLongLivedTokenChangedNotificationsOnQueue:perform:", v36, v31);
  v28 = (id)v43[5];

  objc_destroyWeak(&v37);
  objc_destroyWeak(&buf);
LABEL_11:

  _Block_object_dispose(&v42, 8);
  return v28;
}

void __119__MDMServerCore__triggerRefreshTokenForTransaction_authenticator_authParams_rmAccountID_rmAccountUsername_reauthQueue___block_invoke(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  objc_msgSend(*(id *)(a1 + 32), "complete");

}

void __119__MDMServerCore__triggerRefreshTokenForTransaction_authenticator_authParams_rmAccountID_rmAccountUsername_reauthQueue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = (id)objc_msgSend(WeakRetained, "_processUnauthorizedFromTransaction:authParams:rmAccountID:rmAccountUsername:reauthQueue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    WeakRetained = v4;
  }

}

- (void)_listenForManagedAppleAccountLongLivedTokenChangedNotificationsOnQueue:(id)a3 perform:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  unsigned int v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v6 = a4;
  v7 = *MEMORY[0x24BE60D10];
  v8 = a3;
  v9 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_INFO, "idMS invalidated Managed Apple Account.", buf, 2u);
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __96__MDMServerCore__listenForManagedAppleAccountLongLivedTokenChangedNotificationsOnQueue_perform___block_invoke;
  v12[3] = &unk_24EB69370;
  v12[4] = self;
  v13 = v6;
  v10 = v6;
  v11 = -[MDMServerCore _listenForOneTimeGlobalNotification:callbackQueue:notificationHandler:](self, "_listenForOneTimeGlobalNotification:callbackQueue:notificationHandler:", v7, v8, v12);

  self->_reauthMAIDNotifyToken = v11;
}

uint64_t __96__MDMServerCore__listenForManagedAppleAccountLongLivedTokenChangedNotificationsOnQueue_perform___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = -1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_isMAIDNotificationActive
{
  unsigned int reauthMAIDNotifyToken;

  reauthMAIDNotifyToken = self->_reauthMAIDNotifyToken;
  return reauthMAIDNotifyToken != -1 && notify_is_valid_token(reauthMAIDNotifyToken);
}

- (void)_presentFollowUpForAuthURL:(id)a3 accountUsername:(id)a4 isMAIDAccount:(BOOL)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MDMFollowUp *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MDMFollowUp *v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = *MEMORY[0x24BE63EA0];
  objc_msgSend(MEMORY[0x24BE2A530], "itemSpecifierIDForReauthAccountUsername:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@/%@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    DMCLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = [MDMFollowUp alloc];
    -[MDMServerCore daemonIdentifier](self, "daemonIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    DMCLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("auth-url");
    objc_msgSend(v7, "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MDMFollowUp initWithStyle:clientIdentifier:itemIdentifier:url:title:notificationInfo:userInfo:](v14, "initWithStyle:clientIdentifier:itemIdentifier:url:title:notificationInfo:userInfo:", 1, v15, CFSTR("com.apple.devicemanagementclient.followup.reauth"), v12, v16, v13, v18);

    -[MDMFollowUp presentFollowUp](v19, "presentFollowUp");
  }
  else
  {
    v20 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_impl(&dword_222CB9000, v20, OS_LOG_TYPE_ERROR, "Failed to create URL for CoreFollowup reauth from string: %{public}@", buf, 0xCu);
    }
  }

}

- (void)_clearCoreFollowup
{
  id v2;

  -[MDMServerCore daemonIdentifier](self, "daemonIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[MDMFollowUp clearFollowUpWithClientID:](MDMFollowUp, "clearFollowUpWithClientID:", v2);

}

- (void)_postReauthFollowUpChangedNotification
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *MEMORY[0x24BE613C0], 0);

}

- (void)_memberQueueStartListeningForInterestingEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  if (!self->_isObservingReachability)
  {
    objc_msgSend(MEMORY[0x24BE04778], "sharedNetworkObserver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addNetworkReachableObserver:selector:", self, sel__networkReachabilityDidChange);

    self->_isObservingReachability = 1;
  }
  if (self->_keybagEventToken == -1
    && (!objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad")
     || objc_msgSend(MEMORY[0x24BE2A820], "inSharediPadUserSession")))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BE67240]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MDMServerCore memberQueue](self, "memberQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __63__MDMServerCore__memberQueueStartListeningForInterestingEvents__block_invoke;
    v9[3] = &unk_24EB69918;
    v9[4] = self;
    -[MDMServerCore _registerForDispatchNotification:outToken:targetQueue:handler:](self, "_registerForDispatchNotification:outToken:targetQueue:handler:", v4, &self->_keybagEventToken, v5, v9);

  }
  if (self->_buddyDoneEventToken == -1)
  {
    DMCBYSetupAssistantFinishedDarwinNotification();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[MDMServerCore memberQueue](self, "memberQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __63__MDMServerCore__memberQueueStartListeningForInterestingEvents__block_invoke_2;
      v8[3] = &unk_24EB69918;
      v8[4] = self;
      -[MDMServerCore _registerForDispatchNotification:outToken:targetQueue:handler:](self, "_registerForDispatchNotification:outToken:targetQueue:handler:", v6, &self->_buddyDoneEventToken, v7, v8);

    }
  }
}

uint64_t __63__MDMServerCore__memberQueueStartListeningForInterestingEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_keybagStateDidChange");
}

uint64_t __63__MDMServerCore__memberQueueStartListeningForInterestingEvents__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "buddyDidFinish");
}

- (void)_memberQueueStopListeningForInterestingEvents
{
  void *v3;

  if (self->_isObservingReachability)
  {
    objc_msgSend(MEMORY[0x24BE04778], "sharedNetworkObserver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeNetworkReachableObserver:", self);

    self->_isObservingReachability = 0;
  }
  if (self->_keybagEventToken != -1)
  {
    -[MDMServerCore _cancelDispatchNotificationWithToken:](self, "_cancelDispatchNotificationWithToken:");
    self->_keybagEventToken = -1;
  }
  if (self->_pairedNRDeviceEventToken != -1)
  {
    -[MDMServerCore _cancelDispatchNotificationWithToken:](self, "_cancelDispatchNotificationWithToken:");
    self->_pairedNRDeviceEventToken = -1;
  }
  if (self->_buddyDoneEventToken != -1)
  {
    -[MDMServerCore _cancelDispatchNotificationWithToken:](self, "_cancelDispatchNotificationWithToken:");
    self->_buddyDoneEventToken = -1;
  }
}

- (void)_networkReachabilityDidChange
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_DEFAULT, "Network reachability has changed.", buf, 2u);
  }
  -[MDMServerCore jobQueue](self, "jobQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__MDMServerCore__networkReachabilityDidChange__block_invoke;
  v5[3] = &unk_24EB69408;
  v5[4] = self;
  objc_msgSend(v4, "fromFunction:enqueueJob:", "-[MDMServerCore _networkReachabilityDidChange]", v5);

}

void __46__MDMServerCore__networkReachabilityDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__MDMServerCore__networkReachabilityDidChange__block_invoke_2;
  v6[3] = &unk_24EB693E0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_pollFromServerIfNeeded:isReachabilityEvent:completionHandler:", 0, 1, v6);

}

uint64_t __46__MDMServerCore__networkReachabilityDidChange__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_keybagStateDidChange
{
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_DEFAULT, "Keybag state has changed.", buf, 2u);
  }
  if ((DMCIsDeviceLocked() & 1) == 0)
  {
    v4 = dispatch_time(0, 3000000000);
    -[MDMServerCore memberQueue](self, "memberQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__MDMServerCore__keybagStateDidChange__block_invoke;
    block[3] = &unk_24EB68230;
    block[4] = self;
    dispatch_after(v4, v5, block);

  }
}

void __38__MDMServerCore__keybagStateDidChange__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "jobQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38__MDMServerCore__keybagStateDidChange__block_invoke_2;
  v3[3] = &unk_24EB69408;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "fromFunction:enqueueJob:", "-[MDMServerCore _keybagStateDidChange]_block_invoke", v3);

}

void __38__MDMServerCore__keybagStateDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__MDMServerCore__keybagStateDidChange__block_invoke_3;
  v6[3] = &unk_24EB693E0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_pollFromServerIfNeeded:isReachabilityEvent:completionHandler:", 0, 1, v6);

}

uint64_t __38__MDMServerCore__keybagStateDidChange__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)buddyDidFinish
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_DEFAULT, "Buddy did finish.", buf, 2u);
  }
  -[MDMServerCore jobQueue](self, "jobQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__MDMServerCore_buddyDidFinish__block_invoke;
  v5[3] = &unk_24EB69408;
  v5[4] = self;
  objc_msgSend(v4, "fromFunction:enqueueJob:", "-[MDMServerCore buddyDidFinish]", v5);

}

void __31__MDMServerCore_buddyDidFinish__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__MDMServerCore_buddyDidFinish__block_invoke_2;
  v6[3] = &unk_24EB693E0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_pollFromServerIfNeeded:isReachabilityEvent:completionHandler:", 0, 1, v6);

}

uint64_t __31__MDMServerCore_buddyDidFinish__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unsigned)_registerForDispatchNotification:(id)a3 outToken:(int *)a4 targetQueue:(id)a5 handler:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;

  v9 = objc_retainAutorelease(a3);
  v10 = a6;
  v11 = a5;
  LODWORD(a4) = notify_register_dispatch((const char *)objc_msgSend(v9, "UTF8String"), a4, v11, v10);

  return a4;
}

- (unsigned)_cancelDispatchNotificationWithToken:(unsigned int)a3
{
  return notify_cancel(a3);
}

- (void)_clearMAIDNotification
{
  unsigned int reauthMAIDNotifyToken;
  uint32_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  reauthMAIDNotifyToken = self->_reauthMAIDNotifyToken;
  if (reauthMAIDNotifyToken != -1)
  {
    v4 = notify_cancel(reauthMAIDNotifyToken);
    v5 = *(NSObject **)(DMCLogObjects() + 8);
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v10[0] = 67109120;
        v10[1] = v4;
        v6 = "MDMServerCore couldn't cancel notification: %d";
        v7 = v5;
        v8 = OS_LOG_TYPE_ERROR;
        v9 = 8;
LABEL_7:
        _os_log_impl(&dword_222CB9000, v7, v8, v6, (uint8_t *)v10, v9);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10[0]) = 0;
      v6 = "MDMServerCore cancelled notification";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEBUG;
      v9 = 2;
      goto LABEL_7;
    }
    self->_reauthMAIDNotifyToken = -1;
  }
}

- (void)_currentLocaleDidChange:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_DEFAULT, "Notified of locale change. Exiting when clean.", v4, 2u);
  }
  xpc_transaction_exit_clean();
}

- (id)_createBadInstallationError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DMCLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DMCUSEnglishString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:", v3, 12011, v4, v5, v6, 0, *MEMORY[0x24BE2A588]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_pollOrScheduleNextPollForHRN
{
  NSObject *v3;
  _QWORD block[5];

  if ((objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad") & 1) == 0)
  {
    -[MDMServerCore memberQueue](self, "memberQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__MDMServerCore__pollOrScheduleNextPollForHRN__block_invoke;
    block[3] = &unk_24EB68230;
    block[4] = self;
    dispatch_async_and_wait(v3, block);

  }
}

uint64_t __46__MDMServerCore__pollOrScheduleNextPollForHRN__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_memberQueuePollOrScheduleNextPollForHRN");
}

- (void)_memberQueuePollOrScheduleNextPollForHRN
{
  void *v3;
  uint64_t v4;
  double v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  int v11;
  double v12;
  void *v13;
  _QWORD v14[5];

  -[MDMServerCore memberQueuePollingInterval](self, "memberQueuePollingInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  if (v4)
  {
    v5 = MEMORY[0x22767C768]();
    v6 = TMGetRTCResetCount();
    -[MDMServerCore memberQueueLastPollingAttemptMonotonicTime](self, "memberQueueLastPollingAttemptMonotonicTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;
    -[MDMServerCore memberQueueLastPollingAttemptRTCResetCount](self, "memberQueueLastPollingAttemptRTCResetCount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntValue");
    if (v7 && v10 && v6 == v11 && (v12 = v9 + (double)(unint64_t)(60 * v4), v12 > v5))
    {
      -[MDMServerCore _scheduleNextPollWithInterval:](self, "_scheduleNextPollWithInterval:", v12 - v5);
    }
    else
    {
      -[MDMServerCore jobQueue](self, "jobQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __57__MDMServerCore__memberQueuePollOrScheduleNextPollForHRN__block_invoke;
      v14[3] = &unk_24EB69408;
      v14[4] = self;
      objc_msgSend(v13, "fromFunction:enqueueJob:", "-[MDMServerCore _memberQueuePollOrScheduleNextPollForHRN]", v14);

    }
  }
}

void __57__MDMServerCore__memberQueuePollOrScheduleNextPollForHRN__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__MDMServerCore__memberQueuePollOrScheduleNextPollForHRN__block_invoke_2;
  v6[3] = &unk_24EB693E0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_pollFromServerIfNeeded:isReachabilityEvent:completionHandler:", 1, 0, v6);

}

uint64_t __57__MDMServerCore__memberQueuePollOrScheduleNextPollForHRN__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_scheduleNextPollWithInterval:(double)a3
{
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  double v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v8 = a3;
    v9 = 2048;
    v10 = a3 * 0.1;
    _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_INFO, "Scheduling poll in %f seconds, tolerance %f.", buf, 0x16u);
  }
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__MDMServerCore__scheduleNextPollWithInterval___block_invoke;
  v6[3] = &unk_24EB68230;
  v6[4] = self;
  objc_msgSend(MEMORY[0x24BE2A7C0], "scheduleOneShotActivity:interval:gracePeriod:callback:", CFSTR("com.apple.devicemanagementclient.mdmd.polling"), v6, a3, a3 * 0.1);
}

void __47__MDMServerCore__scheduleNextPollWithInterval___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD block[5];

  objc_msgSend(MEMORY[0x24BE2A7A8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hrnMode");

  v4 = *(void **)(a1 + 32);
  if (v3 == 2)
  {
    objc_msgSend(v4, "memberQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__MDMServerCore__scheduleNextPollWithInterval___block_invoke_2;
    block[3] = &unk_24EB68230;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async_and_wait(v5, block);
  }
  else
  {
    objc_msgSend(v4, "jobQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __47__MDMServerCore__scheduleNextPollWithInterval___block_invoke_3;
    v6[3] = &unk_24EB69408;
    v6[4] = *(_QWORD *)(a1 + 32);
    -[NSObject fromFunction:enqueueJob:](v5, "fromFunction:enqueueJob:", "-[MDMServerCore _scheduleNextPollWithInterval:]_block_invoke", v6);
  }

}

uint64_t __47__MDMServerCore__scheduleNextPollWithInterval___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_memberQueuePollOrScheduleNextPollForHRN");
}

void __47__MDMServerCore__scheduleNextPollWithInterval___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__MDMServerCore__scheduleNextPollWithInterval___block_invoke_4;
  v6[3] = &unk_24EB693E0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_pollFromServerIfNeeded:isReachabilityEvent:completionHandler:", 0, 0, v6);

}

uint64_t __47__MDMServerCore__scheduleNextPollWithInterval___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_pollingSucceeded
{
  NSObject *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[MDMServerCore memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__MDMServerCore__pollingSucceeded__block_invoke;
  v4[3] = &unk_24EB68168;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_async_and_wait(v3, v4);

  if (*((_BYTE *)v6 + 24))
    -[MDMServerCore _clearCoreFollowup](self, "_clearCoreFollowup");
  -[MDMServerCore _setLastPollingSuccess](self, "_setLastPollingSuccess");
  -[MDMServerCore _pollOrScheduleNextPollForHRN](self, "_pollOrScheduleNextPollForHRN");
  _Block_object_dispose(&v5, 8);
}

void __34__MDMServerCore__pollingSucceeded__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueLastPollingSuccess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 == 0;

}

- (void)_setLastPollingAttempt
{
  NSObject *v3;
  _QWORD block[5];

  -[MDMServerCore memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__MDMServerCore__setLastPollingAttempt__block_invoke;
  block[3] = &unk_24EB68230;
  block[4] = self;
  dispatch_async_and_wait(v3, block);

}

uint64_t __39__MDMServerCore__setLastPollingAttempt__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_memberQueueSetLastPollingAttempt");
}

- (void)_setLastPollingSuccess
{
  NSObject *v3;
  _QWORD block[5];

  -[MDMServerCore memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__MDMServerCore__setLastPollingSuccess__block_invoke;
  block[3] = &unk_24EB68230;
  block[4] = self;
  dispatch_async_and_wait(v3, block);

}

uint64_t __39__MDMServerCore__setLastPollingSuccess__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_memberQueueSetLastPollingSuccess");
}

- (void)_memberQueueSetLastPollingSuccess
{
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x22767C768]();
  v4 = TMGetRTCResetCount();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMServerCore setMemberQueueLastPollingSuccess:](self, "setMemberQueueLastPollingSuccess:", v10);
  -[MDMServerCore setMemberQueueLastPollingSuccessMonotonicTime:](self, "setMemberQueueLastPollingSuccessMonotonicTime:", v5);
  -[MDMServerCore setMemberQueueLastPollingSuccessRTCResetCount:](self, "setMemberQueueLastPollingSuccessRTCResetCount:", v6);
  v7 = (void *)MEMORY[0x24BDBCED8];
  -[MDMServerCore _mdmFilePathForChannelType:](self, "_mdmFilePathForChannelType:", -[MDMServerCore channelType](self, "channelType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithContentsOfFile:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE60F60]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE60F68]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE60F70]);
  -[MDMServerCore _memberQueueWriteDict:toMDMConfigurationFileForChannel:shouldNotify:](self, "_memberQueueWriteDict:toMDMConfigurationFileForChannel:shouldNotify:", v9, -[MDMServerCore channelType](self, "channelType"), 0);

}

- (void)_memberQueueSetLastPollingAttempt
{
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x22767C768]();
  v4 = TMGetRTCResetCount();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMServerCore setMemberQueueLastPollingAttempt:](self, "setMemberQueueLastPollingAttempt:", v10);
  -[MDMServerCore setMemberQueueLastPollingAttemptMonotonicTime:](self, "setMemberQueueLastPollingAttemptMonotonicTime:", v5);
  -[MDMServerCore setMemberQueueLastPollingAttemptRTCResetCount:](self, "setMemberQueueLastPollingAttemptRTCResetCount:", v6);
  v7 = (void *)MEMORY[0x24BDBCED8];
  -[MDMServerCore _mdmFilePathForChannelType:](self, "_mdmFilePathForChannelType:", -[MDMServerCore channelType](self, "channelType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithContentsOfFile:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE60F48]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE60F50]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE60F58]);
  -[MDMServerCore _memberQueueWriteDict:toMDMConfigurationFileForChannel:shouldNotify:](self, "_memberQueueWriteDict:toMDMConfigurationFileForChannel:shouldNotify:", v9, -[MDMServerCore channelType](self, "channelType"), 0);

}

- (void)_registerAsUserSwitchStakeholder
{
  dispatch_block_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  if (objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v3 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_255);
    objc_msgSend((id)DMCUMUserManagerClass(), "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __49__MDMServerCore__registerAsUserSwitchStakeholder__block_invoke_2;
    v9 = &unk_24EB69960;
    v11 = &v12;
    v5 = v3;
    v10 = v5;
    objc_msgSend(v4, "registerUserSwitchStakeHolder:completionHandler:", self, &v6);

    dispatch_block_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    -[MDMServerCore setMemberQueueUserSwitchAlreadyInitiated:](self, "setMemberQueueUserSwitchAlreadyInitiated:", *((unsigned __int8 *)v13 + 24), v6, v7, v8, v9);

    _Block_object_dispose(&v12, 8);
  }
}

void __49__MDMServerCore__registerAsUserSwitchStakeholder__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    DMCUMUserManagerErrorDomain();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) != 0)
    {
      v6 = objc_msgSend(v7, "code");

      if (v6 == 5)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)willSwitchUser
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  void *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[MDMServerCore setUserSwitchAlreadyInitiated:](self, "setUserSwitchAlreadyInitiated:", 1);
  objc_msgSend(MEMORY[0x24BE2A868], "assertionDescriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }
  v9 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v3;
    _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_DEFAULT, "Will switch user. Unfinished assertions:\n%{public}@", buf, 0xCu);
  }

}

- (id)_eraseWatchFailedWithUnderlayingError:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BE2A728];
  v5 = a3;
  DMCErrorArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 12089, v6, v5, *MEMORY[0x24BE2A588], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_mdmOutstandingActivitiesFilePathForChannelType:(unint64_t)a3
{
  if (a3 == 1)
  {
    MDMUserOutstandingActivitiesFilePath();
    self = (MDMServerCore *)objc_claimAutoreleasedReturnValue();
  }
  else if (!a3)
  {
    MDMOutstandingActivitiesFilePath();
    self = (MDMServerCore *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_mdmFilePathForChannelType:(unint64_t)a3
{
  if (a3 == 1)
  {
    MDMUserFilePath();
    self = (MDMServerCore *)objc_claimAutoreleasedReturnValue();
  }
  else if (!a3)
  {
    MDMFilePath();
    self = (MDMServerCore *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_mdmPropertiesFilePathForChannelType:(unint64_t)a3
{
  if (a3 == 1)
  {
    MDMPropertiesUserFilePath();
    self = (MDMServerCore *)objc_claimAutoreleasedReturnValue();
  }
  else if (!a3)
  {
    MDMPropertiesFilePath();
    self = (MDMServerCore *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_prefixNameForChannelType:(unint64_t)a3
{
  if (a3)
    return CFSTR("mdmuserd");
  else
    return CFSTR("mdmd");
}

- (id)_reasonStringWithReason:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  -[MDMServerCore _prefixNameForChannelType:](self, "_prefixNameForChannelType:", -[MDMServerCore channelType](self, "channelType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_isTokenUpdateScheduled
{
  return -[MDMServerCore _tokenUpdateCount](self, "_tokenUpdateCount") > 0;
}

- (int64_t)_tokenUpdateCount
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MDMServerCore memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__MDMServerCore__tokenUpdateCount__block_invoke;
  v6[3] = &unk_24EB68168;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __34__MDMServerCore__tokenUpdateCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_memberQueueTokenUpdateCount");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)_setTokenUpdateRequestCountToZero
{
  NSObject *v3;
  _QWORD block[5];

  -[MDMServerCore memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__MDMServerCore__setTokenUpdateRequestCountToZero__block_invoke;
  block[3] = &unk_24EB68230;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __50__MDMServerCore__setTokenUpdateRequestCountToZero__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_memberQueueSetTokenUpdateRequestCount:", 0);
}

- (int64_t)_tokenUpdateRetryCount
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MDMServerCore memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__MDMServerCore__tokenUpdateRetryCount__block_invoke;
  v6[3] = &unk_24EB68168;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __39__MDMServerCore__tokenUpdateRetryCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "memberQueueTokenUpdateRetryCount");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_decreaseTokenUpdateRetryCount
{
  NSObject *v3;
  _QWORD block[5];

  -[MDMServerCore memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__MDMServerCore__decreaseTokenUpdateRetryCount__block_invoke;
  block[3] = &unk_24EB68230;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __47__MDMServerCore__decreaseTokenUpdateRetryCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "memberQueueTokenUpdateRetryCount");
  if (result >= 1)
    return objc_msgSend(*(id *)(a1 + 32), "setMemberQueueTokenUpdateRetryCount:", objc_msgSend(*(id *)(a1 + 32), "memberQueueTokenUpdateRetryCount") - 1);
  return result;
}

- (int64_t)_memberQueueTokenUpdateCount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  v2 = (void *)MEMORY[0x24BDBCE70];
  -[MDMServerCore _mdmOutstandingActivitiesFilePathForChannelType:](self, "_mdmOutstandingActivitiesFilePathForChannelType:", -[MDMServerCore channelType](self, "channelType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE60E38]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (void)_memberQueueSetTokenUpdateRequestCount:(int64_t)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[MDMServerCore _memberQueueSetOutstandingActivity:forKey:](self, "_memberQueueSetOutstandingActivity:forKey:", v4, *MEMORY[0x24BE60E38]);

  }
  else
  {
    -[MDMServerCore _memberQueueRemoveOutstandingActivityForKey:](self, "_memberQueueRemoveOutstandingActivityForKey:", *MEMORY[0x24BE60E38]);
  }
}

- (void)_memberQueueSetLastPushTokenHash:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  id v15;

  v15 = a3;
  v4 = (void *)MEMORY[0x24BDBCED8];
  -[MDMServerCore _mdmFilePathForChannelType:](self, "_mdmFilePathForChannelType:", -[MDMServerCore channelType](self, "channelType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  v10 = *MEMORY[0x24BE60F78];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE60F78]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v15;
  if ((v15 != 0) != (v11 != 0) || (v14 = objc_msgSend(v11, "isEqualToData:", v15), v13 = v15, (v14 & 1) == 0))
  {
    if (v13)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v10);
    else
      objc_msgSend(v9, "removeObjectForKey:", v10);
    -[MDMServerCore _memberQueueWriteDict:toMDMConfigurationFileForChannel:shouldNotify:](self, "_memberQueueWriteDict:toMDMConfigurationFileForChannel:shouldNotify:", v9, -[MDMServerCore channelType](self, "channelType"), 0);
  }

}

- (id)_memberQueueLastPushTokenHash
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCED8];
  -[MDMServerCore _mdmFilePathForChannelType:](self, "_mdmFilePathForChannelType:", -[MDMServerCore channelType](self, "channelType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE60F78]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_memberQueueIncrementTokenUpdateRequestCount
{
  uint64_t v3;

  v3 = -[MDMServerCore _memberQueueTokenUpdateCount](self, "_memberQueueTokenUpdateCount");
  if (v3 <= 1)
    -[MDMServerCore _memberQueueSetTokenUpdateRequestCount:](self, "_memberQueueSetTokenUpdateRequestCount:", v3 + 1);
  -[MDMServerCore setMemberQueueTokenUpdateRetryCount:](self, "setMemberQueueTokenUpdateRetryCount:", 2);
}

- (void)_memberQueueDecrementTokenUpdateRequestCount
{
  uint64_t v3;

  v3 = -[MDMServerCore _memberQueueTokenUpdateCount](self, "_memberQueueTokenUpdateCount");
  if (v3 >= 1)
    -[MDMServerCore _memberQueueSetTokenUpdateRequestCount:](self, "_memberQueueSetTokenUpdateRequestCount:", v3 - 1);
}

- (id)responseFromBasicResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  id v23;
  _QWORD v25[6];
  _QWORD block[5];
  id v27;
  _BYTE buf[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ErrorObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((objc_msgSend(v6, "DMCContainsErrorDomain:code:", *MEMORY[0x24BE2A628], 4009) & 1) != 0
      || objc_msgSend(v7, "DMCContainsErrorDomain:code:", *MEMORY[0x24BE63B40], 4009))
    {
      objc_msgSend(v5, "setObject:forKey:", CFSTR("NotNow"), CFSTR("Status"));
      v8 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        objc_msgSend(v5, "objectForKey:", CFSTR("Status"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v10;
        _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_DEFAULT, "Command Status: %{public}@", buf, 0xCu);

      }
    }
    else
    {
      +[MDMParser errorChainFromError:](MDMParser, "errorChainFromError:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("ErrorChain"));
      v15 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        objc_msgSend(v5, "objectForKey:", CFSTR("Status"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "DMCVerboseDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v18;
        _os_log_impl(&dword_222CB9000, v16, OS_LOG_TYPE_ERROR, "Command Status: %{public}@\nError: %{public}@", buf, 0x16u);

      }
    }
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("ErrorObject"));
  }
  else
  {
    v11 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      objc_msgSend(v5, "objectForKey:", CFSTR("Status"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v13;
      _os_log_impl(&dword_222CB9000, v12, OS_LOG_TYPE_DEFAULT, "Command Status: %{public}@", buf, 0xCu);

    }
  }
  -[MDMServerCore memberQueue](self, "memberQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__MDMServerCore_responseFromBasicResponse___block_invoke;
  block[3] = &unk_24EB68258;
  block[4] = self;
  v21 = v5;
  v27 = v21;
  dispatch_async_and_wait(v19, block);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v29 = __Block_byref_object_copy__10;
  v30 = __Block_byref_object_dispose__10;
  v31 = 0;
  -[MDMServerCore memberQueue](self, "memberQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  v25[0] = v20;
  v25[1] = 3221225472;
  v25[2] = __43__MDMServerCore_responseFromBasicResponse___block_invoke_2;
  v25[3] = &unk_24EB68168;
  v25[4] = self;
  v25[5] = buf;
  dispatch_async_and_wait(v22, v25);

  objc_msgSend(v21, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), CFSTR("CommandUUID"));
  v23 = v21;
  _Block_object_dispose(buf, 8);

  return v23;
}

void __43__MDMServerCore_responseFromBasicResponse___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "memberQueueUseEnrollmentID"))
  {
    objc_msgSend(*(id *)(a1 + 32), "memberQueueEnrollmentID");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (_QWORD *)MEMORY[0x24BE60F00];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2A818], "deviceUDID");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (_QWORD *)MEMORY[0x24BE61018];
  }
  v4 = (id)v2;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v2, *v3);

}

void __43__MDMServerCore_responseFromBasicResponse___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueCommandUUID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_clearCachedResponse
{
  -[MDMServerCore _setCachedResponse:](self, "_setCachedResponse:", 0);
}

- (id)_cachedResponse
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__10;
  v11 = __Block_byref_object_dispose__10;
  v12 = 0;
  -[MDMServerCore memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__MDMServerCore__cachedResponse__block_invoke;
  v6[3] = &unk_24EB68168;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __32__MDMServerCore__cachedResponse__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_memberQueueCachedResponse");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_setCachedResponse:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MDMServerCore memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__MDMServerCore__setCachedResponse___block_invoke;
  v7[3] = &unk_24EB68258;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __36__MDMServerCore__setCachedResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_memberQueueSetCachedResponse:", *(_QWORD *)(a1 + 40));
}

- (id)_memberQueueCachedResponse
{
  void *v2;
  void *v3;
  void *v4;

  -[MDMServerCore _mdmOutstandingActivitiesFilePathForChannelType:](self, "_mdmOutstandingActivitiesFilePathForChannelType:", -[MDMServerCore channelType](self, "channelType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE60E30]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_memberQueueSetCachedResponse:(id)a3
{
  if (a3)
    -[MDMServerCore _memberQueueSetOutstandingActivity:forKey:](self, "_memberQueueSetOutstandingActivity:forKey:", a3, *MEMORY[0x24BE60E30]);
  else
    -[MDMServerCore _memberQueueRemoveOutstandingActivityForKey:](self, "_memberQueueRemoveOutstandingActivityForKey:", *MEMORY[0x24BE60E30]);
}

- (id)_idleResponse
{
  void *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint8_t v11[8];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  if (-[MDMServerCore memberQueueUseEnrollmentID](self, "memberQueueUseEnrollmentID"))
  {
    v14[0] = *MEMORY[0x24BE60F00];
    -[MDMServerCore memberQueueEnrollmentID](self, "memberQueueEnrollmentID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = CFSTR("Status");
    v15[0] = v3;
    v15[1] = CFSTR("Idle");
    v4 = (void *)MEMORY[0x24BDBCE70];
    v5 = v15;
    v6 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2A818], "deviceUDID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "length"))
    {
      objc_msgSend(MEMORY[0x24BE2A818], "deviceUDID");
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v7;
    }
    if (!objc_msgSend(v3, "length"))
    {
      v8 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_222CB9000, v8, OS_LOG_TYPE_ERROR, "Failed to get device UDID from MobileGestalt", v11, 2u);
      }
    }
    v12[0] = *MEMORY[0x24BE61018];
    v12[1] = CFSTR("Status");
    v13[0] = v3;
    v13[1] = CFSTR("Idle");
    v4 = (void *)MEMORY[0x24BDBCE70];
    v5 = v13;
    v6 = v12;
  }
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v5, v6, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_userFieldsForResponse
{
  void *v3;
  char v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad"))
  {
    DMCLKLogoutSupportClass();
    v3 = (void *)objc_opt_new();
    v4 = objc_msgSend(v3, "isCurrentUserAnonymous");

    if ((v4 & 1) == 0)
    {
      objc_msgSend((id)DMCUMUserManagerClass(), "sharedManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentUser");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "username");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    v5 = (__CFString *)(id)*MEMORY[0x24BE61438];
  }
  else
  {
    if (!-[MDMServerCore memberQueueUseEnrollmentID](self, "memberQueueUseEnrollmentID"))
    {
      v6 = CFSTR("Device");
      goto LABEL_9;
    }
    -[MDMServerCore memberQueueEnrollmentID](self, "memberQueueEnrollmentID");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
LABEL_9:
  v9 = *MEMORY[0x24BE61460];
  v10 = *MEMORY[0x24BE61030];
  v13[0] = *MEMORY[0x24BE61028];
  v13[1] = v10;
  v14[0] = v9;
  v14[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_responseDataFromResponseDictionary:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 100, 0, 0);
}

- (void)_memberQueueSetOutstandingActivity:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[MDMServerCore _mdmOutstandingActivitiesFilePathForChannelType:](self, "_mdmOutstandingActivitiesFilePathForChannelType:", -[MDMServerCore channelType](self, "channelType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "setObject:forKey:", v9, v6);
  objc_msgSend(v8, "DMCWriteToBinaryFile:", v7);

}

- (void)_memberQueueRemoveOutstandingActivityForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MDMServerCore _mdmOutstandingActivitiesFilePathForChannelType:](self, "_mdmOutstandingActivitiesFilePathForChannelType:", -[MDMServerCore channelType](self, "channelType"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "DMCWriteToBinaryFile:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeItemAtPath:error:", v7, 0);

  }
}

- (void)_changeOrganizationNameForRMAccountIdentifier:(id)a3 personaID:(id)a4 organizationName:(id)a5
{
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v8 = 0;
    v5 = objc_msgSend(MEMORY[0x24BE60D40], "updateOrganizationName:rmAccountIdentifier:personaID:error:", a5, a3, a4, &v8);
    v6 = v8;
    if ((v5 & 1) == 0)
    {
      v7 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v10 = v6;
        _os_log_impl(&dword_222CB9000, v7, OS_LOG_TYPE_ERROR, "Could not update organizatioin name from organization info. Error: %{public}@", buf, 0xCu);
      }
    }

  }
}

- (void)_listenForCleanupMigrationFinishedNotificaitonAndRetryTokenUpdate
{
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v3 = *MEMORY[0x24BE60D00];
  dispatch_get_global_queue(0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __82__MDMServerCore__listenForCleanupMigrationFinishedNotificaitonAndRetryTokenUpdate__block_invoke;
  v5[3] = &unk_24EB68230;
  v5[4] = self;
  -[MDMServerCore _listenForOneTimeGlobalNotification:callbackQueue:notificationHandler:](self, "_listenForOneTimeGlobalNotification:callbackQueue:notificationHandler:", v3, v4, v5);

}

void __82__MDMServerCore__listenForCleanupMigrationFinishedNotificaitonAndRetryTokenUpdate__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  if (objc_msgSend(*(id *)(a1 + 32), "_isTokenUpdateScheduled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "jobQueue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __82__MDMServerCore__listenForCleanupMigrationFinishedNotificaitonAndRetryTokenUpdate__block_invoke_2;
    v3[3] = &unk_24EB69408;
    v3[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v2, "fromFunction:enqueueJob:", "-[MDMServerCore _listenForCleanupMigrationFinishedNotificaitonAndRetryTokenUpdate]_block_invoke", v3);

  }
}

void __82__MDMServerCore__listenForCleanupMigrationFinishedNotificaitonAndRetryTokenUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __82__MDMServerCore__listenForCleanupMigrationFinishedNotificaitonAndRetryTokenUpdate__block_invoke_3;
  v6[3] = &unk_24EB693E0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_pollFromServerIfNeeded:isReachabilityEvent:completionHandler:", 0, 0, v6);

}

uint64_t __82__MDMServerCore__listenForCleanupMigrationFinishedNotificaitonAndRetryTokenUpdate__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)_listenForOneTimeGlobalNotification:(id)a3 callbackQueue:(id)a4 notificationHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  const char *v13;
  id v14;
  id v15;
  uint32_t v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  _QWORD handler[4];
  id v22;
  id v23;
  id v24;
  id location;
  int out_token;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  uint32_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v8;
    _os_log_impl(&dword_222CB9000, v11, OS_LOG_TYPE_INFO, "MDMServerCore listening for %{public}@ notification...", buf, 0xCu);
  }
  out_token = -1;
  objc_initWeak(&location, self);
  v12 = objc_retainAutorelease(v8);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __87__MDMServerCore__listenForOneTimeGlobalNotification_callbackQueue_notificationHandler___block_invoke;
  handler[3] = &unk_24EB69988;
  v14 = v12;
  v22 = v14;
  objc_copyWeak(&v24, &location);
  v15 = v10;
  v23 = v15;
  v16 = notify_register_dispatch(v13, &out_token, v9, handler);
  if (v16)
  {
    v17 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v28 = v14;
      v29 = 1024;
      v30 = v16;
      _os_log_impl(&dword_222CB9000, v17, OS_LOG_TYPE_ERROR, "MDMServerCore couldn't register for %{public}@ notification: %d", buf, 0x12u);
    }
    v18 = -1;
  }
  else
  {
    v19 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v14;
      _os_log_impl(&dword_222CB9000, v19, OS_LOG_TYPE_DEFAULT, "MDMServerCore registered for %{public}@ notification", buf, 0xCu);
    }
    v18 = out_token;
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v18;
}

void __87__MDMServerCore__listenForOneTimeGlobalNotification_callbackQueue_notificationHandler___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;
  uint32_t v7;
  uint32_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint32_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v11 = 138543362;
    v12 = v5;
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_DEFAULT, "MDMServerCore received %{public}@ notification", (uint8_t *)&v11, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = notify_cancel(a2);
    if (v7)
    {
      v8 = v7;
      v9 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v11 = 138543618;
        v12 = v10;
        v13 = 1024;
        v14 = v8;
        _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_ERROR, "MDMServerCore couldn't cancel %{public}@ notification: %d", (uint8_t *)&v11, 0x12u);
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (unint64_t)channelType
{
  return self->_channelType;
}

- (void)setChannelType:(unint64_t)a3
{
  self->_channelType = a3;
}

- (MDMServerAppInstallBlocking)appInstallBlocker
{
  return self->_appInstallBlocker;
}

- (void)setAppInstallBlocker:(id)a3
{
  objc_storeStrong((id *)&self->_appInstallBlocker, a3);
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueue, a3);
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (DMCJobQueue)jobQueue
{
  return self->_jobQueue;
}

- (MDMPushServiceManager)pushServiceManager
{
  return self->_pushServiceManager;
}

- (void)setPushServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_pushServiceManager, a3);
}

- (MDMDEPPushTokenManager)depPushTokenManager
{
  return self->_depPushTokenManager;
}

- (void)setDepPushTokenManager:(id)a3
{
  objc_storeStrong((id *)&self->_depPushTokenManager, a3);
}

- (BOOL)memberQueueIsMDMConfigurationValid
{
  return self->_memberQueueIsMDMConfigurationValid;
}

- (void)setMemberQueueIsMDMConfigurationValid:(BOOL)a3
{
  self->_memberQueueIsMDMConfigurationValid = a3;
}

- (BOOL)memberQueueIsUprooting
{
  return self->_memberQueueIsUprooting;
}

- (void)setMemberQueueIsUprooting:(BOOL)a3
{
  self->_memberQueueIsUprooting = a3;
}

- (BOOL)memberQueueLastResponseWasNotNow
{
  return self->_memberQueueLastResponseWasNotNow;
}

- (void)setMemberQueueLastResponseWasNotNow:(BOOL)a3
{
  self->_memberQueueLastResponseWasNotNow = a3;
}

- (BOOL)memberQueuePinningRevocationCheckRequired
{
  return self->_memberQueuePinningRevocationCheckRequired;
}

- (void)setMemberQueuePinningRevocationCheckRequired:(BOOL)a3
{
  self->_memberQueuePinningRevocationCheckRequired = a3;
}

- (BOOL)memberQueueSignMessage
{
  return self->_memberQueueSignMessage;
}

- (void)setMemberQueueSignMessage:(BOOL)a3
{
  self->_memberQueueSignMessage = a3;
}

- (BOOL)memberQueueUseDevelopmentAPNS
{
  return self->_memberQueueUseDevelopmentAPNS;
}

- (void)setMemberQueueUseDevelopmentAPNS:(BOOL)a3
{
  self->_memberQueueUseDevelopmentAPNS = a3;
}

- (BOOL)memberQueueUseEnrollmentID
{
  return self->_memberQueueUseEnrollmentID;
}

- (void)setMemberQueueUseEnrollmentID:(BOOL)a3
{
  self->_memberQueueUseEnrollmentID = a3;
}

- (BOOL)memberQueueUserSwitchAlreadyInitiated
{
  return self->_memberQueueUserSwitchAlreadyInitiated;
}

- (void)setMemberQueueUserSwitchAlreadyInitiated:(BOOL)a3
{
  self->_memberQueueUserSwitchAlreadyInitiated = a3;
}

- (unint64_t)memberQueueAccessRights
{
  return self->_memberQueueAccessRights;
}

- (void)setMemberQueueAccessRights:(unint64_t)a3
{
  self->_memberQueueAccessRights = a3;
}

- (int)memberQueuePowerAssertionDeassertedNotificationToken
{
  return self->_memberQueuePowerAssertionDeassertedNotificationToken;
}

- (void)setMemberQueuePowerAssertionDeassertedNotificationToken:(int)a3
{
  self->_memberQueuePowerAssertionDeassertedNotificationToken = a3;
}

- (NSArray)memberQueueCheckInPinnedSecCertificateRefs
{
  return self->_memberQueueCheckInPinnedSecCertificateRefs;
}

- (void)setMemberQueueCheckInPinnedSecCertificateRefs:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueCheckInPinnedSecCertificateRefs, a3);
}

- (NSArray)memberQueueServerPinnedSecCertificateRefs
{
  return self->_memberQueueServerPinnedSecCertificateRefs;
}

- (void)setMemberQueueServerPinnedSecCertificateRefs:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueServerPinnedSecCertificateRefs, a3);
}

- (NSData)memberQueuePushToken
{
  return self->_memberQueuePushToken;
}

- (void)setMemberQueuePushToken:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueuePushToken, a3);
}

- (NSData)memberQueueLastLoggedPushToken
{
  return self->_memberQueueLastLoggedPushToken;
}

- (void)setMemberQueueLastLoggedPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueLastLoggedPushToken, a3);
}

- (NSDate)memberQueueLastPollingAttempt
{
  return self->_memberQueueLastPollingAttempt;
}

- (void)setMemberQueueLastPollingAttempt:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueLastPollingAttempt, a3);
}

- (NSDate)memberQueueLastPollingSuccess
{
  return self->_memberQueueLastPollingSuccess;
}

- (void)setMemberQueueLastPollingSuccess:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueLastPollingSuccess, a3);
}

- (NSDictionary)memberQueueCachedResponse
{
  return self->_memberQueueCachedResponse;
}

- (void)setMemberQueueCachedResponse:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueCachedResponse, a3);
}

- (NSDictionary)memberQueueMDMOptions
{
  return self->_memberQueueMDMOptions;
}

- (void)setMemberQueueMDMOptions:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueMDMOptions, a3);
}

- (NSDictionary)memberQueueOrganizationInfo
{
  return self->_memberQueueOrganizationInfo;
}

- (void)setMemberQueueOrganizationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueOrganizationInfo, a3);
}

- (NSNumber)memberQueueLastPollingAttemptMonotonicTime
{
  return self->_memberQueueLastPollingAttemptMonotonicTime;
}

- (void)setMemberQueueLastPollingAttemptMonotonicTime:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueLastPollingAttemptMonotonicTime, a3);
}

- (NSNumber)memberQueueLastPollingAttemptRTCResetCount
{
  return self->_memberQueueLastPollingAttemptRTCResetCount;
}

- (void)setMemberQueueLastPollingAttemptRTCResetCount:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueLastPollingAttemptRTCResetCount, a3);
}

- (NSNumber)memberQueueLastPollingSuccessMonotonicTime
{
  return self->_memberQueueLastPollingSuccessMonotonicTime;
}

- (void)setMemberQueueLastPollingSuccessMonotonicTime:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueLastPollingSuccessMonotonicTime, a3);
}

- (NSNumber)memberQueueLastPollingSuccessRTCResetCount
{
  return self->_memberQueueLastPollingSuccessRTCResetCount;
}

- (void)setMemberQueueLastPollingSuccessRTCResetCount:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueLastPollingSuccessRTCResetCount, a3);
}

- (NSNumber)memberQueuePollingInterval
{
  return self->_memberQueuePollingInterval;
}

- (void)setMemberQueuePollingInterval:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueuePollingInterval, a3);
}

- (NSString)memberQueueCommandUUID
{
  return self->_memberQueueCommandUUID;
}

- (void)setMemberQueueCommandUUID:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueCommandUUID, a3);
}

- (NSString)memberQueueEnrollmentID
{
  return self->_memberQueueEnrollmentID;
}

- (void)setMemberQueueEnrollmentID:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueEnrollmentID, a3);
}

- (NSString)memberQueueManagingProfileIdentifier
{
  return self->_memberQueueManagingProfileIdentifier;
}

- (void)setMemberQueueManagingProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueManagingProfileIdentifier, a3);
}

- (NSString)memberQueuePushMagic
{
  return self->_memberQueuePushMagic;
}

- (void)setMemberQueuePushMagic:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueuePushMagic, a3);
}

- (NSString)memberQueueTopic
{
  return self->_memberQueueTopic;
}

- (void)setMemberQueueTopic:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueTopic, a3);
}

- (NSURL)memberQueueCheckInURL
{
  return self->_memberQueueCheckInURL;
}

- (void)setMemberQueueCheckInURL:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueCheckInURL, a3);
}

- (NSURL)memberQueueServerURL
{
  return self->_memberQueueServerURL;
}

- (void)setMemberQueueServerURL:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueServerURL, a3);
}

- (__SecIdentity)memberQueueIdentity
{
  return self->_memberQueueIdentity;
}

- (void)setMemberQueueIdentity:(__SecIdentity *)a3
{
  self->_memberQueueIdentity = a3;
}

- (int64_t)memberQueueTokenUpdateRetryCount
{
  return self->_memberQueueTokenUpdateRetryCount;
}

- (void)setMemberQueueTokenUpdateRetryCount:(int64_t)a3
{
  self->_memberQueueTokenUpdateRetryCount = a3;
}

- (id)executionQueuePushTokenWaitContinuationBlock
{
  return self->_executionQueuePushTokenWaitContinuationBlock;
}

- (void)setExecutionQueuePushTokenWaitContinuationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (BOOL)executionQueueIsCheckinInProgress
{
  return self->_executionQueueIsCheckinInProgress;
}

- (void)setExecutionQueueIsCheckinInProgress:(BOOL)a3
{
  self->_executionQueueIsCheckinInProgress = a3;
}

- (int)keybagEventToken
{
  return self->_keybagEventToken;
}

- (void)setKeybagEventToken:(int)a3
{
  self->_keybagEventToken = a3;
}

- (int)buddyDoneEventToken
{
  return self->_buddyDoneEventToken;
}

- (void)setBuddyDoneEventToken:(int)a3
{
  self->_buddyDoneEventToken = a3;
}

- (int)pairedNRDeviceEventToken
{
  return self->_pairedNRDeviceEventToken;
}

- (void)setPairedNRDeviceEventToken:(int)a3
{
  self->_pairedNRDeviceEventToken = a3;
}

- (BOOL)isObservingReachability
{
  return self->_isObservingReachability;
}

- (void)setIsObservingReachability:(BOOL)a3
{
  self->_isObservingReachability = a3;
}

- (OS_dispatch_queue)appBlockQueue
{
  return self->_appBlockQueue;
}

- (void)setAppBlockQueue:(id)a3
{
  objc_storeStrong((id *)&self->_appBlockQueue, a3);
}

- (id)appBlockCompletionBlock
{
  return self->_appBlockCompletionBlock;
}

- (void)setAppBlockCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_appBlockCompletionBlock, 0);
  objc_storeStrong((id *)&self->_appBlockQueue, 0);
  objc_storeStrong(&self->_executionQueuePushTokenWaitContinuationBlock, 0);
  objc_storeStrong((id *)&self->_memberQueueServerURL, 0);
  objc_storeStrong((id *)&self->_memberQueueCheckInURL, 0);
  objc_storeStrong((id *)&self->_memberQueueTopic, 0);
  objc_storeStrong((id *)&self->_memberQueuePushMagic, 0);
  objc_storeStrong((id *)&self->_memberQueueManagingProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_memberQueueEnrollmentID, 0);
  objc_storeStrong((id *)&self->_memberQueueCommandUUID, 0);
  objc_storeStrong((id *)&self->_memberQueuePollingInterval, 0);
  objc_storeStrong((id *)&self->_memberQueueLastPollingSuccessRTCResetCount, 0);
  objc_storeStrong((id *)&self->_memberQueueLastPollingSuccessMonotonicTime, 0);
  objc_storeStrong((id *)&self->_memberQueueLastPollingAttemptRTCResetCount, 0);
  objc_storeStrong((id *)&self->_memberQueueLastPollingAttemptMonotonicTime, 0);
  objc_storeStrong((id *)&self->_memberQueueOrganizationInfo, 0);
  objc_storeStrong((id *)&self->_memberQueueMDMOptions, 0);
  objc_storeStrong((id *)&self->_memberQueueCachedResponse, 0);
  objc_storeStrong((id *)&self->_memberQueueLastPollingSuccess, 0);
  objc_storeStrong((id *)&self->_memberQueueLastPollingAttempt, 0);
  objc_storeStrong((id *)&self->_memberQueueLastLoggedPushToken, 0);
  objc_storeStrong((id *)&self->_memberQueuePushToken, 0);
  objc_storeStrong((id *)&self->_memberQueueServerPinnedSecCertificateRefs, 0);
  objc_storeStrong((id *)&self->_memberQueueCheckInPinnedSecCertificateRefs, 0);
  objc_storeStrong((id *)&self->_depPushTokenManager, 0);
  objc_storeStrong((id *)&self->_pushServiceManager, 0);
  objc_storeStrong((id *)&self->_jobQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_appInstallBlocker, 0);
}

- (void)startOutError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222CB9000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)notifyNewConfigurationWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222CB9000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)scheduleTokenUpdateWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222CB9000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)scheduleTokenUpdateIfNecessaryWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222CB9000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)simulatePushWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222CB9000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)simulatePushIfNetworkTetheredWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222CB9000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)retryNotNowWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222CB9000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)migrateMDMWithContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222CB9000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)reauthenticationCompleteWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222CB9000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)uprootMDMWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222CB9000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processDeviceRequest:encodeResponse:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222CB9000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)pushTokenWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222CB9000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)touchWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222CB9000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processUserRequest:encodeResponse:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222CB9000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)isAwaitingUserConfiguredWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222CB9000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)depPushTokenWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222CB9000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)syncDEPPushTokenWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222CB9000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
