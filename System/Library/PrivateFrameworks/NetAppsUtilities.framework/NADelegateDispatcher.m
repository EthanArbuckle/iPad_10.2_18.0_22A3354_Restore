@implementation NADelegateDispatcher

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_observerTable, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)dispatchMessageExcludingSender:(id)a3 usingBlock:(id)a4
{
  os_unfair_lock_s *p_lock;
  void (**v7)(id, NADelegateDispatcher *);
  id v8;
  NSArray *v9;
  void *v10;
  NSArray *v11;
  NSArray *overrideObservers;
  NSArray *v13;
  NSArray *v14;

  p_lock = &self->_lock;
  v7 = (void (**)(id, NADelegateDispatcher *))a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  v9 = self->_overrideObservers;
  -[NSHashTable allObjects](self->_observerTable, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (NSArray *)objc_msgSend(v10, "mutableCopy");

  -[NSArray removeObject:](v11, "removeObject:", v8);
  overrideObservers = self->_overrideObservers;
  self->_overrideObservers = v11;

  os_unfair_lock_unlock(p_lock);
  v7[2](v7, self);

  os_unfair_lock_lock(p_lock);
  v13 = self->_overrideObservers;
  self->_overrideObservers = v9;
  v14 = v9;

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_observerTable, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "_methodMetadataForSelector:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_logEventForSelector:metadata:formatArgs:arg0:", *(_QWORD *)(a1 + 32), v7, 1, v6);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_4;
  v17 = &unk_1E62282F8;
  v8 = *(_QWORD *)(a1 + 32);
  v18 = v5;
  v20 = v8;
  v9 = v6;
  v19 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x1B5E0F7A8](&v14);
  objc_msgSend(v7, "customHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v7, "customHandler");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "na_arrayWithTerminator:nullableObjects:", CFSTR("__var_arg_terminator__"), v14, v15, v16, v17, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void (**)(_QWORD)))v12)[2](v12, v13, v10);

  }
  else
  {
    v10[2](v10);
  }

}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_effectiveObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, *(SEL *)(a1 + 48), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)registerCustomLogSettings:(id)a3 forSelector:(SEL)a4 argumentIndex:(unint64_t)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  p_lock = &self->_lock;
  v9 = a3;
  os_unfair_lock_lock(p_lock);
  -[NADelegateDispatcher _lock_methodMetadataForSelector:](self, "_lock_methodMetadataForSelector:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "customLogSettingsByArgumentIndex");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    v11 = (void *)MEMORY[0x1E0C9AA70];
  v13 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, v14);

  objc_msgSend(v10, "setCustomLogSettingsByArgumentIndex:", v13);
  os_unfair_lock_unlock(p_lock);
}

- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4 formatArgs:(BOOL)a5 arg0:(id)a6 arg1:(id)a7 arg2:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NADelegateMethodLogSettings *logSettings;
  void *v21;
  NADelegateMethodLogSettings *v22;
  NSObject *v23;
  os_log_type_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  id v38;
  void *v39;
  id v40;
  void (**v41)(_QWORD, _QWORD, _QWORD, const char *, ...);
  void *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v11 = a5;
  v55 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (self->_logSettings)
  {
    NSStringFromSelector(a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "componentsSeparatedByString:", CFSTR(":"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    logSettings = self->_logSettings;
    if (logSettings)
    {
      -[NADelegateMethodLogSettings logger](logSettings, "logger");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = self->_logSettings;
      if (v21)
      {
        -[NADelegateMethodLogSettings logger](v22, "logger");
        v41 = (void (**)(_QWORD, _QWORD, _QWORD, const char *, ...))objc_claimAutoreleasedReturnValue();
        -[NADelegateMethodLogSettings log](self->_logSettings, "log");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = -[NADelegateMethodLogSettings logType](self->_logSettings, "logType");
        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v15, 0, v11, v14);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v16, 1, v11, v14);
        v42 = v19;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "objectAtIndexedSubscript:", 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v17, 2, v11, v14);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD, const char *, ...))v41)[2](v41, v39, v37, "%{public}@: %@ %{public}@: %@ %{public}@: %@", v35, v33, v29, v30, v31, v32);

        v19 = v42;
      }
      else
      {
        -[NADelegateMethodLogSettings log](v22, "log");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = -[NADelegateMethodLogSettings logType](self->_logSettings, "logType");
        if (os_log_type_enabled(v23, v24))
        {
          objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v15, 0, v11, v14);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v16, 1, v11, v14);
          v38 = v16;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
          v40 = v15;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v17, 2, v11, v14);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v44 = v36;
          v45 = 2112;
          v46 = v34;
          v47 = 2114;
          v48 = v25;
          v49 = 2112;
          v50 = v26;
          v51 = 2114;
          v52 = v27;
          v53 = 2112;
          v54 = v28;
          _os_log_impl(&dword_1B0CB0000, v23, v24, "%{public}@: %@ %{public}@: %@ %{public}@: %@", buf, 0x3Eu);

          v15 = v40;
          v16 = v38;

        }
      }
    }

  }
}

- (id)_descriptionForArgument:(id)a3 index:(unint64_t)a4 format:(BOOL)a5 metadata:(id)a6
{
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NADelegateMethodLogSettings *v14;
  NADelegateMethodLogSettings *logSettings;
  NADelegateMethodLogSettings *v16;
  id v17;

  v7 = a5;
  v10 = a3;
  v11 = v10;
  if (v7)
  {
    objc_msgSend(a6, "customLogSettingsByArgumentIndex");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (NADelegateMethodLogSettings *)objc_claimAutoreleasedReturnValue();
    logSettings = v14;
    if (!v14)
      logSettings = self->_logSettings;
    v16 = logSettings;

    -[NADelegateMethodLogSettings formattedDescriptionForArgument:](v16, "formattedDescriptionForArgument:", v11);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = v10;
  }

  return v17;
}

uint64_t __56__NADelegateDispatcher__logEventForInvocation_metadata___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_descriptionForArgument:index:format:metadata:", a2, a3, 1, *(_QWORD *)(a1 + 40));
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void (*v23)(void);
  objc_class *v24;
  const char *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  NADelegateDispatcher *v31;
  id v32;

  v4 = a3;
  -[NADelegateDispatcher _methodMetadataForSelector:](self, "_methodMetadataForSelector:", objc_msgSend(v4, "selector"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NADelegateDispatcher _logEventForInvocation:metadata:](self, "_logEventForInvocation:metadata:", v4, v5);
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __42__NADelegateDispatcher_forwardInvocation___block_invoke;
  v30 = &unk_1E6227C70;
  v31 = self;
  v6 = v4;
  v32 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1B5E0F7A8](&v27);
  objc_msgSend(v5, "customHandler", v27, v28, v29, v30, v31);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "customHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_argumentsAsObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void (**)(_QWORD)))v9)[2](v9, v10, v7);

  }
  else
  {
    v7[2](v7);
  }
  v11 = objc_msgSend(v6, "selector");
  objc_msgSend(v6, "methodSignature");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NADelegateDispatcher _trampolineBlockForSelector:withMethodSignature:](self, "_trampolineBlockForSelector:withMethodSignature:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "methodSignature");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "numberOfArguments");

    if (v16)
    {
      v17 = 0;
      do
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "methodSignature");
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v18, "stringWithUTF8String:", objc_msgSend(v19, "getArgumentTypeAtIndex:", v17));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "appendString:", v20);

        ++v17;
        objc_msgSend(v6, "methodSignature");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "numberOfArguments");

      }
      while (v17 < v22);
    }
    v23 = imp_implementationWithBlock(v13);
    v24 = (objc_class *)objc_opt_class();
    v25 = (const char *)objc_msgSend(v6, "selector");
    v26 = objc_retainAutorelease(v14);
    class_addMethod(v24, v25, v23, (const char *)objc_msgSend(v26, "UTF8String"));

  }
}

+ (id)dispatcherWithProtocol:(id)a3 logSettings:(id)a4
{
  Protocol *v5;
  void *v6;
  id v7;
  id v8;
  const char *v9;
  objc_class *Class;
  objc_class *v11;
  void *v12;

  v5 = (Protocol *)a3;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("NADelegateDisptacher_%s"), protocol_getName(v5));
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  Class = objc_getClass(v9);
  if (!Class)
  {
    v11 = (objc_class *)objc_opt_class();
    Class = objc_allocateClassPair(v11, v9, 0);
    class_addProtocol(Class, v5);
    objc_registerClassPair(Class);
  }
  v12 = (void *)objc_msgSend([Class alloc], "initWithProtocol:logSettings:", v5, v7);

  return v12;
}

- (NADelegateDispatcher)initWithProtocol:(id)a3 logSettings:(id)a4
{
  id v7;
  id v8;
  NADelegateDispatcher *v9;
  NADelegateDispatcher *v10;
  uint64_t v11;
  NSHashTable *observerTable;
  uint64_t v13;
  NSMapTable *cachedMethodMetadataBySelector;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NADelegateDispatcher;
  v9 = -[NADelegateDispatcher init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_protocol, a3);
    objc_storeStrong((id *)&v10->_logSettings, a4);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    observerTable = v10->_observerTable;
    v10->_observerTable = (NSHashTable *)v11;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 258, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    cachedMethodMetadataBySelector = v10->_cachedMethodMetadataBySelector;
    v10->_cachedMethodMetadataBySelector = (NSMapTable *)v13;

  }
  return v10;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  BOOL v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NADelegateDispatcher;
  if (-[NADelegateDispatcher respondsToSelector:](&v8, sel_respondsToSelector_))
    return 1;
  -[NADelegateDispatcher methodSignatureForSelector:](self, "methodSignatureForSelector:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6 != 0;

  return v5;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v3;
  void *v4;

  -[NADelegateDispatcher _methodMetadataForSelector:](self, "_methodMetadataForSelector:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "methodSignature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)registerCustomHandlerForSelector:(SEL)a3 handler:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  void *v8;

  p_lock = &self->_lock;
  v7 = a4;
  os_unfair_lock_lock(p_lock);
  -[NADelegateDispatcher _lock_methodMetadataForSelector:](self, "_lock_methodMetadataForSelector:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCustomHandler:", v7);

  os_unfair_lock_unlock(p_lock);
}

- (id)_methodMetadataForSelector:(SEL)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NADelegateDispatcher _lock_methodMetadataForSelector:](self, "_lock_methodMetadataForSelector:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_lock_methodMetadataForSelector:(SEL)a3
{
  void *v5;
  _NADelegateMethodMetadata *v6;
  void *v7;
  _NADelegateMethodMetadata *v8;
  objc_super v10;

  NSMapGet(self->_cachedMethodMetadataBySelector, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NADelegateDispatcher;
    -[NADelegateDispatcher methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend((id)objc_opt_class(), "_findMethodSignatureForSelector:inProtocol:", a3, self->_protocol);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_alloc_init(_NADelegateMethodMetadata);
    -[_NADelegateMethodMetadata setMethodSignature:](v8, "setMethodSignature:", v7);
    NSMapInsert(self->_cachedMethodMetadataBySelector, a3, v8);
    v6 = v8;

  }
  return v6;
}

- (id)_trampolineBlockForSelector:(SEL)a3 withMethodSignature:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a4;
  if ((unint64_t)objc_msgSend(v5, "numberOfArguments") < 3)
  {
LABEL_5:
    switch(objc_msgSend(v5, "numberOfArguments"))
    {
      case 2:
        v19 = MEMORY[0x1E0C809B0];
        v8 = &__block_descriptor_40_e30_v16__0__NADelegateDispatcher_8l;
        v9 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke;
        v10 = &v19;
        break;
      case 3:
        v18 = MEMORY[0x1E0C809B0];
        v8 = &__block_descriptor_40_e33_v24__0__NADelegateDispatcher_8_16l;
        v9 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_3;
        v10 = &v18;
        break;
      case 4:
        v17 = MEMORY[0x1E0C809B0];
        v8 = &__block_descriptor_40_e36_v32__0__NADelegateDispatcher_8_16_24l;
        v9 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_5;
        v10 = &v17;
        break;
      case 5:
        v16 = MEMORY[0x1E0C809B0];
        v8 = &__block_descriptor_40_e39_v40__0__NADelegateDispatcher_8_16_24_32l;
        v9 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_7;
        v10 = &v16;
        break;
      case 6:
        v15 = MEMORY[0x1E0C809B0];
        v8 = &__block_descriptor_40_e42_v48__0__NADelegateDispatcher_8_16_24_32_40l;
        v9 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_9;
        v10 = &v15;
        break;
      case 7:
        v14 = MEMORY[0x1E0C809B0];
        v8 = &__block_descriptor_40_e45_v56__0__NADelegateDispatcher_8_16_24_32_40_48l;
        v9 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_11;
        v10 = &v14;
        break;
      case 8:
        v13 = MEMORY[0x1E0C809B0];
        v8 = &__block_descriptor_40_e48_v64__0__NADelegateDispatcher_8_16_24_32_40_48_56l;
        v9 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_13;
        v10 = &v13;
        break;
      default:
        goto LABEL_7;
    }
    v10[1] = 3221225472;
    v10[2] = (uint64_t)v9;
    v10[3] = (uint64_t)v8;
    v10[4] = (uint64_t)a3;
    v11 = (void *)MEMORY[0x1B5E0F7A8]();
  }
  else
  {
    v6 = 2;
    while (1)
    {
      v7 = objc_retainAutorelease(v5);
      if (*(_BYTE *)objc_msgSend(v7, "getArgumentTypeAtIndex:", v6) != 64)
        break;
      if (++v6 >= (unint64_t)objc_msgSend(v7, "numberOfArguments"))
        goto LABEL_5;
    }
LABEL_7:
    v11 = 0;
  }

  return v11;
}

- (void)_logEventForInvocation:(id)a3 metadata:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NADelegateMethodLogSettings *logSettings;
  void *v19;
  NADelegateMethodLogSettings *v20;
  uint64_t v21;
  os_log_type_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (self->_logSettings)
  {
    v8 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __56__NADelegateDispatcher__logEventForInvocation_metadata___block_invoke;
    v38[3] = &unk_1E62284A8;
    v38[4] = self;
    v9 = v6;
    v39 = v9;
    v10 = a3;
    objc_msgSend(v10, "na_argumentDescriptionsWithObjectFormatter:", v38);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (const char *)objc_msgSend(v10, "selector");
    objc_msgSend(v10, "methodSignature");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "numberOfArguments");
    switch(v14)
    {
      case 2:
        -[NADelegateDispatcher _logEventForSelector:metadata:](self, "_logEventForSelector:metadata:", v12, v9);
        break;
      case 3:
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _logEventForSelector:metadata:formatArgs:arg0:](self, "_logEventForSelector:metadata:formatArgs:arg0:", v12, v9, 0, v23);
        goto LABEL_18;
      case 4:
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _logEventForSelector:metadata:formatArgs:arg0:arg1:](self, "_logEventForSelector:metadata:formatArgs:arg0:arg1:", v12, v9, 0, v23, v24);
        goto LABEL_17;
      case 5:
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _logEventForSelector:metadata:formatArgs:arg0:arg1:arg2:](self, "_logEventForSelector:metadata:formatArgs:arg0:arg1:arg2:", v12, v9, 0, v23, v24, v25);
        goto LABEL_16;
      case 6:
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _logEventForSelector:metadata:formatArgs:arg0:arg1:arg2:arg3:](self, "_logEventForSelector:metadata:formatArgs:arg0:arg1:arg2:arg3:", v12, v9, 0, v23, v24, v25, v26);
        goto LABEL_15;
      case 7:
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 4);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _logEventForSelector:metadata:formatArgs:arg0:arg1:arg2:arg3:arg4:](self, "_logEventForSelector:metadata:formatArgs:arg0:arg1:arg2:arg3:arg4:", v12, v9, 0, v23, v24, v25, v26, v27);

LABEL_15:
LABEL_16:

LABEL_17:
LABEL_18:

        break;
      case 8:
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 3);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 4);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 5);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _logEventForSelector:metadata:formatArgs:arg0:arg1:arg2:arg3:arg4:arg5:](self, "_logEventForSelector:metadata:formatArgs:arg0:arg1:arg2:arg3:arg4:arg5:", v12, v9, 0, v34, v28, v29, v30, v31, v32);

        break;
      default:
        NSStringFromSelector(v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(":"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v35[0] = v8;
        v35[1] = 3221225472;
        v35[2] = __56__NADelegateDispatcher__logEventForInvocation_metadata___block_invoke_2;
        v35[3] = &unk_1E62284D0;
        v17 = (id)objc_opt_new();
        v36 = v17;
        v37 = v11;
        objc_msgSend(v16, "enumerateObjectsUsingBlock:", v35);
        logSettings = self->_logSettings;
        if (logSettings)
        {
          -[NADelegateMethodLogSettings logger](logSettings, "logger");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = self->_logSettings;
          if (v19)
          {
            -[NADelegateMethodLogSettings logger](v20, "logger");
            v21 = objc_claimAutoreleasedReturnValue();
            -[NADelegateMethodLogSettings log](self->_logSettings, "log");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, void *, _QWORD, const char *, ...))(v21 + 16))(v21, v33, -[NADelegateMethodLogSettings logType](self->_logSettings, "logType"), "%@", v17);

          }
          else
          {
            -[NADelegateMethodLogSettings log](v20, "log");
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = -[NADelegateMethodLogSettings logType](self->_logSettings, "logType");
            if (os_log_type_enabled((os_log_t)v21, v22))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v17;
              _os_log_impl(&dword_1B0CB0000, (os_log_t)v21, v22, "%@", buf, 0xCu);
            }
          }

        }
        break;
    }

  }
}

void __42__NADelegateDispatcher_forwardInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_effectiveObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "selector");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 40), "invokeWithTarget:", v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)_effectiveObservers
{
  os_unfair_lock_s *p_lock;
  NSArray *overrideObservers;
  NSArray *v5;
  NSArray *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  overrideObservers = self->_overrideObservers;
  if (overrideObservers)
  {
    v5 = overrideObservers;
  }
  else
  {
    -[NSHashTable allObjects](self->_observerTable, "allObjects");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

+ (id)_findMethodSignatureForSelector:(SEL)a3 inProtocol:(id)a4
{
  Protocol *v6;
  char *types;
  void *v8;
  Protocol **v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int outCount;

  v6 = (Protocol *)a4;
  types = protocol_getMethodDescription(v6, a3, 1, 1).types;
  if (types || (types = protocol_getMethodDescription(v6, a3, 0, 1).types) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", types);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    outCount = 0;
    v10 = protocol_copyProtocolList(v6, &outCount);
    if (outCount)
    {
      v11 = 0;
      while (1)
      {
        objc_msgSend(a1, "_findMethodSignatureForSelector:inProtocol:", a3, v10[v11]);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
          break;
        if (++v11 >= (unint64_t)outCount)
          goto LABEL_9;
      }
      v8 = (void *)v12;
    }
    else
    {
LABEL_9:
      v8 = 0;
    }
    free(v10);
  }

  return v8;
}

- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4 formatArgs:(BOOL)a5 arg0:(id)a6 arg1:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NADelegateMethodLogSettings *logSettings;
  void *v18;
  NADelegateMethodLogSettings *v19;
  uint64_t v20;
  os_log_type_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v9 = a5;
  v41 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a6;
  v14 = a7;
  if (self->_logSettings)
  {
    NSStringFromSelector(a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(":"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    logSettings = self->_logSettings;
    if (logSettings)
    {
      -[NADelegateMethodLogSettings logger](logSettings, "logger");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = self->_logSettings;
      if (v18)
      {
        -[NADelegateMethodLogSettings logger](v19, "logger");
        v20 = objc_claimAutoreleasedReturnValue();
        -[NADelegateMethodLogSettings log](self->_logSettings, "log");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[NADelegateMethodLogSettings logType](self->_logSettings, "logType");
        objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v13, 0, v9, v12);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v14, 1, v9, v12);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD, const char *, ...))(v20 + 16))(v20, v32, v30, "%{public}@: %@ %{public}@: %@", v26, v27, v28, v29);

      }
      else
      {
        -[NADelegateMethodLogSettings log](v19, "log");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = -[NADelegateMethodLogSettings logType](self->_logSettings, "logType");
        if (os_log_type_enabled((os_log_t)v20, v21))
        {
          objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v13, 0, v9, v12);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
          v31 = v16;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v14, 1, v9, v12);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v34 = v22;
          v35 = 2112;
          v36 = v23;
          v37 = 2114;
          v38 = v24;
          v39 = 2112;
          v40 = v25;
          _os_log_impl(&dword_1B0CB0000, (os_log_t)v20, v21, "%{public}@: %@ %{public}@: %@", buf, 0x2Au);

          v16 = v31;
        }
      }

    }
  }

}

- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4 formatArgs:(BOOL)a5 arg0:(id)a6
{
  id v9;
  id v10;
  NADelegateMethodLogSettings *logSettings;
  void *v12;
  NADelegateMethodLogSettings *v13;
  uint64_t v14;
  os_log_type_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  logSettings = self->_logSettings;
  if (logSettings)
  {
    -[NADelegateMethodLogSettings logger](logSettings, "logger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = self->_logSettings;
    if (v12)
    {
      -[NADelegateMethodLogSettings logger](v13, "logger");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NADelegateMethodLogSettings log](self->_logSettings, "log");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[NADelegateMethodLogSettings logType](self->_logSettings, "logType");
      NSStringFromSelector(a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, uint64_t, const char *, ...))(v14 + 16))(v14, v17, v18, "%{public}@ %@", v19, v10);

    }
    else
    {
      -[NADelegateMethodLogSettings log](v13, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = -[NADelegateMethodLogSettings logType](self->_logSettings, "logType");
      if (os_log_type_enabled((os_log_t)v14, v15))
      {
        NSStringFromSelector(a3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v16;
        v22 = 2112;
        v23 = v10;
        _os_log_impl(&dword_1B0CB0000, (os_log_t)v14, v15, "%{public}@ %@", buf, 0x16u);

      }
    }

  }
}

- (BOOL)conformsToProtocol:(id)a3
{
  Protocol *v4;
  BOOL v5;
  Protocol *v6;
  Protocol *v7;
  objc_super v9;

  v4 = (Protocol *)a3;
  v9.receiver = self;
  v9.super_class = (Class)NADelegateDispatcher;
  if (-[NADelegateDispatcher conformsToProtocol:](&v9, sel_conformsToProtocol_, v4))
  {
    v5 = 1;
  }
  else
  {
    -[NADelegateDispatcher protocol](self, "protocol");
    v6 = (Protocol *)objc_claimAutoreleasedReturnValue();
    if (v6 == v4)
    {
      v5 = 1;
    }
    else
    {
      -[NADelegateDispatcher protocol](self, "protocol");
      v7 = (Protocol *)objc_claimAutoreleasedReturnValue();
      v5 = protocol_conformsToProtocol(v7, v4);

    }
  }

  return v5;
}

- (NSArray)observers
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_observerTable, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v7, "_methodMetadataForSelector:", *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_logEventForSelector:metadata:formatArgs:arg0:arg1:", *(_QWORD *)(a1 + 32), v10, 1, v8, v9);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_6;
  v21 = &unk_1E6228340;
  v11 = *(_QWORD *)(a1 + 32);
  v22 = v7;
  v25 = v11;
  v12 = v8;
  v23 = v12;
  v13 = v9;
  v24 = v13;
  v14 = (void (**)(_QWORD))MEMORY[0x1B5E0F7A8](&v18);
  objc_msgSend(v10, "customHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v10, "customHandler");
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "na_arrayWithTerminator:nullableObjects:", v13, CFSTR("__var_arg_terminator__"), v18, v19, v20, v21, v22, v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void (**)(_QWORD)))v16)[2](v16, v17, v14);

  }
  else
  {
    v14[2](v14);
  }

}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_6(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_effectiveObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, *(SEL *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v9, "_methodMetadataForSelector:", *(_QWORD *)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_logEventForSelector:metadata:formatArgs:arg0:arg1:arg2:", *(_QWORD *)(a1 + 32), v13, 1, v10, v11, v12);
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_8;
  v25 = &unk_1E6228388;
  v14 = *(_QWORD *)(a1 + 32);
  v26 = v9;
  v30 = v14;
  v15 = v10;
  v27 = v15;
  v16 = v11;
  v28 = v16;
  v17 = v12;
  v29 = v17;
  v18 = (void (**)(_QWORD))MEMORY[0x1B5E0F7A8](&v22);
  objc_msgSend(v13, "customHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v13, "customHandler");
    v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "na_arrayWithTerminator:nullableObjects:", v16, v17, CFSTR("__var_arg_terminator__"), v22, v23, v24, v25, v26, v27, v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void (**)(_QWORD)))v20)[2](v20, v21, v18);

  }
  else
  {
    v18[2](v18);
  }

}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_effectiveObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, *(SEL *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  _QWORD v10[6];

  v3 = a2;
  objc_msgSend(v3, "_methodMetadataForSelector:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_logEventForSelector:metadata:", *(_QWORD *)(a1 + 32), v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_2;
  v10[3] = &unk_1E62282B0;
  v5 = *(_QWORD *)(a1 + 32);
  v10[4] = v3;
  v10[5] = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1B5E0F7A8](v10);
  objc_msgSend(v4, "customHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "customHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "na_arrayWithTerminator:nullableObjects:", CFSTR("__var_arg_terminator__"), CFSTR("__var_arg_terminator__"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void (**)(_QWORD)))v8)[2](v8, v9, v6);

  }
  else
  {
    v6[2](v6);
  }

}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_effectiveObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, *(SEL *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(_QWORD);
  void *v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(v11, "_methodMetadataForSelector:", *(_QWORD *)(a1 + 32));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_logEventForSelector:metadata:formatArgs:arg0:arg1:arg2:arg3:", *(_QWORD *)(a1 + 32), v16, 1, v12, v13, v14, v15);
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_10;
  v29 = &unk_1E62283D0;
  v17 = *(_QWORD *)(a1 + 32);
  v30 = v11;
  v35 = v17;
  v18 = v12;
  v31 = v18;
  v19 = v13;
  v32 = v19;
  v20 = v14;
  v33 = v20;
  v21 = v15;
  v34 = v21;
  v22 = (void (**)(_QWORD))MEMORY[0x1B5E0F7A8](&v26);
  objc_msgSend(v16, "customHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v16, "customHandler");
    v24 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "na_arrayWithTerminator:nullableObjects:", v19, v20, v21, CFSTR("__var_arg_terminator__"), v26, v27, v28, v29, v30, v31, v32, v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void (**)(_QWORD)))v24)[2](v24, v25, v22);

  }
  else
  {
    v22[2](v22);
  }

}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_10(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_effectiveObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, *(SEL *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_11(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void (**v26)(_QWORD);
  void *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  objc_msgSend(v13, "_methodMetadataForSelector:", *(_QWORD *)(a1 + 32));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_logEventForSelector:metadata:formatArgs:arg0:arg1:arg2:arg3:arg4:", *(_QWORD *)(a1 + 32), v19, 1, v14, v15, v16, v17, v18);
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_12;
  v33 = &unk_1E6228418;
  v20 = *(_QWORD *)(a1 + 32);
  v34 = v13;
  v40 = v20;
  v21 = v14;
  v35 = v21;
  v22 = v15;
  v36 = v22;
  v23 = v16;
  v37 = v23;
  v24 = v17;
  v38 = v24;
  v25 = v18;
  v39 = v25;
  v26 = (void (**)(_QWORD))MEMORY[0x1B5E0F7A8](&v30);
  objc_msgSend(v19, "customHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v19, "customHandler");
    v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "na_arrayWithTerminator:nullableObjects:", v22, v23, v24, v25, CFSTR("__var_arg_terminator__"), v30, v31, v32, v33, v34, v35, v36, v37, v38);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void (**)(_QWORD)))v28)[2](v28, v29, v26);

  }
  else
  {
    v26[2](v26);
  }

}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_12(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_effectiveObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, *(SEL *)(a1 + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_13(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void (**v30)(_QWORD);
  void *v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;

  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  objc_msgSend(v15, "_methodMetadataForSelector:", *(_QWORD *)(a1 + 32));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_logEventForSelector:metadata:formatArgs:arg0:arg1:arg2:arg3:arg4:arg5:", *(_QWORD *)(a1 + 32), v22, 1, v16, v17, v18, v19, v20, v21);
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_14;
  v42[3] = &unk_1E6228460;
  v23 = *(_QWORD *)(a1 + 32);
  v42[4] = v15;
  v49 = v23;
  v24 = v16;
  v43 = v24;
  v25 = v17;
  v44 = v25;
  v26 = v18;
  v45 = v26;
  v27 = v19;
  v46 = v27;
  v28 = v20;
  v47 = v28;
  v29 = v21;
  v48 = v29;
  v30 = (void (**)(_QWORD))MEMORY[0x1B5E0F7A8](v42);
  objc_msgSend(v22, "customHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v22, "customHandler");
    v32 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "na_arrayWithTerminator:nullableObjects:", v25, v26, v27, v28, v29, CFSTR("__var_arg_terminator__"));
    v41 = v29;
    v33 = v28;
    v34 = v27;
    v35 = v22;
    v36 = v26;
    v37 = v25;
    v38 = v24;
    v39 = v15;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void (**)(_QWORD)))v32)[2](v32, v40, v30);

    v15 = v39;
    v24 = v38;
    v25 = v37;
    v26 = v36;
    v22 = v35;
    v27 = v34;
    v28 = v33;
    v29 = v41;

  }
  else
  {
    v30[2](v30);
  }

}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_14(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_effectiveObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, *(SEL *)(a1 + 88), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4
{
  id v6;
  NADelegateMethodLogSettings *logSettings;
  void *v8;
  NADelegateMethodLogSettings *v9;
  uint64_t v10;
  os_log_type_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  logSettings = self->_logSettings;
  if (logSettings)
  {
    -[NADelegateMethodLogSettings logger](logSettings, "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = self->_logSettings;
    if (v8)
    {
      -[NADelegateMethodLogSettings logger](v9, "logger");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NADelegateMethodLogSettings log](self->_logSettings, "log");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[NADelegateMethodLogSettings logType](self->_logSettings, "logType");
      NSStringFromSelector(a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, uint64_t, const char *, ...))(v10 + 16))(v10, v13, v14, "%{public}@", v15);

    }
    else
    {
      -[NADelegateMethodLogSettings log](v9, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = -[NADelegateMethodLogSettings logType](self->_logSettings, "logType");
      if (os_log_type_enabled((os_log_t)v10, v11))
      {
        NSStringFromSelector(a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v17 = v12;
        _os_log_impl(&dword_1B0CB0000, (os_log_t)v10, v11, "%{public}@", buf, 0xCu);

      }
    }

  }
}

- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4 formatArgs:(BOOL)a5 arg0:(id)a6 arg1:(id)a7 arg2:(id)a8 arg3:(id)a9
{
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NADelegateMethodLogSettings *logSettings;
  void *v23;
  NADelegateMethodLogSettings *v24;
  NSObject *v25;
  os_log_type_t v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  void (**v55)(_QWORD, _QWORD, _QWORD, const char *, ...);
  id v56;
  void *v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v12 = a5;
  v74 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  if (self->_logSettings)
  {
    NSStringFromSelector(a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsSeparatedByString:", CFSTR(":"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    logSettings = self->_logSettings;
    if (logSettings)
    {
      -[NADelegateMethodLogSettings logger](logSettings, "logger");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = self->_logSettings;
      if (v23)
      {
        -[NADelegateMethodLogSettings logger](v24, "logger");
        v55 = (void (**)(_QWORD, _QWORD, _QWORD, const char *, ...))objc_claimAutoreleasedReturnValue();
        -[NADelegateMethodLogSettings log](self->_logSettings, "log");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = -[NADelegateMethodLogSettings logType](self->_logSettings, "logType");
        objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v16, 0, v12, v15);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v17, 1, v12, v15);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
        v53 = v19;
        v35 = v21;
        v36 = v18;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v36, 2, v12, v15);
        v47 = v17;
        v38 = v16;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectAtIndexedSubscript:", 3);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v53, 3, v12, v15);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD, const char *, ...))v55)[2](v55, v57, v45, "%{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@", v51, v49, v43, v34, v37, v39, v40, v41);

        v16 = v38;
        v17 = v47;

        v18 = v36;
        v21 = v35;
        v19 = v53;

      }
      else
      {
        v56 = v16;
        -[NADelegateMethodLogSettings log](v24, "log");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = -[NADelegateMethodLogSettings logType](self->_logSettings, "logType");
        if (os_log_type_enabled(v25, v26))
        {
          objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v56, 0, v12, v15);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v17, 1, v12, v15);
          v54 = v15;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
          v52 = v19;
          v48 = v21;
          v28 = v18;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v28, 2, v12, v15);
          v30 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectAtIndexedSubscript:", 3);
          v46 = v17;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v52, 3, v12, v15);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138545154;
          v59 = v27;
          v60 = 2112;
          v61 = v50;
          v62 = 2114;
          v63 = v44;
          v64 = 2112;
          v65 = v42;
          v66 = 2114;
          v67 = v29;
          v68 = 2112;
          v69 = v30;
          v33 = (void *)v30;
          v70 = 2114;
          v71 = v31;
          v72 = 2112;
          v73 = v32;
          _os_log_impl(&dword_1B0CB0000, v25, v26, "%{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@", buf, 0x52u);

          v17 = v46;
          v18 = v28;
          v21 = v48;
          v19 = v52;

          v15 = v54;
        }

        v16 = v56;
      }
    }

  }
}

- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4 formatArgs:(BOOL)a5 arg0:(id)a6 arg1:(id)a7 arg2:(id)a8 arg3:(id)a9 arg4:(id)a10
{
  _BOOL8 v13;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NADelegateMethodLogSettings *logSettings;
  void *v25;
  NADelegateMethodLogSettings *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  void *v47;
  void (**v48)(_QWORD, _QWORD, _QWORD, const char *, ...);
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v13 = a5;
  v77 = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  if (self->_logSettings)
  {
    NSStringFromSelector(a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "componentsSeparatedByString:", CFSTR(":"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    logSettings = self->_logSettings;
    if (logSettings)
    {
      -[NADelegateMethodLogSettings logger](logSettings, "logger");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = self->_logSettings;
      v56 = v20;
      if (v25)
      {
        -[NADelegateMethodLogSettings logger](v26, "logger");
        v48 = (void (**)(_QWORD, _QWORD, _QWORD, const char *, ...))objc_claimAutoreleasedReturnValue();
        -[NADelegateMethodLogSettings log](self->_logSettings, "log");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = -[NADelegateMethodLogSettings logType](self->_logSettings, "logType");
        objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v17, 0, v13, v16);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v18, 1, v13, v16);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndexedSubscript:", 2);
        v53 = v19;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v53, 2, v13, v16);
        v50 = v18;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndexedSubscript:", 3);
        v51 = v17;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v20, 3, v13, v16);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndexedSubscript:", 4);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v21, 4, v13, v16);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD, const char *, ...))v48)[2](v48, v55, v45, "%{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@", v43, v49, v41, v47, v30, v39, v31, v32, v33, v34);

        v20 = v56;
        v17 = v51;

        v18 = v50;
        v19 = v53;

      }
      else
      {
        -[NADelegateMethodLogSettings log](v26, "log");
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = -[NADelegateMethodLogSettings logType](self->_logSettings, "logType");
        if (os_log_type_enabled(v27, (os_log_type_t)v28))
        {
          objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v17, 0, v13, v16);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v18, 1, v13, v16);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", 2);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v19, 2, v13, v16);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", 3);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v56, 3, v13, v16);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", 4);
          v52 = v19;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v21, 4, v13, v16);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138545666;
          v58 = v46;
          v59 = 2112;
          v60 = v54;
          v61 = 2114;
          v62 = v44;
          v63 = 2112;
          v64 = v42;
          v65 = 2114;
          v66 = v40;
          v67 = 2112;
          v68 = v38;
          v69 = 2114;
          v70 = v37;
          v71 = 2112;
          v72 = v36;
          v73 = 2114;
          v74 = v29;
          v75 = 2112;
          v76 = v35;
          _os_log_impl(&dword_1B0CB0000, v27, (os_log_type_t)v28, "%{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@", buf, 0x66u);

          v19 = v52;
        }

        v20 = v56;
      }
    }

  }
}

- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4 formatArgs:(BOOL)a5 arg0:(id)a6 arg1:(id)a7 arg2:(id)a8 arg3:(id)a9 arg4:(id)a10 arg5:(id)a11
{
  _BOOL8 v14;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  NADelegateMethodLogSettings *logSettings;
  void *v27;
  NADelegateMethodLogSettings *v28;
  NSObject *v29;
  os_log_type_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *type;
  void *v52;
  void (**v53)(_QWORD, _QWORD, _QWORD, const char *, ...);
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  NSObject *log;
  os_log_t loga;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v14 = a5;
  v93 = *MEMORY[0x1E0C80C00];
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  if (self->_logSettings)
  {
    v68 = v21;
    NSStringFromSelector(a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "componentsSeparatedByString:", CFSTR(":"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    logSettings = self->_logSettings;
    if (logSettings)
    {
      -[NADelegateMethodLogSettings logger](logSettings, "logger");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = self->_logSettings;
      v67 = v20;
      if (v27)
      {
        -[NADelegateMethodLogSettings logger](v28, "logger");
        v53 = (void (**)(_QWORD, _QWORD, _QWORD, const char *, ...))objc_claimAutoreleasedReturnValue();
        -[NADelegateMethodLogSettings log](self->_logSettings, "log");
        loga = (os_log_t)objc_claimAutoreleasedReturnValue();
        v50 = -[NADelegateMethodLogSettings logType](self->_logSettings, "logType");
        objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v18, 0, v14, v17);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v19, 1, v14, v17);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectAtIndexedSubscript:", 2);
        type = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v20, 2, v14, v17);
        v59 = v19;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectAtIndexedSubscript:", 3);
        v60 = v18;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v68, 3, v14, v17);
        v66 = v23;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectAtIndexedSubscript:", 4);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v22, 4, v14, v17);
        v57 = v22;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectAtIndexedSubscript:", 5);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v66, 5, v14, v17);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, os_log_t, _QWORD, const char *, ...))v53)[2](v53, loga, v50, "%{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@", v64, v55, v54, v48, type, v36, v37, v38, v39, v40, v41, v42);

        v22 = v57;
        v20 = v67;

        v23 = v66;
        v18 = v60;

        v19 = v59;
      }
      else
      {
        -[NADelegateMethodLogSettings log](v28, "log");
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = -[NADelegateMethodLogSettings logType](self->_logSettings, "logType");
        if (os_log_type_enabled(v29, v30))
        {
          objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v18, 0, v14, v17);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v19, 1, v14, v17);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectAtIndexedSubscript:", 2);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v67, 2, v14, v17);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectAtIndexedSubscript:", 3);
          v58 = v19;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v68, 3, v14, v17);
          log = v29;
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectAtIndexedSubscript:", 4);
          v65 = v23;
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v22, 4, v14, v17);
          v32 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectAtIndexedSubscript:", 5);
          v56 = v22;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NADelegateDispatcher _descriptionForArgument:index:format:metadata:](self, "_descriptionForArgument:index:format:metadata:", v65, 5, v14, v17);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138546178;
          v70 = v52;
          v71 = 2112;
          v72 = v63;
          v73 = 2114;
          v74 = v49;
          v75 = 2112;
          v76 = v47;
          v77 = 2114;
          v78 = v46;
          v79 = 2112;
          v80 = v45;
          v81 = 2114;
          v82 = v31;
          v83 = 2112;
          v84 = v44;
          v85 = 2114;
          v86 = v43;
          v87 = 2112;
          v88 = v32;
          v35 = (void *)v32;
          v89 = 2114;
          v90 = v33;
          v91 = 2112;
          v92 = v34;
          _os_log_impl(&dword_1B0CB0000, log, v30, "%{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@", buf, 0x7Au);

          v22 = v56;
          v23 = v65;

          v19 = v58;
          v29 = log;

        }
        v20 = v67;
      }
    }

    v21 = v68;
  }

}

void __56__NADelegateDispatcher__logEventForInvocation_metadata___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" "));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v7);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(": "));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

}

- (NADelegateMethodLogSettings)logSettings
{
  return self->_logSettings;
}

- (void)setLogSettings:(id)a3
{
  objc_storeStrong((id *)&self->_logSettings, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (NSHashTable)observerTable
{
  return self->_observerTable;
}

- (NSMapTable)cachedMethodMetadataBySelector
{
  return self->_cachedMethodMetadataBySelector;
}

- (NSArray)overrideObservers
{
  return self->_overrideObservers;
}

- (void)setOverrideObservers:(id)a3
{
  objc_storeStrong((id *)&self->_overrideObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideObservers, 0);
  objc_storeStrong((id *)&self->_cachedMethodMetadataBySelector, 0);
  objc_storeStrong((id *)&self->_observerTable, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_logSettings, 0);
}

@end
