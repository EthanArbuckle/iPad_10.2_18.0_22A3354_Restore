@implementation __NSCFURLLocalStreamTaskFromDataTask

- (__NSCFURLLocalStreamTaskFromDataTask)initWithTask:(id)a3 disavow:(id)a4
{
  __NSCFURLLocalStreamTaskFromDataTask *v4;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)__NSCFURLLocalStreamTaskFromDataTask;
  v4 = -[__NSCFURLLocalStreamTask _initWithExistingTask:disavow:](&v7, sel__initWithExistingTask_disavow_, a3, a4);
  if (v4)
  {
    v4->_myWriteToHisReadWork = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61____NSCFURLLocalStreamTaskFromDataTask_initWithTask_disavow___block_invoke;
    v6[3] = &unk_1E14FE118;
    v6[4] = v4;
    -[NSMutableArray addObject:](v4->super._pendingWork, "addObject:", +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v6, (uint64_t)"init_with_task"));
  }
  return v4;
}

- (__NSCFURLLocalStreamTaskFromDataTask)initWithTask:(id)a3 remainingInputStream:(id)a4 remainingOutputStream:(id)a5 disavow:(id)a6
{
  __NSCFURLLocalStreamTaskFromDataTask *v8;
  _QWORD v10[7];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)__NSCFURLLocalStreamTaskFromDataTask;
  v8 = -[__NSCFURLLocalStreamTask _initWithExistingTask:disavow:](&v11, sel__initWithExistingTask_disavow_, a3, a6);
  if (v8)
  {
    v8->_myWriteToHisReadWork = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __104____NSCFURLLocalStreamTaskFromDataTask_initWithTask_remainingInputStream_remainingOutputStream_disavow___block_invoke;
    v10[3] = &unk_1E14FE1E0;
    v10[4] = a4;
    v10[5] = a5;
    v10[6] = v8;
    -[NSMutableArray addObject:](v8->super._pendingWork, "addObject:", +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v10, (uint64_t)"init_with_task"));
  }
  return v8;
}

- (__NSCFURLLocalStreamTaskFromDataTask)initWithTask:(id)a3 inputStream:(id)a4 ouptutStream:(id)a5 disavow:(id)a6
{
  id *v8;
  __NSCFURLLocalStreamTaskFromDataTask *v9;
  _QWORD v11[7];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)__NSCFURLLocalStreamTaskFromDataTask;
  v8 = -[__NSCFURLLocalStreamTask _initWithExistingTask:disavow:](&v12, sel__initWithExistingTask_disavow_, a3, a6);
  v9 = (__NSCFURLLocalStreamTaskFromDataTask *)v8;
  if (v8)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __86____NSCFURLLocalStreamTaskFromDataTask_initWithTask_inputStream_ouptutStream_disavow___block_invoke;
    v11[3] = &unk_1E14FE1E0;
    v11[4] = v8;
    v11[5] = a4;
    v11[6] = a5;
    objc_msgSend(v8[101], "addObject:", +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v11, (uint64_t)"init_with_task_with_socket_streams"));
  }
  return v9;
}

- (void)dealloc
{
  NSMutableArray *myWriteToHisReadWork;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void (**v9)(_QWORD);
  __CFReadStream *myReadToHisWrite;
  __CFWriteStream *myWriteToHisRead;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  myWriteToHisReadWork = self->_myWriteToHisReadWork;
  if (myWriteToHisReadWork)
  {
    self->_myWriteToHisReadWork = 0;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](myWriteToHisReadWork, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(myWriteToHisReadWork);
          v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (v8)
          {
            v9 = *(void (***)(_QWORD))(v8 + 16);
            if (v9)
            {
              *(_QWORD *)(v8 + 16) = 0;
              v9[2](v9);
              _Block_release(v9);
            }
          }
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](myWriteToHisReadWork, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }

  }
  myReadToHisWrite = self->_myReadToHisWrite;
  self->_myReadToHisWrite = 0;
  if (myReadToHisWrite)
    CFRelease(myReadToHisWrite);
  myWriteToHisRead = self->_myWriteToHisRead;
  self->_myWriteToHisRead = 0;
  if (myWriteToHisRead)
    CFRelease(myWriteToHisRead);
  v12.receiver = self;
  v12.super_class = (Class)__NSCFURLLocalStreamTaskFromDataTask;
  -[__NSCFURLLocalStreamTask dealloc](&v12, sel_dealloc);
}

- (void)connection:(id)a3 wasRedirected:(id)a4 newRequest:(id)a5 responseCallback:(id)a6
{
  -[__NSCFURLLocalStreamTaskFromDataTask _unimp:]((uint64_t)self, (uint64_t)"-[__NSCFURLLocalStreamTaskFromDataTask connection:wasRedirected:newRequest:responseCallback:]");
  (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamCallback:(id)a5
{
  -[__NSCFURLLocalStreamTaskFromDataTask _unimp:]((uint64_t)self, (uint64_t)"-[__NSCFURLLocalStreamTaskFromDataTask connection:request:needsNewBodyStreamCallback:]");
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamFromOffset:(int64_t)a5 callback:(id)a6
{
  -[__NSCFURLLocalStreamTaskFromDataTask _unimp:]((uint64_t)self, (uint64_t)"-[__NSCFURLLocalStreamTaskFromDataTask connection:request:needsNewBodyStreamFromOffset:callback:]");
  (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

- (void)connection:(id)a3 didReceiveInformationalResponse:(id)a4
{
  -[__NSCFURLLocalStreamTaskFromDataTask _unimp:]((uint64_t)self, (uint64_t)"-[__NSCFURLLocalStreamTaskFromDataTask connection:didReceiveInformationalResponse:]");
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4 completion:(id)a5
{
  __int128 v6;
  uint64_t v7;

  -[__NSCFURLLocalStreamTaskFromDataTask _unimp:]((uint64_t)self, (uint64_t)"-[__NSCFURLLocalStreamTaskFromDataTask connection:didReceiveResponse:completion:]");
  v7 = 0;
  v6 = xmmword_18411E3A8;
  (*((void (**)(id, __int128 *))a5 + 2))(a5, &v6);
}

- (void)connection:(id)a3 willCacheResponse:(id)a4 responseCallback:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)connection:(id)a3 didFinishLoadingWithError:(id)a4
{
  NSObject *v6;
  _QWORD v7[6];

  v6 = -[__NSCFURLLocalStreamTask workQueue](self, "workQueue", a3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77____NSCFURLLocalStreamTaskFromDataTask_connection_didFinishLoadingWithError___block_invoke;
  v7[3] = &unk_1E14FDE88;
  v7[4] = self;
  v7[5] = a4;
  dispatch_async(v6, v7);
}

- (void)connection:(id)a3 challenged:(id)a4 authCallback:(id)a5
{
  -[__NSCFURLLocalStreamTaskFromDataTask _unimp:]((uint64_t)self, (uint64_t)"-[__NSCFURLLocalStreamTaskFromDataTask connection:challenged:authCallback:]");
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 2, 0);
}

- (void)connection:(id)a3 didReceiveData:(id)a4 completion:(id)a5
{
  NSObject *v8;
  _QWORD block[7];

  if (a4 && dispatch_data_get_size((dispatch_data_t)a4))
  {
    dispatch_retain((dispatch_object_t)a4);
    v8 = -[__NSCFURLLocalStreamTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77____NSCFURLLocalStreamTaskFromDataTask_connection_didReceiveData_completion___block_invoke;
    block[3] = &unk_1E14FE070;
    block[5] = self;
    block[6] = a5;
    block[4] = a4;
    dispatch_async(v8, block);
  }
  else
  {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (void)connection:(id)a3 sentBodyBytes:(id)a4 totalBytes:(id)a5 expectedBytes:(id)a6
{
  -[__NSCFURLLocalStreamTaskFromDataTask _unimp:]((uint64_t)self, (uint64_t)"-[__NSCFURLLocalStreamTaskFromDataTask connection:sentBodyBytes:totalBytes:expectedBytes:]");
}

- (void)connection:(id)a3 _willSendRequestForEstablishedConnection:(id)a4 completion:(id)a5
{
  -[__NSCFURLLocalStreamTaskFromDataTask _unimp:]((uint64_t)self, (uint64_t)"-[__NSCFURLLocalStreamTaskFromDataTask connection:_willSendRequestForEstablishedConnection:completion:]");
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)connection:(id)a3 waitingWithReason:(int64_t)a4
{
  -[__NSCFURLLocalStreamTaskFromDataTask _unimp:]((uint64_t)self, (uint64_t)"-[__NSCFURLLocalStreamTaskFromDataTask connection:waitingWithReason:]");
}

- (void)connection:(id)a3 _conditionalRequirementsChanged:(BOOL)a4
{
  -[__NSCFURLLocalStreamTaskFromDataTask _unimp:]((uint64_t)self, (uint64_t)"-[__NSCFURLLocalStreamTaskFromDataTask connection:_conditionalRequirementsChanged:]");
}

- (void)connection:(id)a3 alternatePathAvailable:(int)a4
{
  -[__NSCFURLLocalStreamTaskFromDataTask _unimp:]((uint64_t)self, (uint64_t)"-[__NSCFURLLocalStreamTaskFromDataTask connection:alternatePathAvailable:]");
}

- (void)connection:(id)a3 didReceiveSocketInputStream:(id)a4 outputStream:(id)a5
{
  NSObject *v5;
  uint8_t v6[16];

  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v5 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_183ECA000, v5, OS_LOG_TYPE_ERROR, "NSURLSessionStreamTask: received streams out of order", v6, 2u);
  }
}

- (void)connection:(id)a3 didReceiveTCPConnection:(shared_ptr<TransportConnection>)a4 extraBytes:(id)a5
{
  abort();
}

- (id)copyWithZone:(_NSZone *)a3
{
  __NSCFURLLocalStreamTaskFromDataTask *v4;

  v4 = self;
  return self;
}

- (void)_unimp:(uint64_t)a1
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v3 = 136315138;
      v4 = a2;
      _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%s should not be called at this point for a stream task that turned into a data task.", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)_onqueue_ioTickFromDataTaskConversion:(uint64_t)a1
{
  _QWORD v3[5];

  if (a1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __78____NSCFURLLocalStreamTaskFromDataTask__onqueue_ioTickFromDataTaskConversion___block_invoke;
    v3[3] = &unk_1E14FE118;
    v3[4] = a1;
    objc_msgSend(*(id *)(a1 + 768), "addObject:", +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v3, a2));
    -[__NSCFURLLocalStreamTask _onqueue_ioTick](a1);
  }
}

@end
