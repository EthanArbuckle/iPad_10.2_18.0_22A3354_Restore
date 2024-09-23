@implementation LNTranscriptProvider

- (LNTranscriptProvider)init
{
  LNTranscriptProvider *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  LNTranscriptProvider *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LNTranscriptProvider;
  v2 = -[LNTranscriptProvider init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.link.LNTranscript.internal-queue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

- (NSXPCConnection)connection
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
  v10 = __Block_byref_object_copy__6061;
  v11 = __Block_byref_object_dispose__6062;
  v12 = 0;
  -[LNTranscriptProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__LNTranscriptProvider_connection__block_invoke;
  v6[3] = &unk_1E45DCEC0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSXPCConnection *)v4;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)LNTranscriptProvider;
  -[LNTranscriptProvider dealloc](&v3, sel_dealloc);
}

- (void)configureConnection:(id)a3
{
  id v4;
  void *v5;
  NSXPCConnection *connection;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "xpcInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v5);

  objc_initWeak(&location, self);
  connection = self->_connection;
  -[LNTranscriptProvider queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection _setQueue:](connection, "_setQueue:", v7);

  v8 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__LNTranscriptProvider_configureConnection___block_invoke;
  v11[3] = &unk_1E45DDEF8;
  objc_copyWeak(&v12, &location);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v11);
  v9[0] = v8;
  v9[1] = 3221225472;
  v9[2] = __44__LNTranscriptProvider_configureConnection___block_invoke_13;
  v9[3] = &unk_1E45DDEF8;
  objc_copyWeak(&v10, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)donateWithActionRecord:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  getLNLogCategoryExecution();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((unint64_t)a3 + 1 >= 2 && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)a3, "donating", ", buf, 2u);
  }

  -[LNTranscriptProvider connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __53__LNTranscriptProvider_donateWithActionRecord_reply___block_invoke;
  v18[3] = &unk_1E45DE310;
  v12 = v6;
  v19 = v12;
  v20 = a3;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __53__LNTranscriptProvider_donateWithActionRecord_reply___block_invoke_15;
  v15[3] = &unk_1E45DCDB8;
  v16 = v12;
  v17 = a3;
  v15[4] = self;
  v14 = v12;
  objc_msgSend(v13, "donateWithActionRecord:reply:", v7, v15);

}

- (void)donateActionRecordData:(id)a3 writeImmediately:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[16];

  v5 = a4;
  v8 = a5;
  v9 = a3;
  getLNLogCategoryExecution();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((unint64_t)a3 + 1 >= 2 && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)a3, "donating", ", buf, 2u);
  }

  -[LNTranscriptProvider connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __70__LNTranscriptProvider_donateActionRecordData_writeImmediately_reply___block_invoke;
  v20[3] = &unk_1E45DE310;
  v14 = v8;
  v21 = v14;
  v22 = a3;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __70__LNTranscriptProvider_donateActionRecordData_writeImmediately_reply___block_invoke_16;
  v17[3] = &unk_1E45DCDB8;
  v18 = v14;
  v19 = a3;
  v17[4] = self;
  v16 = v14;
  objc_msgSend(v15, "donateActionRecordData:writeImmediately:reply:", v9, v5, v17);

}

- (id)transcriptPublisherFromDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__6061;
  v26 = __Block_byref_object_dispose__6062;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6061;
  v20 = __Block_byref_object_dispose__6062;
  v21 = 0;
  -[LNTranscriptProvider connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__LNTranscriptProvider_transcriptPublisherFromDate_error___block_invoke;
  v15[3] = &unk_1E45DE140;
  v15[4] = &v16;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __58__LNTranscriptProvider_transcriptPublisherFromDate_error___block_invoke_18;
  v14[3] = &unk_1E45DE168;
  v14[4] = &v16;
  v14[5] = &v22;
  objc_msgSend(v9, "requestReadAccessWithReply:", v14);

  if (a4)
  {
    v10 = (void *)v17[5];
    if (v10)
      *a4 = objc_retainAutorelease(v10);
  }
  objc_msgSend((id)v23[5], "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[LNTranscriptProvider publisherForStream:fromDate:toDate:maxEvents:reversed:](LNTranscriptProvider, "publisherForStream:fromDate:toDate:maxEvents:reversed:", v11, v6, 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

- (id)transcriptPublisherFromDate:(id)a3 toDate:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[6];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__6061;
  v34 = __Block_byref_object_dispose__6062;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__6061;
  v28 = __Block_byref_object_dispose__6062;
  v29 = 0;
  -[LNTranscriptProvider connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __84__LNTranscriptProvider_transcriptPublisherFromDate_toDate_maxEvents_reversed_error___block_invoke;
  v23[3] = &unk_1E45DE140;
  v23[4] = &v24;
  objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __84__LNTranscriptProvider_transcriptPublisherFromDate_toDate_maxEvents_reversed_error___block_invoke_21;
  v22[3] = &unk_1E45DE168;
  v22[4] = &v24;
  v22[5] = &v30;
  objc_msgSend(v17, "requestReadAccessWithReply:", v22);

  if (a7)
  {
    v18 = (void *)v25[5];
    if (v18)
      *a7 = objc_retainAutorelease(v18);
  }
  objc_msgSend((id)v31[5], "url");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[LNTranscriptProvider publisherForStream:fromDate:toDate:maxEvents:reversed:](LNTranscriptProvider, "publisherForStream:fromDate:toDate:maxEvents:reversed:", v19, v12, v13, v14, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v20;
}

- (void)deleteRecordsWithMatchingPredicate:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[LNTranscriptProvider connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__LNTranscriptProvider_deleteRecordsWithMatchingPredicate_reply___block_invoke;
  v15[3] = &unk_1E45DE2E8;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __65__LNTranscriptProvider_deleteRecordsWithMatchingPredicate_reply___block_invoke_22;
  v13[3] = &unk_1E45DCDE0;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "deleteRecordsWithMatchingPredicate:reply:", v7, v13);

}

- (void)deleteAllRecordsWithReply:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[LNTranscriptProvider connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__LNTranscriptProvider_deleteAllRecordsWithReply___block_invoke;
  v12[3] = &unk_1E45DE2E8;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __50__LNTranscriptProvider_deleteAllRecordsWithReply___block_invoke_24;
  v10[3] = &unk_1E45DDED0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "deleteAllRecordsWithReply:", v10);

}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __50__LNTranscriptProvider_deleteAllRecordsWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getLNLogCategoryGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_INFO, "XPC Error when executing deleteAllRecordsWithReply. error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__LNTranscriptProvider_deleteAllRecordsWithReply___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    getLNLogCategoryGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_INFO, "Error when executing deleteAllRecordsWithReply. error: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __65__LNTranscriptProvider_deleteRecordsWithMatchingPredicate_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getLNLogCategoryGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_INFO, "XPC Error when executing deleteRecordsWithMatchingPredicate. error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__LNTranscriptProvider_deleteRecordsWithMatchingPredicate_reply___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    getLNLogCategoryGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1A18F6000, v7, OS_LOG_TYPE_INFO, "Error when executing deleteRecordsWithMatchingPredicate. error: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __84__LNTranscriptProvider_transcriptPublisherFromDate_toDate_maxEvents_reversed_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getLNLogCategoryGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_ERROR, "Error when executing requestReadAccessWithReply. error: %@", (uint8_t *)&v8, 0xCu);
  }

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("LNTranscriptErrorDomain"), 1004, 0);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __84__LNTranscriptProvider_transcriptPublisherFromDate_toDate_maxEvents_reversed_error___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __58__LNTranscriptProvider_transcriptPublisherFromDate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getLNLogCategoryGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_ERROR, "Error when executing requestReadAccessWithReply. error: %@", (uint8_t *)&v8, 0xCu);
  }

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("LNTranscriptErrorDomain"), 1004, 0);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __58__LNTranscriptProvider_transcriptPublisherFromDate_error___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __70__LNTranscriptProvider_donateActionRecordData_writeImmediately_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getLNLogCategoryGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_INFO, "XPC Error when executing donateActionRecordData. error: %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  getLNLogCategoryExecution();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v6, OS_SIGNPOST_INTERVAL_END, v7, "donating", ", (uint8_t *)&v8, 2u);
  }

}

void __70__LNTranscriptProvider_donateActionRecordData_writeImmediately_reply___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    getLNLogCategoryGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_INFO, "Error when executing donateActionRecordData. error: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  getLNLogCategoryExecution();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v6, OS_SIGNPOST_INTERVAL_END, v7, "donating", ", (uint8_t *)&v8, 2u);
  }

}

void __53__LNTranscriptProvider_donateWithActionRecord_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getLNLogCategoryGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_INFO, "XPC Error when executing donateWithActionRecord. error: %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  getLNLogCategoryExecution();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v6, OS_SIGNPOST_INTERVAL_END, v7, "donating", ", (uint8_t *)&v8, 2u);
  }

}

void __53__LNTranscriptProvider_donateWithActionRecord_reply___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    getLNLogCategoryGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_INFO, "Error when executing donateWithActionRecord. error: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  getLNLogCategoryExecution();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v6, OS_SIGNPOST_INTERVAL_END, v7, "donating", ", (uint8_t *)&v8, 2u);
  }

}

void __44__LNTranscriptProvider_configureConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  _QWORD *v4;
  void *v5;
  uint8_t v6[16];

  getLNLogCategoryGeneral();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A18F6000, v2, OS_LOG_TYPE_ERROR, "XPC connection has been interrupted", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 1), "invalidate");
    v5 = (void *)v4[1];
    v4[1] = 0;

  }
}

void __44__LNTranscriptProvider_configureConnection___block_invoke_13(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint8_t v6[16];

  getLNLogCategoryGeneral();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A18F6000, v2, OS_LOG_TYPE_INFO, "XPC connection has been invalidated", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 1);
    *((_QWORD *)WeakRetained + 1) = 0;

  }
}

void __34__LNTranscriptProvider_connection__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.linkd.transcript"), 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    objc_msgSend(*(id *)(a1 + 32), "configureConnection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "resume");
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

+ (id)createStreamsWithStreamURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint8_t v14[16];

  v3 = a3;
  objc_msgSend(v3, "URLByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Special")))
  {
    getLNLogCategoryGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1A18F6000, v7, OS_LOG_TYPE_INFO, "Using class D protection for special stream.", v14, 2u);
    }

    v8 = 4;
  }
  else
  {
    v8 = 3;
  }
  v9 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newPrivateStreamDefaultConfigurationWithStoreBasePath:protectionClass:", v5, v8);
  v10 = objc_alloc(MEMORY[0x1E0D02790]);
  objc_msgSend(v3, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithPrivateStreamIdentifier:storeConfig:eventDataClass:", v11, v9, 0);

  return v12;
}

+ (id)publisherForStream:(id)a3 fromDate:(id)a4 toDate:(id)a5 maxEvents:(id)a6 reversed:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  LNDeallocationHandler *v20;
  id v21;
  _QWORD v23[4];
  id v24;

  v7 = a7;
  v11 = a3;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  objc_msgSend(v11, "startAccessingSecurityScopedResource");
  objc_msgSend((id)objc_opt_class(), "createStreamsWithStreamURL:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0D026F0]);
  v17 = objc_msgSend(v12, "unsignedLongLongValue");

  v18 = (void *)objc_msgSend(v16, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v14, v13, v17, 0, v7);
  objc_msgSend(v15, "publisherWithOptions:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = [LNDeallocationHandler alloc];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __78__LNTranscriptProvider_publisherForStream_fromDate_toDate_maxEvents_reversed___block_invoke;
  v23[3] = &unk_1E45DDE18;
  v24 = v11;
  v21 = v11;

  return v19;
}

uint64_t __78__LNTranscriptProvider_publisherForStream_fromDate_toDate_maxEvents_reversed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
}

@end
