@implementation CNUIPRLikenessResolver

id __78__CNUIPRLikenessResolver_initWithLikenessResolver_capacity_schedulerProvider___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __78__CNUIPRLikenessResolver_initWithLikenessResolver_capacity_schedulerProvider___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (unint64_t)maxContacts
{
  if (+[CNUISnowglobeUtilities enableGroupPhoto](CNUISnowglobeUtilities, "enableGroupPhoto"))
    return 7;
  else
    return 2;
}

- (id)likenessesForContact:(id)a3 options:(id)a4 workScheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  CNUIPRLikenessResolverReplaySubject *v17;
  NSObject *v18;
  uint64_t v19;
  CNUIPRLikenessResolverReplaySubject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  CNUIPRLikenessResolverReplaySubject *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  CNUIPRLikenessResolverReplaySubject *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD *v48;
  _QWORD v49[3];
  char v50;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CNUIPRLikenessResolver likenessResolver](self, "likenessResolver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "_cacheKeyForContact:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CNUIPRLikenessResolver likenessesForContact:options:workScheduler:].cold.4();

    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[CNUIPRLikenessResolver likenessesForContact:options:workScheduler:].cold.3();

    -[CNUIPRLikenessResolver likenessProviderCache](self, "likenessProviderCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithResult:", v16);
      v17 = (CNUIPRLikenessResolverReplaySubject *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = v9;
      +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[CNUIPRLikenessResolver likenessesForContact:options:workScheduler:].cold.2();

      -[CNUIPRLikenessResolver mainThreadSchedulerProvider](self, "mainThreadSchedulerProvider");
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)v19;
      v20 = -[CNReplaySubject initWithCapacity:schedulerProvider:]([CNUIPRLikenessResolverReplaySubject alloc], "initWithCapacity:schedulerProvider:", 1, v19);
      -[CNUIPRLikenessResolver loadingPlaceholderLikeness](self, "loadingPlaceholderLikeness");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNReplaySubject observerDidReceiveResult:](v20, "observerDidReceiveResult:");
      +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[CNUIPRLikenessResolver likenessesForContact:options:workScheduler:].cold.1();

      -[CNUIPRLikenessResolver likenessProviderCache](self, "likenessProviderCache");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUIPRLikenessResolver workTrackingCache](self, "workTrackingCache");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUIPRLikenessResolver lock](self, "lock");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x2020000000;
      v50 = 0;
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __69__CNUIPRLikenessResolver_likenessesForContact_options_workScheduler___block_invoke;
      v39[3] = &unk_1EA603DC0;
      v39[4] = self;
      v40 = v8;
      v41 = v35;
      v25 = v20;
      v42 = v25;
      v31 = v22;
      v43 = v31;
      v44 = v12;
      v26 = v24;
      v45 = v26;
      v27 = v23;
      v46 = v27;
      v28 = v34;
      v47 = v28;
      v48 = v49;
      objc_msgSend(v10, "performCancelableBlock:", v39);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v27;
      v37 = v28;
      v38 = v29;
      CNRunWithLock();
      v17 = v25;

      _Block_object_dispose(v49, 8);
      v9 = v35;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
    v17 = (CNUIPRLikenessResolverReplaySubject *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (CNUIPRLikenessResolver)likenessResolver
{
  return self->_likenessResolver;
}

void __69__CNUIPRLikenessResolver_likenessesForContact_options_workScheduler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "likenessResolver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v11 = 0;
  objc_msgSend(v2, "likenessForContact:options:error:", v3, v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  if (v5)
  {
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __69__CNUIPRLikenessResolver_likenessesForContact_options_workScheduler___block_invoke_cold_2();

    objc_msgSend(*(id *)(a1 + 56), "observerDidReceiveResult:", v5);
    objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 72));
  }
  else if (v6)
  {
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __69__CNUIPRLikenessResolver_likenessesForContact_options_workScheduler___block_invoke_cold_1();

  }
  v9 = *(id *)(a1 + 88);
  v10 = *(id *)(a1 + 96);
  CNRunWithLock();

}

+ (id)_cacheKeyForContact:(id)a3
{
  return +[CNUILikenessFingerprint fingerprintForContact:](CNUILikenessFingerprint, "fingerprintForContact:", a3);
}

+ (id)descriptorForRequiredKeys
{
  return +[CNUIPRLikenessLookup descriptorForRequiredKeys](CNUIPRLikenessLookup, "descriptorForRequiredKeys");
}

- (CNUIPlaceholderProviderFactory)placeholderProviderFactory
{
  return self->_placeholderProviderFactory;
}

- (CNUIPRLikenessResolver)initWithLikenessResolver:(id)a3
{
  return -[CNUIPRLikenessResolver initWithLikenessResolver:capacity:](self, "initWithLikenessResolver:capacity:", a3, 5);
}

uint64_t __69__CNUIPRLikenessResolver_likenessesForContact_options_workScheduler___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
    return objc_msgSend(*(id *)(result + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(result + 48), *(_QWORD *)(result + 40));
  return result;
}

- (CNSchedulerProvider)mainThreadSchedulerProvider
{
  return self->_mainThreadSchedulerProvider;
}

- (CNUIPRLikenessResolver)initWithLikenessResolver:(id)a3 capacity:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  CNUIPRLikenessResolver *v9;

  v6 = (void *)MEMORY[0x1E0D13B70];
  v7 = a3;
  objc_msgSend(v6, "defaultProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNUIPRLikenessResolver initWithLikenessResolver:capacity:schedulerProvider:](self, "initWithLikenessResolver:capacity:schedulerProvider:", v7, a4, v8);

  return v9;
}

- (CNUIPRLikenessResolver)initWithLikenessResolver:(id)a3 capacity:(unint64_t)a4 schedulerProvider:(id)a5
{
  id v9;
  id v10;
  CNUIPRLikenessResolver *v11;
  CNUIPRLikenessResolver *v12;
  uint64_t v13;
  CNCache *workTrackingCache;
  CNUnfairLock *v15;
  CNUnfairLock *lock;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  CNCache *likenessProviderCache;
  uint64_t v23;
  CNUIPlaceholderProviderFactory *placeholderProviderFactory;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  CNSchedulerProvider *mainThreadSchedulerProvider;
  void *v33;
  void *v34;
  CNUIPRLikenessResolver *v35;
  uint64_t v37;
  uint64_t v38;
  id (*v39)(uint64_t);
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  objc_super v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v44.receiver = self;
  v44.super_class = (Class)CNUIPRLikenessResolver;
  v11 = -[CNUIPRLikenessResolver init](&v44, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_likenessResolver, a3);
    objc_msgSend(MEMORY[0x1E0D139B0], "atomicCache");
    v13 = objc_claimAutoreleasedReturnValue();
    workTrackingCache = v12->_workTrackingCache;
    v12->_workTrackingCache = (CNCache *)v13;

    v15 = (CNUnfairLock *)objc_alloc_init(MEMORY[0x1E0D13BD8]);
    lock = v12->_lock;
    v12->_lock = v15;

    v17 = objc_alloc(MEMORY[0x1E0D139B0]);
    objc_msgSend(MEMORY[0x1E0D139B0], "boundingStrategyWithCapacity:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D139B0], "atomicCacheScheduler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v17, "initWithBoundingStrategies:resourceScheduler:", v19, v20);
    likenessProviderCache = v12->_likenessProviderCache;
    v12->_likenessProviderCache = (CNCache *)v21;

    objc_msgSend(v9, "placeholderProviderFactory");
    v23 = objc_claimAutoreleasedReturnValue();
    placeholderProviderFactory = v12->_placeholderProviderFactory;
    v12->_placeholderProviderFactory = (CNUIPlaceholderProviderFactory *)v23;

    objc_msgSend(v10, "mainThreadScheduler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v10, "newSynchronousSerialSchedulerWithName:", CFSTR("com.apple.contacts.ContactsUICore._CNUIPRLikenessCachingResolver"));
    objc_msgSend(v10, "immediateScheduler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc(MEMORY[0x1E0D13B70]);
    v41 = v26;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __78__CNUIPRLikenessResolver_initWithLikenessResolver_capacity_schedulerProvider___block_invoke;
    v42[3] = &unk_1EA603D00;
    v43 = v25;
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = __78__CNUIPRLikenessResolver_initWithLikenessResolver_capacity_schedulerProvider___block_invoke_2;
    v40 = &unk_1EA603D00;
    v29 = v26;
    v30 = v25;
    v31 = objc_msgSend(v28, "initWithBackgroundScheduler:mainThreadScheduler:immediateScheduler:serialSchedulerProvider:synchronousSerialSchedulerProvider:readerWriterSchedulerProvider:", v30, v30, v27, v42, &v37, &__block_literal_global_24);
    mainThreadSchedulerProvider = v12->_mainThreadSchedulerProvider;
    v12->_mainThreadSchedulerProvider = (CNSchedulerProvider *)v31;

    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment", v37, v38, v39, v40);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "notificationCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v12, sel_databaseChanged_, *MEMORY[0x1E0C96870], 0);

    v35 = v12;
  }

  return v12;
}

- (CNContactStore)contactStore
{
  void *v2;
  void *v3;

  -[CNUIPRLikenessResolver likenessLookup](self, "likenessLookup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContactStore *)v3;
}

- (id)likenessLookup
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[CNUIPRLikenessResolver likenessResolver](self, "likenessResolver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

id __78__CNUIPRLikenessResolver_initWithLikenessResolver_capacity_schedulerProvider___block_invoke_3()
{
  return objc_alloc_init(MEMORY[0x1E0D13B48]);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0C96870], 0);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CNUIPRLikenessResolver workTrackingCache](self, "workTrackingCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "cancel");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11.receiver = self;
  v11.super_class = (Class)CNUIPRLikenessResolver;
  -[CNUIPRLikenessResolver dealloc](&v11, sel_dealloc);
}

- (void)databaseChanged:(id)a3
{
  -[CNCache removeAllObjects](self->_likenessProviderCache, "removeAllObjects", a3);
}

- (void)setLookupOptions:(unint64_t)a3
{
  -[CNUIPRLikenessResolver setLookupOptions:](self->_likenessResolver, "setLookupOptions:", a3);
}

- (id)resolveLikenessesForContacts:(id)a3 workScheduler:(id)a4 withContentHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  os_signpost_id_t v32;
  _QWORD v33[5];
  id v34;
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  v10 = a3;
  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD140000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Resolve Likeness", ", buf, 2u);
  }

  objc_msgSend(v10, "_cn_take:", +[CNUIPRLikenessResolver maxContacts](CNUIPRLikenessResolver, "maxContacts"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __88__CNUIPRLikenessResolver_resolveLikenessesForContacts_workScheduler_withContentHandler___block_invoke;
  v33[3] = &unk_1EA603D48;
  v33[4] = self;
  v34 = v8;
  v17 = v8;
  objc_msgSend(v15, "_cn_map:", v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0D13AE8];
  -[CNUIPRLikenessResolver mainThreadSchedulerProvider](self, "mainThreadSchedulerProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "combineLatest:resultScheduler:schedulerProvider:", v18, v17, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0D13AF0];
  v27 = v16;
  v28 = 3221225472;
  v29 = __88__CNUIPRLikenessResolver_resolveLikenessesForContacts_workScheduler_withContentHandler___block_invoke_2;
  v30 = &unk_1EA603D70;
  v31 = v9;
  v32 = v12;
  v23 = v9;
  objc_msgSend(v22, "observerWithResultBlock:", &v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "subscribe:", v24, v27, v28, v29, v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

uint64_t __88__CNUIPRLikenessResolver_resolveLikenessesForContacts_workScheduler_withContentHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "likenessesForContact:workScheduler:", a2, *(_QWORD *)(a1 + 40));
}

void __88__CNUIPRLikenessResolver_resolveLikenessesForContacts_workScheduler_withContentHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD140000, v5, OS_SIGNPOST_INTERVAL_END, v6, "Resolve Likeness", ", v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)likenessesForContact:(id)a3 workScheduler:(id)a4
{
  return -[CNUIPRLikenessResolver likenessesForContact:options:workScheduler:](self, "likenessesForContact:options:workScheduler:", a3, 0, a4);
}

uint64_t __69__CNUIPRLikenessResolver_likenessesForContact_options_workScheduler___block_invoke_34(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

- (id)basicMonogramObservableFromString:(id)a3 color:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[CNUIPRLikenessResolver likenessResolver](self, "likenessResolver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "basicMonogramObservableFromString:color:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)badgeObservableWithLikenessBadge:(id)a3 workScheduler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  CNUIPRLikenessResolverReplaySubject *v14;
  NSObject *v15;
  uint64_t v16;
  CNUIPRLikenessResolverReplaySubject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  CNUIPRLikenessResolverReplaySubject *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  CNUIPRLikenessResolverReplaySubject *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD *v43;
  _QWORD v44[3];
  char v45;

  v6 = a3;
  v7 = a4;
  -[CNUIPRLikenessResolver likenessResolver](self, "likenessResolver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "badgeCacheKeyForLikenessBadge:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CNUIPRLikenessResolver badgeObservableWithLikenessBadge:workScheduler:].cold.4();

    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CNUIPRLikenessResolver badgeObservableWithLikenessBadge:workScheduler:].cold.3();

    -[CNUIPRLikenessResolver likenessProviderCache](self, "likenessProviderCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithResult:", v13);
      v14 = (CNUIPRLikenessResolverReplaySubject *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[CNUIPRLikenessResolver badgeObservableWithLikenessBadge:workScheduler:].cold.2();

      -[CNUIPRLikenessResolver mainThreadSchedulerProvider](self, "mainThreadSchedulerProvider");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)v16;
      v17 = -[CNReplaySubject initWithCapacity:schedulerProvider:]([CNUIPRLikenessResolverReplaySubject alloc], "initWithCapacity:schedulerProvider:", 1, v16);
      -[CNUIPRLikenessResolver loadingPlaceholderLikeness](self, "loadingPlaceholderLikeness");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNReplaySubject observerDidReceiveResult:](v17, "observerDidReceiveResult:");
      +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[CNUIPRLikenessResolver likenessesForContact:options:workScheduler:].cold.1();

      -[CNUIPRLikenessResolver likenessProviderCache](self, "likenessProviderCache");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUIPRLikenessResolver workTrackingCache](self, "workTrackingCache");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUIPRLikenessResolver lock](self, "lock");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = 0;
      v44[1] = v44;
      v44[2] = 0x2020000000;
      v45 = 0;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __73__CNUIPRLikenessResolver_badgeObservableWithLikenessBadge_workScheduler___block_invoke;
      v35[3] = &unk_1EA603E10;
      v35[4] = self;
      v36 = v6;
      v37 = v9;
      v22 = v17;
      v38 = v22;
      v28 = v19;
      v39 = v28;
      v23 = v21;
      v40 = v23;
      v24 = v20;
      v41 = v24;
      v25 = v31;
      v42 = v25;
      v43 = v44;
      objc_msgSend(v7, "performCancelableBlock:", v35);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v24;
      v33 = v25;
      v34 = v26;
      CNRunWithLock();
      v14 = v22;

      _Block_object_dispose(v44, 8);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
    v14 = (CNUIPRLikenessResolverReplaySubject *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

void __73__CNUIPRLikenessResolver_badgeObservableWithLikenessBadge_workScheduler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "likenessResolver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "badgeWithLikenessBadge:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __73__CNUIPRLikenessResolver_badgeObservableWithLikenessBadge_workScheduler___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 56), "observerDidReceiveResult:", v3);
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 48));
  v5 = *(id *)(a1 + 80);
  v6 = *(id *)(a1 + 88);
  CNRunWithLock();

}

uint64_t __73__CNUIPRLikenessResolver_badgeObservableWithLikenessBadge_workScheduler___block_invoke_38(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

uint64_t __73__CNUIPRLikenessResolver_badgeObservableWithLikenessBadge_workScheduler___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
    return objc_msgSend(*(id *)(result + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(result + 48), *(_QWORD *)(result + 40));
  return result;
}

+ (id)badgeCacheKeyForLikenessBadge:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_md5Hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_hexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Badge-%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)badgeWithLikenessBadge:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  CNUIPRLikenessResolver *v15;
  id v16;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "badgeCacheKeyForLikenessBadge:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CNUIPRLikenessResolver badgeWithLikenessBadge:].cold.2();

  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CNUIPRLikenessResolver badgeObservableWithLikenessBadge:workScheduler:].cold.3();

  -[CNUIPRLikenessResolver likenessProviderCache](self, "likenessProviderCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__CNUIPRLikenessResolver_badgeWithLikenessBadge___block_invoke;
  v13[3] = &unk_1EA603E38;
  v14 = v5;
  v15 = self;
  v16 = v4;
  v9 = v4;
  v10 = v5;
  objc_msgSend(v8, "objectForKey:onCacheMiss:", v10, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __49__CNUIPRLikenessResolver_badgeWithLikenessBadge___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;

  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __49__CNUIPRLikenessResolver_badgeWithLikenessBadge___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "likenessResolver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "badgeWithLikenessBadge:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)basicMonogramFromString:(id)a3 color:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[CNUIPRLikenessResolver likenessResolver](self, "likenessResolver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "basicMonogramFromString:color:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)likenessForContact:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CNUIPRLikenessResolver likenessResolver](self, "likenessResolver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "likenessForContact:options:error:", v6, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)likenessForContact:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  CNUIPRLikenessResolver *v21;
  id v22;
  id v23;
  id *v24;

  v8 = a3;
  v9 = a4;
  objc_msgSend((id)objc_opt_class(), "_cacheKeyForContact:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CNUIPRLikenessResolver likenessForContact:options:error:].cold.2();

  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[CNUIPRLikenessResolver likenessesForContact:options:workScheduler:].cold.3();

  -[CNUIPRLikenessResolver likenessProviderCache](self, "likenessProviderCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __59__CNUIPRLikenessResolver_likenessForContact_options_error___block_invoke;
  v19[3] = &unk_1EA603E60;
  v20 = v10;
  v21 = self;
  v22 = v8;
  v23 = v9;
  v24 = a5;
  v14 = v9;
  v15 = v8;
  v16 = v10;
  objc_msgSend(v13, "objectForKey:onCacheMiss:", v16, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id __59__CNUIPRLikenessResolver_likenessForContact_options_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;

  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __59__CNUIPRLikenessResolver_likenessForContact_options_error___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "likenessResolver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "likenessForContact:options:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)likenessesForContacts:(id)a3 options:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "_cn_take:", +[CNUIPRLikenessResolver maxContacts](CNUIPRLikenessResolver, "maxContacts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__CNUIPRLikenessResolver_likenessesForContacts_options_error___block_invoke;
  v13[3] = &unk_1EA603D48;
  v13[4] = self;
  v14 = v7;
  v10 = v7;
  objc_msgSend(v9, "_cn_map:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __62__CNUIPRLikenessResolver_likenessesForContacts_options_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "likenessForContact:options:error:", a2, *(_QWORD *)(a1 + 40), 0);
}

- (CNUIPRLikenessProvider)loadingPlaceholderLikeness
{
  void *v2;
  void *v3;

  -[CNUIPRLikenessResolver likenessResolver](self, "likenessResolver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadingPlaceholderLikeness");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNUIPRLikenessProvider *)v3;
}

- (void)setProhibitedSources:(int64_t)a3
{
  id v4;

  -[CNUIPRLikenessResolver likenessLookup](self, "likenessLookup");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProhibitedSources:", a3);

}

- (int64_t)prohibitedSources
{
  void *v2;
  int64_t v3;

  -[CNUIPRLikenessResolver likenessLookup](self, "likenessLookup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prohibitedSources");

  return v3;
}

- (void)setPlaceholderProviderFactory:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_placeholderProviderFactory, a3);
  v5 = a3;
  -[CNUIPRLikenessResolver likenessLookup](self, "likenessLookup");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaceholderProviderFactory:", v5);

}

- (CNSchedulerProvider)schedulerProvider
{
  void *v2;
  void *v3;

  -[CNUIPRLikenessResolver likenessLookup](self, "likenessLookup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "schedulerProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNSchedulerProvider *)v3;
}

- (CNUIPRLikenessResolver)initWithContactStore:(id)a3 scheduler:(id)a4
{
  id v6;
  id v7;
  CNUIPRLikenessLookup *v8;
  CNUIPRLikenessResolver *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[CNUIPRLikenessLookup initWithContactStore:scheduler:]([CNUIPRLikenessLookup alloc], "initWithContactStore:scheduler:", v7, v6);

  v9 = -[CNUIPRLikenessResolver initWithLikenessResolver:](self, "initWithLikenessResolver:", v8);
  return v9;
}

- (CNUIPRLikenessResolver)initWithContactStore:(id)a3 scheduler:(id)a4 meMonitor:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNUIPRLikenessLookup *v11;
  CNUIPRLikenessResolver *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[CNUIPRLikenessLookup initWithContactStore:scheduler:meMonitor:]([CNUIPRLikenessLookup alloc], "initWithContactStore:scheduler:meMonitor:", v10, v9, v8);

  v12 = -[CNUIPRLikenessResolver initWithLikenessResolver:](self, "initWithLikenessResolver:", v11);
  return v12;
}

- (unint64_t)lookupOptions
{
  return self->_lookupOptions;
}

- (void)setLikenessResolver:(id)a3
{
  objc_storeStrong((id *)&self->_likenessResolver, a3);
}

- (CNCache)likenessProviderCache
{
  return self->_likenessProviderCache;
}

- (void)setLikenessProviderCache:(id)a3
{
  objc_storeStrong((id *)&self->_likenessProviderCache, a3);
}

- (void)setMainThreadSchedulerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mainThreadSchedulerProvider, a3);
}

- (CNCache)workTrackingCache
{
  return self->_workTrackingCache;
}

- (void)setWorkTrackingCache:(id)a3
{
  objc_storeStrong((id *)&self->_workTrackingCache, a3);
}

- (CNUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_workTrackingCache, 0);
  objc_storeStrong((id *)&self->_placeholderProviderFactory, 0);
  objc_storeStrong((id *)&self->_mainThreadSchedulerProvider, 0);
  objc_storeStrong((id *)&self->_likenessProviderCache, 0);
  objc_storeStrong((id *)&self->_likenessResolver, 0);
}

- (void)likenessesForContact:options:workScheduler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_1DD140000, v0, v1, "[LikenessCache] Placeholder in position", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)likenessesForContact:options:workScheduler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD140000, v0, v1, "[LikenessCache] Cache miss for %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)likenessesForContact:options:workScheduler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD140000, v0, v1, "[LikenessCache] Cache key: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)likenessesForContact:options:workScheduler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD140000, v0, v1, "[LikenessCache] New Request for %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __69__CNUIPRLikenessResolver_likenessesForContact_options_workScheduler___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1DD140000, v0, OS_LOG_TYPE_ERROR, "[LikenessCache] Error in fetching new image: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __69__CNUIPRLikenessResolver_likenessesForContact_options_workScheduler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1DD140000, v0, v1, "[LikenessCache] Received new image for %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)badgeObservableWithLikenessBadge:workScheduler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD140000, v0, v1, "[LikenessCache] Cache miss for badge with key %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)badgeObservableWithLikenessBadge:workScheduler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD140000, v0, v1, "[LikenessCache] Cache key: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)badgeObservableWithLikenessBadge:workScheduler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_1DD140000, v0, v1, "[LikenessCache] New Request for badge", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__CNUIPRLikenessResolver_badgeObservableWithLikenessBadge_workScheduler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1DD140000, v0, v1, "[LikenessCache] Received new image for badge with key %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)badgeWithLikenessBadge:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_1DD140000, v0, v1, "[LikenessCache] New synchronous request for badge", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __49__CNUIPRLikenessResolver_badgeWithLikenessBadge___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1DD140000, v0, v1, "[LikenessCache] synchronous cache miss for badge with key %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)likenessForContact:options:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD140000, v0, v1, "[LikenessCache] New synchronous request for %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __59__CNUIPRLikenessResolver_likenessForContact_options_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1DD140000, v0, v1, "[LikenessCache] synchronous cache miss for contact with key %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
