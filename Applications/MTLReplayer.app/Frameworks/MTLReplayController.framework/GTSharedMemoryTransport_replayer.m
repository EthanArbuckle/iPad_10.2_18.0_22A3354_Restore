@implementation GTSharedMemoryTransport_replayer

- (GTSharedMemoryTransport_replayer)init
{
  -[GTSharedMemoryTransport_replayer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GTSharedMemoryTransport_replayer)initWithMode:(int)a3
{
  return -[GTSharedMemoryTransport_replayer initWithMode:initialMessageSerial:](self, "initWithMode:initialMessageSerial:", *(_QWORD *)&a3, 0);
}

- (GTSharedMemoryTransport_replayer)initWithMode:(int)a3 initialMessageSerial:(unsigned int)a4
{
  GTSharedMemoryTransport_replayer *v6;
  GTSharedMemoryTransport_replayer *v7;
  CFUUIDRef v8;
  id v9;
  CFHashCode v10;
  id v11;
  uint64_t v12;
  const char *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GTSharedMemoryTransport_replayer;
  v6 = -[GTBaseStreamTransport_replayer init](&v15, "init");
  v7 = v6;
  if (!v6)
    return v7;
  v6->_mode = a3;
  if ((a3 - 3) <= 0xFFFFFFFD)
  {
    v14 = "_mode == kDYSharedMemoryTransportModeClient || _mode == kDYSharedMemoryTransportModeServer";
    goto LABEL_9;
  }
  atomic_store(a4, &v6->super.super._messageCounter.__a_.__a_value);
  v8 = CFUUIDCreate(kCFAllocatorDefault);
  v9 = objc_alloc((Class)NSURL);
  v10 = CFHash(v8);
  v7->super.super._url = (NSURL *)objc_msgSend(v9, "initWithString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("dysmt://localhost/%lx%d"), v10, getpid()));
  CFRelease(v8);
  v7->_consumeBytesSEL = "_accumulateMessageBytes";
  v11 = -[GTSharedMemoryTransport_replayer methodForSelector:](v7, "methodForSelector:");
  v7->_consumeBytesIMP = v11;
  if (!v11)
  {
    v14 = "_consumeBytesIMP";
LABEL_9:
    __assert_rtn("-[GTSharedMemoryTransport initWithMode:initialMessageSerial:]", ", 0, v14);
  }
  v7->_bufferedMessages = (NSMutableArray *)objc_opt_new(NSMutableArray, v12);
  v7->_sm_region_size_large = 104857600;
  v7->_sm_region_size_small = 0x1000000;
  if (!-[NSProcessInfo isiOSAppOnMac](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "isiOSAppOnMac"))
  {
    v7->_sm_region_size_large = 0x40000;
    v7->_sm_region_size_small = 0x4000;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTSharedMemoryTransport_replayer;
  -[GTBaseStreamTransport_replayer dealloc](&v3, "dealloc");
}

- (void)setUrl:(id)a3
{
  NSObject *queue;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  FILE *v11;
  FILE *v12;
  NSString *v13;
  _QWORD block[6];
  uint8_t buf[4];
  id v16;

  if (!a3)
    __assert_rtn("-[GTSharedMemoryTransport setUrl:]", ", 0, "newUrl != nil");
  if (-[GTSharedMemoryTransport_replayer connected](self, "connected"))
  {
    if (s_logUsingOsLog)
    {
      v6 = gt_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "fail: tried to set URL on connected transport";
        v8 = v6;
        v9 = 2;
        goto LABEL_18;
      }
    }
    else
    {
      v11 = __stderrp;
      -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fail: tried to set URL on connected transport")), "UTF8String");
      fprintf(v11, "%s\n");
    }
    goto LABEL_23;
  }
  if ((objc_msgSend(objc_msgSend(a3, "scheme"), "isEqualToString:", CFSTR("dysmt")) & 1) == 0
    && (objc_msgSend(objc_msgSend(a3, "scheme"), "isEqualToString:", CFSTR("dysmtdeferred")) & 1) == 0)
  {
    if (s_logUsingOsLog)
    {
      v10 = gt_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v16 = objc_msgSend(objc_msgSend(a3, "absoluteString"), "UTF8String");
        v7 = "fail: url scheme has to be dysmt: %s";
        goto LABEL_17;
      }
LABEL_23:
      abort();
    }
    v12 = __stderrp;
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fail: url scheme has to be dysmt: %s"), objc_msgSend(objc_msgSend(a3, "absoluteString"), "UTF8String"));
LABEL_22:
    -[NSString UTF8String](v13, "UTF8String");
    fprintf(v12, "%s\n");
    goto LABEL_23;
  }
  if (!objc_msgSend(objc_msgSend(a3, "path"), "length"))
  {
    if (s_logUsingOsLog)
    {
      v10 = gt_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v16 = objc_msgSend(objc_msgSend(a3, "absoluteString"), "UTF8String");
        v7 = "fail: url path cannot be nil or empty: %s";
LABEL_17:
        v8 = v10;
        v9 = 12;
LABEL_18:
        _os_log_fault_impl(&dword_0, v8, OS_LOG_TYPE_FAULT, v7, buf, v9);
        abort();
      }
      goto LABEL_23;
    }
    v12 = __stderrp;
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fail: url path cannot be nil or empty: %s"), objc_msgSend(objc_msgSend(a3, "absoluteString"), "UTF8String"));
    goto LABEL_22;
  }
  queue = self->super.super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __34__GTSharedMemoryTransport_setUrl___block_invoke;
  block[3] = &unk_725190;
  block[4] = a3;
  block[5] = self;
  dispatch_sync(queue, block);
}

- (void)setRelayTransport:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->super.super._queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __45__GTSharedMemoryTransport_setRelayTransport___block_invoke;
  v4[3] = &unk_725190;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5 replyQueue:(id)a6 timeout:(unint64_t)a7 handler:(id)a8
{
  GTBufferedSendOperation_replayer *v13;
  objc_super v15;

  if (self->_deferred)
  {
    v13 = objc_alloc_init(GTBufferedSendOperation_replayer);
    -[GTBufferedSendOperation_replayer setMessage:](v13, "setMessage:", a3);
    -[GTBufferedSendOperation_replayer setReplyTo:](v13, "setReplyTo:", a4);
    -[GTBufferedSendOperation_replayer setQueue:](v13, "setQueue:", a6);
    -[GTBufferedSendOperation_replayer setReplyBlock:](v13, "setReplyBlock:", a8);
    -[NSMutableArray addObject:](self->_bufferedMessages, "addObject:", v13);
    return 1;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)GTSharedMemoryTransport_replayer;
    return -[GTTransport_replayer send:inReplyTo:error:replyQueue:timeout:handler:](&v15, "send:inReplyTo:error:replyQueue:timeout:handler:", a3, a4, a5, a6, a7, a8);
  }
}

- (id)_getSharedMemoryNameWithSuffix:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("gdt-%@-%@"), -[NSString substringFromIndex:](-[NSURL path](self->super.super._url, "path"), "substringFromIndex:", 1), a3);
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

  v8 = -[GTSharedMemoryTransport_replayer _calculateVMRegionMapSize:](self, "_calculateVMRegionMapSize:", a4);
  v9 = (char *)mmap(0, v8, 0, 4098, -1, 0);
  if (v9 == (char *)-1)
  {
    if (!a5)
      return 0;
    v10 = 0;
    *a5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, *__error(), 0);
  }
  else
  {
    v10 = v9;
    if (mmap(v9, a4, 3, 17, a3, 0) != v9 || mmap(&v10[a4], a4 - 0x4000, 3, 17, a3, 0x4000) != &v10[a4])
    {
      if (a5)
        *a5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, *__error(), 0);
      munmap(v10, v8);
      return 0;
    }
  }
  return v10;
}

- (void)_tearDownSharedMemory
{
  unsigned int *incomingShmem;
  unsigned int *outgoingShmem;

  incomingShmem = (unsigned int *)self->_incomingShmem;
  if (incomingShmem)
  {
    munmap(incomingShmem, -[GTSharedMemoryTransport_replayer _calculateVMRegionMapSize:](self, "_calculateVMRegionMapSize:", incomingShmem[6]));
    self->_incomingShmem = 0;
    self->_incomingBuffer = 0;
  }
  outgoingShmem = (unsigned int *)self->_outgoingShmem;
  if (outgoingShmem)
  {
    munmap(outgoingShmem, -[GTSharedMemoryTransport_replayer _calculateVMRegionMapSize:](self, "_calculateVMRegionMapSize:", outgoingShmem[6]));
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
  void *v12;
  void *v13;
  unsigned int v14;
  NSError *v15;

  if (((a4 + vm_page_size - 1) & -(uint64_t)vm_page_size) <= 0x8000)
    v9 = 0x8000;
  else
    v9 = (a4 + vm_page_size - 1) & -(uint64_t)vm_page_size;
  v10 = shm_open(a5, 2562, 390);
  if ((_DWORD)v10 == -1 || (v11 = v10, ftruncate(v10, v9) == -1))
  {
    if (a6)
    {
      v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, *__error(), 0);
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
    v12 = -[GTSharedMemoryTransport_replayer _mapSharedMemoryFile:size:error:](self, "_mapSharedMemoryFile:size:error:", v11, v9, a6);
    if (v12)
    {
      v13 = v12;
      close(v11);
      memset_pattern16(v13, &-[GTSharedMemoryTransport _initializeSMRegion:size:name:error:]::pattern, v9);
      atomic_store(0, (unsigned int *)v13);
      atomic_store(0, (unsigned int *)v13 + 1);
      atomic_store(0, (unsigned int *)v13 + 2);
      v14 = atomic_load(&self->super.super._messageCounter.__a_.__a_value);
      atomic_store(v14, (unsigned int *)v13 + 3);
      atomic_store(0, (unsigned int *)v13 + 4);
      atomic_store(0, (unsigned int *)v13 + 5);
      *((_DWORD *)v13 + 6) = v9;
      *((_DWORD *)v13 + 7) = v9 - 0x4000;
      *a3 = (sm_region_header *)v13;
      LOBYTE(v12) = 1;
    }
  }
  return (char)v12;
}

- (BOOL)_openSMRegion:(sm_region_header *)a3 size:(unint64_t)a4 name:(const char *)a5 error:(id *)a6
{
  unsigned int i;
  uint64_t v12;
  int v14;
  unint64_t v15;
  sm_region_header *v16;
  sm_region_header *v17;
  NSError *v18;

  for (i = 0; ; ++i)
  {
    v12 = shm_open(a5, 2, 6);
    if ((_DWORD)v12 != -1)
      break;
    if (*__error() == 4)
    {
      if (i >= 3)
        goto LABEL_17;
    }
    else if (*__error() != 2 || i >= 3)
    {
      goto LABEL_17;
    }
    sleep(1u);
  }
  v14 = v12;
  if (((a4 + vm_page_size - 1) & -(uint64_t)vm_page_size) <= 0x8000)
    v15 = 0x8000;
  else
    v15 = (a4 + vm_page_size - 1) & -(uint64_t)vm_page_size;
  v16 = -[GTSharedMemoryTransport_replayer _mapSharedMemoryFile:size:error:](self, "_mapSharedMemoryFile:size:error:", v12, v15, a6);
  if (v16)
  {
    v17 = v16;
    close(v14);
    if (shm_unlink(a5) != -1)
    {
      *a3 = v17;
      LOBYTE(v16) = 1;
      return (char)v16;
    }
LABEL_17:
    if (a6)
    {
      v18 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, *__error(), 0);
      LOBYTE(v16) = 0;
      *a6 = v18;
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }
  return (char)v16;
}

- (void)_setupIOBuffers
{
  self->_outgoingBuffer = (char *)self->_outgoingShmem + 0x4000;
  self->_incomingBuffer = (char *)self->_incomingShmem + 0x4000;
}

- (BOOL)_createAndRunSources:(id *)a3
{
  GTContinuation_replayer *v4;
  OS_dispatch_queue *queue;
  GTContinuation_replayer *v6;
  pthread_t v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;
  pthread_attr_t v16;

  pthread_attr_init(&v16);
  pthread_attr_setdetachstate(&v16, 2);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__1286;
  v14 = __Block_byref_object_dispose__1287;
  v15 = 0;
  v4 = [GTContinuation_replayer alloc];
  queue = self->super.super._queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __48__GTSharedMemoryTransport__createAndRunSources___block_invoke;
  v9[3] = &unk_725FE8;
  v9[4] = self;
  v9[5] = &v10;
  v6 = -[GTContinuation_replayer initWithQueue:block:](v4, "initWithQueue:block:", queue, v9);
  v11[5] = (uint64_t)v6;
  v8 = 0;
  pthread_create(&v8, &v16, (void *(__cdecl *)(void *))smt_poll_thread_entry, v6);
  pthread_attr_destroy(&v16);
  _Block_object_dispose(&v10, 8);
  return 1;
}

- (BOOL)_serverConnect:(id *)a3
{
  BOOL result;

  objc_msgSend(-[GTSharedMemoryTransport_replayer _getSharedMemoryNameWithSuffix:](self, "_getSharedMemoryNameWithSuffix:", CFSTR("s")), "getCString:maxLength:encoding:", self->_sendName, 64, 1);
  objc_msgSend(-[GTSharedMemoryTransport_replayer _getSharedMemoryNameWithSuffix:](self, "_getSharedMemoryNameWithSuffix:", CFSTR("c")), "getCString:maxLength:encoding:", self->_receiveName, 64, 1);
  if (!-[GTSharedMemoryTransport_replayer _initializeSMRegion:size:name:error:](self, "_initializeSMRegion:size:name:error:", &self->_outgoingShmem, self->_sm_region_size_small, self->_sendName, a3)|| !-[GTSharedMemoryTransport_replayer _initializeSMRegion:size:name:error:](self, "_initializeSMRegion:size:name:error:", &self->_incomingShmem, self->_sm_region_size_large, self->_receiveName, a3))
  {
    return 0;
  }
  -[GTSharedMemoryTransport_replayer _setupIOBuffers](self, "_setupIOBuffers");
  result = -[GTSharedMemoryTransport_replayer _createAndRunSources:](self, "_createAndRunSources:", a3);
  self->_masterSMRegion = self->_incomingShmem;
  return result;
}

- (BOOL)_clientConnect:(id *)a3
{
  BOOL result;

  objc_msgSend(-[GTSharedMemoryTransport_replayer _getSharedMemoryNameWithSuffix:](self, "_getSharedMemoryNameWithSuffix:", CFSTR("c")), "getCString:maxLength:encoding:", self->_sendName, 64, 1);
  objc_msgSend(-[GTSharedMemoryTransport_replayer _getSharedMemoryNameWithSuffix:](self, "_getSharedMemoryNameWithSuffix:", CFSTR("s")), "getCString:maxLength:encoding:", self->_receiveName, 64, 1);
  if (!-[GTSharedMemoryTransport_replayer _openSMRegion:size:name:error:](self, "_openSMRegion:size:name:error:", &self->_incomingShmem, self->_sm_region_size_small, self->_receiveName, a3)|| !-[GTSharedMemoryTransport_replayer _openSMRegion:size:name:error:](self, "_openSMRegion:size:name:error:", &self->_outgoingShmem, self->_sm_region_size_large, self->_sendName, a3))
  {
    return 0;
  }
  -[GTSharedMemoryTransport_replayer _setupIOBuffers](self, "_setupIOBuffers");
  result = -[GTSharedMemoryTransport_replayer _createAndRunSources:](self, "_createAndRunSources:", a3);
  self->_masterSMRegion = self->_outgoingShmem;
  return result;
}

- (id)connect
{
  id v3;
  NSObject *queue;
  _QWORD v6[6];

  v3 = +[GTFuture_replayer future](GTFuture_replayer, "future");
  queue = self->super.super._queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __34__GTSharedMemoryTransport_connect__block_invoke;
  v6[3] = &unk_725190;
  v6[4] = self;
  v6[5] = v3;
  dispatch_async(queue, v6);
  return v3;
}

- (BOOL)connected
{
  return self->_masterSMRegion != 0;
}

- (void)_invalidate
{
  objc_super v3;

  atomic_store(0xFFFFFFFF, (unsigned int *)self->_outgoingShmem + 4);
  -[GTSharedMemoryTransport_replayer _tearDownSharedMemory](self, "_tearDownSharedMemory");
  v3.receiver = self;
  v3.super_class = (Class)GTSharedMemoryTransport_replayer;
  -[GTBaseStreamTransport_replayer _invalidate](&v3, "_invalidate");
}

- (unint64_t)_computeBytesAvailableToWrite
{
  unsigned int v2;
  unsigned int v3;
  unsigned int *outgoingShmem;
  unsigned int v5;
  unsigned int v6;
  unsigned int v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;

  v2 = atomic_load((unsigned int *)self->_outgoingShmem + 5);
  v3 = atomic_load((unsigned int *)self->_outgoingShmem + 4);
  outgoingShmem = (unsigned int *)self->_outgoingShmem;
  if (v2 >= v3)
  {
    v8 = atomic_load(outgoingShmem + 4);
    v9 = (unsigned int *)self->_outgoingShmem;
    if (v2 == v8)
    {
      v10 = atomic_load(v9 + 2);
      v11 = atomic_load((unsigned int *)self->_outgoingShmem + 1);
      if (v10 == v11)
        return *((_DWORD *)self->_outgoingShmem + 7);
      else
        return 0;
    }
    else
    {
      v12 = atomic_load(v9 + 4);
      return v2 - v12;
    }
  }
  else
  {
    v5 = outgoingShmem[7];
    v6 = atomic_load(outgoingShmem + 4);
    return v5 + v2 - v6;
  }
}

- (unint64_t)_computeBytesAvailableToRead
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int *incomingShmem;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;

  v2 = atomic_load((unsigned int *)self->_incomingShmem + 4);
  v3 = atomic_load((unsigned int *)self->_incomingShmem + 5);
  v4 = atomic_load((unsigned int *)self->_incomingShmem + 5);
  if (v3 >= v2)
  {
    incomingShmem = (unsigned int *)self->_incomingShmem;
    if (v2 == v4)
    {
      v7 = atomic_load(incomingShmem + 2);
      v8 = atomic_load((unsigned int *)self->_incomingShmem + 1);
      if (v7 == v8)
        return 0;
      else
        return *((_DWORD *)self->_incomingShmem + 7);
    }
    else
    {
      v9 = incomingShmem[7];
      v10 = atomic_load(incomingShmem + 5);
      return v9 + v2 - v10;
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
  unsigned int *outgoingShmem;
  unint64_t v8;

  v6 = atomic_load((unsigned int *)self->_outgoingShmem + 4);
  memcpy((char *)self->_outgoingBuffer + v6, a3, a4);
  outgoingShmem = (unsigned int *)self->_outgoingShmem;
  v8 = outgoingShmem[7];
  if (v6 + a4 < v8)
    LODWORD(v8) = 0;
  atomic_store(v6 + a4 - v8, outgoingShmem + 4);
}

- (void)_waitEAGAIN
{
  unsigned int v3;

  v3 = 0;
  do
  {
    usleep(0xC8u);
    if (-[GTSharedMemoryTransport_replayer _computeBytesAvailableToRead](self, "_computeBytesAvailableToRead") > 4)
      break;
  }
  while (v3++ < 4);
}

- (int64_t)_write:(const void *)a3 size:(unint64_t)a4
{
  unint64_t v4;
  unsigned int v7;
  unint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  int v12;

  v4 = a4;
  if (a4)
  {
    v7 = atomic_load((unsigned int *)&self->super.super._invalid);
    atomic_store(v7, (unsigned int *)self->_outgoingShmem);
    v8 = -[GTSharedMemoryTransport_replayer _computeBytesAvailableToWrite](self, "_computeBytesAvailableToWrite");
    if (v8 > 4)
    {
      if (v8 - 4 < v4)
        v4 = v8 - 4;
      v12 = v4 + 4;
      -[GTSharedMemoryTransport_replayer _copyToSM:size:](self, "_copyToSM:size:", &v12, 4);
      -[GTSharedMemoryTransport_replayer _copyToSM:size:](self, "_copyToSM:size:", a3, v4);
      v9 = (unsigned int *)((char *)self->_outgoingShmem + 4);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 + 1, v9));
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
  unsigned int *v2;
  unsigned int v3;
  unsigned int result;

  v2 = (unsigned int *)((char *)self->_masterSMRegion + 12);
  do
  {
    v3 = __ldaxr(v2);
    result = v3 + 1;
  }
  while (__stlxr(v3 + 1, v2));
  return result;
}

- (void)_updateReaderOffset:(unint64_t)a3
{
  unsigned int *incomingShmem;
  unint64_t v4;

  incomingShmem = (unsigned int *)self->_incomingShmem;
  v4 = incomingShmem[7];
  if (v4 > a3)
    LODWORD(v4) = 0;
  atomic_store(a3 - v4, incomingShmem + 5);
}

- (void)_copyFromSM:(void *)a3 size:(unint64_t)a4
{
  uint64_t v6;

  v6 = atomic_load((unsigned int *)self->_incomingShmem + 5);
  memcpy(a3, (char *)self->_incomingBuffer + v6, a4);
  -[GTSharedMemoryTransport_replayer _updateReaderOffset:](self, "_updateReaderOffset:", v6 + a4);
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
    -[GTSharedMemoryTransport_replayer _copyFromSM:size:](self, "_copyFromSM:size:", a3, v6);
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
  while (self->_currentPacketBytesLeft
       && -[GTBaseStreamTransport_replayer _readAndAccumulate](self, "_readAndAccumulate") > 0)
    ;
}

- (void)_relayPacket
{
  char *incomingBuffer;
  uint64_t v4;
  unsigned int v5;

  incomingBuffer = (char *)self->_incomingBuffer;
  v4 = atomic_load((unsigned int *)self->_incomingShmem + 5);
  -[GTBaseStreamTransport_replayer _relayBuffer:size:](self->_relayTransport, "_relayBuffer:size:", &incomingBuffer[v4], self->_currentPacketBytesLeft);
  v5 = atomic_load((unsigned int *)self->_incomingShmem + 5);
  -[GTSharedMemoryTransport_replayer _updateReaderOffset:](self, "_updateReaderOffset:", self->_currentPacketBytesLeft + v5);
  self->_currentPacketBytesLeft = 0;
}

- (void)_dequeuePacket
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;

  v3 = -[GTSharedMemoryTransport_replayer _computeBytesAvailableToRead](self, "_computeBytesAvailableToRead");
  if (v3 <= 3)
  {
    v5 = objc_autoreleasePoolPush();
    -[GTBaseStreamTransport_replayer _scheduleInvalidation:](self, "_scheduleInvalidation:", +[GTError_replayer errorWithDomain:code:userInfo:](GTError_replayer, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 259, 0));
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v4 = v3;
    v7 = 0;
    -[GTSharedMemoryTransport_replayer _copyFromSM:size:](self, "_copyFromSM:size:", &v7, 4);
    if (v4 < v7)
    {
      v6 = objc_autoreleasePoolPush();
      -[GTBaseStreamTransport_replayer _scheduleInvalidation:](self, "_scheduleInvalidation:", +[GTError_replayer errorWithDomain:code:userInfo:](GTError_replayer, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 259, 0));
      objc_autoreleasePoolPop(v6);
    }
    else
    {
      self->_currentPacketBytesLeft = v7 - 4;
    }
  }
}

- (void)_dequeueIncomingMessages
{
  unsigned int v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  BOOL v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  BOOL v13;
  _BOOL4 v14;
  unsigned int v16;
  void *v17;

  v3 = 0;
  v4 = 3;
  v5 = 3;
  while (1)
  {
    while (1)
    {
      v6 = atomic_load((unsigned int *)self->_incomingShmem + 2);
      v7 = atomic_load((unsigned int *)self->_incomingShmem + 1);
      if (v6 == v7)
        break;
      if (atomic_load((unsigned int *)&self->super.super._invalid))
        v9 = v3 > 9;
      else
        v9 = 0;
      if (v9)
        goto LABEL_20;
      -[GTSharedMemoryTransport_replayer _dequeuePacket](self, "_dequeuePacket");
      if (!self->_currentPacketBytesLeft)
        return;
      ((void (*)(GTSharedMemoryTransport_replayer *, SEL))self->_consumeBytesIMP)(self, self->_consumeBytesSEL);
      if (self->_currentPacketBytesLeft)
        goto LABEL_23;
      v10 = (unsigned int *)((char *)self->_incomingShmem + 8);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 + 1, v10));
      ++v3;
    }
    v12 = atomic_load((unsigned int *)self->_incomingShmem);
    v13 = v5-- != 0;
    v14 = v13;
    if (!v12 || !v14)
      break;
    usleep(0xAu);
  }
LABEL_20:
  v16 = atomic_load((unsigned int *)self->_incomingShmem + 4);
  if (v16 != -1)
    return;
  v4 = 31;
LABEL_23:
  v17 = objc_autoreleasePoolPush();
  -[GTBaseStreamTransport_replayer _scheduleInvalidation:](self, "_scheduleInvalidation:", +[GTError_replayer errorWithDomain:code:userInfo:](GTError_replayer, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), v4, 0));
  objc_autoreleasePoolPop(v17);
}

- (BOOL)deferred
{
  return self->_deferred;
}

@end
