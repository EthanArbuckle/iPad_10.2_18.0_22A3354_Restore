@implementation LSEnumerator

uint64_t __29__LSEnumerator_setPredicate___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", a2);
}

- (id)_initWithContext:(LSContext *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LSEnumerator;
  return -[LSEnumerator init](&v4, sel_init, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_filter, 0);
}

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.launchservices", "enumeration");
    v3 = (void *)_LSEnumeratorLog;
    _LSEnumeratorLog = (uint64_t)v2;

  }
}

- (void)setFilter:(id)a3
{
  void *v4;
  id filter;

  v4 = (void *)objc_msgSend(a3, "copy");
  filter = self->_filter;
  self->_filter = v4;

}

- (void)setPredicate:(id)a3
{
  void *v4;
  id filter;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__LSEnumerator_setPredicate___block_invoke;
  v6[3] = &unk_1E1043F68;
  v6[4] = a3;
  v4 = (void *)MEMORY[0x186DAE9BC](v6, a2);
  filter = self->_filter;
  self->_filter = v4;

}

- (LSEnumerator)init
{
  abort();
}

+ (id)new
{
  abort();
}

+ (id)enumeratorForApplicationProxiesWithOptions:(unint64_t)a3
{
  return -[_LSApplicationRecordEnumerator initWithContext:volumeURL:options:]([_LSApplicationProxyEnumerator alloc], "initWithContext:volumeURL:options:", 0, 0, a3);
}

+ (id)enumeratorForPlugInKitProxiesWithExtensionPoint:(id)a3 options:(unint64_t)a4
{
  void *v9;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSEnumerator.mm"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionPointID != nil"));

  }
  return -[_LSApplicationExtensionRecordEnumerator initWithExtensionPointIdentifier:options:]([_LSPlugInProxyEnumerator alloc], "initWithExtensionPointIdentifier:options:", a3, a4);
}

+ (id)enumeratorForPlugInKitProxiesWithExtensionPoint:(id)a3 options:(unint64_t)a4 filter:(id)a5
{
  void *v11;
  void *v12;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSEnumerator.mm"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionPointID != nil"));

    if (a5)
      return -[_LSApplicationExtensionRecordEnumerator initWithExtensionPointIdentifier:options:filter:]([_LSPlugInProxyEnumerator alloc], "initWithExtensionPointIdentifier:options:filter:", a3, a4, a5);
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSEnumerator.mm"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filterBlock != nil"));

    return -[_LSApplicationExtensionRecordEnumerator initWithExtensionPointIdentifier:options:filter:]([_LSPlugInProxyEnumerator alloc], "initWithExtensionPointIdentifier:options:filter:", a3, a4, a5);
  }
  if (!a5)
    goto LABEL_5;
  return -[_LSApplicationExtensionRecordEnumerator initWithExtensionPointIdentifier:options:filter:]([_LSPlugInProxyEnumerator alloc], "initWithExtensionPointIdentifier:options:filter:", a3, a4, a5);
}

- (NSPredicate)predicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = (void *)MEMORY[0x186DAE9BC](self->_filter, a2);
  v3 = v2;
  v4 = (void *)MEMORY[0x1E0CB3880];
  if (v2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __25__LSEnumerator_predicate__block_invoke;
    v7[3] = &unk_1E1043F40;
    v8 = v2;
    objc_msgSend(v4, "predicateWithBlock:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSPredicate *)v5;
}

uint64_t __25__LSEnumerator_predicate__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)filter
{
  id filter;

  if (self->_filter)
    filter = self->_filter;
  else
    filter = &__block_literal_global_38;
  return (id)MEMORY[0x186DAE9BC](filter, a2);
}

uint64_t __22__LSEnumerator_filter__block_invoke()
{
  return 1;
}

- (id)nextObject
{
  abort();
}

- (void)swift_forEach:(id)a3
{
  LSEnumerator *v4;
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
  v4 = self;
  v5 = -[LSEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        (*((void (**)(id, _QWORD))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[LSEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)swift_firstWhere:(id)a3
{
  LSEnumerator *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self;
  v5 = -[LSEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((*((unsigned int (**)(id, void *))a3 + 2))(a3, v8))
        {
          v9 = v8;
          goto LABEL_11;
        }
      }
      v5 = -[LSEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)copy
{
  return -[LSEnumerator copyWithZone:](self, "copyWithZone:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;

  v4 = -[objc_class _initWithContext:](-[objc_class allocWithZone:](object_getClass(self), "allocWithZone:", a3), "_initWithContext:", 0);
  if (v4)
  {
    v5 = objc_msgSend(self->_filter, "copy");
    v6 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v5;

    v7 = objc_msgSend(self->_errorHandler, "copy");
    v8 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v7;

    v9 = atomic_load((unsigned __int8 *)&self->_hasFiredErrorHandler);
    atomic_store(v9 & 1, (unsigned __int8 *)(v4 + 16));
  }
  return (id)v4;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
