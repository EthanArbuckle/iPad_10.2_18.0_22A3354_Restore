@implementation NWPathEvaluator

- (NWPath)path
{
  return (NWPath *)-[NWPathEvaluator copyPath](self, "copyPath");
}

- (id)copyPath
{
  NWPathEvaluator *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NWPathEvaluator internalPath](v2, "internalPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (NWPath)internalPath
{
  return (NWPath *)objc_getProperty(self, a2, 24, 1);
}

+ (id)sharedDefaultEvaluator
{
  if (sharedDefaultEvaluator_initEvaluator != -1)
    dispatch_once(&sharedDefaultEvaluator_initEvaluator, &__block_literal_global_86115);
  return (id)sharedDefaultEvaluator_sharedEvaluator;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("path")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWPathEvaluator;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)savedPathEvaluators;
    savedPathEvaluators = v2;

    v4 = objc_opt_new();
    v5 = (void *)savedPathEvaluatorsLock;
    savedPathEvaluatorsLock = v4;

  }
}

void __41__NWPathEvaluator_sharedDefaultEvaluator__block_invoke()
{
  NWPathEvaluator *v0;
  void *v1;

  v0 = -[NWPathEvaluator initWithEndpoint:parameters:]([NWPathEvaluator alloc], "initWithEndpoint:parameters:", 0, 0);
  v1 = (void *)sharedDefaultEvaluator_sharedEvaluator;
  sharedDefaultEvaluator_sharedEvaluator = (uint64_t)v0;

}

- (NWPathEvaluator)initWithEndpoint:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NWPathEvaluator *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  const char *v19;
  void *v20;
  void *v21;
  NWConcrete_nw_path_evaluator *evaluator_for_endpoint;
  char *backtrace_string;
  os_log_type_t v24;
  _BOOL4 v25;
  NSObject *v26;
  os_log_type_t v27;
  char v29;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = +[NWPathEvaluator copySavedPathEvaluatorForEndpoint:parameters:](NWPathEvaluator, "copySavedPathEvaluatorForEndpoint:parameters:", v7, v8);
  v10 = v9;
  if (!v9)
  {
    v13 = objc_msgSend(v8, "copy");
    v14 = (void *)v13;
    if (!v8 || v13)
    {
      objc_msgSend(v7, "internalEndpoint");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "internalParameters");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint(v20, v21);
      self = -[NWPathEvaluator initWithEvaluator:parameters:](self, "initWithEvaluator:parameters:", evaluator_for_endpoint, v14);

      if (self)
      {
        objc_storeStrong((id *)&self->_endpoint, a3);
        +[NWPathEvaluator savePathEvaluator:](NWPathEvaluator, "savePathEvaluator:", self);
        self = self;
        v12 = self;
LABEL_24:

        goto LABEL_25;
      }
LABEL_23:
      v12 = 0;
      goto LABEL_24;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v15 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    v32 = "-[NWPathEvaluator initWithEndpoint:parameters:]";
    v33 = 2114;
    v34 = v8;
    v16 = (void *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v29 = 0;
    if (!__nwlog_fault((const char *)v16, &type, &v29))
    {
LABEL_21:
      if (v16)
        free(v16);
      goto LABEL_23;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v17 = (id)gLogObj;
      v18 = type;
      if (os_log_type_enabled(v17, type))
      {
        *(_DWORD *)buf = 136446466;
        v32 = "-[NWPathEvaluator initWithEndpoint:parameters:]";
        v33 = 2114;
        v34 = v8;
        v19 = "%{public}s [%{public}@ copy] failed";
LABEL_18:
        v26 = v17;
        v27 = v18;
LABEL_19:
        _os_log_impl(&dword_182FBE000, v26, v27, v19, buf, 0x16u);
      }
    }
    else
    {
      if (v29)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v17 = (id)gLogObj;
        v24 = type;
        v25 = os_log_type_enabled(v17, type);
        if (backtrace_string)
        {
          if (v25)
          {
            *(_DWORD *)buf = 136446722;
            v32 = "-[NWPathEvaluator initWithEndpoint:parameters:]";
            v33 = 2114;
            v34 = v8;
            v35 = 2082;
            v36 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v17, v24, "%{public}s [%{public}@ copy] failed, dumping backtrace:%{public}s", buf, 0x20u);
          }

          free(backtrace_string);
          goto LABEL_21;
        }
        if (!v25)
          goto LABEL_20;
        *(_DWORD *)buf = 136446466;
        v32 = "-[NWPathEvaluator initWithEndpoint:parameters:]";
        v33 = 2114;
        v34 = v8;
        v19 = "%{public}s [%{public}@ copy] failed, no backtrace";
        v26 = v17;
        v27 = v24;
        goto LABEL_19;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v17 = (id)gLogObj;
      v18 = type;
      if (os_log_type_enabled(v17, type))
      {
        *(_DWORD *)buf = 136446466;
        v32 = "-[NWPathEvaluator initWithEndpoint:parameters:]";
        v33 = 2114;
        v34 = v8;
        v19 = "%{public}s [%{public}@ copy] failed, backtrace limit exceeded";
        goto LABEL_18;
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  v11 = v9;

  self = (NWPathEvaluator *)v11;
  v12 = self;
LABEL_25:

  return v12;
}

- (NWPathEvaluator)initWithEvaluator:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  NWPathEvaluator *v9;
  NWPathEvaluator *v10;
  os_unfair_lock_s **p_internalEvaluator;
  NWPath *v12;
  os_unfair_lock_s *v13;
  uint64_t v14;
  NWPath *internalPath;
  OS_nw_path_evaluator *internalEvaluator;
  id v17;
  NWPathEvaluator *v18;
  id v19;
  os_unfair_lock_s *v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  os_unfair_lock_s *v24;
  char *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  os_unfair_lock_s *v29;
  os_log_type_t v30;
  os_unfair_lock_s *v31;
  os_unfair_lock_s *v32;
  void *v33;
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  void *v37;
  char *v38;
  NSObject *v39;
  os_log_type_t v40;
  char *backtrace_string;
  os_log_type_t v42;
  _BOOL4 v43;
  char *v44;
  os_log_type_t v45;
  _BOOL4 v46;
  os_log_type_t v47;
  os_log_type_t v48;
  _QWORD v49[4];
  id v50;
  objc_super v51;
  char v52;
  os_log_type_t type;
  _BYTE location[12];
  __int16 v55;
  void *v56;
  __int16 v57;
  char *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    __nwlog_obj();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 136446210;
    *(_QWORD *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
    v34 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v52 = 0;
    if (__nwlog_fault(v34, &type, &v52))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = type;
        if (os_log_type_enabled(v35, type))
        {
          *(_DWORD *)location = 136446210;
          *(_QWORD *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          _os_log_impl(&dword_182FBE000, v35, v36, "%{public}s called with null evaluator", location, 0xCu);
        }
      }
      else if (v52)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v35 = objc_claimAutoreleasedReturnValue();
        v42 = type;
        v43 = os_log_type_enabled(v35, type);
        if (backtrace_string)
        {
          if (v43)
          {
            *(_DWORD *)location = 136446466;
            *(_QWORD *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
            v55 = 2082;
            v56 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v35, v42, "%{public}s called with null evaluator, dumping backtrace:%{public}s", location, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_58;
        }
        if (v43)
        {
          *(_DWORD *)location = 136446210;
          *(_QWORD *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          _os_log_impl(&dword_182FBE000, v35, v42, "%{public}s called with null evaluator, no backtrace", location, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v35 = objc_claimAutoreleasedReturnValue();
        v47 = type;
        if (os_log_type_enabled(v35, type))
        {
          *(_DWORD *)location = 136446210;
          *(_QWORD *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          _os_log_impl(&dword_182FBE000, v35, v47, "%{public}s called with null evaluator, backtrace limit exceeded", location, 0xCu);
        }
      }

    }
LABEL_58:
    if (v34)
      free(v34);

    goto LABEL_15;
  }
  v51.receiver = self;
  v51.super_class = (Class)NWPathEvaluator;
  v9 = -[NWPathEvaluator init](&v51, sel_init);
  v10 = v9;
  if (!v9)
  {
    __nwlog_obj();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 136446210;
    *(_QWORD *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
    v38 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v52 = 0;
    if (__nwlog_fault(v38, &type, &v52))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = type;
        if (os_log_type_enabled(v39, type))
        {
          *(_DWORD *)location = 136446210;
          *(_QWORD *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          _os_log_impl(&dword_182FBE000, v39, v40, "%{public}s [super init] failed", location, 0xCu);
        }
      }
      else if (v52)
      {
        v44 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v39 = objc_claimAutoreleasedReturnValue();
        v45 = type;
        v46 = os_log_type_enabled(v39, type);
        if (v44)
        {
          if (v46)
          {
            *(_DWORD *)location = 136446466;
            *(_QWORD *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
            v55 = 2082;
            v56 = v44;
            _os_log_impl(&dword_182FBE000, v39, v45, "%{public}s [super init] failed, dumping backtrace:%{public}s", location, 0x16u);
          }

          free(v44);
          goto LABEL_64;
        }
        if (v46)
        {
          *(_DWORD *)location = 136446210;
          *(_QWORD *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          _os_log_impl(&dword_182FBE000, v39, v45, "%{public}s [super init] failed, no backtrace", location, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v39 = objc_claimAutoreleasedReturnValue();
        v48 = type;
        if (os_log_type_enabled(v39, type))
        {
          *(_DWORD *)location = 136446210;
          *(_QWORD *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          _os_log_impl(&dword_182FBE000, v39, v48, "%{public}s [super init] failed, backtrace limit exceeded", location, 0xCu);
        }
      }

    }
LABEL_64:
    if (v38)
      free(v38);
    goto LABEL_15;
  }
  p_internalEvaluator = (os_unfair_lock_s **)&v9->_internalEvaluator;
  objc_storeStrong((id *)&v9->_internalEvaluator, a3);
  objc_storeStrong((id *)&v10->_parameters, a4);
  v12 = [NWPath alloc];
  v13 = nw_path_evaluator_copy_path(*p_internalEvaluator);
  v14 = -[NWPath initWithPath:](v12, "initWithPath:", v13);
  internalPath = v10->_internalPath;
  v10->_internalPath = (NWPath *)v14;

  if (!v10->_internalPath)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v19 = (id)gLogObj;
    v20 = *p_internalEvaluator;
    *(_DWORD *)location = 136446466;
    *(_QWORD *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
    v55 = 2114;
    v56 = v20;
    v21 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v52 = 0;
    if (__nwlog_fault(v21, &type, &v52))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v22 = (id)gLogObj;
        v23 = type;
        if (os_log_type_enabled(v22, type))
        {
          v24 = *p_internalEvaluator;
          *(_DWORD *)location = 136446466;
          *(_QWORD *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          v55 = 2114;
          v56 = v24;
          _os_log_impl(&dword_182FBE000, v22, v23, "%{public}s [[NWPath alloc] initWithPath:nw_path_evaluator_copy_path(%{public}@)] failed", location, 0x16u);
        }
      }
      else if (v52)
      {
        v26 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v22 = (id)gLogObj;
        v27 = type;
        v28 = os_log_type_enabled(v22, type);
        if (v26)
        {
          if (v28)
          {
            v29 = *p_internalEvaluator;
            *(_DWORD *)location = 136446722;
            *(_QWORD *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
            v55 = 2114;
            v56 = v29;
            v57 = 2082;
            v58 = v26;
            _os_log_impl(&dword_182FBE000, v22, v27, "%{public}s [[NWPath alloc] initWithPath:nw_path_evaluator_copy_path(%{public}@)] failed, dumping backtrace:%{public}s", location, 0x20u);
          }

          free(v26);
          if (!v21)
            goto LABEL_14;
          goto LABEL_13;
        }
        if (v28)
        {
          v32 = *p_internalEvaluator;
          *(_DWORD *)location = 136446466;
          *(_QWORD *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          v55 = 2114;
          v56 = v32;
          _os_log_impl(&dword_182FBE000, v22, v27, "%{public}s [[NWPath alloc] initWithPath:nw_path_evaluator_copy_path(%{public}@)] failed, no backtrace", location, 0x16u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v22 = (id)gLogObj;
        v30 = type;
        if (os_log_type_enabled(v22, type))
        {
          v31 = *p_internalEvaluator;
          *(_DWORD *)location = 136446466;
          *(_QWORD *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          v55 = 2114;
          v56 = v31;
          _os_log_impl(&dword_182FBE000, v22, v30, "%{public}s [[NWPath alloc] initWithPath:nw_path_evaluator_copy_path(%{public}@)] failed, backtrace limit exceeded", location, 0x16u);
        }
      }

    }
    if (!v21)
    {
LABEL_14:

LABEL_15:
      v18 = 0;
      goto LABEL_16;
    }
LABEL_13:
    free(v21);
    goto LABEL_14;
  }
  objc_initWeak((id *)location, v10);
  internalEvaluator = v10->_internalEvaluator;
  if (NWCopyInternalQueue_init_once != -1)
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
  v17 = (id)NWCopyInternalQueue_nwQueue;
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __48__NWPathEvaluator_initWithEvaluator_parameters___block_invoke;
  v49[3] = &unk_1E14AC8E0;
  objc_copyWeak(&v50, (id *)location);
  nw_path_evaluator_set_update_handler(internalEvaluator, v17, v49);

  v18 = v10;
  objc_destroyWeak(&v50);
  objc_destroyWeak((id *)location);

LABEL_16:
  return v18;
}

+ (void)savePathEvaluator:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = (id)savedPathEvaluatorsLock;
  objc_sync_enter(v3);
  objc_msgSend((id)savedPathEvaluators, "addObject:", v4);
  objc_sync_exit(v3);

}

+ (id)copySavedPathEvaluatorForEndpoint:(id)a3 parameters:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (id)savedPathEvaluatorsLock;
  objc_sync_enter(v7);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (id)savedPathEvaluators;
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "matchesEndpoint:parameters:", v5, v6, (_QWORD)v14))
        {
          v9 = v12;
          goto LABEL_11;
        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v7);
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  if (v4 && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    objc_msgSend(v5, "endpoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[NWPathEvaluator matchesEndpoint:parameters:](self, "matchesEndpoint:parameters:", v6, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)matchesEndpoint:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  int v11;
  id v12;
  char v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  -[NWPathEvaluator endpoint](self, "endpoint");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v9;
  v11 = v8 == v9;
  if (v8 != v9 && v8 && v9)
  {
    if (!objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()))
    {

      v13 = 0;
      v14 = v8;
LABEL_16:

      goto LABEL_17;
    }
    v11 = objc_msgSend(v8, "isEqual:", v10);
  }

  if (v11)
  {
    -[NWPathEvaluator parameters](self, "parameters");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v6;
    v8 = v12;
    v13 = v10 == v12;
    if (v10 != v12 && v10 && v12)
    {
      if (objc_msgSend(v10, "isMemberOfClass:", objc_opt_class()))
        v13 = objc_msgSend(v10, "isEqual:", v8);
      else
        v13 = 0;
    }
    v14 = v10;
    goto LABEL_16;
  }
  v13 = 0;
LABEL_17:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[NWPathEvaluator endpoint](self, "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[NWPathEvaluator parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NWParameters)parameters
{
  return (NWParameters *)objc_getProperty(self, a2, 32, 1);
}

- (NWEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)dealloc
{
  objc_super v3;

  nw_path_evaluator_cancel(self->_internalEvaluator);
  v3.receiver = self;
  v3.super_class = (Class)NWPathEvaluator;
  -[NWPathEvaluator dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_internalPath, 0);
  objc_storeStrong((id *)&self->_internalEvaluator, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (NWPathEvaluator)initWithBrowseDescriptor:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  const char *v14;
  void *v15;
  void *v16;
  NWConcrete_nw_path_evaluator *evaluator_for_browse;
  NWPathEvaluator *v18;
  char *backtrace_string;
  os_log_type_t v20;
  _BOOL4 v21;
  NSObject *v23;
  os_log_type_t v24;
  char v25;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)v8;
  if (v7 && !v8)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    v28 = "-[NWPathEvaluator initWithBrowseDescriptor:parameters:]";
    v29 = 2114;
    v30 = v7;
    v11 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v25 = 0;
    if (__nwlog_fault(v11, &type, &v25))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (id)gLogObj;
        v13 = type;
        if (!os_log_type_enabled(v12, type))
          goto LABEL_21;
        *(_DWORD *)buf = 136446466;
        v28 = "-[NWPathEvaluator initWithBrowseDescriptor:parameters:]";
        v29 = 2114;
        v30 = v7;
        v14 = "%{public}s [%{public}@ copy] failed";
LABEL_19:
        v23 = v12;
        v24 = v13;
        goto LABEL_20;
      }
      if (!v25)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (id)gLogObj;
        v13 = type;
        if (!os_log_type_enabled(v12, type))
          goto LABEL_21;
        *(_DWORD *)buf = 136446466;
        v28 = "-[NWPathEvaluator initWithBrowseDescriptor:parameters:]";
        v29 = 2114;
        v30 = v7;
        v14 = "%{public}s [%{public}@ copy] failed, backtrace limit exceeded";
        goto LABEL_19;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v12 = (id)gLogObj;
      v20 = type;
      v21 = os_log_type_enabled(v12, type);
      if (!backtrace_string)
      {
        if (!v21)
        {
LABEL_21:

          if (!v11)
            goto LABEL_15;
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136446466;
        v28 = "-[NWPathEvaluator initWithBrowseDescriptor:parameters:]";
        v29 = 2114;
        v30 = v7;
        v14 = "%{public}s [%{public}@ copy] failed, no backtrace";
        v23 = v12;
        v24 = v20;
LABEL_20:
        _os_log_impl(&dword_182FBE000, v23, v24, v14, buf, 0x16u);
        goto LABEL_21;
      }
      if (v21)
      {
        *(_DWORD *)buf = 136446722;
        v28 = "-[NWPathEvaluator initWithBrowseDescriptor:parameters:]";
        v29 = 2114;
        v30 = v7;
        v31 = 2082;
        v32 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v12, v20, "%{public}s [%{public}@ copy] failed, dumping backtrace:%{public}s", buf, 0x20u);
      }

      free(backtrace_string);
    }
    if (!v11)
    {
LABEL_15:
      v18 = 0;
      goto LABEL_16;
    }
LABEL_14:
    free(v11);
    goto LABEL_15;
  }
  objc_msgSend(v6, "internalDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "internalParameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  evaluator_for_browse = nw_path_create_evaluator_for_browse(v15, v16);
  self = -[NWPathEvaluator initWithEvaluator:parameters:](self, "initWithEvaluator:parameters:", evaluator_for_browse, v9);

  v18 = self;
LABEL_16:

  return v18;
}

- (NWPathEvaluator)initWithListenParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  const char *v11;
  void *v12;
  NWConcrete_nw_path_evaluator *evaluator_for_listener;
  NWPathEvaluator *v14;
  char *backtrace_string;
  os_log_type_t v16;
  _BOOL4 v17;
  NSObject *v19;
  os_log_type_t v20;
  char v21;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  v6 = v5;
  if (v4 && !v5)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    v24 = "-[NWPathEvaluator initWithListenParameters:]";
    v25 = 2114;
    v26 = v4;
    v8 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v21 = 0;
    if (__nwlog_fault(v8, &type, &v21))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v9 = (id)gLogObj;
        v10 = type;
        if (!os_log_type_enabled(v9, type))
          goto LABEL_21;
        *(_DWORD *)buf = 136446466;
        v24 = "-[NWPathEvaluator initWithListenParameters:]";
        v25 = 2114;
        v26 = v4;
        v11 = "%{public}s [%{public}@ copy] failed";
LABEL_19:
        v19 = v9;
        v20 = v10;
        goto LABEL_20;
      }
      if (!v21)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v9 = (id)gLogObj;
        v10 = type;
        if (!os_log_type_enabled(v9, type))
          goto LABEL_21;
        *(_DWORD *)buf = 136446466;
        v24 = "-[NWPathEvaluator initWithListenParameters:]";
        v25 = 2114;
        v26 = v4;
        v11 = "%{public}s [%{public}@ copy] failed, backtrace limit exceeded";
        goto LABEL_19;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v9 = (id)gLogObj;
      v16 = type;
      v17 = os_log_type_enabled(v9, type);
      if (!backtrace_string)
      {
        if (!v17)
        {
LABEL_21:

          if (!v8)
            goto LABEL_15;
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136446466;
        v24 = "-[NWPathEvaluator initWithListenParameters:]";
        v25 = 2114;
        v26 = v4;
        v11 = "%{public}s [%{public}@ copy] failed, no backtrace";
        v19 = v9;
        v20 = v16;
LABEL_20:
        _os_log_impl(&dword_182FBE000, v19, v20, v11, buf, 0x16u);
        goto LABEL_21;
      }
      if (v17)
      {
        *(_DWORD *)buf = 136446722;
        v24 = "-[NWPathEvaluator initWithListenParameters:]";
        v25 = 2114;
        v26 = v4;
        v27 = 2082;
        v28 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v9, v16, "%{public}s [%{public}@ copy] failed, dumping backtrace:%{public}s", buf, 0x20u);
      }

      free(backtrace_string);
    }
    if (!v8)
    {
LABEL_15:
      v14 = 0;
      goto LABEL_16;
    }
LABEL_14:
    free(v8);
    goto LABEL_15;
  }
  objc_msgSend(v5, "internalParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  evaluator_for_listener = nw_path_create_evaluator_for_listener(v12, 0);
  self = -[NWPathEvaluator initWithEvaluator:parameters:](self, "initWithEvaluator:parameters:", evaluator_for_listener, v6);

  v14 = self;
LABEL_16:

  return v14;
}

- (NWPathEvaluator)init
{
  return -[NWPathEvaluator initWithEndpoint:parameters:](self, "initWithEndpoint:parameters:", 0, 0);
}

- (void)triggerPathAgentsIncludingVoluntary:(BOOL)a3 withCompletionHandler:(id)a4
{
  xpc_object_t v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void (**v13)(id, id, _QWORD);
  _QWORD applier[4];
  id v15;

  v13 = (void (**)(id, id, _QWORD))a4;
  v6 = xpc_array_create(0, 0);
  -[NWPathEvaluator internalEvaluator](self, "internalEvaluator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = nw_path_evaluator_trigger_agents(v7, a3, 0, v6);

  switch(v8)
  {
    case 2:
      v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v12 = 2;
LABEL_7:
      v10 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", CFSTR("NWPathEvaluatorErrorDomain"), v12, 0, v13);
      v13[2](v13, v10, 0);
      goto LABEL_8;
    case 1:
      v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v12 = 1;
      goto LABEL_7;
    case 0:
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 3221225472;
      applier[2] = __77__NWPathEvaluator_triggerPathAgentsIncludingVoluntary_withCompletionHandler___block_invoke;
      applier[3] = &unk_1E14AC908;
      v15 = v9;
      v10 = v9;
      xpc_array_apply(v6, applier);
      ((void (**)(id, id, id))v13)[2](v13, 0, v10);

LABEL_8:
      break;
  }

}

- (void)satisfyPathAgentsWithCompletionHandler:(id)a3
{
  -[NWPathEvaluator triggerPathAgentsIncludingVoluntary:withCompletionHandler:](self, "triggerPathAgentsIncludingVoluntary:withCompletionHandler:", 0, a3);
}

- (void)triggerVoluntaryPathAgentsWithCompletionHandler:(id)a3
{
  -[NWPathEvaluator triggerPathAgentsIncludingVoluntary:withCompletionHandler:](self, "triggerPathAgentsIncludingVoluntary:withCompletionHandler:", 1, a3);
}

- (BOOL)requestNexus
{
  void *v2;
  BOOL v3;

  -[NWPathEvaluator internalEvaluator](self, "internalEvaluator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_path_evaluator_request_nexus(v2);

  return v3;
}

- (OS_nw_path_evaluator)internalEvaluator
{
  return (OS_nw_path_evaluator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInternalPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

uint64_t __77__NWPathEvaluator_triggerPathAgentsIncludingVoluntary_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;
  const uint8_t *bytes;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v6 = [v4 alloc];
  bytes = xpc_uuid_get_bytes(v5);

  v8 = (void *)objc_msgSend(v6, "initWithUUIDBytes:", bytes);
  if (v8)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

  return 1;
}

void __48__NWPathEvaluator_initWithEvaluator_parameters___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  NWPath *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_sync_enter(v5);
    objc_msgSend(v5, "willChangeValueForKey:", CFSTR("path"));
    v6 = -[NWPath initWithPath:]([NWPath alloc], "initWithPath:", v7);
    objc_msgSend(v5, "setInternalPath:", v6);

    objc_sync_exit(v5);
    objc_msgSend(v5, "didChangeValueForKey:", CFSTR("path"));
  }

}

@end
