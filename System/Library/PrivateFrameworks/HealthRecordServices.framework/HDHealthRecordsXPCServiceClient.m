@implementation HDHealthRecordsXPCServiceClient

- (HDHealthRecordsXPCServiceClient)init
{
  return -[HDHealthRecordsXPCServiceClient initWithListenerEndpoint:](self, "initWithListenerEndpoint:", 0);
}

- (HDHealthRecordsXPCServiceClient)initWithListenerEndpoint:(id)a3
{
  id v4;
  HDHealthRecordsXPCServiceClient *v5;
  uint64_t v6;
  OS_dispatch_queue *clientQueue;
  id v8;
  uint64_t v9;
  _HKXPCConnection *connection;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDHealthRecordsXPCServiceClient;
  v5 = -[HDHealthRecordsXPCServiceClient init](&v12, sel_init);
  if (v5)
  {
    HKCreateSerialDispatchQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    clientQueue = v5->_clientQueue;
    v5->_clientQueue = (OS_dispatch_queue *)v6;

    v8 = objc_alloc(MEMORY[0x24BDD4260]);
    if (v4)
      v9 = objc_msgSend(v8, "initWithListenerEndpoint:", v4);
    else
      v9 = objc_msgSend(v8, "initWithServiceName:", CFSTR("com.apple.health.records"));
    connection = v5->_connection;
    v5->_connection = (_HKXPCConnection *)v9;

    -[_HKXPCConnection setExportedObject:](v5->_connection, "setExportedObject:", v5);
    -[_HKXPCConnection resume](v5->_connection, "resume");
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[_HKXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDHealthRecordsXPCServiceClient;
  -[HDHealthRecordsXPCServiceClient dealloc](&v3, sel_dealloc);
}

- (id)rulesVersionForFHIRDocumentExtractionWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
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

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  v9[4] = &v11;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __82__HDHealthRecordsXPCServiceClient_rulesVersionForFHIRDocumentExtractionWithError___block_invoke;
  v10[3] = &unk_24D54A368;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __82__HDHealthRecordsXPCServiceClient_rulesVersionForFHIRDocumentExtractionWithError___block_invoke_3;
  v9[3] = &unk_24D5491F0;
  -[HDHealthRecordsXPCServiceClient _synchronousPerformWithProxyHandler:errorHandler:](self, "_synchronousPerformWithProxyHandler:errorHandler:", v10, v9);
  v4 = (void *)v18[5];
  if (!v4)
  {
    v5 = (id)v12[5];
    v6 = v5;
    if (v5)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v5);
      else
        _HKLogDroppedError();
    }

    v4 = (void *)v18[5];
  }
  v7 = v4;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __82__HDHealthRecordsXPCServiceClient_rulesVersionForFHIRDocumentExtractionWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __82__HDHealthRecordsXPCServiceClient_rulesVersionForFHIRDocumentExtractionWithError___block_invoke_2;
  v3[3] = &unk_24D54A340;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_rulesVersionForFHIRDocumentExtractionWithCompletion:", v3);
}

void __82__HDHealthRecordsXPCServiceClient_rulesVersionForFHIRDocumentExtractionWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __82__HDHealthRecordsXPCServiceClient_rulesVersionForFHIRDocumentExtractionWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)supportedFHIRConfigurationWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
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

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  v9[4] = &v11;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__HDHealthRecordsXPCServiceClient_supportedFHIRConfigurationWithError___block_invoke;
  v10[3] = &unk_24D54A368;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __71__HDHealthRecordsXPCServiceClient_supportedFHIRConfigurationWithError___block_invoke_3;
  v9[3] = &unk_24D5491F0;
  -[HDHealthRecordsXPCServiceClient _synchronousPerformWithProxyHandler:errorHandler:](self, "_synchronousPerformWithProxyHandler:errorHandler:", v10, v9);
  v4 = (void *)v18[5];
  if (!v4)
  {
    v5 = (id)v12[5];
    v6 = v5;
    if (v5)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v5);
      else
        _HKLogDroppedError();
    }

    v4 = (void *)v18[5];
  }
  v7 = v4;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __71__HDHealthRecordsXPCServiceClient_supportedFHIRConfigurationWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __71__HDHealthRecordsXPCServiceClient_supportedFHIRConfigurationWithError___block_invoke_2;
  v3[3] = &unk_24D54A390;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_supportedFHIRConfigurationWithCompletion:", v3);
}

void __71__HDHealthRecordsXPCServiceClient_supportedFHIRConfigurationWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __71__HDHealthRecordsXPCServiceClient_supportedFHIRConfigurationWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)executeFHIRReferenceExtractionRequest:(id)a3 completion:(id)a4
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
  -[HDHealthRecordsXPCServiceClient _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __84__HDHealthRecordsXPCServiceClient_executeFHIRReferenceExtractionRequest_completion___block_invoke;
  v13[3] = &unk_24D54A3B8;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __84__HDHealthRecordsXPCServiceClient_executeFHIRReferenceExtractionRequest_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HDHealthRecordsXPCServiceClient _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v13, v11);

}

uint64_t __84__HDHealthRecordsXPCServiceClient_executeFHIRReferenceExtractionRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_executeFHIRReferenceExtractionRequest:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __84__HDHealthRecordsXPCServiceClient_executeFHIRReferenceExtractionRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)executeFHIRExtractionRequest:(id)a3 completion:(id)a4
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
  -[HDHealthRecordsXPCServiceClient _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __75__HDHealthRecordsXPCServiceClient_executeFHIRExtractionRequest_completion___block_invoke;
  v13[3] = &unk_24D54A3B8;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __75__HDHealthRecordsXPCServiceClient_executeFHIRExtractionRequest_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HDHealthRecordsXPCServiceClient _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v13, v11);

}

uint64_t __75__HDHealthRecordsXPCServiceClient_executeFHIRExtractionRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_executeFHIRExtractionRequest:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __75__HDHealthRecordsXPCServiceClient_executeFHIRExtractionRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)compareExistingPatientResourceData:(id)a3 incomingPatientResourceData:(id)a4 completion:(id)a5
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
  -[HDHealthRecordsXPCServiceClient _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __109__HDHealthRecordsXPCServiceClient_compareExistingPatientResourceData_incomingPatientResourceData_completion___block_invoke;
  v17[3] = &unk_24D54A3E0;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __109__HDHealthRecordsXPCServiceClient_compareExistingPatientResourceData_incomingPatientResourceData_completion___block_invoke_2;
  v15[3] = &unk_24D549308;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[HDHealthRecordsXPCServiceClient _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v17, v15);

}

uint64_t __109__HDHealthRecordsXPCServiceClient_compareExistingPatientResourceData_incomingPatientResourceData_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_compareExistingPatientResourceData:incomingPatientResourceData:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __109__HDHealthRecordsXPCServiceClient_compareExistingPatientResourceData_incomingPatientResourceData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)extractAttachmentContentFromFHIRResource:(id)a3 completion:(id)a4
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
  -[HDHealthRecordsXPCServiceClient _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __87__HDHealthRecordsXPCServiceClient_extractAttachmentContentFromFHIRResource_completion___block_invoke;
  v13[3] = &unk_24D54A3B8;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __87__HDHealthRecordsXPCServiceClient_extractAttachmentContentFromFHIRResource_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HDHealthRecordsXPCServiceClient _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v13, v11);

}

uint64_t __87__HDHealthRecordsXPCServiceClient_extractAttachmentContentFromFHIRResource_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_extractAttachmentContentFromFHIRResource:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __87__HDHealthRecordsXPCServiceClient_extractAttachmentContentFromFHIRResource_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)optInDataForFHIRDocumentWithRequest:(id)a3 redactor:(id)a4 completion:(id)a5
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
  -[HDHealthRecordsXPCServiceClient _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __91__HDHealthRecordsXPCServiceClient_optInDataForFHIRDocumentWithRequest_redactor_completion___block_invoke;
  v17[3] = &unk_24D54A3E0;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __91__HDHealthRecordsXPCServiceClient_optInDataForFHIRDocumentWithRequest_redactor_completion___block_invoke_2;
  v15[3] = &unk_24D549308;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[HDHealthRecordsXPCServiceClient _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v17, v15);

}

uint64_t __91__HDHealthRecordsXPCServiceClient_optInDataForFHIRDocumentWithRequest_redactor_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_optInDataForFHIRDocumentWithRequest:redactor:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __91__HDHealthRecordsXPCServiceClient_optInDataForFHIRDocumentWithRequest_redactor_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)preprocessSignedClinicalData:(id)a3 options:(unint64_t)a4 completion:(id)a5
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
  unint64_t v18;

  v8 = a3;
  -[HDHealthRecordsXPCServiceClient _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __83__HDHealthRecordsXPCServiceClient_preprocessSignedClinicalData_options_completion___block_invoke;
  v15[3] = &unk_24D54A408;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __83__HDHealthRecordsXPCServiceClient_preprocessSignedClinicalData_options_completion___block_invoke_2;
  v13[3] = &unk_24D549308;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[HDHealthRecordsXPCServiceClient _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v15, v13);

}

uint64_t __83__HDHealthRecordsXPCServiceClient_preprocessSignedClinicalData_options_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_preprocessSignedClinicalData:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __83__HDHealthRecordsXPCServiceClient_preprocessSignedClinicalData_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)preprocessSignedClinicalDataFHIRResourceObject:(id)a3 options:(unint64_t)a4 completion:(id)a5
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
  unint64_t v18;

  v8 = a3;
  -[HDHealthRecordsXPCServiceClient _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __101__HDHealthRecordsXPCServiceClient_preprocessSignedClinicalDataFHIRResourceObject_options_completion___block_invoke;
  v15[3] = &unk_24D54A408;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __101__HDHealthRecordsXPCServiceClient_preprocessSignedClinicalDataFHIRResourceObject_options_completion___block_invoke_2;
  v13[3] = &unk_24D549308;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[HDHealthRecordsXPCServiceClient _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v15, v13);

}

uint64_t __101__HDHealthRecordsXPCServiceClient_preprocessSignedClinicalDataFHIRResourceObject_options_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_preprocessSignedClinicalDataFHIRResourceObject:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __101__HDHealthRecordsXPCServiceClient_preprocessSignedClinicalDataFHIRResourceObject_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reprocessOriginalSignedClinicalDataRecords:(id)a3 options:(unint64_t)a4 completion:(id)a5
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
  unint64_t v18;

  v8 = a3;
  -[HDHealthRecordsXPCServiceClient _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __97__HDHealthRecordsXPCServiceClient_reprocessOriginalSignedClinicalDataRecords_options_completion___block_invoke;
  v15[3] = &unk_24D54A408;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __97__HDHealthRecordsXPCServiceClient_reprocessOriginalSignedClinicalDataRecords_options_completion___block_invoke_2;
  v13[3] = &unk_24D549308;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[HDHealthRecordsXPCServiceClient _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v15, v13);

}

uint64_t __97__HDHealthRecordsXPCServiceClient_reprocessOriginalSignedClinicalDataRecords_options_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_reprocessOriginalRecords:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __97__HDHealthRecordsXPCServiceClient_reprocessOriginalSignedClinicalDataRecords_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)processOriginalSignedClinicalDataRecords:(id)a3 options:(unint64_t)a4 completion:(id)a5
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
  unint64_t v18;

  v8 = a3;
  -[HDHealthRecordsXPCServiceClient _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __95__HDHealthRecordsXPCServiceClient_processOriginalSignedClinicalDataRecords_options_completion___block_invoke;
  v15[3] = &unk_24D54A408;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __95__HDHealthRecordsXPCServiceClient_processOriginalSignedClinicalDataRecords_options_completion___block_invoke_2;
  v13[3] = &unk_24D549308;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[HDHealthRecordsXPCServiceClient _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v15, v13);

}

uint64_t __95__HDHealthRecordsXPCServiceClient_processOriginalSignedClinicalDataRecords_options_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_processOriginalSignedClinicalDataRecords:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __95__HDHealthRecordsXPCServiceClient_processOriginalSignedClinicalDataRecords_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)processSignedClinicalDataContextCollection:(id)a3 completion:(id)a4
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
  -[HDHealthRecordsXPCServiceClient _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __89__HDHealthRecordsXPCServiceClient_processSignedClinicalDataContextCollection_completion___block_invoke;
  v13[3] = &unk_24D54A3B8;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __89__HDHealthRecordsXPCServiceClient_processSignedClinicalDataContextCollection_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HDHealthRecordsXPCServiceClient _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v13, v11);

}

uint64_t __89__HDHealthRecordsXPCServiceClient_processSignedClinicalDataContextCollection_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_processSignedClinicalDataContextCollection:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __89__HDHealthRecordsXPCServiceClient_processSignedClinicalDataContextCollection_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)indexClinicalDocumentsWithRequest:(id)a3 completion:(id)a4
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
  -[HDHealthRecordsXPCServiceClient _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__HDHealthRecordsXPCServiceClient_indexClinicalDocumentsWithRequest_completion___block_invoke;
  v13[3] = &unk_24D54A3B8;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __80__HDHealthRecordsXPCServiceClient_indexClinicalDocumentsWithRequest_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HDHealthRecordsXPCServiceClient _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v13, v11);

}

uint64_t __80__HDHealthRecordsXPCServiceClient_indexClinicalDocumentsWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_indexClinicalDocumentsWithRequest:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __80__HDHealthRecordsXPCServiceClient_indexClinicalDocumentsWithRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSpotlightSearchResultsForQueryString:(id)a3 completion:(id)a4
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
  -[HDHealthRecordsXPCServiceClient _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __88__HDHealthRecordsXPCServiceClient_fetchSpotlightSearchResultsForQueryString_completion___block_invoke;
  v13[3] = &unk_24D54A3B8;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __88__HDHealthRecordsXPCServiceClient_fetchSpotlightSearchResultsForQueryString_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HDHealthRecordsXPCServiceClient _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v13, v11);

}

uint64_t __88__HDHealthRecordsXPCServiceClient_fetchSpotlightSearchResultsForQueryString_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSpotlightSearchResultsForQueryString:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __88__HDHealthRecordsXPCServiceClient_fetchSpotlightSearchResultsForQueryString_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_performWithProxyHandler:(id)a3 errorHandler:(id)a4
{
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  -[_HKXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7[2](v7, v6);

}

- (void)_synchronousPerformWithProxyHandler:(id)a3 errorHandler:(id)a4
{
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  -[_HKXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7[2](v7, v6);

}

- (id)_objectCompletionOnClientQueue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__HDHealthRecordsXPCServiceClient__objectCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_24D549560;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)objc_msgSend(v8, "copy");

  return v6;
}

void __66__HDHealthRecordsXPCServiceClient__objectCompletionOnClientQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__HDHealthRecordsXPCServiceClient__objectCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_24D549538;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __66__HDHealthRecordsXPCServiceClient__objectCompletionOnClientQueue___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (id)_actionCompletionOnClientQueue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__HDHealthRecordsXPCServiceClient__actionCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_24D54A458;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)objc_msgSend(v8, "copy");

  return v6;
}

void __66__HDHealthRecordsXPCServiceClient__actionCompletionOnClientQueue___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__HDHealthRecordsXPCServiceClient__actionCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_24D54A430;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __66__HDHealthRecordsXPCServiceClient__actionCompletionOnClientQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (id)exportedInterface
{
  return objc_alloc_init(MEMORY[0x24BDD1990]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end
