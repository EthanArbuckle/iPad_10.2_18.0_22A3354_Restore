@implementation GKAggregateMapping

- (id)copyWithZone:(_NSZone *)a3
{
  GKAggregateMapping *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[GKAggregateMapping init](+[GKAggregateMapping allocWithZone:](GKAggregateMapping, "allocWithZone:", a3), "init");
  -[GKAggregateMapping dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAggregateMapping setDataSource:](v4, "setDataSource:", v5);

  -[GKAggregateMapping globalToLocalSections](self, "globalToLocalSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAggregateMapping setGlobalToLocalSections:](v4, "setGlobalToLocalSections:", v6);

  -[GKAggregateMapping localToGlobalSections](self, "localToGlobalSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAggregateMapping setLocalToGlobalSections:](v4, "setLocalToGlobalSections:", v7);

  -[GKAggregateMapping globalSectionsToTags](self, "globalSectionsToTags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAggregateMapping setGlobalSectionsToTags:](v4, "setGlobalSectionsToTags:", v8);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)GKAggregateMapping;
  -[GKAggregateMapping description](&v19, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ ("), v4);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allKeys](self->_globalSectionsToTags, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_globalToLocalSections, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_globalSectionsToTags, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 & 1) == 0)
          objc_msgSend(v3, "appendString:", CFSTR(", "));
        objc_msgSend(v3, "appendFormat:", CFSTR("%@ -> %@[%@]"), v10, v12, v11);

        v8 = 0;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      v8 = 0;
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR(")"));
  return v3;
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _gkTabStringForTabLevel();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAggregateMapping _gkDescription](self, "_gkDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@%@"), v6, v7);

  v8 = (id)_gkUnicodifyDescription();
  -[GKCollectionViewDataSource _gkDescriptionWithChildren:](self->_dataSource, "_gkDescriptionWithChildren:", a3 + 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@"), v9);

  return v5;
}

- (unint64_t)localSectionForGlobalSection:(unint64_t)a3
{
  NSMutableDictionary *globalToLocalSections;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;

  globalToLocalSections = self->_globalToLocalSections;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](globalToLocalSections, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("globalSection %ld not found in globalToLocalSections: %@"), a3, self->_globalToLocalSections);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewAggregateDataSourcePrivate.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ (localSection != nil)\n[%s (%s:%d)]"), v9, "-[GKAggregateMapping localSectionForGlobalSection:]", objc_msgSend(v11, "UTF8String"), 100);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v12);
  }
  v13 = objc_msgSend(v7, "unsignedIntegerValue");

  return v13;
}

- (unint64_t)globalSectionForLocalSection:(unint64_t)a3
{
  NSMutableDictionary *localToGlobalSections;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;

  localToGlobalSections = self->_localToGlobalSections;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](localToGlobalSections, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("localSection %ld not found in localToGlobalSections:%@"), a3, self->_localToGlobalSections);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewAggregateDataSourcePrivate.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ (globalSection != nil)\n[%s (%s:%d)]"), v9, "-[GKAggregateMapping globalSectionForLocalSection:]", objc_msgSend(v11, "UTF8String"), 107);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v12);
  }
  v13 = objc_msgSend(v7, "unsignedIntegerValue");

  return v13;
}

- (id)localIndexPathForGlobalIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  NSMutableDictionary *globalSectionsToTags;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[GKAggregateMapping localSectionForGlobalSection:](self, "localSectionForGlobalSection:", objc_msgSend(v4, "section"));
  v6 = objc_msgSend(v4, "item");
  globalSectionsToTags = self->_globalSectionsToTags;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](globalSectionsToTags, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKMappedIndexPath indexPathForItem:inSection:fromSourceIndexPath:withTag:](GKMappedIndexPath, "indexPathForItem:inSection:fromSourceIndexPath:withTag:", v6, v5, v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)globalIndexPathForLocalIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[GKAggregateMapping globalSectionForLocalSection:](self, "globalSectionForLocalSection:", objc_msgSend(v4, "section"));
  v6 = (void *)MEMORY[0x1E0CB36B0];
  v7 = objc_msgSend(v4, "item");

  return (id)objc_msgSend(v6, "indexPathForItem:inSection:", v7, v5);
}

- (GKAggregateMapping)init
{
  return -[GKAggregateMapping initWithGlobalToLocalMapping:](self, "initWithGlobalToLocalMapping:", 0);
}

- (GKAggregateMapping)initWithGlobalToLocalMapping:(id)a3
{
  id v4;
  GKAggregateMapping *v5;
  uint64_t v6;
  NSMutableDictionary *globalToLocalSections;
  uint64_t v8;
  NSMutableDictionary *localToGlobalSections;
  NSMutableDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *globalSectionsToTags;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GKAggregateMapping;
  v5 = -[GKAggregateMapping init](&v24, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v4);
    globalToLocalSections = v5->_globalToLocalSections;
    v5->_globalToLocalSections = (NSMutableDictionary *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](v5->_globalToLocalSections, "count"));
    localToGlobalSections = v5->_localToGlobalSections;
    v5->_localToGlobalSections = (NSMutableDictionary *)v8;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v5->_globalToLocalSections;
    v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](v5->_globalToLocalSections, "objectForKeyedSubscript:", v15, (_QWORD)v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_localToGlobalSections, "setObject:forKeyedSubscript:", v15, v16);

        }
        v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v12);
    }

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](v5->_globalToLocalSections, "count"));
    globalSectionsToTags = v5->_globalSectionsToTags;
    v5->_globalSectionsToTags = (NSMutableDictionary *)v17;

  }
  return v5;
}

- (id)tagForGlobalSection:(int64_t)a3
{
  NSMutableDictionary *globalSectionsToTags;
  void *v4;
  void *v5;

  globalSectionsToTags = self->_globalSectionsToTags;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](globalSectionsToTags, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addMappingFromGlobalSection:(unint64_t)a3 toLocalSection:(unint64_t)a4 withTag:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;

  v23 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_localToGlobalSections, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("collision while trying to add to a GKAggregateMapping"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewAggregateDataSourcePrivate.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ (_localToGlobalSections[localNum] == nil)\n[%s (%s:%d)]"), v12, "-[GKAggregateMapping addMappingFromGlobalSection:toLocalSection:withTag:]", objc_msgSend(v14, "UTF8String"), 156);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v15);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_globalToLocalSections, "setObject:forKeyedSubscript:", v9, v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localToGlobalSections, "setObject:forKeyedSubscript:", v8, v9);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_globalSectionsToTags, "objectForKeyedSubscript:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v23;
  if (v16)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("you must define a unique tag. %@ is already being used."), v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewAggregateDataSourcePrivate.m");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastPathComponent");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ (_globalSectionsToTags[globalNum] == nil)\n[%s (%s:%d)]"), v19, "-[GKAggregateMapping addMappingFromGlobalSection:toLocalSection:withTag:]", objc_msgSend(v21, "UTF8String"), 160);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v22);
    v17 = v23;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_globalSectionsToTags, "setObject:forKeyedSubscript:", v17, v8);

}

- (unint64_t)updateMappingsStartingWithGlobalSection:(unint64_t)a3
{
  unint64_t v5;
  void *v6;

  self->_sectionCount = -[GKCollectionViewDataSource numberOfSectionsInCollectionView:](self->_dataSource, "numberOfSectionsInCollectionView:", 0);
  -[NSMutableDictionary removeAllObjects](self->_globalToLocalSections, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_localToGlobalSections, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_globalSectionsToTags, "removeAllObjects");
  if (self->_sectionCount)
  {
    v5 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %ld"), self->_dynamicTag, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKAggregateMapping addMappingFromGlobalSection:toLocalSection:withTag:](self, "addMappingFromGlobalSection:toLocalSection:withTag:", a3 + v5, v5, v6);

      ++v5;
    }
    while (v5 < self->_sectionCount);
    a3 += v5;
  }
  return a3;
}

- (GKCollectionViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (int64_t)sectionCount
{
  return self->_sectionCount;
}

- (void)setSectionCount:(int64_t)a3
{
  self->_sectionCount = a3;
}

- (NSString)dynamicTag
{
  return self->_dynamicTag;
}

- (void)setDynamicTag:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicTag, a3);
}

- (NSMutableDictionary)globalToLocalSections
{
  return self->_globalToLocalSections;
}

- (void)setGlobalToLocalSections:(id)a3
{
  objc_storeStrong((id *)&self->_globalToLocalSections, a3);
}

- (NSMutableDictionary)localToGlobalSections
{
  return self->_localToGlobalSections;
}

- (void)setLocalToGlobalSections:(id)a3
{
  objc_storeStrong((id *)&self->_localToGlobalSections, a3);
}

- (NSMutableDictionary)globalSectionsToTags
{
  return self->_globalSectionsToTags;
}

- (void)setGlobalSectionsToTags:(id)a3
{
  objc_storeStrong((id *)&self->_globalSectionsToTags, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalSectionsToTags, 0);
  objc_storeStrong((id *)&self->_localToGlobalSections, 0);
  objc_storeStrong((id *)&self->_globalToLocalSections, 0);
  objc_storeStrong((id *)&self->_dynamicTag, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
