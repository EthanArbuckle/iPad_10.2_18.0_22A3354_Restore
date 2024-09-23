@implementation _LSQueryContext

+ (BOOL)simulateLimitedMappingForXCTests
{
  char *v2;

  LODWORD(v2) = objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInXCTestRigInsecure");
  if ((_DWORD)v2)
  {
    v2 = getenv("LS_SIMULATE_LIMITED_MAPPING_FOR_XCTESTS");
    if (v2)
      LOBYTE(v2) = atoi(v2) != 0;
  }
  return (char)v2;
}

+ (id)defaultContext
{
  if (+[_LSQueryContext defaultContext]::once != -1)
    dispatch_once(&+[_LSQueryContext defaultContext]::once, &__block_literal_global_63);
  return (id)+[_LSQueryContext defaultContext]::result;
}

- (void)enumerateResolvedResultsOfQuery:(id)a3 withBlock:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSQueryContext.mm"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query != nil"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSQueryContext.mm"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

LABEL_3:
  -[_LSQueryContext _resolver](self, "_resolver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "_enumerateResolvedResultsOfQuery:XPCConnection:withBlock:", v7, 0, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSQueryContext.mm"), 91, CFSTR("Could not get query resolver"));

    v16 = 0;
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[_LSQueryContext(QueryResolution) enumerateResolvedResultsOfQuery:withBlock:]", 99, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *, char *))v9)[2](v9, 0, v15, &v16);

  }
}

- (_LSQueryResolving)_resolver
{
  return (_LSQueryResolving *)self->_resolver;
}

- (id)_init
{
  _LSQueryContext *v2;
  _LSLocalQueryResolver *v3;
  id resolver;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_LSQueryContext;
  v2 = -[_LSQueryContext init](&v6, sel_init);
  if (v2)
  {
    if (_LSCurrentProcessMayMapDatabase())
      v3 = objc_alloc_init(_LSLocalQueryResolver);
    else
      v3 = objc_alloc_init(_LSXPCQueryResolver);
    resolver = v2->_resolver;
    v2->_resolver = v3;

  }
  return v2;
}

- (id)_resolveQueries:(id)a3 XPCConnection:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  -[_LSQueryContext _resolver](self, "_resolver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (!v9)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSQueryContext.mm"), 160, CFSTR("Could not get query resolver"));

    if (!v9)
    {
LABEL_7:
      v18 = *MEMORY[0x1E0CB2938];
      v19[0] = CFSTR("invalid input parameters");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSQueryContext(Internal) _resolveQueries:XPCConnection:error:]", 168, v15);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      v12 = 0;
      if (!a5)
        goto LABEL_10;
      goto LABEL_8;
    }
  }
  if (!objc_msgSend(v9, "count"))
    goto LABEL_7;
  v17 = 0;
  objc_msgSend(v11, "_resolveQueries:XPCConnection:error:", v9, v10, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v17;
  if (!a5)
    goto LABEL_10;
LABEL_8:
  if (!v12)
    *a5 = objc_retainAutorelease(v13);
LABEL_10:

  return v12;
}

- (_LSQueryContext)init
{
  abort();
}

- (id)debugDescription
{
  void *v3;
  char isKindOfClass;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;

  -[_LSQueryContext _resolver](self, "_resolver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = CFSTR("no");
  if ((isKindOfClass & 1) != 0)
    v5 = CFSTR("yes");
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@ %p> { XPC: %@ }"), v9, self, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resolver, 0);
}

- (id)resolveQueries:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v12;
  id v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSQueryContext.mm"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queries != nil"));

  }
  v13 = 0;
  -[_LSQueryContext _resolveQueries:XPCConnection:error:](self, "_resolveQueries:XPCConnection:error:", v7, 0, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  v10 = v9;
  if (a4 && !v8)
    *a4 = objc_retainAutorelease(v9);

  return v8;
}

+ (void)setSimulateLimitedMappingForXCTests:(BOOL)a3
{
  _BOOL4 v3;
  const char *v4;

  v3 = a3;
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInXCTestRigInsecure"))
  {
    if (v3)
      v4 = "1";
    else
      v4 = "0";
    setenv("LS_SIMULATE_LIMITED_MAPPING_FOR_XCTESTS", v4, 1);
  }
}

@end
