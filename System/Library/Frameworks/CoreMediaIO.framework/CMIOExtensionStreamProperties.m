@implementation CMIOExtensionStreamProperties

+ (CMIOExtensionStreamProperties)streamPropertiesWithDictionary:(NSDictionary *)propertiesDictionary
{
  return (CMIOExtensionStreamProperties *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDictionary:", propertiesDictionary);
}

- (CMIOExtensionStreamProperties)initWithDictionary:(NSDictionary *)propertiesDictionary
{
  CMIOExtensionStreamProperties *v4;
  CMIOExtensionStreamProperties *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMIOExtensionStreamProperties;
  v4 = -[CMIOExtensionStreamProperties init](&v7, sel_init);
  v5 = v4;
  if (propertiesDictionary && v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_propertiesDictionary = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", propertiesDictionary);
  }
  return v5;
}

- (CMIOExtensionStreamProperties)initWithPropertyValues:(id)a3 client:(id)a4
{
  uint64_t v7;
  CMIOExtensionStreamProperties *v8;
  _QWORD v10[5];

  v7 = objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__CMIOExtensionStreamProperties_initWithPropertyValues_client___block_invoke;
  v10[3] = &unk_250457618;
  v10[4] = v7;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = -[CMIOExtensionStreamProperties initWithDictionary:](self, "initWithDictionary:", v7);
  if (v8)
    v8->_client = (CMIOExtensionClient *)objc_msgSend(a4, "copy");
  return v8;
}

uint64_t __63__CMIOExtensionStreamProperties_initWithPropertyValues_client___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", +[CMIOExtensionPropertyState propertyStateWithValue:](CMIOExtensionPropertyState, "propertyStateWithValue:"), a2);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionStreamProperties;
  -[CMIOExtensionStreamProperties dealloc](&v3, sel_dealloc);
}

- (NSNumber)activeFormatIndex
{
  os_unfair_lock_s *p_lock;
  id v4;
  NSNumber *v5;
  NSObject *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (id)-[NSMutableDictionary objectForKey:](self->_propertiesDictionary, "objectForKey:", CFSTR("CMIOExtensionPropertyStreamActiveFormatIndex"));
  os_unfair_lock_unlock(p_lock);
  v5 = (NSNumber *)objc_msgSend(v4, "value");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      v5 = (NSNumber *)v6;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionStreamProperties activeFormatIndex].cold.1();
        return 0;
      }
    }
  }
  return v5;
}

- (void)setActiveFormatIndex:(NSNumber *)activeFormatIndex
{
  NSNumber *v4;
  NSObject *v5;

  if (!activeFormatIndex)
    goto LABEL_4;
  v4 = activeFormatIndex;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    activeFormatIndex = +[CMIOExtensionPropertyState propertyStateWithValue:](CMIOExtensionPropertyState, "propertyStateWithValue:", v4);
LABEL_4:
    -[CMIOExtensionStreamProperties setPropertyState:forProperty:](self, "setPropertyState:forProperty:", activeFormatIndex, CFSTR("CMIOExtensionPropertyStreamActiveFormatIndex"));
    return;
  }
  v5 = CMIOLog();
  if (v5)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionStreamProperties setActiveFormatIndex:].cold.1();
  }
}

- (NSDictionary)frameDuration
{
  os_unfair_lock_s *p_lock;
  id v4;
  NSDictionary *v5;
  NSObject *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (id)-[NSMutableDictionary objectForKey:](self->_propertiesDictionary, "objectForKey:", CFSTR("CMIOExtensionPropertyStreamFrameDuration"));
  os_unfair_lock_unlock(p_lock);
  v5 = (NSDictionary *)objc_msgSend(v4, "value");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      v5 = (NSDictionary *)v6;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionStreamProperties frameDuration].cold.1();
        return 0;
      }
    }
  }
  return v5;
}

- (void)setFrameDuration:(NSDictionary *)frameDuration
{
  NSDictionary *v4;
  NSObject *v5;

  if (!frameDuration)
    goto LABEL_4;
  v4 = frameDuration;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    frameDuration = +[CMIOExtensionPropertyState propertyStateWithValue:](CMIOExtensionPropertyState, "propertyStateWithValue:", v4);
LABEL_4:
    -[CMIOExtensionStreamProperties setPropertyState:forProperty:](self, "setPropertyState:forProperty:", frameDuration, CFSTR("CMIOExtensionPropertyStreamFrameDuration"));
    return;
  }
  v5 = CMIOLog();
  if (v5)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionStreamProperties setFrameDuration:].cold.1();
  }
}

- (NSDictionary)maxFrameDuration
{
  os_unfair_lock_s *p_lock;
  id v4;
  NSDictionary *v5;
  NSObject *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (id)-[NSMutableDictionary objectForKey:](self->_propertiesDictionary, "objectForKey:", CFSTR("CMIOExtensionPropertyStreamMaxFrameDuration"));
  os_unfair_lock_unlock(p_lock);
  v5 = (NSDictionary *)objc_msgSend(v4, "value");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      v5 = (NSDictionary *)v6;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionStreamProperties maxFrameDuration].cold.1();
        return 0;
      }
    }
  }
  return v5;
}

- (void)setMaxFrameDuration:(NSDictionary *)maxFrameDuration
{
  NSDictionary *v4;
  NSObject *v5;

  if (!maxFrameDuration)
    goto LABEL_4;
  v4 = maxFrameDuration;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    maxFrameDuration = +[CMIOExtensionPropertyState propertyStateWithValue:](CMIOExtensionPropertyState, "propertyStateWithValue:", v4);
LABEL_4:
    -[CMIOExtensionStreamProperties setPropertyState:forProperty:](self, "setPropertyState:forProperty:", maxFrameDuration, CFSTR("CMIOExtensionPropertyStreamMaxFrameDuration"));
    return;
  }
  v5 = CMIOLog();
  if (v5)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionStreamProperties setMaxFrameDuration:].cold.1();
  }
}

- (NSNumber)sinkBufferQueueSize
{
  os_unfair_lock_s *p_lock;
  id v4;
  NSNumber *v5;
  NSObject *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (id)-[NSMutableDictionary objectForKey:](self->_propertiesDictionary, "objectForKey:", CFSTR("CMIOExtensionPropertyStreamSinkBufferQueueSize"));
  os_unfair_lock_unlock(p_lock);
  v5 = (NSNumber *)objc_msgSend(v4, "value");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      v5 = (NSNumber *)v6;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionStreamProperties sinkBufferQueueSize].cold.1();
        return 0;
      }
    }
  }
  return v5;
}

- (void)setSinkBufferQueueSize:(NSNumber *)sinkBufferQueueSize
{
  NSNumber *v4;
  NSObject *v5;

  if (!sinkBufferQueueSize)
    goto LABEL_4;
  v4 = sinkBufferQueueSize;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sinkBufferQueueSize = +[CMIOExtensionPropertyState propertyStateWithValue:](CMIOExtensionPropertyState, "propertyStateWithValue:", v4);
LABEL_4:
    -[CMIOExtensionStreamProperties setPropertyState:forProperty:](self, "setPropertyState:forProperty:", sinkBufferQueueSize, CFSTR("CMIOExtensionPropertyStreamSinkBufferQueueSize"));
    return;
  }
  v5 = CMIOLog();
  if (v5)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionStreamProperties setSinkBufferQueueSize:].cold.1();
  }
}

- (NSNumber)sinkBuffersRequiredForStartup
{
  os_unfair_lock_s *p_lock;
  id v4;
  NSNumber *v5;
  NSObject *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (id)-[NSMutableDictionary objectForKey:](self->_propertiesDictionary, "objectForKey:", CFSTR("CMIOExtensionPropertyStreamSinkBuffersRequiredForStartup"));
  os_unfair_lock_unlock(p_lock);
  v5 = (NSNumber *)objc_msgSend(v4, "value");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      v5 = (NSNumber *)v6;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionStreamProperties sinkBuffersRequiredForStartup].cold.1();
        return 0;
      }
    }
  }
  return v5;
}

- (void)setSinkBuffersRequiredForStartup:(NSNumber *)sinkBuffersRequiredForStartup
{
  NSNumber *v4;
  NSObject *v5;

  if (!sinkBuffersRequiredForStartup)
    goto LABEL_4;
  v4 = sinkBuffersRequiredForStartup;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sinkBuffersRequiredForStartup = +[CMIOExtensionPropertyState propertyStateWithValue:](CMIOExtensionPropertyState, "propertyStateWithValue:", v4);
LABEL_4:
    -[CMIOExtensionStreamProperties setPropertyState:forProperty:](self, "setPropertyState:forProperty:", sinkBuffersRequiredForStartup, CFSTR("CMIOExtensionPropertyStreamSinkBuffersRequiredForStartup"));
    return;
  }
  v5 = CMIOLog();
  if (v5)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionStreamProperties setSinkBuffersRequiredForStartup:].cold.1();
  }
}

- (NSNumber)sinkBufferUnderrunCount
{
  os_unfair_lock_s *p_lock;
  id v4;
  NSNumber *v5;
  NSObject *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (id)-[NSMutableDictionary objectForKey:](self->_propertiesDictionary, "objectForKey:", CFSTR("CMIOExtensionPropertyStreamSinkBufferUnderrunCount"));
  os_unfair_lock_unlock(p_lock);
  v5 = (NSNumber *)objc_msgSend(v4, "value");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      v5 = (NSNumber *)v6;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionStreamProperties sinkBufferUnderrunCount].cold.1();
        return 0;
      }
    }
  }
  return v5;
}

- (void)setSinkBufferUnderrunCount:(NSNumber *)sinkBufferUnderrunCount
{
  NSNumber *v4;
  NSObject *v5;

  if (!sinkBufferUnderrunCount)
    goto LABEL_4;
  v4 = sinkBufferUnderrunCount;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sinkBufferUnderrunCount = +[CMIOExtensionPropertyState propertyStateWithValue:attributes:](CMIOExtensionPropertyState, "propertyStateWithValue:attributes:", v4, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
LABEL_4:
    -[CMIOExtensionStreamProperties setPropertyState:forProperty:](self, "setPropertyState:forProperty:", sinkBufferUnderrunCount, CFSTR("CMIOExtensionPropertyStreamSinkBufferUnderrunCount"));
    return;
  }
  v5 = CMIOLog();
  if (v5)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionStreamProperties setSinkBufferUnderrunCount:].cold.1();
  }
}

- (NSNumber)sinkEndOfData
{
  os_unfair_lock_s *p_lock;
  id v4;
  NSNumber *v5;
  NSObject *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (id)-[NSMutableDictionary objectForKey:](self->_propertiesDictionary, "objectForKey:", CFSTR("CMIOExtensionPropertyStreamSinkEndOfData"));
  os_unfair_lock_unlock(p_lock);
  v5 = (NSNumber *)objc_msgSend(v4, "value");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      v5 = (NSNumber *)v6;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionStreamProperties sinkEndOfData].cold.1();
        return 0;
      }
    }
  }
  return v5;
}

- (void)setSinkEndOfData:(NSNumber *)sinkEndOfData
{
  NSNumber *v4;
  NSObject *v5;

  if (!sinkEndOfData)
    goto LABEL_4;
  v4 = sinkEndOfData;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sinkEndOfData = +[CMIOExtensionPropertyState propertyStateWithValue:](CMIOExtensionPropertyState, "propertyStateWithValue:", v4);
LABEL_4:
    -[CMIOExtensionStreamProperties setPropertyState:forProperty:](self, "setPropertyState:forProperty:", sinkEndOfData, CFSTR("CMIOExtensionPropertyStreamSinkEndOfData"));
    return;
  }
  v5 = CMIOLog();
  if (v5)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionStreamProperties setSinkEndOfData:].cold.1();
  }
}

- (void)setPropertyState:(CMIOExtensionPropertyState *)propertyState forProperty:(CMIOExtensionProperty)property
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *propertiesDictionary;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  propertiesDictionary = self->_propertiesDictionary;
  if (propertyState)
    -[NSMutableDictionary setObject:forKey:](propertiesDictionary, "setObject:forKey:", propertyState, property);
  else
    -[NSMutableDictionary removeObjectForKey:](propertiesDictionary, "removeObjectForKey:", property);
  os_unfair_lock_unlock(p_lock);
}

- (NSDictionary)propertiesDictionary
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableDictionary copy](self->_propertiesDictionary, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (void)setPropertiesDictionary:(NSDictionary *)propertiesDictionary
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_propertiesDictionary;
  self->_propertiesDictionary = (NSMutableDictionary *)-[NSDictionary mutableCopy](propertiesDictionary, "mutableCopy");
  os_unfair_lock_unlock(p_lock);

}

- (id)client
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[CMIOExtensionClient copy](self->_client, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)activeFormatIndex
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s activeFormatIndex is not from NSNumber type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setActiveFormatIndex:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s activeFormatIndex is not from NSNumber type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)frameDuration
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s frameDuration is not from NSDictionary type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setFrameDuration:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s frameDuration is not from NSDictionary type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)maxFrameDuration
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s maxFrameDuration is not from NSDictionary type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setMaxFrameDuration:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s maxFrameDuration is not from NSDictionary type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sinkBufferQueueSize
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s sinkBufferQueueSize is not from NSNumber type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setSinkBufferQueueSize:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s sinkBufferQueueSize is not from NSNumber type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sinkBuffersRequiredForStartup
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s sinkBuffersRequiredForStartup is not from NSNumber type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setSinkBuffersRequiredForStartup:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s sinkBuffersRequiredForStartup is not from NSNumber type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sinkBufferUnderrunCount
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s sinkBufferUnderrunCount is not from NSNumber type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setSinkBufferUnderrunCount:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s sinkBufferUnderrunCount is not from NSNumber type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sinkEndOfData
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s sinkEndOfData is not from NSNumber type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setSinkEndOfData:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s sinkEndOfData is not from NSNumber type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
