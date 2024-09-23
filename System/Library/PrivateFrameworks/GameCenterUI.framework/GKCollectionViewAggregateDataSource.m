@implementation GKCollectionViewAggregateDataSource

- (GKCollectionViewAggregateDataSource)init
{
  GKCollectionViewAggregateDataSource *v2;
  NSMutableArray *v3;
  NSMutableArray *mappings;
  uint64_t v5;
  NSMapTable *dataSourceToMappings;
  NSMutableDictionary *v7;
  NSMutableDictionary *globalSectionToMappings;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKCollectionViewAggregateDataSource;
  v2 = -[GKCollectionViewDataSource init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mappings = v2->_mappings;
    v2->_mappings = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 1);
    dataSourceToMappings = v2->_dataSourceToMappings;
    v2->_dataSourceToMappings = (NSMapTable *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    globalSectionToMappings = v2->_globalSectionToMappings;
    v2->_globalSectionToMappings = v7;

  }
  return v2;
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  id obj;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _gkTabStringForTabLevel();
  v6 = objc_claimAutoreleasedReturnValue();
  v32.receiver = self;
  v32.super_class = (Class)GKCollectionViewAggregateDataSource;
  -[GKCollectionViewDataSource _gkDescriptionWithChildren:](&v32, sel__gkDescriptionWithChildren_, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v25 = (void *)v9;
  objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), v9);
  v27 = (void *)v6;
  objc_msgSend(v5, "appendFormat:", CFSTR("%@    sections: {\n"), v6);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[GKCollectionViewAggregateDataSource mappings](self, "mappings");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    v13 = a3 + 2;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        v15 = v5;
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v16, "dataSource");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_gkDescriptionWithChildren:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringByTrimmingCharactersInSet:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "globalSectionForLocalSection:", 0));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "dynamicTag");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v15;
        objc_msgSend(v15, "appendFormat:", CFSTR("%@        %@ - %@ - %@\n"), v27, v21, v22, v20);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v11);
  }

  objc_msgSend(v5, "appendFormat:", CFSTR("    %@}\n"), v27);
  objc_msgSend(v5, "appendFormat:", CFSTR("%@}\n"), v27);
  v23 = (id)_gkUnicodifyDescription();

  return v5;
}

- (id)_gkDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKCollectionViewAggregateDataSource;
  -[GKCollectionViewDataSource description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)wrapperForView:(id)a3 mapping:(id)a4
{
  return +[GKAggregateCollectionViewWrapper wrapperForView:mapping:](GKAggregateCollectionViewWrapper, "wrapperForView:mapping:", a3, a4);
}

- (void)addDataSource:(id)a3 withTag:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  GKAggregateMapping *v18;
  void *v19;
  unint64_t v20;
  id v21;

  v21 = a3;
  v6 = a4;
  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewAggregateDataSource.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ (tag != ((void *)0))\n[%s (%s:%d)]"), v8, "-[GKCollectionViewAggregateDataSource addDataSource:withTag:]", objc_msgSend(v10, "UTF8String"), 77);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }
  -[NSMapTable objectForKeyedSubscript:](self->_dataSourceToMappings, "objectForKeyedSubscript:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tried to add data source '%@' more than once: %@"), v6, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewAggregateDataSource.m");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastPathComponent");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ (mappingForDataSource == nil)\n[%s (%s:%d)]"), v14, "-[GKCollectionViewAggregateDataSource addDataSource:withTag:]", objc_msgSend(v16, "UTF8String"), 80);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v17);
  }
  v18 = objc_alloc_init(GKAggregateMapping);

  -[GKAggregateMapping setDataSource:](v18, "setDataSource:", v21);
  -[GKAggregateMapping setDynamicTag:](v18, "setDynamicTag:", v6);
  -[NSMutableArray addObject:](self->_mappings, "addObject:", v18);
  -[NSMapTable setObject:forKeyedSubscript:](self->_dataSourceToMappings, "setObject:forKeyedSubscript:", v18, v21);
  objc_msgSend(v21, "setDelegate:", self);
  -[GKCollectionViewAggregateDataSource updateMappings](self, "updateMappings");
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "numberOfSectionsInCollectionView:", 0))
  {
    v20 = 0;
    do
      objc_msgSend(v19, "addIndex:", -[GKAggregateMapping globalSectionForLocalSection:](v18, "globalSectionForLocalSection:", v20++));
    while (v20 < objc_msgSend(v21, "numberOfSectionsInCollectionView:", 0));
  }
  -[GKCollectionViewDataSource notifySectionsInserted:](self, "notifySectionsInserted:", v19);

}

- (void)removeDataSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;

  v13 = a3;
  -[NSMapTable objectForKey:](self->_dataSourceToMappings, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewAggregateDataSource.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ ([_dataSourceToMappings objectForKey:dataSource] != ((void *)0))\n[%s (%s:%d)]"), v6, "-[GKCollectionViewAggregateDataSource removeDataSource:]", objc_msgSend(v8, "UTF8String"), 99);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  objc_msgSend(v13, "setDelegate:", 0);
  -[NSMapTable objectForKeyedSubscript:](self->_dataSourceToMappings, "objectForKeyedSubscript:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "numberOfSectionsInCollectionView:", 0))
  {
    v12 = 0;
    do
      objc_msgSend(v11, "addIndex:", objc_msgSend(v10, "globalSectionForLocalSection:", v12++));
    while (v12 < objc_msgSend(v13, "numberOfSectionsInCollectionView:", 0));
  }
  -[NSMapTable removeObjectForKey:](self->_dataSourceToMappings, "removeObjectForKey:", v13);
  -[NSMutableArray removeObject:](self->_mappings, "removeObject:", v10);
  -[GKCollectionViewDataSource notifySectionsRemoved:](self, "notifySectionsRemoved:", v11);
  -[GKCollectionViewAggregateDataSource updateMappings](self, "updateMappings");

}

- (void)updateMappings
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  unint64_t v7;
  unint64_t sectionCount;
  unint64_t v9;
  NSMutableDictionary *globalSectionToMappings;
  void *v11;
  void *v12;
  NSMutableArray *obj;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  self->_sectionCount = 0;
  -[NSMutableDictionary removeAllObjects](self->_globalSectionToMappings, "removeAllObjects");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = self->_mappings;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v14 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v14)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "updateMappingsStartingWithGlobalSection:", self->_sectionCount);
        sectionCount = self->_sectionCount;
        if (sectionCount < v7)
        {
          v9 = v7;
          do
          {
            globalSectionToMappings = self->_globalSectionToMappings;
            v11 = (void *)MEMORY[0x1E0CB37E8];
            self->_sectionCount = sectionCount + 1;
            objc_msgSend(v11, "numberWithUnsignedInteger:");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](globalSectionToMappings, "setObject:forKeyedSubscript:", v6, v12);

            sectionCount = self->_sectionCount;
          }
          while (sectionCount < v9);
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

- (unint64_t)sectionForDataSource:(id)a3
{
  void *v3;
  unint64_t v4;

  -[GKCollectionViewAggregateDataSource mappingForDataSource:](self, "mappingForDataSource:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "globalSectionForLocalSection:", 0);

  return v4;
}

- (id)dataSourceForSection:(unint64_t)a3
{
  NSMutableDictionary *globalSectionToMappings;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  globalSectionToMappings = self->_globalSectionToMappings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](globalSectionToMappings, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSourceForSection:", objc_msgSend(v6, "localSectionForGlobalSection:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)mappingForGlobalSection:(int64_t)a3
{
  NSMutableDictionary *globalSectionToMappings;
  void *v4;
  void *v5;

  globalSectionToMappings = self->_globalSectionToMappings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](globalSectionToMappings, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mappingForDataSource:(id)a3
{
  return (id)-[NSMapTable objectForKeyedSubscript:](self->_dataSourceToMappings, "objectForKeyedSubscript:", a3);
}

- (id)globalSectionsForLocal:(id)a3 dataSource:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  void *v18;

  v6 = (void *)MEMORY[0x1E0CB3788];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "indexSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewAggregateDataSource mappingForDataSource:](self, "mappingForDataSource:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__GKCollectionViewAggregateDataSource_globalSectionsForLocal_dataSource___block_invoke;
  v16[3] = &unk_1E59C4820;
  v11 = v9;
  v17 = v11;
  v18 = v10;
  v12 = v10;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", v16);

  v13 = v18;
  v14 = v11;

  return v14;
}

uint64_t __73__GKCollectionViewAggregateDataSource_globalSectionsForLocal_dataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(*(id *)(a1 + 40), "globalSectionForLocalSection:", a2));
}

- (id)globalIndexPathsForLocal:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewAggregateDataSource mappingForDataSource:](self, "mappingForDataSource:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "globalIndexPathForLocalIndexPath:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14), (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v8;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int64_t v19;

  v6 = a3;
  -[GKCollectionViewAggregateDataSource updateMappings](self, "updateMappings");
  -[GKCollectionViewAggregateDataSource mappingForGlobalSection:](self, "mappingForGlobalSection:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "localSectionForGlobalSection:", a4);
  -[GKCollectionViewAggregateDataSource wrapperForView:mapping:](self, "wrapperForView:mapping:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "numberOfSectionsInCollectionView:", v9);

  if (v8 >= v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "tagForGlobalSection:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Internal consistency check failed: localSection index (%ld) in dataSource %@ not less than numberOfSections (%ld)"), v8, v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewAggregateDataSource.m");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastPathComponent");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ (localSection < numberOfSections)\n[%s (%s:%d)]"), v14, "-[GKCollectionViewAggregateDataSource collectionView:numberOfItemsInSection:]", objc_msgSend(v16, "UTF8String"), 187);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v17);
  }
  objc_msgSend(v7, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "collectionView:numberOfItemsInSection:", v9, v8);

  return v19;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[GKCollectionViewAggregateDataSource mappingForGlobalSection:](self, "mappingForGlobalSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localIndexPathForGlobalIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewAggregateDataSource wrapperForView:mapping:](self, "wrapperForView:mapping:", v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "collectionView:cellForItemAtIndexPath:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  -[GKCollectionViewAggregateDataSource updateMappings](self, "updateMappings", a3);
  return self->_sectionCount;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[GKCollectionViewAggregateDataSource collectionView:evaluateFactoryForSupplementaryElementOfKind:atIndexPath:isRecursive:](self, "collectionView:evaluateFactoryForSupplementaryElementOfKind:atIndexPath:isRecursive:", v8, v9, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[GKCollectionViewAggregateDataSource mappingForGlobalSection:](self, "mappingForGlobalSection:", objc_msgSend(v10, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0)
    {

LABEL_6:
      -[GKCollectionViewDataSource collectionView:defaultViewForSupplementaryElementOfKind:atIndexPath:](self, "collectionView:defaultViewForSupplementaryElementOfKind:atIndexPath:", v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v12, "localIndexPathForGlobalIndexPath:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewAggregateDataSource wrapperForView:mapping:](self, "wrapperForView:mapping:", v8, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "collectionView:viewForSupplementaryElementOfKind:atIndexPath:", v16, v9, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_6;
  }
LABEL_7:

  return v11;
}

- (id)collectionView:(id)a3 evaluateFactoryForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5 isRecursive:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v6)
    goto LABEL_6;
  -[GKCollectionViewAggregateDataSource mappingForGlobalSection:](self, "mappingForGlobalSection:", objc_msgSend(v12, "section"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) == 0)
  {

LABEL_6:
    v22.receiver = self;
    v22.super_class = (Class)GKCollectionViewAggregateDataSource;
    -[GKCollectionViewDataSource collectionView:evaluateFactoryForSupplementaryElementOfKind:atIndexPath:isRecursive:](&v22, sel_collectionView_evaluateFactoryForSupplementaryElementOfKind_atIndexPath_isRecursive_, v10, v11, v13, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v14, "localIndexPathForGlobalIndexPath:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewAggregateDataSource wrapperForView:mapping:](self, "wrapperForView:mapping:", v10, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "collectionView:evaluateFactoryForSupplementaryElementOfKind:atIndexPath:isRecursive:", v18, v11, v17, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    goto LABEL_6;
LABEL_7:

  return v20;
}

- (id)createMetricsTreeWithGridLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GKCollectionViewAggregateDataSource;
  -[GKCollectionViewDataSource createMetricsTreeWithGridLayout:](&v21, sel_createMetricsTreeWithGridLayout_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GKCollectionViewAggregateDataSource numberOfSectionsInCollectionView:](self, "numberOfSectionsInCollectionView:", v6);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_mappings, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = self->_mappings;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "dataSource", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "createMetricsTreeWithGridLayout:", v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "addObject:", v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v11);
  }

  objc_msgSend(v5, "setChildMetrics:", v8);
  objc_msgSend(v5, "setLocalSectionRange:", 0, v7);

  return v5;
}

- (void)collectionViewWillBecomeActive:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GKCollectionViewAggregateDataSource;
  -[GKCollectionViewDataSource collectionViewWillBecomeActive:](&v15, sel_collectionViewWillBecomeActive_, v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[GKCollectionViewAggregateDataSource allDataSources](self, "allDataSources", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v10, "collectionViewWillBecomeActive:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

}

- (void)collectionViewDidBecomeInactive:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GKCollectionViewAggregateDataSource;
  -[GKCollectionViewDataSource collectionViewDidBecomeInactive:](&v15, sel_collectionViewDidBecomeInactive_, v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[GKCollectionViewAggregateDataSource allDataSources](self, "allDataSources", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v10, "collectionViewDidBecomeInactive:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

}

- (id)allDataSources
{
  void *v3;
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMapTable count](self->_dataSourceToMappings, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_dataSourceToMappings;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        -[NSMapTable objectForKeyedSubscript:](self->_dataSourceToMappings, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dataSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[GKCollectionViewAggregateDataSource mappingForGlobalSection:](self, "mappingForGlobalSection:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localIndexPathForGlobalIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)indexPathsForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewAggregateDataSource allDataSources](self, "allDataSources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[GKCollectionViewAggregateDataSource mappingForDataSource:](self, "mappingForDataSource:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "indexPathsForItem:", v4);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __57__GKCollectionViewAggregateDataSource_indexPathsForItem___block_invoke;
          v17[3] = &unk_1E59C9198;
          v18 = v12;
          objc_msgSend(v14, "_gkMapWithBlock:", v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObjectsFromArray:", v15);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  return v5;
}

uint64_t __57__GKCollectionViewAggregateDataSource_indexPathsForItem___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "globalIndexPathForLocalIndexPath:", a2);
}

- (BOOL)item:(id)a3 matchesSearchTerms:(id)a4 inSection:(int64_t)a5
{
  NSMutableDictionary *globalSectionToMappings;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  globalSectionToMappings = self->_globalSectionToMappings;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "numberWithInteger:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](globalSectionToMappings, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v13, "item:matchesSearchTerms:inSection:", v10, v9, objc_msgSend(v12, "localSectionForGlobalSection:", a5));

  return a5;
}

- (void)configureCollectionView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKCollectionViewAggregateDataSource updateMappings](self, "updateMappings");
  -[GKCollectionViewAggregateDataSource allDataSources](self, "allDataSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)GKCollectionViewAggregateDataSource;
  -[GKCollectionViewDataSource configureCollectionView:](&v18, sel_configureCollectionView_, v4);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[GKCollectionViewAggregateDataSource mappingForDataSource:](self, "mappingForDataSource:", v11, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKCollectionViewAggregateDataSource wrapperForView:mapping:](self, "wrapperForView:mapping:", v4, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "configureCollectionView:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v8);
  }

}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4 updateNotifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  unsigned int v23;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D253F0], "updateGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewAggregateDataSource allDataSources](self, "allDataSources");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __90__GKCollectionViewAggregateDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke;
  v20[3] = &unk_1E59C91C0;
  v13 = v10;
  v23 = a3;
  v21 = v13;
  v22 = v8;
  v14 = v8;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v20);

  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __90__GKCollectionViewAggregateDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_3;
  v17[3] = &unk_1E59C4708;
  v18 = v9;
  v19 = v13;
  v15 = v13;
  v16 = v9;
  objc_msgSend(v15, "join:", v17);

}

void __90__GKCollectionViewAggregateDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  int v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90__GKCollectionViewAggregateDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_2;
  v6[3] = &unk_1E59C7840;
  v7 = v3;
  v9 = *(_DWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "performOnQueue:block:", MEMORY[0x1E0C80D38], v6);

}

uint64_t __90__GKCollectionViewAggregateDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshContentsForDataType:userInfo:updateNotifier:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), a2);
}

uint64_t __90__GKCollectionViewAggregateDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addUpdatesFromGroup:", *(_QWORD *)(a1 + 40));
}

- (void)removeItemAtIndexPath:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[GKCollectionViewAggregateDataSource mappingForGlobalSection:](self, "mappingForGlobalSection:", objc_msgSend(v7, "section"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localIndexPathForGlobalIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeItemAtIndexPath:completionHandler:", v8, v6);

}

- (void)dataSource:(id)a3 didInsertItemsAtIndexPaths:(id)a4
{
  id v5;

  -[GKCollectionViewAggregateDataSource globalIndexPathsForLocal:dataSource:](self, "globalIndexPathsForLocal:dataSource:", a4, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewDataSource notifyItemsInsertedAtIndexPaths:](self, "notifyItemsInsertedAtIndexPaths:", v5);

}

- (void)dataSource:(id)a3 didRemoveItemsAtIndexPaths:(id)a4
{
  id v5;

  -[GKCollectionViewAggregateDataSource globalIndexPathsForLocal:dataSource:](self, "globalIndexPathsForLocal:dataSource:", a4, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewDataSource notifyItemsRemovedAtIndexPaths:](self, "notifyItemsRemovedAtIndexPaths:", v5);

}

- (void)dataSource:(id)a3 didRefreshItemsAtIndexPaths:(id)a4
{
  id v5;

  -[GKCollectionViewAggregateDataSource globalIndexPathsForLocal:dataSource:](self, "globalIndexPathsForLocal:dataSource:", a4, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewDataSource notifyItemsRefreshedAtIndexPaths:](self, "notifyItemsRefreshedAtIndexPaths:", v5);

}

- (void)dataSource:(id)a3 didMoveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  -[GKCollectionViewAggregateDataSource mappingForDataSource:](self, "mappingForDataSource:", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "globalIndexPathForLocalIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "globalIndexPathForLocalIndexPath:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKCollectionViewDataSource notifyItemMovedFromIndexPath:toIndexPaths:](self, "notifyItemMovedFromIndexPath:toIndexPaths:", v10, v11);
}

- (void)dataSource:(id)a3 didInsertSections:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    -[GKCollectionViewAggregateDataSource updateMappings](self, "updateMappings");
    -[GKCollectionViewAggregateDataSource globalSectionsForLocal:dataSource:](self, "globalSectionsForLocal:dataSource:", v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[GKCollectionViewDataSource notifySectionsInserted:](self, "notifySectionsInserted:", v8);
  }
}

- (void)dataSource:(id)a3 didRemoveSections:(id)a4
{
  id v5;

  if (a4)
  {
    -[GKCollectionViewAggregateDataSource globalSectionsForLocal:dataSource:](self, "globalSectionsForLocal:dataSource:", a4, a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewDataSource notifySectionsRemoved:](self, "notifySectionsRemoved:", v5);
    -[GKCollectionViewAggregateDataSource updateMappings](self, "updateMappings");

  }
}

- (void)dataSource:(id)a3 didRefreshSections:(id)a4
{
  id v5;

  if (a4)
  {
    -[GKCollectionViewAggregateDataSource globalSectionsForLocal:dataSource:](self, "globalSectionsForLocal:dataSource:", a4, a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewDataSource notifySectionsRefreshed:](self, "notifySectionsRefreshed:", v5);
    -[GKCollectionViewAggregateDataSource updateMappings](self, "updateMappings");

  }
}

- (void)dataSource:(id)a3 didMoveSection:(int64_t)a4 toSection:(int64_t)a5
{
  id v8;

  -[GKCollectionViewAggregateDataSource mappingForDataSource:](self, "mappingForDataSource:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewDataSource notifySectionMovedFrom:to:](self, "notifySectionMovedFrom:to:", objc_msgSend(v8, "globalSectionForLocalSection:", a4), objc_msgSend(v8, "globalSectionForLocalSection:", a5));
  -[GKCollectionViewAggregateDataSource updateMappings](self, "updateMappings");

}

- (void)dataSource:(id)a3 performBatchUpdate:(id)a4 complete:(id)a5
{
  -[GKCollectionViewDataSource notifyBatchUpdate:complete:](self, "notifyBatchUpdate:complete:", a4, a5);
}

- (BOOL)containsDataSource:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKCollectionViewAggregateDataSource allDataSources](self, "allDataSources");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "containsDataSource:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSMutableArray)mappings
{
  return self->_mappings;
}

- (void)setMappings:(id)a3
{
  objc_storeStrong((id *)&self->_mappings, a3);
}

- (NSMapTable)dataSourceToMappings
{
  return self->_dataSourceToMappings;
}

- (void)setDataSourceToMappings:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceToMappings, a3);
}

- (NSMutableDictionary)globalSectionToMappings
{
  return self->_globalSectionToMappings;
}

- (void)setGlobalSectionToMappings:(id)a3
{
  objc_storeStrong((id *)&self->_globalSectionToMappings, a3);
}

- (unint64_t)sectionCount
{
  return self->_sectionCount;
}

- (void)setSectionCount:(unint64_t)a3
{
  self->_sectionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalSectionToMappings, 0);
  objc_storeStrong((id *)&self->_dataSourceToMappings, 0);
  objc_storeStrong((id *)&self->_mappings, 0);
}

@end
