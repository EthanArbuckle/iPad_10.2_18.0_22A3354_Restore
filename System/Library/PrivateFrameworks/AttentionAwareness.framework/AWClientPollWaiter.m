@implementation AWClientPollWaiter

- (AWClientPollWaiter)initWithClient:(id)a3 timeout:(unint64_t)a4 queue:(id)a5 block:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  AWClientPollWaiter *v13;
  AWClientPollWaiter *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  dispatch_queue_t v17;
  OS_dispatch_queue *clientQueue;
  uint64_t v19;
  id clientBlock;
  dispatch_source_t v21;
  OS_dispatch_source *timer;
  NSObject *v23;
  NSObject *v24;
  dispatch_time_t v25;
  _QWORD v27[4];
  AWClientPollWaiter *v28;
  id v29;
  objc_super v30;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v30.receiver = self;
  v30.super_class = (Class)AWClientPollWaiter;
  v13 = -[AWClientPollWaiter init](&v30, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_client, v10);
    v15 = dispatch_queue_create("com.apple.AttentionAwareness.pollWaiterQueue", 0);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_create("com.apple.AttentionAwareness.clientPollQueue", 0);
    clientQueue = v14->_clientQueue;
    v14->_clientQueue = (OS_dispatch_queue *)v17;

    dispatch_set_target_queue((dispatch_object_t)v14->_clientQueue, v11);
    v19 = objc_msgSend(v12, "copy");
    clientBlock = v14->_clientBlock;
    v14->_clientBlock = (id)v19;

    v21 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v14->_queue);
    timer = v14->_timer;
    v14->_timer = (OS_dispatch_source *)v21;

    v23 = v14->_timer;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __57__AWClientPollWaiter_initWithClient_timeout_queue_block___block_invoke;
    v27[3] = &unk_1E5F8EC40;
    v28 = v14;
    v29 = v10;
    dispatch_source_set_event_handler(v23, v27);
    v24 = v14->_timer;
    v25 = dispatch_time(0, a4);
    dispatch_source_set_timer(v24, v25, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    dispatch_resume((dispatch_object_t)v14->_timer);

  }
  return v14;
}

- (void)invokeClientBlock:(unint64_t)a3 event:(id)a4
{
  id v6;
  NSObject *clientQueue;
  id v8;
  id WeakRetained;
  _QWORD block[5];
  id v11;
  unint64_t v12;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AWClientPollWaiter_invokeClientBlock_event___block_invoke;
  block[3] = &unk_1E5F8EB60;
  v11 = v6;
  v12 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(clientQueue, block);
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  +[AWSampleLogger client:pollEventType:event:](AWSampleLogger, "client:pollEventType:event:", WeakRetained, a3, v8);

}

- (void)notifyPollEventType:(unint64_t)a3 event:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AWClientPollWaiter_notifyPollEventType_event___block_invoke;
  block[3] = &unk_1E5F8EB60;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)cancel
{
  -[AWClientPollWaiter notifyPollEventType:event:](self, "notifyPollEventType:event:", 4, 0);
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__AWClientPollWaiter_invalidate__block_invoke;
  block[3] = &unk_1E5F8EC18;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_clientBlock, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_client);
}

void __32__AWClientPollWaiter_invalidate__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48) = 3;
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 40));
}

void __48__AWClientPollWaiter_notifyPollEventType_event___block_invoke(_QWORD *a1)
{
  _DWORD *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (_DWORD *)a1[4];
  v3 = v2[12];
  if (v3 == 2)
  {
    v6 = 4;
    v7 = 0;
  }
  else
  {
    if (v3 != 1)
    {
      if (v3)
        goto LABEL_12;
      objc_msgSend(v2, "invokeClientBlock:event:", a1[6], a1[5]);
      v4 = a1[6];
      v5 = a1[4];
      if (v4 == 1)
        goto LABEL_11;
      goto LABEL_10;
    }
    v6 = a1[6];
    if (v6 == 1)
      goto LABEL_12;
    v7 = a1[5];
  }
  objc_msgSend(v2, "invokeClientBlock:event:", v6, v7);
  v5 = a1[4];
LABEL_10:
  LODWORD(v4) = 3;
LABEL_11:
  *(_DWORD *)(v5 + 48) = v4;
LABEL_12:
  v8 = a1[4];
  if (*(_DWORD *)(v8 + 48) == 3)
    dispatch_source_cancel(*(dispatch_source_t *)(v8 + 40));
}

uint64_t __46__AWClientPollWaiter_invokeClientBlock_event___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1[4] + 32) + 16))(*(_QWORD *)(a1[4] + 32), a1[6], a1[5]);
}

uint64_t __57__AWClientPollWaiter_initWithClient_timeout_queue_block___block_invoke(uint64_t result)
{
  if (*(_DWORD *)(*(_QWORD *)(result + 32) + 48) != 3)
    return objc_msgSend(*(id *)(result + 40), "notifyPollEventType:event:", 3, 0);
  return result;
}

@end
