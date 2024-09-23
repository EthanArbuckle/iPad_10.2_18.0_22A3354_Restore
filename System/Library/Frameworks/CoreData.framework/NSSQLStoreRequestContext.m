@implementation NSSQLStoreRequestContext

- (void)setQueryGenerationToken:(id *)a1
{
  if (a1
    && (objc_msgSend(a1, "isWritingRequest") & 1) == 0
    && objc_msgSend(a1[1], "supportsGenerationalQuerying"))
  {
    if ((objc_msgSend(a2, "_isEnabled") & 1) != 0)
    {
      a1[8] = -[_NSQueryGenerationToken _generationalComponentForStore:]((uint64_t)a2, a1[1]);
    }
    else
    {

      a1[8] = 0;
    }
  }
}

- (BOOL)isWritingRequest
{
  return 0;
}

- (NSSQLStoreRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  NSSQLStoreRequestContext *v8;
  NSSQLStoreRequestContext *v9;
  int v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NSSQLStoreRequestContext;
  v8 = -[NSSQLStoreRequestContext init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_sqlCore = (NSSQLCore *)a5;
    v8->_persistentStoreRequest = (NSPersistentStoreRequest *)a3;
    v9->_context = (NSManagedObjectContext *)a4;
    v9->_useColoredLogging = +[NSSQLCore coloredLoggingDefault](NSSQLCore, "coloredLoggingDefault");
    v9->_useConcurrentFetching = +[NSSQLCore useConcurrentFetching](NSSQLCore, "useConcurrentFetching");
    if (a5)
    {
      v9->_hasHistoryTracking = (*((_DWORD *)a5 + 48) & 0x400) != 0;
      v10 = (*((unsigned __int8 *)a5 + 193) >> 6) & 1;
    }
    else
    {
      LOBYTE(v10) = 0;
      v9->_hasHistoryTracking = 0;
    }
    v9->_storeIsInMemory = v10;
    -[NSSQLStoreRequestContext setQueryGenerationToken:]((id *)&v9->super.isa, (void *)-[NSManagedObjectContext _queryGenerationToken](v9->_context, "_queryGenerationToken"));
  }
  return v9;
}

- (uint64_t)debugLogLevel
{
  if (result)
    return +[NSSQLCore debugDefault](NSSQLCore, "debugDefault");
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_connection)
  {
    NSLog((NSString *)CFSTR("API misuse: there shouldn't be a connection here"), a2);
    __break(1u);
  }
  else
  {
    self->_sqlCore = 0;

    self->_queryGeneration = 0;
    self->_persistentStoreRequest = 0;

    self->_context = 0;
    self->_error = 0;

    self->_exception = 0;
    self->_result = 0;

    self->_connection = 0;
    v3.receiver = self;
    v3.super_class = (Class)NSSQLStoreRequestContext;
    -[NSSQLStoreRequestContext dealloc](&v3, sel_dealloc);
  }
}

- (id)result
{
  return self->_result;
}

- (NSSQLRowCache)rowCache
{
  return (NSSQLRowCache *)-[NSSQLCore rowCacheForGeneration:](&self->_sqlCore->super.super.isa, self->_queryGeneration);
}

- (BOOL)executeRequestUsingConnection:(id)a3
{
  BOOL v5;
  NSQueryGenerationToken *queryGeneration;
  NSManagedObjectContext *context;
  uint64_t v8;
  char v9;
  int v10;
  uint64_t v11;
  const char *v12;
  BOOL v13;
  NSManagedObjectContext *v14;
  NSManagedObjectContext *v15;
  void *v17;
  id v18;
  int64x2_t v19;
  int64x2_t v20;
  int64x2_t v21;
  uint64_t v22;
  uint64_t v23;
  int64x2_t v24;
  __int128 v25;
  id newValue;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  newValue = 0;
  v5 = -[NSSQLStoreRequestContext isWritingRequest](self, "isWritingRequest");
  if (self)
    queryGeneration = self->_queryGeneration;
  else
    queryGeneration = 0;
  -[NSSQLStoreRequestContext setConnection:]((uint64_t)self, a3);
  -[NSSQLiteConnection connect]((uint64_t)a3);
  v19 = 0u;
  if (self && (context = self->_context) != 0 && (*((_BYTE *)&context->_flags + 4) & 4) != 0)
  {
    -[NSSQLiteConnection currentStats]((uint64_t)a3, (uint64_t)&v24);
    v19 = v24;
    v8 = v25;
  }
  else
  {
    v8 = 0;
  }
  if (queryGeneration)
    v9 = v5;
  else
    v9 = 1;
  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    -[NSSQLiteConnection beginReadTransaction]((uint64_t)a3);
    v11 = -[NSSQLiteConnection adoptQueryGenerationWithIdentifier:]((uint64_t)a3, (uint64_t)queryGeneration[3].super.isa);
    if ((_DWORD)v11)
    {
      v27 = CFSTR("NSSQLiteErrorDomain");
      v28[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
      v17 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v18 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99750], (int)v11, (uint64_t)CFSTR("Database connection failed to adopt query generation"), v17);
      -[_NSCoreDataException _setDomain:]((uint64_t)v18, CFSTR("NSSQLiteErrorDomain"));
      objc_exception_throw(v18);
    }
    v10 = 1;
  }
  v13 = -[NSSQLStoreRequestContext executeRequestCore:](self, "executeRequestCore:", &newValue, *(_OWORD *)&v19);
  if ((v9 & 1) == 0)
  {
    -[NSSQLiteConnection commitTransaction]((uint64_t)a3);
    v10 = 0;
  }
  if (self)
  {
    v14 = self->_context;
    if (v14)
    {
      if ((*((_BYTE *)&v14->_flags + 4) & 4) != 0)
      {
        v24 = 0u;
        v25 = 0u;
        -[NSSQLiteConnection currentStats]((uint64_t)a3, (uint64_t)&v24);
        v15 = self->_context;
        v21 = vsubq_s64(v24, v20);
        v22 = v25 - v8;
        v23 = *((_QWORD *)&v25 + 1);
        -[NSManagedObjectContext _updateDatabaseStaticsWithCacheStats:]((uint64_t)v15, (int8x16_t *)&v21);
      }
    }
  }
  if (v10)
  {
    -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)a3, 0);
    -[NSSQLiteConnection rollbackTransaction]((uint64_t)a3);
  }
  if (self && newValue)
    objc_setProperty_nonatomic(self, v12, newValue, 40);
  -[NSSQLStoreRequestContext setConnection:]((uint64_t)self, 0);
  return v13;
}

- (void)setConnection:(uint64_t)a1
{
  void *v4;
  id v5;

  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    if (v4 != a2)
    {
      if (a2)
      {
        if (v4)
          objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("*RequestContext connection may not be reset"), 0));
      }
      v5 = a2;

      *(_QWORD *)(a1 + 24) = a2;
    }
  }
}

- (void)setResult:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSPersistentStoreRequest)persistentStoreRequest
{
  return self->_persistentStoreRequest;
}

- (NSSQLObjectFaultRequestContext)createNestedObjectFaultContextForObjectWithID:(NSSQLObjectFaultRequestContext *)result
{
  if (result)
    return -[NSSQLObjectFaultRequestContext initWithObjectID:context:sqlCore:]([NSSQLObjectFaultRequestContext alloc], "initWithObjectID:context:sqlCore:", a2, result->super._context, result->super._sqlCore);
  return result;
}

- (BOOL)executeRequestCore:(id *)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
