@implementation NSPersistentContainer

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return (NSPersistentStoreCoordinator *)objc_getProperty(self, a2, 32, 1);
}

- (NSManagedObjectContext)newBackgroundContext
{
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSManagedObjectContext *v10;

  if (!-[NSArray count](-[NSPersistentStoreCoordinator persistentStores](self->_storeCoordinator, "persistentStores"), "count"))
  {
    v3 = -[NSPersistentContainer name](self, "name");
    _NSCoreDataLog(2, (uint64_t)CFSTR(" Background context created for persistent container %@ with no stores loaded"), v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  }
  v10 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 1);
  if (-[NSManagedObjectContext parentContext](self->_viewContext, "parentContext"))
    -[NSManagedObjectContext setParentContext:](v10, "setParentContext:", -[NSManagedObjectContext parentContext](self->_viewContext, "parentContext"));
  else
    -[NSManagedObjectContext setPersistentStoreCoordinator:](v10, "setPersistentStoreCoordinator:", self->_storeCoordinator);
  return v10;
}

- (NSManagedObjectContext)viewContext
{
  NSManagedObjectContext **p_viewContext;
  NSManagedObjectContext *v4;

  p_viewContext = &self->_viewContext;
  if (!self->_viewContext)
  {
    v4 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 2);
    -[NSManagedObjectContext _setPersistentStoreCoordinator:]((uint64_t)v4, self->_storeCoordinator);
    while (!__ldaxr((unint64_t *)p_viewContext))
    {
      if (!__stlxr((unint64_t)v4, (unint64_t *)p_viewContext))
        return *p_viewContext;
    }
    __clrex();

  }
  return *p_viewContext;
}

- (NSPersistentContainer)initWithName:(NSString *)name
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSPersistentContainer *v13;

  v5 = objc_msgSend((id)objc_opt_class(), "_newModelForName:", name);
  if (v5)
  {
    v12 = (void *)v5;
    v13 = -[NSPersistentContainer initWithName:managedObjectModel:](self, "initWithName:managedObjectModel:", name, v5);

    return v13;
  }
  else
  {
    _NSCoreDataLog(1, (uint64_t)CFSTR(" Failed to load model named %@"), v6, v7, v8, v9, v10, v11, (uint64_t)name);

    return 0;
  }
}

+ (id)_newModelForName:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = objc_opt_class();
  v6 = v4;
  if (v5 != objc_opt_class())
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    if (v7)
      v6 = (void *)v7;
    else
      v6 = v4;
  }
  v8 = (id)objc_msgSend(v6, "URLForResource:withExtension:", a3, CFSTR("momd"));
  if (v8)
    goto LABEL_7;
  v8 = (id)objc_msgSend(v6, "URLForResource:withExtension:", a3, CFSTR("mom"));
  if (v8)
    goto LABEL_7;
  if (v6 == v4)
    return 0;
  v8 = (id)objc_msgSend(v4, "URLForResource:withExtension:", a3, CFSTR("momd"));
  if (v8 || (result = (id)objc_msgSend(v4, "URLForResource:withExtension:", a3, CFSTR("mom")), (v8 = result) != 0))
  {
LABEL_7:
    result = -[NSManagedObjectModel initWithContentsOfURL:]([NSManagedObjectModel alloc], "initWithContentsOfURL:", v8);
    if (result)
      return result;
    v10 = objc_msgSend(v8, "path");
    _NSCoreDataLog(1, (uint64_t)CFSTR(" Failed to load model at path: %@"), v11, v12, v13, v14, v15, v16, v10);
    return 0;
  }
  return result;
}

- (NSPersistentContainer)initWithName:(NSString *)name managedObjectModel:(NSManagedObjectModel *)model
{
  NSPersistentContainer *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  objc_super v28;
  uint8_t buf[4];
  NSString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)NSPersistentContainer;
  v6 = -[NSPersistentContainer init](&v28, sel_init);
  if (v6)
  {
    if (-[NSString length](name, "length"))
    {
      if ((-[NSString isEqual:](name, "isEqual:", -[NSString lastPathComponent](-[NSString stringByStandardizingPath](name, "stringByStandardizingPath"), "lastPathComponent")) & 1) != 0)goto LABEL_7;
      v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[NSPersistentContainer initWithName:managedObjectModel:] called with invalid container name '%@'");
      _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, (uint64_t)name);
      v14 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        goto LABEL_7;
      *(_DWORD *)buf = 138412290;
      v30 = name;
      v15 = "CoreData: -[NSPersistentContainer initWithName:managedObjectModel:] called with invalid container name '%@'";
      v16 = v14;
      v17 = 12;
    }
    else
    {
      v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[NSPersistentContainer initWithName:managedObjectModel:] called with the empty string as its container name");
      _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, v27);
      v25 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
LABEL_7:
        v6->_name = (NSString *)-[NSString copy](name, "copy");
        v6->_storeCoordinator = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", model);
        v6->_storeDescriptions = 0;
        return v6;
      }
      *(_WORD *)buf = 0;
      v15 = "CoreData: -[NSPersistentContainer initWithName:managedObjectModel:] called with the empty string as its container name";
      v16 = v25;
      v17 = 2;
    }
    _os_log_fault_impl(&dword_18A253000, v16, OS_LOG_TYPE_FAULT, v15, buf, v17);
    goto LABEL_7;
  }
  return v6;
}

- (void)loadPersistentStoresWithCompletionHandler:(void *)block
{
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = -[NSPersistentContainer persistentStoreDescriptions](self, "persistentStoreDescriptions", 0);
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "copy");
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  -[NSPersistentContainer _loadStoreDescriptions:withCompletionHandler:](self, "_loadStoreDescriptions:withCompletionHandler:", v5, block);
}

- (NSArray)persistentStoreDescriptions
{
  NSArray *storeDescriptions;
  NSArray *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  NSArray *v13;
  uint8_t buf[8];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  storeDescriptions = self->_storeDescriptions;
  if (storeDescriptions)
  {
    v4 = storeDescriptions;
    objc_sync_exit(self);
    if (v4)
      return v4;
  }
  else
  {
    objc_sync_exit(self);
  }
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "defaultDirectoryURL");
  if (!v5)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(v9, "stringWithFormat:", CFSTR("+[%@ %@] Could not conjure up a useful location for writing persistent stores."), v11, NSStringFromSelector(sel__createDefaultStoreDescriptions)), 0);
    objc_exception_throw(v12);
  }
  v6 = objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.sqlite"), self->_name), 0);
  if (v6)
  {
    *(_QWORD *)buf = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "persistentStoreDescriptionClass"), "persistentStoreDescriptionWithURL:", v6);
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  v4 = v7;
  objc_sync_enter(self);
  if (self->_storeDescriptions)
  {

    v4 = self->_storeDescriptions;
  }
  else
  {
    v13 = (NSArray *)MEMORY[0x1E0C9AA60];
    if (v4)
      v13 = v4;
    self->_storeDescriptions = v13;
  }
  objc_sync_exit(self);
  if (v4)
    return v4;
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)_loadStoreDescriptions:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "count"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("-[NSPersistentContainer loadPersistentStoresWithCompletionHandler:] called on an instance with no store descriptions"), 0));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v11, "shouldAddStoreAsynchronously") & 1) == 0)
          -[NSPersistentStoreCoordinator addPersistentStoreWithDescription:completionHandler:](self->_storeCoordinator, "addPersistentStoreWithDescription:completionHandler:", v11, a4);
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(a3);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
        if (objc_msgSend(v16, "shouldAddStoreAsynchronously"))
          -[NSPersistentStoreCoordinator addPersistentStoreWithDescription:completionHandler:](self->_storeCoordinator, "addPersistentStoreWithDescription:completionHandler:", v16, a4);
      }
      v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }
}

+ (NSURL)defaultDirectoryURL
{
  NSURL *result;
  void *v5;
  uint64_t v6;
  void *v7;
  NSString *v8;
  void *v9;

  if (qword_1ECD8DB18 != -1)
    dispatch_once(&qword_1ECD8DB18, &__block_literal_global_27);
  result = (NSURL *)_MergedGlobals_86;
  if (!_MergedGlobals_86)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99768];
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = NSStringFromClass((Class)a1);
    v9 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, objc_msgSend(v7, "stringWithFormat:", CFSTR("+[%@ %@] Could not conjure up a useful location for writing persistent stores."), v8, NSStringFromSelector(a2)), 0);
    objc_exception_throw(v9);
  }
  return result;
}

+ (Class)persistentStoreDescriptionClass
{
  return (Class)objc_opt_class();
}

- (void)setPersistentStoreDescriptions:(NSArray *)persistentStoreDescriptions
{
  NSArray *storeDescriptions;

  objc_sync_enter(self);
  storeDescriptions = self->_storeDescriptions;
  if (storeDescriptions != persistentStoreDescriptions)
  {

    self->_storeDescriptions = 0;
    self->_storeDescriptions = (NSArray *)-[NSArray copy](persistentStoreDescriptions, "copy");
  }
  objc_sync_exit(self);
}

void __44__NSPersistentContainer_defaultDirectoryURL__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  char v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v29 = xmmword_18A50A8B8;
  v30 = 0;
  v8 = &v29;
  while (1)
  {
    v10 = *(_QWORD *)v8;
    v8 = (__int128 *)((char *)v8 + 8);
    v9 = v10;
    if (!v10)
    {
      _NSCoreDataLog(1, (uint64_t)CFSTR(" Found no possible URLs for directory type %lu"), a3, a4, a5, a6, a7, a8, (uint64_t)&v29);
      return;
    }
    v11 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "URLsForDirectory:inDomains:", v9, 1);
    if (objc_msgSend(v11, "count"))
    {
      v12 = (void *)objc_msgSend(v11, "objectAtIndex:", 0);
      if (v12)
        break;
    }
  }
  v13 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v28 = 0;
  v14 = objc_msgSend(v13, "fileExistsAtPath:isDirectory:", objc_msgSend(v12, "path"), &v28);
  if ((v14 & 1) != 0)
  {
    if (!v28)
    {
      _NSCoreDataLog(1, (uint64_t)CFSTR(" File %@ already exists and is not a directory!"), v15, v16, v17, v18, v19, v20, (uint64_t)v12);
      return;
    }
    goto LABEL_12;
  }
  v27 = 0;
  if (objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v27))
  {
LABEL_12:
    _MergedGlobals_86 = v12;
    return;
  }
  objc_msgSend(v27, "domain");
  objc_msgSend(v27, "code");
  _NSCoreDataLog(1, (uint64_t)CFSTR(" Failed to create directory %@: %@ (%d)"), v21, v22, v23, v24, v25, v26, (uint64_t)v12);
}

+ (NSPersistentContainer)persistentContainerWithName:(NSString *)name
{
  return (NSPersistentContainer *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithName:", name);
}

+ (NSPersistentContainer)persistentContainerWithName:(NSString *)name managedObjectModel:(NSManagedObjectModel *)model
{
  return (NSPersistentContainer *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithName:managedObjectModel:", name, model);
}

- (NSPersistentContainer)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99750];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = (void *)objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, objc_msgSend(v4, "stringWithFormat:", CFSTR("Failed to call designated initializer on '%@' \n"), NSStringFromClass(v5)), 0);
  objc_exception_throw(v6);
}

- (NSManagedObjectModel)managedObjectModel
{
  return -[NSPersistentStoreCoordinator managedObjectModel](self->_storeCoordinator, "managedObjectModel");
}

- (void)dealloc
{
  NSString *name;
  NSManagedObjectContext *viewContext;
  NSPersistentStoreCoordinator *storeCoordinator;
  NSArray *storeDescriptions;
  objc_super v7;

  name = self->_name;
  if (name)

  viewContext = self->_viewContext;
  if (viewContext)

  storeCoordinator = self->_storeCoordinator;
  if (storeCoordinator)

  storeDescriptions = self->_storeDescriptions;
  if (storeDescriptions)

  v7.receiver = self;
  v7.super_class = (Class)NSPersistentContainer;
  -[NSPersistentContainer dealloc](&v7, sel_dealloc);
}

- (void)performBackgroundTask:(void *)block
{
  NSManagedObjectContext *v4;
  _QWORD v5[6];

  v4 = -[NSPersistentContainer newBackgroundContext](self, "newBackgroundContext");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__NSPersistentContainer_performBackgroundTask___block_invoke;
  v5[3] = &unk_1E1EDE8A0;
  v5[4] = v4;
  v5[5] = block;
  -[NSManagedObjectContext performBlock:](v4, "performBlock:", v5);
}

void __47__NSPersistentContainer_performBackgroundTask___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

+ (NSPersistentContainer)persistentContainerWithPath:(id)a3
{
  NSPersistentContainer *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = (NSPersistentContainer *)objc_msgSend(a1, "persistentContainerWithName:", objc_msgSend(a3, "lastPathComponent"));
  v6 = (void *)objc_msgSend(a1, "persistentStoreDescriptionClass");
  v8[0] = objc_msgSend(v6, "persistentStoreDescriptionWithURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3));
  -[NSPersistentContainer setPersistentStoreDescriptions:](v5, "setPersistentStoreDescriptions:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1));
  return v5;
}

+ (NSPersistentContainer)persistentContainerWithPath:(id)a3 modelNamed:(id)a4
{
  void *v6;
  NSPersistentContainer *v7;

  v6 = (void *)objc_msgSend(a1, "_newModelForName:", a4);
  v7 = (NSPersistentContainer *)objc_msgSend(a1, "persistentContainerWithPath:managedObjectModel:", a3, v6);

  return v7;
}

+ (NSPersistentContainer)persistentContainerWithPath:(id)a3 managedObjectModel:(id)a4
{
  NSPersistentContainer *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = (NSPersistentContainer *)objc_msgSend(a1, "persistentContainerWithName:managedObjectModel:", objc_msgSend(a3, "lastPathComponent"), a4);
  v7 = (void *)objc_msgSend(a1, "persistentStoreDescriptionClass");
  v9[0] = objc_msgSend(v7, "persistentStoreDescriptionWithURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3));
  -[NSPersistentContainer setPersistentStoreDescriptions:](v6, "setPersistentStoreDescriptions:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1));
  return v6;
}

+ (id)persistentContainerUsingCachedModelWithPath:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = 0;
  v5 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:");
  v6 = +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:](NSPersistentStore, "cachedModelForPersistentStoreWithURL:options:error:", v5, objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "persistentStoreDescriptionClass"), "persistentStoreDescriptionWithURL:", v5), "options"), &v15);
  if (v6)
    return (id)objc_msgSend(a1, "persistentContainerWithPath:managedObjectModel:", a3, v6);
  v8 = (uint64_t)v15;
  objc_msgSend(v15, "userInfo");
  _NSCoreDataLog(1, (uint64_t)CFSTR("cachedModelForPersistentStoreWithURL failed with error %@ and userInfo of %@"), v9, v10, v11, v12, v13, v14, v8);
  return 0;
}

- (BOOL)load:(id *)a3
{
  int v5;
  NSObject *v6;
  dispatch_time_t v7;
  id v8;
  uint64_t *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__40;
  v22 = __Block_byref_object_dispose__40;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3020000000;
  v17 = 0;
  v5 = -[NSArray count](-[NSPersistentContainer persistentStoreDescriptions](self, "persistentStoreDescriptions"), "count");
  v6 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43__NSPersistentContainer_CoreDataSPI__load___block_invoke;
  v13[3] = &unk_1E1EE0B58;
  v13[6] = &v14;
  v13[4] = v6;
  v13[5] = &v18;
  -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:](self, "loadPersistentStoresWithCompletionHandler:", v13);
  while (*((_DWORD *)v15 + 10) != v5)
  {
    v7 = dispatch_time(0, 120000000000);
    dispatch_semaphore_wait(v6, v7);
    __dmb(0xBu);
  }
  dispatch_release(v6);
  v8 = (id)v19[5];
  v9 = v19;
  if (a3)
  {
    v10 = (void *)v19[5];
    if (v10)
      *a3 = v10;
  }
  v11 = v9[5] == 0;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v11;
}

intptr_t __43__NSPersistentContainer_CoreDataSPI__load___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;

  if (a3)
  {
    objc_msgSend(a3, "userInfo");
    _NSCoreDataLog(1, (uint64_t)CFSTR("Store failed to load.  %@ with error = %@ with userInfo %@"), v5, v6, v7, v8, v9, v10, a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a3;
  }
  v11 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  do
    v12 = __ldxr(v11);
  while (__stxr(v12 + 1, v11));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
