@implementation _DKXPCKnowledgeStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_DKXPCKnowledgeStore;
  -[_DKXPCKnowledgeStore dealloc](&v3, sel_dealloc);
}

+ (id)XPCUserKnowledgeStore
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMachServiceName:", CFSTR("com.apple.coreduetd.knowledge"));
}

- (_DKXPCKnowledgeStore)initWithMachServiceName:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  _DKXPCKnowledgeStore *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3B38];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithMachServiceName:options:", v5, 0);

  v7 = -[_DKXPCKnowledgeStore initWithConnection:](self, "initWithConnection:", v6);
  return v7;
}

- (_DKXPCKnowledgeStore)initWithConnection:(id)a3
{
  id v5;
  _DKXPCKnowledgeStore *v6;
  _DKXPCKnowledgeStore *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_DKXPCKnowledgeStore;
  v6 = -[_DKXPCKnowledgeStore init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    _DKDaemonInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7->_connection, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection resume](v7->_connection, "resume");
  }

  return v7;
}

- (void)saveObjects:(id)a3 tracker:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  id v6;

  v6 = -[_DKXPCKnowledgeStore saveObjects:synchronous:responseQueue:withCompletion:](self, "saveObjects:synchronous:responseQueue:withCompletion:", a3, 0, a5, a6);
}

- (id)saveObjects:(id)a3 synchronous:(BOOL)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  NSXPCConnection *connection;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[5];
  id v25;
  id v26;
  __int128 *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v8 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v10, "count");
    _os_log_impl(&dword_18DDBE000, v13, OS_LOG_TYPE_INFO, "Starting saveObjects with %lu objects.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__25;
  v35 = __Block_byref_object_dispose__25;
  v36 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke;
  v28[3] = &unk_1E26E6B58;
  v15 = v12;
  v30 = v15;
  v16 = v11;
  v29 = v16;
  p_buf = &buf;
  v17 = (void *)MEMORY[0x193FEEAF4](v28);
  connection = self->_connection;
  if (v8)
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  else
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_3;
  v24[3] = &unk_1E26E6B80;
  v24[4] = self;
  v20 = v15;
  v26 = v20;
  v21 = v16;
  v25 = v21;
  v27 = &buf;
  objc_msgSend(v19, "saveObjects:reply:", v10, v24);
  v22 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v22;
}

- (_DKXPCKnowledgeStore)init
{
  return -[_DKXPCKnowledgeStore initWithMachServiceName:](self, "initWithMachServiceName:", CFSTR("com.apple.coreduetd.knowledge"));
}

- (id)executeQuery:(id)a3 synchronous:(BOOL)a4 error:(id *)a5 responseQueue:(id)a6 withCompletion:(id)a7
{
  _BOOL4 v10;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  NSXPCConnection *connection;
  NSObject *v19;
  uint64_t v20;
  _QWORD *v21;
  NSObject *v22;
  void (*v23)(uint64_t);
  void (*v24)(uint64_t);
  id v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  __int128 *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  __int128 *p_buf;
  _QWORD v47[4];
  id v48;
  __int128 buf;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v10 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v28 = a6;
  v29 = a7;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v30;
    _os_log_impl(&dword_18DDBE000, v12, OS_LOG_TYPE_INFO, "Starting executeQuery with query %@.", (uint8_t *)&buf, 0xCu);
  }

  +[_DKQuery executableQueryForQuery:](_DKQuery, "executableQueryForQuery:", v30);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__25;
    v52 = __Block_byref_object_dispose__25;
    v53 = 0;
    v14 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_2;
    v43[3] = &unk_1E26E6B58;
    v15 = v29;
    v45 = v15;
    v16 = v28;
    v44 = v16;
    p_buf = &buf;
    v17 = (void *)MEMORY[0x193FEEAF4](v43);
    connection = self->_connection;
    if (v10)
      -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    else
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v17);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__25;
    v41 = __Block_byref_object_dispose__25;
    v42 = 0;
    v31[0] = v14;
    v31[1] = 3221225472;
    v31[2] = __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_3;
    v31[3] = &unk_1E26E6BF8;
    v31[4] = self;
    v32 = v13;
    v34 = v15;
    v33 = v16;
    v35 = &buf;
    v36 = &v37;
    objc_msgSend(v26, "executeQuery:reply:", v30, v31);
    if (a5)
      *a5 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    v25 = (id)v38[5];

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[_DKXPCKnowledgeStore executeQuery:synchronous:error:responseQueue:withCompletion:].cold.2(v19);

    if (v29)
    {
      if (!v28)
        -[_DKXPCKnowledgeStore executeQuery:synchronous:error:responseQueue:withCompletion:].cold.1();
      v20 = MEMORY[0x1E0C809B0];
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke;
      v47[3] = &unk_1E26E3358;
      v48 = v29;
      v21 = v47;
      v22 = v28;
      v23 = (void (*)(uint64_t))os_transaction_create();
      *(_QWORD *)&buf = v20;
      *((_QWORD *)&buf + 1) = 3221225472;
      v50 = (uint64_t)__cd_dispatch_async_capture_tx_block_invoke_11;
      v51 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E26E3380;
      v52 = v23;
      v53 = v21;
      v24 = v23;
      dispatch_async(v22, &buf);

    }
    v25 = 0;
  }

  return v25;
}

- (id)executeQuery:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  -[_DKXPCKnowledgeStore executeQuery:synchronous:error:responseQueue:withCompletion:](self, "executeQuery:synchronous:error:responseQueue:withCompletion:", a3, 1, &v9, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = v6;
  if (a4)
    *a4 = objc_retainAutorelease(v6);

  return v5;
}

+ (id)XPCKnowledgeStore
{
  return objc_alloc_init((Class)a1);
}

- (void)saveObjects:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v5;

  v5 = -[_DKXPCKnowledgeStore saveObjects:synchronous:responseQueue:withCompletion:](self, "saveObjects:synchronous:responseQueue:withCompletion:", a3, 0, a4, a5);
}

- (BOOL)saveObjects:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  -[_DKXPCKnowledgeStore saveObjects:synchronous:responseQueue:withCompletion:](self, "saveObjects:synchronous:responseQueue:withCompletion:", a3, 1, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
    *a4 = objc_retainAutorelease(v5);

  return v6 == 0;
}

- (id)deleteObjects:(id)a3 synchronous:(BOOL)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  NSXPCConnection *connection;
  NSObject *v19;
  uint64_t v20;
  _QWORD *v21;
  NSObject *v22;
  void (*v23)(uint64_t);
  void (*v24)(uint64_t);
  id v25;
  void *v26;
  void *v27;
  _QWORD v29[5];
  id v30;
  id v31;
  __int128 *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  __int128 *p_buf;
  _QWORD v37[4];
  id v38;
  __int128 buf;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v8 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v10, "count");
    _os_log_impl(&dword_18DDBE000, v13, OS_LOG_TYPE_INFO, "Starting deleteObjects with %lu objects.", (uint8_t *)&buf, 0xCu);
  }

  if (objc_msgSend(v10, "count"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__25;
    v42 = __Block_byref_object_dispose__25;
    v43 = 0;
    v14 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_2;
    v33[3] = &unk_1E26E6B58;
    v15 = v12;
    v35 = v15;
    v16 = v11;
    v34 = v16;
    p_buf = &buf;
    v17 = (void *)MEMORY[0x193FEEAF4](v33);
    connection = self->_connection;
    if (v8)
      -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    else
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v17);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x193FEE914]();
    v29[0] = v14;
    v29[1] = 3221225472;
    v29[2] = __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_3;
    v29[3] = &unk_1E26E6B80;
    v29[4] = self;
    v31 = v15;
    v30 = v16;
    v32 = &buf;
    objc_msgSend(v26, "deleteObjects:reply:", v10, v29);

    objc_autoreleasePoolPop(v27);
    v25 = *(id *)(*((_QWORD *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_18DDBE000, v19, OS_LOG_TYPE_INFO, "Early out because no valid objects were provided.", (uint8_t *)&buf, 2u);
    }

    if (v12)
    {
      if (!v11)
        -[_DKXPCKnowledgeStore deleteObjects:synchronous:responseQueue:withCompletion:].cold.1();
      v20 = MEMORY[0x1E0C809B0];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke;
      v37[3] = &unk_1E26E3358;
      v38 = v12;
      v21 = v37;
      v22 = v11;
      v23 = (void (*)(uint64_t))os_transaction_create();
      *(_QWORD *)&buf = v20;
      *((_QWORD *)&buf + 1) = 3221225472;
      v40 = (uint64_t)__cd_dispatch_async_capture_tx_block_invoke_11;
      v41 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E26E3380;
      v42 = v23;
      v43 = v21;
      v24 = v23;
      dispatch_async(v22, &buf);

    }
    v25 = 0;
  }

  return v25;
}

- (void)deleteObjects:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v5;

  v5 = -[_DKXPCKnowledgeStore deleteObjects:synchronous:responseQueue:withCompletion:](self, "deleteObjects:synchronous:responseQueue:withCompletion:", a3, 0, a4, a5);
}

- (BOOL)deleteObjects:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  -[_DKXPCKnowledgeStore deleteObjects:synchronous:responseQueue:withCompletion:](self, "deleteObjects:synchronous:responseQueue:withCompletion:", a3, 1, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4 && v5)
    *a4 = objc_retainAutorelease(v5);

  return v6 == 0;
}

- (unint64_t)deleteAllEventsInEventStream:(id)a3 synchronous:(BOOL)a4 error:(id *)a5 responseQueue:(id)a6 withCompletion:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSXPCConnection *connection;
  uint64_t v21;
  _QWORD *v22;
  void (*v23)(uint64_t);
  void (*v24)(uint64_t);
  unint64_t v25;
  void *v26;
  void *v27;
  dispatch_queue_t queue;
  _QWORD v30[5];
  NSObject *v31;
  id v32;
  uint64_t *v33;
  __int128 *v34;
  _QWORD v35[4];
  NSObject *v36;
  id v37;
  __int128 *p_buf;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  __int128 buf;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v10 = a4;
  v50 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  queue = (dispatch_queue_t)a6;
  v13 = a7;
  v14 = v13;
  if (v12)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_INFO, "Starting deleteAllEventsInEventStream with stream %@.", (uint8_t *)&buf, 0xCu);
    }

    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__25;
    v48 = __Block_byref_object_dispose__25;
    v49 = 0;
    v16 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_11;
    v35[3] = &unk_1E26E6B58;
    v17 = v14;
    v37 = v17;
    v18 = queue;
    v36 = v18;
    p_buf = &buf;
    v19 = (void *)MEMORY[0x193FEEAF4](v35);
    connection = self->_connection;
    if (v10)
      -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
    else
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name", queue);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v16;
    v30[1] = 3221225472;
    v30[2] = __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_3;
    v30[3] = &unk_1E26E6BD0;
    v30[4] = self;
    v33 = &v39;
    v34 = &buf;
    v32 = v17;
    v31 = v18;
    objc_msgSend(v26, "deleteAllEventsInEventStreamNamed:reply:", v27, v30);

    if (a5)
      *a5 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    v25 = v40[3];

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v39, 8);
  }
  else
  {
    if (v13)
    {
      if (!queue)
        -[_DKXPCKnowledgeStore deleteAllEventsInEventStream:synchronous:error:responseQueue:withCompletion:].cold.1();
      v21 = MEMORY[0x1E0C809B0];
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke;
      v43[3] = &unk_1E26E3358;
      v44 = v13;
      v22 = v43;
      v23 = (void (*)(uint64_t))os_transaction_create();
      *(_QWORD *)&buf = v21;
      *((_QWORD *)&buf + 1) = 3221225472;
      v46 = (uint64_t)__cd_dispatch_async_capture_tx_block_invoke_11;
      v47 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E26E3380;
      v48 = v23;
      v49 = v22;
      v24 = v23;
      dispatch_async(queue, &buf);

    }
    v25 = 0;
    if (a5)
      *a5 = 0;
  }

  return v25;
}

- (void)deleteAllEventsInEventStream:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  -[_DKXPCKnowledgeStore deleteAllEventsInEventStream:synchronous:error:responseQueue:withCompletion:](self, "deleteAllEventsInEventStream:synchronous:error:responseQueue:withCompletion:", a3, 0, 0, a4, a5);
}

- (unint64_t)deleteAllEventsInEventStream:(id)a3 error:(id *)a4
{
  unint64_t v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  v5 = -[_DKXPCKnowledgeStore deleteAllEventsInEventStream:synchronous:error:responseQueue:withCompletion:](self, "deleteAllEventsInEventStream:synchronous:error:responseQueue:withCompletion:", a3, 1, &v9, 0, 0);
  v6 = v9;
  v7 = v6;
  if (a4)
    *a4 = objc_retainAutorelease(v6);

  return v5;
}

- (unint64_t)deleteAllEventsMatchingPredicate:(id)a3 synchronous:(BOOL)a4 error:(id *)a5 responseQueue:(id)a6 withCompletion:(id)a7
{
  _BOOL4 v10;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSXPCConnection *connection;
  uint64_t v23;
  _QWORD *v24;
  void (*v25)(uint64_t);
  void (*v26)(uint64_t);
  unint64_t v27;
  void *v28;
  _QWORD v30[5];
  NSObject *v31;
  id v32;
  uint64_t *v33;
  __int128 *v34;
  _QWORD v35[4];
  NSObject *v36;
  id v37;
  __int128 *p_buf;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  __int128 buf;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v10 = a4;
  v50 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = v14;
  if (v12)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v12, "cd_sanitizeForLogging");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v17;
      _os_log_impl(&dword_18DDBE000, v16, OS_LOG_TYPE_INFO, "Starting deleteAllEventsMatchingPredicate with predicate %@.", (uint8_t *)&buf, 0xCu);

    }
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__25;
    v48 = __Block_byref_object_dispose__25;
    v49 = 0;
    v18 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_14;
    v35[3] = &unk_1E26E6B58;
    v19 = v15;
    v37 = v19;
    v20 = v13;
    v36 = v20;
    p_buf = &buf;
    v21 = (void *)MEMORY[0x193FEEAF4](v35);
    connection = self->_connection;
    if (v10)
      -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
    else
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v18;
    v30[1] = 3221225472;
    v30[2] = __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_3;
    v30[3] = &unk_1E26E6BD0;
    v30[4] = self;
    v33 = &v39;
    v34 = &buf;
    v32 = v19;
    v31 = v20;
    objc_msgSend(v28, "deleteAllEventsMatchingPredicate:reply:", v12, v30);
    if (a5)
      *a5 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    v27 = v40[3];

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v39, 8);
  }
  else
  {
    if (v14)
    {
      if (!v13)
        -[_DKXPCKnowledgeStore deleteAllEventsMatchingPredicate:synchronous:error:responseQueue:withCompletion:].cold.1();
      v23 = MEMORY[0x1E0C809B0];
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke;
      v43[3] = &unk_1E26E3358;
      v44 = v14;
      v24 = v43;
      v25 = (void (*)(uint64_t))os_transaction_create();
      *(_QWORD *)&buf = v23;
      *((_QWORD *)&buf + 1) = 3221225472;
      v46 = (uint64_t)__cd_dispatch_async_capture_tx_block_invoke_11;
      v47 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E26E3380;
      v48 = v25;
      v49 = v24;
      v26 = v25;
      dispatch_async(v13, &buf);

    }
    v27 = 0;
    if (a5)
      *a5 = 0;
  }

  return v27;
}

- (void)deleteAllEventsMatchingPredicate:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  -[_DKXPCKnowledgeStore deleteAllEventsMatchingPredicate:synchronous:error:responseQueue:withCompletion:](self, "deleteAllEventsMatchingPredicate:synchronous:error:responseQueue:withCompletion:", a3, 0, 0, a4, a5);
}

- (unint64_t)deleteAllEventsMatchingPredicate:(id)a3 error:(id *)a4
{
  unint64_t v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  v5 = -[_DKXPCKnowledgeStore deleteAllEventsMatchingPredicate:synchronous:error:responseQueue:withCompletion:](self, "deleteAllEventsMatchingPredicate:synchronous:error:responseQueue:withCompletion:", a3, 1, &v9, 0, 0);
  v6 = v9;
  v7 = v6;
  if (a4)
    *a4 = objc_retainAutorelease(v6);

  return v5;
}

- (void)executeQuery:(id)a3 responseQueue:(id)a4
{
  -[_DKXPCKnowledgeStore executeQuery:responseQueue:withCompletion:](self, "executeQuery:responseQueue:withCompletion:", a3, a4, 0);
}

- (void)executeQuery:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = 138412290;
    v14 = v8;
    _os_log_impl(&dword_18DDBE000, v11, OS_LOG_TYPE_INFO, "Starting executeQuery with query %@.", (uint8_t *)&v13, 0xCu);
  }

  v12 = -[_DKXPCKnowledgeStore executeQuery:synchronous:error:responseQueue:withCompletion:](self, "executeQuery:synchronous:error:responseQueue:withCompletion:", v8, 0, 0, v9, v10);
}

- (BOOL)synchronizeWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  NSXPCConnection *connection;
  void *v8;
  void *v9;
  char v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  _QWORD v17[5];
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_INFO, "Starting synchronizeWithError.", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v19 = buf;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__25;
  v22 = __Block_byref_object_dispose__25;
  v23 = 0;
  v6 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __45___DKXPCKnowledgeStore_synchronizeWithError___block_invoke;
  v17[3] = &unk_1E26E6748;
  v17[4] = buf;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __45___DKXPCKnowledgeStore_synchronizeWithError___block_invoke_21;
  v12[3] = &unk_1E26E6C20;
  v12[4] = buf;
  v12[5] = &v13;
  objc_msgSend(v8, "synchronizeWithReply:", v12);
  if (a3)
  {
    v9 = (void *)*((_QWORD *)v19 + 5);
    if (v9)
      *a3 = objc_retainAutorelease(v9);
  }
  v10 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(buf, 8);
  return v10;
}

- (BOOL)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSXPCConnection *connection;
  void *v12;
  void *v13;
  char v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  _QWORD v21[5];
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a4;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_INFO, "Starting synchronizeWithUrgency.", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v23 = buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__25;
  v26 = __Block_byref_object_dispose__25;
  v27 = 0;
  v10 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __60___DKXPCKnowledgeStore_synchronizeWithUrgency_client_error___block_invoke;
  v21[3] = &unk_1E26E6748;
  v21[4] = buf;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __60___DKXPCKnowledgeStore_synchronizeWithUrgency_client_error___block_invoke_22;
  v16[3] = &unk_1E26E6C20;
  v16[4] = buf;
  v16[5] = &v17;
  objc_msgSend(v12, "synchronizeWithUrgency:client:reply:", a3, v8, v16);
  if (a5)
  {
    v13 = (void *)*((_QWORD *)v23 + 5);
    if (v13)
      *a5 = objc_retainAutorelease(v13);
  }
  v14 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(buf, 8);
  return v14;
}

- (void)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 responseQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSXPCConnection *connection;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[16];

  v10 = a5;
  v11 = a6;
  v12 = a4;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DDBE000, v13, OS_LOG_TYPE_INFO, "Starting async synchronizeWithUrgency.", buf, 2u);
  }

  connection = self->_connection;
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke;
  v24[3] = &unk_1E26E6C48;
  v16 = v11;
  v26 = v16;
  v17 = v10;
  v25 = v17;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_3;
  v21[3] = &unk_1E26E6C70;
  v22 = v17;
  v23 = v16;
  v21[4] = self;
  v19 = v17;
  v20 = v16;
  objc_msgSend(v18, "synchronizeWithUrgency:client:reply:", a3, v12, v21);

}

- (BOOL)deleteRemoteState:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  NSXPCConnection *connection;
  void *v8;
  void *v9;
  char v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  _QWORD v17[5];
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_INFO, "Starting deleteRemoteState.", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v19 = buf;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__25;
  v22 = __Block_byref_object_dispose__25;
  v23 = 0;
  v6 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __42___DKXPCKnowledgeStore_deleteRemoteState___block_invoke;
  v17[3] = &unk_1E26E6748;
  v17[4] = buf;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __42___DKXPCKnowledgeStore_deleteRemoteState___block_invoke_24;
  v12[3] = &unk_1E26E6C20;
  v12[4] = buf;
  v12[5] = &v13;
  objc_msgSend(v8, "deleteRemoteState:", v12);
  if (a3)
  {
    v9 = (void *)*((_QWORD *)v19 + 5);
    if (v9)
      *a3 = objc_retainAutorelease(v9);
  }
  v10 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(buf, 8);
  return v10;
}

- (id)sourceDeviceIdentityFromObject:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncDeviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sourceDeviceIdentityWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  NSXPCConnection *connection;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[5];
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_INFO, "Starting sourceDeviceIdentityWithError.", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v21 = buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__25;
  v24 = __Block_byref_object_dispose__25;
  v25 = 0;
  v6 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __54___DKXPCKnowledgeStore_sourceDeviceIdentityWithError___block_invoke;
  v19[3] = &unk_1E26E6748;
  v19[4] = buf;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__25;
  v17 = __Block_byref_object_dispose__25;
  v18 = 0;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __54___DKXPCKnowledgeStore_sourceDeviceIdentityWithError___block_invoke_25;
  v12[3] = &unk_1E26E6C98;
  v12[4] = buf;
  v12[5] = &v13;
  objc_msgSend(v8, "sourceDeviceIdentityWithReply:", v12);
  if (a3)
  {
    v9 = (void *)*((_QWORD *)v21 + 5);
    if (v9)
      *a3 = objc_retainAutorelease(v9);
  }
  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(buf, 8);
  return v10;
}

- (id)deviceUUID
{
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DDBE000, v3, OS_LOG_TYPE_INFO, "Starting deviceUUID.", buf, 2u);
  }

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_76);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v9 = buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__25;
  v12 = __Block_byref_object_dispose__25;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34___DKXPCKnowledgeStore_deviceUUID__block_invoke_26;
  v7[3] = &unk_1E26E6CC0;
  v7[4] = buf;
  objc_msgSend(v4, "deviceUUIDWithReply:", v7);
  v5 = *((id *)v9 + 5);
  _Block_object_dispose(buf, 8);

  return v5;
}

- (BOOL)confirmConnectionWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  _QWORD v18[5];
  os_activity_scope_state_s state;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = _os_activity_create(&dword_18DDBE000, "Duet: confirmConnectionWithError", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl(&dword_18DDBE000, v6, OS_LOG_TYPE_INFO, "Starting confirmConnectionWithError.", (uint8_t *)&state, 2u);
  }

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__25;
  v22 = __Block_byref_object_dispose__25;
  v23 = 0;
  -[_DKXPCKnowledgeStore connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51___DKXPCKnowledgeStore_confirmConnectionWithError___block_invoke;
  v18[3] = &unk_1E26E6748;
  v18[4] = &state;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __51___DKXPCKnowledgeStore_confirmConnectionWithError___block_invoke_27;
  v13[3] = &unk_1E26E6C20;
  v13[4] = &v14;
  v13[5] = &state;
  objc_msgSend(v9, "confirmDatabaseConnectionWithReply:", v13);
  if (a3)
  {
    v10 = *(void **)(state.opaque[1] + 40);
    if (v10)
      *a3 = objc_retainAutorelease(v10);
  }
  v11 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&state, 8);
  return v11;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)deleteObjects:synchronous:responseQueue:withCompletion:.cold.1()
{
  __assert_rtn("-[_DKXPCKnowledgeStore deleteObjects:synchronous:responseQueue:withCompletion:]", "_DKXPCKnowledgeStore.m", 160, "queue");
}

- (void)deleteAllEventsInEventStream:synchronous:error:responseQueue:withCompletion:.cold.1()
{
  __assert_rtn("-[_DKXPCKnowledgeStore deleteAllEventsInEventStream:synchronous:error:responseQueue:withCompletion:]", "_DKXPCKnowledgeStore.m", 238, "queue");
}

- (void)deleteAllEventsMatchingPredicate:synchronous:error:responseQueue:withCompletion:.cold.1()
{
  __assert_rtn("-[_DKXPCKnowledgeStore deleteAllEventsMatchingPredicate:synchronous:error:responseQueue:withCompletion:]", "_DKXPCKnowledgeStore.m", 324, "queue");
}

- (void)executeQuery:synchronous:error:responseQueue:withCompletion:.cold.1()
{
  __assert_rtn("-[_DKXPCKnowledgeStore executeQuery:synchronous:error:responseQueue:withCompletion:]", "_DKXPCKnowledgeStore.m", 416, "queue");
}

- (void)executeQuery:(NSObject *)a1 synchronous:error:responseQueue:withCompletion:.cold.2(NSObject *a1)
{
  void *v2;
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  +[_DKQuery queryNotExecutableError](_DKQuery, "queryNotExecutableError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_18DDBE000, a1, OS_LOG_TYPE_ERROR, "Completed executeQuery with success=0. Error: %@.", v3, 0xCu);

}

@end
