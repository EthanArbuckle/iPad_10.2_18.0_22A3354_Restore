@implementation MFStream

+ (id)networkThread
{
  void *v2;
  void *v3;
  id v4;
  pthread_t v6;
  pthread_attr_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&NetworkThreadLock);
  v2 = (void *)NetworkThread;
  if (!NetworkThread)
  {
    v6 = 0;
    memset(&v7, 0, sizeof(v7));
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    pthread_attr_init(&v7);
    pthread_attr_setdetachstate(&v7, 2);
    pthread_create(&v6, &v7, (void *(__cdecl *)(void *))_MFSocketNetworkThread, v3);
    objc_msgSend(v3, "lockWhenCondition:", 1);
    objc_msgSend(v3, "unlock");

    v2 = (void *)NetworkThread;
  }
  v4 = v2;
  pthread_mutex_unlock(&NetworkThreadLock);
  return v4;
}

+ (void)setNetworkThread:(id)a3
{
  if (!NetworkThread)
  {
    pthread_mutex_lock(&NetworkThreadLock);
    if (!NetworkThread)
      NetworkThread = (uint64_t)a3;
    pthread_mutex_unlock(&NetworkThreadLock);
  }
}

+ (id)_networkDispatchQueue
{
  id result;
  void *v5;
  uint64_t v6;
  void *v7;

  result = (id)_networkDispatchQueue_NetworkDispatchQueue;
  if (!_networkDispatchQueue_NetworkDispatchQueue)
  {
    v5 = (void *)objc_msgSend((id)objc_opt_class(), "networkThread");
    if ((objc_msgSend(v5, "isEqual:", objc_msgSend(MEMORY[0x1E0CB3978], "currentThread")) & 1) != 0)
    {
      result = dispatch_queue_create("MFStreamDispatchQueue", 0);
      _networkDispatchQueue_NetworkDispatchQueue = (uint64_t)result;
    }
    else
    {
      v6 = objc_msgSend(a1, "methodSignatureForSelector:", a2);
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v6);
      objc_msgSend(v7, "setTarget:", a1);
      objc_msgSend(v7, "setSelector:", a2);
      objc_msgSend(v7, "performSelector:onThread:withObject:waitUntilDone:", sel_invoke, v5, 0, 1);
      return (id)_networkDispatchQueue_NetworkDispatchQueue;
    }
  }
  return result;
}

- (id)initCallBack:(id)a3 onDispatchQueue:(id)a4
{
  MFStream *v6;
  id v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  MFStream *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)MFStream;
  v6 = -[MFStream init](&v10, sel_init);
  if (v6)
  {
    if (a4)
      dispatch_retain((dispatch_object_t)a4);
    else
      a4 = dispatch_queue_create(0, 0);
    v6->_location = (OS_dispatch_queue *)a4;
    if (a3)
      v7 = a3;
    else
      v7 = &__block_literal_global;
    v6->_callback = _Block_copy(v7);
    v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v12 = v6;
      _os_log_impl(&dword_1C8839000, v8, OS_LOG_TYPE_INFO, "#Streams (%p) created", buf, 0xCu);
    }
    v6->_condition = (NSCondition *)objc_alloc_init(MEMORY[0x1E0CB3530]);
  }
  return v6;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12(&dword_1C8839000, v0, v1, "#Streams (%p) deallocated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (BOOL)isOpen
{
  if (self->_length)
    return 1;
  if (self->_rStream)
    return self->_wStream != 0;
  return 0;
}

- (id)_copyPropertyForKey:(id)a3
{
  void *v6;
  NSMutableDictionary *properties;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v13 = 0;
  v14 = a3;
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "networkThread");
  if ((objc_msgSend(v6, "isEqual:", objc_msgSend(MEMORY[0x1E0CB3978], "currentThread")) & 1) != 0)
  {
    properties = self->_properties;
    if (properties)
      return (id)-[NSMutableDictionary objectForKey:](properties, "objectForKey:", a3);
    v11 = (void *)-[NSInputStream propertyForKey:](self->_rStream, "propertyForKey:", a3);
    if (!v11)
      v11 = (void *)-[NSOutputStream propertyForKey:](self->_wStream, "propertyForKey:", a3);
    v12 = v11;
  }
  else
  {
    v9 = -[MFStream methodSignatureForSelector:](self, "methodSignatureForSelector:", a2);
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v9);
    objc_msgSend(v10, "setTarget:", self);
    objc_msgSend(v10, "setSelector:", a2);
    objc_msgSend(v10, "setArgument:atIndex:", &v14, 2);
    objc_msgSend(v10, "performSelector:onThread:withObject:waitUntilDone:", sel_invoke, v6, 0, 1);
    objc_msgSend(v10, "getReturnValue:", &v13);
    return v13;
  }
  return v11;
}

- (id)propertyForKey:(id)a3
{
  return -[MFStream _copyPropertyForKey:](self, "_copyPropertyForKey:", a3);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  void *v8;
  void *rStream;
  int v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  NSMutableDictionary *properties;
  NSObject *v17;
  char v18;
  id v19;
  id v20;
  uint8_t buf[4];
  MFStream *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v19 = a4;
  v20 = a3;
  v18 = 1;
  v8 = (void *)objc_msgSend((id)objc_opt_class(), "networkThread");
  if ((objc_msgSend(v8, "isEqual:", objc_msgSend(MEMORY[0x1E0CB3978], "currentThread")) & 1) != 0)
  {
    rStream = self->_rStream;
    if (rStream || (rStream = self->_wStream) != 0)
    {
      v10 = objc_msgSend(rStream, "setProperty:forKey:", a3, a4);
      v11 = MFLogGeneral();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = "out";
        *(_DWORD *)buf = 134218498;
        v22 = self;
        if (v10)
          v12 = "";
        v23 = 2112;
        v24 = a4;
        v25 = 2080;
        v26 = v12;
        _os_log_debug_impl(&dword_1C8839000, v11, OS_LOG_TYPE_DEBUG, "#Streams (%p) set property %@ with%s success", buf, 0x20u);
      }
    }
    else
    {
      properties = self->_properties;
      if (!properties)
      {
        properties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        self->_properties = properties;
      }
      -[NSMutableDictionary setValue:forKey:](properties, "setValue:forKey:", a3, a4);
      v17 = MFLogGeneral();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[MFStream setProperty:forKey:].cold.1();
      LOBYTE(v10) = 1;
    }
  }
  else
  {
    v13 = -[MFStream methodSignatureForSelector:](self, "methodSignatureForSelector:", a2);
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v13);
    objc_msgSend(v14, "setTarget:", self);
    objc_msgSend(v14, "setSelector:", a2);
    objc_msgSend(v14, "setArgument:atIndex:", &v20, 2);
    objc_msgSend(v14, "setArgument:atIndex:", &v19, 3);
    objc_msgSend(v14, "performSelector:onThread:withObject:waitUntilDone:", sel_invoke, v8, 0, 1);
    objc_msgSend(v14, "getReturnValue:", &v18);
    LOBYTE(v10) = v18 != 0;
  }
  return v10;
}

- (void)openToHostName:(id)a3 port:(int64_t)a4
{
  void *v8;
  NSObject *v9;
  uint64_t v10;
  const __CFString *v11;
  NSMutableDictionary *properties;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  int64_t v25;
  id v26;
  _BYTE v27[128];
  _QWORD v28[3];
  _QWORD v29[3];
  uint8_t buf[4];
  MFStream *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v25 = a4;
  v26 = a3;
  v8 = (void *)objc_msgSend((id)objc_opt_class(), "networkThread");
  if ((objc_msgSend(v8, "isEqual:", objc_msgSend(MEMORY[0x1E0CB3978], "currentThread")) & 1) != 0)
  {
    if (self->_rStream || self->_wStream)
      -[MFStream openToHostName:port:].cold.1();
    v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      v31 = self;
      v32 = 2112;
      v33 = a3;
      v34 = 2048;
      v35 = a4;
      _os_log_impl(&dword_1C8839000, v9, OS_LOG_TYPE_INFO, "#Streams Opening stream (%p) to %@:%ld", buf, 0x20u);
    }
    v28[0] = CFSTR("stream");
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self);
    v11 = &stru_1E81CBE50;
    if (a3)
      v11 = (const __CFString *)a3;
    v29[0] = v10;
    v29[1] = v11;
    v28[1] = CFSTR("host");
    v28[2] = CFSTR("port");
    v29[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    +[MFPowerController powerlog:eventData:](MFPowerController, "powerlog:eventData:", CFSTR("StreamOpen"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3));

    self->_error = 0;
    -[MFStream _createPairWithSocketToHostName:port:](self, "_createPairWithSocketToHostName:port:", a3, a4);
    -[NSInputStream setDelegate:](self->_rStream, "setDelegate:", self);
    -[NSOutputStream setDelegate:](self->_wStream, "setDelegate:", self);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    properties = self->_properties;
    v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](properties, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(properties);
          -[NSInputStream setProperty:forKey:](self->_rStream, "setProperty:forKey:", -[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        }
        v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](properties, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v14);
    }

    self->_properties = 0;
    v17 = objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v18 = *MEMORY[0x1E0C99748];
    -[NSInputStream scheduleInRunLoop:forMode:](self->_rStream, "scheduleInRunLoop:forMode:", v17, *MEMORY[0x1E0C99748]);
    -[NSOutputStream scheduleInRunLoop:forMode:](self->_wStream, "scheduleInRunLoop:forMode:", v17, v18);
    -[NSInputStream open](self->_rStream, "open");
    -[NSOutputStream open](self->_wStream, "open");
  }
  else
  {
    v19 = -[MFStream methodSignatureForSelector:](self, "methodSignatureForSelector:", a2);
    v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v19);
    objc_msgSend(v20, "setTarget:", self);
    objc_msgSend(v20, "setSelector:", a2);
    objc_msgSend(v20, "retainArguments");
    objc_msgSend(v20, "setArgument:atIndex:", &v26, 2);
    objc_msgSend(v20, "setArgument:atIndex:", &v25, 3);
    objc_msgSend(v20, "performSelector:onThread:withObject:waitUntilDone:", sel_invoke, v8, 0, 0);
  }
}

- (void)_createPairWithSocketToHostName:(id)a3 port:(int64_t)a4
{
  CFStreamCreatePairWithSocketToHost((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)a3, a4, (CFReadStreamRef *)&self->_rStream, (CFWriteStreamRef *)&self->_wStream);
}

- (void)_closeAndReleaseStream:(id)a3 logMessage:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[3];
  _QWORD v11[3];
  uint8_t buf[4];
  MFStream *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "setDelegate:", 0);
    v7 = objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    objc_msgSend(a3, "removeFromRunLoop:forMode:", v7, *MEMORY[0x1E0C99748]);
    objc_msgSend(a3, "close");

    if (a4)
    {
      v8 = MFLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v13 = self;
        v14 = 2112;
        v15 = a4;
        _os_log_impl(&dword_1C8839000, v8, OS_LOG_TYPE_INFO, "#Streams (%p) %@", buf, 0x16u);
      }
    }
    if (!self->_rStream && !self->_wStream)
    {
      v9 = MFLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v13 = self;
        _os_log_impl(&dword_1C8839000, v9, OS_LOG_TYPE_INFO, "#Streams (%p) has closed", buf, 0xCu);
      }
      v10[0] = CFSTR("stream");
      v11[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self);
      v10[1] = CFSTR("rx");
      v11[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bytesRead);
      v10[2] = CFSTR("tx");
      v11[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bytesWritten);
      +[MFPowerController powerlog:eventData:](MFPowerController, "powerlog:eventData:", CFSTR("StreamClose"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3));
    }
  }
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  void *v8;
  unint64_t length;
  unint64_t v10;
  char *buffer;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *location;
  _QWORD *v19;
  const __CFString *v20;
  NSObject *v21;
  NSError *error;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  _QWORD block[6];
  _QWORD v28[5];
  unint64_t v29;
  char *v30;
  _BYTE buf[12];
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v29 = a4;
  v30 = a3;
  v8 = (void *)objc_msgSend((id)objc_opt_class(), "networkThread");
  if ((objc_msgSend(v8, "isEqual:", objc_msgSend(MEMORY[0x1E0CB3978], "currentThread")) & 1) != 0)
  {
    length = self->_length;
    if (length)
    {
      if (a4 >= length)
        v10 = self->_length;
      else
        v10 = a4;
      memmove(a3, self->_buffer, v10);
      buffer = self->_buffer;
      v12 = self->_length - v10;
      self->_length = v12;
      memmove(buffer, &buffer[v10], v12);
      v13 = MFLogGeneral();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[MFStream read:maxLength:].cold.2();
      self->_bytesRead += v10;
      self->_dispatchedBytesAvailable = 0;
      if (!self->_streamCanRead)
      {
        if (self->_length)
        {
          v17 = MFLogGeneral();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            -[MFStream read:maxLength:].cold.1();
          self->_dispatchedBytesAvailable = 1;
          location = self->_location;
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __27__MFStream_read_maxLength___block_invoke;
          v28[3] = &unk_1E81C9B98;
          v28[4] = self;
          v19 = v28;
        }
        else
        {
          if (-[MFStream isOpen](self, "isOpen"))
            return v10;
          if (self->_error)
            v20 = CFSTR("MFStreamEventErrorOccurred");
          else
            v20 = CFSTR("MFStreamEventEndEncountered");
          v21 = MFLogGeneral();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            error = self->_error;
            if (error)
              v24 = CFSTR(" error: ");
            else
              v24 = &stru_1E81CBE50;
            v25 = -[NSError ef_publicDescription](error, "ef_publicDescription");
            *(_DWORD *)buf = 134218754;
            if (v25)
              v26 = (const __CFString *)v25;
            else
              v26 = &stru_1E81CBE50;
            *(_QWORD *)&buf[4] = self;
            v32 = 2112;
            v33 = v20;
            v34 = 2112;
            v35 = v24;
            v36 = 2114;
            v37 = v26;
            _os_log_error_impl(&dword_1C8839000, v21, OS_LOG_TYPE_ERROR, "#Streams (%p) dispatching %@%@%{public}@", buf, 0x2Au);
          }
          location = self->_location;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __27__MFStream_read_maxLength___block_invoke_47;
          block[3] = &unk_1E81C9BC0;
          block[4] = self;
          block[5] = v20;
          v19 = block;
        }
        dispatch_async(location, v19);
        return v10;
      }
      -[MFStream _readBytesFromStream](self, "_readBytesFromStream");
    }
    else
    {
      return -1;
    }
  }
  else
  {
    *(_QWORD *)buf = 0;
    v14 = (void *)MEMORY[0x1CAA35F10]();
    v15 = -[MFStream methodSignatureForSelector:](self, "methodSignatureForSelector:", a2);
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v15);
    objc_msgSend(v16, "setTarget:", self);
    objc_msgSend(v16, "setSelector:", a2);
    objc_msgSend(v16, "setArgument:atIndex:", &v30, 2);
    objc_msgSend(v16, "setArgument:atIndex:", &v29, 3);
    objc_msgSend(v16, "performSelector:onThread:withObject:waitUntilDone:", sel_invoke, v8, 0, 1);
    objc_msgSend(v16, "getReturnValue:", buf);
    objc_autoreleasePoolPop(v14);
    return *(_QWORD *)buf;
  }
  return v10;
}

uint64_t __27__MFStream_read_maxLength___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
}

uint64_t __27__MFStream_read_maxLength___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  void *v8;
  NSOutputStream *wStream;
  int64_t v10;
  NSObject *v11;
  NSOutputStream *v12;
  const __CFString *v13;
  NSObject *v14;
  NSObject *location;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSError *error;
  const __CFString *v22;
  uint64_t v23;
  const __CFString *v24;
  _QWORD v25[6];
  unint64_t v26;
  const char *v27;
  _BYTE buf[12];
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v26 = a4;
  v27 = a3;
  v8 = (void *)objc_msgSend((id)objc_opt_class(), "networkThread");
  if ((objc_msgSend(v8, "isEqual:", objc_msgSend(MEMORY[0x1E0CB3978], "currentThread")) & 1) != 0)
  {
    wStream = self->_wStream;
    if (wStream)
    {
      if (!self->_streamCanWrite)
        -[MFStream write:maxLength:].cold.1();
      self->_streamCanWrite = 0;
      v10 = -[NSOutputStream write:maxLength:](wStream, "write:maxLength:", a3, a4);
      v11 = MFLogGeneral();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[MFStream write:maxLength:].cold.2();
      self->_bytesWritten += v10;
      if (v10 < 0)
      {
        v12 = self->_wStream;
        self->_wStream = 0;
        if (!self->_error)
          self->_error = (NSError *)(id)-[NSOutputStream streamError](v12, "streamError");
        -[MFStream _closeAndReleaseStream:logMessage:](self, "_closeAndReleaseStream:logMessage:", v12, CFSTR("closed the write half"));
        if (!-[MFStream isOpen](self, "isOpen"))
        {
          if (self->_error)
            v13 = CFSTR("MFStreamEventErrorOccurred");
          else
            v13 = CFSTR("MFStreamEventEndEncountered");
          v14 = MFLogGeneral();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            error = self->_error;
            if (error)
              v22 = CFSTR(" error: ");
            else
              v22 = &stru_1E81CBE50;
            v23 = -[NSError ef_publicDescription](error, "ef_publicDescription");
            *(_DWORD *)buf = 134218754;
            if (v23)
              v24 = (const __CFString *)v23;
            else
              v24 = &stru_1E81CBE50;
            *(_QWORD *)&buf[4] = self;
            v29 = 2112;
            v30 = (unint64_t)v13;
            v31 = 2112;
            v32 = v22;
            v33 = 2114;
            v34 = v24;
            _os_log_error_impl(&dword_1C8839000, v14, OS_LOG_TYPE_ERROR, "#Streams (%p) dispatching %@%@%{public}@", buf, 0x2Au);
          }
          location = self->_location;
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __28__MFStream_write_maxLength___block_invoke;
          v25[3] = &unk_1E81C9BC0;
          v25[4] = self;
          v25[5] = v13;
          dispatch_async(location, v25);
        }
      }
    }
    else
    {
      v19 = MFLogGeneral();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = self;
        v29 = 2048;
        v30 = a4;
        _os_log_impl(&dword_1C8839000, v19, OS_LOG_TYPE_INFO, "#Streams (%p) no longer has an open write stream, aborting write of %lu bytes", buf, 0x16u);
      }
      return -1;
    }
  }
  else
  {
    *(_QWORD *)buf = 0;
    v16 = (void *)MEMORY[0x1CAA35F10]();
    v17 = -[MFStream methodSignatureForSelector:](self, "methodSignatureForSelector:", a2);
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v17);
    objc_msgSend(v18, "setTarget:", self);
    objc_msgSend(v18, "setSelector:", a2);
    objc_msgSend(v18, "setArgument:atIndex:", &v27, 2);
    objc_msgSend(v18, "setArgument:atIndex:", &v26, 3);
    objc_msgSend(v18, "performSelector:onThread:withObject:waitUntilDone:", sel_invoke, v8, 0, 1);
    objc_msgSend(v18, "getReturnValue:", buf);
    objc_autoreleasePoolPop(v16);
    return *(_QWORD *)buf;
  }
  return v10;
}

uint64_t __28__MFStream_write_maxLength___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
}

- (void)close
{
  void *v4;
  NSInputStream *rStream;
  NSOutputStream *wStream;
  uint64_t v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "networkThread");
  if ((objc_msgSend(v4, "isEqual:", objc_msgSend(MEMORY[0x1E0CB3978], "currentThread")) & 1) != 0)
  {
    *(_WORD *)&self->_streamCanRead = 0;
    rStream = self->_rStream;
    self->_rStream = 0;
    if (!self->_error)
      self->_error = (NSError *)(id)-[NSInputStream streamError](rStream, "streamError");
    -[MFStream _closeAndReleaseStream:logMessage:](self, "_closeAndReleaseStream:logMessage:", rStream, 0);
    wStream = self->_wStream;
    self->_wStream = 0;
    if (!self->_error)
      self->_error = (NSError *)(id)-[NSOutputStream streamError](wStream, "streamError");
    -[MFStream _closeAndReleaseStream:logMessage:](self, "_closeAndReleaseStream:logMessage:", wStream, 0);
    free(self->_buffer);
    self->_capacity = 0;
    self->_length = 0;
    self->_buffer = 0;
  }
  else
  {
    v7 = -[MFStream methodSignatureForSelector:](self, "methodSignatureForSelector:", a2);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v7);
    objc_msgSend(v8, "setTarget:", self);
    objc_msgSend(v8, "setSelector:", a2);
    objc_msgSend(v8, "performSelector:onThread:withObject:waitUntilDone:", sel_invoke, v4, 0, 1);
  }
}

- (void)_readBytesFromStream
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1(&dword_1C8839000, v0, v1, "#Streams (%p) bumped the buffer to %ld bytes", v2, v3);
  OUTLINED_FUNCTION_8();
}

uint64_t __32__MFStream__readBytesFromStream__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
}

uint64_t __32__MFStream__readBytesFromStream__block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  _QWORD *p_rStream;
  NSInputStream *rStream;
  __int128 v8;
  NSObject *v9;
  NSObject *location;
  _QWORD *v11;
  const __CFString *v12;
  const __CFString *v13;
  NSError *error;
  const __CFString *v15;
  NSObject *v16;
  NSError *v17;
  const __CFString *v18;
  uint64_t v19;
  const __CFString *v20;
  _QWORD block[6];
  _QWORD v22[5];
  uint8_t buf[4];
  MFStream *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  p_rStream = &self->_rStream;
  rStream = self->_rStream;
  if (rStream == a3 || self->_wStream == a3)
  {
    *((_QWORD *)&v8 + 1) = a4;
    *(_QWORD *)&v8 = a4 - 2;
    switch((unint64_t)(v8 >> 1))
    {
      case 0uLL:
        if (rStream != a3)
          -[MFStream stream:handleEvent:].cold.1();
        self->_streamCanRead = 1;
        -[MFStream _readBytesFromStream](self, "_readBytesFromStream");
        return;
      case 1uLL:
        self->_streamCanWrite = 1;
        v9 = MFLogGeneral();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[MFStream stream:handleEvent:].cold.2();
        location = self->_location;
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __31__MFStream_stream_handleEvent___block_invoke;
        v22[3] = &unk_1E81C9B98;
        v22[4] = self;
        v11 = v22;
        goto LABEL_23;
      case 3uLL:
        if (!self->_error)
          self->_error = (NSError *)(id)objc_msgSend(a3, "streamError");
        goto LABEL_11;
      case 7uLL:
LABEL_11:
        if (rStream == a3)
        {
          self->_streamCanRead = 0;
          v12 = CFSTR("read");
        }
        else
        {
          self->_streamCanWrite = 0;
          p_rStream = &self->_wStream;
          v12 = CFSTR("write");
        }
        *p_rStream = 0;
        v13 = CFSTR("error: ");
        if (self->_error)
        {
          error = self->_error;
        }
        else
        {
          v13 = CFSTR("ended");
          error = (NSError *)&stru_1E81CBE50;
        }
        -[MFStream _closeAndReleaseStream:logMessage:](self, "_closeAndReleaseStream:logMessage:", a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ stream %@%@"), v12, v13, error));
        if (!-[MFStream isOpen](self, "isOpen"))
        {
          if (self->_error)
            v15 = CFSTR("MFStreamEventErrorOccurred");
          else
            v15 = CFSTR("MFStreamEventEndEncountered");
          v16 = MFLogGeneral();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = self->_error;
            if (v17)
              v18 = CFSTR(" error: ");
            else
              v18 = &stru_1E81CBE50;
            v19 = -[NSError ef_publicDescription](v17, "ef_publicDescription");
            *(_DWORD *)buf = 134218754;
            if (v19)
              v20 = (const __CFString *)v19;
            else
              v20 = &stru_1E81CBE50;
            v24 = self;
            v25 = 2112;
            v26 = v15;
            v27 = 2112;
            v28 = v18;
            v29 = 2114;
            v30 = v20;
            _os_log_error_impl(&dword_1C8839000, v16, OS_LOG_TYPE_ERROR, "#Streams (%p) dispatching %@%@%{public}@", buf, 0x2Au);
          }
          location = self->_location;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __31__MFStream_stream_handleEvent___block_invoke_65;
          block[3] = &unk_1E81C9BC0;
          block[4] = self;
          block[5] = v15;
          v11 = block;
LABEL_23:
          dispatch_async(location, v11);
        }
        break;
      default:
        return;
    }
  }
}

uint64_t __31__MFStream_stream_handleEvent___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
}

uint64_t __31__MFStream_stream_handleEvent___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
}

- (NSError)streamError
{
  return self->_error;
}

- (void)setProperty:forKey:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_1(&dword_1C8839000, v0, v1, "#Streams (%p) set property %@");
  OUTLINED_FUNCTION_8();
}

- (void)openToHostName:port:.cold.1()
{
  __assert_rtn("-[MFStream openToHostName:port:]", "_NSSocket.m", 387, "(nil == _rStream) && (nil == _wStream)");
}

- (void)read:maxLength:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1(&dword_1C8839000, v0, v1, "#Streams (%p) dispatching MFStreamEventHasBytesAvailable (%ld)", v2, v3);
  OUTLINED_FUNCTION_8();
}

- (void)read:maxLength:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_1C8839000, v0, v1, "#Streams (%p) read %lu bytes", v2, v3);
  OUTLINED_FUNCTION_8();
}

- (void)write:maxLength:.cold.1()
{
  __assert_rtn("-[MFStream write:maxLength:]", "_NSSocket.m", 541, "_streamCanWrite");
}

- (void)write:maxLength:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_1C8839000, v0, v1, "#Streams (%p) wrote %ld bytes", v2, v3);
  OUTLINED_FUNCTION_8();
}

- (void)stream:handleEvent:.cold.1()
{
  __assert_rtn("-[MFStream stream:handleEvent:]", "_NSSocket.m", 720, "isReadStream");
}

- (void)stream:handleEvent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12(&dword_1C8839000, v0, v1, "#Streams (%p) dispatching MFStreamEventCanAcceptBytes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
