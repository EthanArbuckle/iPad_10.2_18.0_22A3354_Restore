@implementation GKCollectionViewDataSource

- (GKCollectionViewDataSource)init
{
  GKCollectionViewDataSource *v2;
  uint64_t v3;
  NSHashTable *listeners;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKCollectionViewDataSource;
  v2 = -[GKCollectionViewDataSource init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    listeners = v2->_listeners;
    v2->_listeners = (NSHashTable *)v3;

  }
  return v2;
}

- (id)localDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t i;
  int64_t v15;
  const __CFString *v16;
  void *v17;
  objc_super v19;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)GKCollectionViewDataSource;
  -[GKCollectionViewDataSource description](&v19, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_defaultSearchKey)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    _gkBeautifyVariableName();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR(" %@: %@"), v7, self->_defaultSearchKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@"), v5, v8);

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@"), v4, &stru_1E59EB978);
  }

  v9 = -[GKCollectionViewDataSource numberOfSectionsInCollectionView:](self, "numberOfSectionsInCollectionView:", 0);
  if (v9 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKCollectionViewDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", 0, 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" %@ item(s)"), v12);

  }
  else
  {
    v10 = v9;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR(" %@ sections: <"), v13);

      if (v10 >= 1)
      {
        for (i = 0; i != v10; ++i)
        {
          v15 = -[GKCollectionViewDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", 0, i);
          if (i)
            v16 = CFSTR(", ");
          else
            v16 = &stru_1E59EB978;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%@%@"), v16, v17);

        }
      }
      v11 = CFSTR(">");
    }
    else
    {
      v11 = CFSTR(" no sections");
    }
    objc_msgSend(v3, "appendString:", v11);
  }
  return v3;
}

- (NSString)description
{
  return (NSString *)-[GKCollectionViewDataSource _gkDescriptionWithChildren:](self, "_gkDescriptionWithChildren:", 0);
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t i;
  int64_t v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  GKGridLayoutMetrics *dataSourceMetricsInternal;
  void *v31;
  void *v32;
  void *v33;
  GKSectionMetrics *defaultSectionMetricsInternal;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  uint64_t k;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  int64_t v57;
  id obj;
  GKCollectionViewDataSource *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  objc_super v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  _gkTabStringForTabLevel();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v69.receiver = self;
  v69.super_class = (Class)GKCollectionViewDataSource;
  -[GKCollectionViewDataSource description](&v69, sel_description);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (self->_defaultSearchKey)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    _gkBeautifyVariableName();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR(" %@: %@"), v10, self->_defaultSearchKey);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("%@%@%@"), v5, v8, v11);

  }
  else
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("%@%@%@"), v5, v7, &stru_1E59EB978);
  }

  v12 = -[GKCollectionViewDataSource numberOfSectionsInCollectionView:](self, "numberOfSectionsInCollectionView:", 0);
  v57 = a3;
  if (v12 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKCollectionViewDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", 0, 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" %@ item(s)"), v14);

  }
  else
  {
    v13 = v12;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR(" %@ sections: <"), v15);

      if (v13 >= 1)
      {
        for (i = 0; i != v13; ++i)
        {
          v17 = -[GKCollectionViewDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", 0, i);
          if (i)
            v18 = CFSTR(", ");
          else
            v18 = &stru_1E59EB978;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFormat:", CFSTR("%@%@"), v18, v19);

        }
      }
      objc_msgSend(v6, "appendString:", CFSTR(">"));
    }
    else
    {
      objc_msgSend(v6, "appendString:", CFSTR(" no sections"));
    }
  }
  -[NSMutableDictionary allKeys](self->_sectionsToSearchKeys, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = CFSTR(" {\n");
  v60 = v6;
  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@    %@sectionSearchKeys:\n"), CFSTR(" {\n"), v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v22);

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v23 = v20;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v66;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v66 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_sectionsToSearchKeys, "objectForKeyedSubscript:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v28;
          v6 = v60;
          objc_msgSend(v60, "appendFormat:", CFSTR("    %@%@ - %@"), v5, v54, v29);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
      }
      while (v25);
    }

    v21 = &stru_1E59EB978;
    a3 = v57;
  }
  dataSourceMetricsInternal = self->_dataSourceMetricsInternal;
  if (dataSourceMetricsInternal)
  {
    v31 = (void *)MEMORY[0x1E0CB3940];
    -[GKGridLayoutMetrics _gkDescriptionWithChildren:](dataSourceMetricsInternal, "_gkDescriptionWithChildren:", a3 + 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("%@    %@overallMetrics: {\n%@"), v21, v5, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v33);

    objc_msgSend(v6, "appendFormat:", CFSTR("%@    }\n"), v5);
    v21 = &stru_1E59EB978;
  }
  defaultSectionMetricsInternal = self->_defaultSectionMetricsInternal;
  if (defaultSectionMetricsInternal)
  {
    v35 = (void *)MEMORY[0x1E0CB3940];
    -[GKGridLayoutMetrics _gkDescriptionWithChildren:](defaultSectionMetricsInternal, "_gkDescriptionWithChildren:", a3 + 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("%@    %@defaultSectionMetrics: {\n%@"), v21, v5, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v37);

    objc_msgSend(v6, "appendFormat:", CFSTR("%@    }\n"), v5);
    v21 = &stru_1E59EB978;
  }
  -[NSMutableDictionary allKeys](self->_sectionsToMetrics, "allKeys");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v38, "count"))
  {
    v59 = self;
    v39 = v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@    %@sectionMetrics: {\n"), v21, v5);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v40);

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v56 = v38;
    obj = v38;
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v62;
      v44 = a3 + 2;
      do
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v62 != v43)
            objc_enumerationMutation(obj);
          v46 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * k);
          -[NSMutableDictionary objectForKeyedSubscript:](v59->_sectionsToMetrics, "objectForKeyedSubscript:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "_gkDescriptionWithChildren:", v44);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringByTrimmingCharactersInSet:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          v55 = v46;
          v6 = v60;
          objc_msgSend(v60, "appendFormat:", CFSTR("        %@%@ - %@"), v39, v55, v50);

        }
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      }
      while (v42);
    }

    v5 = v39;
    objc_msgSend(v6, "appendFormat:", CFSTR("%@    }\n"), v39);
    v21 = &stru_1E59EB978;
    v38 = v56;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "appendFormat:", &stru_1E59EB978, v53);
  }
  else if (!-[__CFString length](v21, "length"))
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("%@}\n"), v5);
  }
  v51 = (id)_gkUnicodifyDescription();

  return v6;
}

- (id)itemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ needs to implement me!"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v4, "-[GKCollectionViewDataSource itemAtIndexPath:]", objc_msgSend(v6, "UTF8String"), 310);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
  return 0;
}

- (id)indexPathsForItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ needs to implement me!"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v4, "-[GKCollectionViewDataSource indexPathsForItem:]", objc_msgSend(v6, "UTF8String"), 316);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
  return 0;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ needs to implement me!"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v5, "-[GKCollectionViewDataSource collectionView:numberOfItemsInSection:]", objc_msgSend(v7, "UTF8String"), 327);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v8);
  return 0;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ needs to implement me!"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v5, "-[GKCollectionViewDataSource collectionView:cellForItemAtIndexPath:]", objc_msgSend(v7, "UTF8String"), 333);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v8);
  return 0;
}

- (void)removeItemAtIndexPath:(id)a3 completionHandler:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ needs to implement me!"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v5, "-[GKCollectionViewDataSource removeItemAtIndexPath:completionHandler:]", objc_msgSend(v7, "UTF8String"), 339);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v8);
}

- (void)configureCollectionView:(id)a3
{
  id v4;

  v4 = a3;
  if (-[GKCollectionViewDataSource isRootDataSource](self, "isRootDataSource"))
  {
    objc_msgSend((id)objc_opt_class(), "registerSupplementaryViewClassesForKind:withCollectionView:", CFSTR("IncrementalReveal"), v4);
    objc_msgSend((id)objc_opt_class(), "registerSupplementaryViewClassesForKind:withCollectionView:", CFSTR("SearchBar"), v4);
    objc_msgSend(v4, "_gkRegisterClass:forSupplementaryViewOfKind:", objc_opt_class(), CFSTR("ClipArea"));
    objc_msgSend(v4, "_gkRegisterClass:forSupplementaryViewOfKind:", objc_opt_class(), CFSTR("SearchPlaceholderMetricKey"));
  }

}

- (unint64_t)sectionForDataSource:(id)a3
{
  return 0;
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4 updateNotifier:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__GKCollectionViewDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke;
  v8[3] = &unk_1E59C45D8;
  v9 = v6;
  v7 = v6;
  -[GKCollectionViewDataSource loadDataWithCompletionHandlerAndError:](self, "loadDataWithCompletionHandlerAndError:", v8);

}

uint64_t __81__GKCollectionViewDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateError:", a2);
}

- (BOOL)containsDataSource:(id)a3
{
  return a3 == self;
}

- (void)loadDataWithCompletionHandlerAndError:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ needs to implement me!"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v4, "-[GKCollectionViewDataSource loadDataWithCompletionHandlerAndError:]", objc_msgSend(v6, "UTF8String"), 378);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
}

- (id)searchKeyForSection:(int64_t)a3
{
  NSMutableDictionary *sectionsToSearchKeys;
  void *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;

  sectionsToSearchKeys = self->_sectionsToSearchKeys;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sectionsToSearchKeys, "objectForKeyedSubscript:", v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = self->_defaultSearchKey;
    if (!v7)
    {
      -[GKCollectionViewDataSource delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        objc_msgSend(v8, "searchKeyForSection:", a3);
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "delegate");
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v9;
        if (v7)
        {
          v8 = (void *)v9;
          goto LABEL_8;
        }
      }
      v7 = 0;
LABEL_8:

    }
  }
  return v7;
}

- (void)setSearchKey:(id)a3 forSection:(int64_t)a4
{
  NSMutableDictionary *sectionsToSearchKeys;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  sectionsToSearchKeys = self->_sectionsToSearchKeys;
  if (!sectionsToSearchKeys)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[GKCollectionViewDataSource numberOfSectionsInCollectionView:](self, "numberOfSectionsInCollectionView:", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewDataSource setSectionsToSearchKeys:](self, "setSectionsToSearchKeys:", v7);

    sectionsToSearchKeys = self->_sectionsToSearchKeys;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](sectionsToSearchKeys, "setObject:forKeyedSubscript:", v9, v8);

}

- (BOOL)item:(id)a3 matchesSearchTerms:(id)a4 inSection:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  int v19;
  int v20;
  BOOL v21;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v8 = a4;
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    v23 = v9;
    -[GKCollectionViewDataSource searchKeyForSection:](self, "searchKeyForSection:", a5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v24;
    if (objc_msgSend(v24, "length"))
    {
      objc_msgSend(v25, "valueForKeyPath:", v24);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v12 = v9;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v32;
        v15 = MEMORY[0x1E0C809B0];
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v32 != v14)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            if (objc_msgSend(v17, "length"))
            {
              v27 = 0;
              v28 = &v27;
              v29 = 0x2020000000;
              v30 = 0;
              v18 = objc_msgSend(v11, "length");
              v26[0] = v15;
              v26[1] = 3221225472;
              v26[2] = __64__GKCollectionViewDataSource_item_matchesSearchTerms_inSection___block_invoke;
              v26[3] = &unk_1E59C9300;
              v26[4] = v17;
              v26[5] = &v27;
              objc_msgSend(v11, "enumerateSubstringsInRange:options:usingBlock:", 0, v18, 1027, v26);
              v19 = *((unsigned __int8 *)v28 + 24);
              _Block_object_dispose(&v27, 8);
              if (v19)
              {
                v20 = 1;
                goto LABEL_17;
              }
            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          if (v13)
            continue;
          break;
        }
      }
      v20 = 0;
LABEL_17:

      v10 = v24;
    }
    else
    {
      v20 = 0;
    }

    v21 = v20 != 0;
    v9 = v23;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

uint64_t __64__GKCollectionViewDataSource_item_matchesSearchTerms_inSection___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t result;

  result = objc_msgSend(a2, "rangeOfString:options:", *(_QWORD *)(a1 + 32), 897);
  if (!result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a7 = 1;
  }
  return result;
}

- (void)enumerateItemsAndIndexPathsUsingBlock:(id)a3
{
  void (**v4)(id, void *, void *, _BYTE *);
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  uint64_t v19;
  GKCollectionViewDataSource *v20;
  unsigned __int8 v21;

  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  v19 = -[GKCollectionViewDataSource numberOfSectionsInCollectionView:](self, "numberOfSectionsInCollectionView:", 0);
  if (v19 >= 1)
  {
    v5 = 0;
    v6 = 0x1E0CB3000uLL;
    v20 = self;
    while (1)
    {
      v7 = -[GKCollectionViewDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", 0, v5);
      if (v7 >= 1)
        break;
LABEL_9:
      if (++v5 == v19)
        goto LABEL_10;
    }
    v8 = v7;
    v9 = 0;
    while (1)
    {
      v21 = 0;
      objc_msgSend(*(id *)(v6 + 1712), "indexPathForItem:inSection:", v9, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKCollectionViewDataSource itemAtIndexPath:](self, "itemAtIndexPath:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m");
        v14 = v8;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ (item != ((void *)0))\n[%s (%s:%d)]"), v13, "-[GKCollectionViewDataSource enumerateItemsAndIndexPathsUsingBlock:]", objc_msgSend(v16, "UTF8String"), 456);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = v14;
        v6 = 0x1E0CB3000;
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v17);

        self = v20;
      }
      v4[2](v4, v11, v10, &v21);
      v18 = v21;

      if (v18)
        break;
      if (v8 == ++v9)
        goto LABEL_9;
    }
  }
LABEL_10:

}

- (BOOL)isSearchable
{
  void *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  GKCollectionViewDataSource *v9;
  GKCollectionViewDataSource *v10;

  if (-[NSString length](self->_defaultSearchKey, "length"))
    return 1;
  -[NSMutableDictionary allValues](self->_sectionsToSearchKeys, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return 1;
  v6 = -[GKCollectionViewDataSource numberOfSectionsInCollectionView:](self, "numberOfSectionsInCollectionView:", 0);
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = 0;
    while (1)
    {
      -[GKCollectionViewDataSource dataSourceForSection:](self, "dataSourceForSection:", v8);
      v9 = (GKCollectionViewDataSource *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9 != self)
      {
        if (-[GKCollectionViewDataSource isSearchable](v9, "isSearchable"))
          break;
      }

      if (v7 == ++v8)
        return 0;
    }

    return 1;
  }
  return 0;
}

- (GKGridLayoutMetrics)dataSourceMetrics
{
  GKGridLayoutMetrics *dataSourceMetricsInternal;
  void *v4;

  dataSourceMetricsInternal = self->_dataSourceMetricsInternal;
  if (!dataSourceMetricsInternal)
  {
    +[GKGridLayoutMetrics metrics](GKGridLayoutMetrics, "metrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewDataSource setDataSourceMetricsInternal:](self, "setDataSourceMetricsInternal:", v4);

    dataSourceMetricsInternal = self->_dataSourceMetricsInternal;
  }
  return dataSourceMetricsInternal;
}

- (void)setDataSourceMetrics:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[GKCollectionViewDataSource setDataSourceMetricsInternal:](self, "setDataSourceMetricsInternal:", v4);

}

- (void)updateSupplementaryMetricsForKey:(id)a3 usingBlock:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  void *v8;
  id v9;

  v6 = (void (**)(id, void *))a4;
  v7 = a3;
  -[GKCollectionViewDataSource dataSourceMetrics](self, "dataSourceMetrics");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "supplementaryMetricsForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8);

  objc_msgSend(v9, "replaceSupplementaryMetrics:forKey:", v8, v7);
}

- (GKSectionMetrics)defaultSectionMetrics
{
  GKSectionMetrics *defaultSectionMetricsInternal;
  void *v4;

  defaultSectionMetricsInternal = self->_defaultSectionMetricsInternal;
  if (!defaultSectionMetricsInternal)
  {
    +[GKGridLayoutMetrics metrics](GKSectionMetrics, "metrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewDataSource setDefaultSectionMetricsInternal:](self, "setDefaultSectionMetricsInternal:", v4);

    defaultSectionMetricsInternal = self->_defaultSectionMetricsInternal;
  }
  return defaultSectionMetricsInternal;
}

- (void)setDefaultSectionMetrics:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[GKCollectionViewDataSource setDefaultSectionMetricsInternal:](self, "setDefaultSectionMetricsInternal:", v4);

}

- (id)metricsForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSMutableDictionary *sectionsToMetrics;
  void *v11;
  void *v12;

  if (a3 < 0)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (section >= 0)\n[%s (%s:%d)]"), v6, "-[GKCollectionViewDataSource metricsForSection:]", objc_msgSend(v8, "UTF8String"), 530);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  sectionsToMetrics = self->_sectionsToMetrics;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sectionsToMetrics, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[GKCollectionViewDataSource defaultSectionMetrics](self, "defaultSectionMetrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (id)metricsForSectionInternal:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSMutableDictionary *sectionsToMetrics;
  void *v11;
  void *v12;

  if (a3 < 0)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (section >= 0)\n[%s (%s:%d)]"), v6, "-[GKCollectionViewDataSource metricsForSectionInternal:]", objc_msgSend(v8, "UTF8String"), 539);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  sectionsToMetrics = self->_sectionsToMetrics;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sectionsToMetrics, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[GKCollectionViewDataSource defaultSectionMetricsInternal](self, "defaultSectionMetricsInternal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (void)setMetrics:(id)a3 forSection:(int64_t)a4
{
  NSMutableDictionary *sectionsToMetrics;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  sectionsToMetrics = self->_sectionsToMetrics;
  if (!sectionsToMetrics)
  {
    v7 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v8 = self->_sectionsToMetrics;
    self->_sectionsToMetrics = v7;

    sectionsToMetrics = self->_sectionsToMetrics;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](sectionsToMetrics, "setObject:forKeyedSubscript:", v10, v9);

}

- (id)createMetricsTreeWithGridLayout:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;

  v4 = a3;
  -[GKCollectionViewDataSource delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[GKCollectionViewDataSource delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateMetrics");

  }
  +[GKDataSourceMetrics dataSourceMetricsWithMetrics:dataSource:](GKDataSourceMetrics, "dataSourceMetricsWithMetrics:dataSource:", self->_dataSourceMetricsInternal, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configureCollectionView:", v9);

  objc_msgSend(v4, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[GKCollectionViewDataSource numberOfSectionsInCollectionView:](self, "numberOfSectionsInCollectionView:", v10);

  if (v11 >= 1)
  {
    for (i = 0; i != v11; ++i)
    {
      -[GKCollectionViewDataSource metricsForSectionInternal:](self, "metricsForSectionInternal:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v8, "setMetrics:forSection:", v13, i);
        objc_msgSend(v4, "collectionView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "configureCollectionView:", v14);

      }
    }
  }
  objc_msgSend(v8, "setLocalSectionRange:", 0, v11);

  return v8;
}

- (BOOL)isRootDataSource
{
  void *v2;
  char isKindOfClass;

  -[GKCollectionViewDataSource delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)collectionView:(id)a3 defaultViewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  GKCollectionViewDataSourceDelegate **p_delegate;
  id WeakRetained;
  char v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  char v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[GKCollectionViewDataSource isRootDataSource](self, "isRootDataSource"))
    goto LABEL_16;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("IncrementalReveal")))
  {
    objc_msgSend(v8, "_gkDequeueSupplementaryViewForClass:ofKind:forIndexPath:", objc_opt_class(), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShowMoreAction:", sel_didTouchShowMore_);
    goto LABEL_17;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("SearchBar")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("ClipArea")))
    {
      objc_msgSend(v8, "_gkDequeueSupplementaryViewForClass:ofKind:forIndexPath:", objc_opt_class(), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("SearchPlaceholderMetricKey")))
    {
      objc_msgSend(v8, "_gkDequeueSupplementaryViewForClass:ofKind:forIndexPath:", objc_opt_class(), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setNoContentTitle:", CFSTR(" "));
      GKGameCenterUIFrameworkBundle();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setNoContentMessage:", v32);

      objc_msgSend(v11, "setLoadingState:", CFSTR("NoContentState"));
      objc_msgSend(v11, "setAlignment:", 1);
      goto LABEL_17;
    }
LABEL_16:
    v11 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v8, "_gkDequeueSupplementaryViewForClass:ofKind:forIndexPath:", objc_opt_class(), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v14 = objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EEC7AE58);

  if ((v14 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ doesn't conform to UISearchBarDelegate"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lastPathComponent");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ ([_delegate conformsToProtocol:@protocol(UISearchBarDelegate)])\n[%s (%s:%d)]"), v17, "-[GKCollectionViewDataSource collectionView:defaultViewForSupplementaryElementOfKind:atIndexPath:]", objc_msgSend(v19, "UTF8String"), 592);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v20);
  }
  v21 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v11, "setDelegate:", v21);

  v22 = objc_loadWeakRetained((id *)p_delegate);
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    v24 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v24, "performSelector:", sel_activeSearchBar);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "resignFirstResponder");
    if (v25)
    {
      objc_msgSend(v25, "text");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "length");

      if (v27)
      {
        objc_msgSend(v25, "text");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "searchBar");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setText:", v28);

        objc_msgSend(v11, "searchBar");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "becomeFirstResponder");

      }
    }

  }
LABEL_17:

  return v11;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[GKCollectionViewDataSource collectionView:evaluateFactoryForSupplementaryElementOfKind:atIndexPath:isRecursive:](self, "collectionView:evaluateFactoryForSupplementaryElementOfKind:atIndexPath:isRecursive:", v8, v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[GKCollectionViewDataSource collectionView:defaultViewForSupplementaryElementOfKind:atIndexPath:](self, "collectionView:defaultViewForSupplementaryElementOfKind:atIndexPath:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)collectionView:(id)a3 evaluateFactoryForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5 isRecursive:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "collectionViewLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v12, "attributesForSupplementaryIndexPath:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "supplementaryMetrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "reusableViewClass"))
  {

LABEL_6:
    -[GKCollectionViewDataSource supplementaryViewFactoryForKind:](self, "supplementaryViewFactoryForKind:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "collectionView:viewForSupplementaryElementOfKind:atIndexPath:", v9, v10, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v15 = objc_msgSend(v14, "reusableViewClass");
  objc_msgSend(v14, "kind");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_gkDequeueSupplementaryViewForClass:ofKind:forIndexPath:", v15, v16, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_6;
LABEL_7:

  return v17;
}

- (int64_t)totalItemCount
{
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  int64_t v6;

  v3 = -[GKCollectionViewDataSource numberOfSectionsInCollectionView:](self, "numberOfSectionsInCollectionView:", 0);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = 0;
  do
    v6 += -[GKCollectionViewDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", 0, v5++);
  while (v4 != v5);
  return v6;
}

- (void)notifyItemsInsertedAtIndexPaths:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GKCollectionViewDataSource delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "dataSource:didInsertItemsAtIndexPaths:", self, v5);

}

- (void)notifyItemsRemovedAtIndexPaths:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GKCollectionViewDataSource delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "dataSource:didRemoveItemsAtIndexPaths:", self, v5);

}

- (void)notifyItemsRefreshedAtIndexPaths:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GKCollectionViewDataSource delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "dataSource:didRefreshItemsAtIndexPaths:", self, v5);

}

- (void)notifyItemMovedFromIndexPath:(id)a3 toIndexPaths:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[GKCollectionViewDataSource delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "dataSource:didMoveItemAtIndexPath:toIndexPath:", self, v8, v6);

}

- (void)notifySectionsInserted:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GKCollectionViewDataSource delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "dataSource:didInsertSections:", self, v5);

}

- (void)notifySectionsRemoved:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GKCollectionViewDataSource delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "dataSource:didRemoveSections:", self, v5);

}

- (void)notifySectionsRefreshed:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GKCollectionViewDataSource delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "dataSource:didRefreshSections:", self, v5);

}

- (void)notifySectionMovedFrom:(int64_t)a3 to:(int64_t)a4
{
  id v7;

  -[GKCollectionViewDataSource delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "dataSource:didMoveSection:toSection:", self, a3, a4);

}

- (void)notifySectionsMovedWithItems
{
  id v3;

  -[GKCollectionViewDataSource delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dataSourceDidMoveSectionsWithItems:", self);

}

- (void)notifyDidReloadData
{
  id v3;

  -[GKCollectionViewDataSource delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dataSourceDidReloadData:", self);

}

- (void)notifyPlaceholderUpdated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[GKCollectionViewDataSource delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "dataSource:didUpdatePlaceholderVisibility:", self, v3);

}

- (void)notifyBatchUpdate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GKCollectionViewDataSource delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "dataSource:performBatchUpdate:complete:", self, v5, 0);

}

- (void)notifyBatchUpdate:(id)a3 complete:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  NSObject **v9;
  NSObject *v10;
  id v11;
  int v12;
  GKCollectionViewDataSource *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[GKCollectionViewDataSource delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "dataSource:performBatchUpdate:complete:", self, v6, v7);
  }
  else if (v7)
  {
    v9 = (NSObject **)MEMORY[0x1E0D25460];
    v10 = *MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
    {
      v11 = (id)GKOSLoggers();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = self;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1AB361000, v10, OS_LOG_TYPE_INFO, "no delegate, completing immediately! (self:%@ delegate:%@)", (uint8_t *)&v12, 0x16u);
    }
    v7[2](v7);
  }

}

- (id)targetForAction:(SEL)a3
{
  void *v4;
  id v5;
  void *v6;

  -[GKCollectionViewDataSource delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v4, "targetForAction:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (GKCollectionViewDataSourceDelegate)delegate
{
  return (GKCollectionViewDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)kindsToFactories
{
  return self->_kindsToFactories;
}

- (void)setKindsToFactories:(id)a3
{
  objc_storeStrong((id *)&self->_kindsToFactories, a3);
}

- (NSHashTable)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (NSMutableDictionary)sectionsToMetrics
{
  return self->_sectionsToMetrics;
}

- (void)setSectionsToMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_sectionsToMetrics, a3);
}

- (NSMutableDictionary)sectionsToSearchKeys
{
  return self->_sectionsToSearchKeys;
}

- (void)setSectionsToSearchKeys:(id)a3
{
  objc_storeStrong((id *)&self->_sectionsToSearchKeys, a3);
}

- (GKGridLayoutMetrics)dataSourceMetricsInternal
{
  return self->_dataSourceMetricsInternal;
}

- (void)setDataSourceMetricsInternal:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceMetricsInternal, a3);
}

- (GKSectionMetrics)defaultSectionMetricsInternal
{
  return self->_defaultSectionMetricsInternal;
}

- (void)setDefaultSectionMetricsInternal:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSectionMetricsInternal, a3);
}

- (NSString)defaultSearchKey
{
  return self->_defaultSearchKey;
}

- (void)setDefaultSearchKey:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSearchKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSearchKey, 0);
  objc_storeStrong((id *)&self->_defaultSectionMetricsInternal, 0);
  objc_storeStrong((id *)&self->_dataSourceMetricsInternal, 0);
  objc_storeStrong((id *)&self->_sectionsToSearchKeys, 0);
  objc_storeStrong((id *)&self->_sectionsToMetrics, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_kindsToFactories, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)registerSupplementaryViewOfKind:(id)a3 withFactory:(id)a4
{
  id v6;
  NSMutableDictionary *kindsToFactories;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  kindsToFactories = self->_kindsToFactories;
  if (!kindsToFactories)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_kindsToFactories;
    self->_kindsToFactories = v8;

    kindsToFactories = self->_kindsToFactories;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](kindsToFactories, "setObject:forKeyedSubscript:", v6, v10);

}

- (void)registerSupplementaryViewOfKind:(id)a3 withClass:(Class)a4 target:(id)a5 configurator:(SEL)a6
{
  id v10;
  id v11;

  v10 = a3;
  +[GKSupplementaryViewFactory factoryForClass:target:configurator:](GKSupplementaryViewFactory, "factoryForClass:target:configurator:", a4, a5, a6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewDataSource registerSupplementaryViewOfKind:withFactory:](self, "registerSupplementaryViewOfKind:withFactory:", v10, v11);

}

- (id)supplementaryViewFactoryForKind:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_kindsToFactories, "objectForKeyedSubscript:", a3);
}

@end
