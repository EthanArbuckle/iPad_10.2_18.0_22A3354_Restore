@implementation HMIVideoAnalyzerClient

- (HMIVideoAnalyzerClient)initWithConfiguration:(id)a3 identifier:(id)a4
{
  HMIVideoAnalyzerClient *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *workQueue;
  VCPHomeKitAnalysisSession *session;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HMIVideoAnalyzerClient;
  v4 = -[HMIVideoAnalyzer initWithConfiguration:identifier:](&v10, sel_initWithConfiguration_identifier_, a3, a4);
  if (v4)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("HMIVideoAnalyzerClient", v5);
    workQueue = v4->_workQueue;
    v4->_workQueue = (OS_dispatch_queue *)v6;

    session = v4->_session;
    v4->_session = 0;

    v4->_sessionCreationAttempted = 0;
    v4->_hasFailed = 0;
  }
  return v4;
}

- (id)ensureSession
{
  void *v3;
  void *v4;
  void *v6;
  HMIVideoAnalyzerClient *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMIVideoAnalyzerClient *v20;
  NSObject *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _BYTE buf[24];
  void *v36;
  uint64_t *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[HMIVideoAnalyzerClient session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_4:
    -[HMIVideoAnalyzerClient session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (-[HMIVideoAnalyzerClient sessionCreationAttempted](self, "sessionCreationAttempted"))
    goto LABEL_4;
  v6 = (void *)MEMORY[0x220735570]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v9;
    _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Creating Remote Session", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_initWeak(&location, v7);
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v10 = (void *)getVCPHomeKitAnalysisSessionClass_softClass;
  v32 = getVCPHomeKitAnalysisSessionClass_softClass;
  v11 = MEMORY[0x24BDAC760];
  if (!getVCPHomeKitAnalysisSessionClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getVCPHomeKitAnalysisSessionClass_block_invoke;
    v36 = &unk_24DBE9EA0;
    v37 = &v29;
    __getVCPHomeKitAnalysisSessionClass_block_invoke((uint64_t)buf);
    v10 = (void *)v30[3];
  }
  v12 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v29, 8);
  v33[0] = CFSTR("configuration");
  -[HMIVideoAnalyzer configuration](v7, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = CFSTR("identifier");
  v34[0] = v13;
  -[HMIVideoAnalyzer identifier](v7, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v11;
  v26[1] = 3221225472;
  v26[2] = __39__HMIVideoAnalyzerClient_ensureSession__block_invoke;
  v26[3] = &unk_24DBEE480;
  objc_copyWeak(&v27, &location);
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __39__HMIVideoAnalyzerClient_ensureSession__block_invoke_208;
  v24[3] = &unk_24DBEE4A8;
  objc_copyWeak(&v25, &location);
  objc_msgSend(v12, "sessionWithProperties:withResultsHandler:andInterruptionHandler:", v15, v26, v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerClient setSession:](v7, "setSession:", v16);

  -[HMIVideoAnalyzerClient session](v7, "session");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = v17 == 0;

  if ((_DWORD)v13)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiErrorWithCode:description:", -1, CFSTR("VCPHomeKitAnalysisSession connection failed."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerClient _didFailWithError:](v7, "_didFailWithError:", v18);

  }
  v19 = (void *)MEMORY[0x220735570]();
  v20 = v7;
  HMFGetOSLogHandle();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerClient session](v20, "session");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v23;
    _os_log_impl(&dword_219D45000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Created Remote Session %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
  -[HMIVideoAnalyzerClient setSessionCreationAttempted:](v20, "setSessionCreationAttempted:", 1);
  -[HMIVideoAnalyzerClient session](v20, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
  return v4;
}

void __39__HMIVideoAnalyzerClient_ensureSession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSString *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x220735570]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v8;
    v21 = 2112;
    v22 = v3;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Received Result: %@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("selector"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  v11 = (char *)NSSelectorFromString(v10);
  if (v11 == sel_analyzer_didAnalyzeFrameWithResult_)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("arguments"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_22;
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "analyzer:didAnalyzeFrameWithResult:", v6, v13);
LABEL_21:

    goto LABEL_22;
  }
  if (v11 == sel_analyzer_didAnalyzeFragmentWithResult_)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("arguments"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homePersonManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "analysisStateManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finalizeFragmentResult:homePersonManager:analysisStateManager:", v16, v17, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "analyzer:didAnalyzeFragmentWithResult:", v6, v13);
    goto LABEL_21;
  }
  if (v11 == sel_analyzer_didFailWithError_)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("arguments"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_22;
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "analyzer:didFailWithError:", v6, v13);
    goto LABEL_21;
  }
  if (v11 == sel_analyzer_didCreateTimelapseFragment_)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("arguments"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "analyzer:didCreateTimelapseFragment:", v6, v13);
      goto LABEL_21;
    }
LABEL_22:

    goto LABEL_23;
  }
  if (v11 == sel_analyzer_didProduceAnalysisStateUpdate_)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("arguments"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "analysisStateManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && v13)
    {
      objc_msgSend(v6, "analysisStateManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "publishLocalState:", v13);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "analyzer:didProduceAnalysisStateUpdate:", v6, v13);
    goto LABEL_21;
  }
LABEL_23:

}

void __39__HMIVideoAnalyzerClient_ensureSession__block_invoke_208(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDD1540], "hmiErrorWithCode:description:", -1, CFSTR("VCPHomeKitAnalysisSession connection was invalidated / interrupted."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_didFailWithError:", v1);

}

- (void)_didFailWithError:(id)a3
{
  id v4;
  void *v5;
  HMIVideoAnalyzerClient *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMIVideoAnalyzerClient hasFailed](self, "hasFailed"))
  {
    v5 = (void *)MEMORY[0x220735570]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Analyzer has already failed.", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    HMIErrorLog(self, v4);
    -[HMIVideoAnalyzer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "analyzer:didFailWithError:", self, v4);
    -[HMIVideoAnalyzerClient setHasFailed:](self, "setHasFailed:", 1);

  }
}

- (void)_sendMessageWithOptions:(id)a3 asynchronous:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  HMIVideoAnalyzerClient *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *workQueue;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v6 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x220735570]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v13;
    v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Sending Message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMIVideoAnalyzerClient ensureSession](v11, "ensureSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    workQueue = v11->_workQueue;
    if (v6)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __81__HMIVideoAnalyzerClient__sendMessageWithOptions_asynchronous_completionHandler___block_invoke;
      block[3] = &unk_24DBE9AA8;
      v23 = v14;
      v24 = v8;
      v25 = v9;
      dispatch_async(workQueue, block);

      v17 = v23;
    }
    else
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __81__HMIVideoAnalyzerClient__sendMessageWithOptions_asynchronous_completionHandler___block_invoke_3;
      v18[3] = &unk_24DBE9AA8;
      v19 = v14;
      v20 = v8;
      v21 = v9;
      dispatch_sync(workQueue, v18);

      v17 = v19;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiErrorWithCode:description:", -1, CFSTR("VCPHomeKitAnalysisSession is not available."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v17);
  }

}

void __81__HMIVideoAnalyzerClient__sendMessageWithOptions_asynchronous_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __81__HMIVideoAnalyzerClient__sendMessageWithOptions_asynchronous_completionHandler___block_invoke_2;
  v3[3] = &unk_24DBEBB90;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "processMessageWithOptions:andCompletionHandler:", v2, v3);

}

uint64_t __81__HMIVideoAnalyzerClient__sendMessageWithOptions_asynchronous_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __81__HMIVideoAnalyzerClient__sendMessageWithOptions_asynchronous_completionHandler___block_invoke_3(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  dispatch_semaphore_t v8;
  id v9;

  v2 = dispatch_semaphore_create(0);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__HMIVideoAnalyzerClient__sendMessageWithOptions_asynchronous_completionHandler___block_invoke_4;
  v7[3] = &unk_24DBEE4D0;
  v5 = *(id *)(a1 + 48);
  v8 = v2;
  v9 = v5;
  v6 = v2;
  objc_msgSend(v3, "processMessageWithOptions:andCompletionHandler:", v4, v7);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t __81__HMIVideoAnalyzerClient__sendMessageWithOptions_asynchronous_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_sendMessage:(SEL)a3 arguments:(id)a4 asynchronous:(BOOL)a5
{
  -[HMIVideoAnalyzerClient _sendMessage:arguments:asynchronous:completionHandler:](self, "_sendMessage:arguments:asynchronous:completionHandler:", a3, a4, a5, 0);
}

- (void)_sendMessage:(SEL)a3 arguments:(id)a4 asynchronous:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v7 = a5;
  v16[1] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  v15 = CFSTR("selector");
  NSStringFromSelector(a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  if (v10)
    objc_msgSend(v14, "setObject:forKey:", v10, CFSTR("arguments"));
  -[HMIVideoAnalyzerClient _sendMessageWithOptions:asynchronous:completionHandler:](self, "_sendMessageWithOptions:asynchronous:completionHandler:", v14, v7, v11);

}

- (void)handleAssetData:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v14[0] = a3;
  v14[1] = a4;
  v9 = (void *)MEMORY[0x24BDBCE30];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMIVideoAnalyzerClient _sendMessage:arguments:asynchronous:completionHandler:](self, "_sendMessage:arguments:asynchronous:completionHandler:", a2, v13, 0, v10);
}

- (void)handleMessageWithOptions:(id)a3 completionHandler:(id)a4
{
  -[HMIVideoAnalyzerClient _sendMessageWithOptions:asynchronous:completionHandler:](self, "_sendMessageWithOptions:asynchronous:completionHandler:", a3, 0, a4);
}

- (void)flush
{
  -[HMIVideoAnalyzerClient _sendMessage:arguments:asynchronous:](self, "_sendMessage:arguments:asynchronous:", a2, 0, 0);
}

- (void)flushAsync
{
  -[HMIVideoAnalyzerClient _sendMessage:arguments:asynchronous:](self, "_sendMessage:arguments:asynchronous:", a2, 0, 1);
}

- (void)finishWithCompletionHandler:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__HMIVideoAnalyzerClient_finishWithCompletionHandler___block_invoke;
  v7[3] = &unk_24DBEBB90;
  v8 = v5;
  v6 = v5;
  -[HMIVideoAnalyzerClient _sendMessage:arguments:asynchronous:completionHandler:](self, "_sendMessage:arguments:asynchronous:completionHandler:", a2, 0, 1, v7);

}

uint64_t __54__HMIVideoAnalyzerClient_finishWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancel
{
  -[HMIVideoAnalyzerClient _sendMessage:arguments:asynchronous:](self, "_sendMessage:arguments:asynchronous:", a2, 0, 0);
}

- (void)setAnalysisFPS:(double)a3
{
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerClient _sendMessage:arguments:asynchronous:](self, "_sendMessage:arguments:asynchronous:", a2, v6, 0);

}

- (void)setMonitored:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerClient _sendMessage:arguments:asynchronous:](self, "_sendMessage:arguments:asynchronous:", a2, v6, 0);

}

- (void)setEncode:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerClient _sendMessage:arguments:asynchronous:](self, "_sendMessage:arguments:asynchronous:", a2, v6, 0);

}

- (void)dealloc
{
  void *v3;
  HMIVideoAnalyzerClient *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x220735570](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v6;
    _os_log_impl(&dword_219D45000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Invalidating XPC Connection", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMIVideoAnalyzerClient session](v4, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMIVideoAnalyzerClient session](v4, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

  }
  v9.receiver = v4;
  v9.super_class = (Class)HMIVideoAnalyzerClient;
  -[HMIVideoAnalyzer dealloc](&v9, sel_dealloc);
}

- (BOOL)hasFailed
{
  return self->_hasFailed;
}

- (void)setHasFailed:(BOOL)a3
{
  self->_hasFailed = a3;
}

- (BOOL)sessionCreationAttempted
{
  return self->_sessionCreationAttempted;
}

- (void)setSessionCreationAttempted:(BOOL)a3
{
  self->_sessionCreationAttempted = a3;
}

- (VCPHomeKitAnalysisSession)session
{
  return (VCPHomeKitAnalysisSession *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
