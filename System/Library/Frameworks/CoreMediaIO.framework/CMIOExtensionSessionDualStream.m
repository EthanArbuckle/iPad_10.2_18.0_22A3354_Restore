@implementation CMIOExtensionSessionDualStream

+ (id)sessionDualStreamWithPrimaryStream:(id)a3 secondaryStream:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPrimaryStream:secondaryStream:", a3, a4);
}

- (CMIOExtensionSessionDualStream)initWithPrimaryStream:(id)a3 secondaryStream:(id)a4
{
  uint64_t v6;
  CMIOExtensionSessionDualStream *v7;
  CMIOExtensionPropertyState *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  CMIOExtensionSessionDualStream *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (a3 && a4)
  {
    v6 = *((_QWORD *)a3 + 3);
    v15.receiver = self;
    v15.super_class = (Class)CMIOExtensionSessionDualStream;
    v7 = -[CMIOExtensionSessionStream initWithPropertyStates:provider:](&v15, sel_initWithPropertyStates_provider_, v6, objc_msgSend(a3, "provider"));
    if (v7)
    {
      v7->_primaryStream = (CMIOExtensionSessionStream *)a3;
      v7->_secondaryStream = (CMIOExtensionSessionStream *)a4;
      v7->_activeStream = v7->_primaryStream;
      v8 = [CMIOExtensionPropertyState alloc];
      v9 = -[CMIOExtensionPropertyState initWithValue:](v8, "initWithValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0));
      v7->_cinematicFramingEnabled = (CMIOExtensionPropertyState *)v9;
      -[NSMutableDictionary setObject:forKey:](v7->_primaryStream->_propertyStates, "setObject:forKey:", v9, 0x2504596D8);
      -[NSMutableDictionary setObject:forKey:](v7->_secondaryStream->_propertyStates, "setObject:forKey:", v7->_cinematicFramingEnabled, 0x2504596D8);
      v10 = (void *)-[NSSet mutableCopy](v7->super._availableProperties, "mutableCopy");
      objc_msgSend(v10, "addObject:", 0x2504596D8);

      v7->super._availableProperties = (NSSet *)objc_msgSend(v10, "copy");
      v7->super._streamID = (NSUUID *)(id)objc_msgSend(MEMORY[0x24BDD1880], "UUID");

      v7->super._description = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<CMIOExtensionSessionDualStream: ID %@>"), v7->super._streamID);
      if (CMIOModuleLogLevel_once != -1)
        dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
      if (CMIOModuleLogLevel_cmioLevel >= 1)
      {
        v11 = CMIOLog();
        if (v11)
        {
          v12 = v11;
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
            *(_DWORD *)buf = 136315906;
            v17 = v13;
            v18 = 1024;
            v19 = 484;
            v20 = 2080;
            v21 = "-[CMIOExtensionSessionDualStream initWithPrimaryStream:secondaryStream:]";
            v22 = 2112;
            v23 = v7;
            _os_log_impl(&dword_2330C2000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
          }
        }
      }
    }
  }
  else
  {

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid argument"));
    return 0;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionSessionDualStream;
  -[CMIOExtensionSessionStream dealloc](&v3, sel_dealloc);
}

- (CMIOExtensionSessionStream)primaryStream
{
  return self->_primaryStream;
}

- (CMIOExtensionSessionStream)secondaryStream
{
  return self->_secondaryStream;
}

- (CMIOExtensionSessionStream)activeStream
{
  os_unfair_lock_s *p_lock;
  CMIOExtensionSessionStream *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v4 = self->_activeStream;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)selectStream:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  CMIOExtensionSessionStreamDelegate *v6;
  CMIOExtensionSessionStream *activeStream;
  _BOOL4 streaming;
  CMIOExtensionSessionStream *v9;
  CMIOExtensionSessionStream *v10;
  CMIOExtensionSessionStream *v11;
  void *v12;
  CMIOExtensionPropertyState *v13;
  void *v14;
  uint64_t v15;
  CMIOExtensionSessionStream *v16;
  CMIOExtensionPropertyState *v17;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v6 = -[CMIOExtensionSessionStream delegate](self->_activeStream, "delegate");
  activeStream = self->_activeStream;
  streaming = activeStream->_streaming;
  if (a3 && activeStream == self->_primaryStream)
  {
    v9 = activeStream;
    -[CMIOExtensionSessionStream setDelegate:](v9, "setDelegate:", 0);
    v10 = self->_secondaryStream;
    self->_activeStream = v10;
    -[CMIOExtensionSessionStream setDelegate:](v10, "setDelegate:", v6);
    v11 = self->_activeStream;
    v12 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v11->_propertyStates);

    v13 = [CMIOExtensionPropertyState alloc];
    v14 = (void *)MEMORY[0x24BDD16E0];
    v15 = 1;
  }
  else
  {
    if (a3 || activeStream != self->_secondaryStream)
    {
      os_unfair_lock_unlock(p_lock);
      return;
    }
    v9 = activeStream;
    -[CMIOExtensionSessionStream setDelegate:](v9, "setDelegate:", 0);
    v16 = self->_primaryStream;
    self->_activeStream = v16;
    -[CMIOExtensionSessionStream setDelegate:](v16, "setDelegate:", v6);
    v11 = self->_activeStream;
    v12 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v11->_propertyStates);

    v13 = [CMIOExtensionPropertyState alloc];
    v14 = (void *)MEMORY[0x24BDD16E0];
    v15 = 0;
  }
  v17 = -[CMIOExtensionPropertyState initWithValue:](v13, "initWithValue:", objc_msgSend(v14, "numberWithInt:", v15));
  self->_cinematicFramingEnabled = v17;
  objc_msgSend(v12, "setObject:forKey:", v17, 0x2504596D8);
  os_unfair_lock_unlock(p_lock);
  if (v9)
  {
    -[CMIOExtensionSessionStream updatePropertyStates:streamID:](v11, "updatePropertyStates:streamID:", v12, -[NSUUID UUIDString](-[CMIOExtensionSessionStream streamID](v11, "streamID"), "UUIDString"));
    if (streaming)
    {
      -[CMIOExtensionSessionStream startStream:](v11, "startStream:", &__block_literal_global_1);
      -[CMIOExtensionSessionStream stopStream:](v9, "stopStream:", &__block_literal_global_130);
    }
  }
}

void __47__CMIOExtensionSessionDualStream_selectStream___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (a2)
  {
    v2 = CMIOLog();
    if (v2)
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        __47__CMIOExtensionSessionDualStream_selectStream___block_invoke_cold_1();
    }
  }
}

void __47__CMIOExtensionSessionDualStream_selectStream___block_invoke_129(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (a2)
  {
    v2 = CMIOLog();
    if (v2)
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        __47__CMIOExtensionSessionDualStream_selectStream___block_invoke_129_cold_1();
    }
  }
}

- (void)updatePropertyStates:(id)a3 streamID:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  CMIOExtensionSessionStream **p_primaryStream;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  CMIOExtensionSessionDualStream *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315906;
        v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v12 = 1024;
        v13 = 578;
        v14 = 2080;
        v15 = "-[CMIOExtensionSessionDualStream updatePropertyStates:streamID:]";
        v16 = 2112;
        v17 = self;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v10, 0x26u);
      }
    }
  }
  p_primaryStream = &self->_primaryStream;
  if ((-[NSString isEqual:](-[NSUUID UUIDString](-[CMIOExtensionSessionStream streamID](self->_primaryStream, "streamID"), "UUIDString"), "isEqual:", a4) & 1) != 0|| (p_primaryStream = &self->_secondaryStream, -[NSString isEqual:](-[NSUUID UUIDString](-[CMIOExtensionSessionStream streamID](self->_secondaryStream, "streamID"), "UUIDString"), "isEqual:", a4)))
  {
    -[CMIOExtensionSessionStream updatePropertyStates:streamID:](*p_primaryStream, "updatePropertyStates:streamID:", a3, a4);
  }
}

- (void)receivedSample:(id)a3 streamID:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  CMIOExtensionSessionStream **p_primaryStream;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  CMIOExtensionSessionDualStream *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316162;
        v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v12 = 1024;
        v13 = 590;
        v14 = 2080;
        v15 = "-[CMIOExtensionSessionDualStream receivedSample:streamID:]";
        v16 = 2112;
        v17 = self;
        v18 = 2112;
        v19 = a3;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, sample %@", (uint8_t *)&v10, 0x30u);
      }
    }
  }
  p_primaryStream = &self->_primaryStream;
  if ((-[NSString isEqual:](-[NSUUID UUIDString](-[CMIOExtensionSessionStream streamID](self->_primaryStream, "streamID"), "UUIDString"), "isEqual:", a4) & 1) != 0|| (p_primaryStream = &self->_secondaryStream, -[NSString isEqual:](-[NSUUID UUIDString](-[CMIOExtensionSessionStream streamID](self->_secondaryStream, "streamID"), "UUIDString"), "isEqual:", a4)))
  {
    -[CMIOExtensionSessionStream receivedSample:streamID:](*p_primaryStream, "receivedSample:streamID:", a3, a4);
  }
}

- (id)copySample:(BOOL *)a3 streamID:(id)a4 error:(id *)a5
{
  NSObject *v9;
  NSObject *v10;
  CMIOExtensionSessionStream **p_primaryStream;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  CMIOExtensionSessionDualStream *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v9 = CMIOLog();
    if (v9)
    {
      v10 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315906;
        v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v15 = 1024;
        v16 = 602;
        v17 = 2080;
        v18 = "-[CMIOExtensionSessionDualStream copySample:streamID:error:]";
        v19 = 2112;
        v20 = self;
        _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v13, 0x26u);
      }
    }
  }
  *a3 = 0;
  *a5 = 0;
  p_primaryStream = &self->_primaryStream;
  if ((-[NSString isEqual:](-[NSUUID UUIDString](-[CMIOExtensionSessionStream streamID](self->_primaryStream, "streamID"), "UUIDString"), "isEqual:", a4) & 1) != 0)return -[CMIOExtensionSessionStream copySample:streamID:error:](*p_primaryStream, "copySample:streamID:error:", a3, a4, a5);
  p_primaryStream = &self->_secondaryStream;
  if (-[NSString isEqual:](-[NSUUID UUIDString](-[CMIOExtensionSessionStream streamID](self->_secondaryStream, "streamID"), "UUIDString"), "isEqual:", a4))return -[CMIOExtensionSessionStream copySample:streamID:error:](*p_primaryStream, "copySample:streamID:error:", a3, a4, a5);
  else
    return 0;
}

- (void)receivedScheduledOutput:(id)a3 streamID:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  CMIOExtensionSessionStream **p_primaryStream;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  CMIOExtensionSessionDualStream *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315906;
        v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v12 = 1024;
        v13 = 618;
        v14 = 2080;
        v15 = "-[CMIOExtensionSessionDualStream receivedScheduledOutput:streamID:]";
        v16 = 2112;
        v17 = self;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v10, 0x26u);
      }
    }
  }
  p_primaryStream = &self->_primaryStream;
  if ((-[NSString isEqual:](-[NSUUID UUIDString](-[CMIOExtensionSessionStream streamID](self->_primaryStream, "streamID"), "UUIDString"), "isEqual:", a4) & 1) != 0|| (p_primaryStream = &self->_secondaryStream, -[NSString isEqual:](-[NSUUID UUIDString](-[CMIOExtensionSessionStream streamID](self->_secondaryStream, "streamID"), "UUIDString"), "isEqual:", a4)))
  {
    -[CMIOExtensionSessionStream receivedScheduledOutput:streamID:](*p_primaryStream, "receivedScheduledOutput:streamID:", a3, a4);
  }
}

- (id)delegate
{
  os_unfair_lock_s *p_lock;
  CMIOExtensionSessionStreamDelegate *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v4 = -[CMIOExtensionSessionStream delegate](self->_activeStream, "delegate");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  -[CMIOExtensionSessionStream setDelegate:](self->_activeStream, "setDelegate:", a3);
  os_unfair_lock_unlock(p_lock);
}

- (id)cachedPropertyStateForProperty:(id)a3
{
  return -[CMIOExtensionSessionStream cachedPropertyStateForProperty:](-[CMIOExtensionSessionDualStream activeStream](self, "activeStream"), "cachedPropertyStateForProperty:", a3);
}

- (id)cachedPropertyStatesForProperties:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  CMIOExtensionSessionDualStream *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v5 = CMIOLog();
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315906;
        v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v10 = 1024;
        v11 = 655;
        v12 = 2080;
        v13 = "-[CMIOExtensionSessionDualStream cachedPropertyStatesForProperties:]";
        v14 = 2112;
        v15 = self;
        _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v8, 0x26u);
      }
    }
  }
  return -[CMIOExtensionSessionStream cachedPropertyStatesForProperties:](-[CMIOExtensionSessionDualStream activeStream](self, "activeStream"), "cachedPropertyStatesForProperties:", a3);
}

- (void)propertyStatesForProperties:(id)a3 reply:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  CMIOExtensionSessionDualStream *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315906;
        v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v11 = 1024;
        v12 = 662;
        v13 = 2080;
        v14 = "-[CMIOExtensionSessionDualStream propertyStatesForProperties:reply:]";
        v15 = 2112;
        v16 = self;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v9, 0x26u);
      }
    }
  }
  -[CMIOExtensionSessionStream propertyStatesForProperties:reply:](-[CMIOExtensionSessionDualStream activeStream](self, "activeStream"), "propertyStatesForProperties:reply:", a3, a4);
}

- (void)setPropertyValues:(id)a3 reply:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  CMIOExtensionSessionStream *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  CMIOExtensionSessionDualStream *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136316162;
        v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v15 = 1024;
        v16 = 669;
        v17 = 2080;
        v18 = "-[CMIOExtensionSessionDualStream setPropertyValues:reply:]";
        v19 = 2112;
        v20 = self;
        v21 = 2112;
        v22 = a3;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, propertyValues %@", (uint8_t *)&v13, 0x30u);
      }
    }
  }
  v9 = -[CMIOExtensionSessionDualStream activeStream](self, "activeStream");
  v10 = objc_msgSend(a3, "objectForKeyedSubscript:", 0x2504596D8);
  if (v10)
  {
    v11 = (void *)v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_msgSend(v11, "unsignedIntegerValue");
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_15;
    if (objc_msgSend(v11, "length") == 1)
    {
      LOBYTE(v13) = 0;
      objc_msgSend(v11, "getBytes:length:", &v13, 1);
      v12 = v13;
      goto LABEL_16;
    }
    if (objc_msgSend(v11, "length") == 4)
    {
      v13 = 0;
      objc_msgSend(v11, "getBytes:length:", &v13, 4);
      v12 = v13;
    }
    else
    {
LABEL_15:
      v12 = 0;
    }
LABEL_16:
    -[CMIOExtensionSessionDualStream selectStream:](self, "selectStream:", v12);
    if ((unint64_t)objc_msgSend(a3, "count") >= 2)
    {
      a3 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a3);
      objc_msgSend(a3, "removeObjectForKey:", 0x2504596D8);
    }
  }
  -[CMIOExtensionSessionStream setPropertyValues:reply:](v9, "setPropertyValues:reply:", a3, a4);
}

- (id)formats
{
  return -[CMIOExtensionSessionStream formats](-[CMIOExtensionSessionDualStream activeStream](self, "activeStream"), "formats");
}

- (unint64_t)activeFormatIndex
{
  return -[CMIOExtensionSessionStream activeFormatIndex](-[CMIOExtensionSessionDualStream activeStream](self, "activeStream"), "activeFormatIndex");
}

- (void)setActiveFormatIndex:(unint64_t)a3
{
  -[CMIOExtensionSessionStream setActiveFormatIndex:](-[CMIOExtensionSessionDualStream activeStream](self, "activeStream"), "setActiveFormatIndex:", a3);
}

- (void)setActiveFormatIndex:(unint64_t)a3 reply:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  CMIOExtensionSessionDualStream *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136316162;
        v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v11 = 1024;
        v12 = 721;
        v13 = 2080;
        v14 = "-[CMIOExtensionSessionDualStream setActiveFormatIndex:reply:]";
        v15 = 2112;
        v16 = self;
        v17 = 1024;
        v18 = a3;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %d", (uint8_t *)&v9, 0x2Cu);
      }
    }
  }
  -[CMIOExtensionSessionStream setActiveFormatIndex:reply:](-[CMIOExtensionSessionDualStream activeStream](self, "activeStream"), "setActiveFormatIndex:reply:", a3, a4);
}

- (void)startStream:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  CMIOExtensionSessionDualStream *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v5 = CMIOLog();
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315906;
        v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v9 = 1024;
        v10 = 728;
        v11 = 2080;
        v12 = "-[CMIOExtensionSessionDualStream startStream:]";
        v13 = 2112;
        v14 = self;
        _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v7, 0x26u);
      }
    }
  }
  -[CMIOExtensionSessionStream startStream:](-[CMIOExtensionSessionDualStream activeStream](self, "activeStream"), "startStream:", a3);
}

- (void)stopStream:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  CMIOExtensionSessionDualStream *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v5 = CMIOLog();
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315906;
        v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v9 = 1024;
        v10 = 735;
        v11 = 2080;
        v12 = "-[CMIOExtensionSessionDualStream stopStream:]";
        v13 = 2112;
        v14 = self;
        _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v7, 0x26u);
      }
    }
  }
  -[CMIOExtensionSessionStream stopStream:](-[CMIOExtensionSessionDualStream activeStream](self, "activeStream"), "stopStream:", a3);
}

- (void)completeTransaction
{
  -[CMIOExtensionSessionStream completeTransaction](-[CMIOExtensionSessionDualStream activeStream](self, "activeStream"), "completeTransaction");
}

void __47__CMIOExtensionSessionDualStream_selectStream___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s start stream index error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__CMIOExtensionSessionDualStream_selectStream___block_invoke_129_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s stop stream index error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
