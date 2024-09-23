@implementation NSMemoryObjectStore

- (NSMemoryObjectStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6
{
  NSMemoryObjectStore *v11;
  uint64_t v12;
  NSDictionaryStoreMap *v13;
  NSDictionaryStoreMap *v14;
  objc_super v16;

  objc_opt_self();
  if (!a5)
    a5 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("memory://%lx"), self));
  v16.receiver = self;
  v16.super_class = (Class)NSMemoryObjectStore;
  v11 = -[NSMappedObjectStore initWithPersistentStoreCoordinator:configurationName:URL:options:](&v16, sel_initWithPersistentStoreCoordinator_configurationName_URL_options_, a3, a4, a5, a6);
  if (v11)
  {
    v12 = objc_msgSend(a6, "objectForKey:", CFSTR("_NSInMemoryStoreArchivedData"));
    if (v12)
      v13 = -[NSDictionaryStoreMap initWithStore:fromArchivedData:]([NSDictionaryStoreMap alloc], "initWithStore:fromArchivedData:", v11, v12);
    else
      v13 = -[NSDictionaryStoreMap initWithStore:]([NSDictionaryStoreMap alloc], "initWithStore:", v11);
    v14 = v13;
    -[NSMappedObjectStore _setMap:](v11, v13);
    -[NSMappedObjectStore setMetadata:](v11, "setMetadata:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", -[NSPersistentStoreMap databaseUUID]((uint64_t)v14), CFSTR("NSStoreUUID"), CFSTR("InMemory"), CFSTR("NSStoreType"), 0));

  }
  return v11;
}

- (id)type
{
  return CFSTR("InMemory");
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "metadataForPersistentStoreWithURL:options:error:", a3, 0, a4);
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5
{
  return objc_msgSend(a1, "setMetadata:forPersistentStoreWithURL:options:error:", a3, a4, 0, a5);
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 options:(id)a5 error:(id *)a6
{
  if (a6)
    *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134000, 0);
  return 0;
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  if (a5)
    *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134000, 0);
  return 0;
}

@end
