@implementation CMIOExtensionDeviceProperties

+ (CMIOExtensionDeviceProperties)devicePropertiesWithDictionary:(NSDictionary *)propertiesDictionary
{
  return (CMIOExtensionDeviceProperties *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDictionary:", propertiesDictionary);
}

- (CMIOExtensionDeviceProperties)initWithDictionary:(NSDictionary *)propertiesDictionary
{
  CMIOExtensionDeviceProperties *v4;
  CMIOExtensionDeviceProperties *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMIOExtensionDeviceProperties;
  v4 = -[CMIOExtensionDeviceProperties init](&v7, sel_init);
  v5 = v4;
  if (propertiesDictionary && v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_propertiesDictionary = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", propertiesDictionary);
  }
  return v5;
}

- (CMIOExtensionDeviceProperties)initWithPropertyValues:(id)a3
{
  uint64_t v5;
  _QWORD v7[5];

  v5 = objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__CMIOExtensionDeviceProperties_initWithPropertyValues___block_invoke;
  v7[3] = &unk_250457618;
  v7[4] = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);
  return -[CMIOExtensionDeviceProperties initWithDictionary:](self, "initWithDictionary:", v5);
}

uint64_t __56__CMIOExtensionDeviceProperties_initWithPropertyValues___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", +[CMIOExtensionPropertyState propertyStateWithValue:](CMIOExtensionPropertyState, "propertyStateWithValue:"), a2);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionDeviceProperties;
  -[CMIOExtensionDeviceProperties dealloc](&v3, sel_dealloc);
}

- (NSString)model
{
  os_unfair_lock_s *p_lock;
  id v4;
  NSString *p_isa;
  NSObject *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (id)-[NSMutableDictionary objectForKey:](self->_propertiesDictionary, "objectForKey:", CFSTR("CMIOExtensionPropertyDeviceModel"));
  os_unfair_lock_unlock(p_lock);
  p_isa = (NSString *)objc_msgSend(v4, "value");
  if (p_isa)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      p_isa = (NSString *)&v6->isa;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionDeviceProperties model].cold.1();
        return 0;
      }
    }
  }
  return p_isa;
}

- (void)setModel:(NSString *)model
{
  NSString *v4;
  NSObject *v5;

  if (!model)
    goto LABEL_4;
  v4 = model;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    model = +[CMIOExtensionPropertyState propertyStateWithValue:attributes:](CMIOExtensionPropertyState, "propertyStateWithValue:attributes:", v4, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
LABEL_4:
    -[CMIOExtensionDeviceProperties setPropertyState:forProperty:](self, "setPropertyState:forProperty:", model, CFSTR("CMIOExtensionPropertyDeviceModel"));
    return;
  }
  v5 = CMIOLog();
  if (v5)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionDeviceProperties setModel:].cold.1();
  }
}

- (NSNumber)suspended
{
  os_unfair_lock_s *p_lock;
  id v4;
  NSNumber *v5;
  NSObject *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (id)-[NSMutableDictionary objectForKey:](self->_propertiesDictionary, "objectForKey:", CFSTR("CMIOExtensionPropertyDeviceIsSuspended"));
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
          -[CMIOExtensionDeviceProperties suspended].cold.1();
        return 0;
      }
    }
  }
  return v5;
}

- (void)setSuspended:(NSNumber *)suspended
{
  NSNumber *v4;
  NSObject *v5;

  if (!suspended)
    goto LABEL_4;
  v4 = suspended;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    suspended = +[CMIOExtensionPropertyState propertyStateWithValue:attributes:](CMIOExtensionPropertyState, "propertyStateWithValue:attributes:", v4, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
LABEL_4:
    -[CMIOExtensionDeviceProperties setPropertyState:forProperty:](self, "setPropertyState:forProperty:", suspended, CFSTR("CMIOExtensionPropertyDeviceIsSuspended"));
    return;
  }
  v5 = CMIOLog();
  if (v5)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionDeviceProperties setSuspended:].cold.1();
  }
}

- (NSNumber)transportType
{
  os_unfair_lock_s *p_lock;
  id v4;
  NSNumber *v5;
  NSObject *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (id)-[NSMutableDictionary objectForKey:](self->_propertiesDictionary, "objectForKey:", CFSTR("CMIOExtensionPropertyDeviceTransportType"));
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
          -[CMIOExtensionDeviceProperties transportType].cold.1();
        return 0;
      }
    }
  }
  return v5;
}

- (void)setTransportType:(NSNumber *)transportType
{
  NSNumber *v4;
  NSObject *v5;

  if (!transportType)
    goto LABEL_4;
  v4 = transportType;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    transportType = +[CMIOExtensionPropertyState propertyStateWithValue:attributes:](CMIOExtensionPropertyState, "propertyStateWithValue:attributes:", v4, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
LABEL_4:
    -[CMIOExtensionDeviceProperties setPropertyState:forProperty:](self, "setPropertyState:forProperty:", transportType, CFSTR("CMIOExtensionPropertyDeviceTransportType"));
    return;
  }
  v5 = CMIOLog();
  if (v5)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionDeviceProperties setTransportType:].cold.1();
  }
}

- (NSString)linkedCoreAudioDeviceUID
{
  os_unfair_lock_s *p_lock;
  id v4;
  NSString *p_isa;
  NSObject *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (id)-[NSMutableDictionary objectForKey:](self->_propertiesDictionary, "objectForKey:", CFSTR("CMIOExtensionPropertyDeviceLinkedCoreAudioDeviceUID"));
  os_unfair_lock_unlock(p_lock);
  p_isa = (NSString *)objc_msgSend(v4, "value");
  if (p_isa)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      p_isa = (NSString *)&v6->isa;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionDeviceProperties linkedCoreAudioDeviceUID].cold.1();
        return 0;
      }
    }
  }
  return p_isa;
}

- (void)setLinkedCoreAudioDeviceUID:(NSString *)linkedCoreAudioDeviceUID
{
  NSString *v4;
  NSObject *v5;

  if (!linkedCoreAudioDeviceUID)
    goto LABEL_4;
  v4 = linkedCoreAudioDeviceUID;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    linkedCoreAudioDeviceUID = +[CMIOExtensionPropertyState propertyStateWithValue:attributes:](CMIOExtensionPropertyState, "propertyStateWithValue:attributes:", v4, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
LABEL_4:
    -[CMIOExtensionDeviceProperties setPropertyState:forProperty:](self, "setPropertyState:forProperty:", linkedCoreAudioDeviceUID, CFSTR("CMIOExtensionPropertyDeviceLinkedCoreAudioDeviceUID"));
    return;
  }
  v5 = CMIOLog();
  if (v5)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionDeviceProperties setLinkedCoreAudioDeviceUID:].cold.1();
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

- (void)model
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
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s model is not from NSString type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setModel:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s model is not from NSString type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)suspended
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
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s suspended is not from NSNumber type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setSuspended:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s suspended is not from NSNumber type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)transportType
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
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s transportType is not from NSNumber type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setTransportType:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s transportType is not from NSNumber type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)linkedCoreAudioDeviceUID
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
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s linkedCoreAudioDeviceUID is not from NSString type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setLinkedCoreAudioDeviceUID:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s linkedCoreAudioDeviceUID is not from NSString type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
