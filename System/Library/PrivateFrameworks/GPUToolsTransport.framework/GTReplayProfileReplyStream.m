@implementation GTReplayProfileReplyStream

- (GTReplayProfileReplyStream)initWithCallback:(id)a3 bulkDataProxy:(id)a4 andToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  GTReplayProfileReplyStream *v11;
  os_log_t v12;
  OS_os_log *log;
  uint64_t v14;
  id callback;
  dispatch_queue_t v16;
  OS_dispatch_queue *serialQueue;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)GTReplayProfileReplyStream;
  v11 = -[GTReplayProfileReplyStream init](&v19, sel_init);
  if (v11)
  {
    v12 = os_log_create("com.apple.gputools.transport", "GTReplayProfileReplyStream");
    log = v11->_log;
    v11->_log = (OS_os_log *)v12;

    objc_storeStrong((id *)&v11->_token, a5);
    v14 = MEMORY[0x22E30CB48](v8);
    callback = v11->_callback;
    v11->_callback = (id)v14;

    objc_storeStrong((id *)&v11->_bulkDataProxy, a4);
    v16 = dispatch_queue_create("com.apple.gputools.profile", 0);
    serialQueue = v11->_serialQueue;
    v11->_serialQueue = (OS_dispatch_queue *)v16;

  }
  return v11;
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  GTReplayProfileReplyStream *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__GTReplayProfileReplyStream_dispatchMessage_replyConnection___block_invoke;
  block[3] = &unk_24F827F08;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serialQueue, block);

}

void __62__GTReplayProfileReplyStream_dispatchMessage_replyConnection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t uint64;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;

  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "bulkDataHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "bulkDataHandle");
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    v16 = 0;
    objc_msgSend(v4, "downloadData:error:", uint64, &v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v16;
    if (v5)
    {
      v7 = (void *)MEMORY[0x24BDBCF20];
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v6;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v10, v5, &v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15;

      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 16))();
      v6 = v12;
    }
    else
    {
      v14 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __62__GTReplayProfileReplyStream_dispatchMessage_replyConnection___block_invoke_cold_2((uint64_t)v6, uint64, v14);
      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "setError:", v6);
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 16))();
    }

  }
  else
  {
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __62__GTReplayProfileReplyStream_dispatchMessage_replyConnection___block_invoke_cold_1(v13);
    objc_msgSend(*(id *)(a1 + 48), "deregisterDispatcher:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
    v6 = (id)objc_opt_new();
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 16))();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "completed");
  }

}

- (unint64_t)dispatcherId
{
  return self->dispatcherId;
}

- (void)setDispatcherId:(unint64_t)a3
{
  self->dispatcherId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_bulkDataProxy, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

void __62__GTReplayProfileReplyStream_dispatchMessage_replyConnection___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22D095000, log, OS_LOG_TYPE_DEBUG, "Download Data Complete", v1, 2u);
}

void __62__GTReplayProfileReplyStream_dispatchMessage_replyConnection___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl(&dword_22D095000, log, OS_LOG_TYPE_ERROR, "Failed to download data handle:%llu error:%@", (uint8_t *)&v3, 0x16u);
}

@end
