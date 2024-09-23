@implementation GTTransport_replayer

- (GTTransport_replayer)init
{
  id v2;
  const char *v3;
  NSObject *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GTTransport_replayer;
  v2 = -[GTTransport_replayer init](&v10, "init");
  if (v2)
  {
    *((_QWORD *)v2 + 11) = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("<%@ %p>"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", object_getClassName(v2)), v2);
    v3 = -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("gputools.%@.%p"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", object_getClassName(v2)), v2), "UTF8String");
    v4 = dispatch_queue_attr_make_with_overcommit(&_dispatch_queue_attr_concurrent, 1);
    *((_QWORD *)v2 + 2) = dispatch_queue_create(v3, v4);
    v5 = -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("gputools.%@.%p.%@"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", object_getClassName(v2)), v2, CFSTR("default")), "UTF8String");
    *((_QWORD *)v2 + 3) = dispatch_queue_create_with_target_V2(v5, 0, *((dispatch_queue_t *)v2 + 2));
    v6 = -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("gputools.%@.%p.%@"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", object_getClassName(v2)), v2, CFSTR("send")), "UTF8String");
    *((_QWORD *)v2 + 4) = dispatch_queue_create_with_target_V2(v6, 0, *((dispatch_queue_t *)v2 + 2));
    *((_QWORD *)v2 + 8) = objc_opt_new(NSMutableSet, v7);
    *((_QWORD *)v2 + 9) = objc_opt_new(GTIntKeyedDictionary_replayer, v8);
    *((_QWORD *)v2 + 12) = &_dispatch_async;
    *((_BYTE *)v2 + 52) = 0;
  }
  return (GTTransport_replayer *)v2;
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
  v6.super_class = (Class)GTTransport_replayer;
  -[GTTransport_replayer dealloc](&v6, "dealloc");
}

- (id)description
{
  return self->_dispatch_send;
}

- (id)debugDescription
{
  id v3;
  NSURL *v4;
  unsigned int v5;
  unsigned int v6;
  NSError *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[GTTransport_replayer description](self, "description");
  v4 = -[GTTransport_replayer url](self, "url");
  v5 = -[GTTransport_replayer connected](self, "connected");
  v6 = -[GTTransport_replayer invalid](self, "invalid");
  v7 = -[GTTransport_replayer error](self, "error");
  v8 = atomic_load(&self->_messageCounter.__a_.__a_value);
  v9 = atomic_load((unsigned int *)&self->_invalid);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: url=%@, connected=%d, invalid=%d, error=%@, messageCounter=%u, messageSendQueueDepth=%u, sources=%@"), v3, v4, v5, v6, v7, v8, v9, self->_replyHandlersMap);
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
  v9 = __Block_byref_object_copy__1286;
  v10 = __Block_byref_object_dispose__1287;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __18__GTTransport_url__block_invoke;
  v5[3] = &unk_725FE8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (NSURL *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
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
  v10 = __Block_byref_object_copy__1286;
  v11 = __Block_byref_object_dispose__1287;
  v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __34__GTTransport_newSourceWithQueue___block_invoke;
  block[3] = &unk_7267A0;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
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
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __31__GTTransport__activateSource___block_invoke;
  block[3] = &unk_7267A0;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(queue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_cancelSource:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __29__GTTransport__cancelSource___block_invoke;
  v4[3] = &unk_725190;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (id)connect
{
  -[GTTransport_replayer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)connected
{
  -[GTTransport_replayer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)_invalidate
{
  NSError *error;
  _QWORD v4[5];

  -[GTIntKeyedDictionary_replayer makeObjectsPerformSelector:](self->_replyHandlersMap, "makeObjectsPerformSelector:", "cancel");
  error = self->_error;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __26__GTTransport__invalidate__block_invoke;
  v4[3] = &unk_7250F8;
  v4[4] = self;
  -[NSError enumerateKeysAndObjectsUsingBlock:](error, "enumerateKeysAndObjectsUsingBlock:", v4);
  -[GTIntKeyedDictionary_replayer removeAllObjects](self->_replyHandlersMap, "removeAllObjects");
  -[NSError removeAllObjects](self->_error, "removeAllObjects");
}

- (void)_handleReplyTimeout:(unsigned int)a3 count:(unsigned int)a4
{
  uint64_t v6;
  _DWORD *v7;
  _DWORD *v8;
  id v9;

  v6 = a3;
  v7 = -[NSError objectForIntKey:](self->_error, "objectForIntKey:", a3);
  if (v7)
  {
    if (v7[10] <= a4)
    {
      v9 = v7;
      v8 = v7;
      -[NSError removeObjectForIntKey:](self->_error, "removeObjectForIntKey:", v6);
      objc_msgSend(v9, "dispatchError:", +[GTError_replayer errorWithDomain:code:userInfo:](GTError_replayer, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 5, 0));

    }
  }
}

- (void)_dispatchMessage:(id)a3
{
  GTIntKeyedDictionary_replayer *replyHandlersMap;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  unsigned int v10;
  unsigned int v11;
  id v12;
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

  if (!LOBYTE(self->_interposerVersion))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    replyHandlersMap = self->_replyHandlersMap;
    v6 = -[GTIntKeyedDictionary_replayer countByEnumeratingWithState:objects:count:](replyHandlersMap, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(replyHandlersMap);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "_dispatch:", a3);
        }
        v7 = -[GTIntKeyedDictionary_replayer countByEnumeratingWithState:objects:count:](replyHandlersMap, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }
    v10 = objc_msgSend(a3, "replySerial");
    if (v10 != -1)
    {
      v11 = v10;
      v12 = -[NSError objectForIntKey:](self->_error, "objectForIntKey:", v10);
      if (v12)
      {
        v13 = *((_DWORD *)v12 + 10) + 1;
        *((_DWORD *)v12 + 10) = v13;
        v14 = *((_QWORD *)v12 + 1);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = __32__GTTransport__dispatchMessage___block_invoke;
        v15[3] = &unk_726940;
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

- (unsigned)_nextMessageSerial
{
  atomic<unsigned int> *p_messageCounter;
  unsigned int v3;
  unsigned int result;

  p_messageCounter = &self->_messageCounter;
  do
  {
    v3 = __ldaxr(&p_messageCounter->__a_.__a_value);
    result = v3 + 1;
  }
  while (__stlxr(v3 + 1, &p_messageCounter->__a_.__a_value));
  return result;
}

- (BOOL)_packMessage:(id)a3 error:(id *)a4
{
  -[GTTransport_replayer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (int64_t)_sendMessage:(id)a3 error:(id *)a4
{
  -[GTTransport_replayer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return -1;
}

- (void)invalidate
{
  -[GTTransport_replayer _scheduleInvalidation:](self, "_scheduleInvalidation:", +[GTError_replayer errorWithDomain:code:userInfo:](GTError_replayer, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 6, 0));
}

- (void)_scheduleInvalidation:(id)a3
{
  NSObject *rootQueue;
  _QWORD v4[6];

  if (!LOBYTE(self->_interposerVersion))
  {
    LOBYTE(self->_interposerVersion) = 1;
    rootQueue = self->_rootQueue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = __37__GTTransport__scheduleInvalidation___block_invoke;
    v4[3] = &unk_725190;
    v4[4] = self;
    v4[5] = a3;
    dispatch_barrier_async(rootQueue, v4);
  }
}

- (BOOL)invalid
{
  return self->_interposerVersion;
}

- (BOOL)synchronous
{
  return self[1].super.isa == (Class)&_dispatch_sync;
}

- (void)setSynchronous:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __30__GTTransport_setSynchronous___block_invoke;
  v4[3] = &unk_725208;
  v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5 replyQueue:(id)a6 timeout:(unint64_t)a7 handler:(id)a8
{
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  GTTransportMessageReplyContinuation_replayer *v18;
  GTTransportMessageReplyContinuation_replayer *v19;
  BOOL *p_invalid;
  unsigned int v21;
  Class isa;
  int v23;
  dispatch_time_t v24;
  NSObject *queue;
  NSObject *v26;
  BOOL *v27;
  unsigned int v28;
  char v29;
  OS_dispatch_queue *sendQueue;
  uint64_t v31;
  id v32;
  _QWORD v34[7];
  int v35;
  char v36;
  _QWORD v37[6];
  int v38;
  _QWORD block[5];
  int v40;

  if (objc_msgSend(a3, "hasBeenSent"))
  {
    if (!a5)
      goto LABEL_36;
    v31 = 34;
LABEL_35:
    v32 = +[GTError_replayer errorWithDomain:code:userInfo:](GTError_replayer, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), v31, 0);
    LOBYTE(v15) = 0;
    *a5 = v32;
    return v15;
  }
  if (a4 && (objc_msgSend(a4, "hasBeenSent") & 1) == 0)
  {
    if (a5)
    {
      v31 = 35;
      goto LABEL_35;
    }
    goto LABEL_36;
  }
  if (!-[GTTransport_replayer connected](self, "connected"))
  {
    if (!a5)
      goto LABEL_36;
    v31 = 33;
    goto LABEL_35;
  }
  if (LOBYTE(self->_interposerVersion))
  {
    if (a5)
    {
      v31 = 32;
      goto LABEL_35;
    }
LABEL_36:
    LOBYTE(v15) = 0;
    return v15;
  }
  v15 = -[GTTransport_replayer _packMessage:error:](self, "_packMessage:error:", a3, a5);
  if (v15)
  {
    v16 = -[GTTransport_replayer _nextMessageSerial](self, "_nextMessageSerial");
    if (a4)
      v17 = (uint64_t)objc_msgSend(a4, "serial");
    else
      v17 = 0xFFFFFFFFLL;
    objc_msgSend(a3, "_setSerial:replySerial:transport:", v16, v17, self);
    if (a8)
    {
      v18 = -[GTContinuation_replayer initWithQueue:block:]([GTTransportMessageReplyContinuation_replayer alloc], "initWithQueue:block:", a6, a8);
      v19 = v18;
      p_invalid = &self->_invalid;
      do
        v21 = __ldaxr((unsigned int *)p_invalid);
      while (__stlxr(v21 + 1, (unsigned int *)p_invalid));
      isa = self[1].super.isa;
      v23 = BYTE1(self->_interposerVersion);
      if (v18)
      {
        if (a7)
        {
          v18->timeout = a7;
          v24 = dispatch_time(0, a7);
          queue = self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke;
          block[3] = &unk_7251E0;
          block[4] = self;
          v40 = v16;
          dispatch_after(v24, queue, block);
        }
        v26 = self->_queue;
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_2;
        v37[3] = &unk_725230;
        v37[4] = self;
        v37[5] = v19;
        v38 = v16;
        dispatch_sync(v26, v37);
        if (!v23)
          goto LABEL_24;
      }
      else if (!BYTE1(self->_interposerVersion))
      {
LABEL_24:
        v29 = 0;
        goto LABEL_25;
      }
    }
    else
    {
      v27 = &self->_invalid;
      do
        v28 = __ldaxr((unsigned int *)v27);
      while (__stlxr(v28 + 1, (unsigned int *)v27));
      v19 = 0;
      isa = self[1].super.isa;
      v29 = BYTE1(self->_interposerVersion);
      if (!v29)
        goto LABEL_25;
    }
    dispatch_suspend((dispatch_object_t)self->_queue);
    v29 = 1;
LABEL_25:
    sendQueue = self->_sendQueue;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_3;
    v34[3] = &unk_725280;
    v36 = v29;
    v34[4] = self;
    v34[5] = v19;
    v34[6] = a3;
    v35 = v16;
    ((void (*)(OS_dispatch_queue *, _QWORD *))isa)(sendQueue, v34);

    LOBYTE(v15) = 1;
  }
  return v15;
}

- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5
{
  return -[GTTransport_replayer send:inReplyTo:error:replyQueue:timeout:handler:](self, "send:inReplyTo:error:replyQueue:timeout:handler:", a3, a4, a5, 0, 0, 0);
}

- (BOOL)send:(id)a3 error:(id *)a4 replyQueue:(id)a5 timeout:(unint64_t)a6 handler:(id)a7
{
  return -[GTTransport_replayer send:inReplyTo:error:replyQueue:timeout:handler:](self, "send:inReplyTo:error:replyQueue:timeout:handler:", a3, 0, a4, a5, a6, a7);
}

- (BOOL)send:(id)a3 error:(id *)a4
{
  return -[GTTransport_replayer send:inReplyTo:error:replyQueue:timeout:handler:](self, "send:inReplyTo:error:replyQueue:timeout:handler:", a3, 0, a4, 0, 0, 0);
}

- (BOOL)sendNewMessage:(int)a3 error:(id *)a4 replyQueue:(id)a5 timeout:(unint64_t)a6 handler:(id)a7
{
  GTTransportMessage_replayer *v12;

  v12 = -[GTTransportMessage_replayer initWithKind:attributes:payload:]([GTTransportMessage_replayer alloc], "initWithKind:attributes:payload:", *(_QWORD *)&a3, 0, 0);
  LOBYTE(a7) = -[GTTransport_replayer send:inReplyTo:error:replyQueue:timeout:handler:](self, "send:inReplyTo:error:replyQueue:timeout:handler:", v12, 0, a4, a5, a6, a7);

  return (char)a7;
}

- (BOOL)sendNewMessage:(int)a3 error:(id *)a4
{
  return -[GTTransport_replayer sendNewMessage:error:replyQueue:timeout:handler:](self, "sendNewMessage:error:replyQueue:timeout:handler:", *(_QWORD *)&a3, a4, 0, 0, 0);
}

- (BOOL)relayMessage:(id)a3 error:(id *)a4
{
  _BOOL4 v7;
  Class isa;
  char v9;
  OS_dispatch_queue *sendQueue;
  uint64_t v11;
  id v12;
  _QWORD v14[6];
  char v15;

  if (objc_msgSend(a3, "transport") == self)
  {
    if (!a4)
      goto LABEL_16;
    v11 = 40;
LABEL_15:
    v12 = +[GTError_replayer errorWithDomain:code:userInfo:](GTError_replayer, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), v11, 0);
    LOBYTE(v7) = 0;
    *a4 = v12;
    return v7;
  }
  if (!-[GTTransport_replayer connected](self, "connected"))
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
  v7 = -[GTTransport_replayer _packMessage:error:](self, "_packMessage:error:", a3, a4);
  if (v7)
  {
    isa = self[1].super.isa;
    v9 = BYTE1(self->_interposerVersion);
    if (v9)
      dispatch_suspend((dispatch_object_t)self->_queue);
    sendQueue = self->_sendQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __34__GTTransport_relayMessage_error___block_invoke;
    v14[3] = &unk_7252A8;
    v15 = v9;
    v14[4] = self;
    v14[5] = a3;
    ((void (*)(OS_dispatch_queue *, _QWORD *))isa)(sendQueue, v14);
    LOBYTE(v7) = 1;
  }
  return v7;
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
  return (NSString *)self->_dispatch_send;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (unsigned)interposerVersion
{
  return self->_sources;
}

- (void)setInterposerVersion:(unsigned int)a3
{
  LODWORD(self->_sources) = a3;
}

@end
