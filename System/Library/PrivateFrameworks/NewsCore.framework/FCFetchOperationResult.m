@implementation FCFetchOperationResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missingObjectDescriptions, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_fetchedObject, 0);
}

- (void)setMissingObjectDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

+ (FCFetchOperationResult)resultWithStatus:(unint64_t)a3 fetchedObject:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  FCFetchOperationResult *v9;

  v7 = a5;
  v8 = a4;
  v9 = -[FCFetchOperationResult initWithStatus:fetchedObject:fetchResult:error:]([FCFetchOperationResult alloc], "initWithStatus:fetchedObject:fetchResult:error:", a3, v8, 1, v7);

  return v9;
}

- (FCFetchOperationResult)initWithStatus:(unint64_t)a3 fetchedObject:(id)a4 fetchResult:(unint64_t)a5 error:(id)a6
{
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  FCFetchOperationResult *v15;
  FCFetchOperationResult *v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  if (a3 && v11)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fetchedObject must be nil if the operation wasn't successful"));
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCFetchOperationResult initWithStatus:fetchedObject:fetchResult:error:]";
    v21 = 2080;
    v22 = "FCFetchOperation.m";
    v23 = 1024;
    v24 = 173;
    v25 = 2114;
    v26 = v13;
    v14 = MEMORY[0x1E0C81028];
    goto LABEL_12;
  }
  if (!a3 && !v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fetchedObject must not be nil if the operation was successful"));
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCFetchOperationResult initWithStatus:fetchedObject:fetchResult:error:]";
    v21 = 2080;
    v22 = "FCFetchOperation.m";
    v23 = 1024;
    v24 = 174;
    v25 = 2114;
    v26 = v13;
    v14 = MEMORY[0x1E0C81028];
LABEL_12:
    _os_log_error_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_8:
  v18.receiver = self;
  v18.super_class = (Class)FCFetchOperationResult;
  v15 = -[FCFetchOperationResult init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_status = a3;
    objc_storeStrong(&v15->_fetchedObject, a4);
    v16->_fetchResult = a5;
    objc_storeStrong((id *)&v16->_error, a6);
  }

  return v16;
}

- (unint64_t)status
{
  return self->_status;
}

- (id)fetchedObject
{
  return self->_fetchedObject;
}

- (NSError)error
{
  return self->_error;
}

- (NSSet)missingObjectDescriptions
{
  return self->_missingObjectDescriptions;
}

- (BOOL)anyMissingObjects
{
  void *v2;
  BOOL v3;

  -[FCFetchOperationResult missingObjectDescriptions](self, "missingObjectDescriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (unint64_t)fetchResult
{
  return self->_fetchResult;
}

@end
