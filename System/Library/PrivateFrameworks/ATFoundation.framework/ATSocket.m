@implementation ATSocket

- (ATSocket)init
{
  ATSocket *v2;
  ATSocket *v3;
  char **p_writeBuffer;
  uint64_t v5;
  NSString *powerAssertionIdentifier;
  objc_class *v7;
  const char *Name;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  NSMutableArray *delegates;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ATSocket;
  v2 = -[ATSocket init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    p_writeBuffer = &v2->_writeBuffer;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.atc.%@"), v2);
    v5 = objc_claimAutoreleasedReturnValue();
    powerAssertionIdentifier = v3->_powerAssertionIdentifier;
    v3->_powerAssertionIdentifier = (NSString *)v5;

    *(_OWORD *)&v3->_socketMode = xmmword_1D1A14ED0;
    v7 = (objc_class *)objc_opt_class();
    Name = class_getName(v7);
    v9 = dispatch_queue_create(Name, 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v11 = objc_claimAutoreleasedReturnValue();
    delegates = v3->_delegates;
    v3->_delegates = (NSMutableArray *)v11;

    *p_writeBuffer = 0;
    v3->_transportUpdgradeExceptionCount = 0;
    v3->_writeBufferSize = 0;
    -[ATSocket setWriteBufferSize:](v3, "setWriteBufferSize:", 0x8000);
  }
  return v3;
}

- (void)dealloc
{
  char **p_writeBuffer;
  char *writeBuffer;
  objc_super v5;

  p_writeBuffer = &self->_writeBuffer;
  writeBuffer = self->_writeBuffer;
  if (writeBuffer)
  {
    free(writeBuffer);
    *p_writeBuffer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ATSocket;
  -[ATSocket dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, fd=%d>"), v5, self, self->_descriptor);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addDelegate:(id)a3
{
  ATSocket *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray addObject:](v4->_delegates, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeDelegate:(id)a3
{
  ATSocket *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray removeObject:](v4->_delegates, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (BOOL)open
{
  NSString **p_powerAssertionIdentifier;
  NSObject *v4;
  int v5;
  uint64_t v6;
  NSString *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *source;
  int v10;
  NSObject *v11;
  _QWORD handler[5];
  id v14;
  id v15;
  id from;
  id location;
  int v18;
  _BYTE buf[18];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_powerAssertionIdentifier = &self->_powerAssertionIdentifier;
  _ATLogCategoryFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = -[ATSocket socketMode](self, "socketMode");
    _os_log_impl(&dword_1D19F1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: opening with mode %d", buf, 0x12u);
  }

  v5 = *((_DWORD *)p_powerAssertionIdentifier + 4);
  if (v5)
  {
    CPSetPowerAssertionWithIdentifier();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4D108]), "initWithName:pid:subsystem:reason:flags:", *p_powerAssertionIdentifier, getpid(), CFSTR("com.apple.atc.ATSocket"), 2, 1);
    v7 = p_powerAssertionIdentifier[1];
    p_powerAssertionIdentifier[1] = (NSString *)v6;

    if (-[ATSocket socketMode](self, "socketMode") == 1)
    {
      v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DB8], *((int *)p_powerAssertionIdentifier + 4), 0, (dispatch_queue_t)p_powerAssertionIdentifier[6]);
      source = self->_source;
      self->_source = v8;

      v10 = fcntl(*((_DWORD *)p_powerAssertionIdentifier + 4), 3);
      fcntl(*((_DWORD *)p_powerAssertionIdentifier + 4), 4, v10 & 0xFFFFFFFB);
      v18 = 1;
      setsockopt(*((_DWORD *)p_powerAssertionIdentifier + 4), 0xFFFF, 1, &v18, 4u);
      *(_OWORD *)buf = xmmword_1D1A14EE0;
      setsockopt(*((_DWORD *)p_powerAssertionIdentifier + 4), 0xFFFF, 4101, buf, 0x10u);
      objc_initWeak(&location, self);
      objc_initWeak(&from, self->_source);
      v11 = self->_source;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __16__ATSocket_open__block_invoke;
      handler[3] = &unk_1E928C4C0;
      objc_copyWeak(&v14, &location);
      handler[4] = self;
      objc_copyWeak(&v15, &from);
      dispatch_source_set_event_handler(v11, handler);
      dispatch_resume((dispatch_object_t)self->_source);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  return v5 != 0;
}

- (void)close
{
  unint64_t *p_totalBytesSent;
  NSObject *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  NSObject *source;
  OS_dispatch_source *v9;
  int v10;
  ATSocket *v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_totalBytesSent = &self->_totalBytesSent;
  _ATLogCategoryFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *p_totalBytesSent;
    v6 = p_totalBytesSent[1];
    v10 = 138543874;
    v11 = self;
    v12 = 2048;
    v13 = v5;
    v14 = 2048;
    v15 = v6;
    _os_log_impl(&dword_1D19F1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: closing. totalBytesSent=%llu, totalReceived=%llu", (uint8_t *)&v10, 0x20u);
  }

  CPSetPowerAssertionWithIdentifier();
  if (objc_msgSend((id)p_totalBytesSent[3], "isValid"))
    objc_msgSend((id)p_totalBytesSent[3], "invalidate");
  v7 = (void *)p_totalBytesSent[3];
  p_totalBytesSent[3] = 0;

  source = self->_source;
  if (source)
  {
    dispatch_source_cancel(source);
    v9 = self->_source;
    self->_source = 0;

  }
  -[ATSocket closeDescriptor](self, "closeDescriptor");
  -[ATSocket notifySocketDidClose](self, "notifySocketDidClose");
}

- (void)closeDescriptor
{
  close(self->_descriptor);
  self->_descriptor = 0;
}

- (BOOL)isOpen
{
  return self->_descriptor != 0;
}

- (BOOL)writeAllData:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  BOOL v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__478;
  v18 = __Block_byref_object_dispose__479;
  queue = self->_queue;
  v19 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__ATSocket_writeAllData_error___block_invoke;
  block[3] = &unk_1E928CD60;
  block[4] = self;
  v8 = v6;
  v12 = v8;
  v13 = &v14;
  dispatch_sync(queue, block);
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v9 = v15[5] == 0;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)writeData:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ATSocket_writeData_withCompletion___block_invoke;
  block[3] = &unk_1E928CE78;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (int)send:(const char *)a3 offset:(unsigned int)a4 len:(unsigned int)a5 error:(id *)a6
{
  NSObject *queue;
  void *v8;
  int v9;
  _QWORD block[8];
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__478;
  v18 = __Block_byref_object_dispose__479;
  v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__ATSocket_send_offset_len_error___block_invoke;
  block[3] = &unk_1E928C4E8;
  block[4] = self;
  block[5] = &v20;
  v12 = a4;
  v13 = a5;
  block[6] = &v14;
  block[7] = a3;
  dispatch_sync(queue, block);
  if (a6)
  {
    v8 = (void *)v15[5];
    if (v8)
      *a6 = objc_retainAutorelease(v8);
  }
  v9 = *((_DWORD *)v21 + 6);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v9;
}

- (int)recv:(char *)a3 offset:(unsigned int)a4 len:(unsigned int)a5 error:(id *)a6
{
  unint64_t *p_totalBytesReceived;
  int descriptor;
  unsigned int v13;
  int v14;
  int v15;
  void *v16;
  uint64_t v17;
  timeval v19;
  fd_set v20;

  p_totalBytesReceived = &self->_totalBytesReceived;
  memset(&v20, 0, sizeof(v20));
  descriptor = self->_descriptor;
  if (__darwin_check_fd_set_overflow(descriptor, &v20, 0))
    *(__int32_t *)((char *)v20.fds_bits + (((unint64_t)descriptor >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << descriptor;
  v19 = (timeval)xmmword_1D1A14EF0;
  if (a5)
  {
    v13 = 0;
    while (1)
    {
      v14 = select(*((_DWORD *)p_totalBytesReceived + 6) + 1, &v20, 0, 0, &v19);
      if (v14)
      {
        if (v14 < 0)
        {
          +[ATInternalError errorWithPosixError:format:](ATInternalError, "errorWithPosixError:format:", *__error(), CFSTR("%@: select read failed"), self);
        }
        else
        {
          v15 = recv(*((_DWORD *)p_totalBytesReceived + 6), &a3[a4 + v13], a5 - v13, 0);
          if (v15 > 0)
          {
            v16 = 0;
            v13 += v15;
            *p_totalBytesReceived += v15;
            goto LABEL_14;
          }
          +[ATInternalError errorWithPosixError:format:](ATInternalError, "errorWithPosixError:format:", *__error(), CFSTR("%@: recv failed"), self);
        }
        v17 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[ATInternalError errorWithCode:format:](ATInternalError, "errorWithCode:format:", 2, CFSTR("%@: select read timed out"), self);
        v17 = objc_claimAutoreleasedReturnValue();
      }
      v16 = (void *)v17;
LABEL_14:
      if (v13 >= a5 || v16)
        goto LABEL_18;
    }
  }
  v16 = 0;
  v13 = 0;
LABEL_18:
  if (a6)
    *a6 = objc_retainAutorelease(v16);

  return v13;
}

- (id)flush
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__478;
  v10 = __Block_byref_object_dispose__479;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __17__ATSocket_flush__block_invoke;
  v5[3] = &unk_1E928CCA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)notifySocketDidClose
{
  ATSocket *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_delegates, "copy");
  objc_sync_exit(v2);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "socketDidClose:", v2, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)notifyHasDataAvailable:(const char *)a3 length:(int64_t)a4
{
  ATSocket *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  v7 = (void *)-[NSMutableArray copy](v6->_delegates, "copy");
  objc_sync_exit(v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "socket:hasDataAvailable:length:", v6, a3, a4, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)addTransportUpgradeException
{
  ++self->_transportUpdgradeExceptionCount;
}

- (void)removeTransportUpgradeException
{
  int transportUpdgradeExceptionCount;
  BOOL v3;
  int v4;

  transportUpdgradeExceptionCount = self->_transportUpdgradeExceptionCount;
  v3 = __OFSUB__(transportUpdgradeExceptionCount, 1);
  v4 = transportUpdgradeExceptionCount - 1;
  if (v4 < 0 == v3)
    self->_transportUpdgradeExceptionCount = v4;
}

- (void)setWriteBufferSize:(unsigned int)a3
{
  NSObject *queue;
  _QWORD v4[5];
  unsigned int v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__ATSocket_setWriteBufferSize___block_invoke;
  v4[3] = &unk_1E928CAA0;
  v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (int)_send:(const char *)a3 offset:(unsigned int)a4 len:(unsigned int)a5 error:(id *)a6
{
  unsigned int v9;
  char **p_writeBuffer;
  const char *v11;
  uint64_t v12;
  unsigned int v13;
  size_t v14;
  unsigned int v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v9 = 0;
    p_writeBuffer = &self->_writeBuffer;
    v11 = &a3[a4];
    while (1)
    {
      v12 = *((unsigned int *)p_writeBuffer + 2);
      v13 = *((_DWORD *)p_writeBuffer + 14) - v12;
      v14 = a5 - v9 >= v13 ? v13 : a5 - v9;
      memcpy(&(*p_writeBuffer)[v12], &v11[v9], v14);
      v15 = *((_DWORD *)p_writeBuffer + 2) + v14;
      *((_DWORD *)p_writeBuffer + 2) = v15;
      if (v15 >= *((_DWORD *)p_writeBuffer + 14))
      {
        -[ATSocket _flush](self, "_flush");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
          break;
      }
      v9 += v14;
      if (v9 >= a5)
        goto LABEL_11;
    }
    v18 = (id)v16;
    _ATLogCategoryFramework();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = 138543362;
      v22 = v18;
      _os_log_impl(&dword_1D19F1000, v19, OS_LOG_TYPE_ERROR, "failed to flush socket. err=%{public}@", (uint8_t *)&v21, 0xCu);
    }

    if (a6)
    {
      v17 = objc_retainAutorelease(v18);
      *a6 = v17;
LABEL_17:
      v18 = objc_retainAutorelease(v17);
      *a6 = v18;
    }
  }
  else
  {
    v9 = 0;
LABEL_11:
    v17 = 0;
    v18 = 0;
    if (a6)
      goto LABEL_17;
  }

  return v9;
}

- (id)_flush
{
  char **p_writeBuffer;
  int descriptor;
  unsigned int v5;
  int v6;
  int v7;
  void *v8;
  timeval v11;
  fd_set v12;

  p_writeBuffer = &self->_writeBuffer;
  memset(&v12, 0, sizeof(v12));
  descriptor = self->_descriptor;
  if (__darwin_check_fd_set_overflow(descriptor, &v12, 0))
    *(__int32_t *)((char *)v12.fds_bits + (((unint64_t)descriptor >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << descriptor;
  v11 = (timeval)xmmword_1D1A14EE0;
  if (*((_DWORD *)p_writeBuffer + 2))
  {
    v5 = 0;
    while (1)
    {
      v6 = select(*((_DWORD *)p_writeBuffer + 12) + 1, 0, &v12, 0, &v11);
      if (v6)
      {
        if (v6 < 0)
        {
          +[ATInternalError errorWithPosixError:format:](ATInternalError, "errorWithPosixError:format:", *__error(), CFSTR("%@: select write failed"), self);
LABEL_12:
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
        v7 = send(*((_DWORD *)p_writeBuffer + 12), &(*p_writeBuffer)[v5], *((_DWORD *)p_writeBuffer + 2) - v5, 0);
        if (v7 <= 0)
        {
          +[ATInternalError errorWithPosixError:format:](ATInternalError, "errorWithPosixError:format:", *__error(), CFSTR("%@: send failed"), self);
          goto LABEL_12;
        }
        v8 = 0;
        v5 += v7;
        p_writeBuffer[2] += v7;
      }
      else
      {
        +[ATInternalError errorWithCode:format:](ATInternalError, "errorWithCode:format:", 2, CFSTR("%@: select write timed out"), self);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
LABEL_13:
      if (v5 >= *((_DWORD *)p_writeBuffer + 2) || v8 != 0)
        goto LABEL_19;
    }
  }
  v8 = 0;
LABEL_19:
  *((_DWORD *)p_writeBuffer + 2) = 0;
  return v8;
}

- (ATSocket)initWithCoder:(id)a3
{
  id v4;
  ATSocket *v5;
  void *v6;
  ATSocket *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[ATSocket init](self, "init");
    if (v5)
    {
      objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81318], CFSTR("fd"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_descriptor = xpc_fd_dup(v6);

    }
    self = v5;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  xpc_object_t v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = xpc_fd_create(self->_descriptor);
    objc_msgSend(v5, "encodeXPCObject:forKey:", v4, CFSTR("fd"));

  }
}

- (int64_t)socketMode
{
  return self->_socketMode;
}

- (void)setSocketMode:(int64_t)a3
{
  self->_socketMode = a3;
}

- (unint64_t)suggestedBufferSize
{
  return self->_suggestedBufferSize;
}

- (void)setSuggestedBufferSize:(unint64_t)a3
{
  self->_suggestedBufferSize = a3;
}

- (int)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(int)a3
{
  self->_descriptor = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (int)transportUpdgradeExceptionCount
{
  return self->_transportUpdgradeExceptionCount;
}

- (unsigned)writeBufferSize
{
  return self->_writeBufferSize;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_taskAssertion, 0);
  objc_storeStrong((id *)&self->_powerAssertionIdentifier, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

void __31__ATSocket_setWriteBufferSize___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 40) != *(_DWORD *)(*(_QWORD *)(a1 + 32) + 65616))
  {
    _ATLogCategoryFramework();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_DWORD *)(a1 + 40);
      v9 = 67109120;
      LODWORD(v10) = v3;
      _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "setting writeBufferSize=%u", (uint8_t *)&v9, 8u);
    }

    if (objc_msgSend(*(id *)(a1 + 32), "isOpen")
      && (objc_msgSend(*(id *)(a1 + 32), "_flush"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v5 = (void *)v4;
      _ATLogCategoryFramework();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v9 = 138543362;
        v10 = v5;
        _os_log_impl(&dword_1D19F1000, v6, OS_LOG_TYPE_ERROR, "failed to flush socket. err=%{public}@", (uint8_t *)&v9, 0xCu);
      }

    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 65616) = *(_DWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 65560);
      if (v8)
      {
        free(v8);
        v7 = *(_QWORD *)(a1 + 32);
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 65560) = malloc_type_malloc(*(unsigned int *)(v7 + 65616), 0xED64CD1FuLL);
    }
  }
}

void __17__ATSocket_flush__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_flush");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __34__ATSocket_send_offset_len_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned int *)(a1 + 64);
  v4 = *(unsigned int *)(a1 + 68);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v2, "_send:offset:len:error:", v5, v3, v4, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
}

void __37__ATSocket_writeData_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  if (objc_msgSend(*(id *)(a1 + 32), "isOpen"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "length");
    v3 = *(void **)(a1 + 32);
    v4 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
    v5 = objc_msgSend(*(id *)(a1 + 40), "length");
    v9 = 0;
    LODWORD(v4) = objc_msgSend(v3, "_send:offset:len:error:", v4, 0, v5, &v9);
    v6 = v9;
    if (v2 != (int)v4)
      objc_msgSend(*(id *)(a1 + 32), "close");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    +[ATInternalError errorWithCode:format:](ATInternalError, "errorWithCode:format:", 3, CFSTR("socket closed"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);

  }
}

void __31__ATSocket_writeAllData_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  if (objc_msgSend(*(id *)(a1 + 32), "isOpen"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "length");
    v3 = *(void **)(a1 + 32);
    v4 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
    v5 = objc_msgSend(*(id *)(a1 + 40), "length");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v6 + 40);
    LODWORD(v3) = objc_msgSend(v3, "_send:offset:len:error:", v4, 0, v5, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    if (v2 != (int)v3)
      objc_msgSend(*(id *)(a1 + 32), "close");
  }
  else
  {
    +[ATInternalError errorWithCode:format:](ATInternalError, "errorWithCode:format:", 3, CFSTR("socket closed"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

void __16__ATSocket_open__block_invoke(uint64_t a1)
{
  id WeakRetained;
  ssize_t v3;
  ssize_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  ssize_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = read(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 65608), (void *)(*(_QWORD *)(a1 + 32) + 24), 0x10000uLL);
    v4 = v3;
    if (v3 < 1)
    {
      v5 = *__error();
      _ATLogCategoryFramework();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(_DWORD *)(v7 + 65608);
        v11 = 138544386;
        v12 = v7;
        v13 = 2048;
        v14 = v4;
        v15 = 1024;
        v16 = v8;
        v17 = 2080;
        v18 = strerror(v5);
        v19 = 1024;
        v20 = v5;
        _os_log_impl(&dword_1D19F1000, v6, OS_LOG_TYPE_ERROR, "%{public}@: read failed. bytesRead=%zd, fd=%d, err=%s (%d)", (uint8_t *)&v11, 0x2Cu);
      }

      v9 = objc_loadWeakRetained((id *)(a1 + 48));
      v10 = v9;
      if (v9)
        dispatch_source_cancel(v9);

    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 65584) += v3;
      objc_msgSend(WeakRetained, "notifyHasDataAvailable:length:", *(_QWORD *)(a1 + 32) + 24, v3);
    }
  }

}

+ (id)createBoundPair:(id)a3[2]
{
  void *v4;
  ATSocket *v5;
  ATSocket *v6;
  id v7;
  ATSocket *v8;
  id v9;
  int v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (socketpair(1, 1, 0, v11))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init(ATSocket);
    v6 = objc_alloc_init(ATSocket);
    -[ATSocket setDescriptor:](v5, "setDescriptor:", v11[0]);
    -[ATSocket setDescriptor:](v6, "setDescriptor:", v11[1]);
    v7 = *a3;
    *a3 = v5;
    v8 = v5;

    v9 = a3[1];
    a3[1] = v6;

    v4 = 0;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
