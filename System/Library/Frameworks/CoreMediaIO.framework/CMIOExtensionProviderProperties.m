@implementation CMIOExtensionProviderProperties

+ (CMIOExtensionProviderProperties)providerPropertiesWithDictionary:(NSDictionary *)propertiesDictionary
{
  return (CMIOExtensionProviderProperties *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDictionary:", propertiesDictionary);
}

- (CMIOExtensionProviderProperties)initWithDictionary:(NSDictionary *)propertiesDictionary
{
  CMIOExtensionProviderProperties *v4;
  CMIOExtensionProviderProperties *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMIOExtensionProviderProperties;
  v4 = -[CMIOExtensionProviderProperties init](&v7, sel_init);
  v5 = v4;
  if (propertiesDictionary && v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_propertiesDictionary = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", propertiesDictionary);
  }
  return v5;
}

- (CMIOExtensionProviderProperties)initWithPropertyValues:(id)a3 client:(id)a4
{
  uint64_t v7;
  CMIOExtensionProviderProperties *v8;
  _QWORD v10[5];

  v7 = objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__CMIOExtensionProviderProperties_initWithPropertyValues_client___block_invoke;
  v10[3] = &unk_250457618;
  v10[4] = v7;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = -[CMIOExtensionProviderProperties initWithDictionary:](self, "initWithDictionary:", v7);
  if (v8)
    v8->_client = (CMIOExtensionClient *)objc_msgSend(a4, "copy");
  return v8;
}

uint64_t __65__CMIOExtensionProviderProperties_initWithPropertyValues_client___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", +[CMIOExtensionPropertyState propertyStateWithValue:](CMIOExtensionPropertyState, "propertyStateWithValue:"), a2);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionProviderProperties;
  -[CMIOExtensionProviderProperties dealloc](&v3, sel_dealloc);
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

- (NSString)name
{
  os_unfair_lock_s *p_lock;
  id v4;
  NSString *p_isa;
  NSObject *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (id)-[NSMutableDictionary objectForKey:](self->_propertiesDictionary, "objectForKey:", CFSTR("CMIOExtensionPropertyProviderName"));
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
          -[CMIOExtensionProviderProperties name].cold.1();
        return 0;
      }
    }
  }
  return p_isa;
}

- (void)setName:(NSString *)name
{
  NSString *v4;
  NSObject *v5;

  if (!name)
    goto LABEL_4;
  v4 = name;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    name = +[CMIOExtensionPropertyState propertyStateWithValue:attributes:](CMIOExtensionPropertyState, "propertyStateWithValue:attributes:", v4, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
LABEL_4:
    -[CMIOExtensionProviderProperties setPropertyState:forProperty:](self, "setPropertyState:forProperty:", name, CFSTR("CMIOExtensionPropertyProviderName"));
    return;
  }
  v5 = CMIOLog();
  if (v5)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderProperties setName:].cold.1();
  }
}

- (NSString)manufacturer
{
  os_unfair_lock_s *p_lock;
  id v4;
  NSString *p_isa;
  NSObject *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (id)-[NSMutableDictionary objectForKey:](self->_propertiesDictionary, "objectForKey:", CFSTR("CMIOExtensionPropertyProviderManufacturer"));
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
          -[CMIOExtensionProviderProperties manufacturer].cold.1();
        return 0;
      }
    }
  }
  return p_isa;
}

- (void)setManufacturer:(NSString *)manufacturer
{
  NSString *v4;
  NSObject *v5;

  if (!manufacturer)
    goto LABEL_4;
  v4 = manufacturer;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    manufacturer = +[CMIOExtensionPropertyState propertyStateWithValue:attributes:](CMIOExtensionPropertyState, "propertyStateWithValue:attributes:", v4, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
LABEL_4:
    -[CMIOExtensionProviderProperties setPropertyState:forProperty:](self, "setPropertyState:forProperty:", manufacturer, CFSTR("CMIOExtensionPropertyProviderManufacturer"));
    return;
  }
  v5 = CMIOLog();
  if (v5)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderProperties setManufacturer:].cold.1();
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

- (void)name
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
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s name is not from NSString type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setName:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s name is not from NSString type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)manufacturer
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
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s manufacturer is not from NSString type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setManufacturer:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s manufacturer is not from NSString type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
