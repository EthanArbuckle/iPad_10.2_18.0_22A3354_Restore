@implementation NDAnalyticsEnvelopeManager

- (NDAnalyticsEnvelopeManager)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NDAnalyticsEnvelopeManager init]";
    v9 = 2080;
    v10 = "NDAnalyticsEnvelopeManager.m";
    v11 = 1024;
    v12 = 58;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_214674000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NDAnalyticsEnvelopeManager init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NDAnalyticsEnvelopeManager)initWithAppConfigurationManager:(id)a3 telemetryUploader:(id)a4 storeDirectoryFileURL:(id)a5 URLSessionQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NDAnalyticsEnvelopeManager *v14;
  uint64_t v15;
  FCAsyncSerialQueue *submissionQueue;
  NDAnalyticsEnvelopeStore *v17;
  NDAnalyticsEnvelopeStore *envelopeStore;
  NDAnalyticsEnvelopeStore *v19;
  NDAppConfigAnalyticsPayloadAssemblerConfigProvider *v20;
  NDAnalyticsPayloadAssembler *v21;
  NDAnalyticsPayloadAssembler *payloadAssembler;
  NDAnalyticsPayloadUploader *v23;
  NDAnalyticsPayloadUploader *payloadUploader;
  NDAnalyticsUploadScheduler *v25;
  NDAnalyticsUploadScheduler *uploadScheduler;
  NDAnalyticsUploadScheduler *v27;
  id v28;
  void *v29;
  uint64_t v30;
  FCKeyValueStore *lastUploadDatesByContentType;
  uint64_t v32;
  NFMutexLock *keyValueStoreLock;
  objc_super v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NDAnalyticsEnvelopeManager initWithAppConfigurationManager:telemetryUploader:storeDirectoryFileURL:URLSessionQueue:].cold.3();
    if (v12)
      goto LABEL_6;
  }
  else if (v12)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsEnvelopeManager initWithAppConfigurationManager:telemetryUploader:storeDirectoryFileURL:URLSessionQueue:].cold.2();
LABEL_6:
  if (!v13 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsEnvelopeManager initWithAppConfigurationManager:telemetryUploader:storeDirectoryFileURL:URLSessionQueue:].cold.1();
  v35.receiver = self;
  v35.super_class = (Class)NDAnalyticsEnvelopeManager;
  v14 = -[NDAnalyticsEnvelopeManager init](&v35, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CAE0]), "initWithQualityOfService:", -1);
    submissionQueue = v14->_submissionQueue;
    v14->_submissionQueue = (FCAsyncSerialQueue *)v15;

    objc_storeStrong((id *)&v14->_URLSessionQueue, a6);
    objc_storeStrong((id *)&v14->_telemetryUploader, a4);
    v17 = -[NDAnalyticsEnvelopeStore initWithStoreDirectoryFileURL:]([NDAnalyticsEnvelopeStore alloc], "initWithStoreDirectoryFileURL:", v12);
    -[NDAnalyticsEnvelopeStore setObserver:](v17, "setObserver:", v14);
    -[NDAnalyticsEnvelopeStore enableFlushing](v17, "enableFlushing");
    envelopeStore = v14->_envelopeStore;
    v14->_envelopeStore = v17;
    v19 = v17;

    v20 = -[NDAppConfigAnalyticsPayloadAssemblerConfigProvider initWithAppConfigurationManager:]([NDAppConfigAnalyticsPayloadAssemblerConfigProvider alloc], "initWithAppConfigurationManager:", v10);
    v21 = -[NDAnalyticsPayloadAssembler initWithConfigProvider:maxPayloadSize:]([NDAnalyticsPayloadAssembler alloc], "initWithConfigProvider:maxPayloadSize:", v20, 1000000);
    payloadAssembler = v14->_payloadAssembler;
    v14->_payloadAssembler = v21;

    v23 = -[NDAnalyticsPayloadUploader initWithAppConfigurationManager:]([NDAnalyticsPayloadUploader alloc], "initWithAppConfigurationManager:", v10);
    payloadUploader = v14->_payloadUploader;
    v14->_payloadUploader = v23;

    v25 = -[NDAnalyticsUploadScheduler initWithURLSessionQueue:]([NDAnalyticsUploadScheduler alloc], "initWithURLSessionQueue:", v13);
    -[NDAnalyticsUploadScheduler setDelegate:](v25, "setDelegate:", v14);
    uploadScheduler = v14->_uploadScheduler;
    v14->_uploadScheduler = v25;
    v27 = v25;

    v28 = objc_alloc(MEMORY[0x24BE6CC28]);
    objc_msgSend(v12, "path");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "initWithName:directory:version:options:classRegistry:", CFSTR("last-upload"), v29, 1, 0, 0);
    lastUploadDatesByContentType = v14->_lastUploadDatesByContentType;
    v14->_lastUploadDatesByContentType = (FCKeyValueStore *)v30;

    v32 = objc_opt_new();
    keyValueStoreLock = v14->_keyValueStoreLock;
    v14->_keyValueStoreLock = (NFMutexLock *)v32;

  }
  return v14;
}

- (void)handleLaunchEventForBackgroundSessionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsEnvelopeManager handleLaunchEventForBackgroundSessionWithIdentifier:completion:].cold.1();
  -[NDAnalyticsEnvelopeManager uploadScheduler](self, "uploadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleLaunchEventForBackgroundSessionWithIdentifier:completion:", v6, v7);

}

- (void)submitEnvelopes:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  NDAnalyticsEnvelopeManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsEnvelopeManager submitEnvelopes:withCompletion:].cold.1();
  -[NDAnalyticsEnvelopeManager submissionQueue](self, "submissionQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__NDAnalyticsEnvelopeManager_submitEnvelopes_withCompletion___block_invoke;
  v11[3] = &unk_24D1DEA48;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "enqueueBlock:", v11);

}

void __61__NDAnalyticsEnvelopeManager_submitEnvelopes_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__NDAnalyticsEnvelopeManager_submitEnvelopes_withCompletion___block_invoke_2;
  v10[3] = &unk_24D1DEA20;
  v10[4] = &v17;
  v10[5] = &v11;
  objc_msgSend(v4, "fc_splitArrayWithTest:result:", &__block_literal_global_31, v10);
  v5 = (id)*MEMORY[0x24BE6C658];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend((id)v18[5], "count");
    v7 = objc_msgSend((id)v12[5], "count");
    *(_DWORD *)buf = 134218240;
    v24 = v6;
    v25 = 2048;
    v26 = v7;
    _os_log_impl(&dword_214674000, v5, OS_LOG_TYPE_DEFAULT, "will submit %lu analytics envelopes and %lu telemetry envelopes", buf, 0x16u);
  }

  if (objc_msgSend((id)v18[5], "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "envelopeStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "copyEnvelopes:", *(_QWORD *)(a1 + 32));
    +[NAUAnalyticsEnvelopeTracker registerEnvelopesAsReceivedByUploader:](NAUAnalyticsEnvelopeTracker, "registerEnvelopesAsReceivedByUploader:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "_scheduleUploadIfNeededWithCompletion:", 0);

  }
  if (objc_msgSend((id)v12[5], "count"))
    objc_msgSend(*(id *)(a1 + 40), "_uploadTelemetryEnvelopes:", v12[5]);
  v3[2](v3);
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
}

BOOL __61__NDAnalyticsEnvelopeManager_submitEnvelopes_withCompletion___block_invoke_29(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentType") == 2;
}

void __61__NDAnalyticsEnvelopeManager_submitEnvelopes_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)uploadScheduler:(id)a3 performUploadWithCompletion:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  _QWORD aBlock[5];
  id v28;
  id v29;

  v5 = a4;
  v6 = (void *)os_transaction_create();
  v7 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke;
  aBlock[3] = &unk_24D1DEA98;
  v8 = v5;
  v29 = v8;
  aBlock[4] = self;
  v9 = v6;
  v28 = v9;
  v10 = _Block_copy(aBlock);
  -[NDAnalyticsEnvelopeManager envelopeStore](self, "envelopeStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v11, "allEntriesWithHoldToken:", &v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v26;
  if (objc_msgSend(v12, "count"))
  {
    -[NDAnalyticsEnvelopeManager payloadAssembler](self, "payloadAssembler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDAnalyticsEnvelopeManager _lastUploadDatesByContentType](self, "_lastUploadDatesByContentType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", &unk_24D1E3550);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizesOfEnvelopesWithEntries:", v12);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v7;
    v18 = v9;
    v19 = v8;
    v20 = v13;
    v21 = (void *)v16;
    v23[0] = v17;
    v23[1] = 3221225472;
    v23[2] = __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke_40;
    v23[3] = &unk_24D1DEB38;
    v23[4] = self;
    v24 = v11;
    v25 = v10;
    objc_msgSend(v22, "assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:", v12, v14, v15, v21, v23);

    v13 = v20;
    v8 = v19;
    v9 = v18;

  }
  else
  {
    (*((void (**)(void *, _QWORD))v10 + 2))(v10, 0);
  }

}

void __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (a2)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke_2;
    v5[3] = &unk_24D1DEA70;
    v4 = *(void **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v4, "_scheduleUploadIfNeededWithCompletion:", v5);

  }
}

void __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke_40(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1[4], "_handleDroppedEnvelopesForLocalReasons:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "deleteEnvelopesForEntries:", v10);
  if (v9 || !objc_msgSend(v7, "count"))
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v21 = 1;
    objc_msgSend(a1[4], "payloadUploader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke_2_41;
    v17[3] = &unk_24D1DEAC0;
    v13 = a1[5];
    v17[4] = a1[4];
    v18 = v13;
    v19 = v20;
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke_3;
    v14[3] = &unk_24D1DEB10;
    v14[4] = a1[4];
    v15 = a1[6];
    v16 = v20;
    objc_msgSend(v11, "uploadPayloadsForInfos:withEnvelopeStore:perPayloadCompletion:completion:", v7, v18, v17, v14);

    _Block_object_dispose(v20, 8);
  }

}

void __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke_2_41(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "fc_shouldRetry");
  else
    v9 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_handleOutcomeOfUploadAttemptWithPayload:success:error:willRetry:hitEndpoint:", v13, v8 == 0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "deleteEnvelopesForEntries:", v10);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v11 + 24))
    v12 = v8 == 0;
  else
    v12 = 0;
  *(_BYTE *)(v11 + 24) = v12;

}

void __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "lastUploadDatesByContentType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke_4;
  v5[3] = &unk_24D1DEAE8;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "saveWithCompletionHandler:", v5);

}

uint64_t __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (void)uploadSchedulerDidDropScheduledBackgroundUpload:(id)a3
{
  -[NDAnalyticsEnvelopeManager _scheduleUploadIfNeededWithCompletion:](self, "_scheduleUploadIfNeededWithCompletion:", 0);
}

- (void)envelopeStore:(id)a3 didFlushEnvelopesForEntries:(id)a4
{
  id v4;

  NDAnalyticsEnvelopeSubmissionDatesByContentType(a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsDropped:forReason:withError:](NAUAnalyticsEnvelopeTracker, "registerEnvelopeContentTypesAsDropped:forReason:withError:", v4, 3, 0);

}

- (void)_scheduleUploadIfNeededWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  void (**v15)(_QWORD);
  _QWORD aBlock[4];
  id v17;
  id v18;

  v4 = a3;
  v5 = (void *)os_transaction_create();
  v6 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__NDAnalyticsEnvelopeManager__scheduleUploadIfNeededWithCompletion___block_invoke;
  aBlock[3] = &unk_24D1DEB60;
  v7 = v4;
  v18 = v7;
  v8 = v5;
  v17 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[NDAnalyticsEnvelopeManager envelopeStore](self, "envelopeStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allEntriesWithHoldToken:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    -[NDAnalyticsEnvelopeManager payloadAssembler](self, "payloadAssembler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDAnalyticsEnvelopeManager _lastUploadDatesByContentType](self, "_lastUploadDatesByContentType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __68__NDAnalyticsEnvelopeManager__scheduleUploadIfNeededWithCompletion___block_invoke_2;
    v14[3] = &unk_24D1DEB88;
    v14[4] = self;
    v15 = v9;
    objc_msgSend(v12, "determinePayloadDeliveryWindowForEntries:withLastUploadDatesByContentType:completion:", v11, v13, v14);

  }
  else
  {
    v9[2](v9);
  }

}

uint64_t __68__NDAnalyticsEnvelopeManager__scheduleUploadIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __68__NDAnalyticsEnvelopeManager__scheduleUploadIfNeededWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (!v6 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "uploadScheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheduleUploadInWindow:withForegroundUploadCompletion:", v6, *(_QWORD *)(a1 + 40));

  }
}

- (id)_lastUploadDatesByContentType
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  NDAnalyticsEnvelopeManager *v12;
  id v13;

  v3 = (void *)objc_opt_new();
  -[NDAnalyticsEnvelopeManager keyValueStoreLock](self, "keyValueStoreLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __59__NDAnalyticsEnvelopeManager__lastUploadDatesByContentType__block_invoke;
  v11 = &unk_24D1DEBB0;
  v12 = self;
  v13 = v3;
  v5 = v3;
  objc_msgSend(v4, "performWithLockSync:", &v8);

  objc_msgSend(v5, "fc_dictionaryByTransformingKeysWithBlock:", &__block_literal_global_48, v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __59__NDAnalyticsEnvelopeManager__lastUploadDatesByContentType__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "lastUploadDatesByContentType");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAllEntriesToDictionary:", *(_QWORD *)(a1 + 40));

}

uint64_t __59__NDAnalyticsEnvelopeManager__lastUploadDatesByContentType__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a2, "integerValue"));
}

- (id)_handleDroppedEnvelopesForLocalReasons:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsEnvelopeManager _handleDroppedEnvelopesForLocalReasons:].cold.1();
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_51);
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_arrayByFlattening");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __69__NDAnalyticsEnvelopeManager__handleDroppedEnvelopesForLocalReasons___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  if (v5 == 2)
  {
    v6 = 1;
  }
  else
  {
    if (v5 == 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __69__NDAnalyticsEnvelopeManager__handleDroppedEnvelopesForLocalReasons___block_invoke_cold_1();
    v6 = 0;
  }
  NDAnalyticsEnvelopeSubmissionDatesByContentType(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsDropped:forReason:withError:](NAUAnalyticsEnvelopeTracker, "registerEnvelopeContentTypesAsDropped:forReason:withError:", v7, v6, 0);

}

- (id)_handleOutcomeOfUploadAttemptWithPayload:(id)a3 success:(BOOL)a4 error:(id)a5 willRetry:(BOOL)a6 hitEndpoint:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(void *, _QWORD);
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void (**v25)(void *, _QWORD);
  void *v26;
  id v27;
  _QWORD v29[4];
  void *v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  BOOL v34;
  BOOL v35;
  _QWORD v36[4];
  id v37;
  NDAnalyticsEnvelopeManager *v38;
  id v39;

  v7 = a7;
  v12 = a3;
  v13 = a5;
  if (!v12 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsEnvelopeManager _handleOutcomeOfUploadAttemptWithPayload:success:error:willRetry:hitEndpoint:].cold.1();
  v14 = MEMORY[0x24BDAC760];
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDAnalyticsEnvelopeManager keyValueStoreLock](self, "keyValueStoreLock");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v14;
    v36[1] = 3221225472;
    v36[2] = __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke;
    v36[3] = &unk_24D1DEC60;
    v37 = v12;
    v38 = self;
    v39 = v15;
    v17 = v15;
    objc_msgSend(v16, "performWithLockSync:", v36);

  }
  aBlock[0] = v14;
  aBlock[1] = 3221225472;
  aBlock[2] = __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_3;
  aBlock[3] = &unk_24D1DEC88;
  v34 = a4;
  v18 = (id)objc_opt_new();
  v35 = a6;
  v32 = v18;
  v33 = v13;
  v19 = v13;
  v20 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  objc_msgSend(v12, "entriesToUpload");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = v21;
  else
    v23 = MEMORY[0x24BDBD1A8];
  v20[2](v20, v23);

  objc_msgSend(v12, "droppedEntriesByReason");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v14;
  v29[1] = 3221225472;
  v29[2] = __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_4;
  v29[3] = &unk_24D1DECB0;
  v30 = v20;
  v25 = v20;
  objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v29);

  v26 = v30;
  v27 = v18;

  return v27;
}

void __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "entriesToUpload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_2;
  v4[3] = &unk_24D1DEC38;
  v3 = *(void **)(a1 + 48);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

}

void __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "lastUploadDatesByContentType");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = objc_msgSend(v4, "envelopeContentType");

  objc_msgSend(v5, "numberWithInt:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v2, v8);

}

void __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v3);
    NDAnalyticsEnvelopeSubmissionDatesByContentType(v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsUploaded:](NAUAnalyticsEnvelopeTracker, "registerEnvelopeContentTypesAsUploaded:", v4);
  }
  else if (*(_BYTE *)(a1 + 49))
  {
    NDAnalyticsEnvelopeContentTypesFromEntries(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsRetainedForUploadRetry:](NAUAnalyticsEnvelopeTracker, "registerEnvelopeContentTypesAsRetainedForUploadRetry:", v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v3);
    NDAnalyticsEnvelopeSubmissionDatesByContentType(v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsDropped:forReason:withError:](NAUAnalyticsEnvelopeTracker, "registerEnvelopeContentTypesAsDropped:forReason:withError:", v4, 2, *(_QWORD *)(a1 + 40));
  }

}

void __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;

  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedIntegerValue");
  if (v6 == 2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_4_cold_2();
  }
  else if (v6 == 1)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_4_cold_1();
  }

}

- (void)_uploadTelemetryEnvelopes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)os_transaction_create();
  -[NDAnalyticsEnvelopeManager telemetryUploader](self, "telemetryUploader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__NDAnalyticsEnvelopeManager__uploadTelemetryEnvelopes___block_invoke;
  v8[3] = &unk_24D1DEA70;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "uploadEnvelopes:completion:", v4, v8);

}

- (OS_dispatch_queue)URLSessionQueue
{
  return self->_URLSessionQueue;
}

- (FCAsyncSerialQueue)submissionQueue
{
  return self->_submissionQueue;
}

- (void)setSubmissionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_submissionQueue, a3);
}

- (NDAnalyticsEnvelopeStore)envelopeStore
{
  return self->_envelopeStore;
}

- (void)setEnvelopeStore:(id)a3
{
  objc_storeStrong((id *)&self->_envelopeStore, a3);
}

- (NDAnalyticsPayloadAssembler)payloadAssembler
{
  return self->_payloadAssembler;
}

- (void)setPayloadAssembler:(id)a3
{
  objc_storeStrong((id *)&self->_payloadAssembler, a3);
}

- (NDAnalyticsPayloadUploader)payloadUploader
{
  return self->_payloadUploader;
}

- (void)setPayloadUploader:(id)a3
{
  objc_storeStrong((id *)&self->_payloadUploader, a3);
}

- (NDAnalyticsUploadScheduler)uploadScheduler
{
  return self->_uploadScheduler;
}

- (void)setUploadScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_uploadScheduler, a3);
}

- (FCKeyValueStore)lastUploadDatesByContentType
{
  return self->_lastUploadDatesByContentType;
}

- (void)setLastUploadDatesByContentType:(id)a3
{
  objc_storeStrong((id *)&self->_lastUploadDatesByContentType, a3);
}

- (NFMutexLock)keyValueStoreLock
{
  return self->_keyValueStoreLock;
}

- (void)setKeyValueStoreLock:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueStoreLock, a3);
}

- (NDAnalyticsTelemetryUploader)telemetryUploader
{
  return self->_telemetryUploader;
}

- (void)setTelemetryUploader:(id)a3
{
  objc_storeStrong((id *)&self->_telemetryUploader, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryUploader, 0);
  objc_storeStrong((id *)&self->_keyValueStoreLock, 0);
  objc_storeStrong((id *)&self->_lastUploadDatesByContentType, 0);
  objc_storeStrong((id *)&self->_uploadScheduler, 0);
  objc_storeStrong((id *)&self->_payloadUploader, 0);
  objc_storeStrong((id *)&self->_payloadAssembler, 0);
  objc_storeStrong((id *)&self->_envelopeStore, 0);
  objc_storeStrong((id *)&self->_submissionQueue, 0);
  objc_storeStrong((id *)&self->_URLSessionQueue, 0);
}

- (void)initWithAppConfigurationManager:telemetryUploader:storeDirectoryFileURL:URLSessionQueue:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"URLSessionQueue", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)initWithAppConfigurationManager:telemetryUploader:storeDirectoryFileURL:URLSessionQueue:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storeDirectoryFileURL", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)initWithAppConfigurationManager:telemetryUploader:storeDirectoryFileURL:URLSessionQueue:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"appConfigurationManager", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)handleLaunchEventForBackgroundSessionWithIdentifier:completion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"identifier", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)submitEnvelopes:withCompletion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopes", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)_handleDroppedEnvelopesForLocalReasons:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"droppedEntriesByLocalReason", v6, 2u);

  OUTLINED_FUNCTION_3();
}

void __69__NDAnalyticsEnvelopeManager__handleDroppedEnvelopesForLocalReasons___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("oversized is not a local failure reason!"));
  v2[0] = 136315906;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_7();
}

- (void)_handleOutcomeOfUploadAttemptWithPayload:success:error:willRetry:hitEndpoint:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"payloadInfo", v6, 2u);

  OUTLINED_FUNCTION_3();
}

void __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_4_cold_1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("missing config is a local failure reason!"));
  v2[0] = 136315906;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_7();
}

void __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_4_cold_2()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("sampled is a local failure reason!"));
  v2[0] = 136315906;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_7();
}

@end
