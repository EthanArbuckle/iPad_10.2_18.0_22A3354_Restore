@implementation MPLazySectionedCollection

- (id)identifiersForItemAtIndexPath:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  _MPLazySectionedCollectionStorage *storage;
  _QWORD *left;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  uint64_t *v17;
  void *v19;
  void *v20;
  objc_super v21;
  uint64_t v22;
  uint8_t buf[4];
  MPLazySectionedCollection *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "length") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPLazySectionedCollection.mm"), 339, CFSTR("Index path must have two components."));

  }
  v6 = objc_msgSend(v5, "item");
  if (v6 >= -[MPLazySectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", objc_msgSend(v5, "section")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPLazySectionedCollection.mm"), 340, CFSTR("Request for item identifiers out of bound in section (%lld): %lld"), objc_msgSend(v5, "section"), objc_msgSend(v5, "item"));

  }
  v7 = -[MPSectionedCollection globalIndexForIndexPath:](self, "globalIndexForIndexPath:", v5);
  v22 = v7;
  os_unfair_recursive_lock_lock_with_options();
  storage = self->_storage;
  left = storage->_itemIdentifierSetMap.__tree_.__pair1_.__value_.__left_;
  if (!left)
  {
LABEL_11:
    -[MPLazySectionedCollection dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "identifiersForItemAtIndexPath:", v5);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v14 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218754;
          v24 = self;
          v25 = 2114;
          v26 = (id)objc_opt_class();
          v27 = 2048;
          v28 = v12;
          v29 = 2114;
          v30 = v5;
          v15 = v26;
          _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_ERROR, "MPLazySectionedCollection %p: identifiersForItemAtIndexPath dataSource failed to produce identifiers: dataSource=<%{public}@ %p> indexPath=%{public}@", buf, 0x2Au);

        }
        +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v21.receiver = self;
      v21.super_class = (Class)MPLazySectionedCollection;
      -[MPSectionedCollection identifiersForItemAtIndexPath:](&v21, sel_identifiersForItemAtIndexPath_, v5);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v16 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v24 = self;
          v25 = 2114;
          v26 = v5;
          _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_ERROR, "MPLazySectionedCollection %p: identifiersForItemAtIndexPath super failed to produce identifiers: indexPath=%{public}@", buf, 0x16u);
        }

        v13 = 0;
      }
    }
    v17 = std::__tree<std::__value_type<long,MPIdentifierSet * {__strong}>,std::__map_value_compare<long,std::__value_type<long,MPIdentifierSet * {__strong}>,std::less<long>,true>,std::allocator<std::__value_type<long,MPIdentifierSet * {__strong}>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long const&>,std::tuple<>>((uint64_t **)&self->_storage->_itemIdentifierSetMap, v7, &v22);
    objc_storeStrong((id *)v17 + 5, v13);

    goto LABEL_21;
  }
  v10 = storage->_itemIdentifierSetMap.__tree_.__pair1_.__value_.__left_;
  while (1)
  {
    v11 = v10[4];
    if (v7 >= v11)
      break;
LABEL_10:
    v10 = (_QWORD *)*v10;
    if (!v10)
      goto LABEL_11;
  }
  if (v11 < v7)
  {
    ++v10;
    goto LABEL_10;
  }
  v13 = (id)*std::map<long,MPIdentifierSet * {__strong}>::at(left, v7);
  if (!v13)
    goto LABEL_11;
LABEL_21:
  os_unfair_recursive_lock_unlock();

  return v13;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  int64_t *begin;
  int64_t v7;
  int64_t v8;
  _MPLazySectionedCollectionStorage *storage;
  unint64_t v10;
  int64_t *v11;
  int64_t *end;
  char *v13;
  int64_t *v14;
  uint64_t v15;
  int64_t *v16;
  int64_t *v17;
  int64_t *v18;
  int64_t *v19;
  int64_t v20;
  _MPLazySectionedCollectionStorage *v21;
  int64_t *value;
  int64_t *v23;
  int64_t *v24;
  int64_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  int64_t *v31;
  int64_t v32;
  void *v35;
  void *v36;
  MPLazySectionedCollectionDataSource *v37;

  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPLazySectionedCollection.mm"), 203, CFSTR("Request for number of items in section out of bounds [negative index]: %lld"), a3);

  }
  if (-[MPLazySectionedCollection numberOfSections](self, "numberOfSections") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPLazySectionedCollection.mm"), 204, CFSTR("Request for number of items in section out of bounds: %lld"), a3);

  }
  os_unfair_recursive_lock_lock_with_options();
  begin = self->_storage->_cachedNumberOfItemsInSections.__begin_;
  v7 = self->_storage->_cachedNumberOfItemsInSections.__end_ - begin;
  if (v7 <= a3 || (v8 = begin[a3], v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v37 = self->_dataSource;
    v8 = -[MPLazySectionedCollectionDataSource numberOfItemsInSection:](v37, "numberOfItemsInSection:", a3);
    storage = self->_storage;
    v10 = a3 + 1;
    v11 = storage->_cachedNumberOfItemsInSections.__begin_;
    if (a3 + 1 > (unint64_t)(storage->_cachedNumberOfItemsInSections.__end_cap_.__value_ - v11))
    {
      if (v10 >> 61)
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      end = storage->_cachedNumberOfItemsInSections.__end_;
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v10);
      v14 = (int64_t *)&v13[((char *)end - (char *)v11) & 0xFFFFFFFFFFFFFFF8];
      v16 = (int64_t *)&v13[8 * v15];
      v17 = storage->_cachedNumberOfItemsInSections.__begin_;
      v18 = storage->_cachedNumberOfItemsInSections.__end_;
      v19 = v14;
      if (v18 != v17)
      {
        v19 = v14;
        do
        {
          v20 = *--v18;
          *--v19 = v20;
        }
        while (v18 != v17);
      }
      storage->_cachedNumberOfItemsInSections.__begin_ = v19;
      storage->_cachedNumberOfItemsInSections.__end_ = v14;
      storage->_cachedNumberOfItemsInSections.__end_cap_.__value_ = v16;
      if (v17)
        operator delete(v17);
    }
    if (v7 <= a3)
    {
      do
      {
        v21 = self->_storage;
        v23 = v21->_cachedNumberOfItemsInSections.__end_;
        value = v21->_cachedNumberOfItemsInSections.__end_cap_.__value_;
        if (v23 >= value)
        {
          v25 = v21->_cachedNumberOfItemsInSections.__begin_;
          v26 = v23 - v25;
          v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 61)
            std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
          v28 = (char *)value - (char *)v25;
          if (v28 >> 2 > v27)
            v27 = v28 >> 2;
          if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8)
            v29 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v29 = v27;
          if (v29)
          {
            v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v29);
            v25 = v21->_cachedNumberOfItemsInSections.__begin_;
            v23 = v21->_cachedNumberOfItemsInSections.__end_;
          }
          else
          {
            v30 = 0;
          }
          v31 = (int64_t *)(v29 + 8 * v26);
          *v31 = 0x7FFFFFFFFFFFFFFFLL;
          v24 = v31 + 1;
          while (v23 != v25)
          {
            v32 = *--v23;
            *--v31 = v32;
          }
          v21->_cachedNumberOfItemsInSections.__begin_ = v31;
          v21->_cachedNumberOfItemsInSections.__end_ = v24;
          v21->_cachedNumberOfItemsInSections.__end_cap_.__value_ = (int64_t *)(v29 + 8 * v30);
          if (v25)
            operator delete(v25);
        }
        else
        {
          *v23 = 0x7FFFFFFFFFFFFFFFLL;
          v24 = v23 + 1;
        }
        v21->_cachedNumberOfItemsInSections.__end_ = v24;
      }
      while (v7++ != a3);
    }
    self->_storage->_cachedNumberOfItemsInSections.__begin_[a3] = v8;

  }
  os_unfair_recursive_lock_unlock();
  return v8;
}

- (int64_t)numberOfSections
{
  _MPLazySectionedCollectionStorage *storage;
  MPLazySectionedCollectionDataSource *v4;
  int64_t cachedNumberOfSections;

  os_unfair_recursive_lock_lock_with_options();
  storage = self->_storage;
  if (!storage->_hasValidCachedNumberOfSections)
  {
    v4 = self->_dataSource;
    self->_storage->_cachedNumberOfSections = -[MPLazySectionedCollectionDataSource numberOfSections](v4, "numberOfSections");
    self->_storage->_hasValidCachedNumberOfSections = 1;

    storage = self->_storage;
  }
  cachedNumberOfSections = storage->_cachedNumberOfSections;
  os_unfair_recursive_lock_unlock();
  return cachedNumberOfSections;
}

- (MPLazySectionedCollectionDataSource)dataSource
{
  return self->_dataSource;
}

- (id)allItems
{
  void *v3;
  int64_t i;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[MPSectionedCollection totalItemCount](self, "totalItemCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < -[MPSectionedCollection totalItemCount](self, "totalItemCount"); ++i)
  {
    -[MPSectionedCollection indexPathForGlobalIndex:](self, "indexPathForGlobalIndex:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPLazySectionedCollection itemAtIndexPath:](self, "itemAtIndexPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(v3, "addObject:", v6);

  }
  return v3;
}

void __36__MPLazySectionedCollection_dealloc__block_invoke(uint64_t a1)
{

}

- (void)enumerateItemsInSectionAtIndex:(int64_t)a3 usingBlock:(id)a4
{
  void (**v6)(id, void *, uint64_t, _BYTE *);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v6 = (void (**)(id, void *, uint64_t, _BYTE *))a4;
  v12 = 0;
  v7 = -[MPLazySectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", a3);
  if (v7 >= 1)
  {
    v8 = 1;
    do
    {
      v9 = (void *)MEMORY[0x19403A624]();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v8 - 1, a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPLazySectionedCollection itemAtIndexPath:](self, "itemAtIndexPath:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v11, v8 - 1, &v12);

      objc_autoreleasePoolPop(v9);
      if (v8 >= v7)
        break;
      ++v8;
    }
    while (!v12);
  }

}

- (id)itemAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  MPLazySectionedCollectionDataSource *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _MPLazySectionedCollectionStorage *storage;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t **p_pair1;
  uint64_t *left;
  uint64_t **v17;
  uint64_t v18;
  uint64_t **v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;

  v5 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSCache objectForKey:](self->_storage->_itemsCache, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = self->_dataSource;
    if (objc_msgSend(v5, "length") != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPLazySectionedCollection.mm"), 232, CFSTR("Index path must have two components."));

    }
    v8 = objc_msgSend(v5, "item");
    if (v8 >= -[MPLazySectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", objc_msgSend(v5, "section")))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPLazySectionedCollection.mm"), 233, CFSTR("Request for item out of bound in section (%lld): %lld"), objc_msgSend(v5, "section"), objc_msgSend(v5, "item"));

    }
    -[MPLazySectionedCollectionDataSource itemAtIndexPath:](v7, "itemAtIndexPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v9 = -[MPSectionedCollection globalIndexForIndexPath:](self, "globalIndexForIndexPath:", v5);
      v28 = v9;
      -[NSCache setObject:forKey:](self->_storage->_itemsCache, "setObject:forKey:", v6, v5);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v6;
        if (objc_msgSend(v5, "length") == 1)
        {
          objc_msgSend(v10, "identifiers");
          v27 = objc_claimAutoreleasedReturnValue();
          storage = self->_storage;
          v12 = objc_msgSend(v5, "section");
          v13 = v12;
          left = (uint64_t *)storage->_sectionIdentifierSetMap.__tree_.__pair1_.__value_.__left_;
          p_pair1 = (uint64_t **)&storage->_sectionIdentifierSetMap.__tree_.__pair1_;
          v14 = left;
          if (left)
          {
            while (1)
            {
              while (1)
              {
                v17 = (uint64_t **)v14;
                v18 = v14[4];
                if (v12 >= v18)
                  break;
                v14 = *v17;
                v19 = v17;
                if (!*v17)
                  goto LABEL_18;
              }
              if (v18 >= v12)
                break;
              v14 = v17[1];
              if (!v14)
              {
                v19 = v17 + 1;
                goto LABEL_18;
              }
            }
          }
          else
          {
            v19 = p_pair1;
            v17 = p_pair1;
LABEL_18:
            v23 = (uint64_t *)operator new(0x30uLL);
            v23[4] = v13;
            v23[5] = 0;
            std::__tree<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::__map_value_compare<long long,std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>>>::__insert_node_at(p_pair1 - 1, (uint64_t)v17, v19, v23);
            v17 = (uint64_t **)v23;
          }
          v22 = v17[5];
          v17[5] = (uint64_t *)v27;
        }
        else
        {
          objc_msgSend(v10, "identifiers");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = std::__tree<std::__value_type<long,MPIdentifierSet * {__strong}>,std::__map_value_compare<long,std::__value_type<long,MPIdentifierSet * {__strong}>,std::less<long>,true>,std::allocator<std::__value_type<long,MPIdentifierSet * {__strong}>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long const&>,std::tuple<>>((uint64_t **)&self->_storage->_itemIdentifierSetMap, v9, &v28);
          v22 = (uint64_t *)v21[5];
          v21[5] = v20;
        }

      }
    }

  }
  os_unfair_recursive_lock_unlock();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (void)enumerateSectionsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, _BYTE *);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (void (**)(id, void *, uint64_t, _BYTE *))a3;
  v9 = 0;
  v5 = -[MPLazySectionedCollection numberOfSections](self, "numberOfSections");
  if (v5 >= 1)
  {
    v6 = 1;
    do
    {
      v7 = (void *)MEMORY[0x19403A624]();
      -[MPLazySectionedCollection sectionAtIndex:](self, "sectionAtIndex:", v6 - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v8, v6 - 1, &v9);

      objc_autoreleasePoolPop(v7);
      if (v6 >= v5)
        break;
      ++v6;
    }
    while (!v9);
  }

}

- (id)firstSection
{
  void *v3;

  if (-[MPLazySectionedCollection numberOfSections](self, "numberOfSections") < 1)
  {
    v3 = 0;
  }
  else
  {
    -[MPLazySectionedCollection sectionAtIndex:](self, "sectionAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)sectionAtIndex:(int64_t)a3
{
  void *v6;
  void *v7;
  MPLazySectionedCollectionDataSource *v8;
  void *v10;
  void *v11;

  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPLazySectionedCollection.mm"), 186, CFSTR("Request for section out of bounds [negative index]: %lld"), a3);

  }
  if (-[MPLazySectionedCollection numberOfSections](self, "numberOfSections") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPLazySectionedCollection.mm"), 187, CFSTR("Request for section out of bounds: %lld"), a3);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_lock_with_options();
  -[NSCache objectForKey:](self->_storage->_sectionsCache, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = self->_dataSource;
    -[MPLazySectionedCollectionDataSource sectionAtIndex:](v8, "sectionAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[NSCache setObject:forKey:](self->_storage->_sectionsCache, "setObject:forKey:", v7, v6);

  }
  os_unfair_recursive_lock_unlock();

  return v7;
}

- (MPLazySectionedCollection)initWithDataSource:(id)a3
{
  id v5;
  MPLazySectionedCollection *v6;
  MPLazySectionedCollection *v7;
  _MPLazySectionedCollectionStorage *v8;
  _MPLazySectionedCollectionStorage *storage;
  NSCache *v10;
  _MPLazySectionedCollectionStorage *v11;
  NSCache *itemsCache;
  NSCache *v13;
  _MPLazySectionedCollectionStorage *v14;
  NSCache *sectionsCache;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MPLazySectionedCollection;
  v6 = -[MPSectionedCollection init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = objc_alloc_init(_MPLazySectionedCollectionStorage);
    storage = v7->_storage;
    v7->_storage = v8;

    v10 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    v11 = v7->_storage;
    itemsCache = v11->_itemsCache;
    v11->_itemsCache = v10;

    -[NSCache setCountLimit:](v7->_storage->_itemsCache, "setCountLimit:", 1000);
    v13 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    v14 = v7->_storage;
    sectionsCache = v14->_sectionsCache;
    v14->_sectionsCache = v13;

    -[NSCache setCountLimit:](v7->_storage->_sectionsCache, "setCountLimit:", 50);
    v7->_lock = 0;
  }

  return v7;
}

- (void)dealloc
{
  MPLazySectionedCollectionDataSource *v3;
  _MPLazySectionedCollectionStorage *v4;
  NSObject *v5;
  _MPLazySectionedCollectionStorage *v6;
  MPLazySectionedCollectionDataSource *v7;
  objc_super v8;
  _QWORD block[4];
  MPLazySectionedCollectionDataSource *v10;
  _MPLazySectionedCollectionStorage *v11;

  v3 = self->_dataSource;
  v4 = self->_storage;
  dispatch_get_global_queue(17, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MPLazySectionedCollection_dealloc__block_invoke;
  block[3] = &unk_1E31635F8;
  v10 = v3;
  v11 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_async(v5, block);

  v8.receiver = self;
  v8.super_class = (Class)MPLazySectionedCollection;
  -[MPLazySectionedCollection dealloc](&v8, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDataSource:", self->_dataSource);
  *((_BYTE *)result + 40) = self->_disableMissingIdentifiersFaults;
  return result;
}

- (id)identifiersForSectionAtIndex:(int64_t)a3
{
  _MPLazySectionedCollectionStorage *storage;
  _QWORD *left;
  _QWORD *v8;
  int64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  id v17;
  void *v18;
  objc_super v19;
  uint64_t v20;
  uint8_t buf[4];
  MPLazySectionedCollection *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  if (-[MPLazySectionedCollection numberOfSections](self, "numberOfSections") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPLazySectionedCollection.mm"), 370, CFSTR("Request for identifiers for section out of bounds: %lld"), a3);

  }
  os_unfair_recursive_lock_lock_with_options();
  storage = self->_storage;
  left = storage->_sectionIdentifierSetMap.__tree_.__pair1_.__value_.__left_;
  if (!left)
  {
LABEL_10:
    -[MPLazySectionedCollection dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "identifiersForSectionAtIndex:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
LABEL_19:
        v15 = std::__tree<std::__value_type<long,MPIdentifierSet * {__strong}>,std::__map_value_compare<long,std::__value_type<long,MPIdentifierSet * {__strong}>,std::less<long>,true>,std::allocator<std::__value_type<long,MPIdentifierSet * {__strong}>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long const&>,std::tuple<>>((uint64_t **)&self->_storage->_sectionIdentifierSetMap, a3, &v20);
        objc_storeStrong((id *)v15 + 5, v11);

        goto LABEL_20;
      }
      if (!self->_disableMissingIdentifiersFaults)
      {
        v12 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134218754;
          v22 = self;
          v23 = 2114;
          v24 = (id)objc_opt_class();
          v25 = 2048;
          v26 = v10;
          v27 = 2048;
          v28 = a3;
          v13 = v24;
          _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_FAULT, "MPLazySectionedCollection %p: identifiersForSectionAtIndex dataSource failed to produce identifiers: dataSource=<%{public}@ %p> sectionIndex=%ld", buf, 0x2Au);

        }
      }
      +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)MPLazySectionedCollection;
      -[MPSectionedCollection identifiersForSectionAtIndex:](&v19, sel_identifiersForSectionAtIndex_, a3);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v14;
    goto LABEL_19;
  }
  v8 = storage->_sectionIdentifierSetMap.__tree_.__pair1_.__value_.__left_;
  while (1)
  {
    v9 = v8[4];
    if (v9 <= a3)
      break;
LABEL_9:
    v8 = (_QWORD *)*v8;
    if (!v8)
      goto LABEL_10;
  }
  if (v9 < a3)
  {
    ++v8;
    goto LABEL_9;
  }
  v17 = (id)*std::map<long,MPIdentifierSet * {__strong}>::at(left, a3);
  v11 = v17;
  if (!v17)
    goto LABEL_10;
LABEL_20:
  os_unfair_recursive_lock_unlock();
  return v11;
}

- (id)indexPathForItemWithIdentifiersIntersectingSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  -[MPLazySectionedCollection dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    os_unfair_recursive_lock_lock_with_options();
    objc_msgSend(v5, "indexPathForItemWithIdentifiersIntersectingSet:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MPLazySectionedCollection;
    -[MPSectionedCollection indexPathForItemWithIdentifiersIntersectingSet:](&v8, sel_indexPathForItemWithIdentifiersIntersectingSet_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_safeStateDumpObject
{
  uint64_t v3;
  void *v4;
  MPLazySectionedCollectionDataSource *dataSource;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  dataSource = self->_dataSource;
  if (!dataSource)
    dataSource = (MPLazySectionedCollectionDataSource *)CFSTR("@");
  v9[0] = v3;
  v9[1] = dataSource;
  v8[1] = CFSTR("dataSource");
  v8[2] = CFSTR("storage");
  v9[2] = self->_storage;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  MPMutableSectionedCollection *v4;
  MPMutableSectionedCollection *v5;
  MPMutableSectionedCollection *v6;
  _QWORD v8[4];
  MPMutableSectionedCollection *v9;
  MPLazySectionedCollection *v10;

  v4 = objc_alloc_init(MPMutableSectionedCollection);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__MPLazySectionedCollection_mutableCopyWithZone___block_invoke;
  v8[3] = &unk_1E3157028;
  v5 = v4;
  v9 = v5;
  v10 = self;
  -[MPLazySectionedCollection enumerateSectionsUsingBlock:](self, "enumerateSectionsUsingBlock:", v8);
  v6 = v5;

  return v6;
}

- (id)firstItem
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (-[MPSectionedCollection totalItemCount](self, "totalItemCount") >= 1
    && (-[MPSectionedCollection indexPathForGlobalIndex:](self, "indexPathForGlobalIndex:", 0),
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    -[MPLazySectionedCollection itemAtIndexPath:](self, "itemAtIndexPath:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)hasSameContentAsSectionedCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    objc_msgSend(v4, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPLazySectionedCollection dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_msgSend(v6, "hasSameContentAsDataSource:", v5);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)lastItem
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = -[MPSectionedCollection totalItemCount](self, "totalItemCount");
  if (v3 >= 1
    && (-[MPSectionedCollection indexPathForGlobalIndex:](self, "indexPathForGlobalIndex:", v3 - 1),
        (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    -[MPLazySectionedCollection itemAtIndexPath:](self, "itemAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  void (**v4)(id, void *, void *, _BYTE *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  v13 = 0;
  v5 = -[MPLazySectionedCollection numberOfSections](self, "numberOfSections");
  if (v5 >= 1)
  {
    v6 = 0;
    do
    {
      v7 = -[MPLazySectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", v6);
      v8 = v13;
      if (v7 >= 1 && !v13)
      {
        v9 = 1;
        do
        {
          v10 = (void *)MEMORY[0x19403A624]();
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9 - 1, v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPLazySectionedCollection itemAtIndexPath:](self, "itemAtIndexPath:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v12, v11, &v13);

          objc_autoreleasePoolPop(v10);
          v8 = v13;
          if (v9 >= v7)
            break;
          ++v9;
        }
        while (!v13);
      }
      ++v6;
    }
    while (v6 < v5 && !v8);
  }

}

- (id)itemsInSectionAtIndex:(int64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[MPLazySectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", a3));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__MPLazySectionedCollection_itemsInSectionAtIndex___block_invoke;
  v8[3] = &unk_1E3157050;
  v6 = v5;
  v9 = v6;
  -[MPLazySectionedCollection enumerateItemsInSectionAtIndex:usingBlock:](self, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v8);

  return v6;
}

- (id)lastSection
{
  uint64_t v3;
  void *v4;

  v3 = -[MPLazySectionedCollection numberOfSections](self, "numberOfSections");
  if (v3 < 1)
  {
    v4 = 0;
  }
  else
  {
    -[MPLazySectionedCollection sectionAtIndex:](self, "sectionAtIndex:", v3 - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)allSections
{
  uint64_t v3;
  void *v4;
  uint64_t i;
  void *v6;

  v3 = -[MPLazySectionedCollection numberOfSections](self, "numberOfSections");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      -[MPLazySectionedCollection sectionAtIndex:](self, "sectionAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(v4, "addObject:", v6);

    }
  }
  return v4;
}

- (void)_disableMissingIdentifiersFaults
{
  self->_disableMissingIdentifiersFaults = 1;
}

- (BOOL)isEqual:(id)a3
{
  MPLazySectionedCollection *v4;
  BOOL v5;

  v4 = (MPLazySectionedCollection *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (-[MPLazySectionedCollection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[MPLazySectionedCollection hasSameContentAsSectionedCollection:](self, "hasSameContentAsSectionedCollection:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MPLazySectionedCollection dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

void __51__MPLazySectionedCollection_itemsInSectionAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __49__MPLazySectionedCollection_mutableCopyWithZone___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "appendSection:");
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "itemsInSectionAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendItems:", v6);

}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

@end
