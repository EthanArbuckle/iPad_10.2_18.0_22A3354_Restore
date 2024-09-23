@implementation DYTransport

- (DYTransport)init
{
  id v2;
  id v3;
  const char *v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t (*v9)(_QWORD, _QWORD);
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DYTransport;
  v2 = -[DYTransport init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDD17C8]);
    *((_QWORD *)v2 + 12) = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p>"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", object_getClassName(v2)), v2);
    v4 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("gputools.%@.%p"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", object_getClassName(v2)), v2), "UTF8String");
    v5 = dispatch_queue_attr_make_with_overcommit();
    *((_QWORD *)v2 + 2) = dispatch_queue_create(v4, v5);
    v6 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("gputools.%@.%p.%@"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", object_getClassName(v2)), v2, CFSTR("default")), "UTF8String");
    *((_QWORD *)v2 + 3) = dispatch_queue_create_with_target_V2(v6, 0, *((dispatch_queue_t *)v2 + 2));
    v7 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("gputools.%@.%p.%@"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", object_getClassName(v2)), v2, CFSTR("send")), "UTF8String");
    *((_QWORD *)v2 + 4) = dispatch_queue_create_with_target_V2(v7, 0, *((dispatch_queue_t *)v2 + 2));
    *((_QWORD *)v2 + 10) = objc_opt_new();
    v8 = objc_opt_new();
    v9 = MEMORY[0x24BDADCC0];
    *((_QWORD *)v2 + 8) = v8;
    *((_QWORD *)v2 + 9) = v9;
    *((_BYTE *)v2 + 52) = 0;
  }
  return (DYTransport *)v2;
}

- (void)dealloc
{
  NSObject *sendQueue;
  NSObject *queue;
  NSObject *rootQueue;
  objc_super v6;

  sendQueue = self->_sendQueue;
  if (sendQueue)
  {
    dispatch_release(sendQueue);
    self->_sendQueue = 0;
  }
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  rootQueue = self->_rootQueue;
  if (rootQueue)
  {
    dispatch_release(rootQueue);
    self->_rootQueue = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)DYTransport;
  -[DYTransport dealloc](&v6, sel_dealloc);
}

- (id)description
{
  return self[1].super.isa;
}

- (id)debugDescription
{
  void *v3;
  id v4;
  NSURL *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  NSError *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[DYTransport description](self, "description");
  v5 = -[DYTransport url](self, "url");
  v6 = -[DYTransport connected](self, "connected");
  v7 = -[DYTransport invalid](self, "invalid");
  v8 = -[DYTransport error](self, "error");
  v9 = atomic_load(&self->_messageCounter);
  v10 = atomic_load((unsigned int *)&self->_invalid);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: url=%@, connected=%d, invalid=%d, error=%@, messageCounter=%u, messageSendQueueDepth=%u, sources=%@"), v4, v5, v6, v7, v8, v9, v10, self->_error);
}

- (NSURL)url
{
  NSObject *queue;
  NSURL *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __18__DYTransport_url__block_invoke;
  v5[3] = &unk_250D62CD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (NSURL *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __18__DYTransport_url__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setTargetQueue:(id)a3
{
  dispatch_set_target_queue((dispatch_object_t)self->_rootQueue, (dispatch_queue_t)a3);
}

- (id)newSourceWithQueue:(id)a3
{
  NSObject *queue;
  void *v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__DYTransport_newSourceWithQueue___block_invoke;
  block[3] = &unk_250D62D00;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

_QWORD *__34__DYTransport_newSourceWithQueue___block_invoke(_QWORD *result)
{
  _QWORD *v1;

  if (!*(_BYTE *)(result[4] + 52))
  {
    v1 = result;
    result = -[DYTransportSource _initWithQueue:transport:]([DYTransportSource alloc], "_initWithQueue:transport:", v1[5], v1[4]);
    *(_QWORD *)(*(_QWORD *)(v1[6] + 8) + 40) = result;
  }
  return result;
}

- (BOOL)_activateSource:(id)a3
{
  NSObject *queue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__DYTransport__activateSource___block_invoke;
  block[3] = &unk_250D62D28;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(queue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __31__DYTransport__activateSource___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 52))
  {
    v2 = result;
    result = objc_msgSend(*(id *)(v1 + 80), "addObject:", *(_QWORD *)(result + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)_cancelSource:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29__DYTransport__cancelSource___block_invoke;
  v4[3] = &unk_250D622A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __29__DYTransport__cancelSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)connect
{
  -[DYTransport doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)connected
{
  -[DYTransport doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)_invalidate
{
  void *dispatch_send;
  _QWORD v4[5];

  -[NSError makeObjectsPerformSelector:](self->_error, "makeObjectsPerformSelector:", sel_cancel);
  dispatch_send = self->_dispatch_send;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __26__DYTransport__invalidate__block_invoke;
  v4[3] = &unk_250D62D50;
  v4[4] = self;
  objc_msgSend(dispatch_send, "enumerateKeysAndObjectsUsingBlock:", v4);
  -[NSError removeAllObjects](self->_error, "removeAllObjects");
  objc_msgSend(self->_dispatch_send, "removeAllObjects");
}

uint64_t __26__DYTransport__invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "dispatchError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
}

- (void)_handleReplyTimeout:(unsigned int)a3 count:(unsigned int)a4
{
  uint64_t v6;
  _DWORD *v7;
  _DWORD *v8;
  id v9;

  v6 = a3;
  v7 = (_DWORD *)objc_msgSend(self->_dispatch_send, "objectForIntKey:", a3);
  if (v7)
  {
    if (v7[10] <= a4)
    {
      v9 = v7;
      v8 = v7;
      objc_msgSend(self->_dispatch_send, "removeObjectForIntKey:", v6);
      objc_msgSend(v9, "dispatchError:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 5, 0));

    }
  }
}

- (void)_dispatchMessage:(id)a3
{
  NSError *error;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  _QWORD v15[7];
  unsigned int v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!LOBYTE(self->_interposerVersion))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    error = self->_error;
    v6 = -[NSError countByEnumeratingWithState:objects:count:](error, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(error);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "_dispatch:", a3);
        }
        v7 = -[NSError countByEnumeratingWithState:objects:count:](error, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }
    v10 = objc_msgSend(a3, "replySerial");
    if (v10 != -1)
    {
      v11 = v10;
      v12 = objc_msgSend(self->_dispatch_send, "objectForIntKey:", v10);
      if (v12)
      {
        v13 = *(_DWORD *)(v12 + 40) + 1;
        *(_DWORD *)(v12 + 40) = v13;
        v14 = *(NSObject **)(v12 + 8);
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __32__DYTransport__dispatchMessage___block_invoke;
        v15[3] = &unk_250D62DA0;
        v15[4] = v12;
        v15[5] = a3;
        v15[6] = self;
        v16 = v11;
        v17 = v13;
        dispatch_async(v14, v15);
      }
    }
  }
}

void __32__DYTransport__dispatchMessage___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  char v3;
  uint64_t v4;
  int64_t v5;
  dispatch_time_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[6];
  _QWORD block[5];
  int v13;

  v1 = a1[4];
  if (!*(_BYTE *)(v1 + 24))
  {
    v3 = (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 16) + 16))();
    v4 = a1[4];
    if ((v3 & 1) != 0)
    {
      v5 = *(_QWORD *)(v4 + 32);
      if (v5)
      {
        v6 = dispatch_time(0, v5);
        v7 = a1[6];
        v8 = *(NSObject **)(v7 + 24);
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = __32__DYTransport__dispatchMessage___block_invoke_3;
        v11[3] = &unk_250D62D78;
        v11[4] = v7;
        v11[5] = a1[7];
        dispatch_after(v6, v8, v11);
      }
    }
    else
    {
      *(_BYTE *)(v4 + 24) = 1;
      v9 = a1[6];
      v10 = *(NSObject **)(v9 + 24);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __32__DYTransport__dispatchMessage___block_invoke_2;
      block[3] = &unk_250D62BA8;
      block[4] = v9;
      v13 = *((_DWORD *)a1 + 14);
      dispatch_async(v10, block);
    }
  }
}

uint64_t __32__DYTransport__dispatchMessage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObjectForIntKey:", *(unsigned int *)(a1 + 40));
}

uint64_t __32__DYTransport__dispatchMessage___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleReplyTimeout:count:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

- (unsigned)_nextMessageSerial
{
  unsigned int *p_messageCounter;
  unsigned int result;

  p_messageCounter = &self->_messageCounter;
  do
    result = __ldaxr(p_messageCounter);
  while (__stlxr(result + 1, p_messageCounter));
  return result;
}

- (BOOL)_packMessage:(id)a3 error:(id *)a4
{
  -[DYTransport doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (int64_t)_sendMessage:(id)a3 error:(id *)a4
{
  -[DYTransport doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return -1;
}

- (void)invalidate
{
  -[DYTransport _scheduleInvalidation:](self, "_scheduleInvalidation:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 6, 0));
}

- (void)_scheduleInvalidation:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *rootQueue;
  _QWORD block[6];

  if (!LOBYTE(self->_interposerVersion))
  {
    if (a3)
      objc_msgSend((id)objc_msgSend(a3, "localizedDescription"), "UTF8String");
    DYLog(5, "schedule invalidation <DYTransport %p, error: %s>", (uint64_t)a3, v3, v4, v5, v6, v7, (char)self);
    LOBYTE(self->_interposerVersion) = 1;
    rootQueue = self->_rootQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__DYTransport__scheduleInvalidation___block_invoke;
    block[3] = &unk_250D622A0;
    block[4] = self;
    block[5] = a3;
    dispatch_barrier_async(rootQueue, block);
  }
}

uint64_t __37__DYTransport__scheduleInvalidation___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (!*(_QWORD *)(*(_QWORD *)(result + 32) + 88))
  {
    v1 = result;
    *(_QWORD *)(*(_QWORD *)(result + 32) + 88) = *(id *)(result + 40);
    return objc_msgSend(*(id *)(v1 + 32), "_invalidate");
  }
  return result;
}

- (BOOL)invalid
{
  return self->_interposerVersion;
}

- (BOOL)synchronous
{
  return self->_sources == (NSMutableSet *)MEMORY[0x24BDADFE8];
}

- (void)setSynchronous:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__DYTransport_setSynchronous___block_invoke;
  v4[3] = &unk_250D62880;
  v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

uint64_t __30__DYTransport_setSynchronous___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(result + 40))
    v1 = MEMORY[0x24BDADFE8];
  else
    v1 = MEMORY[0x24BDADCC0];
  *(_QWORD *)(*(_QWORD *)(result + 32) + 72) = v1;
  return result;
}

- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5 replyQueue:(id)a6 timeout:(unint64_t)a7 handler:(id)a8
{
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  DYTransportMessageReplyContinuation *v19;
  DYTransportMessageReplyContinuation *v20;
  BOOL *p_invalid;
  unsigned int v22;
  NSMutableSet *sources;
  int v24;
  dispatch_time_t v25;
  NSObject *queue;
  NSObject *v27;
  BOOL *v28;
  unsigned int v29;
  char v30;
  OS_dispatch_queue *sendQueue;
  uint64_t v32;
  DYError *v33;
  _QWORD v35[7];
  int v36;
  char v37;
  _QWORD v38[6];
  int v39;
  _QWORD block[5];
  int v41;

  if (objc_msgSend(a3, "hasBeenSent"))
  {
    if (!a5)
      goto LABEL_36;
    v32 = 34;
LABEL_35:
    v33 = +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), v32, 0);
    LOBYTE(v15) = 0;
    *a5 = v33;
    return v15;
  }
  if (a4 && (objc_msgSend(a4, "hasBeenSent") & 1) == 0)
  {
    if (a5)
    {
      v32 = 35;
      goto LABEL_35;
    }
    goto LABEL_36;
  }
  if (!-[DYTransport connected](self, "connected"))
  {
    if (!a5)
      goto LABEL_36;
    v32 = 33;
    goto LABEL_35;
  }
  if (LOBYTE(self->_interposerVersion))
  {
    if (a5)
    {
      v32 = 32;
      goto LABEL_35;
    }
LABEL_36:
    LOBYTE(v15) = 0;
    return v15;
  }
  v15 = -[DYTransport _packMessage:error:](self, "_packMessage:error:", a3, a5);
  if (v15)
  {
    v16 = -[DYTransport _nextMessageSerial](self, "_nextMessageSerial");
    if (a4)
      v17 = objc_msgSend(a4, "serial");
    else
      v17 = 0xFFFFFFFFLL;
    objc_msgSend(a3, "_setSerial:replySerial:transport:", v16, v17, self);
    v18 = MEMORY[0x24BDAC760];
    if (a8)
    {
      v19 = -[DYContinuation initWithQueue:block:]([DYTransportMessageReplyContinuation alloc], "initWithQueue:block:", a6, a8);
      v20 = v19;
      p_invalid = &self->_invalid;
      do
        v22 = __ldaxr((unsigned int *)p_invalid);
      while (__stlxr(v22 + 1, (unsigned int *)p_invalid));
      sources = self->_sources;
      v24 = BYTE1(self->_interposerVersion);
      if (v19)
      {
        if (a7)
        {
          v19->timeout = a7;
          v25 = dispatch_time(0, a7);
          queue = self->_queue;
          block[0] = v18;
          block[1] = 3221225472;
          block[2] = __63__DYTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke;
          block[3] = &unk_250D62BA8;
          block[4] = self;
          v41 = v16;
          dispatch_after(v25, queue, block);
        }
        v27 = self->_queue;
        v38[0] = v18;
        v38[1] = 3221225472;
        v38[2] = __63__DYTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_2;
        v38[3] = &unk_250D622C8;
        v38[4] = self;
        v38[5] = v20;
        v39 = v16;
        dispatch_sync(v27, v38);
        if (!v24)
          goto LABEL_24;
      }
      else if (!BYTE1(self->_interposerVersion))
      {
LABEL_24:
        v30 = 0;
        goto LABEL_25;
      }
    }
    else
    {
      v28 = &self->_invalid;
      do
        v29 = __ldaxr((unsigned int *)v28);
      while (__stlxr(v29 + 1, (unsigned int *)v28));
      v20 = 0;
      sources = self->_sources;
      v30 = BYTE1(self->_interposerVersion);
      if (!v30)
        goto LABEL_25;
    }
    dispatch_suspend((dispatch_object_t)self->_queue);
    v30 = 1;
LABEL_25:
    sendQueue = self->_sendQueue;
    v35[0] = v18;
    v35[1] = 3221225472;
    v35[2] = __63__DYTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_3;
    v35[3] = &unk_250D62DF0;
    v37 = v30;
    v35[4] = self;
    v35[5] = v20;
    v35[6] = a3;
    v36 = v16;
    ((void (*)(OS_dispatch_queue *, _QWORD *))sources)(sendQueue, v35);

    LOBYTE(v15) = 1;
  }
  return v15;
}

uint64_t __63__DYTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleReplyTimeout:count:", *(unsigned int *)(a1 + 40), 0);
}

uint64_t __63__DYTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forIntKey:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

void __63__DYTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_3(uint64_t a1)
{
  void *v2;
  id *v3;
  uint64_t v4;
  id v5;
  unsigned int *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  unsigned int *v12;
  unsigned int v13;
  _QWORD block[7];
  int v15;
  id v16;

  if (*(_BYTE *)(a1 + 60))
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 52))
  {
    v11 = (void *)MEMORY[0x2426231FC]();
    objc_msgSend(*(id *)(a1 + 40), "dispatchError:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 32, 0));
    objc_autoreleasePoolPop(v11);
    v12 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 48);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    objc_msgSend(*(id *)(a1 + 48), "setEncodedAttributes:", 0);
  }
  else
  {
    v16 = 0;
    v2 = (void *)MEMORY[0x2426231FC]();
    if (*(_QWORD *)(a1 + 40))
      v3 = &v16;
    else
      v3 = 0;
    v4 = objc_msgSend(*(id *)(a1 + 32), "_sendMessage:error:", *(_QWORD *)(a1 + 48), v3);
    v5 = v16;
    objc_autoreleasePoolPop(v2);
    v6 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 48);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (v4 == -1)
    {
      v8 = *(_QWORD *)(a1 + 40);
      if (v8)
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(NSObject **)(v9 + 24);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __63__DYTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_4;
        block[3] = &unk_250D62DC8;
        v15 = *(_DWORD *)(a1 + 56);
        block[4] = v9;
        block[5] = v8;
        block[6] = v16;
        dispatch_async(v10, block);
      }
    }

  }
}

uint64_t __63__DYTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObjectForIntKey:", *(unsigned int *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 40), "dispatchError:", *(_QWORD *)(a1 + 48));
}

- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5
{
  return -[DYTransport send:inReplyTo:error:replyQueue:timeout:handler:](self, "send:inReplyTo:error:replyQueue:timeout:handler:", a3, a4, a5, 0, 0, 0);
}

- (BOOL)send:(id)a3 error:(id *)a4 replyQueue:(id)a5 timeout:(unint64_t)a6 handler:(id)a7
{
  return -[DYTransport send:inReplyTo:error:replyQueue:timeout:handler:](self, "send:inReplyTo:error:replyQueue:timeout:handler:", a3, 0, a4, a5, a6, a7);
}

- (BOOL)send:(id)a3 error:(id *)a4
{
  return -[DYTransport send:inReplyTo:error:replyQueue:timeout:handler:](self, "send:inReplyTo:error:replyQueue:timeout:handler:", a3, 0, a4, 0, 0, 0);
}

- (BOOL)sendNewMessage:(int)a3 error:(id *)a4 replyQueue:(id)a5 timeout:(unint64_t)a6 handler:(id)a7
{
  DYTransportMessage *v12;

  v12 = -[DYTransportMessage initWithKind:attributes:payload:]([DYTransportMessage alloc], "initWithKind:attributes:payload:", *(_QWORD *)&a3, 0, 0);
  LOBYTE(a7) = -[DYTransport send:inReplyTo:error:replyQueue:timeout:handler:](self, "send:inReplyTo:error:replyQueue:timeout:handler:", v12, 0, a4, a5, a6, a7);

  return (char)a7;
}

- (BOOL)sendNewMessage:(int)a3 error:(id *)a4
{
  return -[DYTransport sendNewMessage:error:replyQueue:timeout:handler:](self, "sendNewMessage:error:replyQueue:timeout:handler:", *(_QWORD *)&a3, a4, 0, 0, 0);
}

- (BOOL)relayMessage:(id)a3 error:(id *)a4
{
  _BOOL4 v7;
  NSMutableSet *sources;
  char v9;
  OS_dispatch_queue *sendQueue;
  uint64_t v11;
  DYError *v12;
  _QWORD v14[6];
  char v15;

  if ((DYTransport *)objc_msgSend(a3, "transport") == self)
  {
    if (!a4)
      goto LABEL_16;
    v11 = 40;
LABEL_15:
    v12 = +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), v11, 0);
    LOBYTE(v7) = 0;
    *a4 = v12;
    return v7;
  }
  if (!-[DYTransport connected](self, "connected"))
  {
    if (!a4)
      goto LABEL_16;
    v11 = 33;
    goto LABEL_15;
  }
  if (LOBYTE(self->_interposerVersion))
  {
    if (a4)
    {
      v11 = 32;
      goto LABEL_15;
    }
LABEL_16:
    LOBYTE(v7) = 0;
    return v7;
  }
  v7 = -[DYTransport _packMessage:error:](self, "_packMessage:error:", a3, a4);
  if (v7)
  {
    sources = self->_sources;
    v9 = BYTE1(self->_interposerVersion);
    if (v9)
      dispatch_suspend((dispatch_object_t)self->_queue);
    sendQueue = self->_sendQueue;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __34__DYTransport_relayMessage_error___block_invoke;
    v14[3] = &unk_250D62E18;
    v15 = v9;
    v14[4] = self;
    v14[5] = a3;
    ((void (*)(OS_dispatch_queue *, _QWORD *))sources)(sendQueue, v14);
    LOBYTE(v7) = 1;
  }
  return v7;
}

void __34__DYTransport_relayMessage_error___block_invoke(uint64_t a1)
{
  void *v2;

  if (*(_BYTE *)(a1 + 48))
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 52))
  {
    v2 = (void *)MEMORY[0x2426231FC]();
    objc_msgSend(*(id *)(a1 + 32), "_sendMessage:error:", *(_QWORD *)(a1 + 40), 0);
    objc_autoreleasePoolPop(v2);
  }
}

- (void)drainQueue
{
  dispatch_barrier_sync_f((dispatch_queue_t)self->_rootQueue, 0, (dispatch_function_t)do_nothing);
}

- (NSError)error
{
  return (NSError *)self->_identifier;
}

- (BOOL)prioritizeOutgoingMessages
{
  return BYTE1(self->_interposerVersion);
}

- (void)setPrioritizeOutgoingMessages:(BOOL)a3
{
  BYTE1(self->_interposerVersion) = a3;
}

- (NSString)identifier
{
  return (NSString *)self[1].super.isa;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unsigned)interposerVersion
{
  return self->_replyHandlersMap;
}

- (void)setInterposerVersion:(unsigned int)a3
{
  LODWORD(self->_replyHandlersMap) = a3;
}

@end
