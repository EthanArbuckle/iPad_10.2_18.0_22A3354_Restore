@implementation _LSCanOpenURLManager

- (BOOL)canOpenURL:(id)a3 publicSchemes:(BOOL)a4 privateSchemes:(BOOL)a5 XPCConnection:(id)a6 error:(id *)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  id v13;

  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSCanOpenURLManager canOpenURL:publicSchemes:privateSchemes:XPCConnection:error:]");
  LOBYTE(a7) = -[_LSCanOpenURLManager internalCanOpenURL:publicSchemes:privateSchemes:XPCConnection:error:](self, "internalCanOpenURL:publicSchemes:privateSchemes:XPCConnection:error:", v12, v10, v9, v13, a7);

  return (char)a7;
}

- (BOOL)internalCanOpenURL:(id)a3 publicSchemes:(BOOL)a4 privateSchemes:(BOOL)a5 XPCConnection:(id)a6 error:(id *)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;
  NSString *v15;
  _BOOL4 v16;
  uint64_t v17;
  char v18;
  BOOL v19;
  _BOOL4 v20;
  void *v21;
  _LSURLOverride *v22;
  _LSURLOverride *v23;
  void *v24;
  __int16 v26;
  uint64_t v27;
  _QWORD v28[2];

  v9 = a5;
  v10 = a4;
  v28[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  objc_msgSend(v12, "scheme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lowercaseString");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v26 = 0;
    -[_LSCanOpenURLManager getIsURL:alwaysCheckable:hasHandler:](self, "getIsURL:alwaysCheckable:hasHandler:", v12, &v26, (char *)&v26 + 1);
    if ((_BYTE)v26
      || (v16 = -[_LSCanOpenURLManager isXPCConnection:allowedToCheckScheme:error:](self, "isXPCConnection:allowedToCheckScheme:error:", v13, v15, a7), LOBYTE(v26) = v16, v16))
    {
      if (!HIBYTE(v26))
        goto LABEL_17;
      if (v10 && v9)
        goto LABEL_14;
      v17 = _LSGetSchemeType(v15);
      v18 = v17 != 1 || v9;
      v19 = !v10;
      if (v17)
        v19 = 0;
      if (!v19 && (v18 & 1) != 0)
      {
LABEL_14:
        v20 = 1;
      }
      else
      {
LABEL_17:
        v22 = -[_LSURLOverride initWithOriginalURL:]([_LSURLOverride alloc], "initWithOriginalURL:", v12);
        v23 = v22;
        if (v22)
        {
          -[_LSURLOverride overrideURL](v22, "overrideURL");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[_LSCanOpenURLManager internalCanOpenURL:publicSchemes:privateSchemes:XPCConnection:error:](self, "internalCanOpenURL:publicSchemes:privateSchemes:XPCConnection:error:", v24, v10, v9, v13, a7);

        }
        else if (a7)
        {
          _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"-[_LSCanOpenURLManager(PrivateSchemeChecking) internalCanOpenURL:publicSchemes:privateSchemes:XPCConnection:error:]", 276, 0);
          v20 = 0;
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = 0;
        }

      }
    }
    else
    {
      v20 = 0;
    }
    LOBYTE(a7) = v20;
  }
  else if (a7)
  {
    v27 = *MEMORY[0x1E0CB2938];
    v28[0] = CFSTR("url");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSCanOpenURLManager(PrivateSchemeChecking) internalCanOpenURL:publicSchemes:privateSchemes:XPCConnection:error:]", 282, v21);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a7) = 0;
  }

  return (char)a7;
}

- (BOOL)isXPCConnection:(id)a3 allowedToCheckScheme:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  _LSDServiceDomain *v12;
  uint64_t v13;
  __int128 v14;
  BOOL v15;
  BOOL v16;
  _LSDServiceDomain *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v23;
  uint64_t v24;
  unsigned int v25;
  void **v26;
  id v27;
  char v28;
  id v29;
  _OWORD v30[2];
  __int128 v31;
  __int128 v32;
  _OWORD v33[2];
  _OWORD v34[2];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSCanOpenURLManager.mm"), 335, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scheme != nil"));

    }
    v29 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    v12 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v13 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v26, v12, 0);

    if (v13)
    {
      v25 = 0;
      v24 = 0;
      if (!-[_LSCanOpenURLManager findApplicationBundleID:bundleData:context:forXPCConnection:](self, "findApplicationBundleID:bundleData:context:forXPCConnection:", &v25, &v24, v13, v9)|| v24 && (*(_BYTE *)(v24 + 164) & 1) != 0)
      {
        v16 = 1;
      }
      else
      {
        v14 = *(_OWORD *)(v24 + 76);
        v31 = *(_OWORD *)(v24 + 60);
        v32 = v14;
        _LSMakeVersionNumber(9, 0, 0, v30);
        v34[0] = v31;
        v34[1] = v32;
        v33[0] = v30[0];
        v33[1] = v30[1];
        if ((unint64_t)_LSVersionNumberCompare(v34, v33) > 1)
          v15 = -[_LSCanOpenURLManager legacy_isBundleID:bundleData:context:allowedToCheckScheme:error:](self, "legacy_isBundleID:bundleData:context:allowedToCheckScheme:error:", v25, v24, v13, v11, a5);
        else
          v15 = -[_LSCanOpenURLManager isBundleID:bundleData:context:allowedToCheckScheme:error:](self, "isBundleID:bundleData:context:allowedToCheckScheme:error:", v25, v24, v13, v11, a5);
        v16 = v15;
      }
    }
    else if (a5)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v17 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v18 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v26, v17, 0);

      if (v18)
        v19 = 0;
      else
        v19 = objc_retainAutorelease(v29);
      v16 = 0;
      *a5 = v19;
    }
    else
    {
      v16 = 0;
    }
    if (v26 && v28)
      _LSContextDestroy(v26);
    v20 = v27;
    v26 = 0;
    v27 = 0;

    v28 = 0;
    v21 = v29;
    v29 = 0;

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (BOOL)isBundleID:(unsigned int)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5 allowedToCheckScheme:(id)a6 error:(id *)a7
{
  id v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v13 = a6;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSCanOpenURLManager.mm"), 426, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleID != kCSStoreNullID"));

    if (a4)
    {
LABEL_3:
      if (!a5)
        goto LABEL_17;
      goto LABEL_4;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSCanOpenURLManager.mm"), 427, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleData != NULL"));

  if (!a5)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSCanOpenURLManager.mm"), 428, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context != NULL && context->db != NULL"));

    if (v13)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_4:
  if (!a5->db)
    goto LABEL_17;
  if (v13)
    goto LABEL_6;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSCanOpenURLManager.mm"), 429, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scheme != nil"));

LABEL_6:
  if (a4->types)
  {
    _LSDatabaseGetStringArray(a5->db);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_8;
LABEL_11:
    v15 = 0;
    if (!a7)
      goto LABEL_14;
    goto LABEL_12;
  }
  v14 = 0;
  if (!v13)
    goto LABEL_11;
LABEL_8:
  v15 = objc_msgSend(v14, "containsObject:", v13);
  if (!a7)
    goto LABEL_14;
LABEL_12:
  if ((v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This app is not allowed to query for scheme %@"), v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl(CFSTR("LSApplicationWorkspaceErrorDomain"), -106, (uint64_t)"-[_LSCanOpenURLManager(PrivateSchemeChecking) isBundleID:bundleData:context:allowedToCheckScheme:error:]", 448, v17);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_14:

  return v15;
}

- (void)getIsURL:(id)a3 alwaysCheckable:(BOOL *)a4 hasHandler:(BOOL *)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  int Options;
  _LSDServiceDomain *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  char v24;
  void **v25;
  id v26;
  char v27;
  id v28;
  _OWORD v29[10];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSCanOpenURLManager.mm"), 293, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url != nil"));

  }
  objc_msgSend(v9, "scheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("com-apple-audiounit")))
    {
      v12 = (void *)objc_opt_class();
      if (v12)
      {
        objc_msgSend(v12, "bindingEvaluatorForScheme:", v11);
      }
      else
      {
        v30 = 0;
        memset(v29, 0, sizeof(v29));
      }
      Options = LaunchServices::BindingEvaluator::getOptions((LaunchServices::BindingEvaluator *)v29);
      LaunchServices::BindingEvaluator::setOptions((uint64_t)v29, Options | 4);
      v28 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      +[_LSDServiceDomain defaultServiceDomain]();
      v16 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v14 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v25, v16, 0);

      if (v14)
      {
        LaunchServices::BindingEvaluator::getBestBinding((LaunchServices::BindingEvaluator *)v29, &v20);
        v13 = v24 != 0;
        if (v24)
        {
          if (v21)
            LOBYTE(v14) = *(_BYTE *)(v21 + 164) & 1;
          else
            LOBYTE(v14) = 0;

        }
        else
        {
          LOBYTE(v14) = 0;
        }
      }
      else
      {
        v13 = 0;
      }
      if (v25 && v27)
        _LSContextDestroy(v25);
      v17 = v26;
      v25 = 0;
      v26 = 0;

      v27 = 0;
      v18 = v28;
      v28 = 0;

      LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v29);
    }
    else
    {
      v13 = 1;
      LOBYTE(v14) = 1;
    }
  }
  else
  {
    v13 = 0;
    LOBYTE(v14) = 0;
  }

  if (a4)
    *a4 = v14;
  if (a5)
    *a5 = v13;

}

- (BOOL)findApplicationBundleID:(unsigned int *)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5 forXPCConnection:(id)a6
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  FSNode *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  void *v21;
  FSNode *v22;
  void *v24;
  void *v25;

  v11 = a6;
  v12 = v11;
  if (a5 && a5->db)
  {
    if (v11)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSCanOpenURLManager.mm"), 391, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context != NULL && context->db != NULL"));

    if (v12)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSCanOpenURLManager.mm"), 392, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection != nil"));

LABEL_4:
  objc_msgSend(v12, "_xpcConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)_LSCopyBundleURLForXPCConnection(v13, 0);

  if (v14)
  {
    v15 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", v14, 0, 0);
    if (v15)
    {
      if (_LSBundleFindWithNode((uint64_t)a5, v15, a3, a4))
      {

        objc_msgSend(v14, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "rangeOfString:options:", CFSTR(".app/"), 4);
        if (v17 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v19 = 0;
        }
        else
        {
          objc_msgSend(v16, "substringToIndex:", v17 + v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v20, 1);
          v22 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", v21, 0, 0);
          if (v22)
            v19 = _LSBundleFindWithNode((uint64_t)a5, v22, a3, a4) == 0;
          else
            v19 = 0;

        }
        v15 = 0;
      }
      else
      {
        v19 = 1;
      }
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (BindingEvaluator)bindingEvaluatorForScheme:(SEL)a3
{
  _QWORD *v5;
  BindingEvaluator *result;
  void *__p;
  void *v8;
  _QWORD *v9;

  LaunchServices::BindingEvaluator::CreateWithURLScheme((LaunchServices::BindingEvaluator *)a4, &retstr->var0);
  LaunchServices::BindingEvaluator::setOptions((uint64_t)retstr, 64);
  v5 = operator new(8uLL);
  __p = v5;
  *v5 = 0xE00000002;
  v8 = v5 + 1;
  v9 = v5 + 1;
  LaunchServices::BindingEvaluator::setAllowedBundleClasses((uint64_t)retstr, (uint64_t)&__p);
  result = (BindingEvaluator *)__p;
  if (__p)
  {
    v8 = __p;
    operator delete(__p);
  }
  return result;
}

+ (_LSCanOpenURLManager)sharedManager
{
  _LSAssertRunningInServer((uint64_t)"+[_LSCanOpenURLManager sharedManager]");
  if (+[_LSCanOpenURLManager sharedManager]::once != -1)
    dispatch_once(&+[_LSCanOpenURLManager sharedManager]::once, &__block_literal_global_19);
  return (_LSCanOpenURLManager *)(id)+[_LSCanOpenURLManager sharedManager]::result;
}

- (_LSCanOpenURLManager)init
{
  _LSCanOpenURLManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *canOpenURLsMap;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *canOpenURLsMapQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_LSCanOpenURLManager;
  v2 = -[_LSCanOpenURLManager init](&v9, sel_init);
  if (v2)
  {
    if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isLightweightSystemServer"))
      v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    else
      v3 = -[_LSCanOpenURLManager copySchemesMap](v2, "copySchemesMap");
    canOpenURLsMap = v2->_canOpenURLsMap;
    v2->_canOpenURLsMap = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.launchservices.canopenurl", v5);
    canOpenURLsMapQueue = v2->_canOpenURLsMapQueue;
    v2->_canOpenURLsMapQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (int64_t)schemeTypeOfScheme:(id)a3
{
  NSString *v5;
  int64_t v6;
  void *v8;

  v5 = (NSString *)a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSCanOpenURLManager schemeTypeOfScheme:]");
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSCanOpenURLManager.mm"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scheme != nil"));

  }
  v6 = _LSGetSchemeType(v5);

  return v6;
}

- (unint64_t)schemeQueryLimit
{
  return 50;
}

- (void)resetSchemeQueryLimitForApplicationWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *canOpenURLsMapQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSCanOpenURLManager resetSchemeQueryLimitForApplicationWithIdentifier:]");
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isLightweightSystemServer"))
  {
    _LSDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[_LSCanOpenURLManager resetSchemeQueryLimitForApplicationWithIdentifier:].cold.1();

  }
  else if (v4)
  {
    MEMORY[0x186DAF208]();
    canOpenURLsMapQueue = self->_canOpenURLsMapQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __74___LSCanOpenURLManager_resetSchemeQueryLimitForApplicationWithIdentifier___block_invoke;
    v7[3] = &unk_1E10422C8;
    v7[4] = self;
    v8 = v4;
    dispatch_barrier_async(canOpenURLsMapQueue, v7);

  }
}

+ (id)queryForApplicationsAvailableForOpeningURL:(id)a3
{
  id v3;
  _LSAvailableApplicationsForURLQuery *v4;

  v3 = a3;
  v4 = -[_LSAvailableApplicationsForURLQuery initWithURL:]([_LSAvailableApplicationsForURLQuery alloc], "initWithURL:", v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canOpenURLsMapQueue, 0);
  objc_storeStrong((id *)&self->_canOpenURLsMap, 0);
}

- (void)writeSchemesMap
{
  NSObject *v4;
  OS_dispatch_queue *canOpenURLsMapQueue;
  _QWORD v6[6];

  _LSAssertRunningInServer((uint64_t)"-[_LSCanOpenURLManager(PrivateSchemeChecking) writeSchemesMap]");
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isLightweightSystemServer"))
  {
    _LSDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[_LSCanOpenURLManager(PrivateSchemeChecking) writeSchemesMap].cold.1();

  }
  else
  {
    canOpenURLsMapQueue = self->_canOpenURLsMapQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62___LSCanOpenURLManager_PrivateSchemeChecking__writeSchemesMap__block_invoke;
    v6[3] = &unk_1E103FAD8;
    v6[4] = self;
    v6[5] = a2;
    _LSDispatchCoalescedAfterDelay((unsigned __int8 *)&self->_saveFlag, canOpenURLsMapQueue, v6, 1.0);
  }
}

- (id)copySchemesMap
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v11;
  uint8_t v12[16];

  _LSAssertRunningInServer((uint64_t)"-[_LSCanOpenURLManager(PrivateSchemeChecking) copySchemesMap]");
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "queriedSchemesMapFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSCanOpenURLManager.mm"), 203, CFSTR("Failed to get URL for lsd-schemes file"));

  }
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfURL:", v4);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

    if ((v8 & 1) != 0)
    {
      _LSDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[_LSCanOpenURLManager(PrivateSchemeChecking) copySchemesMap].cold.1();
    }
    else
    {
      _LSDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_182882000, v9, OS_LOG_TYPE_DEFAULT, "Scheme mapping file does not exist, creating file.", v12, 2u);
      }
    }

    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  return v5;
}

- (BOOL)legacy_isBundleID:(unsigned int)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5 allowedToCheckScheme:(id)a6 error:(id *)a7
{
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *canOpenURLsMapQueue;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  NSObject *v22;
  char v23;
  void *v24;
  NSObject *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  NSObject *v33;
  id v34;
  _QWORD block[5];
  NSObject *v36;
  uint64_t *v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  const __CFString *v42;
  uint8_t buf[4];
  NSObject *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v13 = a6;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSCanOpenURLManager.mm"), 461, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleID != kCSStoreNullID"));

    if (a4)
    {
LABEL_3:
      if (!a5)
        goto LABEL_35;
      goto LABEL_4;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSCanOpenURLManager.mm"), 462, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleData != NULL"));

  if (!a5)
  {
LABEL_35:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSCanOpenURLManager.mm"), 463, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context != NULL && context->db != NULL"));

    if (v13)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_4:
  if (!a5->db)
    goto LABEL_35;
  if (v13)
    goto LABEL_6;
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSCanOpenURLManager.mm"), 464, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scheme != nil"));

LABEL_6:
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isLightweightSystemServer"))
  {
    _LSDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[_LSCanOpenURLManager(PrivateSchemeChecking) legacy_isBundleID:bundleData:context:allowedToCheckScheme:error:].cold.1();
    goto LABEL_15;
  }
  v15 = _CSStringCopyCFString();
  v14 = v15;
  if (!v15)
  {
LABEL_15:
    v20 = 0;
    goto LABEL_24;
  }
  v38 = 0;
  v39[0] = &v38;
  v39[1] = 0x3032000000;
  v39[2] = __Block_byref_object_copy__12;
  v39[3] = __Block_byref_object_dispose__12;
  v40 = 0;
  canOpenURLsMapQueue = self->_canOpenURLsMapQueue;
  v17 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111___LSCanOpenURLManager_PrivateSchemeChecking__legacy_isBundleID_bundleData_context_allowedToCheckScheme_error___block_invoke;
  block[3] = &unk_1E10422F0;
  v37 = &v38;
  block[4] = self;
  v14 = v15;
  v36 = v14;
  dispatch_sync(canOpenURLsMapQueue, block);
  v18 = *(void **)(v39[0] + 40);
  if (v18)
  {
    if (objc_msgSend(v18, "containsObject:", v13))
    {
      _LSDefaultLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[_LSCanOpenURLManager(PrivateSchemeChecking) legacy_isBundleID:bundleData:context:allowedToCheckScheme:error:].cold.3();

      goto LABEL_22;
    }
    if ((unint64_t)objc_msgSend(*(id *)(v39[0] + 40), "count") > 0x31)
    {
      _LSDefaultLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[_LSCanOpenURLManager(PrivateSchemeChecking) legacy_isBundleID:bundleData:context:allowedToCheckScheme:error:].cold.4((uint64_t)v14, (uint64_t)v39, v26);

      v20 = 0;
      goto LABEL_23;
    }
    _LSDefaultLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v27 = objc_msgSend(*(id *)(v39[0] + 40), "count");
      *(_DWORD *)buf = 138412802;
      v44 = v14;
      v45 = 1024;
      v46 = v27;
      v47 = 2112;
      v48 = v13;
      _os_log_debug_impl(&dword_182882000, v21, OS_LOG_TYPE_DEBUG, "LSTesting: app %@ has only asked about %d schemes, adding %@ and allowing", buf, 0x1Cu);
    }
  }
  else
  {
    _LSDefaultLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[_LSCanOpenURLManager(PrivateSchemeChecking) legacy_isBundleID:bundleData:context:allowedToCheckScheme:error:].cold.2();
  }

  MEMORY[0x186DAF208]();
  v22 = self->_canOpenURLsMapQueue;
  v32[0] = v17;
  v32[1] = 3221225472;
  v32[2] = __111___LSCanOpenURLManager_PrivateSchemeChecking__legacy_isBundleID_bundleData_context_allowedToCheckScheme_error___block_invoke_60;
  v32[3] = &unk_1E1042318;
  v32[4] = self;
  v33 = v14;
  v34 = v13;
  dispatch_barrier_async(v22, v32);

LABEL_22:
  v20 = 1;
LABEL_23:

  _Block_object_dispose(&v38, 8);
LABEL_24:

  if (a7)
    v23 = v20;
  else
    v23 = 1;
  if ((v23 & 1) == 0)
  {
    v41 = *MEMORY[0x1E0CB2D50];
    v42 = CFSTR("This app has exceeded the number of allowed scheme queries");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl(CFSTR("LSApplicationWorkspaceErrorDomain"), -107, (uint64_t)"-[_LSCanOpenURLManager(PrivateSchemeChecking) legacy_isBundleID:bundleData:context:allowedToCheckScheme:error:]", 524, v24);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v20;
}

- (void)resetSchemeQueryLimitForApplicationWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_182882000, v0, v1, "should not reset scheme query limit in system lsd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

@end
