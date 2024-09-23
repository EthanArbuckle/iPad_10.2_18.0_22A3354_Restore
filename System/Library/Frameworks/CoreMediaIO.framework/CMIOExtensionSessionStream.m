@implementation CMIOExtensionSessionStream

+ (id)sessionStreamWithPropertyStates:(id)a3 provider:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPropertyStates:provider:", a3, a4);
}

- (CMIOExtensionSessionStream)initWithPropertyStates:(id)a3 provider:(id)a4
{
  CMIOExtensionSessionStream *v6;
  CMIOExtensionSessionStream *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  _QWORD v16[5];
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  CMIOExtensionSessionStream *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a3 && a4)
  {
    v17.receiver = self;
    v17.super_class = (Class)CMIOExtensionSessionStream;
    v6 = -[CMIOExtensionSessionStream init](&v17, sel_init);
    v7 = v6;
    if (v6)
    {
      v6->_lock._os_unfair_lock_opaque = 0;
      v8 = +[CMIOExtensionStream internalProperties](CMIOExtensionStream, "internalProperties");
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __62__CMIOExtensionSessionStream_initWithPropertyStates_provider___block_invoke;
      v16[3] = &unk_250457E58;
      v16[4] = v8;
      v7->_availableProperties = (NSSet *)(id)objc_msgSend(a3, "keysOfEntriesPassingTest:", v16);
      v7->_localizedName = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x250459618), "value");
      v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x250459638), "value");
      v7->_streamID = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v9);
      v7->_direction = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x250459658), "value"), "integerValue");
      v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x250459678), "value"), "integerValue");
      v7->_clockType = v10;
      if (v10 == 2)
        v7->_customClockConfiguration = (CMIOExtensionStreamCustomClockConfiguration *)(id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x250459698), "value");
      v7->_formats = (NSArray *)(id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x2504596B8), "attributes"), "validValues");
      v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CMIOExtensionPropertyStreamActiveFormatIndex")), "value"), "unsignedIntegerValue");
      v7->_activeFormatIndex = v11;
      v7->_activeFormatMediaType = CMFormatDescriptionGetMediaType((CMFormatDescriptionRef)objc_msgSend(-[NSArray objectAtIndexedSubscript:](v7->_formats, "objectAtIndexedSubscript:", v11), "formatDescription"));
      v7->_propertyStates = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
      objc_storeWeak((id *)&v7->_provider, a4);
      v7->_description = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<CMIOExtensionSessionStream: ID %@>"), v7->_streamID);
      if (CMIOModuleLogLevel_once != -1)
        dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
      if (CMIOModuleLogLevel_cmioLevel >= 1)
      {
        v12 = CMIOLog();
        if (v12)
        {
          v13 = v12;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
            *(_DWORD *)buf = 136315906;
            v19 = v14;
            v20 = 1024;
            v21 = 162;
            v22 = 2080;
            v23 = "-[CMIOExtensionSessionStream initWithPropertyStates:provider:]";
            v24 = 2112;
            v25 = v7;
            _os_log_impl(&dword_2330C2000, v13, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
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

uint64_t __62__CMIOExtensionSessionStream_initWithPropertyStates_provider___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  CMIOExtensionSessionStream *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v3 = CMIOLog();
    if (v3)
    {
      v4 = v3;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v8 = 1024;
        v9 = 169;
        v10 = 2080;
        v11 = "-[CMIOExtensionSessionStream dealloc]";
        v12 = 2112;
        v13 = self;
        _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)CMIOExtensionSessionStream;
  -[CMIOExtensionSessionStream dealloc](&v5, sel_dealloc);
}

- (id)description
{
  return self->_description;
}

- (void)updatePropertyStates:(id)a3 streamID:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  CMIOExtensionSessionStream *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v6 = CMIOLog();
    if (v6)
    {
      v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315906;
        v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v12 = 1024;
        v13 = 189;
        v14 = 2080;
        v15 = "-[CMIOExtensionSessionStream updatePropertyStates:streamID:]";
        v16 = 2112;
        v17 = self;
        _os_log_impl(&dword_2330C2000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v10, 0x26u);
      }
    }
  }
  if (objc_msgSend(a3, "count"))
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary addEntriesFromDictionary:](self->_propertyStates, "addEntriesFromDictionary:", a3);
    os_unfair_lock_unlock(&self->_lock);
    v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CMIOExtensionPropertyStreamActiveFormatIndex"));
    if (v8)
    {
      v9 = objc_msgSend((id)objc_msgSend(v8, "value"), "unsignedIntegerValue");
      -[CMIOExtensionSessionStream setActiveFormatIndex:](self, "setActiveFormatIndex:", v9);
      self->_activeFormatMediaType = CMFormatDescriptionGetMediaType((CMFormatDescriptionRef)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_formats, "objectAtIndexedSubscript:", self->_activeFormatIndex), "formatDescription"));
      objc_msgSend(objc_loadWeak((id *)&self->_delegate), "stream:activeFormatIndexChanged:", self, v9);
    }
    objc_msgSend(objc_loadWeak((id *)&self->_delegate), "stream:propertiesChanged:", self, a3);
  }
}

- (void)receivedSample:(id)a3 streamID:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  CMIOExtensionSessionStream *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v6 = CMIOLog();
    if (v6)
    {
      v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136316162;
        v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v10 = 1024;
        v11 = 214;
        v12 = 2080;
        v13 = "-[CMIOExtensionSessionStream receivedSample:streamID:]";
        v14 = 2112;
        v15 = self;
        v16 = 2112;
        v17 = a3;
        _os_log_impl(&dword_2330C2000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, sample %@", (uint8_t *)&v8, 0x30u);
      }
    }
  }
  objc_msgSend(objc_loadWeak((id *)&self->_delegate), "stream:receivedSampleBuffer:", self, objc_msgSend(a3, "sampleBuffer"));
}

- (id)copySample:(BOOL *)a3 streamID:(id)a4 error:(id *)a5
{
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  const void *v11;
  CMIOExtensionSample *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  CMIOExtensionSessionStream *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v8 = CMIOLog();
    if (v8)
    {
      v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315906;
        v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v16 = 1024;
        v17 = 221;
        v18 = 2080;
        v19 = "-[CMIOExtensionSessionStream copySample:streamID:error:]";
        v20 = 2112;
        v21 = self;
        _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v14, 0x26u);
      }
    }
  }
  *a3 = 0;
  *a5 = 0;
  v10 = objc_msgSend(objc_loadWeak((id *)&self->_delegate), "stream:copySampleBuffer:error:", self, a3, a5);
  if (!v10)
    return 0;
  v11 = (const void *)v10;
  v12 = -[CMIOExtensionSample initWithCMSampleBuffer:]([CMIOExtensionSample alloc], "initWithCMSampleBuffer:", v10);
  CFRelease(v11);
  return v12;
}

- (void)receivedScheduledOutput:(id)a3 streamID:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  CMIOExtensionSessionStream *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v6 = CMIOLog();
    if (v6)
    {
      v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315906;
        v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v10 = 1024;
        v11 = 237;
        v12 = 2080;
        v13 = "-[CMIOExtensionSessionStream receivedScheduledOutput:streamID:]";
        v14 = 2112;
        v15 = self;
        _os_log_impl(&dword_2330C2000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v8, 0x26u);
      }
    }
  }
  objc_msgSend(objc_loadWeak((id *)&self->_delegate), "stream:scheduledOutputChanged:", self, a3);
}

- (CMIOExtensionSessionStreamDelegate)delegate
{
  return (CMIOExtensionSessionStreamDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)availableProperties
{
  return self->_availableProperties;
}

- (id)cachedPropertyStateForProperty:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (id)-[NSMutableDictionary objectForKey:](self->_propertyStates, "objectForKey:", a3);
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)cachedPropertyStatesForProperties:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  void *v14;
  os_unfair_lock_s *p_lock;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  CMIOExtensionSessionStream *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
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
        *(_DWORD *)buf = 136315906;
        v23 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v24 = 1024;
        v25 = 270;
        v26 = 2080;
        v27 = "-[CMIOExtensionSessionStream cachedPropertyStatesForProperties:]";
        v28 = 2112;
        v29 = self;
        _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  if (a3)
  {
    v7 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(a3);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          os_unfair_lock_lock(&self->_lock);
          v13 = (id)-[NSMutableDictionary objectForKey:](self->_propertyStates, "objectForKey:", v12);
          os_unfair_lock_unlock(&self->_lock);
          if (v13)
            objc_msgSend(v7, "setObject:forKey:", v13, v12);
        }
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }
    v14 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v7);

  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v14 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_propertyStates);
    os_unfair_lock_unlock(p_lock);
  }
  return v14;
}

- (void)propertyStatesForProperties:(id)availableProperties reply:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSString *v11;
  uint64_t v12;
  _QWORD v13[6];
  uint64_t v14;
  const __CFString *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  CMIOExtensionSessionStream *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
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
        *(_DWORD *)buf = 136315906;
        v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v18 = 1024;
        v19 = 302;
        v20 = 2080;
        v21 = "-[CMIOExtensionSessionStream propertyStatesForProperties:reply:]";
        v22 = 2112;
        v23 = self;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  if (!availableProperties)
    availableProperties = self->_availableProperties;
  v9 = objc_msgSend(objc_loadWeak((id *)&self->_provider), "hostContext");
  if (v9)
  {
    v10 = (void *)v9;
    v11 = -[NSUUID UUIDString](self->_streamID, "UUIDString");
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __64__CMIOExtensionSessionStream_propertyStatesForProperties_reply___block_invoke;
    v13[3] = &unk_250457E80;
    v13[4] = self;
    v13[5] = a4;
    objc_msgSend(v10, "streamPropertyStatesWithStreamID:properties:reply:", v11, availableProperties, v13);
  }
  else
  {
    v12 = *MEMORY[0x24BDD1100];
    v14 = *MEMORY[0x24BDD0FC8];
    v15 = CFSTR("Invalid session");
    (*((void (**)(id, _QWORD, uint64_t))a4 + 2))(a4, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v12, -50, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)));
  }
}

uint64_t __64__CMIOExtensionSessionStream_propertyStatesForProperties_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addEntriesFromDictionary:", a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setPropertyValues:(id)a3 reply:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSString *v11;
  uint64_t v12;
  _QWORD v13[5];
  uint64_t v14;
  const __CFString *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  CMIOExtensionSessionStream *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
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
        *(_DWORD *)buf = 136316162;
        v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v18 = 1024;
        v19 = 324;
        v20 = 2080;
        v21 = "-[CMIOExtensionSessionStream setPropertyValues:reply:]";
        v22 = 2112;
        v23 = self;
        v24 = 2112;
        v25 = a3;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, propertyValues %@", buf, 0x30u);
      }
    }
  }
  v9 = objc_msgSend(objc_loadWeak((id *)&self->_provider), "hostContext");
  if (v9)
  {
    v10 = (void *)v9;
    v11 = -[NSUUID UUIDString](self->_streamID, "UUIDString");
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __54__CMIOExtensionSessionStream_setPropertyValues_reply___block_invoke;
    v13[3] = &unk_250457EA8;
    v13[4] = a4;
    objc_msgSend(v10, "setStreamPropertyValuesWithStreamID:propertyValues:reply:", v11, a3, v13);
  }
  else
  {
    v12 = *MEMORY[0x24BDD1100];
    v14 = *MEMORY[0x24BDD0FC8];
    v15 = CFSTR("Invalid session");
    (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v12, -50, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)));
  }
}

uint64_t __54__CMIOExtensionSessionStream_setPropertyValues_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSArray)formats
{
  return self->_formats;
}

- (void)setActiveFormatIndex:(unint64_t)a3 reply:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString **v17;
  uint64_t *v18;
  _QWORD v19[7];
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  CMIOExtensionSessionStream *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
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
        *(_DWORD *)buf = 136316162;
        v25 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v26 = 1024;
        v27 = 343;
        v28 = 2080;
        v29 = "-[CMIOExtensionSessionStream setActiveFormatIndex:reply:]";
        v30 = 2112;
        v31 = self;
        v32 = 1024;
        v33 = a3;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %d", buf, 0x2Cu);
      }
    }
  }
  if (-[NSArray count](self->_formats, "count") <= a3)
  {
    v13 = CMIOLog();
    if (v13)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionSessionStream setActiveFormatIndex:reply:].cold.1();
    }
    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD1100];
    v22 = *MEMORY[0x24BDD0FC8];
    v23 = CFSTR("Invalid format value");
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = &v23;
    v18 = &v22;
  }
  else
  {
    v9 = objc_msgSend(objc_loadWeak((id *)&self->_provider), "hostContext");
    if (v9)
    {
      v10 = (void *)v9;
      v11 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3), CFSTR("CMIOExtensionPropertyStreamActiveFormatIndex"));
      v12 = -[NSUUID UUIDString](self->_streamID, "UUIDString");
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __57__CMIOExtensionSessionStream_setActiveFormatIndex_reply___block_invoke;
      v19[3] = &unk_250457ED0;
      v19[5] = a4;
      v19[6] = a3;
      v19[4] = self;
      objc_msgSend(v10, "setStreamPropertyValuesWithStreamID:propertyValues:reply:", v12, v11, v19);
      return;
    }
    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD1100];
    v20 = *MEMORY[0x24BDD0FC8];
    v21 = CFSTR("Invalid session");
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = &v21;
    v18 = &v20;
  }
  (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, -50, objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1)));
}

uint64_t __57__CMIOExtensionSessionStream_setActiveFormatIndex_reply___block_invoke(_QWORD *a1, uint64_t a2)
{
  NSObject *v3;

  if (a2)
  {
    v3 = CMIOLog();
    if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __57__CMIOExtensionSessionStream_setActiveFormatIndex_reply___block_invoke_cold_1();
  }
  else
  {
    *(_QWORD *)(a1[4] + 112) = a1[6];
  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)startStream:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  uint64_t v10;
  _QWORD v11[6];
  uint64_t v12;
  const __CFString *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  CMIOExtensionSessionStream *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
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
        *(_DWORD *)buf = 136315906;
        v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v16 = 1024;
        v17 = 371;
        v18 = 2080;
        v19 = "-[CMIOExtensionSessionStream startStream:]";
        v20 = 2112;
        v21 = self;
        _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  v7 = objc_msgSend(objc_loadWeak((id *)&self->_provider), "hostContext");
  if (v7)
  {
    v8 = (void *)v7;
    self->_streaming = 1;
    v9 = -[NSUUID UUIDString](self->_streamID, "UUIDString");
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __42__CMIOExtensionSessionStream_startStream___block_invoke;
    v11[3] = &unk_250457EF8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend(v8, "startStreamWithStreamID:reply:", v9, v11);
  }
  else
  {
    v10 = *MEMORY[0x24BDD1100];
    v12 = *MEMORY[0x24BDD0FC8];
    v13 = CFSTR("Invalid session");
    (*((void (**)(id, uint64_t))a3 + 2))(a3, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v10, -50, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1)));
  }
}

uint64_t __42__CMIOExtensionSessionStream_startStream___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  if (a2)
  {
    v3 = CMIOLog();
    if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __42__CMIOExtensionSessionStream_startStream___block_invoke_cold_1();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)stopStream:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  uint64_t v10;
  _QWORD v11[5];
  uint64_t v12;
  const __CFString *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  CMIOExtensionSessionStream *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
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
        *(_DWORD *)buf = 136315906;
        v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v16 = 1024;
        v17 = 390;
        v18 = 2080;
        v19 = "-[CMIOExtensionSessionStream stopStream:]";
        v20 = 2112;
        v21 = self;
        _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  v7 = objc_msgSend(objc_loadWeak((id *)&self->_provider), "hostContext");
  if (v7)
  {
    v8 = (void *)v7;
    self->_streaming = 0;
    v9 = -[NSUUID UUIDString](self->_streamID, "UUIDString");
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __41__CMIOExtensionSessionStream_stopStream___block_invoke;
    v11[3] = &unk_250457EA8;
    v11[4] = a3;
    objc_msgSend(v8, "stopStreamWithStreamID:reply:", v9, v11);
  }
  else
  {
    v10 = *MEMORY[0x24BDD1100];
    v12 = *MEMORY[0x24BDD0FC8];
    v13 = CFSTR("Invalid session");
    (*((void (**)(id, uint64_t))a3 + 2))(a3, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v10, -50, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1)));
  }
}

uint64_t __41__CMIOExtensionSessionStream_stopStream___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  if (a2)
  {
    v3 = CMIOLog();
    if (v3)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __41__CMIOExtensionSessionStream_stopStream___block_invoke_cold_1();
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)captureAsyncStillImage:(int64_t)a3 options:(id)a4 reply:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSString *v13;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  CMIOExtensionSessionStream *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
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
        *(_DWORD *)buf = 136315906;
        v19 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v20 = 1024;
        v21 = 408;
        v22 = 2080;
        v23 = "-[CMIOExtensionSessionStream captureAsyncStillImage:options:reply:]";
        v24 = 2112;
        v25 = self;
        _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  v11 = objc_msgSend(objc_loadWeak((id *)&self->_provider), "hostContext");
  if (v11)
  {
    v12 = (void *)v11;
    v13 = -[NSUUID UUIDString](self->_streamID, "UUIDString");
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __67__CMIOExtensionSessionStream_captureAsyncStillImage_options_reply___block_invoke;
    v15[3] = &unk_250457F20;
    v15[4] = a5;
    objc_msgSend(v12, "captureAsyncStillImageWithStreamID:uniqueID:options:reply:", v13, a3, a4, v15);
  }
  else
  {
    v14 = *MEMORY[0x24BDD1100];
    v16 = *MEMORY[0x24BDD0FC8];
    v17 = CFSTR("Invalid session");
    (*((void (**)(id, _QWORD, uint64_t))a5 + 2))(a5, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v14, -50, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1)));
  }
}

uint64_t __67__CMIOExtensionSessionStream_captureAsyncStillImage_options_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;

  if (!a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = CMIOLog();
  if (v4)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __67__CMIOExtensionSessionStream_captureAsyncStillImage_options_reply___block_invoke_cold_1();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enqueueReactionEffect:(id)a3 reply:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  CMIOExtensionSessionStream *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
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
        *(_DWORD *)buf = 136315906;
        v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v15 = 1024;
        v16 = 428;
        v17 = 2080;
        v18 = "-[CMIOExtensionSessionStream enqueueReactionEffect:reply:]";
        v19 = 2112;
        v20 = self;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  v9 = (void *)objc_msgSend(objc_loadWeak((id *)&self->_provider), "hostContext");
  if (v9)
  {
    objc_msgSend(v9, "enqueueReactionEffect:reactionType:reply:", -[NSUUID UUIDString](self->_streamID, "UUIDString"), a3, a4);
  }
  else
  {
    v10 = *MEMORY[0x24BDD1100];
    v11 = *MEMORY[0x24BDD0FC8];
    v12 = CFSTR("Invalid session");
    (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v10, -50, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
}

- (void)completeTransaction
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSUUID)streamID
{
  return self->_streamID;
}

- (int64_t)direction
{
  return self->_direction;
}

- (int64_t)clockType
{
  return self->_clockType;
}

- (CMIOExtensionStreamCustomClockConfiguration)customClockConfiguration
{
  return self->_customClockConfiguration;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (unint64_t)activeFormatIndex
{
  return self->_activeFormatIndex;
}

- (void)setActiveFormatIndex:(unint64_t)a3
{
  self->_activeFormatIndex = a3;
}

- (unsigned)activeFormatMediaType
{
  return self->_activeFormatMediaType;
}

- (CMIOExtensionSessionProvider)provider
{
  return (CMIOExtensionSessionProvider *)objc_loadWeak((id *)&self->_provider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setActiveFormatIndex:reply:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __57__CMIOExtensionSessionStream_setActiveFormatIndex_reply___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s active format index error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __42__CMIOExtensionSessionStream_startStream___block_invoke_cold_1()
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

void __41__CMIOExtensionSessionStream_stopStream___block_invoke_cold_1()
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

void __67__CMIOExtensionSessionStream_captureAsyncStillImage_options_reply___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s capture still image error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
