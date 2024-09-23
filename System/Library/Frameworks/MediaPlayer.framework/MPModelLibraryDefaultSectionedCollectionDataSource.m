@implementation MPModelLibraryDefaultSectionedCollectionDataSource

- (id)identifiersForItemAtIndexPath:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v18;
  _QWORD v19[5];
  id v20;

  v5 = a3;
  v6 = -[MPModelLibraryDefaultSectionedCollectionDataSource _adjustedGlobalIndexForIndexPath:](self, "_adjustedGlobalIndexForIndexPath:", v5);
  v7 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  if (v6 >= v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryDefaultSectionedCollectionDataSource.mm"), 280, CFSTR("Adjusted global index out of bounds: %ld (indexPath = %@ / entityCount = %ld)"), v6, v5, v7);

  }
  v8 = (uint64_t *)mlcore::EntityQueryResult::propertyCaches((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  v9 = *v8;
  if (0x84BDA12F684BDA13 * ((v8[1] - *v8) >> 3) <= v6)
    std::vector<mlcore::PropertyCache>::__throw_out_of_range[abi:ne180100]();
  -[MPModelRequest itemKind](self->_request, "itemKind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_msgSend(v10, "modelClass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "identifiersForPropertyCache:context:", v9 + 216 * v6, self->_entityTranslationContext);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_indexPathToContainerUniqueIDMap)
  {
    -[MPMediaLibraryEntityTranslationContext mediaLibrary](self->_entityTranslationContext, "mediaLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("Library-DefaultSectionedCollection-"), "stringByAppendingString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __84__MPModelLibraryDefaultSectionedCollectionDataSource_identifiersForItemAtIndexPath___block_invoke;
    v19[3] = &unk_1E3162A70;
    v19[4] = self;
    v20 = v5;
    v16 = objc_msgSend(v12, "copyWithSource:block:", v15, v19);

    v12 = (void *)v16;
  }

  return v12;
}

- (unint64_t)_adjustedGlobalIndexForIndexPath:(id)a3
{
  id v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  __int128 *v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _QWORD *i;
  uint64_t v19;
  void *v20;
  void *v22;
  std::string v23;
  __int128 v24;
  int v25;

  v5 = a3;
  v6 = (uint64_t *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  v7 = objc_msgSend(v5, "item");
  v8 = v6[1];
  v9 = v8 - *v6;
  if (v8 != *v6 && -[MPModelLibraryDefaultSectionedCollectionDataSource _usesSections](self, "_usesSections"))
  {
    v10 = objc_msgSend(v5, "section");
    v11 = 0xAAAAAAAAAAAAAAABLL * (v9 >> 4);
    if (v10 >= v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryDefaultSectionedCollectionDataSource.mm"), 428, CFSTR("Section index out of bounds: %ld (sectionCount = %ld)"), v10, v11);

    }
    v12 = *v6;
    v13 = (__int128 *)(v12 + 48 * v10);
    if (*((char *)v13 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v23, *(const std::string::value_type **)v13, *((_QWORD *)v13 + 1));
    }
    else
    {
      v14 = *v13;
      v23.__r_.__value_.__r.__words[2] = *((_QWORD *)v13 + 2);
      *(_OWORD *)&v23.__r_.__value_.__l.__data_ = v14;
    }
    v15 = v12 + 48 * v10;
    v16 = *(_OWORD *)(v15 + 24);
    v25 = *(_DWORD *)(v15 + 40);
    v24 = v16;
    v7 += *(_QWORD *)mlcore::Section::range((mlcore::Section *)&v23);
    if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v23.__r_.__value_.__l.__data_);
  }
  if (self->_allowedItemPersistentIDToItemQueryResultsIndexMap.__tree_.__pair3_.__value_)
  {
    v17 = self->_allowedItemPersistentIDs.__begin_[v7];
    v23.__r_.__value_.__r.__words[0] = v17;
    for (i = self->_allowedItemPersistentIDToItemQueryResultsIndexMap.__tree_.__pair1_.__value_.__left_;
          i;
          i = (_QWORD *)*i)
    {
      v19 = i[4];
      if (v17 >= v19)
      {
        if (v19 >= v17)
          goto LABEL_17;
        ++i;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryDefaultSectionedCollectionDataSource.mm"), 438, CFSTR("_allowedItemPersistentIDToItemQueryResultsIndexMap must contain an entry for every value in _allowedItemIdentifiers"));

LABEL_17:
    v7 = (unint64_t)std::__tree<std::__value_type<long long,unsigned long>,std::__map_value_compare<long long,std::__value_type<long long,unsigned long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,unsigned long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t **)&self->_allowedItemPersistentIDToItemQueryResultsIndexMap, v17, (uint64_t **)&v23)[5];
  }

  return v7;
}

- (BOOL)_usesSections
{
  EntityQueryResult *ptr;

  if (-[MPModelLibraryRequest disableImplicitSectioning](self->_request, "disableImplicitSectioning"))
  {
    LOBYTE(ptr) = 0;
  }
  else
  {
    ptr = self->_itemQueryResults.__ptr_;
    if (ptr)
      LOBYTE(ptr) = (unint64_t)mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)ptr) > 0x31;
  }
  return (char)ptr;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  unint64_t result;
  _QWORD *v6;

  result = (unint64_t)self->_itemQueryResults.__ptr_;
  if (result)
  {
    v6 = (_QWORD *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)result);
    if (v6[1] == *v6 || !-[MPModelLibraryDefaultSectionedCollectionDataSource _usesSections](self, "_usesSections"))
      return mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
    else
      return *(_QWORD *)(mlcore::Section::range((mlcore::Section *)(*v6 + 48 * a3)) + 8);
  }
  return result;
}

- (unint64_t)numberOfSections
{
  _QWORD *v3;
  _QWORD *v4;

  if (!self->_itemQueryResults.__ptr_)
    return 0;
  if (!-[MPModelLibraryDefaultSectionedCollectionDataSource _usesSections](self, "_usesSections"))
    return 1;
  v3 = (_QWORD *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v3[1] - *v3) >> 4) < 2)
    return 1;
  v4 = (_QWORD *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  return 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4[1] - *v4) >> 4);
}

- (id)sectionAtIndex:(unint64_t)a3
{
  _QWORD *v5;
  void *v6;
  void *p_p;
  __CFString *v8;
  void *__p;
  char v11;

  v5 = (_QWORD *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5[1] - *v5) >> 4) > a3
    && -[MPModelLibraryDefaultSectionedCollectionDataSource _usesSections](self, "_usesSections"))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    mlcore::Section::localizedTitle((mlcore::Section *)(*v5 + 48 * a3));
    if (v11 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    objc_msgSend(v6, "stringWithUTF8String:", p_p);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v11 < 0)
      operator delete(__p);
  }
  else
  {
    v8 = &stru_1E3163D10;
  }
  return v8;
}

- (id)itemAtIndexPath:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  void *v22;
  mlcore::Entity *v23;
  std::__shared_weak_count *v24;
  _QWORD v25[5];
  id v26;

  v5 = a3;
  v6 = -[MPModelLibraryDefaultSectionedCollectionDataSource _adjustedGlobalIndexForIndexPath:](self, "_adjustedGlobalIndexForIndexPath:", v5);
  v7 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  if (v6 >= v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryDefaultSectionedCollectionDataSource.mm"), 186, CFSTR("Adjusted global index out of bounds: %ld (indexPath = %@ / entityCount = %ld)"), v6, v5, v7);

  }
  mlcore::EntityQueryResult::entityAtIndex((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  +[MPMediaLibrary logDatabaseAccess](MPMediaLibrary, "logDatabaseAccess");
  if (v23)
  {
    -[MPModelRequest itemKind](self->_request, "itemKind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_msgSend(v8, "modelClass"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPModelRequest itemProperties](self->_request, "itemProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (*(uint64_t (**)())(*(_QWORD *)v23 + 48))();
    objc_msgSend(v9, "objectForPropertySet:entityClass:propertyCache:context:", v10, v11, mlcore::Entity::propertyCache(v23), self->_entityTranslationContext);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_indexPathToContainerUniqueIDMap)
    {
      objc_msgSend(v12, "identifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaLibraryEntityTranslationContext mediaLibrary](self->_entityTranslationContext, "mediaLibrary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "uniqueIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("Library-DefaultSectionedCollection-"), "stringByAppendingString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __70__MPModelLibraryDefaultSectionedCollectionDataSource_itemAtIndexPath___block_invoke;
      v25[3] = &unk_1E3162A70;
      v25[4] = self;
      v26 = v5;
      v17 = (void *)objc_msgSend(v13, "copyWithSource:block:", v16, v25);
      v18 = objc_msgSend(v12, "copyWithIdentifiers:block:", v17, &__block_literal_global_7925);

      v12 = (void *)v18;
    }

  }
  else
  {
    v12 = 0;
  }
  if (v24)
  {
    p_shared_owners = (unint64_t *)&v24->__shared_owners_;
    do
      v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)())v24->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v24);
    }
  }

  return v12;
}

- (MPModelLibraryDefaultSectionedCollectionDataSource)initWithRequest:(id)a3 itemQueryResults:(shared_ptr<mlcore::EntityQueryResult>)a4
{
  EntityQueryResult *ptr;
  id v7;
  MPModelLibraryDefaultSectionedCollectionDataSource *v8;
  MPModelLibraryDefaultSectionedCollectionDataSource *v9;
  MPModelLibraryDefaultSectionedCollectionDataSource *v10;
  id *p_request;
  uint64_t v12;
  MPMediaLibraryEntityTranslationContext *entityTranslationContext;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  int v19;
  __shared_weak_count *cntrl;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  NSDictionary *indexPathToContainerUniqueIDMap;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  EntityQueryResult *v29;
  std::__shared_weak_count *v30;

  ptr = a4.__ptr_;
  v7 = a3;
  v8 = -[MPModelLibraryDefaultSectionedCollectionDataSource init](self, "init");
  v9 = v8;
  v10 = v8;
  if (!v8)
    goto LABEL_19;
  p_request = (id *)&v8->_request;
  objc_storeStrong((id *)&v8->_request, a3);
  std::shared_ptr<mlcore::QueryResult>::operator=[abi:ne180100](&v9->_itemQueryResults.__ptr_, *(_QWORD *)ptr, *((_QWORD *)ptr + 1));
  -[MPModelLibraryRequest itemTranslationContext](v10->_request, "itemTranslationContext");
  v12 = objc_claimAutoreleasedReturnValue();
  entityTranslationContext = v10->_entityTranslationContext;
  v10->_entityTranslationContext = (MPMediaLibraryEntityTranslationContext *)v12;

  -[MPMediaLibraryEntityTranslationContext allowedEntityIdentifiers](v10->_entityTranslationContext, "allowedEntityIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(*p_request, "itemSortDescriptors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15 && objc_msgSend(*p_request, "sortUsingAllowedItemIdentifiers"))
    {
      v16 = -[MPModelLibraryDefaultSectionedCollectionDataSource _allowedEntityIdentifiersContainsAllPersistentIDs](v10, "_allowedEntityIdentifiersContainsAllPersistentIDs");

      if (v16)
        -[MPModelLibraryDefaultSectionedCollectionDataSource _populateIndexMap](v10, "_populateIndexMap");
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(*p_request, "legacyMediaQuery");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(*p_request, "legacyMediaQuery");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "_hasStaticEntities");

    if (v19)
    {
      cntrl = v10->_itemQueryResults.__cntrl_;
      v29 = v10->_itemQueryResults.__ptr_;
      v30 = (std::__shared_weak_count *)cntrl;
      if (cntrl)
      {
        v21 = (unint64_t *)((char *)cntrl + 8);
        do
          v22 = __ldxr(v21);
        while (__stxr(v22 + 1, v21));
      }
      -[MPModelLibraryDefaultSectionedCollectionDataSource _buildIndexPathToContainerUniqueIDMapFromItemQueryResults:](v10, "_buildIndexPathToContainerUniqueIDMapFromItemQueryResults:", &v29);
      v23 = objc_claimAutoreleasedReturnValue();
      indexPathToContainerUniqueIDMap = v10->_indexPathToContainerUniqueIDMap;
      v10->_indexPathToContainerUniqueIDMap = (NSDictionary *)v23;

      v25 = v30;
      if (v30)
      {
        p_shared_owners = (unint64_t *)&v30->__shared_owners_;
        do
          v27 = __ldaxr(p_shared_owners);
        while (__stlxr(v27 - 1, p_shared_owners));
        if (!v27)
        {
          ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
          std::__shared_weak_count::__release_weak(v25);
        }
      }
    }
  }
LABEL_19:

  return v10;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = (char *)self + 48;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  return self;
}

- (id)identifiersForSectionAtIndex:(int64_t)a3
{
  return +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet", a3);
}

- (id)indexPathForItemWithIdentifiersIntersectingSet:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t i;
  EntityQueryResult *ptr;
  _QWORD *v25;
  void *v26;
  char v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  __int128 *v32;
  __int128 v33;
  __int128 v34;
  _QWORD *v35;
  uint64_t v36;
  id v38;
  std::string v39;
  __int128 v40;
  int v41;

  v38 = a3;
  if (!self->_allowedItemPersistentIDToItemQueryResultsIndexMap.__tree_.__pair3_.__value_)
  {
    -[MPModelLibraryRequest mediaLibrary](self->_request, "mediaLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "library");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "databaseID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v13;
    v17 = v15;
    if (v16 == v17)
    {

    }
    else
    {
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
      {
        v19 = 0;
LABEL_20:

        -[MPModelRequest itemKind](self->_request, "itemKind");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_msgSend(v21, "modelClass"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = 0;
        for (i = 0; ; ++i)
        {
          if (i >= mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_))
            goto LABEL_42;
          ptr = self->_itemQueryResults.__ptr_;
          if (v19)
          {
            if (v19 == mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)ptr))
              goto LABEL_28;
          }
          else
          {
            v25 = (_QWORD *)mlcore::EntityQueryResult::propertyCaches((mlcore::EntityQueryResult *)ptr);
            if (0x84BDA12F684BDA13 * ((uint64_t)(v25[1] - *v25) >> 3) <= i)
              std::vector<mlcore::PropertyCache>::__throw_out_of_range[abi:ne180100]();
            objc_msgSend(v7, "identifiersForPropertyCache:context:", *v25 + v22, self->_entityTranslationContext);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v38, "intersectsSet:", v26);

            if ((v27 & 1) != 0)
            {
LABEL_28:
              v28 = (uint64_t *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
              if (v28[1] == *v28
                || !-[MPModelLibraryDefaultSectionedCollectionDataSource _usesSections](self, "_usesSections"))
              {
                objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, 0);
                v10 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v29 = *v28;
                if (v28[1] == *v28)
                {
LABEL_42:
                  v10 = 0;
                  goto LABEL_44;
                }
                v30 = 0;
                v31 = 0;
                v10 = 0;
                do
                {
                  v32 = (__int128 *)(v29 + v30);
                  if (*(char *)(v29 + v30 + 23) < 0)
                  {
                    std::string::__init_copy_ctor_external(&v39, *(const std::string::value_type **)v32, *((_QWORD *)v32 + 1));
                  }
                  else
                  {
                    v33 = *v32;
                    v39.__r_.__value_.__r.__words[2] = *((_QWORD *)v32 + 2);
                    *(_OWORD *)&v39.__r_.__value_.__l.__data_ = v33;
                  }
                  v34 = *(_OWORD *)(v29 + v30 + 24);
                  v41 = *(_DWORD *)(v29 + v30 + 40);
                  v40 = v34;
                  v35 = (_QWORD *)mlcore::Section::range((mlcore::Section *)&v39);
                  if (i >= *v35 && i < v35[1] + *v35)
                  {
                    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i - *v35, v31);
                    v36 = objc_claimAutoreleasedReturnValue();

                    v10 = (void *)v36;
                  }
                  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(v39.__r_.__value_.__l.__data_);
                  ++v31;
                  v29 = *v28;
                  v30 += 48;
                }
                while (v31 < 0xAAAAAAAAAAAAAAABLL * ((v28[1] - *v28) >> 4));
              }
LABEL_44:

              goto LABEL_45;
            }
          }
          v22 += 216;
        }
      }
    }
    objc_msgSend(v38, "library");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v20, "persistentID");

    goto LABEL_20;
  }
  v4 = -[MPModelLibraryDefaultSectionedCollectionDataSource numberOfSections](self, "numberOfSections");
  if (v4 >= 1)
  {
    v5 = 0;
    v6 = 0;
    while (1)
    {
      -[MPModelLibraryDefaultSectionedCollectionDataSource identifiersForSectionAtIndex:](self, "identifiersForSectionAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "intersectsSet:", v7))
        break;
      v8 = -[MPModelLibraryDefaultSectionedCollectionDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", v6);
      if (v8 < 1)
      {
LABEL_9:
        v10 = v5;
      }
      else
      {
        v9 = 0;
        while (1)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPModelLibraryDefaultSectionedCollectionDataSource identifiersForItemAtIndexPath:](self, "identifiersForItemAtIndexPath:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v38, "intersectsSet:", v11))
            break;

          if (v8 == ++v9)
            goto LABEL_9;
        }

      }
      ++v6;
      v5 = v10;
      if (v6 == v4)
        goto LABEL_45;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_44;
  }
  v10 = 0;
LABEL_45:

  return v10;
}

- (id)sectionIndexTitles
{
  _QWORD *v3;
  uint64_t ***v4;
  void *v5;
  uint64_t *v6;
  uint64_t *i;
  uint64_t *v8;
  void *v9;
  void *v10;

  v3 = (_QWORD *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  if (v3[1] == *v3 || !-[MPModelLibraryDefaultSectionedCollectionDataSource _usesSections](self, "_usesSections"))
  {
    v10 = 0;
  }
  else
  {
    v4 = (uint64_t ***)mlcore::EntityQueryResult::localizedSectionIndices((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((*v4)[1] - **v4));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = **v4;
    for (i = (*v4)[1]; v6 != i; v6 += 3)
    {
      v8 = v6;
      if (*((char *)v6 + 23) < 0)
        v8 = (uint64_t *)*v6;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);

    }
    v10 = (void *)objc_msgSend(v5, "copy");

  }
  return v10;
}

- (id)_stateDumpObject
{
  EntityQueryResult *ptr;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 *v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  void *p_p;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *request;
  unint64_t value;
  void *v27;
  void *v28;
  void *v29;
  MPModelLibraryDefaultSectionedCollectionDataSource *v31;
  std::string v32;
  __int128 v33;
  int v34;
  void *__p;
  char v36;
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[2];
  _QWORD v40[4];

  v40[2] = *MEMORY[0x1E0C80C00];
  ptr = self->_itemQueryResults.__ptr_;
  v31 = self;
  if (ptr)
  {
    v4 = (uint64_t *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)ptr);
    v6 = *v4;
    v5 = v4[1];
    v7 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *v4) >> 4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 != v6)
    {
      v9 = 0;
      if (v7 <= 1)
        v10 = 1;
      else
        v10 = v7;
      do
      {
        v11 = *v4;
        v12 = (__int128 *)(*v4 + v9);
        if (*((char *)v12 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v32, *(const std::string::value_type **)v12, *((_QWORD *)v12 + 1));
        }
        else
        {
          v13 = *v12;
          v32.__r_.__value_.__r.__words[2] = *((_QWORD *)v12 + 2);
          *(_OWORD *)&v32.__r_.__value_.__l.__data_ = v13;
        }
        v14 = *(_OWORD *)(v11 + v9 + 24);
        v34 = *(_DWORD *)(v11 + v9 + 40);
        v33 = v14;
        v15 = (void *)MEMORY[0x1E0CB3940];
        mlcore::Section::localizedTitle((mlcore::Section *)&v32);
        if (v36 >= 0)
          p_p = &__p;
        else
          p_p = __p;
        objc_msgSend(v15, "stringWithUTF8String:", p_p);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)mlcore::Section::range((mlcore::Section *)&v32);
        v19 = *(_QWORD *)(mlcore::Section::range((mlcore::Section *)&v32) + 8);
        objc_msgSend(v15, "stringWithFormat:", CFSTR("MLCore::Section(%@, {%zu, %zu}, %d)"), v17, v18, v19, mlcore::Section::sectionIndex((mlcore::Section *)&v32));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36 < 0)
          operator delete(__p);
        objc_msgSend(v8, "addObject:", v20);

        if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v32.__r_.__value_.__l.__data_);
        v9 += 48;
        --v10;
      }
      while (v10);
    }
    v39[0] = CFSTR("entityCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)v31->_itemQueryResults.__ptr_));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = CFSTR("sections");
    v40[0] = v21;
    v40[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = (void *)MEMORY[0x1E0C9AA70];
  }
  v37[0] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), v31);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  request = CFSTR("@");
  value = v31->_allowedItemPersistentIDToItemQueryResultsIndexMap.__tree_.__pair3_.__value_;
  if (v31->_request)
    request = (const __CFString *)v31->_request;
  v38[0] = v23;
  v38[1] = request;
  v37[1] = CFSTR("request");
  v37[2] = CFSTR("itemQueryResults");
  v38[2] = v22;
  v37[3] = CFSTR("allowedItemPersistentIDToItemQueryResultsIndexMap.size");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", value);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v27;
  v37[4] = CFSTR("allowedItemPersistentIDs.size");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v31->_allowedItemPersistentIDs.__end_ - v31->_allowedItemPersistentIDs.__begin_);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
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
  unint64_t *v15;
  unint64_t v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (ptr = self->_itemQueryResults.__ptr_) != 0
    && (v6 = (mlcore::EntityQueryResult *)v4[10]) != 0)
  {
    v7 = (std::__shared_weak_count *)v4[11];
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
      ptr = self->_itemQueryResults.__ptr_;
    }
    v10 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)ptr);
    if (v10 == mlcore::EntityQueryResult::entityCount(v6))
    {
      v11 = 0;
      while (1)
      {
        v12 = mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
        v13 = v11 >= v12;
        if (v11 >= v12)
          break;
        v14 = mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
        ++v11;
        if (v14 != mlcore::EntityQueryResult::persistentIDAtIndex(v6))
          goto LABEL_12;
      }
    }
    else
    {
LABEL_12:
      v13 = 0;
    }
    if (v7)
    {
      v15 = (unint64_t *)&v7->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (_NSRange)optionalSectionIndexTitlesRange
{
  _QWORD *v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v3 = (_QWORD *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  if (v3[1] == *v3 || !-[MPModelLibraryDefaultSectionedCollectionDataSource _usesSections](self, "_usesSections"))
  {
    v4 = 0;
    v5 = 0;
  }
  else
  {
    v4 = mlcore::EntityQueryResult::optionalLocalizedSectionIndicesRange((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  }
  result.length = v5;
  result.location = v4;
  return result;
}

- (int64_t)indexOfSectionForSectionIndexTitleAtIndex:(int64_t)a3
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 *v18;
  __int128 v19;
  __int128 v20;
  int v21;
  int64_t v22;
  int64_t v23;
  std::string __p;
  __int128 v27;
  int v28;

  v5 = (uint64_t *)mlcore::EntityQueryResult::sections((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
  if (v5[1] == *v5 || !-[MPModelLibraryDefaultSectionedCollectionDataSource _usesSections](self, "_usesSections"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = *v5;
  v6 = v5[1];
  -[MPModelLibraryDefaultSectionedCollectionDataSource sectionIndexTitles](self, "sectionIndexTitles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = v6 - v7;
  v11 = v10 / 48;

  if (v9 - 1 == a3)
    return v11 - 1;
  if (v10 < 1)
    return 0x7FFFFFFFFFFFFFFFLL;
  v13 = 0;
  v14 = 0;
  if (v11 <= 1)
    v15 = 1;
  else
    v15 = v10 / 48;
  v16 = v15 - 1;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v17 = *v5;
    v18 = (__int128 *)(*v5 + v13);
    if (*((char *)v18 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v18, *((_QWORD *)v18 + 1));
    }
    else
    {
      v19 = *v18;
      __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v18 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v19;
    }
    v20 = *(_OWORD *)(v17 + v13 + 24);
    v28 = *(_DWORD *)(v17 + v13 + 40);
    v27 = v20;
    v21 = mlcore::Section::sectionIndex((mlcore::Section *)&__p);
    v22 = v21;
    v23 = v14 - 1;
    if (v21 <= a3)
      v23 = v12;
    if (v21 == a3)
      v12 = v14;
    else
      v12 = v23;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v22 >= a3)
      break;
    v13 += 48;
  }
  while (v16 != v14++);
  return v12;
}

- (void)_populateIndexMap
{
  uint64_t *v3;
  uint64_t **p_allowedItemPersistentIDToItemQueryResultsIndexMap;
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
  p_allowedItemPersistentIDToItemQueryResultsIndexMap = (uint64_t **)&self->_allowedItemPersistentIDToItemQueryResultsIndexMap;
  while ((unint64_t)v3 < mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_))
  {
    v25 = (uint64_t *)mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
    std::__tree<std::__value_type<long long,unsigned long>,std::__map_value_compare<long long,std::__value_type<long long,unsigned long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,unsigned long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(p_allowedItemPersistentIDToItemQueryResultsIndexMap, (uint64_t)v25, &v25)[5] = v3;
    v3 = (uint64_t *)((char *)v3 + 1);
  }
  -[MPMediaLibraryEntityTranslationContext allowedEntityIdentifiers](self->_entityTranslationContext, "allowedEntityIdentifiers");
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

        for (j = self->_allowedItemPersistentIDToItemQueryResultsIndexMap.__tree_.__pair1_.__value_.__left_;
              j;
              j = (_QWORD *)*j)
        {
          v13 = j[4];
          if (v11 >= v13)
          {
            if (v13 >= v11)
            {
              end = self->_allowedItemPersistentIDs.__end_;
              value = self->_allowedItemPersistentIDs.__end_cap_.__value_;
              if (end >= value)
              {
                begin = self->_allowedItemPersistentIDs.__begin_;
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
                  begin = self->_allowedItemPersistentIDs.__begin_;
                  end = self->_allowedItemPersistentIDs.__end_;
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
                self->_allowedItemPersistentIDs.__begin_ = v23;
                self->_allowedItemPersistentIDs.__end_ = v16;
                self->_allowedItemPersistentIDs.__end_cap_.__value_ = (int64_t *)(v21 + 8 * v22);
                if (begin)
                  operator delete(begin);
              }
              else
              {
                *end = v11;
                v16 = end + 1;
              }
              self->_allowedItemPersistentIDs.__end_ = v16;
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
  -[MPMediaLibraryEntityTranslationContext allowedEntityIdentifiers](self->_entityTranslationContext, "allowedEntityIdentifiers", 0);
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

- (id)_buildIndexPathToContainerUniqueIDMapFromItemQueryResults:(shared_ptr<mlcore::EntityQueryResult>)a3
{
  mlcore::EntityQueryResult **ptr;
  void *v5;
  void *v6;
  unint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  ptr = (mlcore::EntityQueryResult **)a3.__ptr_;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", mlcore::EntityQueryResult::entityCount(*(mlcore::EntityQueryResult **)a3.__ptr_));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", mlcore::EntityQueryResult::entityCount(*ptr));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0;
        i < mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
        ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "objectForKey:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue") + 1;

    }
    else
    {
      v11 = 1;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v12);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v8);

  }
  v15 = (void *)objc_msgSend(v6, "copy");

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  MPModelLibraryDefaultSectionedCollectionDataSource *v4;
  BOOL v5;

  v4 = (MPModelLibraryDefaultSectionedCollectionDataSource *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (-[MPModelLibraryDefaultSectionedCollectionDataSource isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[MPModelLibraryDefaultSectionedCollectionDataSource hasSameContentAsDataSource:](self, "hasSameContentAsDataSource:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
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
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;

  v3 = MSVHasherSharedSeed();
  v4 = 0;
  v58 = 0;
  v54 = v3 ^ 0x736F6D6570736575;
  v55 = v5 ^ 0x646F72616E646F6DLL;
  v56 = v3 ^ 0x6C7967656E657261;
  v57 = v5 ^ 0x7465646279746573;
  while (v4 < mlcore::EntityQueryResult::entityCount((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_))
  {
    v6 = mlcore::EntityQueryResult::persistentIDAtIndex((mlcore::EntityQueryResult *)self->_itemQueryResults.__ptr_);
    v7 = v58;
    if ((v58 & 0x400000000000000) != 0)
    {
      if ((v58 & 0x300000000000000) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v58);

        v7 = v58;
      }
      v14 = v7 & 0xFFFFFFFFFFFFFFLL | (v6 << 32);
      v15 = (v54 + v55) ^ __ROR8__(v55, 51);
      v16 = v56 + (v14 ^ v57);
      v17 = __ROR8__(v14 ^ v57, 48);
      v18 = (v16 ^ v17) + __ROR8__(v54 + v55, 32);
      v19 = v18 ^ __ROR8__(v16 ^ v17, 43);
      v20 = v16 + v15;
      v56 = __ROR8__(v20, 32);
      v57 = v19;
      v54 = v18 ^ v14;
      v55 = v20 ^ __ROR8__(v15, 47);
      v7 = v7 & 0xFF00000000000000 | HIDWORD(v6);
    }
    else
    {
      if ((v58 & 0x7FFFFFFFFFFFFFFLL) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v58);

        v7 = v58;
      }
      v8 = (v54 + v55) ^ __ROR8__(v55, 51);
      v9 = v56 + (v57 ^ v6);
      v10 = __ROR8__(v57 ^ v6, 48);
      v11 = (v9 ^ v10) + __ROR8__(v54 + v55, 32);
      v12 = v11 ^ __ROR8__(v9 ^ v10, 43);
      v13 = v9 + v8;
      v56 = __ROR8__(v13, 32);
      v57 = v12;
      v54 = v11 ^ v6;
      v55 = v13 ^ __ROR8__(v8, 47);
    }
    v58 = v7 + 0x800000000000000;
    ++v4;
  }
  v23 = (v54 + v55) ^ __ROR8__(v55, 51);
  v24 = v56 + (v57 ^ v58);
  v25 = __ROR8__(v57 ^ v58, 48);
  v26 = (v24 ^ v25) + __ROR8__(v54 + v55, 32);
  v27 = v26 ^ __ROR8__(v24 ^ v25, 43);
  v28 = v24 + v23;
  v29 = v28 ^ __ROR8__(v23, 47);
  v30 = (v26 ^ v58) + v29;
  v31 = v30 ^ __ROR8__(v29, 51);
  v32 = (__ROR8__(v28, 32) ^ 0xFFLL) + v27;
  v33 = __ROR8__(v27, 48);
  v34 = __ROR8__(v30, 32) + (v32 ^ v33);
  v35 = v34 ^ __ROR8__(v32 ^ v33, 43);
  v36 = v31 + v32;
  v37 = v36 ^ __ROR8__(v31, 47);
  v38 = v37 + v34;
  v39 = v38 ^ __ROR8__(v37, 51);
  v40 = __ROR8__(v36, 32) + v35;
  v41 = __ROR8__(v35, 48);
  v42 = __ROR8__(v38, 32) + (v40 ^ v41);
  v43 = v42 ^ __ROR8__(v40 ^ v41, 43);
  v44 = v39 + v40;
  v45 = v44 ^ __ROR8__(v39, 47);
  v46 = v45 + v42;
  v47 = v46 ^ __ROR8__(v45, 51);
  v48 = __ROR8__(v44, 32) + v43;
  v49 = __ROR8__(v43, 48);
  v50 = __ROR8__(v46, 32) + (v48 ^ v49);
  return (v47 + v48) ^ __ROR8__(v47, 47) ^ v50 ^ __ROR8__(v47 + v48, 32) ^ v50 ^ __ROR8__(v48 ^ v49, 43);
}

- (MPModelLibraryRequest)request
{
  return self->_request;
}

- (NSDictionary)indexPathToContainerUniqueIDMap
{
  return self->_indexPathToContainerUniqueIDMap;
}

- (void)setIndexPathToContainerUniqueIDMap:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathToContainerUniqueIDMap, a3);
}

- (shared_ptr<mlcore::EntityQueryResult>)itemQueryResults
{
  EntityQueryResult **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<mlcore::EntityQueryResult> result;

  cntrl = self->_itemQueryResults.__cntrl_;
  *v2 = self->_itemQueryResults.__ptr_;
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

- (void).cxx_destruct
{
  int64_t *begin;

  std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&self->_itemQueryResults);
  objc_storeStrong((id *)&self->_indexPathToContainerUniqueIDMap, 0);
  objc_storeStrong((id *)&self->_request, 0);
  std::__tree<std::__value_type<long long,unsigned long>,std::__map_value_compare<long long,std::__value_type<long long,unsigned long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,unsigned long>>>::destroy((_QWORD *)self->_allowedItemPersistentIDToItemQueryResultsIndexMap.__tree_.__pair1_.__value_.__left_);
  begin = self->_allowedItemPersistentIDs.__begin_;
  if (begin)
  {
    self->_allowedItemPersistentIDs.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_entityTranslationContext, 0);
}

void __84__MPModelLibraryDefaultSectionedCollectionDataSource_identifiersForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContainerUniqueID:", v3);

}

void __70__MPModelLibraryDefaultSectionedCollectionDataSource_itemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContainerUniqueID:", v3);

}

@end
