@implementation FCAnalyticsEndpointConnection

- (FCAnalyticsEndpointConnection)initWithEndpointConnection:(id)a3
{
  id v5;
  FCAnalyticsEndpointConnection *v6;
  FCAnalyticsEndpointConnection *v7;
  FCAsyncSerialQueue *v8;
  FCAsyncSerialQueue *serialQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCAnalyticsEndpointConnection;
  v6 = -[FCAnalyticsEndpointConnection init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpointConnection, a3);
    v8 = objc_alloc_init(FCAsyncSerialQueue);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = v8;

  }
  return v7;
}

- (void)uploadEnvelopeBatch:(id)a3 withURL:(id)a4 valuesByHTTPHeaderField:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  dispatch_get_global_queue(17, 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 1.0;
  -[FCAnalyticsEndpointConnection uploadEnvelopeBatch:withURL:valuesByHTTPHeaderField:priority:callbackQueue:completion:](self, "uploadEnvelopeBatch:withURL:valuesByHTTPHeaderField:priority:callbackQueue:completion:", v13, v12, v11, v15, v10, v14);

}

- (void)uploadEnvelopeBatch:(id)a3 withURL:(id)a4 valuesByHTTPHeaderField:(id)a5 priority:(float)a6 callbackQueue:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  FCAnalyticsEndpointConnection *v28;
  id v29;
  id v30;
  id v31;
  float v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  -[FCAnalyticsEndpointConnection serialQueue](self, "serialQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke;
  v25[3] = &unk_1E464B1D8;
  v26 = v14;
  v27 = v15;
  v28 = self;
  v29 = v16;
  v32 = a6;
  v30 = v17;
  v31 = v18;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  v23 = v15;
  v24 = v14;
  objc_msgSend(v19, "enqueueBlock:", v25);

}

void __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  char v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  double v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  char v22;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(id *)(a1 + 40);
  NewsCoreUserDefaults();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("running_ui_automation"));
  v8 = v7;
  if (v7)
  {
    v9 = NFInternalBuild();

    if (!v9)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setQuery:", CFSTR("testRequest=true"));
    objc_msgSend(v6, "URL");
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v10;
  }

LABEL_6:
  objc_msgSend(*(id *)(a1 + 48), "endpointConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_DWORD *)(a1 + 80);
  v13 = *(_QWORD *)(a1 + 56);
  v14 = *(_QWORD *)(a1 + 64);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke_2;
  v18[3] = &unk_1E464B1B0;
  v22 = v8;
  v19 = v5;
  v20 = v3;
  v21 = *(id *)(a1 + 72);
  v15 = v3;
  v16 = v5;
  LODWORD(v17) = v12;
  objc_msgSend(v11, "performHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:requiresMescalSigning:callbackQueue:completion:", v16, v13, CFSTR("PUT"), v4, CFSTR("application/octet-stream"), 1, v17, v14, v18);

}

void __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  id obj;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (*(_BYTE *)(a1 + 56) && objc_msgSend(v7, "length"))
  {
    FCURLForNewsAnalyticsPayloads();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("response.json"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__87;
    v42 = __Block_byref_object_dispose__87;
    v43 = 0;
    obj = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 4, &obj);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(&v43, obj);
    objc_msgSend(v32, "fc_firstObjectPassingTest:", &__block_literal_global_187);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = (void *)MEMORY[0x1E0C9AA70];
    if (v13)
      v15 = (void *)v13;
    v31 = v15;

    v16 = (void *)MEMORY[0x1E0C99D80];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke_13;
    v34[3] = &unk_1E464B188;
    v17 = v12;
    v35 = v17;
    v36 = &v38;
    objc_msgSend(v16, "fc_dictionary:", v34);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fc_dictionaryByMergingDictionary:withValueCombiner:", v31, &__block_literal_global_22_4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id *)(v39 + 5);
    v33 = (id)v39[5];
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v20, 0, &v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v21, v33);
    objc_msgSend(v22, "writeToFile:atomically:", v17, 0);

    if (v39[5])
    {
      v23 = MEMORY[0x1E0C81028];
      v24 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v28 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend((id)v39[5], "localizedDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("Expected nil error but got %@"), v29);
        *(_DWORD *)buf = 136315906;
        v45 = "-[FCAnalyticsEndpointConnection uploadEnvelopeBatch:withURL:valuesByHTTPHeaderField:priority:callbackQueue"
              ":completion:]_block_invoke_2";
        v46 = 2080;
        v47 = "FCAnalyticsEndpointConnection.m";
        v48 = 1024;
        v49 = 124;
        v50 = 2114;
        v51 = v30;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }

    _Block_object_dispose(&v38, 8);
  }
  if (v8)
  {
    +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", objc_msgSend(v8, "statusCode"), *(_QWORD *)(a1 + 32));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v26 = *(_QWORD *)(a1 + 48);
    if (v26)
      (*(void (**)(uint64_t, BOOL, void *, uint64_t))(v26 + 16))(v26, v25 == 0, v25, 1);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v27 = *(_QWORD *)(a1 + 48);
    if (v27)
      (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v27 + 16))(v27, 0, v9, 0);
  }

}

BOOL __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "count") != 0;
}

void __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke_2_15;
  v7[3] = &unk_1E464B160;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  FCPerformIfNonNil(v4, v7);

}

void __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke_2_15(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id obj;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 4, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v4 + 40), obj);
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  v9 = v8;
  v10 = (void *)MEMORY[0x1E0C9AA70];
  if (v8)
    v10 = v8;
  v11 = v10;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("Expected nil error but got %@"), v13);
    *(_DWORD *)buf = 136315906;
    v17 = "-[FCAnalyticsEndpointConnection uploadEnvelopeBatch:withURL:valuesByHTTPHeaderField:priority:callbackQueue:com"
          "pletion:]_block_invoke_2";
    v18 = 2080;
    v19 = "FCAnalyticsEndpointConnection.m";
    v20 = 1024;
    v21 = 107;
    v22 = 2114;
    v23 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", v11);

}

uint64_t __119__FCAnalyticsEndpointConnection_uploadEnvelopeBatch_withURL_valuesByHTTPHeaderField_priority_callbackQueue_completion___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  v7 = objc_msgSend(v5, "integerValue");

  return objc_msgSend(v4, "numberWithInteger:", v7 + v6);
}

- (FCEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (void)setEndpointConnection:(id)a3
{
  objc_storeStrong((id *)&self->_endpointConnection, a3);
}

- (FCAsyncSerialQueue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_endpointConnection, 0);
}

@end
