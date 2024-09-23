@implementation _MPModelLibraryDownloadQueueDataSource

- (_MPModelLibraryDownloadQueueDataSource)initWithRequest:(id)a3
{
  _MPModelLibraryDownloadQueueDataSource *v4;
  _MPModelLibraryDownloadQueueDataSource *v5;
  uint64_t v6;
  MPModelLibraryDownloadQueueRequest *request;
  void *v8;
  uint64_t v9;
  MPMediaLibraryEntityTranslator *entityTranslator;
  MPMediaLibraryEntityTranslationContext *v11;
  MPMediaLibraryEntityTranslationContext *entityTranslationContext;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  uint64_t v26;
  MPMediaLibraryView *v27;
  void *v28;
  MPMediaLibraryView *v29;
  MPMediaLibraryEntityTranslator *v30;
  void *v31;
  _MPModelLibraryDownloadQueueDataSource *v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  unint64_t *v36;
  unint64_t v37;
  char *v38;
  __int128 v39;
  unint64_t *p_shared_owners;
  unint64_t v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  shared_ptr<mlcore::EntityQueryResult> v54;
  std::__shared_weak_count *cntrl;
  unint64_t *v56;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  std::__shared_weak_count *v64;
  unint64_t *v65;
  unint64_t v66;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  void *v71;
  id v72;
  _MPModelLibraryDownloadQueueDataSource *v73;
  id obj;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  mlcore::EntityCache *v80;
  std::__shared_weak_count *v81;
  void *__p;
  __int128 v83;
  __int128 v84;
  int v85;
  __int128 v86;
  __int128 v87;
  int v88;
  __int128 v89;
  __int128 v90;
  int v91;
  __int128 v92;
  __int128 v93;
  int v94;
  float v95[10];
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD *v101;
  std::__shared_weak_count *v102;
  objc_super v103;
  mlcore::EntityCache *v104;
  std::__shared_weak_count *v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v72 = a3;
  v103.receiver = self;
  v103.super_class = (Class)_MPModelLibraryDownloadQueueDataSource;
  v4 = -[_MPModelLibraryDownloadQueueDataSource init](&v103, sel_init);
  v73 = v4;
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v72, "copy");
    request = v5->_request;
    v5->_request = (MPModelLibraryDownloadQueueRequest *)v6;

    -[MPModelRequest itemKind](v5->_request, "itemKind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_msgSend(v8, "modelClass"));
    v9 = objc_claimAutoreleasedReturnValue();
    entityTranslator = v73->_entityTranslator;
    v73->_entityTranslator = (MPMediaLibraryEntityTranslator *)v9;

    v11 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
    entityTranslationContext = v73->_entityTranslationContext;
    v73->_entityTranslationContext = v11;

    -[MPModelRequest itemKind](v73->_request, "itemKind");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibraryEntityTranslationContext setModelKind:](v73->_entityTranslationContext, "setModelKind:", v13);

    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v14);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPMediaLibraryEntityTranslationContext setMediaLibrary:](v73->_entityTranslationContext, "setMediaLibrary:", v71);
    objc_msgSend(v71, "userIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accountDSID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibraryEntityTranslationContext setPersonID:](v73->_entityTranslationContext, "setPersonID:", v16);

    v76 = -[MPMediaLibraryEntityTranslator entityClass](v73->_entityTranslator, "entityClass");
    v17 = (_QWORD *)operator new();
    *v17 = 0;
    v17[1] = 0;
    v17[2] = 0;
    std::shared_ptr<std::vector<mlcore::PropertyCache>>::shared_ptr[abi:ne180100]<std::vector<mlcore::PropertyCache>,void>(&v101, (uint64_t)v17);
    +[MPMediaDownloadManager sharedManager](MPMediaDownloadManager, "sharedManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allMediaDownloadLibraryIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    obj = v19;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
    if (v20)
    {
      v75 = *(_QWORD *)v98;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v98 != v75)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
          v83 = 0u;
          v84 = 0u;
          v86 = 0u;
          v87 = 0u;
          v85 = 1065353216;
          v88 = 1065353216;
          v89 = 0u;
          v90 = 0u;
          v92 = 0u;
          v93 = 0u;
          v91 = 1065353216;
          v94 = 1065353216;
          memset(v95, 0, 32);
          v95[8] = 1.0;
          __p = (void *)(MEMORY[0x1E0D4AF40] + 16);
          v96 = MEMORY[0x1E0D4AF40] + 56;
          v23 = objc_msgSend(v22, "longLongValue");
          *(_QWORD *)&v107 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v76 + 112))(v76);
          std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::__unordered_map_hasher<mlcore::ModelProperty<long long> *,std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::hash<mlcore::ModelProperty<long long> *>,std::equal_to<mlcore::ModelProperty<long long> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<long long> *,std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::equal_to<mlcore::ModelProperty<long long> *>,std::hash<mlcore::ModelProperty<long long> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>>>::__emplace_unique_key_args<mlcore::ModelProperty<long long> *,std::piecewise_construct_t const&,std::tuple<mlcore::ModelProperty<long long> * const&>,std::tuple<>>(v95, v107, &v107)[3] = v23;
          v24 = v101;
          v25 = v101[1];
          if (v25 >= v101[2])
          {
            v26 = std::vector<mlcore::PropertyCache>::__push_back_slow_path<mlcore::PropertyCache const&>(v101);
          }
          else
          {
            mlcore::PropertyCache::PropertyCache();
            v26 = v25 + 216;
            v24[1] = v25 + 216;
          }
          v24[1] = v26;
          mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(&__p);
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
      }
      while (v20);
    }

    v27 = [MPMediaLibraryView alloc];
    -[MPMediaLibraryEntityTranslationContext mediaLibrary](v73->_entityTranslationContext, "mediaLibrary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[MPMediaLibraryView initWithLibrary:filteringOptions:](v27, "initWithLibrary:filteringOptions:", v28, 0);

    v30 = v73->_entityTranslator;
    -[MPModelRequest itemProperties](v73->_request, "itemProperties");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      -[MPMediaLibraryEntityTranslator MLCorePropertiesForPropertySet:](v30, "MLCorePropertiesForPropertySet:", v31);
    }
    else
    {
      __p = 0;
      v83 = 0uLL;
    }

    if (v29)
    {
      v32 = v73;
      -[MPMediaLibraryView mlCoreView](v29, "mlCoreView");
    }
    else
    {
      v77 = 0uLL;
      v32 = v73;
    }
    std::allocate_shared[abi:ne180100]<mlcore::EntityCache,std::allocator<mlcore::EntityCache>,std::shared_ptr<mlcore::DeviceLibraryView>,void>(&v80, &v77);
    v33 = (std::__shared_weak_count *)*((_QWORD *)&v77 + 1);
    if (*((_QWORD *)&v77 + 1))
    {
      v34 = (unint64_t *)(*((_QWORD *)&v77 + 1) + 8);
      do
        v35 = __ldaxr(v34);
      while (__stlxr(v35 - 1, v34));
      if (!v35)
      {
        ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
        std::__shared_weak_count::__release_weak(v33);
      }
    }
    mlcore::EntityCache::setCacheDisabled(v80);
    if (v29)
    {
      -[MPMediaLibraryView mlCoreView](v29, "mlCoreView");
      v79 = v78;
      if (*((_QWORD *)&v78 + 1))
      {
        v36 = (unint64_t *)(*((_QWORD *)&v78 + 1) + 8);
        do
          v37 = __ldxr(v36);
        while (__stxr(v37 + 1, v36));
      }
    }
    else
    {
      v78 = 0uLL;
      v79 = 0uLL;
    }
    v38 = (char *)operator new(0x128uLL);
    *(_OWORD *)(v38 + 8) = 0u;
    *(_QWORD *)v38 = &off_1E314A8A8;
    v39 = v79;
    v79 = 0u;
    v77 = 0u;
    v106 = 0u;
    v107 = v39;
    v104 = v80;
    v105 = v81;
    if (v81)
    {
      p_shared_owners = (unint64_t *)&v81->__shared_owners_;
      do
        v41 = __ldxr(p_shared_owners);
      while (__stxr(v41 + 1, p_shared_owners));
    }
    mlcore::EntityQueryResult::EntityQueryResult();
    v42 = v105;
    if (v105)
    {
      v43 = (unint64_t *)&v105->__shared_owners_;
      do
        v44 = __ldaxr(v43);
      while (__stlxr(v44 - 1, v43));
      if (!v44)
      {
        ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
        std::__shared_weak_count::__release_weak(v42);
      }
    }
    v45 = (std::__shared_weak_count *)*((_QWORD *)&v106 + 1);
    if (*((_QWORD *)&v106 + 1))
    {
      v46 = (unint64_t *)(*((_QWORD *)&v106 + 1) + 8);
      do
        v47 = __ldaxr(v46);
      while (__stlxr(v47 - 1, v46));
      if (!v47)
      {
        ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
        std::__shared_weak_count::__release_weak(v45);
      }
    }
    v48 = (std::__shared_weak_count *)*((_QWORD *)&v77 + 1);
    if (*((_QWORD *)&v77 + 1))
    {
      v49 = (unint64_t *)(*((_QWORD *)&v77 + 1) + 8);
      do
        v50 = __ldaxr(v49);
      while (__stlxr(v50 - 1, v49));
      if (!v50)
      {
        ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
        std::__shared_weak_count::__release_weak(v48);
      }
    }
    v51 = (std::__shared_weak_count *)*((_QWORD *)&v107 + 1);
    if (*((_QWORD *)&v107 + 1))
    {
      v52 = (unint64_t *)(*((_QWORD *)&v107 + 1) + 8);
      do
        v53 = __ldaxr(v52);
      while (__stlxr(v53 - 1, v52));
      if (!v53)
      {
        ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
        std::__shared_weak_count::__release_weak(v51);
      }
    }
    v54.__ptr_ = (EntityQueryResult *)(v38 + 24);
    v54.__cntrl_ = (__shared_weak_count *)v38;
    cntrl = (std::__shared_weak_count *)v32->_entityQueryResult.__cntrl_;
    v32->_entityQueryResult = v54;
    if (cntrl)
    {
      v56 = (unint64_t *)&cntrl->__shared_owners_;
      do
        v57 = __ldaxr(v56);
      while (__stlxr(v57 - 1, v56));
      if (!v57)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v58 = (std::__shared_weak_count *)*((_QWORD *)&v79 + 1);
    if (*((_QWORD *)&v79 + 1))
    {
      v59 = (unint64_t *)(*((_QWORD *)&v79 + 1) + 8);
      do
        v60 = __ldaxr(v59);
      while (__stlxr(v60 - 1, v59));
      if (!v60)
      {
        ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
        std::__shared_weak_count::__release_weak(v58);
      }
    }
    v61 = (std::__shared_weak_count *)*((_QWORD *)&v78 + 1);
    if (*((_QWORD *)&v78 + 1))
    {
      v62 = (unint64_t *)(*((_QWORD *)&v78 + 1) + 8);
      do
        v63 = __ldaxr(v62);
      while (__stlxr(v63 - 1, v62));
      if (!v63)
      {
        ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
        std::__shared_weak_count::__release_weak(v61);
      }
    }
    v64 = v81;
    if (v81)
    {
      v65 = (unint64_t *)&v81->__shared_owners_;
      do
        v66 = __ldaxr(v65);
      while (__stlxr(v66 - 1, v65));
      if (!v66)
      {
        ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
        std::__shared_weak_count::__release_weak(v64);
      }
    }
    if (__p)
    {
      *(_QWORD *)&v83 = __p;
      operator delete(__p);
    }

    v67 = v102;
    if (v102)
    {
      v68 = (unint64_t *)&v102->__shared_owners_;
      do
        v69 = __ldaxr(v68);
      while (__stlxr(v69 - 1, v68));
      if (!v69)
      {
        ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
        std::__shared_weak_count::__release_weak(v67);
      }
    }

  }
  return v73;
}

- (unint64_t)numberOfSections
{
  return 1;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  return mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_entityQueryResult.__ptr_);
}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  EntityQueryResult *ptr;
  MPMediaLibraryEntityTranslator *entityTranslator;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  mlcore::Entity *v13;
  std::__shared_weak_count *v14;

  v4 = a3;
  ptr = self->_entityQueryResult.__ptr_;
  objc_msgSend(v4, "item");
  mlcore::EntityQueryResult::entityAtIndex((mlcore::EntityQueryResult *)ptr);
  +[MPMediaLibrary logDatabaseAccess](MPMediaLibrary, "logDatabaseAccess");
  if (v13)
  {
    entityTranslator = self->_entityTranslator;
    -[MPModelRequest itemProperties](self->_request, "itemProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (*(uint64_t (**)())(*(_QWORD *)v13 + 48))();
    -[MPMediaLibraryEntityTranslator objectForPropertySet:entityClass:propertyCache:context:](entityTranslator, "objectForPropertySet:entityClass:propertyCache:context:", v7, v8, mlcore::Entity::propertyCache(v13), self->_entityTranslationContext);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)())v14->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v14);
    }
  }

  return v9;
}

- (id)identifiersForItemAtIndexPath:(id)a3
{
  id v4;
  EntityQueryResult *ptr;
  uint64_t v6;
  MPIdentifierSet *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MPIdentifierSet *v12;
  _QWORD v14[6];

  v4 = a3;
  ptr = self->_entityQueryResult.__ptr_;
  objc_msgSend(v4, "item");
  v6 = mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)ptr);
  v7 = [MPIdentifierSet alloc];
  -[MPMediaLibraryEntityTranslationContext mediaLibrary](self->_entityTranslationContext, "mediaLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("LibraryDownload-"), "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelRequest itemKind](self->_request, "itemKind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72___MPModelLibraryDownloadQueueDataSource_identifiersForItemAtIndexPath___block_invoke;
  v14[3] = &unk_1E315F6D0;
  v14[4] = self;
  v14[5] = v6;
  v12 = -[MPIdentifierSet initWithSource:modelKind:block:](v7, "initWithSource:modelKind:block:", v10, v11, v14);

  return v12;
}

- (void).cxx_destruct
{
  std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&self->_entityQueryResult);
  objc_storeStrong((id *)&self->_entityTranslationContext, 0);
  objc_storeStrong((id *)&self->_entityTranslator, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
