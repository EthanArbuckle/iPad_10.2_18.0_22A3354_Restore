@implementation DYBaseSocketTransport

- (DYBaseSocketTransport)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYBaseSocketTransport;
  return -[DYBaseStreamTransport init](&v3, sel_init);
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
  v3 = (void *)MEMORY[0x2426231FC]();
  while (-[DYBaseStreamTransport _readAndAccumulate](self, "_readAndAccumulate") > 0)
    ;
  objc_autoreleasePoolPop(v3);
}

- (void)runWithSocket:(int)a3
{
  int v5;
  OS_dispatch_source *v6;
  NSObject *readSource;
  uint64_t v8;
  NSObject *writeSource;
  NSObject *v10;
  NSObject *v11;
  DYSharedMemoryTransport *smTransportCapture;
  id v13;
  DYSharedMemoryTransport *smTransportDiagnostics;
  const char *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD handler[5];

  if (self->_readSource)
  {
    v15 = "_readSource == nullptr";
    goto LABEL_17;
  }
  if (self->_writeSource)
  {
    v15 = "_writeSource == nullptr";
    goto LABEL_17;
  }
  if (LOBYTE(self->super.super._interposerVersion))
  {
    v15 = "_invalid == NO";
    goto LABEL_17;
  }
  v5 = fcntl(a3, 3);
  fcntl(a3, 4, v5 | 4u);
  self->_readSource = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA00], a3, 0, (dispatch_queue_t)self->super.super._queue);
  v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA30], a3, 0, (dispatch_queue_t)self->super.super._queue);
  self->_writeSource = v6;
  readSource = self->_readSource;
  if (!readSource)
  {
    v15 = "_readSource";
    goto LABEL_17;
  }
  if (!v6)
  {
    v15 = "_writeSource";
LABEL_17:
    __assert_rtn("-[DYBaseSocketTransport runWithSocket:]", ", 0, v15);
  }
  v8 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __39__DYBaseSocketTransport_runWithSocket___block_invoke;
  handler[3] = &unk_250D62318;
  handler[4] = self;
  dispatch_source_set_cancel_handler(readSource, handler);
  writeSource = self->_writeSource;
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __39__DYBaseSocketTransport_runWithSocket___block_invoke_2;
  v18[3] = &unk_250D62318;
  v18[4] = self;
  dispatch_source_set_cancel_handler(writeSource, v18);
  v10 = self->_readSource;
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __39__DYBaseSocketTransport_runWithSocket___block_invoke_3;
  v17[3] = &unk_250D62318;
  v17[4] = self;
  dispatch_source_set_event_handler(v10, v17);
  v11 = self->_writeSource;
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __39__DYBaseSocketTransport_runWithSocket___block_invoke_4;
  v16[3] = &unk_250D62318;
  v16[4] = self;
  dispatch_source_set_event_handler(v11, v16);
  dispatch_resume((dispatch_object_t)self->_readSource);
  self->_scheduledReadOnWritableSocket = 0;
  self->_writeSourceIsSuspended = 1;
  smTransportCapture = self->_smTransportCapture;
  if (smTransportCapture
    && (v13 = -[DYSharedMemoryTransport connect](smTransportCapture, "connect"),
        !objc_msgSend(v13, "BOOLResult"))
    || (smTransportDiagnostics = self->_smTransportDiagnostics) != 0
    && (v13 = -[DYSharedMemoryTransport connect](smTransportDiagnostics, "connect"),
        (objc_msgSend(v13, "BOOLResult") & 1) == 0))
  {
    -[DYBaseStreamTransport _scheduleInvalidation:](self, "_scheduleInvalidation:", objc_msgSend(v13, "error"));
  }
}

void __39__DYBaseSocketTransport_runWithSocket___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "closeSocketDescriptor");
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 232));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) = 0;
}

void __39__DYBaseSocketTransport_runWithSocket___block_invoke_2(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 232));
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 240));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = 0;
}

uint64_t __39__DYBaseSocketTransport_runWithSocket___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_readAndAccumulateLoop");
}

_BYTE *__39__DYBaseSocketTransport_runWithSocket___block_invoke_4(uint64_t a1)
{
  _BYTE *result;

  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 240));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 264) = 1;
  result = *(_BYTE **)(a1 + 32);
  if (result[265])
    return (_BYTE *)objc_msgSend(result, "_readAndAccumulateLoop");
  return result;
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__DYBaseSocketTransport_setPrioritizeOutgoingMessages___block_invoke;
  block[3] = &unk_250D62880;
  block[4] = self;
  v8 = a3;
  dispatch_sync(queue, block);
  v6.receiver = self;
  v6.super_class = (Class)DYBaseSocketTransport;
  -[DYTransport setPrioritizeOutgoingMessages:](&v6, sel_setPrioritizeOutgoingMessages_, v3);
}

uint64_t __55__DYBaseSocketTransport_setPrioritizeOutgoingMessages___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setPrioritizeOutgoingMessages:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "setPrioritizeOutgoingMessages:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_invalidate
{
  NSObject *writeSource;
  objc_super v4;

  writeSource = self->_writeSource;
  if (writeSource)
  {
    if (!self->_readSource)
      __assert_rtn("-[DYBaseSocketTransport _invalidate]", ", 0, "_readSource");
    dispatch_source_cancel(writeSource);
    if (self->_writeSourceIsSuspended)
      dispatch_resume((dispatch_object_t)self->_writeSource);
  }
  -[DYBaseSocketTransport _destroySharedMemoryTransport](self, "_destroySharedMemoryTransport");
  v4.receiver = self;
  v4.super_class = (Class)DYBaseSocketTransport;
  -[DYBaseStreamTransport _invalidate](&v4, sel__invalidate);
}

- (DYBaseSocketTransportSharedMemoryURLs)createNewSharedMemoryTransportWithUniqueIdentifier:(id)a3 loadCapture:(BOOL)a4 loadDiagnostics:(BOOL)a5
{
  void *v5;
  void *v6;
  DYBaseSocketTransportSharedMemoryURLs result;

  v5 = (void *)-[DYBaseSocketTransport createNewSharedMemoryTransportWithURLs:uniqueIdentifier:loadCapture:loadDiagnostics:](self, "createNewSharedMemoryTransportWithURLs:uniqueIdentifier:loadCapture:loadDiagnostics:", 0, 0, a3, a4, a5);
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (DYBaseSocketTransportSharedMemoryURLs)createNewSharedMemoryTransportWithURLs:(DYBaseSocketTransportSharedMemoryURLs)a3 uniqueIdentifier:(id)a4 loadCapture:(BOOL)a5 loadDiagnostics:(BOOL)a6
{
  NSObject *queue;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD block[8];
  DYBaseSocketTransportSharedMemoryURLs v12;
  BOOL v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  DYBaseSocketTransportSharedMemoryURLs result;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  queue = self->super.super._queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __109__DYBaseSocketTransport_createNewSharedMemoryTransportWithURLs_uniqueIdentifier_loadCapture_loadDiagnostics___block_invoke;
  block[3] = &unk_250D628A8;
  v13 = a5;
  block[4] = self;
  block[5] = a4;
  v14 = a6;
  v12 = a3;
  block[6] = &v21;
  block[7] = &v15;
  dispatch_sync(queue, block);
  v7 = (id)v22[5];
  v8 = (id)v16[5];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  v9 = v7;
  v10 = v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

_BYTE *__109__DYBaseSocketTransport_createNewSharedMemoryTransportWithURLs_uniqueIdentifier_loadCapture_loadDiagnostics___block_invoke(uint64_t a1)
{
  _BYTE *result;
  DYSharedMemoryTransport *v3;
  uint64_t v4;
  uint64_t v5;
  DYSharedMemoryTransport *v6;
  uint64_t v7;

  result = *(_BYTE **)(a1 + 32);
  if (!result[52])
  {
    objc_msgSend(result, "_destroySharedMemoryTransport");
    if (*(_BYTE *)(a1 + 80))
    {
      v3 = [DYSharedMemoryTransport alloc];
      v4 = *(_QWORD *)(a1 + 40);
      v5 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 40));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = -[DYSharedMemoryTransport initWithMode:initialMessageSerial:uniqueIdentifier:](v3, "initWithMode:initialMessageSerial:uniqueIdentifier:", 2, v5, v4);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setRelayTransport:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setPrioritizeOutgoingMessages:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 53));
    }
    if (*(_BYTE *)(a1 + 81))
    {
      v6 = [DYSharedMemoryTransport alloc];
      v7 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 40));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256) = -[DYSharedMemoryTransport initWithMode:initialMessageSerial:uniqueIdentifier:](v6, "initWithMode:initialMessageSerial:uniqueIdentifier:", 2, v7, 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "setRelayTransport:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "setPrioritizeOutgoingMessages:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 53));
    }
    if (*(_QWORD *)(a1 + 64))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setUrl:");
    if (*(_QWORD *)(a1 + 72))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "setUrl:");
    if (objc_msgSend(*(id *)(a1 + 32), "connected"))
    {
      if (*(_BYTE *)(a1 + 80))
        objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "connect"), "waitUntilResolved");
      if (*(_BYTE *)(a1 + 81))
        objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "connect"), "waitUntilResolved");
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "url");
    result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "url");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  }
  return result;
}

- (void)_destroySharedMemoryTransport
{
  DYSharedMemoryTransport *smTransportCapture;
  DYSharedMemoryTransport *smTransportDiagnostics;

  smTransportCapture = self->_smTransportCapture;
  if (smTransportCapture)
  {
    -[DYTransport invalidate](smTransportCapture, "invalidate");

    self->_smTransportCapture = 0;
  }
  smTransportDiagnostics = self->_smTransportDiagnostics;
  if (smTransportDiagnostics)
  {
    -[DYTransport invalidate](smTransportDiagnostics, "invalidate");

    self->_smTransportDiagnostics = 0;
  }
}

- (void)destroySharedMemoryTransport
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->super.super._queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__DYBaseSocketTransport_destroySharedMemoryTransport__block_invoke;
  block[3] = &unk_250D62318;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __53__DYBaseSocketTransport_destroySharedMemoryTransport__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_destroySharedMemoryTransport");
}

- (BOOL)relayMessageOverSharedMemoryTransport:(id)a3 error:(id *)a4
{
  return -[DYTransport relayMessage:error:](self->_smTransportCapture, "relayMessage:error:", a3, a4);
}

- (BOOL)relayMessageOverSecondarySharedMemoryTransport:(id)a3 error:(id *)a4
{
  return -[DYTransport relayMessage:error:](self->_smTransportDiagnostics, "relayMessage:error:", a3, a4);
}

- (unsigned)_nextMessageSerial
{
  DYSharedMemoryTransport *smTransportCapture;
  unsigned int result;
  unsigned int *p_messageCounter;
  unsigned int v6;
  unsigned int v7;
  BOOL v8;
  objc_super v9;

  smTransportCapture = self->_smTransportCapture;
  if (smTransportCapture || (smTransportCapture = self->_smTransportDiagnostics) != 0)
  {
    result = -[DYSharedMemoryTransport _nextMessageSerial](smTransportCapture, "_nextMessageSerial");
    p_messageCounter = &self->super.super._messageCounter;
    do
      v6 = __ldaxr(p_messageCounter);
    while (__stlxr(result, p_messageCounter));
    if (v6 > result)
    {
      do
      {
        do
          v7 = __ldaxr(p_messageCounter);
        while (__stlxr(v6, p_messageCounter));
        v8 = v7 > v6;
        v6 = v7;
      }
      while (v8);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)DYBaseSocketTransport;
    return -[DYTransport _nextMessageSerial](&v9, sel__nextMessageSerial);
  }
  return result;
}

- (DYSharedMemoryTransport)smTransportCapture
{
  return self->_smTransportCapture;
}

- (DYSharedMemoryTransport)smTransportDiagnostics
{
  return self->_smTransportDiagnostics;
}

@end
