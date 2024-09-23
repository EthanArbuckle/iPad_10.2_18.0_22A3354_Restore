@implementation GKSplittingDataSource

- (GKSplittingDataSource)init
{
  GKSplittingDataSource *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *sectionToSectionInfo;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKSplittingDataSource;
  v2 = -[GKCollectionViewDataSource init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sectionToSectionInfo = v2->_sectionToSectionInfo;
    v2->_sectionToSectionInfo = v3;

  }
  return v2;
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  GKBasicCollectionViewDataSource *underlyingDataSource;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _gkTabStringForTabLevel();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)GKSplittingDataSource;
  -[GKCollectionViewDataSource _gkDescriptionWithChildren:](&v19, sel__gkDescriptionWithChildren_, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v7);

  underlyingDataSource = self->_underlyingDataSource;
  if (underlyingDataSource)
  {
    -[GKBasicCollectionViewDataSource _gkDescriptionWithChildren:](underlyingDataSource, "_gkDescriptionWithChildren:", a3 + 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "appendFormat:", CFSTR("%@    filter source: %@"), v6, v11);
  }
  v12 = -[NSMutableDictionary count](self->_sectionToSectionInfo, "count");
  if (v12 >= 1)
  {
    v13 = v12;
    objc_msgSend(v5, "appendFormat:", CFSTR("\n%@    sections {\n"), v6);
    for (i = 0; i != v13; ++i)
    {
      -[GKSplittingDataSource sectionInfoForSection:](self, "sectionInfoForSection:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("%@        %ld %@\n"), v6, i, v16);

    }
    objc_msgSend(v5, "appendFormat:", CFSTR("%@    }\n"), v6);
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("%@}\n"), v6);
  v17 = (id)_gkUnicodifyDescription();

  return v5;
}

- (void)setUnderlyingDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingDataSource, a3);
}

- (int64_t)sectionCount
{
  return -[NSMutableDictionary count](self->_sectionToSectionInfo, "count");
}

- (id)sectionInfoForSection:(int64_t)a3
{
  NSMutableDictionary *sectionToSectionInfo;
  void *v4;
  void *v5;

  sectionToSectionInfo = self->_sectionToSectionInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sectionToSectionInfo, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addSectionWithTitle:(id)a3 sortDescriptors:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  GKSectionInfo *v13;
  NSMutableDictionary *sectionToSectionInfo;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKSplittingDataSource.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ (sortDescriptors == ((void *)0) || [sortDescriptors isKindOfClass:[NSArray class]])\n[%s (%s:%d)]"), v8, "-[GKSplittingDataSource addSectionWithTitle:sortDescriptors:]", objc_msgSend(v10, "UTF8String"), 106);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
    }
  }
  v12 = -[NSMutableDictionary count](self->_sectionToSectionInfo, "count");
  v13 = objc_alloc_init(GKSectionInfo);
  -[GKSectionInfo setSection:](v13, "setSection:", v12);
  -[GKSectionInfo setSortDescriptors:](v13, "setSortDescriptors:", v6);
  -[GKSectionInfo setTitle:](v13, "setTitle:", v17);
  sectionToSectionInfo = self->_sectionToSectionInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](sectionToSectionInfo, "setObject:forKeyedSubscript:", v13, v15);

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewDataSource notifySectionsInserted:](self, "notifySectionsInserted:", v16);

}

- (void)setFilterPredicate:(id)a3 forSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKSplittingDataSource.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (predicate == ((void *)0) || [predicate isKindOfClass:[NSPredicate class]])\n[%s (%s:%d)]"), v7, "-[GKSplittingDataSource setFilterPredicate:forSection:]", objc_msgSend(v9, "UTF8String"), 118);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v10);
    }
  }
  -[GKSplittingDataSource sectionInfoForSection:](self, "sectionInfoForSection:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

}

- (void)setSortDescriptors:(id)a3 forSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKSplittingDataSource.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (sortDescriptors == ((void *)0) || [sortDescriptors isKindOfClass:[NSArray class]])\n[%s (%s:%d)]"), v7, "-[GKSplittingDataSource setSortDescriptors:forSection:]", objc_msgSend(v9, "UTF8String"), 126);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v10);
    }
  }
  -[GKSplittingDataSource sectionInfoForSection:](self, "sectionInfoForSection:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v12);

}

- (void)removeSection:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  id v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  NSMutableDictionary *sectionToSectionInfo;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSMutableDictionary *v18;
  int64_t v19;
  id v20;
  id v21;

  v5 = -[NSMutableDictionary count](self->_sectionToSectionInfo, "count");
  v19 = a3;
  if (v5 > a3)
  {
    v6 = v5;
    v7 = (id)(v5 - 1);
    v8 = a3;
    v20 = (id)(v5 - 1);
    do
    {
      v9 = v8 + 1;
      -[GKSplittingDataSource sectionInfoForSection:](self, "sectionInfoForSection:", v8 + 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        sectionToSectionInfo = self->_sectionToSectionInfo;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](sectionToSectionInfo, "setObject:forKeyedSubscript:", v10, v12);
      }
      else
      {
        if (v7 != (id)v8)
        {
          v13 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("consistency error with sectionInfos %@"), self->_sectionToSectionInfo);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKSplittingDataSource.m");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lastPathComponent");
          v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ (section == numSections-1)\n[%s (%s:%d)]"), v14, "-[GKSplittingDataSource removeSection:]", objc_msgSend(v16, "UTF8String"), 141);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v7 = v20;
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v17);

        }
        v18 = self->_sectionToSectionInfo;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v18, "removeObjectForKey:", v12);
      }

      v8 = v9;
    }
    while (v6 != v9);
  }
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v19);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewDataSource notifySectionsRemoved:](self, "notifySectionsRemoved:", v21);

}

- (void)removeAllSections
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, -[GKSplittingDataSource sectionCount](self, "sectionCount"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeAllObjects](self->_sectionToSectionInfo, "removeAllObjects");
  -[GKCollectionViewDataSource notifySectionsRemoved:](self, "notifySectionsRemoved:", v3);

}

- (id)itemsForSection:(int64_t)a3
{
  void *v3;
  void *v4;

  -[GKSplittingDataSource sectionInfoForSection:](self, "sectionInfoForSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)filteredItemsForRawItems:(id)a3
{
  return a3;
}

- (void)setItems:(id)a3 forSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;

  v6 = a3;
  -[GKSplittingDataSource sectionInfoForSection:](self, "sectionInfoForSection:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v7;
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKSplittingDataSource.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ (sectionInfo != ((void *)0))\n[%s (%s:%d)]"), v9, "-[GKSplittingDataSource setItems:forSection:]", objc_msgSend(v11, "UTF8String"), 174);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v12);
    v7 = 0;
  }
  objc_msgSend(v7, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v17, "setItems:", v14);
  v15 = objc_msgSend(v13, "isEqual:", v6);

  if ((v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewDataSource notifySectionsRefreshed:](self, "notifySectionsRefreshed:", v16);

  }
}

- (id)titleForSection:(int64_t)a3
{
  void *v3;
  void *v4;

  -[GKSplittingDataSource sectionInfoForSection:](self, "sectionInfoForSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4 updateNotifier:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  GKSplittingDataSource *v14;
  id v15;
  unsigned int v16;
  _QWORD v17[5];

  v7 = a5;
  objc_msgSend(MEMORY[0x1E0D253F0], "updateGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke;
  v17[3] = &unk_1E59C68B8;
  v17[4] = self;
  objc_msgSend(v8, "perform:", v17);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_2;
  v12[3] = &unk_1E59C6930;
  v13 = v8;
  v14 = self;
  v16 = a3;
  v15 = v7;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v11, "join:", v12);

}

uint64_t __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "refreshContentsForDataType:userInfo:updateNotifier:", 0, 0, a2);
}

void __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  _QWORD v8[5];
  int v9;

  objc_msgSend(*(id *)(a1 + 32), "applyUpdates");
  objc_msgSend(MEMORY[0x1E0D253F0], "updateGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_3;
  v8[3] = &unk_1E59C68E0;
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = *(_DWORD *)(a1 + 56);
  objc_msgSend(v2, "perform:", v8);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_4;
  v5[3] = &unk_1E59C54B8;
  v4 = *(void **)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 40);
  v6 = v4;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v2, "join:", v5);

}

uint64_t __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshAdditionalInfoForDataType:updateNotifier:", *(unsigned int *)(a1 + 40), a2);
}

void __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateError:", v5);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_5;
  v11[3] = &unk_1E59C6908;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(v6 + 80);
  v11[1] = 3221225472;
  v11[4] = v6;
  v12 = v2;
  v13 = v3;
  v14 = v7;
  v15 = *(id *)(a1 + 48);
  v9 = v3;
  v10 = v2;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);
  objc_msgSend(*(id *)(a1 + 32), "willUpdateSectionsWithItems:", v9);

}

void __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "filteredItemsForRawItems:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(void **)(a1 + 40);
    objc_msgSend(v6, "predicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredArrayUsingPredicate:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }
  objc_msgSend(v6, "sortDescriptors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "sortDescriptors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingDescriptors:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v14;
  }
  objc_msgSend(*(id *)(a1 + 32), "itemsForSection:", objc_msgSend(v5, "integerValue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", v15) & 1) == 0)
  {
    if (v7)
      v16 = v7;
    else
      v16 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v16, v5);
    v17 = *(void **)(a1 + 56);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_6;
    v19[3] = &unk_1E59C54B8;
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v7;
    v21 = v5;
    objc_msgSend(*(id *)(a1 + 64), "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addUpdate:error:", v19, v18);

  }
}

uint64_t __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItems:forSection:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "integerValue"));
}

- (void)collectionViewDidBecomeInactive:(id)a3
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_sectionToSectionInfo, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_27);
}

uint64_t __57__GKSplittingDataSource_collectionViewDidBecomeInactive___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setPredicate:", 0);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[GKSplittingDataSource sectionInfoForSection:](self, "sectionInfoForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (void)removeItemAtIndexPath:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[GKSplittingDataSource sectionInfoForSection:](self, "sectionInfoForSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("couldn't section for %@"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKSplittingDataSource.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ (sectionInfo != nil)\n[%s (%s:%d)]"), v10, "-[GKSplittingDataSource removeItemAtIndexPath:completionHandler:]", objc_msgSend(v12, "UTF8String"), 258);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }
  v14 = objc_msgSend(v6, "item");
  objc_msgSend(v8, "items");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__GKSplittingDataSource_removeItemAtIndexPath_completionHandler___block_invoke;
  v18[3] = &__block_descriptor_40_e11__24__0_8Q16l;
  v18[4] = v14;
  objc_msgSend(v15, "_gkFilterWithBlock:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItems:", v16);

  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewDataSource notifyItemsRemovedAtIndexPaths:](self, "notifyItemsRemovedAtIndexPaths:", v17);

  if (v7)
    v7[2](v7, 0);

}

id __65__GKSplittingDataSource_removeItemAtIndexPath_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(_QWORD *)(a1 + 32) == a3)
    return 0;
  else
    return a2;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[GKSplittingDataSource sectionInfoForSection:](self, "sectionInfoForSection:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = objc_msgSend(v4, "item"),
        objc_msgSend(v5, "items"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6 < v8))
  {
    objc_msgSend(v5, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)indexPathsForItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GKSplittingDataSource sectionCount](self, "sectionCount");
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = 0;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      -[GKSplittingDataSource sectionInfoForSection:](self, "sectionInfoForSection:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "items");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v9;
      v13[1] = 3221225472;
      v13[2] = __43__GKSplittingDataSource_indexPathsForItem___block_invoke;
      v13[3] = &unk_1E59C6998;
      v14 = v4;
      v15 = v5;
      v16 = v8;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

      ++v8;
    }
    while (v7 != v8);
  }

  return v5;
}

void __43__GKSplittingDataSource_indexPathsForItem___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  if (objc_msgSend(a2, "isEqual:", a1[4]))
  {
    v5 = (void *)a1[5];
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, a1[6]);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

- (GKBasicCollectionViewDataSource)underlyingDataSource
{
  return self->_underlyingDataSource;
}

- (NSMutableDictionary)sectionToSectionInfo
{
  return self->_sectionToSectionInfo;
}

- (void)setSectionToSectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sectionToSectionInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionToSectionInfo, 0);
  objc_storeStrong((id *)&self->_underlyingDataSource, 0);
}

@end
