@implementation _MTLLogState

- (_MTLLogState)initWithDevice:(id)a3 descriptor:(id)a4 error:(id *)a5
{
  _MTLLogState *v8;
  _MTLLogState *v9;
  void *v10;
  void *v11;
  uint64_t *v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  MTLBuffer *v20;
  _DWORD *v21;
  unint64_t v22;
  int v23;
  void *v24;
  MTLResidencySet *logBufferResidencySet;
  void *v26;
  id v27;
  objc_super v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)_MTLLogState;
  v8 = -[_MTLLogState init](&v28, sel_init);
  v9 = v8;
  if (!v8)
    return v9;
  v27 = 0;
  v8->defaultLoggerCache = 0;
  v8->droppedMessages = 0;
  if (a4)
  {
    if (objc_msgSend(a4, "bufferSize") > 1023)
    {
      if (objc_msgSend(a4, "bufferSize") > 0x40000000 || objc_msgSend(a4, "bufferSize") == 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v35 = *MEMORY[0x1E0CB2D50];
        v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MTLLogState is not created: Maximum size is %ld bytes."), 0x40000000);
        v11 = (void *)MEMORY[0x1E0C99D80];
        v12 = &v36;
        v13 = &v35;
      }
      else
      {
        v9->_logBufferSize = objc_msgSend(a4, "bufferSize");
        v9->_logLevel = objc_msgSend(a4, "level");
        *(_QWORD *)&v9->_logHandlerLock._os_unfair_lock_opaque = 0;
        v20 = (MTLBuffer *)objc_msgSend(a3, "newBufferWithLength:options:", v9->_logBufferSize, 0);
        v9->_logBuffer = v20;
        if (v20)
        {
          -[MTLBuffer setLabel:](v20, "setLabel:", CFSTR("MTLLogBuffer"));
          v21 = (_DWORD *)-[MTLBuffer contents](v9->_logBuffer, "contents");
          *v21 = v9->_logBufferSize;
          v22 = v9->_logLevel - 1;
          if (v22 > 4)
            v23 = 0;
          else
            v23 = dword_1827FCE04[v22];
          v21[1] = v23;
          v24 = (void *)objc_opt_new();
          objc_msgSend(v24, "setInitialCapacity:", 1);
          objc_msgSend(v24, "setLabel:", CFSTR("MTLLogBufferResidencySet"));
          logBufferResidencySet = (MTLResidencySet *)objc_msgSend(a3, "newResidencySetWithDescriptor:error:", v24, &v27);
          v9->_logBufferResidencySet = logBufferResidencySet;
          if (!logBufferResidencySet)
          {
            v26 = (void *)MEMORY[0x1E0CB35C8];
            v31 = *MEMORY[0x1E0CB2D50];
            v32 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot create residency set for MTLLogState: %@"), objc_msgSend(v27, "localizedDescription"));
            v27 = (id)objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("MTLLogStateErrorDomain"), 2, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
            logBufferResidencySet = v9->_logBufferResidencySet;
          }
          -[MTLResidencySet addAllocation:](logBufferResidencySet, "addAllocation:", v9->_logBuffer);
          -[MTLResidencySet commit](v9->_logBufferResidencySet, "commit");

          v9->_handlers = 0;
          goto LABEL_11;
        }
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v33 = *MEMORY[0x1E0CB2D50];
        v34 = CFSTR("Cannot create MTLLogState");
        v11 = (void *)MEMORY[0x1E0C99D80];
        v12 = (uint64_t *)&v34;
        v13 = &v33;
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v37 = *MEMORY[0x1E0CB2D50];
      v38[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MTLLogState is not created: minimum size is %d bytes."), 1024);
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = v38;
      v13 = &v37;
    }
    v15 = objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
    v16 = v10;
    v17 = 1;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    v30 = CFSTR("MTLLogStateDescriptor is nil, MTLLogState is not created");
    v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v16 = v14;
    v17 = 2;
  }
  v27 = (id)objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("MTLLogStateErrorDomain"), v17, v15);
LABEL_11:
  v9->metalSubsystem = (NSString *)CFSTR("com.apple.Metal");
  v9->shaderLoggingCategory = (NSString *)CFSTR("Shader Logging");
  v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.Metal"), CFSTR("Shader Logging"));
  v9->metalLoggingKey = (NSString *)v18;
  -[_MTLLogState populateDefaultLoggerCache:subsystem:category:](v9, "populateDefaultLoggerCache:subsystem:category:", v18, v9->metalSubsystem, v9->shaderLoggingCategory);
  if (v27)
  {
    if (a5)
      *a5 = v27;

    return 0;
  }
  return v9;
}

- (void)addLogHandler:(id)a3
{
  os_unfair_lock_s *p_logHandlerLock;
  NSMutableArray *handlers;

  if (a3)
  {
    p_logHandlerLock = &self->_logHandlerLock;
    os_unfair_lock_lock(&self->_logHandlerLock);
    handlers = self->_handlers;
    if (!handlers)
    {
      handlers = (NSMutableArray *)objc_opt_new();
      self->_handlers = handlers;
    }
    -[NSMutableArray addObject:](handlers, "addObject:", _Block_copy(a3));
    os_unfair_lock_unlock(p_logHandlerLock);
  }
}

- (void)invokeLogHandlers:(id)a3 category:(id)a4 level:(int64_t)a5 message:(id)a6
{
  NSMutableArray *handlers;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  handlers = self->_handlers;
  if (handlers)
  {
    if (-[NSMutableArray count](handlers, "count"))
    {
      v12 = 0;
      do
      {
        v13 = (void *)MEMORY[0x186DAC640]();
        v14 = -[NSMutableArray objectAtIndexedSubscript:](self->_handlers, "objectAtIndexedSubscript:", v12);
        (*(void (**)(uint64_t, id, id, int64_t, id))(v14 + 16))(v14, a3, a4, a5, a6);
        objc_autoreleasePoolPop(v13);
        ++v12;
      }
      while (-[NSMutableArray count](self->_handlers, "count") > v12);
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x186DAC640](0, a2);
    -[_MTLLogState defaultLogHandler:category:level:message:](self, "defaultLogHandler:category:level:message:", a3, a4, a5, a6);
    objc_autoreleasePoolPop(v15);
  }
}

- (BOOL)checkAndGetMessage:(MessageHeader *)a3 logBuffer:(LogBuffer *)a4 message:(void *)a5
{
  BOOL result;
  uint64_t v6;
  unsigned int v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  BOOL v11;
  uint64_t v15;
  size_t v16;
  MessageHeader *v17;
  signed int v18;
  char *v19;
  unsigned int v20;
  uint64_t v21;
  unint64_t v22;
  size_t v23;
  char *var1;
  BOOL v25;
  size_t v26;
  char *v27;
  unsigned int var0;
  unsigned int v29;
  int v30;
  char *v31;

  result = 0;
  v6 = atomic_load((unsigned int *)a4->var0 + 3);
  v7 = atomic_load((unsigned int *)a4->var0 + 2);
  v8 = (*(_DWORD *)a4->var0 - 20);
  v9 = (v6 + 16) % v8;
  v10 = v6 < v7;
  if (v7 < v9)
  {
    v11 = v6 > v9;
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  if ((_DWORD)v6 != v7 && !v10 && !v11)
  {
    v15 = v6 % v8;
    v16 = (v8 - v15);
    v17 = (MessageHeader *)&a4->var1[v15];
    if (v16 >= 0x10)
    {
      *a3 = *v17;
    }
    else
    {
      memcpy(a3, v17, v16);
      memcpy((char *)a3 + v16, a4->var1, 16 - v16);
    }
    if (a3->var4)
    {
      v18 = a3->var0 - 16;
      std::vector<unsigned char>::reserve((std::vector<char> *)a5, v18);
      v19 = *(char **)a5;
      v20 = *(_DWORD *)a4->var0 - 20;
      v21 = ((int)v6 + 16) % v20;
      v22 = v20 - v21;
      v23 = v18;
      var1 = &a4->var1[v21];
      v25 = v18 >= v22;
      v26 = v18 - v22;
      if (v26 != 0 && v25)
      {
        memcpy(v19, var1, v20 - v21);
        v27 = &v19[v22];
        var1 = a4->var1;
        v23 = v26;
      }
      else
      {
        v27 = v19;
      }
      memcpy(v27, var1, v23);
      var0 = a3->var0;
      v29 = *(_DWORD *)a4->var0 - 20;
      if (a3->var0 + (int)v6 <= v29)
      {
        v31 = &a4->var1[v6];
      }
      else
      {
        v30 = v29 - v6;
        bzero(&a4->var1[v6], v29 - v6);
        v31 = a4->var1;
        var0 -= v30;
      }
      bzero(v31, var0);
      __dmb(0xBu);
      atomic_store((a3->var0 + (int)v6) % (*(_DWORD *)a4->var0 - 20), (unsigned int *)a4->var0 + 3);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)populateDefaultLoggerCache:(id)a3 subsystem:(id)a4 category:(id)a5
{
  NSMutableDictionary *defaultLoggerCache;
  os_log_t v10;

  defaultLoggerCache = self->defaultLoggerCache;
  if (!defaultLoggerCache)
  {
    defaultLoggerCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->defaultLoggerCache = defaultLoggerCache;
  }
  if (!-[NSMutableDictionary objectForKey:](defaultLoggerCache, "objectForKey:", a3))
  {
    v10 = os_log_create((const char *)objc_msgSend(a4, "UTF8String"), (const char *)objc_msgSend(a5, "UTF8String"));
    -[NSMutableDictionary setObject:forKey:](self->defaultLoggerCache, "setObject:forKey:", v10, a3);

  }
}

- (void)defaultLogHandler:(id)a3 category:(id)a4 level:(int64_t)a5 message:(id)a6
{
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  os_log_type_t v15;
  NSObject *v16;
  unint64_t v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), a3, a4);
    -[_MTLLogState populateDefaultLoggerCache:subsystem:category:](self, "populateDefaultLoggerCache:subsystem:category:", v11, a3, a4);
    v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->defaultLoggerCache, "objectForKeyedSubscript:", v11);
    v13 = v12;
    v14 = 0x111000010200uLL >> (8 * a5);
    if ((unint64_t)a5 >= 6)
      LOBYTE(v14) = 0;
    v15 = v14;
    if (os_log_type_enabled(v12, (os_log_type_t)v14))
    {
      *(_DWORD *)buf = 138412290;
      v19 = a6;
      v16 = v13;
LABEL_11:
      _os_log_impl(&dword_182636000, v16, v15, "%@", buf, 0xCu);
    }
  }
  else
  {
    v17 = 0x111000010200uLL >> (8 * a5);
    if ((unint64_t)a5 >= 6)
      LOBYTE(v17) = 0;
    v15 = v17;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], (os_log_type_t)v17))
    {
      *(_DWORD *)buf = 138412290;
      v19 = a6;
      v16 = MEMORY[0x1E0C81028];
      goto LABEL_11;
    }
  }
}

- (void)decodeLog
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_1(&dword_182636000, a1, a3, "Dropped messages due to insufficient log buffer size", v3);
  OUTLINED_FUNCTION_1();
}

- (void)dealloc
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  self->defaultLoggerCache = 0;
  v3 = -[NSMutableArray count](self->_handlers, "count");
  if (v3 >= 1)
  {
    v4 = 0;
    v5 = v3;
    do
      _Block_release((const void *)-[NSMutableArray objectAtIndexedSubscript:](self->_handlers, "objectAtIndexedSubscript:", v4++));
    while (v5 != v4);
  }

  v6.receiver = self;
  v6.super_class = (Class)_MTLLogState;
  -[_MTLLogState dealloc](&v6, sel_dealloc);
}

+ (int64_t)convertToLogLevel:(const char *)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;

  if (!a3)
    return 2;
  if (!strcmp(a3, "MTLLogLevelInfo"))
    return 2;
  if (!strcmp(a3, "MTLLogLevelDebug"))
    return 1;
  if (!strcmp(a3, "MTLLogLevelNotice"))
    return 3;
  if (!strcmp(a3, "MTLLogLevelError"))
    return 4;
  if (strcmp(a3, "MTLLogLevelFault"))
  {
    v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v4)
      +[_MTLLogState convertToLogLevel:].cold.1(v4, v5, v6);
    return 2;
  }
  return 5;
}

+ (void)convertToLogLevel:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_1(&dword_182636000, MEMORY[0x1E0C81028], a3, "MTLLogLevel provided is invalid, defaulting to MTLLogLevelInfo", v3);
  OUTLINED_FUNCTION_1();
}

@end
