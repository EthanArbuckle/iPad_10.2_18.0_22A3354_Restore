@implementation GTReplayADSReplyStream

- (GTReplayADSReplyStream)initWithCallback:(id)a3 bulkDataProxy:(id)a4 andToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  GTReplayADSReplyStream *v11;
  os_log_t v12;
  OS_os_log *log;
  uint64_t v14;
  id callback;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)GTReplayADSReplyStream;
  v11 = -[GTReplayADSReplyStream init](&v17, sel_init);
  if (v11)
  {
    v12 = os_log_create("com.apple.gputools.transport", "GTReplayADSReplyStream");
    log = v11->_log;
    v11->_log = (OS_os_log *)v12;

    objc_storeStrong((id *)&v11->_token, a5);
    v14 = MEMORY[0x22E30CB48](v8);
    callback = v11->_callback;
    v11->_callback = (id)v14;

    objc_storeStrong((id *)&v11->_bulkDataProxy, a4);
  }

  return v11;
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
  id v5;
  uint64_t uint64;
  uint64_t v7;
  GTBulkDataServiceXPCProxy *bulkDataProxy;
  uint64_t v9;
  void (**callback)(id, GTReplayResponseStream *);
  GTReplayResponseStream *v11;
  _QWORD v12[5];
  id v13;

  v5 = a3;
  uint64 = xpc_dictionary_get_uint64(v5, "bulkDataHandle");
  if (uint64)
  {
    v7 = uint64;
    bulkDataProxy = self->_bulkDataProxy;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __58__GTReplayADSReplyStream_dispatchMessage_replyConnection___block_invoke;
    v12[3] = &unk_24F827F30;
    v12[4] = self;
    v13 = v5;
    -[GTBulkDataServiceXPCProxy downloadData:completionHandler:](bulkDataProxy, "downloadData:completionHandler:", v7, v12);

  }
  else
  {
    v9 = xpc_dictionary_get_uint64(v5, "streamState");
    callback = (void (**)(id, GTReplayResponseStream *))self->_callback;
    v11 = -[GTReplayResponseStream initWithState:]([GTReplayResponseStream alloc], "initWithState:", v9);
    callback[2](callback, v11);

    if ((_DWORD)v9 == 2)
      -[GTReplayRequestToken completed](self->_token, "completed");
  }

}

void __58__GTReplayADSReplyStream_dispatchMessage_replyConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setData:", 0);
    objc_msgSend(v7, "setError:", v6);
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();

  }
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "bulkDataHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[GTUnarchiver replayResponseStreamClassSet](GTUnarchiver, "replayResponseStreamClassSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    v14 = 0;
    GTUnarchivedObjectOfClassesExpectingClass((uint64_t)v9, v10, (uint64_t)v5, &v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;

    if (v11)
    {
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
    }
    else
    {
      v13 = (void *)objc_opt_new();
      objc_msgSend(v13, "setData:", 0);
      objc_msgSend(v13, "setError:", v6);
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();

    }
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
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_bulkDataProxy, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
