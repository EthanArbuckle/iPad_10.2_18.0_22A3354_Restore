@implementation MUIMailboxFilterPersistedStore

void ___ef_log_MUIMailboxFilterPersistedStore_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "MUIMailboxFilterPersistedStore");
  v1 = (void *)_ef_log_MUIMailboxFilterPersistedStore_log;
  _ef_log_MUIMailboxFilterPersistedStore_log = (uint64_t)v0;

}

- (MUIMailboxFilterPersistedStore)initWithBaseStoragePath:(id)a3 defaultsRepresentationProvider:(id)a4 filterRepresentationProvider:(id)a5 mailboxFilterClass:(Class)a6 filterProviderClass:(Class)a7
{
  id v12;
  id v13;
  id v14;
  MUIMailboxFilterPersistedStore *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *storage;
  NSMutableDictionary *v18;
  NSMutableDictionary *viewModelPool;
  uint64_t v20;
  EFCancelationToken *cancelationToken;
  uint64_t v22;
  NSString *storagePath;
  uint64_t v24;
  id defaultsRepresentationProvider;
  uint64_t v26;
  id filterRepresentationProvider;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v29.receiver = self;
  v29.super_class = (Class)MUIMailboxFilterPersistedStore;
  v15 = -[MUIMailboxFilterPersistedStore init](&v29, sel_init);
  if (v15)
  {
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    storage = v15->_storage;
    v15->_storage = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    viewModelPool = v15->_viewModelPool;
    v15->_viewModelPool = v18;

    v20 = objc_opt_new();
    cancelationToken = v15->_cancelationToken;
    v15->_cancelationToken = (EFCancelationToken *)v20;

    objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("FiltersPreference.plist"));
    v22 = objc_claimAutoreleasedReturnValue();
    storagePath = v15->_storagePath;
    v15->_storagePath = (NSString *)v22;

    v24 = objc_msgSend(v13, "copy");
    defaultsRepresentationProvider = v15->_defaultsRepresentationProvider;
    v15->_defaultsRepresentationProvider = (id)v24;

    v26 = objc_msgSend(v14, "copy");
    filterRepresentationProvider = v15->_filterRepresentationProvider;
    v15->_filterRepresentationProvider = (id)v26;

    if (!a6)
      a6 = (Class)objc_opt_class();
    objc_storeStrong((id *)&v15->_mailboxFilterClass, a6);
    if (!a7)
      a7 = (Class)objc_opt_class();
    objc_storeStrong((id *)&v15->_filterProviderClass, a7);
    -[MUIMailboxFilterPersistedStore _load](v15, "_load");
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[EFCancelationToken cancel](self->_cancelationToken, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MUIMailboxFilterPersistedStore;
  -[MUIMailboxFilterPersistedStore dealloc](&v3, sel_dealloc);
}

- (id)filterViewModelForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  NSStringKeyForStorageFromContext(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIMailboxFilterPersistedStore viewModelPool](self, "viewModelPool");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[MUIMailboxFilterPersistedStore _filterViewModelForContext:](self, "_filterViewModelForContext:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUIMailboxFilterPersistedStore viewModelPool](self, "viewModelPool");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v5);

  }
  objc_msgSend(v7, "setFilterContext:", v4);

  return v7;
}

- (id)_filterViewModelForContext:(id)a3
{
  id v4;
  void *v5;
  MUIMailboxFiltersFormatter *v6;
  void *v7;
  MUIMailboxFilterViewModel *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(-[MUIMailboxFilterPersistedStore filterProviderClass](self, "filterProviderClass")), "initWithFilterContext:mailboxFilterClass:", v4, -[MUIMailboxFilterPersistedStore mailboxFilterClass](self, "mailboxFilterClass"));
  v6 = objc_alloc_init(MUIMailboxFiltersFormatter);
  -[MUIMailboxFilterPersistedStore _filtersForContext:provider:](self, "_filtersForContext:provider:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MUIMailboxFilterViewModel initWithProvider:formatter:selectedFilters:]([MUIMailboxFilterViewModel alloc], "initWithProvider:formatter:selectedFilters:", v5, v6, v7);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[MUIMailboxFilterViewModel observableSelectedFilters](v8, "observableSelectedFilters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D1EF30];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __61__MUIMailboxFilterPersistedStore__filterViewModelForContext___block_invoke;
  v20 = &unk_1E99E2C20;
  objc_copyWeak(&v23, &location);
  v11 = v4;
  v21 = v11;
  v12 = v5;
  v22 = v12;
  objc_msgSend(v10, "observerWithResultBlock:", &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subscribe:", v13, v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUIMailboxFilterPersistedStore cancelationToken](self, "cancelationToken");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addCancelable:", v14);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v8;
}

void __61__MUIMailboxFilterPersistedStore__filterViewModelForContext___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_setFilters:forContext:provider:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_setFilters:(id)a3 forContext:(id)a4 provider:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a4;
  v8 = a3;
  NSStringKeyForStorageFromContext(v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[MUIMailboxFilterPersistedStore defaultsRepresentationProvider](self, "defaultsRepresentationProvider");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v9)[2](v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUIMailboxFilterPersistedStore storage](self, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v13);

  objc_msgSend(v7, "focus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    -[MUIMailboxFilterPersistedStore _write](self, "_write");

}

- (id)_filtersForContext:(id)a3 provider:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  NSStringKeyForStorageFromContext(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIMailboxFilterPersistedStore filterRepresentationProvider](self, "filterRepresentationProvider");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[MUIMailboxFilterPersistedStore storage](self, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, id))v8)[2](v8, v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_write
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ef_publicDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "ef_publicDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1D5522000, a3, OS_LOG_TYPE_ERROR, "error while saving filter preference: %{public}@ - %{public}@", (uint8_t *)&v7, 0x16u);

}

- (id)_cleanStorageToWrite
{
  void *v2;
  void *v3;

  -[MUIMailboxFilterPersistedStore storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_filter:", &__block_literal_global_22_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __54__MUIMailboxFilterPersistedStore__cleanStorageToWrite__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rangeOfString:", CFSTR("Focus")) == 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_load
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  -[MUIMailboxFilterPersistedStore storagePath](self, "storagePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "initWithContentsOfFile:", v4);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "isEqualToString:", CFSTR("1"));

  if ((_DWORD)v4)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("preference"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    -[MUIMailboxFilterPersistedStore setStorage:](self, "setStorage:", v7);

  }
}

- (NSString)storagePath
{
  return self->_storagePath;
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (EFCancelationToken)cancelationToken
{
  return self->_cancelationToken;
}

- (NSMutableDictionary)viewModelPool
{
  return self->_viewModelPool;
}

- (id)defaultsRepresentationProvider
{
  return self->_defaultsRepresentationProvider;
}

- (void)setDefaultsRepresentationProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)filterRepresentationProvider
{
  return self->_filterRepresentationProvider;
}

- (void)setFilterRepresentationProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (Class)mailboxFilterClass
{
  return self->_mailboxFilterClass;
}

- (void)setMailboxFilterClass:(Class)a3
{
  objc_storeStrong((id *)&self->_mailboxFilterClass, a3);
}

- (Class)filterProviderClass
{
  return self->_filterProviderClass;
}

- (void)setFilterProviderClass:(Class)a3
{
  objc_storeStrong((id *)&self->_filterProviderClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterProviderClass, 0);
  objc_storeStrong((id *)&self->_mailboxFilterClass, 0);
  objc_storeStrong(&self->_filterRepresentationProvider, 0);
  objc_storeStrong(&self->_defaultsRepresentationProvider, 0);
  objc_storeStrong((id *)&self->_viewModelPool, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_storagePath, 0);
}

@end
