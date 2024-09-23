@implementation DKExtensionRequest

+ (id)requestWithExtensionAttributes:(id)a3
{
  id v3;
  DKExtensionRequest *v4;

  v3 = a3;
  v4 = -[DKExtensionRequest initWithExtensionAttributes:]([DKExtensionRequest alloc], "initWithExtensionAttributes:", v3);

  return v4;
}

- (DKExtensionRequest)initWithExtensionAttributes:(id)a3
{
  id v5;
  DKExtensionRequest *v6;
  DKExtensionRequest *v7;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *connectSemaphore;
  uint64_t v10;
  NSCopying *requestIdentifier;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DKExtensionRequest;
  v6 = -[DKExtensionRequest init](&v13, sel_init);
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      objc_storeStrong((id *)&v6->_extensionAttributes, a3);
      *(_WORD *)&v7->_canceled = 0;
      v7->_interrupted = 0;
      v8 = dispatch_semaphore_create(0);
      connectSemaphore = v7->_connectSemaphore;
      v7->_connectSemaphore = (OS_dispatch_semaphore *)v8;

      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v10 = objc_claimAutoreleasedReturnValue();
      requestIdentifier = v7->_requestIdentifier;
      v7->_requestIdentifier = (NSCopying *)v10;

      v7->_isAllowListed = 1;
    }
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (id)connectWithError:(id *)a3
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  dispatch_time_t v36;
  intptr_t v37;
  void *v38;
  _BOOL4 v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v54[6];
  _QWORD v55[6];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  _BYTE buf[24];
  void *v73;
  uint64_t *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__2;
  v60 = __Block_byref_object_dispose__2;
  v61 = 0;
  -[DKExtensionRequest extensionRequestIdentifier](self, "extensionRequestIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  if (v6)
  {
    if (!CheckerBoardServicesLibraryCore_frameworkLibrary_0)
    {
      *(_OWORD *)buf = xmmword_24F99B140;
      *(_QWORD *)&buf[16] = 0;
      CheckerBoardServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    }
    if (CheckerBoardServicesLibraryCore_frameworkLibrary_0)
    {
      v62 = 0;
      v63 = &v62;
      v64 = 0x2050000000;
      v7 = (void *)getCBSUtilitiesClass_softClass_0;
      v65 = getCBSUtilitiesClass_softClass_0;
      if (!getCBSUtilitiesClass_softClass_0)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getCBSUtilitiesClass_block_invoke_0;
        v73 = &unk_24F99AAB0;
        v74 = &v62;
        __getCBSUtilitiesClass_block_invoke_0((uint64_t)buf);
        v7 = (void *)v63[3];
      }
      v8 = objc_retainAutorelease(v7);
      _Block_object_dispose(&v62, 8);
      if (objc_msgSend(v8, "isCheckerBoardActive"))
      {
        objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "environment");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        DiagnosticsKitLogHandleForCategory(1);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          -[DKExtensionRequest requestIdentifier](self, "requestIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v12;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v10;
          _os_log_impl(&dword_22DE4C000, v11, OS_LOG_TYPE_DEFAULT, "[RID: %@] My environment: %@", buf, 0x16u);

        }
        objc_msgSend(v10, "dictionaryWithValuesForKeys:", &unk_24F9A3768);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        DiagnosticsKitLogHandleForCategory(1);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          -[DKExtensionRequest requestIdentifier](self, "requestIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v13;
          _os_log_impl(&dword_22DE4C000, v14, OS_LOG_TYPE_DEFAULT, "[RID: %@] Setting extension environment to: %@", buf, 0x16u);

        }
        -[DKExtensionRequest extensionAttributes](self, "extensionAttributes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "extension");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_plugIn");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "setEnvironment:", v13);
      }
    }
    -[DKExtensionRequest extensionAttributes](self, "extensionAttributes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isHeadless");

    if (v20)
    {
      DiagnosticsKitLogHandleForCategory(1);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        -[DKExtensionRequest requestIdentifier](self, "requestIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v22;
        _os_log_impl(&dword_22DE4C000, v21, OS_LOG_TYPE_DEFAULT, "[RID: %@] Connecting to extension without UI", buf, 0xCu);

      }
      -[DKExtensionRequest extensionAttributes](self, "extensionAttributes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "extension");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x24BDAC760];
      v55[1] = 3221225472;
      v55[2] = __39__DKExtensionRequest_connectWithError___block_invoke;
      v55[3] = &unk_24F99B0B0;
      v55[4] = self;
      v55[5] = &v56;
      objc_msgSend(v24, "beginExtensionRequestWithOptions:inputItems:completion:", 1, MEMORY[0x24BDBD1A8], v55);

    }
    else
    {
      if (!UIKitLibraryCore_frameworkLibrary)
      {
        *(_OWORD *)buf = xmmword_24F99B158;
        *(_QWORD *)&buf[16] = 0;
        UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
      }
      if (UIKitLibraryCore_frameworkLibrary)
      {
        DiagnosticsKitLogHandleForCategory(1);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          -[DKExtensionRequest requestIdentifier](self, "requestIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v26;
          _os_log_impl(&dword_22DE4C000, v25, OS_LOG_TYPE_DEFAULT, "[RID: %@] Connecting to extension with UI", buf, 0xCu);

        }
        -[DKExtensionRequest extensionAttributes](self, "extensionAttributes");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "extension");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = MEMORY[0x24BDAC760];
        v54[1] = 3221225472;
        v54[2] = __39__DKExtensionRequest_connectWithError___block_invoke_12;
        v54[3] = &unk_24F99B0D8;
        v54[4] = self;
        v54[5] = &v56;
        objc_msgSend(v28, "instantiateViewControllerWithInputItems:connectionHandler:", MEMORY[0x24BDBD1A8], v54);

      }
      else
      {
        v29 = (void *)MEMORY[0x24BDD1540];
        v70 = *MEMORY[0x24BDD0FC8];
        DKErrorLocalizedDescriptionForCode(-1001);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v30;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), -1001, v31);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v57[5];
        v57[5] = v32;

        -[DKExtensionRequest connectSemaphore](self, "connectSemaphore");
        v34 = objc_claimAutoreleasedReturnValue();
        dispatch_semaphore_signal(v34);

      }
    }
    -[DKExtensionRequest connectSemaphore](self, "connectSemaphore");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = dispatch_time(0, 5000000000);
    v37 = dispatch_semaphore_wait(v35, v36);

    -[DKExtensionRequest extensionRequestIdentifier](self, "extensionRequestIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38 || (v39 = -[DKExtensionRequest isInterrupted](self, "isInterrupted"), v38, v39))
    {
      if (-[DKExtensionRequest isInterrupted](self, "isInterrupted"))
      {
        DiagnosticsKitLogHandleForCategory(1);
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          -[DKExtensionRequest requestIdentifier](self, "requestIdentifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[DKExtensionRequest connectWithError:].cold.1(v41, (uint64_t)buf, v40);
        }

        v42 = (void *)MEMORY[0x24BDD1540];
        v68 = *MEMORY[0x24BDD0FC8];
        DKErrorLocalizedDescriptionForCode(-1002);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v43;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), -1001, v44);
        v45 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v37)
        {
          DiagnosticsKitLogHandleForCategory(1);
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            -[DKExtensionRequest requestIdentifier](self, "requestIdentifier");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[DKExtensionRequest connectWithError:].cold.3(v47, (uint64_t)buf, v46);
          }
        }
        else
        {
          DiagnosticsKitLogHandleForCategory(1);
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            -[DKExtensionRequest requestIdentifier](self, "requestIdentifier");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[DKExtensionRequest connectWithError:].cold.2(v48, (uint64_t)buf, v46);
          }
        }

        v49 = (void *)MEMORY[0x24BDD1540];
        v66 = *MEMORY[0x24BDD0FC8];
        DKErrorLocalizedDescriptionForCode(-1001);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v43;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), -1001, v44);
        v45 = objc_claimAutoreleasedReturnValue();
      }
      v50 = (void *)v57[5];
      v57[5] = v45;

      -[DKExtensionRequest payload](self, "payload");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKExtensionRequest _finishWithResult:error:](self, "_finishWithResult:error:", v51, v57[5]);

    }
    if (a3)
      *a3 = objc_retainAutorelease((id)v57[5]);
  }
  -[DKExtensionRequest extensionRequestIdentifier](self, "extensionRequestIdentifier");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v56, 8);

  return v52;
}

void __39__DKExtensionRequest_connectWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  DiagnosticsKitLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v12 = 138413058;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_22DE4C000, v7, OS_LOG_TYPE_DEFAULT, "[RID: %@] [ERID: %@] Extension connected: %@, error: %@", (uint8_t *)&v12, 0x2Au);

  }
  v10 = *(id *)(a1 + 32);
  objc_sync_enter(v10);
  if ((objc_msgSend(*(id *)(a1 + 32), "isInterrupted") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    objc_msgSend(*(id *)(a1 + 32), "setExtensionRequestIdentifier:", v5);
    objc_msgSend(*(id *)(a1 + 32), "connectSemaphore");
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v11);

  }
  objc_sync_exit(v10);

}

void __39__DKExtensionRequest_connectWithError___block_invoke_12(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  DiagnosticsKitLogHandleForCategory(1);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v15 = 138413058;
    v16 = v11;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_22DE4C000, v10, OS_LOG_TYPE_DEFAULT, "[RID: %@] [ERID: %@] Extension connected: %@, error: %@", (uint8_t *)&v15, 0x2Au);

  }
  v13 = *(id *)(a1 + 32);
  objc_sync_enter(v13);
  if ((objc_msgSend(*(id *)(a1 + 32), "isInterrupted") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
    objc_msgSend(*(id *)(a1 + 32), "setExtensionRequestIdentifier:", v7);
    objc_msgSend(*(id *)(a1 + 32), "setRemoteViewController:", v8);
    objc_msgSend(*(id *)(a1 + 32), "connectSemaphore");
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v14);

  }
  objc_sync_exit(v13);

}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  DKExtensionRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[DKExtensionRequest requestIdentifier](self, "requestIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl(&dword_22DE4C000, v3, OS_LOG_TYPE_DEFAULT, "[RID: %@] Cancel requested for extension.", buf, 0xCu);

  }
  v5 = self;
  objc_sync_enter(v5);
  -[DKExtensionRequest setCanceled:](v5, "setCanceled:", 1);
  objc_sync_exit(v5);

  -[DKExtensionRequest hostAdapter](v5, "hostAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCF40];
    -[DKExtensionRequest extensionRequestIdentifier](v5, "extensionRequestIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v5, sel__cancelTimedOutWithInfo_, v8, 0, 5.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1710], "currentQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKExtensionRequest hostAdapter](v5, "hostAdapter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __28__DKExtensionRequest_cancel__block_invoke;
    v15[3] = &unk_24F99ABB0;
    v16 = v10;
    v17 = v9;
    v12 = v9;
    v13 = v10;
    objc_msgSend(v11, "cancelWithCompletion:", v15);

  }
  else
  {
    DiagnosticsKitLogHandleForCategory(1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[DKExtensionRequest requestIdentifier](v5, "requestIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v14;
      _os_log_impl(&dword_22DE4C000, v13, OS_LOG_TYPE_DEFAULT, "[RID: %@] Premature cancel; scheduled for after setup is complete.",
        buf,
        0xCu);

    }
  }

}

void __28__DKExtensionRequest_cancel__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __28__DKExtensionRequest_cancel__block_invoke_2;
  v2[3] = &unk_24F99AA50;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "addOperationWithBlock:", v2);

}

uint64_t __28__DKExtensionRequest_cancel__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)setNotAllowListedWithContactMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DiagnosticsKitLogHandleForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_22DE4C000, v5, OS_LOG_TYPE_DEFAULT, "Called setNotAllowListedWithContactMessage: %@", (uint8_t *)&v8, 0xCu);
  }

  -[DKExtensionRequest setIsAllowListed:](self, "setIsAllowListed:", 0);
  -[DKExtensionRequest setAllowListContactMessage:](self, "setAllowListContactMessage:", v4);
  -[DKExtensionRequest hostAdapter](self, "hostAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DKExtensionRequest hostAdapter](self, "hostAdapter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNotAllowListedWithContactMessage:", v4);

  }
}

- (void)beginWithPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  objc_class *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint8_t buf[16];
  Class (*v44)(uint64_t);
  void *v45;
  uint64_t *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DKExtensionRequest extensionAttributes](self, "extensionAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKExtensionRequest extensionRequestIdentifier](self, "extensionRequestIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_extensionContextForUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  DiagnosticsKitLogHandleForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[DKExtensionRequest requestIdentifier](self, "requestIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v10;
    _os_log_impl(&dword_22DE4C000, v9, OS_LOG_TYPE_DEFAULT, "[RID: %@] Calling startWithPayload on the remote object proxy.", buf, 0xCu);

  }
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_255DD0240)
    && -[DKExtensionRequest _extensionContext:hasEntitlement:](self, "_extensionContext:hasEntitlement:", v8, CFSTR("com.apple.DiagnosticsKit.extension")))
  {
    -[DKExtensionRequest setHostAdapter:](self, "setHostAdapter:", v8);
    -[DKExtensionRequest hostAdapter](self, "hostAdapter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", self);

    if (!RunningBoardServicesLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)buf = xmmword_24F99B170;
      v44 = 0;
      RunningBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    v12 = MEMORY[0x24BDAC760];
    if (RunningBoardServicesLibraryCore_frameworkLibrary)
    {
      v36 = 0;
      v37 = &v36;
      v38 = 0x2050000000;
      v13 = (void *)getRBSTargetClass_softClass;
      v39 = getRBSTargetClass_softClass;
      if (!getRBSTargetClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        v44 = __getRBSTargetClass_block_invoke;
        v45 = &unk_24F99AAB0;
        v46 = &v36;
        __getRBSTargetClass_block_invoke((uint64_t)buf);
        v13 = (void *)v37[3];
      }
      v14 = objc_retainAutorelease(v13);
      _Block_object_dispose(&v36, 8);
      objc_msgSend(v8, "_auxiliaryConnection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "targetWithPid:", objc_msgSend(v15, "processIdentifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = 0;
      v37 = &v36;
      v38 = 0x2050000000;
      v17 = (void *)getRBSDomainAttributeClass_softClass;
      v39 = getRBSDomainAttributeClass_softClass;
      if (!getRBSDomainAttributeClass_softClass)
      {
        *(_QWORD *)buf = v12;
        *(_QWORD *)&buf[8] = 3221225472;
        v44 = __getRBSDomainAttributeClass_block_invoke;
        v45 = &unk_24F99AAB0;
        v46 = &v36;
        __getRBSDomainAttributeClass_block_invoke((uint64_t)buf);
        v17 = (void *)v37[3];
      }
      v18 = objc_retainAutorelease(v17);
      _Block_object_dispose(&v36, 8);
      objc_msgSend(v18, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskUninterruptable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      v37 = &v36;
      v38 = 0x2050000000;
      v20 = (void *)getRBSAssertionClass_softClass;
      v39 = getRBSAssertionClass_softClass;
      if (!getRBSAssertionClass_softClass)
      {
        *(_QWORD *)buf = v12;
        *(_QWORD *)&buf[8] = 3221225472;
        v44 = __getRBSAssertionClass_block_invoke;
        v45 = &unk_24F99AAB0;
        v46 = &v36;
        __getRBSAssertionClass_block_invoke((uint64_t)buf);
        v20 = (void *)v37[3];
      }
      v21 = objc_retainAutorelease(v20);
      _Block_object_dispose(&v36, 8);
      v22 = [v21 alloc];
      v42 = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "initWithExplanation:target:attributes:", CFSTR("Diagnostics App Requested Task Assertion"), v16, v23);
      -[DKExtensionRequest setRbprocessAssertion:](self, "setRbprocessAssertion:", v24);

      -[DKExtensionRequest rbprocessAssertion](self, "rbprocessAssertion");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "acquireWithError:", 0);

    }
    if (!-[DKExtensionRequest isAllowListed](self, "isAllowListed"))
    {
      -[DKExtensionRequest hostAdapter](self, "hostAdapter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKExtensionRequest allowListContactMessage](self, "allowListContactMessage");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setNotAllowListedWithContactMessage:", v27);

    }
    -[DKExtensionRequest hostAdapter](self, "hostAdapter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v12;
    v35[1] = 3221225472;
    v35[2] = __39__DKExtensionRequest_beginWithPayload___block_invoke;
    v35[3] = &unk_24F99B120;
    v35[4] = self;
    objc_msgSend(v28, "startWithPayload:completion:", v4, v35);

  }
  else
  {
    DiagnosticsKitLogHandleForCategory(1);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[DKExtensionRequest beginWithPayload:].cold.1(self, v29);

    v30 = (void *)MEMORY[0x24BDD1540];
    v40 = *MEMORY[0x24BDD0FC8];
    DKErrorLocalizedDescriptionForCode(-1006);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v31;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), -1006, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[DKExtensionRequest delegate](self, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "request:didCompleteWithPayload:error:", self, 0, v33);

  }
}

void __39__DKExtensionRequest_beginWithPayload___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_22DE4C000, v4, OS_LOG_TYPE_DEFAULT, "[RID: %@] Got completion from startWithPayload from the remote object proxy.", buf, 0xCu);

  }
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (objc_msgSend(*(id *)(a1 + 32), "isCanceled"))
    objc_msgSend(*(id *)(a1 + 32), "cancel");
  objc_sync_exit(v6);

  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) != 0)
    goto LABEL_10;
  objc_msgSend(*(id *)(a1 + 32), "remoteViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    a2 = 0;

  if (!a2)
  {
LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "setRemoteViewController:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "hostAdapter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __39__DKExtensionRequest_beginWithPayload___block_invoke_86;
    v9[3] = &unk_24F99B120;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "checkShouldShowViewController:", v9);

  }
}

void __39__DKExtensionRequest_beginWithPayload___block_invoke_86(uint64_t a1, int a2)
{
  void *v3;
  int v4;
  _QWORD block[5];

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "hostServicesDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_255DD2820);

    if (v4)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __39__DKExtensionRequest_beginWithPayload___block_invoke_2;
      block[3] = &unk_24F99AA50;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
}

void __39__DKExtensionRequest_beginWithPayload___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "hostServicesDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request:presentViewController:completion:", v2, v3, &__block_literal_global_12);

}

- (void)interrupt
{
  NSObject *v3;
  void *v4;
  DKExtensionRequest *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  DKExtensionRequest *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[DKExtensionRequest requestIdentifier](self, "requestIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v4;
    v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_22DE4C000, v3, OS_LOG_TYPE_DEFAULT, "[RID: %@] interrupt: %@", buf, 0x16u);

  }
  v5 = self;
  objc_sync_enter(v5);
  -[DKExtensionRequest setInterrupted:](v5, "setInterrupted:", 1);
  -[DKExtensionRequest connectSemaphore](v5, "connectSemaphore");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v6);

  objc_sync_exit(v5);
  v7 = (void *)MEMORY[0x24BDD1540];
  v11 = *MEMORY[0x24BDD0FC8];
  DKErrorLocalizedDescriptionForCode(-1002);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), -1002, v9, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[DKExtensionRequest _finishWithResult:error:](v5, "_finishWithResult:error:", 0, v10);
}

- (void)cancelWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  DKExtensionRequest *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DiagnosticsKitLogHandleForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[DKExtensionRequest requestIdentifier](self, "requestIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_22DE4C000, v5, OS_LOG_TYPE_DEFAULT, "[RID: %@] cancelWithError: %@", buf, 0x16u);

  }
  v7 = (void *)MEMORY[0x24BDD1540];
  v11[0] = *MEMORY[0x24BDD0FC8];
  DKErrorLocalizedDescriptionForCode(-1003);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = *MEMORY[0x24BDD1398];
  v12[0] = v8;
  v12[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), -1003, v9, v11[0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[DKExtensionRequest _finishWithResult:error:](self, "_finishWithResult:error:", 0, v10);
}

- (void)complete
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  DKExtensionRequest *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[DKExtensionRequest requestIdentifier](self, "requestIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_22DE4C000, v3, OS_LOG_TYPE_DEFAULT, "[RID: %@] complete: %@", (uint8_t *)&v6, 0x16u);

  }
  -[DKExtensionRequest payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKExtensionRequest _finishWithResult:error:](self, "_finishWithResult:error:", v5, 0);

}

- (void)cancelExtensionRequest
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[DKExtensionRequest extensionRequestIdentifier](self, "extensionRequestIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DKExtensionRequest extensionAttributes](self, "extensionAttributes");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKExtensionRequest extensionRequestIdentifier](self, "extensionRequestIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelExtensionRequestWithIdentifier:", v5);

  }
}

- (void)completeWithPayload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  DiagnosticsKitLogHandleForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[DKExtensionRequest requestIdentifier](self, "requestIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v9;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "[RID: %@] completeWithPayload: %@", (uint8_t *)&v10, 0x16u);

  }
  -[DKExtensionRequest setPayload:](self, "setPayload:", v6);
  -[DKExtensionRequest dismissViewControllerWithCompletion:](self, "dismissViewControllerWithCompletion:", v7);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKExtensionRequest requestIdentifier](self, "requestIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKExtensionRequest extensionRequestIdentifier](self, "extensionRequestIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; [RID: %@] [ERID: %@] canceled: %d, completed: %d, interrupted: %d>"),
    v5,
    self,
    v6,
    v7,
    -[DKExtensionRequest isCanceled](self, "isCanceled"),
    -[DKExtensionRequest isCompleted](self, "isCompleted"),
    -[DKExtensionRequest isInterrupted](self, "isInterrupted"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)_cancelTimedOutWithInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DKExtensionRequest extensionAttributes](self, "extensionAttributes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelExtensionRequestWithIdentifier:", v4);

}

- (void)dismissViewControllerWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;
  DKExtensionRequest *v13;
  void (**v14)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[DKExtensionRequest remoteViewController](self, "remoteViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[DKExtensionRequest hostServicesDelegate](self, "hostServicesDelegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "conformsToProtocol:", &unk_255DD2820),
        v7,
        v6,
        v8))
  {
    -[DKExtensionRequest remoteViewController](self, "remoteViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKExtensionRequest setRemoteViewController:](self, "setRemoteViewController:", 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__DKExtensionRequest_dismissViewControllerWithCompletion___block_invoke;
    block[3] = &unk_24F99AD38;
    v12 = v9;
    v13 = self;
    v14 = v4;
    v10 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    v4[2](v4);
  }

}

void __58__DKExtensionRequest_dismissViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "hostServicesDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "request:dismissViewController:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (void)_finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  DKExtensionRequest *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!-[DKExtensionRequest isCompleted](self, "isCompleted"))
  {
    -[DKExtensionRequest setCompleted:](self, "setCompleted:", 1);
    DiagnosticsKitLogHandleForCategory(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[DKExtensionRequest requestIdentifier](self, "requestIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v14 = v9;
      v15 = 2112;
      v16 = self;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "[RID: %@] Finishing %@ with result: %@, error: %@", buf, 0x2Au);

    }
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __46__DKExtensionRequest__finishWithResult_error___block_invoke;
    v10[3] = &unk_24F99AF40;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    -[DKExtensionRequest dismissViewControllerWithCompletion:](self, "dismissViewControllerWithCompletion:", v10);

  }
}

uint64_t __46__DKExtensionRequest__finishWithResult_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "request:didCompleteWithPayload:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "rbprocessAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  return objc_msgSend(*(id *)(a1 + 32), "setRbprocessAssertion:", 0);
}

- (BOOL)_extensionContext:(id)a3 hasEntitlement:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "_auxiliaryConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForEntitlement:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "BOOLValue");
  return (char)v6;
}

- (DKRequestDelegate)delegate
{
  return (DKRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)hostServicesDelegate
{
  return objc_loadWeakRetained(&self->_hostServicesDelegate);
}

- (void)setHostServicesDelegate:(id)a3
{
  objc_storeWeak(&self->_hostServicesDelegate, a3);
}

- (NSCopying)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSCopying)extensionRequestIdentifier
{
  return self->_extensionRequestIdentifier;
}

- (void)setExtensionRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_extensionRequestIdentifier, a3);
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (DKExtensionAttributes)extensionAttributes
{
  return self->_extensionAttributes;
}

- (void)setExtensionAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_extensionAttributes, a3);
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (UIViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (DKExtensionHostAdapter)hostAdapter
{
  return self->_hostAdapter;
}

- (void)setHostAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_hostAdapter, a3);
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (id)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong(&self->_payload, a3);
}

- (OS_dispatch_semaphore)connectSemaphore
{
  return self->_connectSemaphore;
}

- (void)setConnectSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_connectSemaphore, a3);
}

- (BOOL)isInterrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (RBSAssertion)rbprocessAssertion
{
  return self->_rbprocessAssertion;
}

- (void)setRbprocessAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_rbprocessAssertion, a3);
}

- (BOOL)isAllowListed
{
  return self->_isAllowListed;
}

- (void)setIsAllowListed:(BOOL)a3
{
  self->_isAllowListed = a3;
}

- (NSString)allowListContactMessage
{
  return self->_allowListContactMessage;
}

- (void)setAllowListContactMessage:(id)a3
{
  objc_storeStrong((id *)&self->_allowListContactMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowListContactMessage, 0);
  objc_storeStrong((id *)&self->_rbprocessAssertion, 0);
  objc_storeStrong((id *)&self->_connectSemaphore, 0);
  objc_storeStrong(&self->_payload, 0);
  objc_storeStrong((id *)&self->_hostAdapter, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_extensionAttributes, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_extensionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_destroyWeak(&self->_hostServicesDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)connectWithError:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_22DE4C000, a3, (uint64_t)a3, "[RID: %@] Connect interrupted", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_1();
}

- (void)connectWithError:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_22DE4C000, a3, (uint64_t)a3, "[RID: %@] Connect failed", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_1();
}

- (void)connectWithError:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_22DE4C000, a3, (uint64_t)a3, "[RID: %@] Connect timed out", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_1();
}

- (void)beginWithPayload:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "requestIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_22DE4C000, a2, v4, "[RID: %@] Cannot start extension. Entitlement is missing.", (uint8_t *)&v5);

}

@end
