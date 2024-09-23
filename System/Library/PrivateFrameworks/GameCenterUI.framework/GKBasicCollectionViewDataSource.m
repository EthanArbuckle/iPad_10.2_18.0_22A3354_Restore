@implementation GKBasicCollectionViewDataSource

- (GKBasicCollectionViewDataSource)init
{
  GKBasicCollectionViewDataSource *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKBasicCollectionViewDataSource;
  result = -[GKCollectionViewDataSource init](&v3, sel_init);
  if (result)
    result->_pageSize = 20;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setItemsNoNotify:", self->_items);
  objc_msgSend(v4, "setFilterPredicate:", self->_filterPredicate);
  objc_msgSend(v4, "setPageSize:", self->_pageSize);
  objc_msgSend(v4, "setPreloadedRange:", self->_preloadedRange.location, self->_preloadedRange.length);
  return v4;
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSPredicate *filterPredicate;
  id v11;
  objc_super v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _gkTabStringForTabLevel();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)GKBasicCollectionViewDataSource;
  -[GKCollectionViewDataSource _gkDescriptionWithChildren:](&v13, sel__gkDescriptionWithChildren_, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("%@%@"), v6, v9);
  filterPredicate = self->_filterPredicate;
  if (filterPredicate)
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("%@    predicate: %@\n"), v6, filterPredicate);
    objc_msgSend(v5, "appendFormat:", CFSTR("%@}\n"), v6);
  }
  v11 = (id)_gkUnicodifyDescription();

  return v5;
}

- (void)collectionViewDidBecomeInactive:(id)a3
{
  -[GKBasicCollectionViewDataSource setFilterPredicate:](self, "setFilterPredicate:", 0);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4)
    return 0;
  else
    return -[NSArray count](self->_items, "count", a3);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (void)removeItemAtIndexPath:(id)a3 completionHandler:(id)a4
{
  void *v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(a3, "item"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKBasicCollectionViewDataSource removeItemsAtIndexes:](self, "removeItemsAtIndexes:", v6);
  if (v7)
    v7[2](v7, 0);

}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  if (v5 >= -[NSArray count](self->_items, "count"))
  {
    v6 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)indexPathsForItem:(id)a3
{
  id v4;
  NSArray *items;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  items = self->_items;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__GKBasicCollectionViewDataSource_indexPathsForItem___block_invoke;
  v9[3] = &unk_1E59C5DC8;
  v10 = v4;
  v6 = v4;
  -[NSArray _gkFilterWithBlock:](items, "_gkFilterWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __53__GKBasicCollectionViewDataSource_indexPathsForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;

  if (objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject **v13;
  NSObject *v14;
  id v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)GKBasicCollectionViewDataSource;
  -[GKCollectionViewDataSource collectionView:viewForSupplementaryElementOfKind:atIndexPath:](&v17, sel_collectionView_viewForSupplementaryElementOfKind_atIndexPath_, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v8, "_gkDequeueSupplementaryViewForClass:ofKind:forIndexPath:", objc_opt_class(), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKBasicCollectionViewDataSource sectionTitle](self, "sectionTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLeftText:", v12);

    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SectionHeader")) & 1) == 0)
    {
      v13 = (NSObject **)MEMORY[0x1E0D25460];
      v14 = *MEMORY[0x1E0D25460];
      if (!*MEMORY[0x1E0D25460])
      {
        v15 = (id)GKOSLoggers();
        v14 = *v13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[GKBasicCollectionViewDataSource collectionView:viewForSupplementaryElementOfKind:atIndexPath:].cold.1((uint64_t)v9, v14);
    }
  }

  return v11;
}

- (void)configureCollectionView:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKBasicCollectionViewDataSource;
  v3 = a3;
  -[GKCollectionViewDataSource configureCollectionView:](&v4, sel_configureCollectionView_, v3);
  objc_msgSend(v3, "_gkRegisterClass:forSupplementaryViewOfKind:", objc_opt_class(), CFSTR("SectionHeader"), v4.receiver, v4.super_class);

}

- (id)sectionTitle
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ needs to implement me!"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKBasicCollectionViewDataSource.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v3, "-[GKBasicCollectionViewDataSource sectionTitle]", objc_msgSend(v5, "UTF8String"), 136);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  return 0;
}

- (void)setItemsNoNotify:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *items;
  NSArray *v7;

  v4 = (NSArray *)a3;
  if (self->_items != v4)
  {
    v7 = v4;
    if (self->_filterPredicate)
    {
      -[NSArray filteredArrayUsingPredicate:](v4, "filteredArrayUsingPredicate:");
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (NSArray *)-[NSArray copy](v4, "copy");
    }
    items = self->_items;
    self->_items = v5;

    self->_preloadedRange.location = 0;
    self->_preloadedRange.length = 0;
    v4 = v7;
  }

}

- (void)setItems:(id)a3
{
  NSArray *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject **v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSUInteger v17;
  NSObject *v18;
  id v19;
  void *v20;
  NSArray *items;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  int v54;
  void *v55;
  uint64_t v56;
  void *v57;
  NSArray *v58;
  id v59;
  NSObject *v60;
  id v61;
  void *v62;
  void *v63;
  id obj;
  void *v65;
  GKBasicCollectionViewDataSource *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  id v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  id v90;
  __int16 v91;
  void *v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  v66 = self;
  if (self->_items != v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSArray count](v4, "count");
    v8 = objc_msgSend(v6, "count");
    v9 = (NSObject **)MEMORY[0x1E0D25460];
    if (v7 != v8)
    {
      v10 = *MEMORY[0x1E0D25460];
      if (!*MEMORY[0x1E0D25460])
      {
        v11 = (id)GKOSLoggers();
        v10 = *v9;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = (void *)MEMORY[0x1E0CB37E8];
        v13 = v10;
        objc_msgSend(v12, "numberWithUnsignedInteger:", -[NSArray count](v4, "count") - objc_msgSend(v6, "count"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](v4, "count"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v80 = v14;
        v81 = 2112;
        v82 = v15;
        v83 = 2112;
        v84 = v16;
        _os_log_impl(&dword_1AB361000, v13, OS_LOG_TYPE_INFO, "duplicate new items detected: %@ (%@ vs %@)", buf, 0x20u);

      }
    }
    v17 = -[NSArray count](self->_items, "count");
    if (v17 != objc_msgSend(v5, "count"))
    {
      v18 = *v9;
      if (!*v9)
      {
        v19 = (id)GKOSLoggers();
        v18 = *v9;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v20 = (void *)MEMORY[0x1E0CB37E8];
        items = self->_items;
        v22 = v18;
        objc_msgSend(v20, "numberWithUnsignedInteger:", -[NSArray count](items, "count") - objc_msgSend(v5, "count"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_items, "count"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v80 = v23;
        v81 = 2112;
        v82 = v24;
        v83 = 2112;
        v84 = v25;
        _os_log_impl(&dword_1AB361000, v22, OS_LOG_TYPE_INFO, "duplicate old items detected: %@ (%@ vs %@)", buf, 0x20u);

      }
    }
    v26 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v26, "minusSet:", v6);
    v65 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v65, "minusSet:", v5);
    v27 = (void *)objc_msgSend(v6, "mutableCopy");
    v62 = v5;
    objc_msgSend(v27, "intersectSet:", v5);
    v63 = (void *)objc_msgSend(v27, "mutableCopy");
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = v27;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v95, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v76 != v30)
            objc_enumerationMutation(obj);
          v32 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", -[NSArray indexOfObject:](v66->_items, "indexOfObject:", v32), 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", -[NSArray indexOfObject:](v4, "indexOfObject:", v32), 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33 == v34)
          {
            objc_msgSend(v63, "removeObject:", v32);
          }
          else
          {
            objc_msgSend(v26, "addObject:", v32);
            objc_msgSend(v65, "addObject:", v32);
          }

        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v95, 16);
      }
      while (v29);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v36 = v26;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v71, v94, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v72;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v72 != v39)
            objc_enumerationMutation(v36);
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", -[NSArray indexOfObject:](v66->_items, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j)), 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v41);

        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v71, v94, 16);
      }
      while (v38);
    }
    v61 = v36;

    objc_msgSend(v35, "sortedArrayUsingComparator:", &__block_literal_global_20);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "reverseObjectEnumerator");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "allObjects");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v44, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v48 = v65;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v67, v93, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v68;
      do
      {
        for (k = 0; k != v50; ++k)
        {
          if (*(_QWORD *)v68 != v51)
            objc_enumerationMutation(v48);
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", -[NSArray indexOfObject:](v4, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * k), v61), 0);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v45, "containsObject:", v53);
          v55 = v46;
          if (v54)
          {
            objc_msgSend(v45, "removeObject:", v53);
            v55 = v47;
          }
          objc_msgSend(v55, "addObject:", v53);

        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v67, v93, 16);
      }
      while (v50);
    }

    objc_msgSend(v46, "sortUsingComparator:", &__block_literal_global_49_0);
    if (v66->_filterPredicate)
    {
      -[NSArray filteredArrayUsingPredicate:](v4, "filteredArrayUsingPredicate:");
      v56 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v56 = -[NSArray copy](v4, "copy");
    }
    v57 = v61;
    v58 = v66->_items;
    v66->_items = (NSArray *)v56;

    v66->_preloadedRange.location = 0;
    v66->_preloadedRange.length = 0;
    if (!*MEMORY[0x1E0D25460])
      v59 = (id)GKOSLoggers();
    v60 = *MEMORY[0x1E0D25438];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413826;
      v80 = v62;
      v81 = 2112;
      v82 = v6;
      v83 = 2112;
      v84 = v45;
      v85 = 2112;
      v86 = v61;
      v87 = 2112;
      v88 = v46;
      v89 = 2112;
      v90 = v48;
      v91 = 2112;
      v92 = v47;
      _os_log_debug_impl(&dword_1AB361000, v60, OS_LOG_TYPE_DEBUG, "GKBasicCollectionViewDataSource setting items. \noldItems: %@\nnewItems:%@ \ndeletedIndexPath: %@, deletedItems: %@\ninsertedIndexPaths: %@, insertedItems: %@\nrefreshedIndexPaths: %@", buf, 0x48u);
    }
    if (objc_msgSend(v45, "count", v61))
      -[GKCollectionViewDataSource notifyItemsRemovedAtIndexPaths:](v66, "notifyItemsRemovedAtIndexPaths:", v45);
    if (objc_msgSend(v46, "count"))
      -[GKCollectionViewDataSource notifyItemsInsertedAtIndexPaths:](v66, "notifyItemsInsertedAtIndexPaths:", v46);
    if (objc_msgSend(v47, "count"))
      -[GKCollectionViewDataSource notifyItemsRefreshedAtIndexPaths:](v66, "notifyItemsRefreshedAtIndexPaths:", v47);

  }
}

uint64_t __44__GKBasicCollectionViewDataSource_setItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __44__GKBasicCollectionViewDataSource_setItems___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (unint64_t)countOfItems
{
  return -[NSArray count](self->_items, "count");
}

- (id)itemsAtIndexes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__GKBasicCollectionViewDataSource_itemsAtIndexes___block_invoke;
  v11[3] = &unk_1E59C4820;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

void __50__GKBasicCollectionViewDataSource_itemsAtIndexes___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count") > a2)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectAtIndexedSubscript:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)insertItems:(id)a3 atIndexes:(id)a4
{
  NSArray *items;
  id v7;
  id v8;
  NSArray *v9;
  NSArray *v10;
  void *v11;
  id v12;
  NSArray *v13;
  _QWORD v14[4];
  id v15;

  items = self->_items;
  v7 = a4;
  v8 = a3;
  v9 = (NSArray *)-[NSArray mutableCopy](items, "mutableCopy");
  -[NSArray insertObjects:atIndexes:](v9, "insertObjects:atIndexes:", v8, v7);

  v10 = self->_items;
  self->_items = v9;
  v13 = v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__GKBasicCollectionViewDataSource_insertItems_atIndexes___block_invoke;
  v14[3] = &unk_1E59C5E50;
  v15 = v11;
  v12 = v11;
  objc_msgSend(v7, "enumerateIndexesUsingBlock:", v14);

  -[GKCollectionViewDataSource notifyItemsInsertedAtIndexPaths:](self, "notifyItemsInsertedAtIndexPaths:", v12);
}

void __57__GKBasicCollectionViewDataSource_insertItems_atIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)removeItemsAtIndexes:(id)a3
{
  id v4;
  NSUInteger v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *items;
  id v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  GKBasicCollectionViewDataSource *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void *(*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v5 = -[NSArray count](self->_items, "count");
  v6 = v5 - objc_msgSend(v4, "count");
  if (v6 < 1)
    v7 = 0;
  else
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = &__block_literal_global_52;
  v8 = objc_msgSend(&__block_literal_global_52, "copy");
  v9 = (void *)v21[5];
  v21[5] = v8;

  v10 = MEMORY[0x1E0C809B0];
  items = self->_items;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__GKBasicCollectionViewDataSource_removeItemsAtIndexes___block_invoke_2;
  v15[3] = &unk_1E59C5EE8;
  v19 = &v20;
  v12 = v4;
  v16 = v12;
  v17 = self;
  v13 = v7;
  v18 = v13;
  -[NSArray enumerateObjectsUsingBlock:](items, "enumerateObjectsUsingBlock:", v15);
  objc_storeStrong((id *)&self->_items, v7);
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __56__GKBasicCollectionViewDataSource_removeItemsAtIndexes___block_invoke_5;
  v14[3] = &unk_1E59C4690;
  v14[4] = &v20;
  -[GKCollectionViewDataSource notifyBatchUpdate:](self, "notifyBatchUpdate:", v14);

  _Block_object_dispose(&v20, 8);
}

void __56__GKBasicCollectionViewDataSource_removeItemsAtIndexes___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id *v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD aBlock[5];
  _QWORD v19[3];
  _QWORD v20[5];
  _QWORD v21[2];

  v5 = a2;
  v6 = _Block_copy(*(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a3))
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __56__GKBasicCollectionViewDataSource_removeItemsAtIndexes___block_invoke_3;
    v20[3] = &unk_1E59C5E98;
    v7 = (id *)v21;
    v8 = v6;
    v20[4] = *(_QWORD *)(a1 + 40);
    v21[0] = v8;
    v21[1] = a3;
    v9 = v20;
  }
  else
  {
    v10 = objc_msgSend(*(id *)(a1 + 48), "count");
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__GKBasicCollectionViewDataSource_removeItemsAtIndexes___block_invoke_4;
    aBlock[3] = &unk_1E59C5EC0;
    v7 = (id *)v19;
    v11 = v6;
    aBlock[4] = *(_QWORD *)(a1 + 40);
    v19[0] = v11;
    v19[1] = a3;
    v19[2] = v10;
    v9 = aBlock;
  }
  v12 = _Block_copy(v9);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  v15 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "copy");
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

}

void __56__GKBasicCollectionViewDataSource_removeItemsAtIndexes___block_invoke_3(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(a1[5] + 16))();
  v2 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a1[6], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyItemsRemovedAtIndexPaths:", v4);

}

void __56__GKBasicCollectionViewDataSource_removeItemsAtIndexes___block_invoke_4(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  (*(void (**)(void))(a1[5] + 16))();
  v2 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a1[6], 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a1[7], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyItemMovedFromIndexPath:toIndexPaths:", v4, v3);

}

uint64_t __56__GKBasicCollectionViewDataSource_removeItemsAtIndexes___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
}

- (void)replaceItemsAtIndexes:(id)a3 withItems:(id)a4
{
  NSArray *items;
  id v7;
  id v8;
  NSArray *v9;
  NSArray *v10;
  void *v11;
  id v12;
  NSArray *v13;
  _QWORD v14[4];
  id v15;

  items = self->_items;
  v7 = a4;
  v8 = a3;
  v9 = (NSArray *)-[NSArray mutableCopy](items, "mutableCopy");
  -[NSArray replaceObjectsAtIndexes:withObjects:](v9, "replaceObjectsAtIndexes:withObjects:", v8, v7);

  v10 = self->_items;
  self->_items = v9;
  v13 = v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__GKBasicCollectionViewDataSource_replaceItemsAtIndexes_withItems___block_invoke;
  v14[3] = &unk_1E59C5E50;
  v15 = v11;
  v12 = v11;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", v14);

  -[GKCollectionViewDataSource notifyItemsRefreshedAtIndexPaths:](self, "notifyItemsRefreshedAtIndexPaths:", v12);
}

void __67__GKBasicCollectionViewDataSource_replaceItemsAtIndexes_withItems___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)preloadImagesForItems:(id)a3 startingAtIndex:(unint64_t)a4 loadBlock:(id)a5
{
  void (**v8)(id, void *);
  _NSRange *p_preloadedRange;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSRange v18;

  v17 = a3;
  v8 = (void (**)(id, void *))a5;
  if (v8 && objc_msgSend(v17, "count"))
  {
    p_preloadedRange = &self->_preloadedRange;
    location = self->_preloadedRange.location;
    length = self->_preloadedRange.length;
    if (a4 < location || a4 - location >= length)
    {
      v13 = length + location;
      v14 = -[GKBasicCollectionViewDataSource pageSize](self, "pageSize");
      v15 = objc_msgSend(v17, "count");
      if (v14 >= v15 - v13)
        v14 = v15 - v13;
      v18.location = v13;
      v18.length = v14;
      *p_preloadedRange = NSUnionRange(*p_preloadedRange, v18);
      objc_msgSend(v17, "subarrayWithRange:", v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v16);

    }
  }

}

- (NSArray)items
{
  return self->_items;
}

- (SEL)showAllAction
{
  return self->_showAllAction;
}

- (void)setShowAllAction:(SEL)a3
{
  self->_showAllAction = a3;
}

- (unint64_t)pageSize
{
  return self->_pageSize;
}

- (void)setPageSize:(unint64_t)a3
{
  self->_pageSize = a3;
}

- (_NSRange)preloadedRange
{
  _NSRange *p_preloadedRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_preloadedRange = &self->_preloadedRange;
  location = self->_preloadedRange.location;
  length = p_preloadedRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setPreloadedRange:(_NSRange)a3
{
  self->_preloadedRange = a3;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)setFilterPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_filterPredicate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)collectionView:(uint64_t)a1 viewForSupplementaryElementOfKind:(NSObject *)a2 atIndexPath:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1AB361000, a2, OS_LOG_TYPE_DEBUG, "unexpected supplementary view kind encountered: %@", (uint8_t *)&v2, 0xCu);
}

@end
