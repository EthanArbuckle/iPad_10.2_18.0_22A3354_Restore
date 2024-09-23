@implementation GTBaseSocketTransport_replayer

- (GTBaseSocketTransport_replayer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTBaseSocketTransport_replayer;
  return -[GTBaseStreamTransport_replayer init](&v3, "init");
}

- (int64_t)_read:(void *)a3 size:(unint64_t)a4
{
  int handle;

  handle = dispatch_source_get_handle((dispatch_source_t)self->_readSource);
  return recv(handle, a3, a4, 0);
}

- (void)_waitEAGAIN
{
  pollfd v2;

  v2 = (pollfd)0x400000000;
  v2.fd = dispatch_source_get_handle((dispatch_source_t)self->_readSource);
  poll(&v2, 1u, 1);
}

- (int64_t)_write:(const void *)a3 size:(unint64_t)a4
{
  int handle;

  handle = dispatch_source_get_handle((dispatch_source_t)self->_readSource);
  return send(handle, a3, a4, 0);
}

- (void)closeSocketDescriptor
{
  int handle;

  handle = dispatch_source_get_handle((dispatch_source_t)self->_readSource);
  close(handle);
}

- (void)_readAndAccumulateLoop
{
  void *v3;

  self->_scheduledReadOnWritableSocket = 0;
  v3 = objc_autoreleasePoolPush();
  while (-[GTBaseStreamTransport_replayer _readAndAccumulate](self, "_readAndAccumulate") > 0)
    ;
  objc_autoreleasePoolPop(v3);
}

- (void)runWithSocket:(int)a3
{
  int v5;
  OS_dispatch_source *v6;
  NSObject *readSource;
  NSObject *writeSource;
  NSObject *v9;
  NSObject *v10;
  GTSharedMemoryTransport_replayer *smTransport;
  id v12;
  const char *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD handler[5];

  if (self->_readSource)
  {
    v13 = "_readSource == nullptr";
    goto LABEL_15;
  }
  if (self->_writeSource)
  {
    v13 = "_writeSource == nullptr";
    goto LABEL_15;
  }
  if (LOBYTE(self->super.super._interposerVersion))
  {
    v13 = "_invalid == NO";
    goto LABEL_15;
  }
  v5 = fcntl(a3, 3);
  fcntl(a3, 4, v5 | 4u);
  self->_readSource = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, a3, 0, (dispatch_queue_t)self->super.super._queue);
  v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_write, a3, 0, (dispatch_queue_t)self->super.super._queue);
  self->_writeSource = v6;
  readSource = self->_readSource;
  if (!readSource)
  {
    v13 = "_readSource";
    goto LABEL_15;
  }
  if (!v6)
  {
    v13 = "_writeSource";
LABEL_15:
    __assert_rtn("-[GTBaseSocketTransport runWithSocket:]", ", 0, v13);
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __39__GTBaseSocketTransport_runWithSocket___block_invoke;
  handler[3] = &unk_726128;
  handler[4] = self;
  dispatch_source_set_cancel_handler(readSource, handler);
  writeSource = self->_writeSource;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __39__GTBaseSocketTransport_runWithSocket___block_invoke_2;
  v16[3] = &unk_726128;
  v16[4] = self;
  dispatch_source_set_cancel_handler(writeSource, v16);
  v9 = self->_readSource;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __39__GTBaseSocketTransport_runWithSocket___block_invoke_3;
  v15[3] = &unk_726128;
  v15[4] = self;
  dispatch_source_set_event_handler(v9, v15);
  v10 = self->_writeSource;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __39__GTBaseSocketTransport_runWithSocket___block_invoke_4;
  v14[3] = &unk_726128;
  v14[4] = self;
  dispatch_source_set_event_handler(v10, v14);
  dispatch_resume((dispatch_object_t)self->_readSource);
  self->_scheduledReadOnWritableSocket = 0;
  self->_writeSourceIsSuspended = 1;
  smTransport = self->_smTransport;
  if (smTransport)
  {
    v12 = -[GTSharedMemoryTransport_replayer connect](smTransport, "connect");
    if ((objc_msgSend(v12, "BOOLResult") & 1) == 0)
      -[GTBaseStreamTransport_replayer _scheduleInvalidation:](self, "_scheduleInvalidation:", objc_msgSend(v12, "error"));
  }
}

- (void)scheduleReadOnWritableSocket
{
  if (!LOBYTE(self->super.super._interposerVersion) && !self->_scheduledReadOnWritableSocket)
  {
    self->_scheduledReadOnWritableSocket = 1;
    if (self->_writeSourceIsSuspended)
    {
      dispatch_resume((dispatch_object_t)self->_writeSource);
      self->_writeSourceIsSuspended = 0;
    }
  }
}

- (BOOL)connected
{
  NSObject *readSource;

  readSource = self->_readSource;
  if (readSource)
    LOBYTE(readSource) = dispatch_source_testcancel(readSource) == 0;
  return (char)readSource;
}

- (void)setPrioritizeOutgoingMessages:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *queue;
  objc_super v6;
  _QWORD block[5];
  BOOL v8;

  v3 = a3;
  queue = self->super.super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __55__GTBaseSocketTransport_setPrioritizeOutgoingMessages___block_invoke;
  block[3] = &unk_725208;
  block[4] = self;
  v8 = a3;
  dispatch_sync(queue, block);
  v6.receiver = self;
  v6.super_class = (Class)GTBaseSocketTransport_replayer;
  -[GTTransport_replayer setPrioritizeOutgoingMessages:](&v6, "setPrioritizeOutgoingMessages:", v3);
}

- (void)_invalidate
{
  NSObject *writeSource;
  objc_super v4;

  writeSource = self->_writeSource;
  if (writeSource)
  {
    if (!self->_readSource)
      __assert_rtn("-[GTBaseSocketTransport _invalidate]", ", 0, "_readSource");
    dispatch_source_cancel(writeSource);
    if (self->_writeSourceIsSuspended)
      dispatch_resume((dispatch_object_t)self->_writeSource);
  }
  -[GTBaseSocketTransport_replayer _destroySharedMemoryTransport](self, "_destroySharedMemoryTransport");
  v4.receiver = self;
  v4.super_class = (Class)GTBaseSocketTransport_replayer;
  -[GTBaseStreamTransport_replayer _invalidate](&v4, "_invalidate");
}

- (id)createNewSharedMemoryTransport
{
  return -[GTBaseSocketTransport_replayer createNewSharedMemoryTransportWithURL:](self, "createNewSharedMemoryTransportWithURL:", 0);
}

- (id)createNewSharedMemoryTransportWithURL:(id)a3
{
  NSObject *queue;
  id v4;
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
  queue = self->super.super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __63__GTBaseSocketTransport_createNewSharedMemoryTransportWithURL___block_invoke;
  block[3] = &unk_7267A0;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_destroySharedMemoryTransport
{
  -[GTTransport_replayer invalidate](self->_smTransport, "invalidate");

  self->_smTransport = 0;
}

- (void)destroySharedMemoryTransport
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->super.super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __53__GTBaseSocketTransport_destroySharedMemoryTransport__block_invoke;
  block[3] = &unk_726128;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BOOL)relayMessageOverSharedMemoryTransport:(id)a3 error:(id *)a4
{
  return -[GTTransport_replayer relayMessage:error:](self->_smTransport, "relayMessage:error:", a3, a4);
}

- (unsigned)_nextMessageSerial
{
  GTSharedMemoryTransport_replayer *smTransport;
  unsigned int result;
  atomic<unsigned int> *p_messageCounter;
  unsigned int v6;
  unsigned int v7;
  BOOL v8;
  objc_super v9;

  smTransport = self->_smTransport;
  if (smTransport)
  {
    result = -[GTSharedMemoryTransport_replayer _nextMessageSerial](smTransport, "_nextMessageSerial");
    p_messageCounter = &self->super.super._messageCounter;
    do
      v6 = __ldaxr(&p_messageCounter->__a_.__a_value);
    while (__stlxr(result, &p_messageCounter->__a_.__a_value));
    if (v6 > result)
    {
      do
      {
        do
          v7 = __ldaxr(&p_messageCounter->__a_.__a_value);
        while (__stlxr(v6, &p_messageCounter->__a_.__a_value));
        v8 = v7 > v6;
        v6 = v7;
      }
      while (v8);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GTBaseSocketTransport_replayer;
    return -[GTTransport_replayer _nextMessageSerial](&v9, "_nextMessageSerial");
  }
  return result;
}

- (GTSharedMemoryTransport_replayer)smTransport
{
  return self->_smTransport;
}

@end
