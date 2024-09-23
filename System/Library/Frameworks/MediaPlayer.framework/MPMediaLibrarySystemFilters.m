@implementation MPMediaLibrarySystemFilters

+ (id)filtersForLibrary:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  id v13;
  SEL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__26041;
  v19 = __Block_byref_object_dispose__26042;
  v20 = 0;
  objc_msgSend(a1, "globalSerialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__MPMediaLibrarySystemFilters_filtersForLibrary___block_invoke;
  v10[3] = &unk_1E315A630;
  v13 = a1;
  v14 = a2;
  v11 = v5;
  v12 = &v15;
  v7 = v5;
  dispatch_sync(v6, v10);

  v8 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v8;
}

+ (OS_dispatch_queue)globalSerialQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MPMediaLibrarySystemFilters_globalSerialQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[MPMediaLibrarySystemFilters globalSerialQueue]::onceToken != -1)
    dispatch_once(&+[MPMediaLibrarySystemFilters globalSerialQueue]::onceToken, block);
  return (OS_dispatch_queue *)(id)+[MPMediaLibrarySystemFilters globalSerialQueue]::__globalSerialQueue;
}

- (BOOL)shouldExcludePurchaseHistoryContent
{
  void *v3;
  char v4;

  -[MPMediaLibraryView library](self->_libraryView, "library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHomeSharingLibrary");

  return (v4 & 1) == 0 && self->_shouldExcludePurchaseHistoryContent;
}

void __49__MPMediaLibrarySystemFilters_filtersForLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 48), "systemFiltersPerLibrary");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), CFSTR("MPMediaLibrarySystemFilters.mm"), 61, CFSTR("Given library has no library identifier"));

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[MPMediaLibrarySystemFilters _initWithLibrary:]([MPMediaLibrarySystemFilters alloc], "_initWithLibrary:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, v2);

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", v2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

+ (NSMutableDictionary)systemFiltersPerLibrary
{
  if (+[MPMediaLibrarySystemFilters systemFiltersPerLibrary]::onceToken != -1)
    dispatch_once(&+[MPMediaLibrarySystemFilters systemFiltersPerLibrary]::onceToken, &__block_literal_global_26050);
  return (NSMutableDictionary *)(id)+[MPMediaLibrarySystemFilters systemFiltersPerLibrary]::__systemFiltersPerLibrary;
}

- (id)_initWithLibrary:(id)a3
{
  id v4;
  MPMediaLibrarySystemFilters *v5;
  MPMediaLibraryView *v6;
  MPMediaLibraryView *libraryView;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  MPMediaLibrarySystemFilters *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPMediaLibrarySystemFilters;
  v5 = -[MPMediaLibrarySystemFilters init](&v13, sel_init);
  if (v5)
  {
    v6 = -[MPMediaLibraryView initWithLibrary:filteringOptions:]([MPMediaLibraryView alloc], "initWithLibrary:filteringOptions:", v4, 0);
    libraryView = v5->_libraryView;
    v5->_libraryView = v6;

    v8 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[MPMediaLibraryView library](v5->_libraryView, "library");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v15 = v5;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "MPMediaLibrarySystemFilters %p - Init with library: %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v5, sel__cloudLibraryAvailabilityDidChange_, CFSTR("MPMediaLibraryCloudLibraryAvailabilityDidChangeNotification"), v4);

    -[MPMediaLibrarySystemFilters _updateFilters](v5, "_updateFilters");
  }

  return v5;
}

- (void)_updateFilters
{
  void *v3;
  uint64_t v4;
  mlcore *v5;
  char *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  MPMediaLibraryView *libraryView;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _BOOL4 shouldExcludePurchaseHistoryContent;
  __int128 v27;
  _QWORD v28[5];
  uint64_t v29;
  std::__shared_weak_count *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  __int128 v36;
  _BYTE buf[22];
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  _BOOL4 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  -[MPMediaLibraryView library](self->_libraryView, "library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sagaOnDiskDatabaseRevision");

  if (v4)
  {
    v5 = (mlcore *)MEMORY[0x194039EC8]();
    mlcore::ItemPropertyRemoteLocationID(v5);
    v31 = 100;
    std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>((uint64_t *)&v27);
    v6 = (char *)operator new(0x80uLL);
    *(_OWORD *)(v6 + 8) = 0u;
    *(_QWORD *)v6 = &off_1E314A800;
    v36 = v27;
    v27 = 0u;
    MEMORY[0x194038F80](v6 + 24, v5, &v36);
    v7 = (std::__shared_weak_count *)*((_QWORD *)&v36 + 1);
    if (*((_QWORD *)&v36 + 1))
    {
      v8 = (unint64_t *)(*((_QWORD *)&v36 + 1) + 8);
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    *(_QWORD *)buf = v6 + 24;
    *(_QWORD *)&buf[8] = v6;
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
    if (*((_QWORD *)&v27 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = *(_QWORD *)buf;
    v27 = xmmword_193F0CA70;
    mlcore::RangeQuery::setRange();
    libraryView = self->_libraryView;
    v29 = v13;
    v30 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v15 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
    }
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __45__MPMediaLibrarySystemFilters__updateFilters__block_invoke;
    v28[3] = &unk_1E315A658;
    v28[4] = &v32;
    -[MPMediaLibraryView performCoreQuery:withCompletion:](libraryView, "performCoreQuery:withCompletion:", &v29, v28);
    v17 = v30;
    if (v30)
    {
      p_shared_owners = (unint64_t *)&v30->__shared_owners_;
      do
        v19 = __ldaxr(p_shared_owners);
      while (__stlxr(v19 - 1, p_shared_owners));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    v20 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v21 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
  }
  self->_shouldExcludePurchaseHistoryContent = *((_BYTE *)v33 + 24);
  v23 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    -[MPMediaLibraryView library](self->_libraryView, "library");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "uniqueIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    shouldExcludePurchaseHistoryContent = self->_shouldExcludePurchaseHistoryContent;
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v25;
    v38 = 1024;
    v39 = v4 != 0;
    v40 = 1024;
    v41 = shouldExcludePurchaseHistoryContent;
    _os_log_impl(&dword_193B9B000, v23, OS_LOG_TYPE_DEFAULT, "MPMediaLibrarySystemFilters %p - Updating filters - Library: %@ - has cloud library revision: %{BOOL}u - purchase history excluded: %{BOOL}u", buf, 0x22u);

  }
  _Block_object_dispose(&v32, 8);
}

void __54__MPMediaLibrarySystemFilters_systemFiltersPerLibrary__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)+[MPMediaLibrarySystemFilters systemFiltersPerLibrary]::__systemFiltersPerLibrary;
  +[MPMediaLibrarySystemFilters systemFiltersPerLibrary]::__systemFiltersPerLibrary = (uint64_t)v0;

}

void __48__MPMediaLibrarySystemFilters_globalSerialQueue__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const char *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  id v7;
  id v8;

  v1 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass(*(Class *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("com.apple.%@.global.serial.queue"), v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_retainAutorelease(v2);
  v3 = (const char *)objc_msgSend(v8, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create(v3, v4);
  v6 = (void *)+[MPMediaLibrarySystemFilters globalSerialQueue]::__globalSerialQueue;
  +[MPMediaLibrarySystemFilters globalSerialQueue]::__globalSerialQueue = (uint64_t)v5;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryView, 0);
}

void __45__MPMediaLibrarySystemFilters__updateFilters__block_invoke(uint64_t a1, uint64_t a2)
{
  mlcore::PropertiesQueryResult *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  _QWORD *v7;
  unint64_t *v8;
  unint64_t v9;

  v3 = *(mlcore::PropertiesQueryResult **)a2;
  v4 = *(std::__shared_weak_count **)(a2 + 8);
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  v7 = (_QWORD *)mlcore::PropertiesQueryResult::allResults(v3);
  if (v7[1] != *v7)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  if (v4)
  {
    v8 = (unint64_t *)&v4->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

@end
