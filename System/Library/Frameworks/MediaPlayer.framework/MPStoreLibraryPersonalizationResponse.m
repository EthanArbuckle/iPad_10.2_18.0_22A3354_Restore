@implementation MPStoreLibraryPersonalizationResponse

- (void)setRepresentedObjectResults:(id)a3
{
  objc_storeStrong((id *)&self->_representedObjectResults, a3);
}

- (void)setLibraryResponse:(id)a3
{
  MPModelResponse *v5;
  MPModelResponse **p_libraryResponse;
  MPModelResponse *libraryResponse;
  void *v8;
  void *v9;
  MPModelResponse *v10;

  v5 = (MPModelResponse *)a3;
  p_libraryResponse = &self->_libraryResponse;
  libraryResponse = self->_libraryResponse;
  v10 = v5;
  if (libraryResponse != v5)
  {
    if (libraryResponse)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("MPModelResponseDidInvalidateNotification"), *p_libraryResponse);

    }
    objc_storeStrong((id *)&self->_libraryResponse, a3);
    if (*p_libraryResponse)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__libraryResponseDidInvalidateNotification_, CFSTR("MPModelResponseDidInvalidateNotification"), *p_libraryResponse);

    }
  }

}

- (MPSectionedCollection)representedObjectResults
{
  return self->_representedObjectResults;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_libraryResponse)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MPModelResponseDidInvalidateNotification"), self->_libraryResponse);

  }
  v4.receiver = self;
  v4.super_class = (Class)MPStoreLibraryPersonalizationResponse;
  -[MPStoreLibraryPersonalizationResponse dealloc](&v4, sel_dealloc);
}

- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4
{
  id v6;
  void *v7;
  MPLibraryAddStatusObserver *v8;
  void *v9;
  uint64_t v10;
  MPLibraryAddStatusObserver *v11;
  id v12;
  void *v13;
  uint64_t v14;
  MPModelLibraryKeepLocalStatusRequestOperation *v15;
  void *v16;
  void *v17;
  void *v18;
  mlcore *v19;
  mlcore *v20;
  _OWORD *v21;
  char v22;
  uint64_t v23;
  char v24;
  __int128 v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  uint64_t i;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  void *v41;
  void **v43;
  char v44;
  __int128 v45;
  __int128 v46;
  _OWORD *v47;
  _OWORD *v48;
  _OWORD *v49;
  __int128 v50;
  uint64_t v51;
  std::__shared_weak_count *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  uint64_t *v56;
  uint64_t v57;
  _QWORD v58[4];
  MPLibraryAddStatusObserver *v59;
  id v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  __n128 (*v66)(__n128 *, __n128 *);
  void (*v67)(uint64_t);
  void *v68;
  void *__p;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  _OWORD v76[3];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[MPModelResponse results](self, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  v8 = objc_alloc_init(MPLibraryAddStatusObserver);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0;
  v64 = &v63;
  v65 = 0x4812000000;
  v66 = __Block_byref_object_copy__35426;
  v67 = __Block_byref_object_dispose__35427;
  v68 = &unk_193F4554F;
  __p = 0;
  v70 = 0;
  v71 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __126__MPStoreLibraryPersonalizationResponse_newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex_responseHandler___block_invoke;
  v58[3] = &unk_1E315D6D0;
  v11 = v8;
  v59 = v11;
  v12 = v9;
  v60 = v12;
  v61 = &v72;
  v62 = &v63;
  objc_msgSend(v7, "enumerateItemsUsingBlock:", v58);
  objc_msgSend(v7, "sectionAtIndex:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = objc_msgSend(v13, "keepLocalEnableState");
  else
    v14 = 0;
  if (v64[7] == v64[6])
  {
    v41 = (void *)MEMORY[0x1E0CB34C8];
    v53[0] = v10;
    v53[1] = 3221225472;
    v53[2] = __126__MPStoreLibraryPersonalizationResponse_newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex_responseHandler___block_invoke_2;
    v53[3] = &unk_1E315D6F8;
    v55 = v6;
    v56 = &v72;
    v57 = v14;
    v54 = v13;
    objc_msgSend(v41, "blockOperationWithBlock:", v53);
    v15 = (MPModelLibraryKeepLocalStatusRequestOperation *)objc_claimAutoreleasedReturnValue();

    v17 = v55;
  }
  else
  {
    v15 = objc_alloc_init(MPModelLibraryKeepLocalStatusRequestOperation);
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPStoreLibraryPersonalizationRequest libraryViewWithUserIdentity:](MPStoreLibraryPersonalizationRequest, "libraryViewWithUserIdentity:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPModelLibraryKeepLocalStatusRequestOperation setLibraryView:](v15, "setLibraryView:", v17);
    -[MPModelLibraryKeepLocalStatusRequestOperation setEnableState:](v15, "setEnableState:", v14);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v73[3]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryKeepLocalStatusRequestOperation setRedownloadableItemCount:](v15, "setRedownloadableItemCount:", v18);

    v19 = (mlcore *)MEMORY[0x194039EC8]();
    mlcore::ItemPropertyPersistentID(v19);
    v20 = (mlcore *)std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>((uint64_t *)&v46);
    v76[0] = v46;
    v46 = 0uLL;
    mlcore::ItemPropertyIsStoreRedownloadable(v20);
    std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v45);
    v76[1] = v45;
    v45 = 0uLL;
    v48 = 0;
    v49 = 0;
    v47 = 0;
    v43 = (void **)&v47;
    v44 = 0;
    v21 = operator new(0x20uLL);
    v22 = 0;
    v23 = 0;
    v47 = v21;
    v48 = v21;
    v49 = v21 + 2;
    do
    {
      v24 = v22;
      v25 = v76[v23];
      *v21 = v25;
      if (*((_QWORD *)&v25 + 1))
      {
        v26 = (unint64_t *)(*((_QWORD *)&v25 + 1) + 8);
        do
          v27 = __ldxr(v26);
        while (__stxr(v27 + 1, v26));
      }
      ++v21;
      v22 = 1;
      v23 = 1;
    }
    while ((v24 & 1) == 0);
    v48 = v21;
    mlcore::CreateAndPredicate();
    std::allocate_shared[abi:ne180100]<mlcore::EntityQuery,std::allocator<mlcore::EntityQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(&v51, (uint64_t)v19, &v50);
    -[MPModelLibraryKeepLocalStatusRequestOperation setDownloadableItemsQuery:](v15, "setDownloadableItemsQuery:", &v51);
    v28 = v52;
    if (v52)
    {
      p_shared_owners = (unint64_t *)&v52->__shared_owners_;
      do
        v30 = __ldaxr(p_shared_owners);
      while (__stlxr(v30 - 1, p_shared_owners));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
    v31 = (std::__shared_weak_count *)*((_QWORD *)&v50 + 1);
    if (*((_QWORD *)&v50 + 1))
    {
      v32 = (unint64_t *)(*((_QWORD *)&v50 + 1) + 8);
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }
    v43 = (void **)&v47;
    std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v43);
    for (i = 1; i != -1; --i)
      std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v76[i]);
    v35 = (std::__shared_weak_count *)*((_QWORD *)&v45 + 1);
    if (*((_QWORD *)&v45 + 1))
    {
      v36 = (unint64_t *)(*((_QWORD *)&v45 + 1) + 8);
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
    v38 = (std::__shared_weak_count *)*((_QWORD *)&v46 + 1);
    if (*((_QWORD *)&v46 + 1))
    {
      v39 = (unint64_t *)(*((_QWORD *)&v46 + 1) + 8);
      do
        v40 = __ldaxr(v39);
      while (__stlxr(v40 - 1, v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }
    -[MPModelLibraryKeepLocalStatusRequestOperation setResponseHandler:](v15, "setResponseHandler:", v6);
    -[MPModelLibraryKeepLocalStatusRequestOperation setIdentifyingModelObject:](v15, "setIdentifyingModelObject:", v13);
  }

  _Block_object_dispose(&v63, 8);
  if (__p)
  {
    v70 = __p;
    operator delete(__p);
  }

  _Block_object_dispose(&v72, 8);
  return v15;
}

- (MPModelResponse)libraryResponse
{
  return self->_libraryResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryResponse, 0);
  objc_storeStrong((id *)&self->_representedObjectResults, 0);
}

void __126__MPStoreLibraryPersonalizationResponse_newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  unint64_t v23;
  uint64_t *v24;
  _QWORD *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  BOOL v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  id v40;
  id v41;

  v40 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v40, "flattenedGenericObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
    v6 = v40;
    v9 = objc_msgSend(v6, "type");
    switch(v9)
    {
      case 1:
        objc_msgSend(v6, "song");
        v7 = objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        objc_msgSend(v6, "tvEpisode");
        v7 = objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        objc_msgSend(v6, "movie");
        v7 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        v8 = v6;
        goto LABEL_4;
    }
  }
  v8 = (id)v7;

LABEL_4:
  v40 = v8;
LABEL_10:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = v40;
    objc_msgSend(v10, "storeAsset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isRedownloadable");

    objc_msgSend(v10, "identifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "library");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "persistentID");

    v16 = v40;
    if ((v12 & 1) == 0)
      goto LABEL_40;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = 0;
      v16 = v40;
      goto LABEL_40;
    }
    v10 = v40;
    objc_msgSend(v10, "storeAsset");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isRedownloadable");

    objc_msgSend(v10, "identifiers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "library");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v29, "persistentID");

    v16 = v40;
    if (!v27)
      goto LABEL_40;
  }
  objc_msgSend(*(id *)(a1 + 32), "configureWithModelObject:");
  v17 = objc_msgSend(*(id *)(a1 + 32), "currentStatus") - 1;
  v16 = v40;
  v10 = v40;
  if (v17 <= 2)
  {
    v18 = *(void **)(a1 + 40);
    objc_msgSend(v40, "identifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = objc_msgSend(v18, "containsObject:", v19);

    if ((v18 & 1) == 0)
    {
      v20 = *(void **)(a1 + 40);
      objc_msgSend(v40, "identifiers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v21);

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
    v16 = v40;
    v10 = v40;
    if (v15)
    {
      v22 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
      v24 = (uint64_t *)v22[7];
      v23 = v22[8];
      if ((unint64_t)v24 >= v23)
      {
        v30 = (uint64_t *)v22[6];
        v31 = v24 - v30;
        v32 = v31 + 1;
        if ((unint64_t)(v31 + 1) >> 61)
          std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
        v33 = v23 - (_QWORD)v30;
        if (v33 >> 2 > v32)
          v32 = v33 >> 2;
        v34 = (unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8;
        v35 = 0x1FFFFFFFFFFFFFFFLL;
        if (!v34)
          v35 = v32;
        if (v35)
        {
          v35 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v35);
          v30 = (uint64_t *)v22[6];
          v24 = (uint64_t *)v22[7];
        }
        else
        {
          v36 = 0;
        }
        v37 = (uint64_t *)(v35 + 8 * v31);
        v38 = v35 + 8 * v36;
        *v37 = v15;
        v25 = v37 + 1;
        while (v24 != v30)
        {
          v39 = *--v24;
          *--v37 = v39;
        }
        v22[6] = v37;
        v22[7] = v25;
        v22[8] = v38;
        if (v30)
          operator delete(v30);
      }
      else
      {
        *v24 = v15;
        v25 = v24 + 1;
      }
      v22[7] = v25;
      v16 = v40;
      v10 = v40;
    }
  }
LABEL_40:
  v41 = v16;

}

void __126__MPStoreLibraryPersonalizationResponse_newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex_responseHandler___block_invoke_2(_QWORD *a1)
{
  MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration *v2;

  if (a1[5])
  {
    v2 = objc_alloc_init(MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration);
    -[MPLibraryKeepLocalStatusObserverConfiguration setEnableState:](v2, "setEnableState:", a1[7]);
    -[MPLibraryKeepLocalStatusObserverDetailedContainerConfiguration setRedownloadableItemCount:](v2, "setRedownloadableItemCount:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
    -[MPLibraryKeepLocalStatusObserverConfiguration setIdentifyingModelObject:](v2, "setIdentifyingModelObject:", a1[4]);
    (*(void (**)(void))(a1[5] + 16))();

  }
}

@end
