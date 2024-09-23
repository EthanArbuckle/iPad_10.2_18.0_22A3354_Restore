@implementation MPModelLibraryModelSectionedCollectionDataSource

- (MPModelLibraryModelSectionedCollectionDataSource)initWithRequest:(id)a3 sectionQueryResults:(shared_ptr<mlcore:(void *)a5 :EntityQueryResult>)a4 itemQueryResults:
{
  __shared_weak_count *cntrl;
  EntityQueryResult *ptr;
  id v9;
  MPModelLibraryModelSectionedCollectionDataSource *v10;
  MPModelLibraryModelSectionedCollectionDataSource *v11;
  MPModelLibraryModelSectionedCollectionDataSource *v12;
  id *p_request;
  char *v14;
  uint64_t *v15;
  uint64_t **v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t **v21;
  uint64_t **v22;
  char *v23;
  BOOL v24;
  uint64_t v25;
  uint64_t **v26;
  uint64_t **v27;
  uint64_t *v28;
  uint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  shared_ptr<std::map<long long, std::shared_ptr<mlcore::EntityQueryResult>>> v35;
  std::__shared_weak_count *v36;
  unint64_t *p_shared_owners;
  unint64_t v38;
  uint64_t v39;
  MPMediaLibraryEntityTranslationContext *itemTranslationContext;
  uint64_t v41;
  MPMediaLibraryEntityTranslationContext *sectionTranslationContext;
  void *v43;
  void *v44;
  _BOOL4 v45;
  id v47;
  _QWORD v48[2];
  char v49;

  cntrl = a4.__cntrl_;
  ptr = a4.__ptr_;
  v9 = a3;
  v10 = -[MPModelLibraryModelSectionedCollectionDataSource init](self, "init");
  v11 = v10;
  v12 = v10;
  if (!v10)
    goto LABEL_47;
  v47 = v9;
  p_request = (id *)&v10->_request;
  objc_storeStrong((id *)&v10->_request, a3);
  std::shared_ptr<mlcore::QueryResult>::operator=[abi:ne180100](&v11->_sectionEntityQueryResult.__ptr_, *(_QWORD *)ptr, *((_QWORD *)ptr + 1));
  v14 = (char *)operator new(0x30uLL);
  *(_OWORD *)(v14 + 8) = 0u;
  *(_QWORD *)v14 = &off_1E314ABF0;
  *((_OWORD *)v14 + 2) = 0u;
  v15 = (uint64_t *)(v14 + 32);
  *((_QWORD *)v14 + 3) = v14 + 32;
  v16 = (uint64_t **)(v14 + 24);
  v19 = *(_QWORD **)cntrl;
  v18 = (_QWORD *)((char *)cntrl + 8);
  v17 = v19;
  if (v19 != v18)
  {
    do
    {
      v20 = (uint64_t *)*v15;
      v21 = (uint64_t **)(v14 + 32);
      if (*v16 == v15)
        goto LABEL_9;
      v22 = (uint64_t **)*v15;
      v23 = v14 + 32;
      if (v20)
      {
        do
        {
          v21 = v22;
          v22 = (uint64_t **)v22[1];
        }
        while (v22);
      }
      else
      {
        do
        {
          v21 = (uint64_t **)*((_QWORD *)v23 + 2);
          v24 = *v21 == (uint64_t *)v23;
          v23 = (char *)v21;
        }
        while (v24);
      }
      v25 = v17[4];
      if ((uint64_t)v21[4] < v25)
      {
LABEL_9:
        if (v20)
          v26 = v21;
        else
          v26 = (uint64_t **)(v14 + 32);
        if (v20)
          v27 = v21 + 1;
        else
          v27 = (uint64_t **)(v14 + 32);
      }
      else
      {
        v26 = (uint64_t **)(v14 + 32);
        v27 = (uint64_t **)(v14 + 32);
        if (v20)
        {
          v27 = (uint64_t **)(v14 + 32);
          while (1)
          {
            while (1)
            {
              v26 = (uint64_t **)v20;
              v34 = v20[4];
              if (v25 >= v34)
                break;
              v20 = *v26;
              v27 = v26;
              if (!*v26)
                goto LABEL_16;
            }
            if (v34 >= v25)
              break;
            v27 = v26 + 1;
            v20 = v26[1];
            if (!v20)
              goto LABEL_16;
          }
        }
      }
      if (!*v27)
      {
LABEL_16:
        v28 = (uint64_t *)operator new(0x38uLL);
        v48[1] = v14 + 32;
        v28[4] = v17[4];
        v28[5] = v17[5];
        v29 = v17[6];
        v28[6] = v29;
        if (v29)
        {
          v30 = (unint64_t *)(v29 + 8);
          do
            v31 = __ldxr(v30);
          while (__stxr(v31 + 1, v30));
        }
        v49 = 1;
        std::__tree<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::__map_value_compare<long long,std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>>>::__insert_node_at(v16, (uint64_t)v26, v27, v28);
        v48[0] = 0;
        std::unique_ptr<std::__tree_node<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,void *>>>>::reset[abi:ne180100]((uint64_t)v48);
      }
      v32 = (_QWORD *)v17[1];
      if (v32)
      {
        do
        {
          v33 = v32;
          v32 = (_QWORD *)*v32;
        }
        while (v32);
      }
      else
      {
        do
        {
          v33 = (_QWORD *)v17[2];
          v24 = *v33 == (_QWORD)v17;
          v17 = v33;
        }
        while (!v24);
      }
      v17 = v33;
    }
    while (v33 != v18);
  }
  v35.__ptr_ = v14 + 24;
  v35.__cntrl_ = (__shared_weak_count *)v14;
  v36 = (std::__shared_weak_count *)v12->_itemEntityQueryResults.__cntrl_;
  v12->_itemEntityQueryResults = v35;
  v9 = v47;
  if (v36)
  {
    p_shared_owners = (unint64_t *)&v36->__shared_owners_;
    do
      v38 = __ldaxr(p_shared_owners);
    while (__stlxr(v38 - 1, p_shared_owners));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  objc_msgSend(*p_request, "itemTranslationContext", v47);
  v39 = objc_claimAutoreleasedReturnValue();
  itemTranslationContext = v12->_itemTranslationContext;
  v12->_itemTranslationContext = (MPMediaLibraryEntityTranslationContext *)v39;

  -[MPModelLibraryRequest sectionTranslationContext](v12->_request, "sectionTranslationContext");
  v41 = objc_claimAutoreleasedReturnValue();
  sectionTranslationContext = v12->_sectionTranslationContext;
  v12->_sectionTranslationContext = (MPMediaLibraryEntityTranslationContext *)v41;

  -[MPMediaLibraryEntityTranslationContext allowedEntityIdentifiers](v12->_sectionTranslationContext, "allowedEntityIdentifiers");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v43, "count"))
  {
LABEL_46:

    goto LABEL_47;
  }
  objc_msgSend(*p_request, "sectionSortDescriptors");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44 || !objc_msgSend(*p_request, "sortUsingAllowedItemIdentifiers"))
  {

    goto LABEL_46;
  }
  v45 = -[MPModelLibraryModelSectionedCollectionDataSource _allowedEntityIdentifiersContainsAllPersistentIDs](v12, "_allowedEntityIdentifiersContainsAllPersistentIDs");

  if (v45)
    -[MPModelLibraryModelSectionedCollectionDataSource _populateIndexMap](v12, "_populateIndexMap");
LABEL_47:

  return v12;
}

- (unint64_t)numberOfSections
{
  unint64_t result;

  result = (unint64_t)self->_sectionEntityQueryResult.__ptr_;
  if (result)
    return mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)result);
  return result;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  void *v16;
  mlcore::Entity *v17;
  std::__shared_weak_count *v18;

  v6 = -[MPModelLibraryModelSectionedCollectionDataSource _adjustedIndexForSectionIndex:](self, "_adjustedIndexForSectionIndex:");
  v7 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
  if (v6 >= v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryModelSectionedCollectionDataSource.mm"), 65, CFSTR("Adjusted section index out of bounds: %ld (sectionIndex = %ld / sectionEntityCount = %ld)"), v6, a3, v7);

  }
  mlcore::EntityQueryResult::entityAtIndex((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
  +[MPMediaLibrary logDatabaseAccess](MPMediaLibrary, "logDatabaseAccess");
  if (v17)
  {
    -[MPModelRequest sectionKind](self->_request, "sectionKind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_msgSend(v8, "modelClass"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPModelRequest sectionProperties](self->_request, "sectionProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (*(uint64_t (**)())(*(_QWORD *)v17 + 48))();
    objc_msgSend(v9, "objectForPropertySet:entityClass:propertyCache:context:", v10, v11, mlcore::Entity::propertyCache(v17), self->_sectionTranslationContext);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)())v18->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  return v12;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  EntityQueryResult *ptr;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  mlcore::EntityQueryResult **v10;
  mlcore::EntityQueryResult *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  void *v19;

  ptr = self->_sectionEntityQueryResult.__ptr_;
  if (!ptr || !mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)ptr))
    return 0;
  v7 = -[MPModelLibraryModelSectionedCollectionDataSource _adjustedIndexForSectionIndex:](self, "_adjustedIndexForSectionIndex:", a3);
  v8 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
  if (v7 >= v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryModelSectionedCollectionDataSource.mm"), 92, CFSTR("Adjusted section index out of bounds: %ld (sectionIndex = %ld / sectionEntityCount = %ld)"), v7, a3, v8);

  }
  v9 = mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
  v10 = (mlcore::EntityQueryResult **)std::map<long,MPIdentifierSet * {__strong}>::at(*((_QWORD **)self->_itemEntityQueryResults.__ptr_ + 1), v9);
  v11 = *v10;
  v12 = (std::__shared_weak_count *)v10[1];
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  if (v11)
  {
    v15 = mlcore::EntityQueryResult::entityCount(v11);
    if (!v12)
      return v15;
  }
  else
  {
    v15 = 0;
    if (!v12)
      return v15;
  }
  v16 = (unint64_t *)&v12->__shared_owners_;
  do
    v17 = __ldaxr(v16);
  while (__stlxr(v17 - 1, v16));
  if (!v17)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  return v15;
}

- (BOOL)hasSameContentAsDataSource:(id)a3
{
  _QWORD *v4;
  EntityQueryResult *ptr;
  mlcore::EntityQueryResult *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;
  mlcore::EntityQueryResult **v15;
  std::__shared_weak_count *v16;
  mlcore::EntityQueryResult *v17;
  unint64_t *v18;
  unint64_t v19;
  mlcore::EntityQueryResult **v20;
  mlcore::EntityQueryResult *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  mlcore::EntityQueryResult *v37;
  std::__shared_weak_count *v38;
  std::__shared_weak_count *v39;
  mlcore::EntityQueryResult *v40;
  std::__shared_weak_count *v41;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (ptr = self->_sectionEntityQueryResult.__ptr_) != 0
    && (v6 = (mlcore::EntityQueryResult *)v4[12]) != 0)
  {
    v7 = (std::__shared_weak_count *)v4[13];
    v37 = (mlcore::EntityQueryResult *)v4[12];
    v38 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
      ptr = self->_sectionEntityQueryResult.__ptr_;
    }
    v10 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)ptr);
    if (v10 == mlcore::EntityQueryResult::entityCount(v6))
    {
      v11 = 0;
      while (1)
      {
        v12 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
        v13 = v11 >= v12;
        if (v11 >= v12)
          break;
        v14 = mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
        if (v14 == mlcore::EntityQueryResult::persistentIDAtIndex(v37))
        {
          v15 = (mlcore::EntityQueryResult **)std::map<long,MPIdentifierSet * {__strong}>::at(*((_QWORD **)self->_itemEntityQueryResults.__ptr_ + 1), v14);
          v17 = *v15;
          v16 = (std::__shared_weak_count *)v15[1];
          v39 = v16;
          if (v16)
          {
            v18 = (unint64_t *)&v16->__shared_owners_;
            do
              v19 = __ldxr(v18);
            while (__stxr(v19 + 1, v18));
          }
          v20 = (mlcore::EntityQueryResult **)std::map<long,MPIdentifierSet * {__strong}>::at(*(_QWORD **)(v4[10] + 8), v14);
          v21 = *v20;
          v22 = (std::__shared_weak_count *)v20[1];
          v40 = *v20;
          v41 = v22;
          if (v22)
          {
            v23 = (unint64_t *)&v22->__shared_owners_;
            do
              v24 = __ldxr(v23);
            while (__stxr(v24 + 1, v23));
          }
          v25 = 0;
          if (v17 && v21)
          {
            v26 = mlcore::EntityQueryResult::entityCount(v17);
            if (v26 == mlcore::EntityQueryResult::entityCount(v40))
            {
              v27 = 0;
              while (1)
              {
                v28 = mlcore::EntityQueryResult::entityCount(v17);
                v25 = v27 >= v28;
                if (v27 >= v28)
                  break;
                v29 = mlcore::EntityQueryResult::persistentIDAtIndex(v17);
                ++v27;
                if (v29 != mlcore::EntityQueryResult::persistentIDAtIndex(v40))
                  goto LABEL_24;
              }
            }
            else
            {
LABEL_24:
              v25 = 0;
            }
          }
          if (v41)
          {
            v30 = (unint64_t *)&v41->__shared_owners_;
            do
              v31 = __ldaxr(v30);
            while (__stlxr(v31 - 1, v30));
            if (!v31)
            {
              ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
              std::__shared_weak_count::__release_weak(v41);
            }
          }
          if (v39)
          {
            v32 = (unint64_t *)&v39->__shared_owners_;
            do
              v33 = __ldaxr(v32);
            while (__stlxr(v33 - 1, v32));
            if (!v33)
            {
              ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
              std::__shared_weak_count::__release_weak(v39);
            }
          }
          ++v11;
          if (v25)
            continue;
        }
        goto LABEL_36;
      }
    }
    else
    {
LABEL_36:
      v13 = 0;
    }
    if (v38)
    {
      v34 = (unint64_t *)&v38->__shared_owners_;
      do
        v35 = __ldaxr(v34);
      while (__stlxr(v35 - 1, v34));
      if (!v35)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)itemAtIndexPath:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  mlcore::EntityQueryResult **v10;
  std::__shared_weak_count *v11;
  mlcore::EntityQueryResult *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  void *v25;
  std::__shared_weak_count *v26;
  mlcore::Entity *v27;
  std::__shared_weak_count *v28;

  v5 = a3;
  v6 = objc_msgSend(v5, "section");
  v7 = -[MPModelLibraryModelSectionedCollectionDataSource _adjustedIndexForSectionIndex:](self, "_adjustedIndexForSectionIndex:", v6);
  v8 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
  if (v7 >= v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryModelSectionedCollectionDataSource.mm"), 154, CFSTR("Adjusted section index out of bounds: %ld (sectionIndex = %ld / sectionEntityCount = %ld)"), v7, v6, v8);

  }
  v9 = mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
  v10 = (mlcore::EntityQueryResult **)std::map<long,MPIdentifierSet * {__strong}>::at(*((_QWORD **)self->_itemEntityQueryResults.__ptr_ + 1), v9);
  v12 = *v10;
  v11 = (std::__shared_weak_count *)v10[1];
  v26 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  if (!v12)
  {
    v19 = 0;
    if (!v11)
      goto LABEL_22;
    goto LABEL_18;
  }
  objc_msgSend(v5, "item");
  mlcore::EntityQueryResult::entityAtIndex(v12);
  +[MPMediaLibrary logDatabaseAccess](MPMediaLibrary, "logDatabaseAccess");
  if (v27)
  {
    -[MPModelRequest itemKind](self->_request, "itemKind");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_msgSend(v15, "modelClass"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPModelRequest itemProperties](self->_request, "itemProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (*(uint64_t (**)())(*(_QWORD *)v27 + 48))();
    objc_msgSend(v16, "objectForPropertySet:entityClass:propertyCache:context:", v17, v18, mlcore::Entity::propertyCache(v27), self->_itemTranslationContext);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  if (v28)
  {
    v20 = (unint64_t *)&v28->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)())v28->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  v11 = v26;
  if (v26)
  {
LABEL_18:
    v22 = (unint64_t *)&v11->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
LABEL_22:

  return v19;
}

- (id)identifiersForItemAtIndexPath:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  mlcore::EntityQueryResult **v10;
  mlcore::EntityQueryResult *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  int v15;
  int v16;
  unint64_t *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  void *v28;
  mlcore::EntityQueryResult *v29;
  std::__shared_weak_count *v30;
  uint64_t v31;
  std::__shared_weak_count *v32;

  v5 = a3;
  v6 = objc_msgSend(v5, "section");
  v7 = -[MPModelLibraryModelSectionedCollectionDataSource _adjustedIndexForSectionIndex:](self, "_adjustedIndexForSectionIndex:", v6);
  v8 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
  if (v7 >= v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryModelSectionedCollectionDataSource.mm"), 183, CFSTR("Adjusted section index out of bounds: %ld (sectionIndex = %ld / sectionEntityCount = %ld)"), v7, v6, v8);

  }
  v9 = mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
  v10 = (mlcore::EntityQueryResult **)std::map<long,MPIdentifierSet * {__strong}>::at(*((_QWORD **)self->_itemEntityQueryResults.__ptr_ + 1), v9);
  v11 = *v10;
  v12 = (std::__shared_weak_count *)v10[1];
  v29 = *v10;
  v30 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  if (v11)
  {
    mlcore::EntityQueryResult::entityCache(v11);
    v15 = (*(uint64_t (**)())(*(_QWORD *)v31 + 32))();
    v16 = v15;
    if (!v32)
      goto LABEL_11;
    v17 = (unint64_t *)&v32->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)())v32->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v32);
      if (v16)
        goto LABEL_12;
    }
    else
    {
LABEL_11:
      if (v15)
      {
LABEL_12:
        -[MPModelLibraryModelSectionedCollectionDataSource itemAtIndexPath:](self, "itemAtIndexPath:", v5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifiers");
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
    -[MPModelRequest itemKind](self->_request, "itemKind");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_msgSend(v22, "modelClass"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (_QWORD *)mlcore::EntityQueryResult::propertyCaches(v29);
    v24 = objc_msgSend(v5, "item");
    if (0x84BDA12F684BDA13 * ((uint64_t)(v23[1] - *v23) >> 3) <= v24)
      std::vector<mlcore::PropertyCache>::__throw_out_of_range[abi:ne180100]();
    objc_msgSend(v19, "identifiersForPropertyCache:context:", *v23 + 216 * v24, self->_itemTranslationContext);
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v21 = (void *)v20;

    v12 = v30;
    if (!v30)
      goto LABEL_23;
    goto LABEL_19;
  }
  v21 = 0;
  if (!v12)
    goto LABEL_23;
LABEL_19:
  v25 = (unint64_t *)&v12->__shared_owners_;
  do
    v26 = __ldaxr(v25);
  while (__stlxr(v26 - 1, v25));
  if (!v26)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
LABEL_23:

  return v21;
}

- (id)identifiersForSectionAtIndex:(int64_t)a3
{
  EntityQueryResult *ptr;
  unint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  ptr = self->_sectionEntityQueryResult.__ptr_;
  if (ptr && mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)ptr))
  {
    v7 = -[MPModelLibraryModelSectionedCollectionDataSource _adjustedIndexForSectionIndex:](self, "_adjustedIndexForSectionIndex:", a3);
    v8 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
    if (v7 >= v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryModelSectionedCollectionDataSource.mm"), 212, CFSTR("Adjusted section index out of bounds: %ld (sectionIndex = %ld / sectionEntityCount = %ld)"), v7, a3, v8);

    }
    v9 = (uint64_t *)mlcore::EntityQueryResult::propertyCaches((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
    v10 = *v9;
    if (0x84BDA12F684BDA13 * ((v9[1] - *v9) >> 3) <= v7)
      std::vector<mlcore::PropertyCache>::__throw_out_of_range[abi:ne180100]();
    -[MPMediaLibraryEntityTranslationContext modelKind](self->_sectionTranslationContext, "modelKind");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_msgSend(v11, "modelClass"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "identifiersForPropertyCache:context:", v10 + 216 * v7, self->_sectionTranslationContext);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)indexPathForItemWithIdentifiersIntersectingSet:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t *begin;
  int64_t *end;
  int64_t *v12;
  uint64_t v13;
  NSObject *v14;
  mlcore::EntityQueryResult **v15;
  mlcore::EntityQueryResult *v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  unint64_t i;
  void *v21;
  unint64_t *v22;
  unint64_t v23;
  void *v25;
  _BYTE buf[22];
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = v4;
  if (self->_sectionEntityQueryResult.__ptr_)
  {
    objc_msgSend(v4, "library");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "persistentID");

    if (v6)
    {
      v7 = 0;
      while (v7 < mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_))
      {
        v8 = mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
        v9 = v8;
        begin = self->_allowedSectionPersistentIDs.__begin_;
        end = self->_allowedSectionPersistentIDs.__end_;
        v12 = begin;
        if (begin != end)
        {
          while (*v12 != v8)
          {
            if (++v12 == end)
            {
              v12 = self->_allowedSectionPersistentIDs.__end_;
              break;
            }
          }
        }
        if (v12 == end)
        {
          v14 = os_log_create("com.apple.amp.mediaplayer", "Default");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218496;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v7;
            v27 = 2048;
            v28 = v9;
            _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_DEBUG, "MPModelLibraryModelSectionedCollectionDataSource %p: indexPathForItemWithIdentifiersIntersectingSet: adjustedSectionIndex not translated [currentSectionPersistentID not found in _allowedSectionPersistentIDs] adjustedSectionIndex=%zu currentSectionPersistentID=%lld", buf, 0x20u);
          }

          v13 = v7;
        }
        else
        {
          v13 = v12 - begin;
        }
        v15 = (mlcore::EntityQueryResult **)std::map<long,MPIdentifierSet * {__strong}>::at(*((_QWORD **)self->_itemEntityQueryResults.__ptr_ + 1), v9);
        v16 = *v15;
        v17 = (std::__shared_weak_count *)v15[1];
        *(_QWORD *)buf = *v15;
        *(_QWORD *)&buf[8] = v17;
        if (v17)
        {
          p_shared_owners = (unint64_t *)&v17->__shared_owners_;
          do
            v19 = __ldxr(p_shared_owners);
          while (__stxr(v19 + 1, p_shared_owners));
        }
        for (i = 0; ; ++i)
        {
          if (i >= mlcore::EntityQueryResult::entityCount(v16))
          {
            v21 = 0;
            if (!v17)
              goto LABEL_28;
            goto LABEL_24;
          }
          if (mlcore::EntityQueryResult::persistentIDAtIndex(v16) == v6)
            break;
        }
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, v13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
          goto LABEL_28;
LABEL_24:
        v22 = (unint64_t *)&v17->__shared_owners_;
        do
          v23 = __ldaxr(v22);
        while (__stlxr(v23 - 1, v22));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
LABEL_28:
        ++v7;
        if (v21)
          goto LABEL_31;
      }
    }
  }
  v21 = 0;
LABEL_31:

  return v21;
}

- (void)_populateIndexMap
{
  uint64_t *v3;
  uint64_t **p_allowedSectionPersistentIDToSectionQueryResultsIndexMap;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  _QWORD *j;
  uint64_t v13;
  int64_t *value;
  int64_t *end;
  int64_t *v16;
  int64_t *begin;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  int64_t *v23;
  int64_t v24;
  uint64_t *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v3 = 0;
  v31 = *MEMORY[0x1E0C80C00];
  p_allowedSectionPersistentIDToSectionQueryResultsIndexMap = (uint64_t **)&self->_allowedSectionPersistentIDToSectionQueryResultsIndexMap;
  while ((unint64_t)v3 < mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_))
  {
    v25 = (uint64_t *)mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
    std::__tree<std::__value_type<long long,unsigned long>,std::__map_value_compare<long long,std::__value_type<long long,unsigned long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,unsigned long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(p_allowedSectionPersistentIDToSectionQueryResultsIndexMap, (uint64_t)v25, &v25)[5] = v3;
    v3 = (uint64_t *)((char *)v3 + 1);
  }
  -[MPMediaLibraryEntityTranslationContext allowedEntityIdentifiers](self->_sectionTranslationContext, "allowedEntityIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "library");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "persistentID");

        for (j = self->_allowedSectionPersistentIDToSectionQueryResultsIndexMap.__tree_.__pair1_.__value_.__left_;
              j;
              j = (_QWORD *)*j)
        {
          v13 = j[4];
          if (v11 >= v13)
          {
            if (v13 >= v11)
            {
              end = self->_allowedSectionPersistentIDs.__end_;
              value = self->_allowedSectionPersistentIDs.__end_cap_.__value_;
              if (end >= value)
              {
                begin = self->_allowedSectionPersistentIDs.__begin_;
                v18 = end - begin;
                v19 = v18 + 1;
                if ((unint64_t)(v18 + 1) >> 61)
                  std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
                v20 = (char *)value - (char *)begin;
                if (v20 >> 2 > v19)
                  v19 = v20 >> 2;
                if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8)
                  v21 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v21 = v19;
                if (v21)
                {
                  v21 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v21);
                  begin = self->_allowedSectionPersistentIDs.__begin_;
                  end = self->_allowedSectionPersistentIDs.__end_;
                }
                else
                {
                  v22 = 0;
                }
                v23 = (int64_t *)(v21 + 8 * v18);
                *v23 = v11;
                v16 = v23 + 1;
                while (end != begin)
                {
                  v24 = *--end;
                  *--v23 = v24;
                }
                self->_allowedSectionPersistentIDs.__begin_ = v23;
                self->_allowedSectionPersistentIDs.__end_ = v16;
                self->_allowedSectionPersistentIDs.__end_cap_.__value_ = (int64_t *)(v21 + 8 * v22);
                if (begin)
                  operator delete(begin);
              }
              else
              {
                *end = v11;
                v16 = end + 1;
              }
              self->_allowedSectionPersistentIDs.__end_ = v16;
              break;
            }
            ++j;
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

}

- (unint64_t)_adjustedIndexForSectionIndex:(int64_t)a3
{
  uint64_t *v5;
  _QWORD *i;
  uint64_t v7;
  void *v8;
  uint64_t *v10;

  if (self->_allowedSectionPersistentIDToSectionQueryResultsIndexMap.__tree_.__pair3_.__value_)
  {
    v5 = (uint64_t *)self->_allowedSectionPersistentIDs.__begin_[a3];
    v10 = v5;
    for (i = self->_allowedSectionPersistentIDToSectionQueryResultsIndexMap.__tree_.__pair1_.__value_.__left_;
          i;
          i = (_QWORD *)*i)
    {
      v7 = i[4];
      if ((uint64_t)v5 >= v7)
      {
        if (v7 >= (uint64_t)v5)
          return (unint64_t)std::__tree<std::__value_type<long long,unsigned long>,std::__map_value_compare<long long,std::__value_type<long long,unsigned long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,unsigned long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t **)&self->_allowedSectionPersistentIDToSectionQueryResultsIndexMap, (uint64_t)v5, &v10)[5];
        ++i;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryModelSectionedCollectionDataSource.mm"), 293, CFSTR("_allowedSectionPersistentIDToSectionQueryResultsIndexMap must contain an entry for every value in _allowedSectionIdentifiers"));

    return (unint64_t)std::__tree<std::__value_type<long long,unsigned long>,std::__map_value_compare<long long,std::__value_type<long long,unsigned long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,unsigned long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t **)&self->_allowedSectionPersistentIDToSectionQueryResultsIndexMap, (uint64_t)v5, &v10)[5];
  }
  return a3;
}

- (BOOL)_allowedEntityIdentifiersContainsAllPersistentIDs
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  BOOL v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MPMediaLibraryEntityTranslationContext allowedEntityIdentifiers](self->_sectionTranslationContext, "allowedEntityIdentifiers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "library");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "persistentID") == 0;

        if (v7)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  MPModelLibraryModelSectionedCollectionDataSource *v4;
  BOOL v5;

  v4 = (MPModelLibraryModelSectionedCollectionDataSource *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (-[MPModelLibraryModelSectionedCollectionDataSource isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[MPModelLibraryModelSectionedCollectionDataSource hasSameContentAsDataSource:](self, "hasSameContentAsDataSource:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  mlcore::EntityQueryResult **v19;
  std::__shared_weak_count *v20;
  mlcore::EntityQueryResult *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  unint64_t i;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  unint64_t *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v77;
  void *v78;
  unint64_t v79;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;

  v2 = MSVHasherSharedSeed();
  v79 = 0;
  v85 = 0;
  v81 = v2 ^ 0x736F6D6570736575;
  v82 = v3 ^ 0x646F72616E646F6DLL;
  v83 = v2 ^ 0x6C7967656E657261;
  v84 = v3 ^ 0x7465646279746573;
  while (v79 < mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_))
  {
    v4 = mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_sectionEntityQueryResult.__ptr_);
    v5 = v85;
    if ((v85 & 0x400000000000000) != 0)
    {
      if ((v85 & 0x300000000000000) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v85);

        v5 = v85;
      }
      v12 = v5 & 0xFFFFFFFFFFFFFFLL | (v4 << 32);
      v13 = (v81 + v82) ^ __ROR8__(v82, 51);
      v14 = v83 + (v12 ^ v84);
      v15 = __ROR8__(v12 ^ v84, 48);
      v16 = (v14 ^ v15) + __ROR8__(v81 + v82, 32);
      v17 = v16 ^ __ROR8__(v14 ^ v15, 43);
      v18 = v14 + v13;
      v83 = __ROR8__(v18, 32);
      v84 = v17;
      v81 = v16 ^ v12;
      v82 = v18 ^ __ROR8__(v13, 47);
      v5 = v5 & 0xFF00000000000000 | HIDWORD(v4);
    }
    else
    {
      if ((v85 & 0x7FFFFFFFFFFFFFFLL) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v85);

        v5 = v85;
      }
      v6 = (v81 + v82) ^ __ROR8__(v82, 51);
      v7 = v83 + (v84 ^ v4);
      v8 = __ROR8__(v84 ^ v4, 48);
      v9 = (v7 ^ v8) + __ROR8__(v81 + v82, 32);
      v10 = v9 ^ __ROR8__(v7 ^ v8, 43);
      v11 = v7 + v6;
      v83 = __ROR8__(v11, 32);
      v84 = v10;
      v81 = v9 ^ v4;
      v82 = v11 ^ __ROR8__(v6, 47);
    }
    v85 = v5 + 0x800000000000000;
    v19 = (mlcore::EntityQueryResult **)std::map<long,MPIdentifierSet * {__strong}>::at(*((_QWORD **)self->_itemEntityQueryResults.__ptr_ + 1), v4);
    v21 = *v19;
    v20 = (std::__shared_weak_count *)v19[1];
    if (v20)
    {
      p_shared_owners = (unint64_t *)&v20->__shared_owners_;
      do
        v23 = __ldxr(p_shared_owners);
      while (__stxr(v23 + 1, p_shared_owners));
    }
    for (i = 0; i < mlcore::EntityQueryResult::entityCount(v21); ++i)
    {
      v25 = mlcore::EntityQueryResult::persistentIDAtIndex(v21);
      v26 = v85;
      if ((v85 & 0x400000000000000) != 0)
      {
        if ((v85 & 0x300000000000000) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "handleFailureInFunction:file:lineNumber:description:", v41, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v85);

          v26 = v85;
        }
        v33 = v26 & 0xFFFFFFFFFFFFFFLL | (v25 << 32);
        v34 = (v81 + v82) ^ __ROR8__(v82, 51);
        v35 = v83 + (v33 ^ v84);
        v36 = __ROR8__(v33 ^ v84, 48);
        v37 = (v35 ^ v36) + __ROR8__(v81 + v82, 32);
        v38 = v37 ^ __ROR8__(v35 ^ v36, 43);
        v39 = v35 + v34;
        v83 = __ROR8__(v39, 32);
        v84 = v38;
        v81 = v37 ^ v33;
        v82 = v39 ^ __ROR8__(v34, 47);
        v26 = v26 & 0xFF00000000000000 | HIDWORD(v25);
      }
      else
      {
        if ((v85 & 0x7FFFFFFFFFFFFFFLL) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v85);

          v26 = v85;
        }
        v27 = (v81 + v82) ^ __ROR8__(v82, 51);
        v28 = v83 + (v84 ^ v25);
        v29 = __ROR8__(v84 ^ v25, 48);
        v30 = (v28 ^ v29) + __ROR8__(v81 + v82, 32);
        v31 = v30 ^ __ROR8__(v28 ^ v29, 43);
        v32 = v28 + v27;
        v83 = __ROR8__(v32, 32);
        v84 = v31;
        v81 = v30 ^ v25;
        v82 = v32 ^ __ROR8__(v27, 47);
      }
      v85 = v26 + 0x800000000000000;
    }
    if (v20)
    {
      v42 = (unint64_t *)&v20->__shared_owners_;
      do
        v43 = __ldaxr(v42);
      while (__stlxr(v43 - 1, v42));
      if (!v43)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    ++v79;
  }
  v48 = (v81 + v82) ^ __ROR8__(v82, 51);
  v49 = v83 + (v84 ^ v85);
  v50 = __ROR8__(v84 ^ v85, 48);
  v51 = (v49 ^ v50) + __ROR8__(v81 + v82, 32);
  v52 = v51 ^ __ROR8__(v49 ^ v50, 43);
  v53 = v49 + v48;
  v54 = v53 ^ __ROR8__(v48, 47);
  v55 = (v51 ^ v85) + v54;
  v56 = v55 ^ __ROR8__(v54, 51);
  v57 = (__ROR8__(v53, 32) ^ 0xFFLL) + v52;
  v58 = __ROR8__(v52, 48);
  v59 = __ROR8__(v55, 32) + (v57 ^ v58);
  v60 = v59 ^ __ROR8__(v57 ^ v58, 43);
  v61 = v56 + v57;
  v62 = v61 ^ __ROR8__(v56, 47);
  v63 = v62 + v59;
  v64 = v63 ^ __ROR8__(v62, 51);
  v65 = __ROR8__(v61, 32) + v60;
  v66 = __ROR8__(v60, 48);
  v67 = __ROR8__(v63, 32) + (v65 ^ v66);
  v68 = v67 ^ __ROR8__(v65 ^ v66, 43);
  v69 = v64 + v65;
  v70 = v69 ^ __ROR8__(v64, 47);
  v71 = v70 + v67;
  v72 = v71 ^ __ROR8__(v70, 51);
  v73 = __ROR8__(v69, 32) + v68;
  v74 = __ROR8__(v68, 48);
  v75 = __ROR8__(v71, 32) + (v73 ^ v74);
  return (v72 + v73) ^ __ROR8__(v72, 47) ^ v75 ^ __ROR8__(v72 + v73, 32) ^ v75 ^ __ROR8__(v73 ^ v74, 43);
}

- (shared_ptr<std::map<long)itemEntityQueryResults
{
  void **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<std::map<long long, std::shared_ptr<mlcore::EntityQueryResult>>> result;

  cntrl = self->_itemEntityQueryResults.__cntrl_;
  *v2 = self->_itemEntityQueryResults.__ptr_;
  v2[1] = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (shared_ptr<mlcore::EntityQueryResult>)sectionEntityQueryResult
{
  EntityQueryResult **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<mlcore::EntityQueryResult> result;

  cntrl = self->_sectionEntityQueryResult.__cntrl_;
  *v2 = self->_sectionEntityQueryResult.__ptr_;
  v2[1] = (EntityQueryResult *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (EntityQueryResult *)self;
  return result;
}

- (MPModelLibraryRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  int64_t *begin;

  std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&self->_sectionEntityQueryResult);
  cntrl = self->_itemEntityQueryResults.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  objc_storeStrong((id *)&self->_request, 0);
  std::__tree<std::__value_type<long long,unsigned long>,std::__map_value_compare<long long,std::__value_type<long long,unsigned long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,unsigned long>>>::destroy((_QWORD *)self->_allowedSectionPersistentIDToSectionQueryResultsIndexMap.__tree_.__pair1_.__value_.__left_);
  begin = self->_allowedSectionPersistentIDs.__begin_;
  if (begin)
  {
    self->_allowedSectionPersistentIDs.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_sectionTranslationContext, 0);
  objc_storeStrong((id *)&self->_itemTranslationContext, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = (char *)self + 56;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  return self;
}

@end
