@implementation IMDXPCEventStreamHandler

- (IMDXPCEventStreamHandler)init
{
  -[IMDXPCEventStreamHandler doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (IMDXPCEventStreamHandler)initWithEventStreamName:(const char *)a3
{
  IMDXPCEventStreamHandler *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  uint64_t v16;
  NSMapTable *delegateToQueue;
  _QWORD handler[4];
  IMDXPCEventStreamHandler *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)IMDXPCEventStreamHandler;
  v4 = -[IMDXPCEventStreamHandler init](&v21, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_queue);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_retainAutorelease(v12);
    v14 = dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v14;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v16 = objc_claimAutoreleasedReturnValue();
    delegateToQueue = v4->_delegateToQueue;
    v4->_delegateToQueue = (NSMapTable *)v16;

    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_1D15DCEE4;
    handler[3] = &unk_1E9229718;
    v20 = v4;
    xpc_set_event_stream_handler(a3, MEMORY[0x1E0C80D38], handler);

  }
  return v4;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[IMDXPCEventStreamHandler queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15DD130;
  block[3] = &unk_1E9229280;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[IMDXPCEventStreamHandler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15DD218;
  block[3] = &unk_1E9228750;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (id)queueForDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1D15DD360;
  v16 = sub_1D15DD370;
  v17 = 0;
  -[IMDXPCEventStreamHandler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15DD378;
  block[3] = &unk_1E9228778;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)didReceiveEventWithName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[IMDXPCEventStreamHandler queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15DD48C;
  block[3] = &unk_1E9229280;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
