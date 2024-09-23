@implementation NDAnalyticsPayloadUploader

- (NDAnalyticsPayloadUploader)init
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
    v8 = "-[NDAnalyticsPayloadUploader init]";
    v9 = 2080;
    v10 = "NDAnalyticsPayloadUploader.m";
    v11 = 1024;
    v12 = 32;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_214674000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NDAnalyticsPayloadUploader init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NDAnalyticsPayloadUploader)initWithAppConfigurationManager:(id)a3
{
  id v4;
  NDAnalyticsPayloadUploader *v5;
  void *v6;
  uint64_t v7;
  FCAnalyticsEndpointConnection *endpointConnection;
  uint64_t v9;
  FCAsyncSerialQueue *uploadQueue;
  objc_super v12;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsPayloadUploader initWithAppConfigurationManager:].cold.1();
  v12.receiver = self;
  v12.super_class = (Class)NDAnalyticsPayloadUploader;
  v5 = -[NDAnalyticsPayloadUploader init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CB58]), "initWithSourceApplicationBundleIdentifier:", CFSTR("com.apple.news"));
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CA98]), "initWithEndpointConnection:", v6);
    endpointConnection = v5->_endpointConnection;
    v5->_endpointConnection = (FCAnalyticsEndpointConnection *)v7;

    v9 = objc_opt_new();
    uploadQueue = v5->_uploadQueue;
    v5->_uploadQueue = (FCAsyncSerialQueue *)v9;

  }
  return v5;
}

- (void)uploadPayloadsForInfos:(id)a3 withEnvelopeStore:(id)a4 perPayloadCompletion:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  void *v21;
  id obj;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  NDAnalyticsPayloadUploader *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v23 = a5;
  v20 = a6;
  if (!v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NDAnalyticsPayloadUploader uploadPayloadsForInfos:withEnvelopeStore:perPayloadCompletion:completion:].cold.3();
    if (v11)
      goto LABEL_6;
  }
  else if (v11)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsPayloadUploader uploadPayloadsForInfos:withEnvelopeStore:perPayloadCompletion:completion:].cold.2();
LABEL_6:
  v12 = v11;
  if (!v23 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsPayloadUploader uploadPayloadsForInfos:withEnvelopeStore:perPayloadCompletion:completion:].cold.1();
  -[NDAnalyticsPayloadUploader uploadQueue](self, "uploadQueue", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v10;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  v15 = MEMORY[0x24BDAC760];
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v26[0] = v15;
        v26[1] = 3221225472;
        v26[2] = __103__NDAnalyticsPayloadUploader_uploadPayloadsForInfos_withEnvelopeStore_perPayloadCompletion_completion___block_invoke;
        v26[3] = &unk_24D1DEE60;
        v27 = v12;
        v28 = v19;
        v29 = self;
        v30 = v23;
        objc_msgSend(v13, "enqueueBlock:", v26);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v16);
  }

  if (v21)
  {
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = __103__NDAnalyticsPayloadUploader_uploadPayloadsForInfos_withEnvelopeStore_perPayloadCompletion_completion___block_invoke_4;
    v24[3] = &unk_24D1DEE88;
    v25 = v21;
    objc_msgSend(v13, "enqueueBlock:", v24);

  }
}

void __103__NDAnalyticsPayloadUploader_uploadPayloadsForInfos_withEnvelopeStore_perPayloadCompletion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "entriesToUpload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "envelopesForEntries:", v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "droppedEntriesByReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_24D1E3568);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setMajorVersion:", 0);
  objc_msgSend(v9, "setMinorVersion:", 1);
  objc_msgSend(v9, "setPatchVersion:", 0);
  objc_msgSend(v9, "setEnvelopeDroppedCountDueToSizeLimit:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v9, "setEnvelopes:", v10);

  v11 = (void *)MEMORY[0x24BDBCE30];
  v12 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __103__NDAnalyticsPayloadUploader_uploadPayloadsForInfos_withEnvelopeStore_perPayloadCompletion_completion___block_invoke_21;
  v26[3] = &unk_24D1DEE10;
  v27 = v6;
  v28 = v8;
  v13 = v8;
  v14 = v6;
  objc_msgSend(v11, "fc_array:", v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsPreparedForUpload:](NAUAnalyticsEnvelopeTracker, "registerEnvelopeContentTypesAsPreparedForUpload:", v15);
  objc_msgSend(*(id *)(a1 + 48), "endpointConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "endpointURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "valuesByHTTPHeaderField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __103__NDAnalyticsPayloadUploader_uploadPayloadsForInfos_withEnvelopeStore_perPayloadCompletion_completion___block_invoke_3;
  v23[3] = &unk_24D1DEE38;
  v24 = v3;
  v19 = *(id *)(a1 + 56);
  v20 = *(_QWORD *)(a1 + 40);
  v25 = v19;
  v23[4] = v20;
  v21 = v3;
  objc_msgSend(v16, "uploadEnvelopeBatch:withURL:valuesByHTTPHeaderField:completion:", v9, v17, v18, v23);

}

void __103__NDAnalyticsPayloadUploader_uploadPayloadsForInfos_withEnvelopeStore_perPayloadCompletion_completion___block_invoke_21(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "fc_arrayByTransformingWithBlock:", &__block_literal_global_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v3);

  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    NDAnalyticsEnvelopeContentTypesFromEntries(v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = v5;
    else
      v7 = MEMORY[0x24BDBD1A8];
    objc_msgSend(v8, "addObjectsFromArray:", v7);

  }
}

uint64_t __103__NDAnalyticsPayloadUploader_uploadPayloadsForInfos_withEnvelopeStore_perPayloadCompletion_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a2, "contentType"));
}

void __103__NDAnalyticsPayloadUploader_uploadPayloadsForInfos_withEnvelopeStore_perPayloadCompletion_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t);
  id v6;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void (**)(uint64_t))(v4 + 16);
  v6 = a3;
  v5(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __103__NDAnalyticsPayloadUploader_uploadPayloadsForInfos_withEnvelopeStore_perPayloadCompletion_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (FCAnalyticsEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (void)setEndpointConnection:(id)a3
{
  objc_storeStrong((id *)&self->_endpointConnection, a3);
}

- (FCAsyncSerialQueue)uploadQueue
{
  return self->_uploadQueue;
}

- (void)setUploadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_uploadQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadQueue, 0);
  objc_storeStrong((id *)&self->_endpointConnection, 0);
}

- (void)initWithAppConfigurationManager:.cold.1()
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

- (void)uploadPayloadsForInfos:withEnvelopeStore:perPayloadCompletion:completion:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"perPayloadCompletion", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)uploadPayloadsForInfos:withEnvelopeStore:perPayloadCompletion:completion:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopeStore", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)uploadPayloadsForInfos:withEnvelopeStore:perPayloadCompletion:completion:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"payloadInfos", v6, 2u);

  OUTLINED_FUNCTION_3();
}

@end
