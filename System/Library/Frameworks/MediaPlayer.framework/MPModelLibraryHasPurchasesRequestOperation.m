@implementation MPModelLibraryHasPurchasesRequestOperation

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  MPMediaLibraryView *v6;
  void *v7;
  void *v8;
  MPMediaLibraryView *v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t *p_shared_owners;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  _OWORD *v22;
  char v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  uint64_t i;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  unint64_t *v36;
  unint64_t v37;
  uint64_t *v38;
  unint64_t v39;
  uint64_t *v40;
  MPMediaLibraryEntityTranslationContext *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t *v50;
  unint64_t v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  uint64_t *v56;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  __int128 v64;
  _QWORD v65[5];
  uint64_t v66;
  std::__shared_weak_count *v67;
  uint64_t v68;
  std::__shared_weak_count *v69;
  _OWORD *v70;
  _OWORD *v71;
  _OWORD *v72;
  std::__shared_weak_count *v73;
  uint64_t v74;
  std::__shared_weak_count *v75;
  uint64_t v76;
  std::__shared_weak_count *v77;
  uint64_t v78;
  std::__shared_weak_count *v79;
  uint64_t v80;
  std::__shared_weak_count *v81;
  uint64_t v82;
  std::__shared_weak_count *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  -[MPModelLibraryHasPurchasesRequestOperation request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[MPModelLibraryHasPurchasesRequestOperation responseHandler](self, "responseHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, 0);

    goto LABEL_80;
  }
  v6 = [MPMediaLibraryView alloc];
  -[MPModelLibraryHasPurchasesRequestOperation request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MPMediaLibraryView initWithLibrary:filteringOptions:](v6, "initWithLibrary:filteringOptions:", v8, 8);

  v10 = objc_msgSend(v5, "entityClass");
  (*(void (**)(uint64_t))(*(_QWORD *)v10 + 112))(v10);
  if (v9)
  {
    -[MPMediaLibraryView mlCoreView](v9, "mlCoreView");
  }
  else
  {
    v80 = 0;
    v81 = 0;
  }
  objc_msgSend(v5, "entityClass");
  mlcore::LibraryView::filterPredicateForEntityClass();
  if (v81)
  {
    p_shared_owners = &v81->__shared_owners_;
    do
      v13 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v13 - 1, (unint64_t *)p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
      std::__shared_weak_count::__release_weak(v81);
    }
  }
  -[MPModelLibraryHasPurchasesRequestOperation request](self, "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "modelObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "library");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v17, "persistentID");
  std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator &,long long const&,mlcore::ComparisonOptions &,void>(&v76);

  if (v78)
  {
    if (v9)
    {
      -[MPMediaLibraryView mlCoreView](v9, "mlCoreView");
    }
    else
    {
      v74 = 0;
      v75 = 0;
    }
    objc_msgSend(v5, "entityClass");
    v80 = v78;
    v81 = v79;
    if (v79)
    {
      v18 = (unint64_t *)&v79->__shared_owners_;
      do
        v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }
    v82 = v76;
    v83 = v77;
    if (v77)
    {
      v20 = (unint64_t *)&v77->__shared_owners_;
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    v70 = 0;
    v71 = 0;
    v72 = 0;
    *(_QWORD *)&v64 = &v70;
    BYTE8(v64) = 0;
    v22 = operator new(0x20uLL);
    v23 = 0;
    v24 = 0;
    v70 = v22;
    v71 = v22;
    v72 = v22 + 2;
    do
    {
      v25 = v23;
      v26 = *((_OWORD *)&v80 + v24);
      *v22 = v26;
      if (*((_QWORD *)&v26 + 1))
      {
        v27 = (unint64_t *)(*((_QWORD *)&v26 + 1) + 8);
        do
          v28 = __ldxr(v27);
        while (__stxr(v28 + 1, v27));
      }
      ++v22;
      v23 = 1;
      v24 = 1;
    }
    while ((v25 & 1) == 0);
    v71 = v22;
    mlcore::CreateAndPredicate();
    mlcore::LibraryView::setFilterPredicateForEntityClass();
    v29 = v73;
    if (v73)
    {
      v30 = (unint64_t *)&v73->__shared_owners_;
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }
    *(_QWORD *)&v64 = &v70;
    std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v64);
    for (i = 16; i != -16; i -= 16)
      std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v80 + i);
    v33 = v75;
    if (!v75)
      goto LABEL_53;
    v34 = (unint64_t *)&v75->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
  }
  else
  {
    if (v9)
    {
      -[MPMediaLibraryView mlCoreView](v9, "mlCoreView");
    }
    else
    {
      v80 = 0;
      v81 = 0;
    }
    objc_msgSend(v5, "entityClass");
    v68 = v76;
    v69 = v77;
    if (v77)
    {
      v36 = (unint64_t *)&v77->__shared_owners_;
      do
        v37 = __ldxr(v36);
      while (__stxr(v37 + 1, v36));
    }
    mlcore::LibraryView::setFilterPredicateForEntityClass();
    if (v69)
    {
      v38 = &v69->__shared_owners_;
      do
        v39 = __ldaxr((unint64_t *)v38);
      while (__stlxr(v39 - 1, (unint64_t *)v38));
      if (!v39)
      {
        ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
        std::__shared_weak_count::__release_weak(v69);
      }
    }
    v33 = v81;
    if (!v81)
      goto LABEL_53;
    v40 = &v81->__shared_owners_;
    do
      v35 = __ldaxr((unint64_t *)v40);
    while (__stlxr(v35 - 1, (unint64_t *)v40));
  }
  if (!v35)
  {
    ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
    std::__shared_weak_count::__release_weak(v33);
  }
LABEL_53:
  v41 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
  -[MPModelLibraryHasPurchasesRequestOperation request](self, "request");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "mediaLibrary");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryEntityTranslationContext setMediaLibrary:](v41, "setMediaLibrary:", v43);

  -[MPModelLibraryHasPurchasesRequestOperation request](self, "request");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "itemKind");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryEntityTranslationContext setModelKind:](v41, "setModelKind:", v45);

  -[MPModelLibraryHasPurchasesRequestOperation request](self, "request");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "modelObject");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_opt_class());
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    objc_msgSend(v48, "entityQueryForPropertySet:sortDescriptors:context:view:", v49, 0, v41, v9);
  }
  else
  {
    v80 = 0;
    v81 = 0;
  }

  v64 = xmmword_193F0CA70;
  mlcore::RangeQuery::setRange();
  v66 = v80;
  v67 = v81;
  if (v81)
  {
    v50 = &v81->__shared_owners_;
    do
      v51 = __ldxr((unint64_t *)v50);
    while (__stxr(v51 + 1, (unint64_t *)v50));
  }
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __53__MPModelLibraryHasPurchasesRequestOperation_execute__block_invoke;
  v65[3] = &unk_1E315CB10;
  v65[4] = self;
  -[MPMediaLibraryView performCoreQuery:withCompletion:](v9, "performCoreQuery:withCompletion:", &v66, v65);
  v52 = v67;
  if (v67)
  {
    v53 = (unint64_t *)&v67->__shared_owners_;
    do
      v54 = __ldaxr(v53);
    while (__stlxr(v54 - 1, v53));
    if (!v54)
    {
      ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
      std::__shared_weak_count::__release_weak(v52);
    }
  }
  v55 = v81;
  if (v81)
  {
    v56 = &v81->__shared_owners_;
    do
      v57 = __ldaxr((unint64_t *)v56);
    while (__stlxr(v57 - 1, (unint64_t *)v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }

  v58 = v77;
  if (v77)
  {
    v59 = (unint64_t *)&v77->__shared_owners_;
    do
      v60 = __ldaxr(v59);
    while (__stlxr(v60 - 1, v59));
    if (!v60)
    {
      ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
      std::__shared_weak_count::__release_weak(v58);
    }
  }
  v61 = v79;
  if (v79)
  {
    v62 = (unint64_t *)&v79->__shared_owners_;
    do
      v63 = __ldaxr(v62);
    while (__stlxr(v63 - 1, v62));
    if (!v63)
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }

LABEL_80:
}

- (MPModelLibraryHasPurchasesRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __53__MPModelLibraryHasPurchasesRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  mlcore::EntityQueryResult *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  unint64_t *v11;
  unint64_t v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  id v14;

  v14 = a3;
  v5 = *(mlcore::EntityQueryResult **)a2;
  if (*(_QWORD *)a2)
  {
    v6 = *(std::__shared_weak_count **)(a2 + 8);
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v9 = mlcore::EntityQueryResult::entityCount(v5);
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, BOOL, _QWORD))v10)[2](v10, v9 != 0, 0);

    if (v6)
    {
      v11 = (unint64_t *)&v6->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v13)[2](v13, 0, v14);

  }
}

@end
