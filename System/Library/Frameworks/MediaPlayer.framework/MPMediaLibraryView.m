@implementation MPMediaLibraryView

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[MPMediaLibraryView library](self, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithLibrary:filteringOptions:", v5, -[MPMediaLibraryView filteringOptions](self, "filteringOptions"));

  return v6;
}

- (MPMediaLibrary)library
{
  return self->_library;
}

- (unint64_t)filteringOptions
{
  return self->_filteringOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&self->_coreView);
}

- (MPMediaLibraryView)initWithLibrary:(id)a3 filteringOptions:(unint64_t)a4
{
  id v7;
  MPMediaLibraryView *v8;
  MPMediaLibraryView *v9;
  MPMediaLibrary *library;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *cntrl;
  unint64_t *v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t *v20;
  unint64_t v21;
  void *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v26;
  std::__shared_weak_count *v27;
  _OWORD v28[2];
  uint64_t v29;
  std::__shared_weak_count *v30;
  objc_super v31;

  v7 = a3;
  v31.receiver = self;
  v31.super_class = (Class)MPMediaLibraryView;
  v8 = -[MPMediaLibraryView init](&v31, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_library, a3);
    v9->_filteringOptions = a4;
    library = v9->_library;
    if (library)
    {
      -[MPMediaLibrary _MediaLibrary_coreLibrary](library, "_MediaLibrary_coreLibrary");
      v29 = v26;
      v30 = v27;
      if (v27)
      {
        p_shared_owners = (unint64_t *)&v27->__shared_owners_;
        do
          v12 = __ldxr(p_shared_owners);
        while (__stxr(v12 + 1, p_shared_owners));
      }
    }
    else
    {
      v27 = 0;
      v29 = 0;
      v30 = 0;
    }
    mlcore::LibraryView::viewWithLibrary();
    if (*((_QWORD *)&v28[0] + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v28[0] + 1) + 8);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    cntrl = (std::__shared_weak_count *)v9->_coreView.__cntrl_;
    v9->_coreView = (shared_ptr<mlcore::DeviceLibraryView>)v28[0];
    if (cntrl)
    {
      v16 = (unint64_t *)&cntrl->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    if (*((_QWORD *)&v28[0] + 1))
    {
      v18 = (unint64_t *)(*((_QWORD *)&v28[0] + 1) + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        (*(void (**)(_QWORD))(**((_QWORD **)&v28[0] + 1) + 16))(*((_QWORD *)&v28[0] + 1));
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v28[0] + 1));
      }
    }
    if (v30)
    {
      v20 = &v30->__shared_owners_;
      do
        v21 = __ldaxr((unint64_t *)v20);
      while (__stlxr(v21 - 1, (unint64_t *)v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
        std::__shared_weak_count::__release_weak(v30);
      }
    }
    if (MPMLCoreInitialize(void)::onceToken != -1)
      dispatch_once(&MPMLCoreInitialize(void)::onceToken, &__block_literal_global_43387);
    mlcore::LibraryView::filters((mlcore::LibraryView *)v9->_coreView.__ptr_);
    if ((a4 & 0x10000) == 0)
    {
      +[MPRestrictionsMonitor sharedRestrictionsMonitor](MPRestrictionsMonitor, "sharedRestrictionsMonitor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      mlcore::ContentRestrictions::ContentRestrictions((mlcore::ContentRestrictions *)v28);
      objc_msgSend(v22, "allowsExplicitContent");
      mlcore::ContentRestrictions::setRestrictExplicitLyrics((mlcore::ContentRestrictions *)v28);
      objc_msgSend(v22, "maximumTVShowRating");
      mlcore::ContentRestrictions::setRestrictedTVShowsRank((mlcore::ContentRestrictions *)v28);
      objc_msgSend(v22, "maximumMovieRating");
      mlcore::ContentRestrictions::setRestrictedMoviesRank((mlcore::ContentRestrictions *)v28);
      objc_msgSend(v22, "allowsMusicVideos");
      mlcore::ContentRestrictions::setRestrictMusicVideos((mlcore::ContentRestrictions *)v28);
      mlcore::LibraryView::setContentRestrictions();

    }
    _os_feature_enabled_impl();
    mlcore::LibraryView::setFilters((mlcore::LibraryView *)v9->_coreView.__ptr_);
    if (v27)
    {
      v23 = (unint64_t *)&v27->__shared_owners_;
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }
  }

  return v9;
}

- (shared_ptr<mlcore::QueryResult>)resultsForCoreQuery:(shared_ptr<mlcore:(id *)a4 :Query>)a3 error:
{
  _QWORD *v4;
  __shared_weak_count *var1;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  QueryResult *v21;
  __shared_weak_count *v22;
  void *v23;
  _QWORD v24[7];
  uint64_t v25;
  std::__shared_weak_count *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  __n128 (*v36)(__n128 *, __n128 *);
  uint64_t (*v37)(uint64_t);
  void *v38;
  uint64_t v39;
  std::__shared_weak_count *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  shared_ptr<mlcore::QueryResult> result;

  var1 = a3.var1;
  v8 = v4;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x4012000000;
  v36 = __Block_byref_object_copy__307;
  v37 = __Block_byref_object_dispose__308;
  v39 = 0;
  v40 = 0;
  v38 = &unk_193F4554F;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__9;
  v31 = __Block_byref_object_dispose__10;
  v32 = 0;
  v9 = (std::__shared_weak_count *)*((_QWORD *)a3.var0 + 1);
  v25 = *(_QWORD *)a3.var0;
  v26 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __48__MPMediaLibraryView_resultsForCoreQuery_error___block_invoke;
  v24[3] = &unk_1E3152F20;
  v24[4] = &v33;
  v24[5] = &v27;
  v24[6] = &v41;
  -[MPMediaLibraryView performCoreQuery:withCompletion:](self, "performCoreQuery:withCompletion:", &v25, v24, a4);
  v12 = v26;
  if (v26)
  {
    v13 = (unint64_t *)&v26->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (*((_BYTE *)v42 + 24))
  {
    if (!var1)
      goto LABEL_12;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaLibraryView.mm"), 224, CFSTR("MLCore library queries should be guaranteed no-escape"));

  if (var1)
LABEL_11:
    *(_QWORD *)var1 = objc_retainAutorelease((id)v28[5]);
LABEL_12:
  v15 = v34[7];
  *v8 = v34[6];
  v8[1] = v15;
  if (v15)
  {
    v16 = (unint64_t *)(v15 + 8);
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  v18 = v40;
  if (v40)
  {
    v19 = (unint64_t *)&v40->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  _Block_object_dispose(&v41, 8);
  result.var1 = v22;
  result.var0 = v21;
  return result;
}

- (void)performCoreQuery:(shared_ptr<mlcore:(id)a4 :Query>)a3 withCompletion:
{
  Query *var0;
  __shared_weak_count *v6;
  DeviceLibraryView *ptr;
  std::__shared_weak_count *v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _BYTE *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  std::__shared_weak_count *v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  _QWORD v45[3];
  _QWORD *v46;
  _QWORD v47[3];
  _QWORD *v48;
  _QWORD v49[3];
  _QWORD *v50;
  _BYTE v51[24];
  _BYTE *v52;
  uint64_t v53;

  var0 = a3.var0;
  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3.var1;
  +[MPMediaLibrary logDatabaseAccess](MPMediaLibrary, "logDatabaseAccess");
  ptr = self->_coreView.__ptr_;
  v9 = *(_QWORD *)var0;
  v8 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v39 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  v45[0] = &off_1E3149D68;
  v45[1] = MEMORY[0x19403A810](v6);
  v46 = v45;
  v40 = v8;
  if (!v8)
    goto LABEL_11;
  v12 = (unint64_t *)&v8->__shared_owners_;
  do
    v13 = __ldxr(v12);
  while (__stxr(v13 + 1, v12));
  v14 = (uint64_t)v46;
  if (!v46)
    goto LABEL_10;
  if (v46 == v45)
  {
LABEL_11:
    v48 = v47;
    std::__function::__func<-[MPMediaLibraryView performCoreQuery:withCompletion:]::$_0,std::allocator<-[MPMediaLibraryView performCoreQuery:withCompletion:]::$_0>,void ()(std::shared_ptr<mlcore::QueryResult>)>::__clone((uint64_t)v45, v47);
    v43 = v9;
    v44 = v8;
    if (!v8)
      goto LABEL_14;
    goto LABEL_12;
  }
  v14 = (*(uint64_t (**)(void))(*v46 + 16))();
LABEL_10:
  v48 = (_QWORD *)v14;
  v43 = v9;
  v44 = v8;
LABEL_12:
  v15 = (unint64_t *)&v8->__shared_owners_;
  do
    v16 = __ldxr(v15);
  while (__stxr(v16 + 1, v15));
LABEL_14:
  v41 = 0;
  v42 = 0;
  v17 = (uint64_t)v48;
  if (!v48)
  {
LABEL_17:
    v50 = (_QWORD *)v17;
    goto LABEL_19;
  }
  if (v48 != v47)
  {
    v17 = (*(uint64_t (**)(_QWORD *))(*v48 + 16))(v48);
    goto LABEL_17;
  }
  v50 = v49;
  (*(void (**)(_QWORD *, _QWORD *))(v47[0] + 24))(v47, v49);
LABEL_19:
  v52 = 0;
  v18 = operator new(0x28uLL);
  v19 = v18;
  *v18 = &off_1E3149EC8;
  if (!v50)
  {
    v20 = v18 + 4;
    goto LABEL_23;
  }
  if (v50 != v49)
  {
    v20 = &v50;
    v18[4] = v50;
LABEL_23:
    *v20 = 0;
    goto LABEL_25;
  }
  v18[4] = v18 + 1;
  (*(void (**)(_QWORD *))(v49[0] + 24))(v49);
LABEL_25:
  v52 = v19;
  (**(void (***)(DeviceLibraryView *, uint64_t *, uint64_t *, _BYTE *))ptr)(ptr, &v43, &v41, v51);
  v21 = v52;
  if (v52 == v51)
  {
    v22 = 4;
    v21 = v51;
  }
  else
  {
    if (!v52)
      goto LABEL_30;
    v22 = 5;
  }
  (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_30:
  v23 = v50;
  if (v50 == v49)
  {
    v24 = 4;
    v23 = v49;
    goto LABEL_34;
  }
  if (v50)
  {
    v24 = 5;
LABEL_34:
    (*(void (**)(void))(*v23 + 8 * v24))();
  }
  v25 = v42;
  if (v42)
  {
    v26 = (unint64_t *)&v42->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  v28 = v44;
  if (v44)
  {
    v29 = (unint64_t *)&v44->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  v31 = v48;
  if (v48 == v47)
  {
    v32 = 4;
    v31 = v47;
    goto LABEL_49;
  }
  if (v48)
  {
    v32 = 5;
LABEL_49:
    (*(void (**)(void))(*v31 + 8 * v32))();
  }
  if (v40)
  {
    v33 = (unint64_t *)&v40->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }
  v35 = v46;
  if (v46 == v45)
  {
    v36 = 4;
    v35 = v45;
    goto LABEL_59;
  }
  if (v46)
  {
    v36 = 5;
LABEL_59:
    (*(void (**)(void))(*v35 + 8 * v36))();
  }
  if (v39)
  {
    v37 = (unint64_t *)&v39->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }

}

- (void)performCoreQuery:withCompletion:
{
}

- (uint64_t)performCoreQuery:withCompletion:
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"Z54-[MPMediaLibraryView performCoreQuery:withCompletion:]E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (BOOL)hasEntitiesForModelKind:(id)a3
{
  id v4;
  MPMediaLibraryEntityTranslationContext *v5;
  void *v6;
  void *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  BOOL v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v26;
  std::__shared_weak_count *v27;
  mlcore::EntityQueryResult *v28;
  mlcore::EntityQueryResult *v29;
  mlcore::EntityQueryResult *v30[2];
  uint64_t v31;
  std::__shared_weak_count *v32;

  v4 = a3;
  v5 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
  -[MPMediaLibraryEntityTranslationContext setMediaLibrary:](v5, "setMediaLibrary:", self->_library);
  -[MPMediaLibraryEntityTranslationContext setModelKind:](v5, "setModelKind:", v4);
  +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_msgSend(v4, "modelClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "entityQueryForPropertySet:sortDescriptors:context:view:", v7, 0, v5, self);
  }
  else
  {
    v31 = 0;
    v32 = 0;
  }

  *(_OWORD *)v30 = xmmword_193F0CA70;
  mlcore::RangeQuery::setRange();
  v26 = v31;
  v27 = v32;
  if (v32)
  {
    p_shared_owners = (unint64_t *)&v32->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  -[MPMediaLibraryView _performCoreQuery:error:](self, "_performCoreQuery:error:", &v26, 0);
  v30[0] = v28;
  v30[1] = v29;
  if (v29)
  {
    v10 = (unint64_t *)((char *)v29 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
    v12 = (std::__shared_weak_count *)v29;
    if (v29)
    {
      v13 = (unint64_t *)((char *)v29 + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
  }
  v15 = v27;
  if (v27)
  {
    v16 = (unint64_t *)&v27->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  if (v30[0])
    v18 = mlcore::EntityQueryResult::entityCount(v30[0]) != 0;
  else
    v18 = 0;
  v19 = (std::__shared_weak_count *)v30[1];
  if (v30[1])
  {
    v20 = (unint64_t *)((char *)v30[1] + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v22 = v32;
  if (v32)
  {
    v23 = (unint64_t *)&v32->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }

  return v18;
}

- (shared_ptr<mlcore::DeviceLibraryView>)mlCoreView
{
  DeviceLibraryView **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<mlcore::DeviceLibraryView> result;

  cntrl = self->_coreView.__cntrl_;
  *v2 = self->_coreView.__ptr_;
  v2[1] = (DeviceLibraryView *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (DeviceLibraryView *)self;
  return result;
}

- (shared_ptr<mlcore::QueryResult>)_performCoreQuery:(shared_ptr<mlcore:(id *)a4 :Query>)a3 error:
{
  _QWORD *v4;
  __shared_weak_count *var1;
  Query *var0;
  _QWORD *v8;
  dispatch_semaphore_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  NSObject *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  QueryResult *v23;
  __shared_weak_count *v24;
  _QWORD v25[4];
  NSObject *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  __n128 (*v40)(__n128 *, __n128 *);
  uint64_t (*v41)(uint64_t);
  void *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  shared_ptr<mlcore::QueryResult> result;

  var1 = a3.var1;
  var0 = a3.var0;
  v8 = v4;
  v9 = dispatch_semaphore_create(0);
  v37 = 0;
  v38 = &v37;
  v39 = 0x4012000000;
  v40 = __Block_byref_object_copy__307;
  v41 = __Block_byref_object_dispose__308;
  v43 = 0;
  v44 = 0;
  v42 = &unk_193F4554F;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__9;
  v35 = __Block_byref_object_dispose__10;
  v36 = 0;
  v10 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v29 = *(_QWORD *)var0;
  v30 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __46__MPMediaLibraryView__performCoreQuery_error___block_invoke;
  v25[3] = &unk_1E3152F48;
  v27 = &v37;
  v28 = &v31;
  v13 = v9;
  v26 = v13;
  -[MPMediaLibraryView performCoreQuery:withCompletion:](self, "performCoreQuery:withCompletion:", &v29, v25);
  v14 = v30;
  if (v30)
  {
    v15 = (unint64_t *)&v30->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  if (var1)
    *(_QWORD *)var1 = objc_retainAutorelease((id)v32[5]);
  v17 = v38[7];
  *v8 = v38[6];
  v8[1] = v17;
  if (v17)
  {
    v18 = (unint64_t *)(v17 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  v20 = v44;
  if (v44)
  {
    v21 = (unint64_t *)&v44->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }

  result.var1 = v24;
  result.var0 = v23;
  return result;
}

void __46__MPMediaLibraryView__performCoreQuery_error___block_invoke(uint64_t a1, uint64_t *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  std::shared_ptr<mlcore::QueryResult>::operator=[abi:ne180100]((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *a2, a2[1]);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __48__MPMediaLibraryView_resultsForCoreQuery_error___block_invoke(_QWORD *a1, uint64_t *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  std::shared_ptr<mlcore::QueryResult>::operator=[abi:ne180100]((_QWORD *)(*(_QWORD *)(a1[4] + 8) + 48), *a2, a2[1]);
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
}

- (void)performCoreSearchQuery:(shared_ptr<mlcore:(id)a4 :LocalizedSearchQuery>)a3 withCompletion:
{
  LocalizedSearchQuery *ptr;
  __shared_weak_count *v6;
  DeviceLibraryView *v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _BYTE *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  std::__shared_weak_count *v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  _QWORD v45[3];
  _QWORD *v46;
  _QWORD v47[3];
  _QWORD *v48;
  _QWORD v49[3];
  _QWORD *v50;
  _BYTE v51[24];
  _BYTE *v52;
  uint64_t v53;

  ptr = a3.__ptr_;
  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3.__cntrl_;
  +[MPMediaLibrary logDatabaseAccess](MPMediaLibrary, "logDatabaseAccess");
  v7 = self->_coreView.__ptr_;
  v9 = *(_QWORD *)ptr;
  v8 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v39 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  v45[0] = &off_1E3149DC0;
  v45[1] = MEMORY[0x19403A810](v6);
  v46 = v45;
  v40 = v8;
  if (!v8)
    goto LABEL_11;
  v12 = (unint64_t *)&v8->__shared_owners_;
  do
    v13 = __ldxr(v12);
  while (__stxr(v13 + 1, v12));
  v14 = (uint64_t)v46;
  if (!v46)
    goto LABEL_10;
  if (v46 == v45)
  {
LABEL_11:
    v48 = v47;
    std::__function::__func<-[MPMediaLibraryView performCoreSearchQuery:withCompletion:]::$_1,std::allocator<-[MPMediaLibraryView performCoreSearchQuery:withCompletion:]::$_1>,void ()(std::shared_ptr<mlcore::LocalizedSearchQueryResult>)>::__clone((uint64_t)v45, v47);
    v43 = v9;
    v44 = v8;
    if (!v8)
      goto LABEL_14;
    goto LABEL_12;
  }
  v14 = (*(uint64_t (**)(void))(*v46 + 16))();
LABEL_10:
  v48 = (_QWORD *)v14;
  v43 = v9;
  v44 = v8;
LABEL_12:
  v15 = (unint64_t *)&v8->__shared_owners_;
  do
    v16 = __ldxr(v15);
  while (__stxr(v16 + 1, v15));
LABEL_14:
  v41 = 0;
  v42 = 0;
  v17 = (uint64_t)v48;
  if (!v48)
  {
LABEL_17:
    v50 = (_QWORD *)v17;
    goto LABEL_19;
  }
  if (v48 != v47)
  {
    v17 = (*(uint64_t (**)(_QWORD *))(*v48 + 16))(v48);
    goto LABEL_17;
  }
  v50 = v49;
  (*(void (**)(_QWORD *, _QWORD *))(v47[0] + 24))(v47, v49);
LABEL_19:
  v52 = 0;
  v18 = operator new(0x28uLL);
  v19 = v18;
  *v18 = &off_1E3149E70;
  if (!v50)
  {
    v20 = v18 + 4;
    goto LABEL_23;
  }
  if (v50 != v49)
  {
    v20 = &v50;
    v18[4] = v50;
LABEL_23:
    *v20 = 0;
    goto LABEL_25;
  }
  v18[4] = v18 + 1;
  (*(void (**)(_QWORD *))(v49[0] + 24))(v49);
LABEL_25:
  v52 = v19;
  (**(void (***)(DeviceLibraryView *, uint64_t *, uint64_t *, _BYTE *))v7)(v7, &v43, &v41, v51);
  v21 = v52;
  if (v52 == v51)
  {
    v22 = 4;
    v21 = v51;
  }
  else
  {
    if (!v52)
      goto LABEL_30;
    v22 = 5;
  }
  (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_30:
  v23 = v50;
  if (v50 == v49)
  {
    v24 = 4;
    v23 = v49;
    goto LABEL_34;
  }
  if (v50)
  {
    v24 = 5;
LABEL_34:
    (*(void (**)(void))(*v23 + 8 * v24))();
  }
  v25 = v42;
  if (v42)
  {
    v26 = (unint64_t *)&v42->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  v28 = v44;
  if (v44)
  {
    v29 = (unint64_t *)&v44->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  v31 = v48;
  if (v48 == v47)
  {
    v32 = 4;
    v31 = v47;
    goto LABEL_49;
  }
  if (v48)
  {
    v32 = 5;
LABEL_49:
    (*(void (**)(void))(*v31 + 8 * v32))();
  }
  if (v40)
  {
    v33 = (unint64_t *)&v40->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }
  v35 = v46;
  if (v46 == v45)
  {
    v36 = 4;
    v35 = v45;
    goto LABEL_59;
  }
  if (v46)
  {
    v36 = 5;
LABEL_59:
    (*(void (**)(void))(*v35 + 8 * v36))();
  }
  if (v39)
  {
    v37 = (unint64_t *)&v39->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }

}

- (uint64_t)performCoreSearchQuery:withCompletion:
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"Z60-[MPMediaLibraryView performCoreSearchQuery:withCompletion:]E3$_1"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)performCoreSearchQuery:withCompletion:
{
}

- (_QWORD)performCoreSearchQuery:withCompletion:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_1E3149DC0;
  v2[1] = MEMORY[0x19403A810](*(_QWORD *)(a1 + 8));
  return v2;
}

- (_QWORD)performCoreQuery:withCompletion:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_1E3149D68;
  v2[1] = MEMORY[0x19403A810](*(_QWORD *)(a1 + 8));
  return v2;
}

@end
