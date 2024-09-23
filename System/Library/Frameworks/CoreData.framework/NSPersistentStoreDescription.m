@implementation NSPersistentStoreDescription

- (void)setType:(NSString *)type
{
  objc_setProperty_atomic_copy(self, a2, type, 16);
}

- (void)setValue:(NSObject *)value forPragmaNamed:(NSString *)name
{
  id v7;

  v7 = (id)-[NSDictionary mutableCopy](-[NSPersistentStoreDescription sqlitePragmas](self, "sqlitePragmas"), "mutableCopy");
  if (value)
    objc_msgSend(v7, "setObject:forKey:", value, name);
  else
    objc_msgSend(v7, "removeObjectForKey:", name);
  -[NSPersistentStoreDescription setOption:forKey:](self, "setOption:forKey:", (id)objc_msgSend(v7, "copy"), CFSTR("NSSQLitePragmasOption"));

}

- (void)setOption:(NSObject *)option forKey:(NSString *)key
{
  NSMutableDictionary *options;

  options = self->_options;
  if (option)
    -[NSMutableDictionary setObject:forKey:](options, "setObject:forKey:", option, key);
  else
    -[NSMutableDictionary removeObjectForKey:](options, "removeObjectForKey:", key);
}

- (NSDictionary)sqlitePragmas
{
  NSDictionary *result;

  result = (NSDictionary *)-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("NSSQLitePragmasOption"));
  if (!result)
    return (NSDictionary *)MEMORY[0x1E0C9AA70];
  return result;
}

- (void)setURL:(NSURL *)URL
{
  objc_setProperty_atomic_copy(self, a2, URL, 32);
}

- (void)setShouldMigrateStoreAutomatically:(BOOL)shouldMigrateStoreAutomatically
{
  -[NSPersistentStoreDescription setOption:forKey:](self, "setOption:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", shouldMigrateStoreAutomatically), CFSTR("NSMigratePersistentStoresAutomaticallyOption"));
}

- (void)setShouldAddStoreAsynchronously:(BOOL)shouldAddStoreAsynchronously
{
  -[NSPersistentStoreDescription setOption:forKey:](self, "setOption:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", shouldAddStoreAsynchronously), CFSTR("NSAddStoreAsynchronouslyOption"));
}

- (void)setShouldInferMappingModelAutomatically:(BOOL)shouldInferMappingModelAutomatically
{
  -[NSPersistentStoreDescription setOption:forKey:](self, "setOption:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", shouldInferMappingModelAutomatically), CFSTR("NSInferMappingModelAutomaticallyOption"));
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSPersistentStoreDescription;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (type: %@, url: %@)"), -[NSPersistentStoreDescription description](&v3, sel_description), -[NSPersistentStoreDescription type](self, "type"), -[NSPersistentStoreDescription URL](self, "URL"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURL:", self->_url);

  v4[3] = (id)-[NSString copy](self->_configuration, "copy");
  v4[2] = (id)-[NSString copy](self->_type, "copy");

  v4[1] = (id)-[NSMutableDictionary mutableCopy](self->_options, "mutableCopy");
  return v4;
}

- (NSPersistentStoreDescription)initWithURL:(NSURL *)url
{
  NSPersistentStoreDescription *v4;
  objc_super v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSPersistentStoreDescription;
  v4 = -[NSPersistentStoreDescription init](&v6, sel_init);
  if (v4)
  {
    v4->_url = (NSURL *)-[NSURL copy](url, "copy");
    v4->_type = (NSString *)CFSTR("SQLite");
    v7[0] = CFSTR("NSInferMappingModelAutomaticallyOption");
    v7[1] = CFSTR("NSMigratePersistentStoresAutomaticallyOption");
    v8[0] = MEMORY[0x1E0C9AAB0];
    v8[1] = MEMORY[0x1E0C9AAB0];
    v4->_options = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2), "mutableCopy");
  }
  return v4;
}

- (void)dealloc
{
  NSString *type;
  NSString *configuration;
  NSURL *url;
  NSMutableDictionary *options;
  objc_super v7;

  type = self->_type;
  if (type)

  configuration = self->_configuration;
  if (configuration)

  url = self->_url;
  if (url)

  options = self->_options;
  if (options)

  v7.receiver = self;
  v7.super_class = (Class)NSPersistentStoreDescription;
  -[NSPersistentStoreDescription dealloc](&v7, sel_dealloc);
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)shouldInvokeCompletionHandlerConcurrently
{
  void *v2;

  v2 = (void *)-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("NSInvokeCompletionHandlerConcurrently"));
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "BOOLValue");
  return (char)v2;
}

- (NSString)configuration
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSPersistentCloudKitContainerOptions)cloudKitContainerOptions
{
  return (NSPersistentCloudKitContainerOptions *)-[NSDictionary objectForKey:](-[NSPersistentStoreDescription options](self, "options"), "objectForKey:", CFSTR("NSPersistentCloudKitContainerOptionsKey"));
}

- (NSDictionary)options
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_options, "copy");
}

- (id)mirroringOptions
{
  id result;

  result = (id)-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("NSPersistentStoreMirroringOptionsKey"));
  if (!result)
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  return result;
}

- (BOOL)shouldAddStoreAsynchronously
{
  void *v2;

  v2 = (void *)-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("NSAddStoreAsynchronouslyOption"));
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "BOOLValue");
  return (char)v2;
}

+ (NSPersistentStoreDescription)persistentStoreDescriptionWithURL:(NSURL *)URL
{
  return (NSPersistentStoreDescription *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", URL);
}

- (void)setConfiguration:(NSString *)configuration
{
  objc_setProperty_atomic_copy(self, a2, configuration, 24);
}

- (NSPersistentStoreDescription)init
{
  return -[NSPersistentStoreDescription initWithURL:](self, "initWithURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/dev/null"), 0));
}

- (BOOL)shouldMigrateStoreAutomatically
{
  void *v2;

  v2 = (void *)-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("NSMigratePersistentStoresAutomaticallyOption"));
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "BOOLValue");
  return (char)v2;
}

- (BOOL)shouldInferMappingModelAutomatically
{
  void *v2;

  v2 = (void *)-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("NSInferMappingModelAutomaticallyOption"));
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "BOOLValue");
  return (char)v2;
}

- (void)setReadOnly:(BOOL)readOnly
{
  -[NSPersistentStoreDescription setOption:forKey:](self, "setOption:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", readOnly), CFSTR("NSReadOnlyPersistentStoreOption"));
}

- (void)setCloudKitContainerOptions:(NSPersistentCloudKitContainerOptions *)cloudKitContainerOptions
{
  -[NSPersistentStoreDescription setOption:forKey:](self, "setOption:forKey:", cloudKitContainerOptions, CFSTR("NSPersistentCloudKitContainerOptionsKey"));
}

+ (id)inMemoryPersistentStoreDescription
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setType:", CFSTR("SQLite"));
  objc_msgSend(v2, "setURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/dev/null"), 0));
  return v2;
}

- (BOOL)isReadOnly
{
  void *v2;

  v2 = (void *)-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("NSReadOnlyPersistentStoreOption"));
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "BOOLValue");
  return (char)v2;
}

- (NSTimeInterval)timeout
{
  void *v2;
  NSTimeInterval result;

  v2 = (void *)-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("NSPersistentStoreTimeoutOption"));
  if (!v2)
    return 240.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

- (void)setTimeout:(NSTimeInterval)timeout
{
  -[NSPersistentStoreDescription setOption:forKey:](self, "setOption:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", timeout), CFSTR("NSPersistentStoreTimeoutOption"));
}

- (void)setShouldInvokeCompletionHandlerConcurrently:(BOOL)a3
{
  -[NSPersistentStoreDescription setOption:forKey:](self, "setOption:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("NSInvokeCompletionHandlerConcurrently"));
}

- (unint64_t)hash
{
  return objc_msgSend(standardizedURL(-[NSPersistentStoreDescription URL](self, "URL")), "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v5;
  void *v6;
  int v7;
  NSString *v8;
  NSString *v9;

  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = standardizedURL(-[NSPersistentStoreDescription URL](self, "URL"));
      v6 = standardizedURL((void *)objc_msgSend(a3, "URL"));
      if (v5 == v6 || (v7 = objc_msgSend(v5, "isEqual:", v6)) != 0)
      {
        v8 = -[NSPersistentStoreDescription type](self, "type");
        if (v8 == (NSString *)objc_msgSend(a3, "type")
          || (v7 = -[NSString isEqualToString:](-[NSPersistentStoreDescription type](self, "type"), "isEqualToString:", objc_msgSend(a3, "type"))) != 0)
        {
          v9 = -[NSPersistentStoreDescription configuration](self, "configuration");
          if (v9 == (NSString *)objc_msgSend(a3, "configuration")
            || (v7 = -[NSString isEqual:](-[NSPersistentStoreDescription configuration](self, "configuration"), "isEqual:", objc_msgSend(a3, "configuration"))) != 0)
          {
            LOBYTE(v7) = -[NSDictionary isEqual:](-[NSPersistentStoreDescription options](self, "options"), "isEqual:", objc_msgSend(a3, "options"));
          }
        }
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (void)setMirroringDelegate:(id)a3
{
  -[NSPersistentStoreDescription setOption:forMirroringKey:](self, "setOption:forMirroringKey:", a3, CFSTR("NSPersistentStoreMirroringDelegateOptionKey"));
}

- (id)mirroringDelegate
{
  return (id)objc_msgSend(-[NSPersistentStoreDescription mirroringOptions](self, "mirroringOptions"), "objectForKey:", CFSTR("NSPersistentStoreMirroringDelegateOptionKey"));
}

- (void)setOption:(id)a3 forMirroringKey:(id)a4
{
  id v7;
  id v8;

  v7 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("NSPersistentStoreMirroringOptionsKey")), "mutableCopy");
  if (!v7)
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (a3)
    objc_msgSend(v7, "setObject:forKey:", a3, a4);
  else
    objc_msgSend(v7, "removeObjectForKey:", a4);
  v8 = (id)objc_msgSend(v7, "copy");
  -[NSMutableDictionary setObject:forKey:](self->_options, "setObject:forKey:", v8, CFSTR("NSPersistentStoreMirroringOptionsKey"));

}

- (BOOL)usesPersistentHistoryTracking
{
  void *v2;
  void *v3;

  v2 = (void *)-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey"));
  if (v2)
  {
    v3 = v2;
    if ((objc_msgSend(v2, "isNSDictionary") & 1) != 0)
    {
      LOBYTE(v2) = 1;
    }
    else
    {
      LODWORD(v2) = objc_msgSend(v3, "isNSNumber");
      if ((_DWORD)v2)
        LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
    }
  }
  return (char)v2;
}

- (void)setUsesPersistentHistoryTracking:(BOOL)a3
{
  -[NSPersistentStoreDescription setOption:forKey:](self, "setOption:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("NSPersistentHistoryTrackingKey"));
}

@end
