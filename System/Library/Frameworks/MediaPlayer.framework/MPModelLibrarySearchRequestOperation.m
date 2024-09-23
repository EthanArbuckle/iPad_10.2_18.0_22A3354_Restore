@implementation MPModelLibrarySearchRequestOperation

- (MPModelLibrarySearchRequestOperation)init
{
  MPModelLibrarySearchRequestOperation *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessSerialQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPModelLibrarySearchRequestOperation;
  v2 = -[MPAsyncOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MediaPlayer.MPModelLibrarySearchRequestOperation.accessSerialQueue", 0);
    accessSerialQueue = v2->_accessSerialQueue;
    v2->_accessSerialQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)execute
{
  MPMediaLibraryView *v3;
  void *v4;
  MPMediaLibraryView *v5;
  void *v6;
  int64_t v7;
  void *v8;
  id v9;
  id v10;
  char *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  NSObject *accessSerialQueue;
  unint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  NSObject *v37;
  void *v38;
  MPMediaLibraryView *v39;
  void *v40;
  mlcore::LocalizedSearchQuery *v41;
  std::__shared_weak_count *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  MPModelLibrarySearchRequestOperation *v46;
  _QWORD v47[3];
  mlcore::LocalizedSearchQuery *v48;
  std::__shared_weak_count *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD block[5];
  _QWORD *v55;
  std::__shared_weak_count *v56;
  void *__p[2];
  char v58;
  __int128 buf;
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  -[MPModelLibraryRequest mediaLibrary](self->_request, "mediaLibrary");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [MPMediaLibraryView alloc];
  -[MPModelLibraryRequest mediaLibrary](self->_request, "mediaLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MPMediaLibraryView initWithLibrary:filteringOptions:](v3, "initWithLibrary:filteringOptions:", v4, -[MPModelLibraryRequest filteringOptions](self->_request, "filteringOptions"));

  -[MPModelLibrarySearchRequest searchString](self->_request, "searchString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPModelLibrarySearchRequest maximumResultsPerScope](self->_request, "maximumResultsPerScope");
  -[MPModelLibrarySearchRequest scopes](self->_request, "scopes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v6 && objc_msgSend(v6, "length") && objc_msgSend(v8, "count"))
  {
    v10 = objc_retainAutorelease(v6);
    v11 = (char *)objc_msgSend(v10, "UTF8String");
    if (v11)
    {
      v39 = v5;
      v12 = (std::__shared_weak_count *)operator new(0x78uLL);
      v12->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      v12->__shared_weak_owners_ = 0;
      v12->__vftable = (std::__shared_weak_count_vtbl *)&off_1E314A988;
      std::string::basic_string[abi:ne180100]<0>(__p, v11);
      MEMORY[0x19403922C](&v12[1], __p);
      if (v58 < 0)
        operator delete(__p[0]);
      accessSerialQueue = self->_accessSerialQueue;
      v41 = (mlcore::LocalizedSearchQuery *)&v12[1];
      v42 = v12;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3321888768;
      block[2] = __47__MPModelLibrarySearchRequestOperation_execute__block_invoke;
      block[3] = &unk_1E314AEF8;
      block[4] = self;
      v55 = &v12[1].__vftable;
      v56 = v12;
      do
        v15 = __ldxr(p_shared_owners);
      while (__stxr(v15 + 1, p_shared_owners));
      dispatch_sync(accessSerialQueue, block);
      buf = 0uLL;
      v60 = 0;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v16 = v8;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v61, 16, &v55);
      if (v17)
      {
        v18 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v51 != v18)
              objc_enumerationMutation(v16);
            v20 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
            if (v20)
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "coreScope");
              if (__p[0])
              {
                std::vector<std::shared_ptr<mlcore::LocalizedSearchScope>>::push_back[abi:ne180100]((char **)&buf, (__int128 *)__p);
                objc_msgSend(v9, "addObject:", v20);
              }
            }
            else
            {
              __p[0] = 0;
              __p[1] = 0;
            }
            v21 = (std::__shared_weak_count *)__p[1];
            if (__p[1])
            {
              v22 = (unint64_t *)((char *)__p[1] + 8);
              do
                v23 = __ldaxr(v22);
              while (__stlxr(v23 - 1, v22));
              if (!v23)
              {
                ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
                std::__shared_weak_count::__release_weak(v21);
              }
            }
          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
        }
        while (v17);
      }

      v5 = v39;
      mlcore::LocalizedSearchQuery::setScopes();
      if (v7)
        mlcore::LocalizedSearchQuery::setPerScopeResultLimit(v41);
      v48 = v41;
      v49 = v42;
      if (v42)
      {
        v24 = (unint64_t *)&v42->__shared_owners_;
        do
          v25 = __ldxr(v24);
        while (__stxr(v25 + 1, v24));
      }
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3321888768;
      v43[2] = __47__MPModelLibrarySearchRequestOperation_execute__block_invoke_3;
      v43[3] = &unk_1E314AFD0;
      v44 = v9;
      memset(v47, 0, sizeof(v47));
      std::vector<std::shared_ptr<mlcore::LocalizedSearchScope>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::LocalizedSearchScope>*,std::shared_ptr<mlcore::LocalizedSearchScope>*>(v47, (_QWORD *)buf, *((_QWORD **)&buf + 1), (uint64_t)(*((_QWORD *)&buf + 1) - buf) >> 4);
      v45 = v40;
      v46 = self;
      -[MPMediaLibraryView performCoreSearchQuery:withCompletion:](v39, "performCoreSearchQuery:withCompletion:", &v48, v43);
      v26 = v49;
      if (v49)
      {
        v27 = (unint64_t *)&v49->__shared_owners_;
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }

      __p[0] = v47;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);

      __p[0] = &buf;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
      v29 = v56;
      if (v56)
      {
        v30 = (unint64_t *)&v56->__shared_owners_;
        do
          v31 = __ldaxr(v30);
        while (__stlxr(v31 - 1, v30));
        if (!v31)
        {
          ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
          std::__shared_weak_count::__release_weak(v29);
        }
      }
      if (v42)
      {
        v32 = (unint64_t *)&v42->__shared_owners_;
        do
          v33 = __ldaxr(v32);
        while (__stlxr(v33 - 1, v32));
        if (!v33)
        {
          ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
          std::__shared_weak_count::__release_weak(v42);
        }
      }
    }
    else
    {
      v37 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v10;
        _os_log_impl(&dword_193B9B000, v37, OS_LOG_TYPE_FAULT, "MPModelLibrarySearchRequestOperation: NULL utf8 from string: '%{public}@'", (uint8_t *)&buf, 0xCu);
      }

      -[MPAsyncOperation finishWithError:](self, "finishWithError:", 0);
    }
  }
  else
  {
    if (!-[MPAsyncOperation isCancelled](self, "isCancelled"))
    {
      if (v6)
      {
        if (objc_msgSend(v6, "length"))
        {
          v34 = objc_msgSend(v8, "count");
          if (v34)
            v35 = -9001;
          else
            v35 = -9004;
          if (v34)
            v36 = CFSTR("Cannot run library search request due to unknown error.");
          else
            v36 = CFSTR("Cannot run library search request with no requested scopes.");
        }
        else
        {
          v36 = CFSTR("Cannot run library search request with an empty search string.");
          v35 = -9003;
        }
      }
      else
      {
        v36 = CFSTR("Cannot run library search request with a nil search string.");
        v35 = -9002;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibrarySearchRequestErrorDomain"), v35, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void))self->_responseHandler + 2))();

    }
    -[MPAsyncOperation finish](self, "finish");
  }

}

- (void)cancel
{
  NSObject *accessSerialQueue;
  objc_super v4;
  _QWORD block[5];

  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MPModelLibrarySearchRequestOperation_cancel__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(accessSerialQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)MPModelLibrarySearchRequestOperation;
  -[MPAsyncOperation cancel](&v4, sel_cancel);
}

- (MPModelLibrarySearchRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&self->_runningQuery);
  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 35) = 0;
  *((_QWORD *)self + 36) = 0;
  return self;
}

mlcore::LocalizedSearchQuery *__46__MPModelLibrarySearchRequestOperation_cancel__block_invoke(uint64_t a1)
{
  mlcore::LocalizedSearchQuery *result;

  result = *(mlcore::LocalizedSearchQuery **)(*(_QWORD *)(a1 + 32) + 280);
  if (result)
    return (mlcore::LocalizedSearchQuery *)mlcore::LocalizedSearchQuery::cancel(result);
  return result;
}

void __47__MPModelLibrarySearchRequestOperation_execute__block_invoke(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  v1 = a1[5];
  v2 = (_QWORD *)(a1[4] + 280);
  v3 = a1[6];
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  v6 = (std::__shared_weak_count *)v2[1];
  *v2 = v1;
  v2[1] = v3;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void __47__MPModelLibrarySearchRequestOperation_execute__block_invoke_3(uint64_t a1, _QWORD *a2, void *a3)
{
  id v5;
  MPModelLibrarySearchResponse *v6;
  void *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  MPLibraryObjectDatabase *v14;
  void *v15;
  void *v16;
  MPLibraryObjectDatabase *v17;
  MPModelLibrarySearchSectionedCollectionDataSource *v18;
  MPLazySectionedCollection *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  id v27;
  _QWORD v28[4];
  std::__shared_weak_count *v29;
  void **v30;

  v5 = a3;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v7 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3321888768;
    v24[2] = __47__MPModelLibrarySearchRequestOperation_execute__block_invoke_2;
    v24[3] = &unk_1E314B078;
    memset(v28, 0, 24);
    std::vector<std::shared_ptr<mlcore::LocalizedSearchScope>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::LocalizedSearchScope>*,std::shared_ptr<mlcore::LocalizedSearchScope>*>(v28, *(_QWORD **)(a1 + 56), *(_QWORD **)(a1 + 64), (uint64_t)(*(_QWORD *)(a1 + 64) - *(_QWORD *)(a1 + 56)) >> 4);
    v8 = (std::__shared_weak_count *)a2[1];
    v28[3] = *a2;
    v29 = v8;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    v11 = *(id *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v25 = v11;
    v26 = v12;
    v13 = v23;
    v27 = v13;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v24);
    v14 = [MPLibraryObjectDatabase alloc];
    objc_msgSend(*(id *)(a1 + 48), "userIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MPLibraryObjectDatabase initWithLibrary:](v14, "initWithLibrary:", v16);

    v18 = -[MPModelLibrarySearchSectionedCollectionDataSource initWithEntitiesQueryResultContainers:libraryObjectDatabase:]([MPModelLibrarySearchSectionedCollectionDataSource alloc], "initWithEntitiesQueryResultContainers:libraryObjectDatabase:", v13, v17);
    -[MPModelLibrarySearchSectionedCollectionDataSource setRequest:](v18, "setRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 296));
    v19 = -[MPLazySectionedCollection initWithDataSource:]([MPLazySectionedCollection alloc], "initWithDataSource:", v18);
    v6 = -[MPModelLibrarySearchResponse initWithRequest:]([MPModelLibrarySearchResponse alloc], "initWithRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 296));
    -[MPModelResponse setResults:](v6, "setResults:", v19);

    v20 = v29;
    if (v29)
    {
      v21 = (unint64_t *)&v29->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    v30 = (void **)v28;
    std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v30);

  }
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 304) + 16))();
  objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v5);

}

void __47__MPModelLibrarySearchRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  uint64_t v6;
  __int128 v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  MPMediaLibraryEntityTranslationContext *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MPModelLibrarySearchEntityResultContainer *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  MPModelLibrarySearchEntityResultContainer *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  mlcore::EntityQueryResult *v32;
  std::__shared_weak_count *v33;
  __int128 v34;
  mlcore::EntityQueryResult *v35;
  std::__shared_weak_count *v36;
  __int128 v37;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 56);
  if (a3 >= (*(_QWORD *)(a1 + 64) - v6) >> 4)
    std::vector<mlcore::PropertyCache>::__throw_out_of_range[abi:ne180100]();
  v7 = *(_OWORD *)(v6 + 16 * a3);
  v37 = v7;
  if (*((_QWORD *)&v7 + 1))
  {
    v8 = (unint64_t *)(*((_QWORD *)&v7 + 1) + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
    v34 = v7;
    do
      v10 = __ldxr(v8);
    while (__stxr(v10 + 1, v8));
  }
  else
  {
    v34 = (unint64_t)v7;
  }
  mlcore::LocalizedSearchQueryResult::resultForSearchScope();
  if (*((_QWORD *)&v34 + 1))
  {
    v11 = (unint64_t *)(*((_QWORD *)&v34 + 1) + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v34 + 1) + 16))(*((_QWORD *)&v34 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v34 + 1));
    }
  }
  if (v35 && mlcore::EntityQueryResult::entityCount(v35))
  {
    v13 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
    objc_msgSend(v5, "itemKind");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibraryEntityTranslationContext setModelKind:](v13, "setModelKind:", v14);

    -[MPMediaLibraryEntityTranslationContext setMediaLibrary:](v13, "setMediaLibrary:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "itemKind");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibraryEntityTranslationContext setMultiQuery:](v13, "setMultiQuery:", objc_msgSend(v15, "modelClass") == objc_opt_class());

    objc_msgSend(*(id *)(a1 + 40), "userIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accountDSID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibraryEntityTranslationContext setPersonID:](v13, "setPersonID:", v17);

    v18 = *(void **)(a1 + 48);
    v19 = [MPModelLibrarySearchEntityResultContainer alloc];
    v32 = v35;
    v33 = v36;
    if (v36)
    {
      p_shared_owners = (unint64_t *)&v36->__shared_owners_;
      do
        v21 = __ldxr(p_shared_owners);
      while (__stxr(v21 + 1, p_shared_owners));
    }
    v22 = -[MPModelLibrarySearchEntityResultContainer initWithEntityQueryResult:forScope:entityTranslationContext:](v19, "initWithEntityQueryResult:forScope:entityTranslationContext:", &v32, v5, v13);
    objc_msgSend(v18, "addObject:", v22, v32);

    v23 = v33;
    if (v33)
    {
      v24 = (unint64_t *)&v33->__shared_owners_;
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }

  }
  v26 = v36;
  if (v36)
  {
    v27 = (unint64_t *)&v36->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v29 = (std::__shared_weak_count *)*((_QWORD *)&v37 + 1);
  if (*((_QWORD *)&v37 + 1))
  {
    v30 = (unint64_t *)(*((_QWORD *)&v37 + 1) + 8);
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }

}

@end
