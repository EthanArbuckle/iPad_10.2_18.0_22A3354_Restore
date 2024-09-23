@implementation DYSharedMemoryTransport

- (DYSharedMemoryTransport)init
{
  -[DYSharedMemoryTransport doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (DYSharedMemoryTransport)initWithMode:(int)a3 uniqueIdentifier:(id)a4
{
  return -[DYSharedMemoryTransport initWithMode:initialMessageSerial:uniqueIdentifier:](self, "initWithMode:initialMessageSerial:uniqueIdentifier:", *(_QWORD *)&a3, 0, a4);
}

- (DYSharedMemoryTransport)initWithMode:(int)a3 initialMessageSerial:(unsigned int)a4 uniqueIdentifier:(id)a5
{
  DYSharedMemoryTransport *v8;
  DYSharedMemoryTransport *v9;
  id v10;
  unsigned int v11;
  id v12;
  uint64_t v13;
  const char *v15;
  std::random_device v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)DYSharedMemoryTransport;
  v8 = -[DYBaseStreamTransport init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_mode = a3;
    if ((a3 - 3) <= 0xFFFFFFFD)
    {
      v15 = "_mode == kDYSharedMemoryTransportModeClient || _mode == kDYSharedMemoryTransportModeServer";
    }
    else
    {
      atomic_store(a4, &v8->super.super._messageCounter);
      if (a5)
      {
        v10 = objc_alloc(MEMORY[0x24BDBCF48]);
        v9->super.super._url = (NSURL *)objc_msgSend(v10, "initWithString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dysmt://localhost/%lx"), objc_msgSend(a5, "unsignedLongValue")));
      }
      else
      {
        std::random_device::random_device[abi:ne180100](&v16);
        v11 = MEMORY[0x242622BFC](&v16);
        v12 = objc_alloc(MEMORY[0x24BDBCF48]);
        v9->super.super._url = (NSURL *)objc_msgSend(v12, "initWithString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dysmt://localhost/%lx%d"), v11, getpid()));
        std::random_device::~random_device(&v16);
      }
      v9->_consumeBytesSEL = sel__accumulateMessageBytes;
      v13 = -[DYSharedMemoryTransport methodForSelector:](v9, "methodForSelector:");
      v9->_consumeBytesIMP = (void *)v13;
      if (v13)
      {
        v9->_bufferedMessages = (NSMutableArray *)objc_opt_new();
        return v9;
      }
      v15 = "_consumeBytesIMP";
    }
    __assert_rtn("-[DYSharedMemoryTransport initWithMode:initialMessageSerial:uniqueIdentifier:]", ", 0, v15);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYSharedMemoryTransport;
  -[DYBaseStreamTransport dealloc](&v3, sel_dealloc);
}

- (void)setUrl:(id)a3
{
  NSObject *queue;
  _QWORD block[6];

  if (!a3)
    __assert_rtn("-[DYSharedMemoryTransport setUrl:]", ", 0, "newUrl != nil");
  if (-[DYSharedMemoryTransport connected](self, "connected"))
    dy_abort("tried to set URL on connected transport");
  if ((objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", CFSTR("dysmt")) & 1) == 0
    && (objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", CFSTR("dysmtdeferred")) & 1) == 0)
  {
    dy_abort("url scheme has to be dysmt: %s", (const char *)objc_msgSend((id)objc_msgSend(a3, "absoluteString"), "UTF8String"));
  }
  if (!objc_msgSend((id)objc_msgSend(a3, "path"), "length"))
    dy_abort("url path cannot be nil or empty: %s", (const char *)objc_msgSend((id)objc_msgSend(a3, "absoluteString"), "UTF8String"));
  queue = self->super.super._queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__DYSharedMemoryTransport_setUrl___block_invoke;
  block[3] = &unk_250D622A0;
  block[4] = a3;
  block[5] = self;
  dispatch_sync(queue, block);
}

uint64_t __34__DYSharedMemoryTransport_setUrl___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  v1 = *(void **)(*(_QWORD *)(result + 40) + 8);
  if (*(void **)(result + 32) != v1)
  {
    v2 = result;

    *(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) = *(id *)(v2 + 32);
    result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(v2 + 40) + 8), "scheme"), "isEqualToString:", CFSTR("dysmtdeferred"));
    v3 = *(_QWORD *)(v2 + 40);
    if ((_DWORD)result)
      v4 = *(_DWORD *)(v3 + 300) != 2;
    else
      v4 = 0;
    *(_BYTE *)(v3 + 304) = v4;
  }
  return result;
}

- (void)setRelayTransport:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->super.super._queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__DYSharedMemoryTransport_setRelayTransport___block_invoke;
  v4[3] = &unk_250D622A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __45__DYSharedMemoryTransport_setRelayTransport___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char **v4;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 272);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 272) = *(id *)(v2 + 40);
    v3 = *(_QWORD *)(v2 + 32);
    if (*(_QWORD *)(v3 + 272))
      v4 = &selRef__relayPacket;
    else
      v4 = &selRef__accumulateMessageBytes;
    *(_QWORD *)(v3 + 288) = *v4;
    result = objc_msgSend(*(id *)(v2 + 32), "methodForSelector:", *(_QWORD *)(*(_QWORD *)(v2 + 32) + 288));
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 280) = result;
    if (!*(_QWORD *)(*(_QWORD *)(v2 + 32) + 280))
      __assert_rtn("-[DYSharedMemoryTransport setRelayTransport:]_block_invoke", ", 0, "_consumeBytesIMP");
  }
  return result;
}

- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5 replyQueue:(id)a6 timeout:(unint64_t)a7 handler:(id)a8
{
  BufferedSendOperation *v13;
  objc_super v15;

  if (self->_deferred)
  {
    v13 = objc_alloc_init(BufferedSendOperation);
    -[BufferedSendOperation setMessage:](v13, "setMessage:", a3);
    -[BufferedSendOperation setReplyTo:](v13, "setReplyTo:", a4);
    -[BufferedSendOperation setQueue:](v13, "setQueue:", a6);
    -[BufferedSendOperation setReplyBlock:](v13, "setReplyBlock:", a8);
    -[NSMutableArray addObject:](self->_bufferedMessages, "addObject:", v13);
    return 1;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)DYSharedMemoryTransport;
    return -[DYTransport send:inReplyTo:error:replyQueue:timeout:handler:](&v15, sel_send_inReplyTo_error_replyQueue_timeout_handler_, a3, a4, a5, a6, a7, a8);
  }
}

- (id)_getSharedMemoryNameWithSuffix:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("gdt-%@-%@"), -[NSString substringFromIndex:](-[NSURL path](self->super.super._url, "path"), "substringFromIndex:", 1), a3);
}

- (unint64_t)_calculateVMRegionMapSize:(unint64_t)a3
{
  return 2 * a3;
}

- (void)_mapSharedMemoryFile:(int)a3 size:(unint64_t)a4 error:(id *)a5
{
  size_t v8;
  char *v9;
  char *v10;

  v8 = -[DYSharedMemoryTransport _calculateVMRegionMapSize:](self, "_calculateVMRegionMapSize:", a4);
  v9 = (char *)mmap(0, v8, 0, 4098, -1, 0);
  if (v9 == (char *)-1)
  {
    if (!a5)
      return 0;
    v10 = 0;
    *a5 = +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
  }
  else
  {
    v10 = v9;
    if (mmap(v9, a4, 3, 17, a3, 0) != v9 || mmap(&v10[a4], a4 - 0x4000, 3, 17, a3, 0x4000) != &v10[a4])
    {
      if (a5)
        *a5 = +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
      munmap(v10, v8);
      return 0;
    }
  }
  return v10;
}

- (void)_tearDownSharedMemory
{
  sm_region_header *incomingShmem;
  sm_region_header *outgoingShmem;

  incomingShmem = self->_incomingShmem;
  if (incomingShmem)
  {
    munmap(incomingShmem, -[DYSharedMemoryTransport _calculateVMRegionMapSize:](self, "_calculateVMRegionMapSize:", incomingShmem->var6));
    self->_incomingShmem = 0;
    self->_incomingBuffer = 0;
  }
  outgoingShmem = self->_outgoingShmem;
  if (outgoingShmem)
  {
    munmap(outgoingShmem, -[DYSharedMemoryTransport _calculateVMRegionMapSize:](self, "_calculateVMRegionMapSize:", outgoingShmem->var6));
    self->_outgoingShmem = 0;
    self->_outgoingBuffer = 0;
  }
  self->_masterSMRegion = 0;
  if (self->_sendName[0])
    shm_unlink(self->_sendName);
  if (self->_receiveName[0])
    shm_unlink(self->_receiveName);
}

- (BOOL)_initializeSMRegion:(sm_region_header *)a3 size:(unint64_t)a4 name:(const char *)a5 error:(id *)a6
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  sm_region_header *v12;
  sm_region_header *v13;
  unsigned int v14;
  DYError *v15;

  if (((a4 + *MEMORY[0x24BDB03C8] - 1) & -*MEMORY[0x24BDB03C8]) <= 0x8000)
    v9 = 0x8000;
  else
    v9 = (a4 + *MEMORY[0x24BDB03C8] - 1) & -*MEMORY[0x24BDB03C8];
  v10 = shm_open(a5, 2562, 390);
  if ((_DWORD)v10 == -1 || (v11 = v10, ftruncate(v10, v9) == -1))
  {
    if (a6)
    {
      v15 = +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
      LOBYTE(v12) = 0;
      *a6 = v15;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    v12 = -[DYSharedMemoryTransport _mapSharedMemoryFile:size:error:](self, "_mapSharedMemoryFile:size:error:", v11, v9, a6);
    if (v12)
    {
      v13 = v12;
      close(v11);
      memset_pattern16(v13, &-[DYSharedMemoryTransport _initializeSMRegion:size:name:error:]::pattern, v9);
      atomic_store(0, &v13->var0);
      atomic_store(0, &v13->var1);
      atomic_store(0, &v13->var2);
      v14 = atomic_load(&self->super.super._messageCounter);
      atomic_store(v14, &v13->var3);
      atomic_store(0, &v13->var4);
      atomic_store(0, &v13->var5);
      v13->var6 = v9;
      v13->var7 = v9 - 0x4000;
      *a3 = v13;
      LOBYTE(v12) = 1;
    }
  }
  return (char)v12;
}

- (BOOL)_openSMRegion:(sm_region_header *)a3 size:(unint64_t)a4 name:(const char *)a5 error:(id *)a6
{
  uint64_t v11;
  unsigned int v12;
  uint64_t v14;
  unint64_t v15;
  sm_region_header *v16;
  sm_region_header *v17;
  DYError *v18;

  v11 = shm_open(a5, 2, 6);
  if ((_DWORD)v11 == -1)
  {
    v12 = 0;
    do
    {
      if (*__error() == 4)
      {
        if (v12 >= 3)
          goto LABEL_18;
      }
      else if (*__error() != 2 || v12 >= 3)
      {
        goto LABEL_18;
      }
      ++v12;
      sleep(1u);
      v14 = shm_open(a5, 2, 6);
    }
    while ((_DWORD)v14 == -1);
    v11 = v14;
  }
  if (((a4 + *MEMORY[0x24BDB03C8] - 1) & -*MEMORY[0x24BDB03C8]) <= 0x8000)
    v15 = 0x8000;
  else
    v15 = (a4 + *MEMORY[0x24BDB03C8] - 1) & -*MEMORY[0x24BDB03C8];
  v16 = -[DYSharedMemoryTransport _mapSharedMemoryFile:size:error:](self, "_mapSharedMemoryFile:size:error:", v11, v15, a6);
  if (v16)
  {
    v17 = v16;
    close(v11);
    if (shm_unlink(a5) == -1)
    {
LABEL_18:
      if (a6)
      {
        v18 = +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
        LOBYTE(v16) = 0;
        *a6 = v18;
      }
      else
      {
        LOBYTE(v16) = 0;
      }
    }
    else
    {
      *a3 = v17;
      LOBYTE(v16) = 1;
    }
  }
  return (char)v16;
}

- (void)_setupIOBuffers
{
  self->_outgoingBuffer = &self->_outgoingShmem[512];
  self->_incomingBuffer = &self->_incomingShmem[512];
}

- (BOOL)_createAndRunSources:(id *)a3
{
  DYContinuation *v4;
  OS_dispatch_queue *queue;
  DYContinuation *v6;
  pthread_t v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;
  pthread_attr_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  pthread_attr_init(&v16);
  pthread_attr_setdetachstate(&v16, 2);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v4 = [DYContinuation alloc];
  queue = self->super.super._queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__DYSharedMemoryTransport__createAndRunSources___block_invoke;
  v9[3] = &unk_250D622F0;
  v9[4] = self;
  v9[5] = &v10;
  v6 = -[DYContinuation initWithQueue:block:](v4, "initWithQueue:block:", queue, v9);
  v11[5] = (uint64_t)v6;
  v8 = 0;
  pthread_create(&v8, &v16, (void *(__cdecl *)(void *))smt_poll_thread_entry, v6);
  pthread_attr_destroy(&v16);
  _Block_object_dispose(&v10, 8);
  return 1;
}

uint64_t __48__DYSharedMemoryTransport__createAndRunSources___block_invoke(uint64_t result)
{
  uint64_t v1;
  unsigned int v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 52))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) + 24) = 1;
  }
  else
  {
    v2 = atomic_load((unsigned int *)(v1 + 48));
    atomic_store(v2, *(unsigned int **)(*(_QWORD *)(result + 32) + 232));
    return objc_msgSend(*(id *)(result + 32), "_dequeueIncomingMessages");
  }
  return result;
}

- (BOOL)_serverConnect:(id *)a3
{
  BOOL result;

  objc_msgSend(-[DYSharedMemoryTransport _getSharedMemoryNameWithSuffix:](self, "_getSharedMemoryNameWithSuffix:", CFSTR("s")), "getCString:maxLength:encoding:", self->_sendName, 64, 1);
  objc_msgSend(-[DYSharedMemoryTransport _getSharedMemoryNameWithSuffix:](self, "_getSharedMemoryNameWithSuffix:", CFSTR("c")), "getCString:maxLength:encoding:", self->_receiveName, 64, 1);
  if (!-[DYSharedMemoryTransport _initializeSMRegion:size:name:error:](self, "_initializeSMRegion:size:name:error:", &self->_outgoingShmem, 0x4000, self->_sendName, a3)|| !-[DYSharedMemoryTransport _initializeSMRegion:size:name:error:](self, "_initializeSMRegion:size:name:error:", &self->_incomingShmem, 0x40000, self->_receiveName, a3))
  {
    return 0;
  }
  -[DYSharedMemoryTransport _setupIOBuffers](self, "_setupIOBuffers");
  result = -[DYSharedMemoryTransport _createAndRunSources:](self, "_createAndRunSources:", a3);
  self->_masterSMRegion = self->_incomingShmem;
  return result;
}

- (BOOL)_clientConnect:(id *)a3
{
  BOOL result;

  objc_msgSend(-[DYSharedMemoryTransport _getSharedMemoryNameWithSuffix:](self, "_getSharedMemoryNameWithSuffix:", CFSTR("c")), "getCString:maxLength:encoding:", self->_sendName, 64, 1);
  objc_msgSend(-[DYSharedMemoryTransport _getSharedMemoryNameWithSuffix:](self, "_getSharedMemoryNameWithSuffix:", CFSTR("s")), "getCString:maxLength:encoding:", self->_receiveName, 64, 1);
  if (!-[DYSharedMemoryTransport _openSMRegion:size:name:error:](self, "_openSMRegion:size:name:error:", &self->_incomingShmem, 0x4000, self->_receiveName, a3)|| !-[DYSharedMemoryTransport _openSMRegion:size:name:error:](self, "_openSMRegion:size:name:error:", &self->_outgoingShmem, 0x40000, self->_sendName, a3))
  {
    return 0;
  }
  -[DYSharedMemoryTransport _setupIOBuffers](self, "_setupIOBuffers");
  result = -[DYSharedMemoryTransport _createAndRunSources:](self, "_createAndRunSources:", a3);
  self->_masterSMRegion = self->_outgoingShmem;
  return result;
}

- (id)connect
{
  id v3;
  NSObject *queue;
  _QWORD v6[6];

  v3 = +[DYFuture future](DYFuture, "future");
  queue = self->super.super._queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__DYSharedMemoryTransport_connect__block_invoke;
  v6[3] = &unk_250D622A0;
  v6[4] = self;
  v6[5] = v3;
  dispatch_async(queue, v6);
  return v3;
}

uint64_t __34__DYSharedMemoryTransport_connect__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  _BYTE *v8;
  NSObject *global_queue;
  uint64_t v10;
  _QWORD v11[5];
  uint64_t v12;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[52])
  {
    objc_msgSend(*(id *)(a1 + 40), "setError:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 32, 0));
    v3 = (void *)MEMORY[0x24BDD16E0];
    v4 = 0;
    return objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(v3, "numberWithBool:", v4));
  }
  v6 = objc_msgSend(v2, "connected");
  v7 = *(_QWORD *)(a1 + 32);
  if (v6 && !*(_BYTE *)(v7 + 304))
  {
    v3 = (void *)MEMORY[0x24BDD16E0];
    v4 = 1;
    return objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(v3, "numberWithBool:", v4));
  }
  v12 = 0;
  if (*(_DWORD *)(v7 + 300) == 2)
  {
    if ((objc_msgSend((id)v7, "_serverConnect:", &v12) & 1) == 0)
    {
      v8 = *(_BYTE **)(a1 + 32);
LABEL_13:
      objc_msgSend(v8, "_tearDownSharedMemory");
      v10 = 0;
      goto LABEL_14;
    }
  }
  else if ((objc_msgSend((id)v7, "_clientConnect:", &v12) & 1) == 0)
  {
    v8 = *(_BYTE **)(a1 + 32);
    if (!v8[304])
      goto LABEL_13;
    v12 = 0;
    global_queue = dispatch_get_global_queue(0, 0);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __34__DYSharedMemoryTransport_connect__block_invoke_2;
    v11[3] = &unk_250D62318;
    v11[4] = v8;
    dispatch_async(global_queue, v11);
    v8 = *(_BYTE **)(a1 + 32);
    if (!v8[304])
      goto LABEL_13;
  }
  v10 = 1;
LABEL_14:
  objc_msgSend(*(id *)(a1 + 40), "setError:", v12);
  return objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10));
}

unint64_t __34__DYSharedMemoryTransport_connect__block_invoke_2(uint64_t a1)
{
  unint64_t result;
  uint64_t v3;
  unsigned int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  if ((objc_msgSend(*(id *)(a1 + 32), "_clientConnect:", 0) & 1) == 0)
  {
    do
      usleep(0x3D090u);
    while (!objc_msgSend(*(id *)(a1 + 32), "_clientConnect:", 0));
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 304) = 0;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "count");
  if (result)
  {
    v3 = 0;
    v4 = 1;
    do
    {
      v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "objectAtIndex:", v3);
      v6 = *(void **)(a1 + 32);
      v7 = objc_msgSend(v5, "message");
      v8 = objc_msgSend(v5, "replyTo");
      v9 = objc_msgSend(v5, "queue");
      v10 = objc_msgSend(v5, "timeout");
      v11 = objc_msgSend(v5, "replyBlock");
      v13.receiver = v6;
      v13.super_class = (Class)DYSharedMemoryTransport;
      objc_msgSendSuper2(&v13, sel_send_inReplyTo_error_replyQueue_timeout_handler_, v7, v8, 0, v9, v10, v11);
      v3 = v4;
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "count");
    }
    while (result > v4++);
  }
  return result;
}

- (BOOL)connected
{
  return self->_masterSMRegion != 0;
}

- (void)_invalidate
{
  objc_super v3;

  atomic_store(0xFFFFFFFF, &self->_outgoingShmem->var4);
  -[DYSharedMemoryTransport _tearDownSharedMemory](self, "_tearDownSharedMemory");
  v3.receiver = self;
  v3.super_class = (Class)DYSharedMemoryTransport;
  -[DYBaseStreamTransport _invalidate](&v3, sel__invalidate);
}

- (unint64_t)_computeBytesAvailableToWrite
{
  unsigned int v2;
  unsigned int v3;
  sm_region_header *outgoingShmem;
  unsigned int var7;
  unsigned int v6;
  unsigned int v8;
  sm_region_header *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;

  v2 = atomic_load(&self->_outgoingShmem->var5);
  v3 = atomic_load(&self->_outgoingShmem->var4);
  outgoingShmem = self->_outgoingShmem;
  if (v2 >= v3)
  {
    v8 = atomic_load(&outgoingShmem->var4);
    v9 = self->_outgoingShmem;
    if (v2 == v8)
    {
      v10 = atomic_load(&v9->var2);
      v11 = atomic_load(&self->_outgoingShmem->var1);
      if (v10 == v11)
        return self->_outgoingShmem->var7;
      else
        return 0;
    }
    else
    {
      v12 = atomic_load(&v9->var4);
      return v2 - v12;
    }
  }
  else
  {
    var7 = outgoingShmem->var7;
    v6 = atomic_load(&outgoingShmem->var4);
    return var7 + v2 - v6;
  }
}

- (unint64_t)_computeBytesAvailableToRead
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  sm_region_header *incomingShmem;
  unsigned int v7;
  unsigned int v8;
  unsigned int var7;
  unsigned int v10;

  v2 = atomic_load(&self->_incomingShmem->var4);
  v3 = atomic_load(&self->_incomingShmem->var5);
  v4 = atomic_load(&self->_incomingShmem->var5);
  if (v3 >= v2)
  {
    incomingShmem = self->_incomingShmem;
    if (v2 == v4)
    {
      v7 = atomic_load(&incomingShmem->var2);
      v8 = atomic_load(&self->_incomingShmem->var1);
      if (v7 == v8)
        return 0;
      else
        return self->_incomingShmem->var7;
    }
    else
    {
      var7 = incomingShmem->var7;
      v10 = atomic_load(&incomingShmem->var5);
      return var7 + v2 - v10;
    }
  }
  else
  {
    return v2 - v4;
  }
}

- (void)_copyToSM:(const void *)a3 size:(int64_t)a4
{
  uint64_t v6;
  sm_region_header *outgoingShmem;
  unint64_t var7;

  v6 = atomic_load(&self->_outgoingShmem->var4);
  memcpy((char *)self->_outgoingBuffer + v6, a3, a4);
  outgoingShmem = self->_outgoingShmem;
  var7 = outgoingShmem->var7;
  if (v6 + a4 < var7)
    LODWORD(var7) = 0;
  atomic_store(v6 + a4 - var7, &outgoingShmem->var4);
}

- (void)_waitEAGAIN
{
  unsigned int v3;

  v3 = 0;
  do
  {
    usleep(0xC8u);
    if (-[DYSharedMemoryTransport _computeBytesAvailableToRead](self, "_computeBytesAvailableToRead") > 4)
      break;
  }
  while (v3++ < 4);
}

- (int64_t)_write:(const void *)a3 size:(unint64_t)a4
{
  unint64_t v4;
  unsigned int v7;
  unint64_t v8;
  unsigned int *p_var1;
  unsigned int v10;
  int v12;

  v4 = a4;
  if (a4)
  {
    v7 = atomic_load((unsigned int *)&self->super.super._invalid);
    atomic_store(v7, &self->_outgoingShmem->var0);
    v8 = -[DYSharedMemoryTransport _computeBytesAvailableToWrite](self, "_computeBytesAvailableToWrite");
    if (v8 > 4)
    {
      if (v8 - 4 < v4)
        v4 = v8 - 4;
      v12 = v4 + 4;
      -[DYSharedMemoryTransport _copyToSM:size:](self, "_copyToSM:size:", &v12, 4);
      -[DYSharedMemoryTransport _copyToSM:size:](self, "_copyToSM:size:", a3, v4);
      p_var1 = &self->_outgoingShmem->var1;
      do
        v10 = __ldaxr(p_var1);
      while (__stlxr(v10 + 1, p_var1));
    }
    else
    {
      *__error() = 35;
      return -1;
    }
  }
  return v4;
}

- (unsigned)_nextMessageSerial
{
  unsigned int *p_var3;
  unsigned int v3;
  unsigned int result;

  p_var3 = &self->_masterSMRegion->var3;
  do
  {
    v3 = __ldaxr(p_var3);
    result = v3 + 1;
  }
  while (__stlxr(v3 + 1, p_var3));
  return result;
}

- (void)_updateReaderOffset:(unint64_t)a3
{
  sm_region_header *incomingShmem;
  unint64_t var7;

  incomingShmem = self->_incomingShmem;
  var7 = incomingShmem->var7;
  if (var7 > a3)
    LODWORD(var7) = 0;
  atomic_store(a3 - var7, &incomingShmem->var5);
}

- (void)_copyFromSM:(void *)a3 size:(unint64_t)a4
{
  uint64_t v6;

  v6 = atomic_load(&self->_incomingShmem->var5);
  memcpy(a3, (char *)self->_incomingBuffer + v6, a4);
  -[DYSharedMemoryTransport _updateReaderOffset:](self, "_updateReaderOffset:", v6 + a4);
}

- (int64_t)_read:(void *)a3 size:(unint64_t)a4
{
  unint64_t currentPacketBytesLeft;
  int64_t v6;

  if (!a4)
    return 0;
  currentPacketBytesLeft = self->_currentPacketBytesLeft;
  if ((_DWORD)currentPacketBytesLeft)
  {
    if (currentPacketBytesLeft >= a4)
      v6 = a4;
    else
      v6 = self->_currentPacketBytesLeft;
    -[DYSharedMemoryTransport _copyFromSM:size:](self, "_copyFromSM:size:", a3, v6);
    self->_currentPacketBytesLeft -= v6;
  }
  else
  {
    *__error() = 35;
    return -1;
  }
  return v6;
}

- (void)_accumulateMessageBytes
{
  while (self->_currentPacketBytesLeft && -[DYBaseStreamTransport _readAndAccumulate](self, "_readAndAccumulate") > 0)
    ;
}

- (void)_relayPacket
{
  char *incomingBuffer;
  uint64_t v4;
  unsigned int v5;

  if (-[DYSharedMemoryTransport _relayPacket]::once_token != -1)
    dispatch_once(&-[DYSharedMemoryTransport _relayPacket]::once_token, &__block_literal_global_1);
  pthread_mutex_lock(&-[DYSharedMemoryTransport _relayPacket]::relayPacketMutex);
  incomingBuffer = (char *)self->_incomingBuffer;
  v4 = atomic_load(&self->_incomingShmem->var5);
  -[DYBaseStreamTransport _relayBuffer:size:](self->_relayTransport, "_relayBuffer:size:", &incomingBuffer[v4], self->_currentPacketBytesLeft);
  v5 = atomic_load(&self->_incomingShmem->var5);
  -[DYSharedMemoryTransport _updateReaderOffset:](self, "_updateReaderOffset:", self->_currentPacketBytesLeft + v5);
  self->_currentPacketBytesLeft = 0;
  pthread_mutex_unlock(&-[DYSharedMemoryTransport _relayPacket]::relayPacketMutex);
}

uint64_t __39__DYSharedMemoryTransport__relayPacket__block_invoke()
{
  return pthread_mutex_init(&-[DYSharedMemoryTransport _relayPacket]::relayPacketMutex, 0);
}

- (void)_dequeuePacket
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;

  v3 = -[DYSharedMemoryTransport _computeBytesAvailableToRead](self, "_computeBytesAvailableToRead");
  if (v3 <= 3)
  {
    v6 = (void *)MEMORY[0x2426231FC]();
    _DYOLog((uint64_t)self, 3, (uint64_t)CFSTR("not enough bytes available for packet header"), v7, v8, v9, v10, v11, v18);
    -[DYBaseStreamTransport _scheduleInvalidation:](self, "_scheduleInvalidation:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 259, 0));
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v4 = v3;
    v19 = 0;
    v5 = -[DYSharedMemoryTransport _copyFromSM:size:](self, "_copyFromSM:size:", &v19, 4);
    if (v4 < v19)
    {
      v12 = (void *)MEMORY[0x2426231FC](v5);
      _DYOLog((uint64_t)self, 3, (uint64_t)CFSTR("not enough bytes available for packet payload (%u < %u)"), v13, v14, v15, v16, v17, v4);
      -[DYBaseStreamTransport _scheduleInvalidation:](self, "_scheduleInvalidation:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 259, 0));
      objc_autoreleasePoolPop(v12);
    }
    else
    {
      self->_currentPacketBytesLeft = v19 - 4;
    }
  }
}

- (void)_dequeueIncomingMessages
{
  DYSharedMemoryTransport *v2;
  unsigned int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int *p_var2;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  _BOOL4 v15;
  BOOL v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = self;
  v3 = 0;
  v4 = 3;
  while (1)
  {
    v5 = atomic_load(&v2->_incomingShmem->var2);
    v6 = atomic_load(&v2->_incomingShmem->var1);
    if (v5 != v6)
      break;
LABEL_12:
    v13 = atomic_load(&v2->_incomingShmem->var0);
    v15 = v4-- != 0;
    if (v13)
      v16 = !v15;
    else
      v16 = 1;
    if (v16)
      goto LABEL_20;
    self = (DYSharedMemoryTransport *)usleep(0xAu);
  }
  while (1)
  {
    v7 = atomic_load((unsigned int *)&v2->super.super._invalid);
    if (v7 && v3 > 9)
      break;
    -[DYSharedMemoryTransport _dequeuePacket](v2, "_dequeuePacket");
    if (!v2->_currentPacketBytesLeft)
      return;
    self = (DYSharedMemoryTransport *)((uint64_t (*)(DYSharedMemoryTransport *, SEL))v2->_consumeBytesIMP)(v2, v2->_consumeBytesSEL);
    if (v2->_currentPacketBytesLeft)
    {
      v19 = (void *)MEMORY[0x2426231FC](self);
      _DYOLog((uint64_t)v2, 3, (uint64_t)CFSTR("did not consume all available bytes"), v20, v21, v22, v23, v24, v25);
      v18 = 3;
      goto LABEL_23;
    }
    p_var2 = &v2->_incomingShmem->var2;
    do
      v10 = __ldaxr(p_var2);
    while (__stlxr(v10 + 1, p_var2));
    ++v3;
    v11 = atomic_load(&v2->_incomingShmem->var2);
    v12 = atomic_load(&v2->_incomingShmem->var1);
    if (v11 == v12)
      goto LABEL_12;
  }
LABEL_20:
  v17 = atomic_load(&v2->_incomingShmem->var4);
  if (v17 == -1)
  {
    v18 = 31;
    v19 = (void *)MEMORY[0x2426231FC](self, a2);
LABEL_23:
    -[DYBaseStreamTransport _scheduleInvalidation:](v2, "_scheduleInvalidation:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), v18, 0));
    objc_autoreleasePoolPop(v19);
  }
}

- (BOOL)deferred
{
  return self->_deferred;
}

@end
