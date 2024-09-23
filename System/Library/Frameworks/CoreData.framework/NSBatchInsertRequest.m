@implementation NSBatchInsertRequest

- (id)encodeForXPC
{
  id v2;
  void *v3;
  id v4;

  v2 = -[NSBatchInsertRequestEncodingToken initForRequest:]([NSBatchInsertRequestEncodingToken alloc], "initForRequest:", self);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "setDelegate:", objc_opt_class());
  objc_msgSend(v3, "encodeObject:forKey:", v2, CFSTR("root"));
  objc_msgSend(v3, "finishEncoding");
  v4 = (id)objc_msgSend(v3, "encodedData");

  return v4;
}

+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 withPolicy:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  id result;
  NSBatchInsertRequest *v11;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", a3, 0);
  objc_msgSend(v7, "setDelegate:", a4);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  if (a5)
    v8 = (void *)objc_msgSend(v8, "setByAddingObjectsFromSet:", objc_msgSend(a5, "allowableClassesForClientWithContext:", a4));
  v9 = (void *)objc_msgSend(v7, "decodeObjectOfClasses:forKey:", v8, CFSTR("root"));

  result = (id)objc_msgSend(v9, "objectsToInsert");
  if (result)
  {
    v11 = -[NSBatchInsertRequest initWithEntityName:objects:]([NSBatchInsertRequest alloc], "initWithEntityName:objects:", objc_msgSend(v9, "entityName"), objc_msgSend(v9, "objectsToInsert"));
    -[NSBatchInsertRequest setResultType:](v11, "setResultType:", objc_msgSend(v9, "resultType"));
    -[NSBatchInsertRequest _setSecureOperation:](v11, "_setSecureOperation:", objc_msgSend(v9, "secure"));
    return v11;
  }
  return result;
}

+ (NSBatchInsertRequest)batchInsertRequestWithEntityName:(NSString *)entityName objects:(NSArray *)dictionaries
{
  return (NSBatchInsertRequest *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEntityName:objects:", entityName, dictionaries);
}

+ (NSBatchInsertRequest)batchInsertRequestWithEntityName:(NSString *)entityName dictionaryHandler:(void *)handler
{
  return (NSBatchInsertRequest *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEntityName:dictionaryHandler:", entityName, handler);
}

+ (NSBatchInsertRequest)batchInsertRequestWithEntityName:(NSString *)entityName managedObjectHandler:(void *)handler
{
  return (NSBatchInsertRequest *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEntityName:managedObjectHandler:", entityName, handler);
}

- (NSBatchInsertRequest)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v11;

  if ((_BYTE)dword_1ECD8DE20)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("-init results in undefined behavior for NSBatchInsertRequest"), 0));
  v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-init results in undefined behavior for NSBatchInsertRequest");
  _NSCoreDataLog(17, v2, v3, v4, v5, v6, v7, v8, v11);
  v9 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v11) = 0;
    _os_log_fault_impl(&dword_18A253000, v9, OS_LOG_TYPE_FAULT, "CoreData: -init results in undefined behavior for NSBatchInsertRequest", (uint8_t *)&v11, 2u);
  }
  return 0;
}

- (NSBatchInsertRequest)initWithEntityName:(NSString *)entityName objects:(NSArray *)dictionaries
{
  NSBatchInsertRequest *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSBatchInsertRequest;
  v6 = -[NSBatchInsertRequest init](&v8, sel_init);
  if (v6)
  {
    if (-[NSArray count](dictionaries, "count"))
    {
      v6->_objectsToInsert = (NSArray *)-[NSArray copy](dictionaries, "copy");
      v6->_entity = (id)-[NSString copy](entityName, "copy");
      v6->_flags = (_insertRequestFlags)(*(_DWORD *)&v6->_flags & 0xFFFFFFF8 | 4);
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (NSBatchInsertRequest)initWithEntity:(NSEntityDescription *)entity objects:(NSArray *)dictionaries
{
  NSBatchInsertRequest *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSBatchInsertRequest;
  v6 = -[NSBatchInsertRequest init](&v8, sel_init);
  if (v6)
  {
    if (-[NSArray count](dictionaries, "count"))
    {
      v6->_objectsToInsert = (NSArray *)-[NSArray copy](dictionaries, "copy");
      v6->_entity = entity;
      *(_DWORD *)&v6->_flags &= 0xFFFFFFFC;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (NSBatchInsertRequest)initWithEntity:(NSEntityDescription *)entity dictionaryHandler:(void *)handler
{
  NSBatchInsertRequest *v6;
  NSBatchInsertRequest *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSBatchInsertRequest;
  v6 = -[NSBatchInsertRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    if (handler)
    {
      v6->_insertDictionaryHandler = _Block_copy(handler);
      v7->_entity = entity;
      *(_DWORD *)&v7->_flags &= 0xFFFFFFFC;
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (NSBatchInsertRequest)initWithEntity:(NSEntityDescription *)entity managedObjectHandler:(void *)handler
{
  NSBatchInsertRequest *v6;
  NSBatchInsertRequest *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSBatchInsertRequest;
  v6 = -[NSBatchInsertRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    if (handler)
    {
      v6->_insertManagedObjectHandler = _Block_copy(handler);
      v7->_entity = entity;
      *(_DWORD *)&v7->_flags &= 0xFFFFFFFC;
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (NSBatchInsertRequest)initWithEntityName:(NSString *)entityName dictionaryHandler:(void *)handler
{
  NSBatchInsertRequest *v6;
  NSBatchInsertRequest *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSBatchInsertRequest;
  v6 = -[NSBatchInsertRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    if (handler)
    {
      v6->_insertDictionaryHandler = _Block_copy(handler);
      v7->_entity = entityName;
      v7->_flags = (_insertRequestFlags)(*(_DWORD *)&v7->_flags & 0xFFFFFFF8 | 4);
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (NSBatchInsertRequest)initWithEntityName:(NSString *)entityName managedObjectHandler:(void *)handler
{
  NSBatchInsertRequest *v6;
  NSBatchInsertRequest *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSBatchInsertRequest;
  v6 = -[NSBatchInsertRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    if (handler)
    {
      v6->_insertManagedObjectHandler = _Block_copy(handler);
      v7->_entity = entityName;
      v7->_flags = (_insertRequestFlags)(*(_DWORD *)&v7->_flags & 0xFFFFFFF8 | 4);
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  id insertDictionaryHandler;
  id insertManagedObjectHandler;
  objc_super v5;

  self->_entity = 0;
  self->_objectsToInsert = 0;
  insertDictionaryHandler = self->_insertDictionaryHandler;
  if (insertDictionaryHandler)
  {
    _Block_release(insertDictionaryHandler);
    self->_insertDictionaryHandler = 0;
  }
  insertManagedObjectHandler = self->_insertManagedObjectHandler;
  if (insertManagedObjectHandler)
  {
    _Block_release(insertManagedObjectHandler);
    self->_insertManagedObjectHandler = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)NSBatchInsertRequest;
  -[NSPersistentStoreRequest dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  NSString *v4;
  NSBatchInsertRequestResultType v5;
  __CFString *v6;
  const __CFString *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[NSBatchInsertRequest entityName](self, "entityName");
  v5 = -[NSBatchInsertRequest resultType](self, "resultType");
  objc_opt_self();
  if (v5 >= (NSBatchInsertRequestResultTypeCount|NSBatchInsertRequestResultTypeObjectIDs))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%ld' is an unknown NSBatchInsertRequestResultType value"), v5), 0));
  v6 = off_1E1EDE8E8[v5];
  if (self->_objectsToInsert)
    v7 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu objects"), -[NSArray count](-[NSBatchInsertRequest objectsToInsert](self, "objectsToInsert"), "count"));
  else
    v7 = CFSTR("handler provided");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<NSBatchInsertRequest : entity = %@ resultType = %@ and %@>"), v4, v6, v7);
}

- (NSString)entityName
{
  NSString *result;

  result = (NSString *)self->_entity;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    return (NSString *)-[NSString name](result, "name");
  return result;
}

- (NSEntityDescription)entity
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0CB2FA8], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This batch insert request (%p) was created with a string name (%@), and cannot respond to -entity until used by an NSManagedObjectContext"), self, self->_entity, 0), 0));
  return (NSEntityDescription *)self->_entity;
}

- (unint64_t)requestType
{
  return 5;
}

- (NSBatchInsertRequestResultType)resultType
{
  return *(_DWORD *)&self->_flags & 3;
}

- (void)setResultType:(NSBatchInsertRequestResultType)resultType
{
  self->_flags = (_insertRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFC | resultType & 3);
}

- (void)_setSecureOperation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_flags = (_insertRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)_secureOperation
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (void)_resolveEntityWithContext:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  id entity;
  void *v15;
  uint64_t v16;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3052000000;
    v25 = __Block_byref_object_copy__17;
    v26 = __Block_byref_object_dispose__17;
    v27 = 0;
    v5 = objc_msgSend((id)objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel");
    if (v5)
      v5 = objc_msgSend(*(id *)(v5 + 32), "objectForKey:", self->_entity);
    v27 = v5;
    if (!v23[5])
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "persistentStoreCoordinator"), "persistentStores");
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v19;
        v9 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v19 != v8)
              objc_enumerationMutation(v6);
            v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "ancillaryModels");
            v17[0] = v9;
            v17[1] = 3221225472;
            v17[2] = __50__NSBatchInsertRequest__resolveEntityWithContext___block_invoke;
            v17[3] = &unk_1E1EDE8C8;
            v17[4] = self;
            v17[5] = &v22;
            objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v17);
          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
        }
        while (v7);
      }
    }
    v12 = (void *)v23[5];
    if (!v12)
    {
      v15 = (void *)MEMORY[0x1E0C99DA0];
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't find entity for batch insert (%@)"), self->_entity);
      objc_exception_throw((id)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v16, 0));
    }
    v13 = v12;
    entity = self->_entity;
    self->_entity = (id)v23[5];
    *(_DWORD *)&self->_flags &= ~4u;

    _Block_object_dispose(&v22, 8);
  }
}

uint64_t __50__NSBatchInsertRequest__resolveEntityWithContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  if (a3)
    result = objc_msgSend(*(id *)(a3 + 32), "objectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  else
    result = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;
  return result;
}

- (void)_resolveEntityWithSQLCore:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  if (a1 && (*(_BYTE *)(a1 + 48) & 4) != 0)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3052000000;
    v15 = __Block_byref_object_copy__17;
    v16 = __Block_byref_object_dispose__17;
    v17 = 0;
    v4 = objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "managedObjectModel");
    if (v4)
      v4 = objc_msgSend(*(id *)(v4 + 32), "objectForKey:", *(_QWORD *)(a1 + 16));
    v17 = v4;
    v5 = (void *)v13[5];
    if (!v5)
    {
      v6 = (void *)objc_msgSend(a2, "ancillaryModels");
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __50__NSBatchInsertRequest__resolveEntityWithSQLCore___block_invoke;
      v11[3] = &unk_1E1EDE8C8;
      v11[4] = a1;
      v11[5] = &v12;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);
      v5 = (void *)v13[5];
      if (!v5)
      {
        v9 = (void *)MEMORY[0x1E0C99DA0];
        v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't find entity for batch insert (%@)"), *(_QWORD *)(a1 + 16));
        objc_exception_throw((id)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v10, 0));
      }
    }
    v7 = v5;
    v8 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v13[5];
    *(_DWORD *)(a1 + 48) &= ~4u;

    _Block_object_dispose(&v12, 8);
  }
}

uint64_t __50__NSBatchInsertRequest__resolveEntityWithSQLCore___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  if (a3)
    result = objc_msgSend(*(id *)(a3 + 32), "objectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  else
    result = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;
  return result;
}

- (void)dictionaryHandler
{
  return self->_insertDictionaryHandler;
}

- (void)setDictionaryHandler:(void *)dictionaryHandler
{
  id insertDictionaryHandler;

  insertDictionaryHandler = self->_insertDictionaryHandler;
  if (insertDictionaryHandler)
  {
    _Block_release(insertDictionaryHandler);
    self->_insertDictionaryHandler = 0;
  }
  self->_insertDictionaryHandler = _Block_copy(dictionaryHandler);
}

- (void)managedObjectHandler
{
  return self->_insertManagedObjectHandler;
}

- (void)setManagedObjectHandler:(void *)managedObjectHandler
{
  id insertManagedObjectHandler;

  insertManagedObjectHandler = self->_insertManagedObjectHandler;
  if (insertManagedObjectHandler)
  {
    _Block_release(insertManagedObjectHandler);
    self->_insertManagedObjectHandler = 0;
  }
  self->_insertManagedObjectHandler = _Block_copy(managedObjectHandler);
}

- (NSArray)objectsToInsert
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setObjectsToInsert:(NSArray *)objectsToInsert
{
  objc_setProperty_atomic_copy(self, a2, objectsToInsert, 24);
}

@end
