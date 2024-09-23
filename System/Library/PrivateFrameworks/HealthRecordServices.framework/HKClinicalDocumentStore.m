@implementation HKClinicalDocumentStore

- (HKClinicalDocumentStore)initWithHealthStore:(id)a3
{
  id v4;
  HKClinicalDocumentStore *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKTaskServerProxyProvider *proxyProvider;
  id v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  HKObserverSet *stateChangeListeners;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKClinicalDocumentStore;
  v5 = -[HKClinicalDocumentStore init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDD4038]);
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v7, v5, v8);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;

    -[HKTaskServerProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    v11 = objc_alloc(MEMORY[0x24BDD3DD0]);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "initWithName:loggingCategory:", v13, *MEMORY[0x24BDD2FF8]);
    stateChangeListeners = v5->_stateChangeListeners;
    v5->_stateChangeListeners = (HKObserverSet *)v14;

  }
  return v5;
}

- (void)updateRetryCountForAttachmentWithIdentifier:(id)a3 retryCount:(int64_t)a4 nextRetryDate:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  int64_t v23;

  v10 = a3;
  v11 = a5;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __107__HKClinicalDocumentStore_updateRetryCountForAttachmentWithIdentifier_retryCount_nextRetryDate_completion___block_invoke;
  v19[3] = &unk_24D5492E0;
  v23 = a4;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __107__HKClinicalDocumentStore_updateRetryCountForAttachmentWithIdentifier_retryCount_nextRetryDate_completion___block_invoke_2;
  v17[3] = &unk_24D549308;
  v18 = v22;
  v14 = v22;
  v15 = v11;
  v16 = v10;
  -[HKClinicalDocumentStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v19, v17);

}

uint64_t __107__HKClinicalDocumentStore_updateRetryCountForAttachmentWithIdentifier_retryCount_nextRetryDate_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateRetryCountForAttachmentWithIdentifier:retryCount:nextRetryDate:completion:", a1[4], a1[7], a1[5], a1[6]);
}

uint64_t __107__HKClinicalDocumentStore_updateRetryCountForAttachmentWithIdentifier_retryCount_nextRetryDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateStatusAndClearErrorForAttachmentWithIdentifier:(id)a3 status:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  int64_t v18;

  v8 = a3;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __98__HKClinicalDocumentStore_updateStatusAndClearErrorForAttachmentWithIdentifier_status_completion___block_invoke;
  v15[3] = &unk_24D549330;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __98__HKClinicalDocumentStore_updateStatusAndClearErrorForAttachmentWithIdentifier_status_completion___block_invoke_2;
  v13[3] = &unk_24D549308;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[HKClinicalDocumentStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v15, v13);

}

uint64_t __98__HKClinicalDocumentStore_updateStatusAndClearErrorForAttachmentWithIdentifier_status_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateStatusAndClearErrorForAttachmentWithIdentifier:status:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __98__HKClinicalDocumentStore_updateStatusAndClearErrorForAttachmentWithIdentifier_status_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateErrorStatusAndRetryCountForAttachmentWithIdentifier:(id)a3 errorStatus:(int64_t)a4 lastError:(id)a5 retryCount:(int64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  int64_t v25;
  int64_t v26;

  v12 = a3;
  v13 = a5;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __129__HKClinicalDocumentStore_updateErrorStatusAndRetryCountForAttachmentWithIdentifier_errorStatus_lastError_retryCount_completion___block_invoke;
  v21[3] = &unk_24D549358;
  v22 = v12;
  v23 = v13;
  v25 = a4;
  v26 = a6;
  v24 = v14;
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __129__HKClinicalDocumentStore_updateErrorStatusAndRetryCountForAttachmentWithIdentifier_errorStatus_lastError_retryCount_completion___block_invoke_2;
  v19[3] = &unk_24D549308;
  v20 = v24;
  v16 = v24;
  v17 = v13;
  v18 = v12;
  -[HKClinicalDocumentStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v21, v19);

}

uint64_t __129__HKClinicalDocumentStore_updateErrorStatusAndRetryCountForAttachmentWithIdentifier_errorStatus_lastError_retryCount_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateErrorStatusAndRetryCountForAttachmentWithIdentifier:errorStatus:lastError:retryCount:completion:", a1[4], a1[7], a1[5], a1[8], a1[6]);
}

uint64_t __129__HKClinicalDocumentStore_updateErrorStatusAndRetryCountForAttachmentWithIdentifier_errorStatus_lastError_retryCount_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)markDownloadCompleteForAttachmentWithIdentifier:(id)a3 fileURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __94__HKClinicalDocumentStore_markDownloadCompleteForAttachmentWithIdentifier_fileURL_completion___block_invoke;
  v17[3] = &unk_24D549380;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __94__HKClinicalDocumentStore_markDownloadCompleteForAttachmentWithIdentifier_fileURL_completion___block_invoke_2;
  v15[3] = &unk_24D549308;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[HKClinicalDocumentStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __94__HKClinicalDocumentStore_markDownloadCompleteForAttachmentWithIdentifier_fileURL_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_markDownloadCompleteForAttachmentWithIdentifier:fileURL:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __94__HKClinicalDocumentStore_markDownloadCompleteForAttachmentWithIdentifier_fileURL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)markDataAvailableForAttachmentWithIdentifier:(id)a3 attachmentContent:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __101__HKClinicalDocumentStore_markDataAvailableForAttachmentWithIdentifier_attachmentContent_completion___block_invoke;
  v17[3] = &unk_24D549380;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __101__HKClinicalDocumentStore_markDataAvailableForAttachmentWithIdentifier_attachmentContent_completion___block_invoke_2;
  v15[3] = &unk_24D549308;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[HKClinicalDocumentStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __101__HKClinicalDocumentStore_markDataAvailableForAttachmentWithIdentifier_attachmentContent_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_markDataAvailableForAttachmentWithIdentifier:attachmentContent:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __101__HKClinicalDocumentStore_markDataAvailableForAttachmentWithIdentifier_attachmentContent_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAttachmentWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__HKClinicalDocumentStore_fetchAttachmentWithIdentifier_completion___block_invoke;
  v13[3] = &unk_24D5493A8;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __68__HKClinicalDocumentStore_fetchAttachmentWithIdentifier_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKClinicalDocumentStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __68__HKClinicalDocumentStore_fetchAttachmentWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAttachmentWithIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __68__HKClinicalDocumentStore_fetchAttachmentWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)processAttachmentWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __70__HKClinicalDocumentStore_processAttachmentWithIdentifier_completion___block_invoke;
  v13[3] = &unk_24D5493A8;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __70__HKClinicalDocumentStore_processAttachmentWithIdentifier_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKClinicalDocumentStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __70__HKClinicalDocumentStore_processAttachmentWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_processAttachmentWithIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __70__HKClinicalDocumentStore_processAttachmentWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)runMedicalDownloadableAttachmentPipelineWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __82__HKClinicalDocumentStore_runMedicalDownloadableAttachmentPipelineWithCompletion___block_invoke;
  v9[3] = &unk_24D5493D0;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __82__HKClinicalDocumentStore_runMedicalDownloadableAttachmentPipelineWithCompletion___block_invoke_2;
  v7[3] = &unk_24D549308;
  v8 = v10;
  v6 = v10;
  -[HKClinicalDocumentStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __82__HKClinicalDocumentStore_runMedicalDownloadableAttachmentPipelineWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_runMedicalDownloadableAttachmentPipelineWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __82__HKClinicalDocumentStore_runMedicalDownloadableAttachmentPipelineWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)notifyDownloadingCompleteAndRequestMoreWithIdentifiers:(id)a3 requestBatchSize:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __110__HKClinicalDocumentStore_notifyDownloadingCompleteAndRequestMoreWithIdentifiers_requestBatchSize_completion___block_invoke;
  v17[3] = &unk_24D549380;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __110__HKClinicalDocumentStore_notifyDownloadingCompleteAndRequestMoreWithIdentifiers_requestBatchSize_completion___block_invoke_2;
  v15[3] = &unk_24D549308;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[HKClinicalDocumentStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __110__HKClinicalDocumentStore_notifyDownloadingCompleteAndRequestMoreWithIdentifiers_requestBatchSize_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_notifyDownloadingCompleteAndRequestMoreWithIdentifiers:requestBatchSize:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __110__HKClinicalDocumentStore_notifyDownloadingCompleteAndRequestMoreWithIdentifiers_requestBatchSize_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)triggerAttachmentRetryForMedicalRecordWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __91__HKClinicalDocumentStore_triggerAttachmentRetryForMedicalRecordWithIdentifier_completion___block_invoke;
  v13[3] = &unk_24D5493A8;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __91__HKClinicalDocumentStore_triggerAttachmentRetryForMedicalRecordWithIdentifier_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKClinicalDocumentStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __91__HKClinicalDocumentStore_triggerAttachmentRetryForMedicalRecordWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerAttachmentRetryForMedicalRecordWithIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __91__HKClinicalDocumentStore_triggerAttachmentRetryForMedicalRecordWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)pingWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__HKClinicalDocumentStore_pingWithCompletion___block_invoke;
  v9[3] = &unk_24D5493D0;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __46__HKClinicalDocumentStore_pingWithCompletion___block_invoke_2;
  v7[3] = &unk_24D549308;
  v8 = v10;
  v6 = v10;
  -[HKClinicalDocumentStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __46__HKClinicalDocumentStore_pingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pingWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __46__HKClinicalDocumentStore_pingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addClinicalDocumentStateChangeListener:(id)a3
{
  id v4;

  v4 = a3;
  -[HKClinicalDocumentStore _establishProxyConnectionIfNoObserversArePresent](self, "_establishProxyConnectionIfNoObserversArePresent");
  -[HKObserverSet registerObserver:queue:](self->_stateChangeListeners, "registerObserver:queue:", v4, 0);

}

- (void)removeClinicalDocumentStateChangeListener:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_stateChangeListeners, "unregisterObserver:", a3);
}

- (void)insertDownloadableAttachment:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__HKClinicalDocumentStore_insertDownloadableAttachment_completion___block_invoke;
  v13[3] = &unk_24D5493A8;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __67__HKClinicalDocumentStore_insertDownloadableAttachment_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKClinicalDocumentStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __67__HKClinicalDocumentStore_insertDownloadableAttachment_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_insertDownloadableAttachment:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __67__HKClinicalDocumentStore_insertDownloadableAttachment_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeAllAttachmentsFromMedicalRecord:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __76__HKClinicalDocumentStore_removeAllAttachmentsFromMedicalRecord_completion___block_invoke;
  v13[3] = &unk_24D5493A8;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __76__HKClinicalDocumentStore_removeAllAttachmentsFromMedicalRecord_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKClinicalDocumentStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __76__HKClinicalDocumentStore_removeAllAttachmentsFromMedicalRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_removeAllAttachmentsFromMedicalRecord:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __76__HKClinicalDocumentStore_removeAllAttachmentsFromMedicalRecord_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_unitTesting_triggerDownloadableAttachmentDidChange:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __90__HKClinicalDocumentStore__unitTesting_triggerDownloadableAttachmentDidChange_completion___block_invoke;
  v13[3] = &unk_24D5493A8;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __90__HKClinicalDocumentStore__unitTesting_triggerDownloadableAttachmentDidChange_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKClinicalDocumentStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __90__HKClinicalDocumentStore__unitTesting_triggerDownloadableAttachmentDidChange_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_unitTesting_remote_triggerDownloadableAttachmentDidChange:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __90__HKClinicalDocumentStore__unitTesting_triggerDownloadableAttachmentDidChange_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_establishProxyConnectionIfNoObserversArePresent
{
  if (!-[HKObserverSet count](self->_stateChangeListeners, "count"))
    -[HKClinicalDocumentStore _establishProxyConnection](self, "_establishProxyConnection");
}

- (void)_establishProxyConnection
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke;
  v3[3] = &unk_24D549420;
  v3[4] = self;
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke_188;
  v2[3] = &unk_24D549448;
  -[HKClinicalDocumentStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v3, v2);
}

uint64_t __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke_2;
  v3[3] = &unk_24D5493F8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_pingWithCompletion:", v3);
}

void __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke_2_cold_1();
  }

}

void __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke_188(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
    __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke_188_cold_1();

}

- (void)_fetchServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](self->_proxyProvider, "fetchProxyWithHandler:errorHandler:", a3, a4);
}

- (void)_getSynchronousServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKTaskServerProxyProvider getSynchronousProxyWithHandler:errorHandler:](self->_proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", a3, a4);
}

- (void)clientRemote_downloadableAttachmentDidChangeState:(id)a3
{
  id v4;
  void *v5;
  HKObserverSet *stateChangeListeners;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD2FF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG))
    -[HKClinicalDocumentStore clientRemote_downloadableAttachmentDidChangeState:].cold.1((uint64_t)self, v5, v4);
  stateChangeListeners = self->_stateChangeListeners;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77__HKClinicalDocumentStore_clientRemote_downloadableAttachmentDidChangeState___block_invoke;
  v8[3] = &unk_24D549470;
  v9 = v4;
  v7 = v4;
  -[HKObserverSet notifyObservers:](stateChangeListeners, "notifyObservers:", v8);

}

uint64_t __77__HKClinicalDocumentStore_clientRemote_downloadableAttachmentDidChangeState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "downloadableAttachmentDidChangeState:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateChangeListeners, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2163C4000, v0, v1, "%{public}@: error executing a ping: %{public}@");
}

void __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke_188_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2163C4000, v0, v1, "%{public}@: error establishing proxy connection: %{public}@");
}

- (void)clientRemote_downloadableAttachmentDidChangeState:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromAttachmentStatus(objc_msgSend(a3, "status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = a1;
  v10 = 2114;
  v11 = v6;
  v12 = 2114;
  v13 = v7;
  _os_log_debug_impl(&dword_2163C4000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: downloadable attachment with identifier %{public}@ did change, status: %{public}@", (uint8_t *)&v8, 0x20u);

}

@end
