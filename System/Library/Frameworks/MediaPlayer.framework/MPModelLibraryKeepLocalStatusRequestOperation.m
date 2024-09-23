@implementation MPModelLibraryKeepLocalStatusRequestOperation

- (void)execute
{
  MPMediaLibraryView *libraryView;
  void *v5;
  void *v6;
  EntityQuery *ptr;
  uint64_t v8;
  uint64_t *p_shared_owners;
  unint64_t v10;
  void (**v11)(_QWORD, _QWORD);
  NSNumber *redownloadableItemCount;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  void (**v19)(_QWORD, _QWORD);
  NSNumber *v20;
  uint64_t v21;
  MPMediaLibraryView *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  void *v31;
  id responseHandler;
  MPMediaLibraryView *v33;
  uint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  uint64_t *v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  _QWORD v47[4];
  void (**v48)(_QWORD, _QWORD);
  uint64_t v49;
  std::__shared_weak_count *v50;
  _QWORD v51[5];
  id v52;
  _QWORD v53[4];
  void (**v54)(_QWORD, _QWORD);
  uint64_t v55;
  std::__shared_weak_count *v56;
  _QWORD v57[5];
  id v58;
  uint64_t v59;
  std::__shared_weak_count *v60;

  libraryView = self->_libraryView;
  if (!libraryView)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryKeepLocalStatusRequestOperation.mm"), 30, CFSTR("Library view must not be nil."));

    libraryView = self->_libraryView;
  }
  -[MPMediaLibraryView library](libraryView, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  ptr = self->_downloadableItemsQuery.__ptr_;
  if (ptr)
  {
    mlcore::Query::predicate((mlcore::Query *)ptr);
    v8 = MEMORY[0x1E0C809B0];
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3321888768;
    v57[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke;
    v57[3] = &unk_1E314AF98;
    v59 = v43;
    v60 = v44;
    if (v44)
    {
      p_shared_owners = &v44->__shared_owners_;
      do
        v10 = __ldxr((unint64_t *)p_shared_owners);
      while (__stxr(v10 + 1, (unint64_t *)p_shared_owners));
    }
    v57[4] = self;
    v58 = v6;
    v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v57);
    redownloadableItemCount = self->_redownloadableItemCount;
    if (redownloadableItemCount)
    {
      v11[2](v11, -[NSNumber longValue](redownloadableItemCount, "longValue"));
    }
    else
    {
      v21 = MEMORY[0x194039EC8]();
      std::allocate_shared[abi:ne180100]<mlcore::AggregateFunctionQuery,std::allocator<mlcore::AggregateFunctionQuery>,mlcore::EntityClass *,mlcore::AggregateFunctionQuery::AggregateFunction,decltype(nullptr),std::shared_ptr<mlcore::Predicate> &,void>(&v45, v21, 0, v43, v44);
      v22 = self->_libraryView;
      v55 = v45;
      v56 = v46;
      if (v46)
      {
        v23 = (unint64_t *)&v46->__shared_owners_;
        do
          v24 = __ldxr(v23);
        while (__stxr(v24 + 1, v23));
      }
      v53[0] = v8;
      v53[1] = 3221225472;
      v53[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_10;
      v53[3] = &unk_1E3155DF8;
      v54 = v11;
      -[MPMediaLibraryView performCoreQuery:withCompletion:](v22, "performCoreQuery:withCompletion:", &v55, v53);
      v25 = v56;
      if (v56)
      {
        v26 = (unint64_t *)&v56->__shared_owners_;
        do
          v27 = __ldaxr(v26);
        while (__stlxr(v27 - 1, v26));
        if (!v27)
        {
          ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
          std::__shared_weak_count::__release_weak(v25);
        }
      }

      v28 = v46;
      if (v46)
      {
        v29 = (unint64_t *)&v46->__shared_owners_;
        do
          v30 = __ldaxr(v29);
        while (__stlxr(v30 - 1, v29));
        if (!v30)
        {
          ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
          std::__shared_weak_count::__release_weak(v28);
        }
      }
    }

    v13 = v60;
    if (v60)
    {
      v14 = (unint64_t *)&v60->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    if (v44)
    {
      v16 = &v44->__shared_owners_;
      do
        v17 = __ldaxr((unint64_t *)v16);
      while (__stlxr(v17 - 1, (unint64_t *)v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
        std::__shared_weak_count::__release_weak(v44);
      }
    }
  }
  else if (self->_downloadablePlaylistItemEntityQueryBlock)
  {
    v18 = MEMORY[0x1E0C809B0];
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_2_11;
    v51[3] = &unk_1E3155E90;
    v51[4] = self;
    v52 = v6;
    v19 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v51);
    v20 = self->_redownloadableItemCount;
    if (v20)
    {
      v19[2](v19, -[NSNumber longValue](v20, "longValue"));
    }
    else
    {
      (*((void (**)(uint64_t *__return_ptr))self->_downloadablePlaylistItemEntityQueryBlock + 2))(&v43);
      v33 = self->_libraryView;
      v49 = v43;
      v50 = v44;
      if (v44)
      {
        v34 = &v44->__shared_owners_;
        do
          v35 = __ldxr((unint64_t *)v34);
        while (__stxr(v35 + 1, (unint64_t *)v34));
      }
      v47[0] = v18;
      v47[1] = 3221225472;
      v47[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_9;
      v47[3] = &unk_1E3155DF8;
      v48 = v19;
      -[MPMediaLibraryView performCoreQuery:withCompletion:](v33, "performCoreQuery:withCompletion:", &v49, v47);
      v36 = v50;
      if (v50)
      {
        v37 = (unint64_t *)&v50->__shared_owners_;
        do
          v38 = __ldaxr(v37);
        while (__stlxr(v38 - 1, v37));
        if (!v38)
        {
          ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
          std::__shared_weak_count::__release_weak(v36);
        }
      }

      v39 = v44;
      if (v44)
      {
        v40 = &v44->__shared_owners_;
        do
          v41 = __ldaxr((unint64_t *)v40);
        while (__stlxr(v41 - 1, (unint64_t *)v40));
        if (!v41)
        {
          ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
          std::__shared_weak_count::__release_weak(v39);
        }
      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryKeepLocalStatusRequestOperation.mm"), 293, CFSTR("Invalid creation options for MPModelLibraryKeepLocalStatusRequestOperation. downloadableItemsQuery or downloadablePlaylistItemEntityQueryBlock  must be specified"));

    responseHandler = self->_responseHandler;
    if (responseHandler)
      (*((void (**)(id, _QWORD, _QWORD))responseHandler + 2))(responseHandler, 0, 0);
    -[MPAsyncOperation finishWithError:](self, "finishWithError:", 0);
  }

}

- (shared_ptr<mlcore::EntityQuery>)downloadableItemsQuery
{
  EntityQuery **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<mlcore::EntityQuery> result;

  cntrl = self->_downloadableItemsQuery.__cntrl_;
  *v2 = self->_downloadableItemsQuery.__ptr_;
  v2[1] = (EntityQuery *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (EntityQuery *)self;
  return result;
}

- (void)setDownloadableItemsQuery:(shared_ptr<mlcore::EntityQuery>)a3
{
  std::shared_ptr<mlcore::QueryResult>::operator=[abi:ne180100](&self->_downloadableItemsQuery.__ptr_, *(_QWORD *)a3.__ptr_, *((_QWORD *)a3.__ptr_ + 1));
}

- (id)downloadablePlaylistItemEntityQueryBlock
{
  return self->_downloadablePlaylistItemEntityQueryBlock;
}

- (void)setDownloadablePlaylistItemEntityQueryBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (int64_t)enableState
{
  return self->_enableState;
}

- (void)setEnableState:(int64_t)a3
{
  self->_enableState = a3;
}

- (MPModelObject)identifyingModelObject
{
  return self->_identifyingModelObject;
}

- (void)setIdentifyingModelObject:(id)a3
{
  objc_storeStrong((id *)&self->_identifyingModelObject, a3);
}

- (MPMediaLibraryView)libraryView
{
  return self->_libraryView;
}

- (void)setLibraryView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSNumber)redownloadableItemCount
{
  return self->_redownloadableItemCount;
}

- (void)setRedownloadableItemCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&self->_downloadableItemsQuery);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_redownloadableItemCount, 0);
  objc_storeStrong((id *)&self->_libraryView, 0);
  objc_storeStrong((id *)&self->_identifyingModelObject, 0);
  objc_storeStrong(&self->_downloadablePlaylistItemEntityQueryBlock, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 40) = 0;
  *((_QWORD *)self + 41) = 0;
  return self;
}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  mlcore *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  mlcore *v16;
  mlcore *v17;
  mlcore *v18;
  mlcore *HasNonPurgeableAsset;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  mlcore *v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *p_shared_owners;
  unint64_t v38;
  mlcore *v39;
  _OWORD *v40;
  char v41;
  uint64_t v42;
  char v43;
  __int128 v44;
  unint64_t *v45;
  unint64_t v46;
  _OWORD *v47;
  char v48;
  uint64_t v49;
  char v50;
  __int128 v51;
  unint64_t *v52;
  unint64_t v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  uint64_t i;
  uint64_t j;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  void *v65;
  unint64_t *v66;
  unint64_t v67;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  std::__shared_weak_count *v71;
  unint64_t *v72;
  unint64_t v73;
  std::__shared_weak_count *v74;
  unint64_t *v75;
  unint64_t v76;
  unint64_t *v77;
  MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *v78;
  _QWORD v79[6];
  std::__shared_weak_count *v80;
  unint64_t v81;
  uint64_t v82;
  std::__shared_weak_count *v83;
  __int128 v84;
  int v85;
  __int128 v86;
  _OWORD *v87;
  _OWORD *v88;
  _OWORD *v89;
  _OWORD *v90;
  _OWORD *v91;
  _OWORD *v92;
  __int128 v93;
  uint64_t v94;
  std::__shared_weak_count *v95;
  _QWORD v96[4];
  id v97;
  uint64_t v98;
  unint64_t v99;
  _QWORD *v100;
  std::__shared_weak_count *v101;
  void *v102;
  void *v103;
  _QWORD *v104;
  void **v105;
  std::__shared_weak_count *v106;
  _QWORD *v107;
  std::__shared_weak_count *v108;
  _OWORD v109[2];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (a2 > 0x96)
    {
      v34 = (mlcore *)MEMORY[0x194039EC8]();
      v35 = (uint64_t)v34;
      v36 = *(std::__shared_weak_count **)(a1 + 56);
      v107 = *(_QWORD **)(a1 + 48);
      v108 = v36;
      if (v36)
      {
        p_shared_owners = (unint64_t *)&v36->__shared_owners_;
        do
          v38 = __ldxr(p_shared_owners);
        while (__stxr(v38 + 1, p_shared_owners));
      }
      mlcore::ItemPropertyKeepLocalStatus(v34);
      v85 = 0;
      v39 = (mlcore *)std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<int>,std::allocator<mlcore::ComparisonPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::ComparisonOperator &,int const&,mlcore::ComparisonOptions &,void>((uint64_t *)&v86);
      v109[0] = v86;
      v86 = 0uLL;
      mlcore::ItemPropertyHasNonPurgeableAsset(v39);
      std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v84);
      v109[1] = v84;
      v84 = 0uLL;
      v88 = 0;
      v89 = 0;
      v87 = 0;
      v105 = (void **)&v87;
      LOBYTE(v106) = 0;
      v40 = operator new(0x20uLL);
      v41 = 0;
      v42 = 0;
      v87 = v40;
      v88 = v40;
      v89 = v40 + 2;
      do
      {
        v43 = v41;
        v44 = v109[v42];
        *v40 = v44;
        if (*((_QWORD *)&v44 + 1))
        {
          v45 = (unint64_t *)(*((_QWORD *)&v44 + 1) + 8);
          do
            v46 = __ldxr(v45);
          while (__stxr(v46 + 1, v45));
        }
        ++v40;
        v41 = 1;
        v42 = 1;
      }
      while ((v43 & 1) == 0);
      v88 = v40;
      mlcore::CreateOrPredicate();
      v90 = 0;
      v91 = 0;
      v92 = 0;
      v105 = (void **)&v90;
      LOBYTE(v106) = 0;
      v47 = operator new(0x20uLL);
      v48 = 0;
      v49 = 0;
      v90 = v47;
      v91 = v47;
      v92 = v47 + 2;
      do
      {
        v50 = v48;
        v51 = *(_OWORD *)&(&v107)[2 * v49];
        *v47 = v51;
        if (*((_QWORD *)&v51 + 1))
        {
          v52 = (unint64_t *)(*((_QWORD *)&v51 + 1) + 8);
          do
            v53 = __ldxr(v52);
          while (__stxr(v53 + 1, v52));
        }
        ++v47;
        v48 = 1;
        v49 = 1;
      }
      while ((v50 & 1) == 0);
      v91 = v47;
      mlcore::CreateAndPredicate();
      std::allocate_shared[abi:ne180100]<mlcore::AggregateFunctionQuery,std::allocator<mlcore::AggregateFunctionQuery>,mlcore::EntityClass *,mlcore::AggregateFunctionQuery::AggregateFunction,decltype(nullptr),std::shared_ptr<mlcore::Predicate>,void>(&v94, v35, 0, &v93);
      v54 = (std::__shared_weak_count *)*((_QWORD *)&v93 + 1);
      if (*((_QWORD *)&v93 + 1))
      {
        v55 = (unint64_t *)(*((_QWORD *)&v93 + 1) + 8);
        do
          v56 = __ldaxr(v55);
        while (__stlxr(v56 - 1, v55));
        if (!v56)
        {
          ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
          std::__shared_weak_count::__release_weak(v54);
        }
      }
      v105 = (void **)&v90;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v105);
      for (i = 2; i != -2; i -= 2)
        std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&(&v107)[i]);
      v105 = (void **)&v87;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v105);
      for (j = 1; j != -1; --j)
        std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v109[j]);
      v59 = (std::__shared_weak_count *)*((_QWORD *)&v84 + 1);
      if (*((_QWORD *)&v84 + 1))
      {
        v60 = (unint64_t *)(*((_QWORD *)&v84 + 1) + 8);
        do
          v61 = __ldaxr(v60);
        while (__stlxr(v61 - 1, v60));
        if (!v61)
        {
          ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
          std::__shared_weak_count::__release_weak(v59);
        }
      }
      v62 = (std::__shared_weak_count *)*((_QWORD *)&v86 + 1);
      if (*((_QWORD *)&v86 + 1))
      {
        v63 = (unint64_t *)(*((_QWORD *)&v86 + 1) + 8);
        do
          v64 = __ldaxr(v63);
        while (__stlxr(v64 - 1, v63));
        if (!v64)
        {
          ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
          std::__shared_weak_count::__release_weak(v62);
        }
      }
      v65 = *(void **)(*(_QWORD *)(a1 + 32) + 296);
      v82 = v94;
      v83 = v95;
      if (v95)
      {
        v66 = (unint64_t *)&v95->__shared_owners_;
        do
          v67 = __ldxr(v66);
        while (__stxr(v67 + 1, v66));
      }
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3321888768;
      v79[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_3;
      v79[3] = &unk_1E314AF60;
      v68 = *(std::__shared_weak_count **)(a1 + 56);
      v79[5] = *(_QWORD *)(a1 + 48);
      v80 = v68;
      if (v68)
      {
        v69 = (unint64_t *)&v68->__shared_owners_;
        do
          v70 = __ldxr(v69);
        while (__stxr(v70 + 1, v69));
      }
      v79[4] = *(_QWORD *)(a1 + 32);
      v81 = a2;
      objc_msgSend(v65, "performCoreQuery:withCompletion:", &v82, v79);
      v71 = v83;
      if (v83)
      {
        v72 = (unint64_t *)&v83->__shared_owners_;
        do
          v73 = __ldaxr(v72);
        while (__stlxr(v73 - 1, v72));
        if (!v73)
        {
          ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
          std::__shared_weak_count::__release_weak(v71);
        }
      }
      v74 = v80;
      if (v80)
      {
        v75 = (unint64_t *)&v80->__shared_owners_;
        do
          v76 = __ldaxr(v75);
        while (__stlxr(v76 - 1, v75));
        if (!v76)
        {
          ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
          std::__shared_weak_count::__release_weak(v74);
        }
      }
      v29 = v95;
      if (v95)
      {
        v77 = (unint64_t *)&v95->__shared_owners_;
        do
          v31 = __ldaxr(v77);
        while (__stlxr(v31 - 1, v77));
        goto LABEL_78;
      }
    }
    else
    {
      v4 = MEMORY[0x194039EC8]();
      v5 = (std::__shared_weak_count *)operator new(0x80uLL);
      v6 = v5;
      v5->__shared_owners_ = 0;
      v7 = (unint64_t *)&v5->__shared_owners_;
      v5->__shared_weak_owners_ = 0;
      v5->__vftable = (std::__shared_weak_count_vtbl *)&off_1E314A800;
      v8 = &v5[1].__vftable;
      v9 = *(std::__shared_weak_count **)(a1 + 56);
      v105 = *(void ***)(a1 + 48);
      v106 = v9;
      if (v9)
      {
        v10 = (unint64_t *)&v9->__shared_owners_;
        do
          v11 = __ldxr(v10);
        while (__stxr(v11 + 1, v10));
      }
      v12 = (mlcore *)MEMORY[0x194038F80](&v5[1], v4, &v105);
      v13 = v106;
      if (v106)
      {
        v14 = (unint64_t *)&v106->__shared_owners_;
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
      v107 = v8;
      v108 = v6;
      v16 = (mlcore *)mlcore::ItemPropertyPersistentID(v12);
      v17 = (mlcore *)mlcore::ItemPropertyStoreID(v16);
      v18 = (mlcore *)mlcore::ItemPropertySubscriptionStoreItemID(v17);
      HasNonPurgeableAsset = (mlcore *)mlcore::ItemPropertyHasNonPurgeableAsset(v18);
      v20 = mlcore::ItemPropertyKeepLocalStatus(HasNonPurgeableAsset);
      v21 = operator new(0x28uLL);
      v103 = v21 + 5;
      v104 = v21 + 5;
      *v21 = v16;
      v21[1] = v17;
      v21[2] = v18;
      v21[3] = HasNonPurgeableAsset;
      v21[4] = v20;
      v102 = v21;
      mlcore::PropertiesQuery::setPropertiesToFetch();
      if (v102)
      {
        v103 = v102;
        operator delete(v102);
      }
      v22 = *(void **)(*(_QWORD *)(a1 + 32) + 296);
      v100 = v8;
      v101 = v6;
      do
        v23 = __ldxr(v7);
      while (__stxr(v23 + 1, v7));
      v96[0] = MEMORY[0x1E0C809B0];
      v96[1] = 3221225472;
      v96[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_2;
      v96[3] = &unk_1E3155DA8;
      v24 = *(id *)(a1 + 40);
      v25 = *(_QWORD *)(a1 + 32);
      v97 = v24;
      v98 = v25;
      v99 = a2;
      objc_msgSend(v22, "performCoreQuery:withCompletion:", &v100, v96);
      v26 = v101;
      if (v101)
      {
        v27 = (unint64_t *)&v101->__shared_owners_;
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }

      v29 = v108;
      if (v108)
      {
        v30 = (unint64_t *)&v108->__shared_owners_;
        do
          v31 = __ldaxr(v30);
        while (__stlxr(v31 - 1, v30));
LABEL_78:
        if (!v31)
        {
          ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
          std::__shared_weak_count::__release_weak(v29);
        }
      }
    }
  }
  else
  {
    v78 = objc_alloc_init(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration);
    -[MPLibraryKeepLocalStatusObserverConfiguration setEnableState:](v78, "setEnableState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280));
    -[MPLibraryKeepLocalStatusObserverConfiguration setIdentifyingModelObject:](v78, "setIdentifyingModelObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288));
    v32 = *(_QWORD **)(a1 + 32);
    v33 = v32[39];
    if (v33)
    {
      (*(void (**)(_QWORD, MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *, _QWORD))(v33 + 16))(v32[39], v78, 0);
      v32 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v32, "finish");

  }
}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  mlcore::AggregateFunctionQueryResult *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  id v11;

  v11 = a3;
  v5 = *(mlcore::AggregateFunctionQueryResult **)a2;
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
    mlcore::AggregateFunctionQueryResult::value(v5);
    if (v6)
    {
      v9 = (unint64_t *)&v6->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_2_11(uint64_t a1, unint64_t a2)
{
  mlcore *v4;
  mlcore *v5;
  ModelPropertyBase *v6;
  mlcore *Property;
  mlcore *v8;
  ModelPropertyBase *v9;
  mlcore *v10;
  mlcore *v11;
  ModelPropertyBase *v12;
  mlcore *v13;
  mlcore *v14;
  ModelPropertyBase *v15;
  mlcore *v16;
  mlcore *v17;
  ModelPropertyBase *v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  unint64_t *v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  mlcore *v34;
  mlcore *v35;
  ModelPropertyBase *v36;
  mlcore *v37;
  mlcore *v38;
  ModelPropertyBase *HasNonPurgeableAsset;
  _OWORD *v40;
  char v41;
  uint64_t v42;
  char v43;
  __int128 v44;
  unint64_t *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  _QWORD *v55;
  _QWORD *v56;
  char *v57;
  __int128 v58;
  int64x2_t v59;
  _OWORD *v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  uint64_t i;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  unint64_t *v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  unint64_t *v83;
  unint64_t v84;
  _QWORD *v85;
  _QWORD *v86;
  char *v87;
  __int128 v88;
  int64x2_t v89;
  uint64_t v90;
  uint64_t v91;
  std::__shared_weak_count *v92;
  unint64_t *p_shared_owners;
  unint64_t v94;
  std::__shared_weak_count *v95;
  unint64_t *v96;
  unint64_t v97;
  unint64_t *v98;
  unint64_t v99;
  void *v100;
  unint64_t *v101;
  unint64_t v102;
  unint64_t *v103;
  unint64_t v104;
  std::__shared_weak_count *v105;
  unint64_t *v106;
  unint64_t v107;
  std::__shared_weak_count *v108;
  unint64_t *v109;
  unint64_t v110;
  std::__shared_weak_count *v111;
  unint64_t *v112;
  unint64_t v113;
  unint64_t *v114;
  MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *v115;
  _QWORD v116[5];
  __int128 v117;
  unint64_t v118;
  mlcore::Query *v119;
  std::__shared_weak_count *v120;
  _QWORD v121[4];
  std::__shared_weak_count *v122;
  __int128 v123;
  int v124;
  __int128 v125;
  _OWORD *v126;
  _OWORD *v127;
  _OWORD *v128;
  __int128 v129;
  int64x2_t v130;
  _QWORD v131[2];
  __int128 v132;
  mlcore::Query *v133;
  std::__shared_weak_count *v134;
  _QWORD v135[4];
  id v136;
  uint64_t v137;
  mlcore *v138;
  uint64_t v139;
  mlcore *v140;
  mlcore *v141;
  mlcore *v142;
  unint64_t v143;
  __int128 v144;
  void *v145;
  void *v146;
  _QWORD *v147;
  void **v148;
  int64x2_t v149;
  uint64_t v150;
  _QWORD *v151;
  _OWORD v152[3];
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (a2 > 0x96)
    {
      (*(void (**)(mlcore::Query **__return_ptr))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) + 16))(&v133);
      v34 = (mlcore *)mlcore::Query::predicate(v133);
      v130 = 0uLL;
      v131[0] = 0;
      v35 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(v34);
      v36 = (ModelPropertyBase *)mlcore::ItemPropertyKeepLocalStatus(v35);
      MPMediaLibraryGetProperty((ModelPropertyBase *)v35, v36);
      v124 = 0;
      v37 = (mlcore *)std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<int>,std::allocator<mlcore::ComparisonPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::ComparisonOperator &,int const&,mlcore::ComparisonOptions &,void>((uint64_t *)&v125);
      v152[0] = v125;
      v125 = 0uLL;
      v38 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(v37);
      HasNonPurgeableAsset = (ModelPropertyBase *)mlcore::ItemPropertyHasNonPurgeableAsset(v38);
      MPMediaLibraryGetProperty((ModelPropertyBase *)v38, HasNonPurgeableAsset);
      std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v123);
      v152[1] = v123;
      v123 = 0uLL;
      v127 = 0;
      v128 = 0;
      v126 = 0;
      v148 = (void **)&v126;
      v149.i8[0] = 0;
      v40 = operator new(0x20uLL);
      v41 = 0;
      v42 = 0;
      v126 = v40;
      v127 = v40;
      v128 = v40 + 2;
      do
      {
        v43 = v41;
        v44 = v152[v42];
        *v40 = v44;
        if (*((_QWORD *)&v44 + 1))
        {
          v45 = (unint64_t *)(*((_QWORD *)&v44 + 1) + 8);
          do
            v46 = __ldxr(v45);
          while (__stxr(v46 + 1, v45));
        }
        ++v40;
        v41 = 1;
        v42 = 1;
      }
      while ((v43 & 1) == 0);
      v127 = v40;
      mlcore::CreateOrPredicate();
      v47 = v130.i64[1];
      if (v130.i64[1] >= v131[0])
      {
        v48 = (v130.i64[1] - v130.i64[0]) >> 4;
        v49 = v48 + 1;
        if ((unint64_t)(v48 + 1) >> 60)
          std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
        v50 = v131[0] - v130.i64[0];
        if ((v131[0] - v130.i64[0]) >> 3 > v49)
          v49 = v50 >> 3;
        if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF0)
          v51 = 0xFFFFFFFFFFFFFFFLL;
        else
          v51 = v49;
        v151 = v131;
        v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v51);
        v54 = &v52[16 * v48];
        *(_OWORD *)v54 = v129;
        v129 = 0uLL;
        v55 = (_QWORD *)v130.i64[1];
        v56 = (_QWORD *)v130.i64[0];
        if (v130.i64[1] == v130.i64[0])
        {
          v59 = vdupq_n_s64(v130.u64[1]);
          v57 = &v52[16 * v48];
        }
        else
        {
          v57 = &v52[16 * v48];
          do
          {
            v58 = *((_OWORD *)v55 - 1);
            v55 -= 2;
            *((_OWORD *)v57 - 1) = v58;
            v57 -= 16;
            *v55 = 0;
            v55[1] = 0;
          }
          while (v55 != v56);
          v59 = v130;
        }
        v60 = v54 + 16;
        v130.i64[0] = (uint64_t)v57;
        v130.i64[1] = (uint64_t)(v54 + 16);
        v149 = v59;
        v61 = v131[0];
        v131[0] = &v52[16 * v53];
        v150 = v61;
        v148 = (void **)v59.i64[0];
        std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v148);
        v62 = (std::__shared_weak_count *)*((_QWORD *)&v129 + 1);
        v130.i64[1] = (uint64_t)v60;
        if (*((_QWORD *)&v129 + 1))
        {
          v63 = (unint64_t *)(*((_QWORD *)&v129 + 1) + 8);
          do
            v64 = __ldaxr(v63);
          while (__stlxr(v64 - 1, v63));
          if (!v64)
          {
            ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
            std::__shared_weak_count::__release_weak(v62);
          }
        }
      }
      else
      {
        *(_OWORD *)v130.i64[1] = v129;
        v129 = 0uLL;
        v130.i64[1] = v47 + 16;
      }
      v148 = (void **)&v126;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v148);
      for (i = 1; i != -1; --i)
        std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v152[i]);
      v66 = (std::__shared_weak_count *)*((_QWORD *)&v123 + 1);
      if (*((_QWORD *)&v123 + 1))
      {
        v67 = (unint64_t *)(*((_QWORD *)&v123 + 1) + 8);
        do
          v68 = __ldaxr(v67);
        while (__stlxr(v68 - 1, v67));
        if (!v68)
        {
          ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
          std::__shared_weak_count::__release_weak(v66);
        }
      }
      v69 = (std::__shared_weak_count *)*((_QWORD *)&v125 + 1);
      if (*((_QWORD *)&v125 + 1))
      {
        v70 = (unint64_t *)(*((_QWORD *)&v125 + 1) + 8);
        do
          v71 = __ldaxr(v70);
        while (__stlxr(v71 - 1, v70));
        if (!v71)
        {
          ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
          std::__shared_weak_count::__release_weak(v69);
        }
      }
      v72 = (_QWORD *)v130.i64[1];
      if ((_QWORD)v132)
      {
        if (v130.i64[1] >= v131[0])
        {
          v76 = (v130.i64[1] - v130.i64[0]) >> 4;
          if ((unint64_t)(v76 + 1) >> 60)
            std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
          v77 = (v131[0] - v130.i64[0]) >> 3;
          if (v77 <= v76 + 1)
            v77 = v76 + 1;
          if (v131[0] - v130.i64[0] >= 0x7FFFFFFFFFFFFFF0uLL)
            v78 = 0xFFFFFFFFFFFFFFFLL;
          else
            v78 = v77;
          v151 = v131;
          v79 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v78);
          v81 = &v79[16 * v76];
          v82 = *((_QWORD *)&v132 + 1);
          *(_OWORD *)v81 = v132;
          if (v82)
          {
            v83 = (unint64_t *)(v82 + 8);
            do
              v84 = __ldxr(v83);
            while (__stxr(v84 + 1, v83));
          }
          v85 = (_QWORD *)v130.i64[1];
          v86 = (_QWORD *)v130.i64[0];
          if (v130.i64[1] == v130.i64[0])
          {
            v89 = vdupq_n_s64(v130.u64[1]);
            v87 = &v79[16 * v76];
          }
          else
          {
            v87 = &v79[16 * v76];
            do
            {
              v88 = *((_OWORD *)v85 - 1);
              v85 -= 2;
              *((_OWORD *)v87 - 1) = v88;
              v87 -= 16;
              *v85 = 0;
              v85[1] = 0;
            }
            while (v85 != v86);
            v89 = v130;
          }
          v72 = v81 + 16;
          v130.i64[0] = (uint64_t)v87;
          v130.i64[1] = (uint64_t)(v81 + 16);
          v149 = v89;
          v90 = v131[0];
          v131[0] = &v79[16 * v80];
          v150 = v90;
          v148 = (void **)v89.i64[0];
          std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v148);
        }
        else
        {
          *(_QWORD *)v130.i64[1] = v132;
          v73 = *((_QWORD *)&v132 + 1);
          v72[1] = *((_QWORD *)&v132 + 1);
          if (v73)
          {
            v74 = (unint64_t *)(v73 + 8);
            do
              v75 = __ldxr(v74);
            while (__stxr(v75 + 1, v74));
          }
          v72 += 2;
        }
        v130.i64[1] = (uint64_t)v72;
      }
      v91 = (uint64_t)v72 - v130.i64[0];
      if ((_QWORD *)((char *)v72 - v130.i64[0]) == (_QWORD *)16)
      {
        v92 = *(std::__shared_weak_count **)(v130.i64[0] + 8);
        v121[3] = *(_QWORD *)v130.i64[0];
        v122 = v92;
        if (v92)
        {
          p_shared_owners = (unint64_t *)&v92->__shared_owners_;
          do
            v94 = __ldxr(p_shared_owners);
          while (__stxr(v94 + 1, p_shared_owners));
        }
      }
      else
      {
        memset(v121, 0, 24);
        std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v121, v130.i64[0], v72, v91 >> 4);
        mlcore::CreateAndPredicate();
      }
      mlcore::Query::setPredicate();
      v95 = v122;
      if (v91 == 16)
      {
        if (v122)
        {
          v96 = (unint64_t *)&v122->__shared_owners_;
          do
            v97 = __ldaxr(v96);
          while (__stlxr(v97 - 1, v96));
          if (!v97)
          {
            ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
            std::__shared_weak_count::__release_weak(v95);
          }
        }
      }
      else
      {
        if (v122)
        {
          v98 = (unint64_t *)&v122->__shared_owners_;
          do
            v99 = __ldaxr(v98);
          while (__stlxr(v99 - 1, v98));
          if (!v99)
          {
            ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
            std::__shared_weak_count::__release_weak(v95);
          }
        }
        *(_QWORD *)&v152[0] = v121;
        std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)v152);
      }
      v100 = *(void **)(*(_QWORD *)(a1 + 32) + 296);
      v119 = v133;
      v120 = v134;
      if (v134)
      {
        v101 = (unint64_t *)&v134->__shared_owners_;
        do
          v102 = __ldxr(v101);
        while (__stxr(v102 + 1, v101));
      }
      v116[0] = MEMORY[0x1E0C809B0];
      v116[1] = 3321888768;
      v116[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_7;
      v116[3] = &unk_1E314AF60;
      v117 = v132;
      if (*((_QWORD *)&v132 + 1))
      {
        v103 = (unint64_t *)(*((_QWORD *)&v132 + 1) + 8);
        do
          v104 = __ldxr(v103);
        while (__stxr(v104 + 1, v103));
      }
      v116[4] = *(_QWORD *)(a1 + 32);
      v118 = a2;
      objc_msgSend(v100, "performCoreQuery:withCompletion:", &v119, v116);
      v105 = v120;
      if (v120)
      {
        v106 = (unint64_t *)&v120->__shared_owners_;
        do
          v107 = __ldaxr(v106);
        while (__stlxr(v107 - 1, v106));
        if (!v107)
        {
          ((void (*)(std::__shared_weak_count *))v105->__on_zero_shared)(v105);
          std::__shared_weak_count::__release_weak(v105);
        }
      }
      v108 = (std::__shared_weak_count *)*((_QWORD *)&v117 + 1);
      if (*((_QWORD *)&v117 + 1))
      {
        v109 = (unint64_t *)(*((_QWORD *)&v117 + 1) + 8);
        do
          v110 = __ldaxr(v109);
        while (__stlxr(v110 - 1, v109));
        if (!v110)
        {
          ((void (*)(std::__shared_weak_count *))v108->__on_zero_shared)(v108);
          std::__shared_weak_count::__release_weak(v108);
        }
      }
      *(_QWORD *)&v152[0] = &v130;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)v152);
      v111 = (std::__shared_weak_count *)*((_QWORD *)&v132 + 1);
      if (*((_QWORD *)&v132 + 1))
      {
        v112 = (unint64_t *)(*((_QWORD *)&v132 + 1) + 8);
        do
          v113 = __ldaxr(v112);
        while (__stlxr(v113 - 1, v112));
        if (!v113)
        {
          ((void (*)(std::__shared_weak_count *))v111->__on_zero_shared)(v111);
          std::__shared_weak_count::__release_weak(v111);
        }
      }
      v29 = v134;
      if (v134)
      {
        v114 = (unint64_t *)&v134->__shared_owners_;
        do
          v31 = __ldaxr(v114);
        while (__stlxr(v31 - 1, v114));
        goto LABEL_119;
      }
    }
    else
    {
      v4 = (mlcore *)(*(_QWORD *(**)(_OWORD *__return_ptr))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) + 16))(v152);
      v5 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(v4);
      v6 = (ModelPropertyBase *)mlcore::ItemPropertyPersistentID(v5);
      Property = (mlcore *)MPMediaLibraryGetProperty((ModelPropertyBase *)v5, v6);
      v8 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(Property);
      v9 = (ModelPropertyBase *)mlcore::ItemPropertyStoreID(v8);
      v10 = (mlcore *)MPMediaLibraryGetProperty((ModelPropertyBase *)v8, v9);
      v11 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(v10);
      v12 = (ModelPropertyBase *)mlcore::ItemPropertySubscriptionStoreItemID(v11);
      v13 = (mlcore *)MPMediaLibraryGetProperty((ModelPropertyBase *)v11, v12);
      v14 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(v13);
      v15 = (ModelPropertyBase *)mlcore::ItemPropertyHasNonPurgeableAsset(v14);
      v16 = (mlcore *)MPMediaLibraryGetProperty((ModelPropertyBase *)v14, v15);
      v17 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(v16);
      v18 = (ModelPropertyBase *)mlcore::ItemPropertyKeepLocalStatus(v17);
      v19 = MPMediaLibraryGetProperty((ModelPropertyBase *)v17, v18);
      v20 = operator new(0x28uLL);
      v146 = v20 + 5;
      v147 = v20 + 5;
      *v20 = Property;
      v20[1] = v10;
      v20[2] = v13;
      v20[3] = v16;
      v20[4] = v19;
      v145 = v20;
      mlcore::PropertiesQuery::setPropertiesToFetch();
      if (v145)
      {
        v146 = v145;
        operator delete(v145);
      }
      v21 = *(void **)(*(_QWORD *)(a1 + 32) + 296);
      v144 = v152[0];
      if (*((_QWORD *)&v152[0] + 1))
      {
        v22 = (unint64_t *)(*((_QWORD *)&v152[0] + 1) + 8);
        do
          v23 = __ldxr(v22);
        while (__stxr(v23 + 1, v22));
      }
      v135[0] = MEMORY[0x1E0C809B0];
      v135[1] = 3221225472;
      v135[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_3_12;
      v135[3] = &unk_1E3155E68;
      v138 = v16;
      v139 = v19;
      v24 = *(id *)(a1 + 40);
      v140 = Property;
      v141 = v10;
      v25 = *(_QWORD *)(a1 + 32);
      v136 = v24;
      v137 = v25;
      v142 = v13;
      v143 = a2;
      objc_msgSend(v21, "performCoreQuery:withCompletion:", &v144, v135);
      v26 = (std::__shared_weak_count *)*((_QWORD *)&v144 + 1);
      if (*((_QWORD *)&v144 + 1))
      {
        v27 = (unint64_t *)(*((_QWORD *)&v144 + 1) + 8);
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }

      v29 = (std::__shared_weak_count *)*((_QWORD *)&v152[0] + 1);
      if (*((_QWORD *)&v152[0] + 1))
      {
        v30 = (unint64_t *)(*((_QWORD *)&v152[0] + 1) + 8);
        do
          v31 = __ldaxr(v30);
        while (__stlxr(v31 - 1, v30));
LABEL_119:
        if (!v31)
        {
          ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
          std::__shared_weak_count::__release_weak(v29);
        }
      }
    }
  }
  else
  {
    v115 = objc_alloc_init(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration);
    -[MPLibraryKeepLocalStatusObserverConfiguration setEnableState:](v115, "setEnableState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280));
    -[MPLibraryKeepLocalStatusObserverConfiguration setIdentifyingModelObject:](v115, "setIdentifyingModelObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288));
    v32 = *(_QWORD **)(a1 + 32);
    v33 = v32[39];
    if (v33)
    {
      (*(void (**)(_QWORD, MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *, _QWORD))(v33 + 16))(v32[39], v115, 0);
      v32 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v32, "finish");

  }
}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  mlcore::EntityQueryResult *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  id v11;

  v11 = a3;
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
    mlcore::EntityQueryResult::entityCount(v5);
    if (v6)
    {
      v9 = (unint64_t *)&v6->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_3_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  mlcore::EntityQueryResult *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void **v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  int8x8_t *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  MPIdentifierSet *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  MPIdentifierSet *v28;
  id v29;
  unint64_t *v30;
  unint64_t v31;
  void *v32;
  MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *v33;
  _QWORD *v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  uint64_t v43;
  int8x8_t *v44;
  __int128 v45;
  void **v46;
  std::__shared_weak_count *v47;
  uint64_t v48;
  uint64_t v49;
  mlcore::EntityQueryResult *v50;
  std::__shared_weak_count *v51;

  v5 = a3;
  v50 = 0;
  v51 = 0;
  v6 = *(mlcore::EntityQueryResult **)a2;
  if (*(_QWORD *)a2)
  {
    v7 = *(std::__shared_weak_count **)(a2 + 8);
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    v39 = v5;
    v50 = v6;
    v51 = v7;
    mlcore::EntityQueryResult::allEntities(v6);
    v11 = v48;
    v10 = v49;
    if (v48 != v49)
    {
      v40 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = *(void ***)v11;
        v15 = *(std::__shared_weak_count **)(v11 + 8);
        v46 = *(void ***)v11;
        v47 = v15;
        if (v15)
        {
          v16 = (unint64_t *)&v15->__shared_owners_;
          do
            v17 = __ldxr(v16);
          while (__stxr(v17 + 1, v16));
        }
        v18 = (int8x8_t *)mlcore::Entity::propertyCache((mlcore::Entity *)v14);
        MPMediaLibraryPropertyCacheValueForProperty(*(ModelPropertyBase **)(a1 + 48), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "BOOLValue");

        if (!v20)
          break;
        ++v12;
        ++v13;
        if (v15)
          goto LABEL_20;
LABEL_24:
        v11 += 16;
        if (v11 == v10)
          goto LABEL_28;
      }
      MPMediaLibraryPropertyCacheValueForProperty(*(ModelPropertyBase **)(a1 + 56), v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "intValue");

      if (v22 > 0)
        ++v13;
      v23 = [MPIdentifierSet alloc];
      objc_msgSend(CFSTR("LibraryKeepLocal-"), "stringByAppendingString:", *(_QWORD *)(a1 + 32));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPModelPlaylistEntryKind identityKind](MPModelPlaylistEntryKind, "identityKind");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_4_17;
      v41[3] = &unk_1E3155E40;
      v26 = *(id *)(a1 + 32);
      v27 = *(_QWORD *)(a1 + 64);
      v42 = v26;
      v43 = v27;
      v44 = v18;
      v45 = *(_OWORD *)(a1 + 72);
      v28 = -[MPIdentifierSet initWithSource:modelKind:block:](v23, "initWithSource:modelKind:block:", v24, v25, v41);

      if (v28)
      {
        v29 = v40;
        if (!v40)
          v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v29, "addObject:", v28);
        v40 = v29;
        v15 = v47;
      }

      if (!v15)
        goto LABEL_24;
LABEL_20:
      v30 = (unint64_t *)&v15->__shared_owners_;
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
      goto LABEL_24;
    }
    v13 = 0;
    v12 = 0;
    v40 = 0;
LABEL_28:
    v46 = (void **)&v48;
    std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v46);
    v5 = v39;
    v32 = v40;
  }
  else
  {
    v13 = 0;
    v12 = 0;
    v32 = 0;
  }
  v33 = objc_alloc_init(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration);
  -[MPLibraryKeepLocalStatusObserverConfiguration setEnableState:](v33, "setEnableState:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 280));
  -[MPLibraryKeepLocalStatusObserverConfiguration setIdentifyingModelObject:](v33, "setIdentifyingModelObject:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 288));
  -[MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration setRedownloadableItemCount:](v33, "setRedownloadableItemCount:", *(_QWORD *)(a1 + 88));
  -[MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration setDownloadEnabledItemCount:](v33, "setDownloadEnabledItemCount:", v13);
  -[MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration setNonPurgeableItemCount:](v33, "setNonPurgeableItemCount:", v12);
  -[MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration setPendingItemIdentifiers:](v33, "setPendingItemIdentifiers:", v32);
  v34 = *(_QWORD **)(a1 + 40);
  v35 = v34[39];
  if (v35)
  {
    (*(void (**)(_QWORD, MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *, _QWORD))(v35 + 16))(v34[39], v33, 0);
    v34 = *(_QWORD **)(a1 + 40);
  }
  objc_msgSend(v34, "finish");

  v36 = v51;
  if (v51)
  {
    v37 = (unint64_t *)&v51->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }

}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  mlcore::EntityQueryResult *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  mlcore::EntityQueryResult *v10;
  _OWORD *v11;
  uint64_t v12;
  __int128 v13;
  unint64_t *v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _OWORD *v18;
  __int128 v19;
  int64x2_t v20;
  _OWORD *v21;
  char *v22;
  mlcore *v23;
  ModelPropertyBase *HasNonPurgeableAsset;
  __int128 v25;
  uint64_t v26;
  _OWORD *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  _QWORD *v35;
  char *v36;
  __int128 v37;
  int64x2_t v38;
  char *v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  uint64_t v49;
  void *v50;
  unint64_t *v51;
  unint64_t v52;
  uint64_t v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  __int128 v63;
  _QWORD v64[7];
  void **v65;
  std::__shared_weak_count *v66;
  _QWORD v67[4];
  std::__shared_weak_count *v68;
  __int128 v69;
  __int128 v70;
  int64x2_t v71;
  char *v72;
  mlcore::EntityQueryResult *v73;
  std::__shared_weak_count *v74;
  void **v75;
  int64x2_t v76;
  char *v77;
  char **v78;

  v5 = a3;
  v73 = 0;
  v74 = 0;
  v6 = *(mlcore::EntityQueryResult **)a2;
  if (*(_QWORD *)a2)
  {
    v7 = *(std::__shared_weak_count **)(a2 + 8);
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    v73 = v6;
    v74 = v7;
    v6 = (mlcore::EntityQueryResult *)mlcore::EntityQueryResult::entityCount(v6);
    v10 = v6;
  }
  else
  {
    v10 = 0;
  }
  v71 = 0uLL;
  v72 = 0;
  if (*(_QWORD *)(a1 + 40))
  {
    v78 = &v72;
    v11 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(1uLL);
    v13 = *(_OWORD *)(a1 + 40);
    *v11 = v13;
    if (*((_QWORD *)&v13 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v13 + 1) + 8);
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
    }
    v16 = (_QWORD *)v71.i64[1];
    v17 = (_QWORD *)v71.i64[0];
    if (v71.i64[1] == v71.i64[0])
    {
      v20 = vdupq_n_s64(v71.u64[1]);
      v18 = v11;
    }
    else
    {
      v18 = v11;
      do
      {
        v19 = *((_OWORD *)v16 - 1);
        v16 -= 2;
        *--v18 = v19;
        *v16 = 0;
        v16[1] = 0;
      }
      while (v16 != v17);
      v20 = v71;
    }
    v21 = v11 + 1;
    v71.i64[0] = (uint64_t)v18;
    v76 = v20;
    v22 = v72;
    v72 = (char *)&v11[v12];
    v77 = v22;
    v75 = (void **)v20.i64[0];
    v6 = (mlcore::EntityQueryResult *)std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v75);
    v71.i64[1] = (uint64_t)v21;
  }
  v23 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(v6);
  HasNonPurgeableAsset = (ModelPropertyBase *)mlcore::ItemPropertyHasNonPurgeableAsset(v23);
  MPMediaLibraryGetProperty((ModelPropertyBase *)v23, HasNonPurgeableAsset);
  std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v69);
  v25 = v69;
  v70 = v69;
  v69 = 0uLL;
  v26 = v71.i64[1];
  if (v71.i64[1] >= (unint64_t)v72)
  {
    v63 = v25;
    v28 = (v71.i64[1] - v71.i64[0]) >> 4;
    if ((unint64_t)(v28 + 1) >> 60)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    v29 = (uint64_t)&v72[-v71.i64[0]] >> 3;
    if (v29 <= v28 + 1)
      v29 = v28 + 1;
    if ((unint64_t)&v72[-v71.i64[0]] >= 0x7FFFFFFFFFFFFFF0)
      v30 = 0xFFFFFFFFFFFFFFFLL;
    else
      v30 = v29;
    v78 = &v72;
    v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v30);
    v33 = &v31[16 * v28];
    *(_OWORD *)v33 = v63;
    v70 = 0uLL;
    v34 = (_QWORD *)v71.i64[1];
    v35 = (_QWORD *)v71.i64[0];
    if (v71.i64[1] == v71.i64[0])
    {
      v38 = vdupq_n_s64(v71.u64[1]);
      v36 = &v31[16 * v28];
    }
    else
    {
      v36 = &v31[16 * v28];
      do
      {
        v37 = *((_OWORD *)v34 - 1);
        v34 -= 2;
        *((_OWORD *)v36 - 1) = v37;
        v36 -= 16;
        *v34 = 0;
        v34[1] = 0;
      }
      while (v34 != v35);
      v38 = v71;
    }
    v27 = v33 + 16;
    v71.i64[0] = (uint64_t)v36;
    v71.i64[1] = (uint64_t)(v33 + 16);
    v76 = v38;
    v39 = v72;
    v72 = &v31[16 * v32];
    v77 = v39;
    v75 = (void **)v38.i64[0];
    std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v75);
  }
  else
  {
    *(_OWORD *)v71.i64[1] = v25;
    v27 = (_OWORD *)(v26 + 16);
    v70 = 0uLL;
  }
  v71.i64[1] = (uint64_t)v27;
  (*(void (**)(void ***__return_ptr))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) + 16))(&v75);
  v40 = v71.i64[1] - v71.i64[0];
  if (v71.i64[1] - v71.i64[0] == 16)
  {
    v41 = *(std::__shared_weak_count **)(v71.i64[0] + 8);
    v67[3] = *(_QWORD *)v71.i64[0];
    v68 = v41;
    if (v41)
    {
      v42 = (unint64_t *)&v41->__shared_owners_;
      do
        v43 = __ldxr(v42);
      while (__stxr(v43 + 1, v42));
    }
  }
  else
  {
    memset(v67, 0, 24);
    std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v67, v71.i64[0], (_QWORD *)v71.i64[1], v40 >> 4);
    mlcore::CreateAndPredicate();
  }
  mlcore::Query::setPredicate();
  v44 = v68;
  if (v40 == 16)
  {
    if (v68)
    {
      v45 = (unint64_t *)&v68->__shared_owners_;
      do
        v46 = __ldaxr(v45);
      while (__stlxr(v46 - 1, v45));
      if (!v46)
      {
        ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
        std::__shared_weak_count::__release_weak(v44);
      }
    }
  }
  else
  {
    if (v68)
    {
      v47 = (unint64_t *)&v68->__shared_owners_;
      do
        v48 = __ldaxr(v47);
      while (__stlxr(v48 - 1, v47));
      if (!v48)
      {
        ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
        std::__shared_weak_count::__release_weak(v44);
      }
    }
    *(_QWORD *)&v70 = v67;
    std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v70);
  }
  v49 = *(_QWORD *)(a1 + 32);
  v50 = *(void **)(v49 + 296);
  v65 = v75;
  v66 = (std::__shared_weak_count *)v76.i64[0];
  if (v76.i64[0])
  {
    v51 = (unint64_t *)(v76.i64[0] + 8);
    do
      v52 = __ldxr(v51);
    while (__stxr(v52 + 1, v51));
    v49 = *(_QWORD *)(a1 + 32);
  }
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_8;
  v64[3] = &unk_1E3155DD0;
  v53 = *(_QWORD *)(a1 + 56);
  v64[4] = v49;
  v64[5] = v53;
  v64[6] = v10;
  objc_msgSend(v50, "performCoreQuery:withCompletion:", &v65, v64, v63);
  v54 = v66;
  if (v66)
  {
    v55 = (unint64_t *)&v66->__shared_owners_;
    do
      v56 = __ldaxr(v55);
    while (__stlxr(v56 - 1, v55));
    if (!v56)
    {
      ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
      std::__shared_weak_count::__release_weak(v54);
    }
  }
  v57 = (std::__shared_weak_count *)v76.i64[0];
  if (v76.i64[0])
  {
    v58 = (unint64_t *)(v76.i64[0] + 8);
    do
      v59 = __ldaxr(v58);
    while (__stlxr(v59 - 1, v58));
    if (!v59)
    {
      ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
      std::__shared_weak_count::__release_weak(v57);
    }
  }
  v75 = (void **)&v71;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v75);
  v60 = v74;
  if (v74)
  {
    v61 = (unint64_t *)&v74->__shared_owners_;
    do
      v62 = __ldaxr(v61);
    while (__stlxr(v62 - 1, v61));
    if (!v62)
    {
      ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
      std::__shared_weak_count::__release_weak(v60);
    }
  }

}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_8(_QWORD *a1, uint64_t a2, void *a3)
{
  mlcore::EntityQueryResult *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v9;
  MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  id v15;

  v15 = a3;
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
  }
  else
  {
    v6 = 0;
    v9 = 0;
  }
  v10 = objc_alloc_init(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration);
  -[MPLibraryKeepLocalStatusObserverConfiguration setEnableState:](v10, "setEnableState:", *(_QWORD *)(a1[4] + 280));
  -[MPLibraryKeepLocalStatusObserverConfiguration setIdentifyingModelObject:](v10, "setIdentifyingModelObject:", *(_QWORD *)(a1[4] + 288));
  -[MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration setRedownloadableItemCount:](v10, "setRedownloadableItemCount:", a1[5]);
  -[MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration setNonPurgeableItemCount:](v10, "setNonPurgeableItemCount:", v9);
  -[MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration setDownloadEnabledItemCount:](v10, "setDownloadEnabledItemCount:", a1[6]);
  v11 = (_QWORD *)a1[4];
  v12 = v11[39];
  if (v12)
  {
    (*(void (**)(_QWORD, MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *, _QWORD))(v12 + 16))(v11[39], v10, 0);
    v11 = (_QWORD *)a1[4];
  }
  objc_msgSend(v11, "finish");

  if (v6)
  {
    v13 = (unint64_t *)&v6->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_4_17(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  int8x16_t v8;
  uint64_t v9;
  _QWORD v10[4];
  __int128 v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_5;
  v10[3] = &__block_descriptor_48_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v11 = *(_OWORD *)(a1 + 40);
  v6 = v3;
  objc_msgSend(v3, "setLibraryIdentifiersWithDatabaseID:block:", v4, v10);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_6;
  v7[3] = &__block_descriptor_56_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v8 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
  v9 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v6, "setUniversalStoreIdentifiersWithBlock:", v7);

}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  MPMediaLibraryPropertyCacheValueForProperty(*(ModelPropertyBase **)(a1 + 32), *(int8x8_t **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersistentID:", objc_msgSend(v3, "longLongValue"));

}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  MPMediaLibraryPropertyCacheValueForProperty(*(ModelPropertyBase **)(a1 + 32), *(int8x8_t **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdamID:", objc_msgSend(v3, "longLongValue"));

  MPMediaLibraryPropertyCacheValueForProperty(*(ModelPropertyBase **)(a1 + 48), *(int8x8_t **)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubscriptionAdamID:", objc_msgSend(v4, "longLongValue"));

}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_2(uint64_t a1, uint64_t *a2, void *a3)
{
  id v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  _BYTE v23[24];
  _BYTE *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21 = 0;
  v22 = 0;
  v6 = *a2;
  if (*a2)
  {
    v7 = (std::__shared_weak_count *)a2[1];
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    v21 = v6;
    v22 = v7;
    v19 = 0;
    v20 = 0;
    v18 = 0;
    v10 = operator new(0x28uLL);
    *v10 = &off_1E314A550;
    v10[1] = &v19;
    v10[2] = &v18;
    v10[3] = a1 + 32;
    v10[4] = &v20;
    v24 = v10;
    mlcore::PropertiesQueryResult::enumerateResults();
    v11 = v24;
    if (v24 == v23)
    {
      v12 = 4;
      v11 = v23;
    }
    else
    {
      if (!v24)
        goto LABEL_11;
      v12 = 5;
    }
    (*(void (**)(void))(*v11 + 8 * v12))();
  }
  else
  {
    v7 = 0;
    v19 = 0;
    v20 = 0;
    v18 = 0;
  }
LABEL_11:
  v13 = objc_alloc_init(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration);
  -[MPLibraryKeepLocalStatusObserverConfiguration setEnableState:](v13, "setEnableState:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 280));
  -[MPLibraryKeepLocalStatusObserverConfiguration setIdentifyingModelObject:](v13, "setIdentifyingModelObject:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 288));
  -[MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration setRedownloadableItemCount:](v13, "setRedownloadableItemCount:", *(_QWORD *)(a1 + 48));
  -[MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration setDownloadEnabledItemCount:](v13, "setDownloadEnabledItemCount:", v18);
  -[MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration setNonPurgeableItemCount:](v13, "setNonPurgeableItemCount:", v19);
  -[MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration setPendingItemIdentifiers:](v13, "setPendingItemIdentifiers:", v20);
  v14 = *(_QWORD **)(a1 + 40);
  v15 = v14[39];
  if (v15)
  {
    (*(void (**)(_QWORD, MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *, _QWORD))(v15 + 16))(v14[39], v13, 0);
    v14 = *(_QWORD **)(a1 + 40);
  }
  objc_msgSend(v14, "finish", v18);

  if (v7)
  {
    v16 = (unint64_t *)&v7->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_3(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  mlcore::AggregateFunctionQueryResult *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  mlcore *v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  _OWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  _QWORD *v29;
  _QWORD *v30;
  char *v31;
  __int128 v32;
  int64x2_t v33;
  char *v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  unint64_t *v41;
  unint64_t v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  __int128 v53;
  _QWORD v54[7];
  void **v55;
  std::__shared_weak_count *v56;
  _QWORD v57[3];
  __int128 v58;
  int64x2_t v59;
  char *v60;
  mlcore::AggregateFunctionQueryResult *v61;
  std::__shared_weak_count *v62;
  void **v63;
  int64x2_t v64;
  char *v65;
  char **v66;
  __int128 v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v61 = 0;
  v62 = 0;
  v6 = *(mlcore::AggregateFunctionQueryResult **)a2;
  if (*(_QWORD *)a2)
  {
    v7 = *(std::__shared_weak_count **)(a2 + 8);
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    v61 = v6;
    v62 = v7;
    v10 = mlcore::AggregateFunctionQueryResult::value(v6);
  }
  else
  {
    v10 = 0;
  }
  v12 = a1[5];
  v11 = (std::__shared_weak_count *)a1[6];
  *(_QWORD *)&v67 = v12;
  *((_QWORD *)&v67 + 1) = v11;
  if (v11)
  {
    v13 = (unint64_t *)&v11->__shared_owners_;
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  v59 = 0uLL;
  v60 = 0;
  v63 = (void **)&v59;
  v64.i8[0] = 0;
  v15 = (mlcore *)operator new(0x10uLL);
  v59.i64[0] = (uint64_t)v15;
  v59.i64[1] = (uint64_t)v15;
  v60 = (char *)v15 + 16;
  *(_QWORD *)v15 = v12;
  *((_QWORD *)v15 + 1) = v11;
  if (v11)
  {
    v16 = (unint64_t *)&v11->__shared_owners_;
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
    v59.i64[1] = (uint64_t)v15 + 16;
    do
      v18 = __ldaxr(v16);
    while (__stlxr(v18 - 1, v16));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  else
  {
    v59.i64[1] = (uint64_t)v15 + 16;
  }
  mlcore::ItemPropertyHasNonPurgeableAsset(v15);
  v19 = std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v58);
  v20 = v58;
  v67 = v58;
  v58 = 0uLL;
  v21 = v59.i64[1];
  if (v59.i64[1] >= (unint64_t)v60)
  {
    v53 = v20;
    v23 = (v59.i64[1] - v59.i64[0]) >> 4;
    if ((unint64_t)(v23 + 1) >> 60)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    v24 = (uint64_t)&v60[-v59.i64[0]] >> 3;
    if (v24 <= v23 + 1)
      v24 = v23 + 1;
    if ((unint64_t)&v60[-v59.i64[0]] >= 0x7FFFFFFFFFFFFFF0)
      v25 = 0xFFFFFFFFFFFFFFFLL;
    else
      v25 = v24;
    v66 = &v60;
    v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v25);
    v28 = &v26[16 * v23];
    *(_OWORD *)v28 = v53;
    v67 = 0uLL;
    v29 = (_QWORD *)v59.i64[1];
    v30 = (_QWORD *)v59.i64[0];
    if (v59.i64[1] == v59.i64[0])
    {
      v33 = vdupq_n_s64(v59.u64[1]);
      v31 = &v26[16 * v23];
    }
    else
    {
      v31 = &v26[16 * v23];
      do
      {
        v32 = *((_OWORD *)v29 - 1);
        v29 -= 2;
        *((_OWORD *)v31 - 1) = v32;
        v31 -= 16;
        *v29 = 0;
        v29[1] = 0;
      }
      while (v29 != v30);
      v33 = v59;
    }
    v22 = v28 + 16;
    v59.i64[0] = (uint64_t)v31;
    v59.i64[1] = (uint64_t)(v28 + 16);
    v64 = v33;
    v34 = v60;
    v60 = &v26[16 * v27];
    v65 = v34;
    v63 = (void **)v33.i64[0];
    v19 = std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v63);
  }
  else
  {
    *(_OWORD *)v59.i64[1] = v20;
    v22 = (_OWORD *)(v21 + 16);
    v67 = 0uLL;
  }
  v59.i64[1] = (uint64_t)v22;
  v35 = MEMORY[0x194039EC8](v19);
  memset(v57, 0, sizeof(v57));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v57, v59.i64[0], (_QWORD *)v59.i64[1], (v59.i64[1] - v59.i64[0]) >> 4);
  mlcore::CreateAndPredicate();
  std::allocate_shared[abi:ne180100]<mlcore::AggregateFunctionQuery,std::allocator<mlcore::AggregateFunctionQuery>,mlcore::EntityClass *,mlcore::AggregateFunctionQuery::AggregateFunction,decltype(nullptr),std::shared_ptr<mlcore::Predicate>,void>(&v63, v35, 0, &v67);
  v36 = (std::__shared_weak_count *)*((_QWORD *)&v67 + 1);
  if (*((_QWORD *)&v67 + 1))
  {
    v37 = (unint64_t *)(*((_QWORD *)&v67 + 1) + 8);
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  *(_QWORD *)&v58 = v57;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v58);
  v39 = a1[4];
  v40 = *(void **)(v39 + 296);
  v55 = v63;
  v56 = (std::__shared_weak_count *)v64.i64[0];
  if (v64.i64[0])
  {
    v41 = (unint64_t *)(v64.i64[0] + 8);
    do
      v42 = __ldxr(v41);
    while (__stxr(v42 + 1, v41));
    v39 = a1[4];
  }
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_4;
  v54[3] = &unk_1E3155DD0;
  v43 = a1[7];
  v54[4] = v39;
  v54[5] = v43;
  v54[6] = v10;
  objc_msgSend(v40, "performCoreQuery:withCompletion:", &v55, v54, v53);
  v44 = v56;
  if (v56)
  {
    v45 = (unint64_t *)&v56->__shared_owners_;
    do
      v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  v47 = (std::__shared_weak_count *)v64.i64[0];
  if (v64.i64[0])
  {
    v48 = (unint64_t *)(v64.i64[0] + 8);
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
  }
  v63 = (void **)&v59;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v63);
  v50 = v62;
  if (v62)
  {
    v51 = (unint64_t *)&v62->__shared_owners_;
    do
      v52 = __ldaxr(v51);
    while (__stlxr(v52 - 1, v51));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }

}

void __56__MPModelLibraryKeepLocalStatusRequestOperation_execute__block_invoke_4(_QWORD *a1, uint64_t a2, void *a3)
{
  mlcore::AggregateFunctionQueryResult *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v9;
  MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  id v15;

  v15 = a3;
  v5 = *(mlcore::AggregateFunctionQueryResult **)a2;
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
    v9 = mlcore::AggregateFunctionQueryResult::value(v5);
  }
  else
  {
    v6 = 0;
    v9 = 0;
  }
  v10 = objc_alloc_init(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration);
  -[MPLibraryKeepLocalStatusObserverConfiguration setEnableState:](v10, "setEnableState:", *(_QWORD *)(a1[4] + 280));
  -[MPLibraryKeepLocalStatusObserverConfiguration setIdentifyingModelObject:](v10, "setIdentifyingModelObject:", *(_QWORD *)(a1[4] + 288));
  -[MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration setRedownloadableItemCount:](v10, "setRedownloadableItemCount:", a1[5]);
  -[MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration setNonPurgeableItemCount:](v10, "setNonPurgeableItemCount:", v9);
  -[MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration setDownloadEnabledItemCount:](v10, "setDownloadEnabledItemCount:", a1[6]);
  v11 = (_QWORD *)a1[4];
  v12 = v11[39];
  if (v12)
  {
    (*(void (**)(_QWORD, MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *, _QWORD))(v12 + 16))(v11[39], v10, 0);
    v11 = (_QWORD *)a1[4];
  }
  objc_msgSend(v11, "finish");

  if (v6)
  {
    v13 = (unint64_t *)&v6->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

@end
