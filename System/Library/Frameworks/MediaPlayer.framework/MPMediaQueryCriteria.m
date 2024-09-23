@implementation MPMediaQueryCriteria

- (unint64_t)hash
{
  unint64_t v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSSet *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = self->_entityLimit + 29 * self->_groupingType;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = self->_orderingProperties;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v38;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v38 != v7)
          objc_enumerationMutation(v4);
        v3 ^= objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v8++), "hash");
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v6);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = self->_filterPredicates;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        v3 ^= objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v13++), "hash");
      }
      while (v11 != v13);
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v11);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = self->_itemPropertiesToFetch;
  v15 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        v3 ^= objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v18++), "hash");
      }
      while (v16 != v18);
      v16 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v16);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = self->_collectionPropertiesToFetch;
  v20 = -[NSSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v19);
        v3 ^= objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v23++), "hash", (_QWORD)v25);
      }
      while (v21 != v23);
      v21 = -[NSSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v21);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderingDirectionMappings, 0);
  objc_storeStrong((id *)&self->_collectionPropertiesToFetch, 0);
  objc_storeStrong((id *)&self->_itemPropertiesToFetch, 0);
  objc_storeStrong((id *)&self->_orderingProperties, 0);
  objc_storeStrong((id *)&self->_filterPredicates, 0);
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  NSArray *v5;
  NSMutableSet *v6;
  NSSet *v7;
  NSSet *v8;
  BOOL v9;

  v4 = (unsigned __int8 *)a3;
  v9 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && *((_QWORD *)v4 + 2) == self->_entityOrder
    && *((_QWORD *)v4 + 3) == self->_groupingType
    && *((_QWORD *)v4 + 4) == self->_entityLimit
    && ((v5 = (NSArray *)*((_QWORD *)v4 + 5), v5 == self->_orderingProperties)
     || -[NSArray isEqualToArray:](v5, "isEqualToArray:"))
    && ((v6 = (NSMutableSet *)*((_QWORD *)v4 + 1), v6 == self->_filterPredicates)
     || -[NSMutableSet isEqualToSet:](v6, "isEqualToSet:"))
    && ((v7 = (NSSet *)*((_QWORD *)v4 + 6), v7 == self->_itemPropertiesToFetch)
     || -[NSSet isEqualToSet:](v7, "isEqualToSet:"))
    && ((v8 = (NSSet *)*((_QWORD *)v4 + 7), v8 == self->_collectionPropertiesToFetch)
     || -[NSSet isEqualToSet:](v8, "isEqualToSet:"))
    && v4[64] == self->_useSections
    && v4[65] == self->_ignoreSystemFilterPredicates
    && v4[66] == self->_ignoreRestrictionsPredicates
    && v4[67] == self->_includeNonLibraryEntities
    && v4[68] == self->_includeEntitiesWithBlankNames
    && (NSDictionary *)*((_QWORD *)v4 + 9) == self->_orderingDirectionMappings;

  return v9;
}

- (id)ML3ItemsQueryInLibrary:(id)a3 orderingTerms:(id)a4 nameBlankProperty:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  _BOOL8 useSections;
  id v40;
  void *v41;
  MPMediaQueryCriteria *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v40 = a4;
  v43 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v42 = self;
  -[MPMediaQueryCriteria filterPredicates](self, "filterPredicates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v50;
    v44 = *MEMORY[0x1E0D508D8];
    v45 = *MEMORY[0x1E0D50918];
    v46 = *MEMORY[0x1E0D50A58];
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v50 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "property");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "isEqualToString:", CFSTR("playlistPersistentID")))
          {
            objc_msgSend(v15, "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "longLongValue");
            goto LABEL_17;
          }
          if (objc_msgSend(v16, "isEqualToString:", CFSTR("name")))
          {
            v19 = (void *)MEMORY[0x1E0D51230];
            v20 = (void *)MEMORY[0x1E0D51218];
            objc_msgSend(v15, "value");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "predicateWithProperty:equalToValue:", v46, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "anyInLibrary:predicate:", v47, v22);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_16;
          }
          if (objc_msgSend(v16, "isEqualToString:", CFSTR("cloudPlaylistUniversalLibraryID")))
          {
            v23 = (void *)MEMORY[0x1E0D51230];
            v24 = (void *)MEMORY[0x1E0D51218];
            objc_msgSend(v15, "value");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v24;
            v27 = v45;
            goto LABEL_15;
          }
          if (objc_msgSend(v16, "isEqualToString:", CFSTR("cloudGlobalID")))
          {
            v23 = (void *)MEMORY[0x1E0D51230];
            v28 = (void *)MEMORY[0x1E0D51218];
            objc_msgSend(v15, "value");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v28;
            v27 = v44;
LABEL_15:
            objc_msgSend(v26, "predicateWithProperty:equalToValue:", v27, v25, v40);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "anyInLibrary:predicate:", v47, v29);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
            v18 = objc_msgSend(v17, "persistentID", v40);
LABEL_17:
            v11 = v18;

            v12 = 1;
            goto LABEL_21;
          }

        }
        objc_msgSend(v15, "ML3PredicateForTrack", v40);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v48, "addObject:", v16);
LABEL_21:

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (!v10)
        goto LABEL_25;
    }
  }
  v11 = 0;
  v12 = 0;
LABEL_25:

  if (v43 && -[MPMediaQueryCriteria excludesEntitiesWithBlankNames](v42, "excludesEntitiesWithBlankNames"))
  {
    objc_msgSend(MEMORY[0x1E0D51298], "predicateWithProperty:", v43);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addObject:", v30);

  }
  objc_msgSend(MEMORY[0x1E0D511D8], "predicateMatchingPredicates:", v48, v40);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[MPMediaQueryCriteria groupingType](v42, "groupingType");
  v33 = v32;
  if ((v12 & 1) != 0)
  {
    v34 = v41;
    if (!v41 && v32)
    {
      -[MPMediaQueryCriteria ML3OrderingTermsForGroupingType:](v42, "ML3OrderingTermsForGroupingType:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v35 = (void *)objc_msgSend(MEMORY[0x1E0D51230], "newWithPersistentID:inLibrary:", v11, v47);
    objc_msgSend(MEMORY[0x1E0D512C8], "containerQueryWithContainer:predicate:orderingTerms:", v35, v31, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
      goto LABEL_48;
LABEL_42:
    if (-[MPMediaQueryCriteria ignoreSystemFilterPredicates](v42, "ignoreSystemFilterPredicates"))
      objc_msgSend(v36, "setIgnoreSystemFilterPredicates:", 1);
    if (-[MPMediaQueryCriteria ignoreRestrictionsPredicates](v42, "ignoreRestrictionsPredicates"))
      objc_msgSend(v36, "setIgnoreRestrictionsPredicates:", 1);
    if (v42->_entityLimit)
      objc_msgSend(v36, "setLimit:");
    goto LABEL_48;
  }
  v34 = v41;
  if (!v41)
  {
    if (-[MPMediaQueryCriteria entityOrder](v42, "entityOrder") == 2)
    {
      -[MPMediaQueryCriteria ML3OrderingTermsForGroupingType:](v42, "ML3OrderingTermsForGroupingType:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = 0;
    }
  }
  v37 = -[MPMediaQueryCriteria includeNonLibraryEntities](v42, "includeNonLibraryEntities");
  useSections = v42->_useSections;
  if (v37)
    objc_msgSend(MEMORY[0x1E0D512C8], "allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:", v47, v31, v34, useSections);
  else
    objc_msgSend(MEMORY[0x1E0D512C8], "queryWithLibrary:predicate:orderingTerms:usingSections:", v47, v31, v34, useSections);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
    goto LABEL_42;
LABEL_48:

  return v36;
}

- (id)predicateForProperty:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_filterPredicates;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "property", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if (v11)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)includeNonLibraryEntities
{
  return self->_includeNonLibraryEntities;
}

- (BOOL)ignoreSystemFilterPredicates
{
  return self->_ignoreSystemFilterPredicates;
}

- (BOOL)ignoreRestrictionsPredicates
{
  return self->_ignoreRestrictionsPredicates;
}

- (NSSet)filterPredicates
{
  return &self->_filterPredicates->super;
}

- (BOOL)excludesEntitiesWithBlankNames
{
  BOOL v2;
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_includeEntitiesWithBlankNames)
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_filterPredicates;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (excludesEntitiesWithBlankNames_once != -1)
            dispatch_once(&excludesEntitiesWithBlankNames_once, &__block_literal_global_28394);
          objc_msgSend(v8, "property", (_QWORD)v15);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend((id)excludesEntitiesWithBlankNames_allowedBlankNameProperties, "containsObject:", v9) & 1) != 0)
            goto LABEL_21;
          if (objc_msgSend(v9, "isEqualToString:", CFSTR("mediaType")))
          {
            objc_msgSend(v8, "value");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v8, "value");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "integerValue");

              if (v13)
              {
                if (v13 == 4 || (v13 & 0xFFFFFFFFFFFF00FFLL) == 0)
                {
LABEL_21:

                  v2 = 0;
                  goto LABEL_22;
                }
              }
            }
          }

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
  v2 = 1;
LABEL_22:

  return v2;
}

- (unint64_t)entityOrder
{
  return self->_entityOrder;
}

- (int64_t)groupingType
{
  return self->_groupingType;
}

- (void)setOrderingProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setGroupingType:(int64_t)a3
{
  self->_groupingType = a3;
}

- (void)setEntityLimit:(unint64_t)a3
{
  self->_entityLimit = a3;
}

- (void)addFilterPredicate:(id)a3
{
  NSMutableSet *filterPredicates;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;
  objc_class *v8;
  id v9;
  NSMutableSet *v10;

  filterPredicates = self->_filterPredicates;
  if (filterPredicates)
  {
    v5 = filterPredicates;
    v6 = self->_filterPredicates;
    self->_filterPredicates = v5;
    v7 = a3;
  }
  else
  {
    v8 = (objc_class *)MEMORY[0x1E0C99E20];
    v9 = a3;
    v10 = (NSMutableSet *)objc_alloc_init(v8);
    v6 = self->_filterPredicates;
    self->_filterPredicates = v10;
  }

  -[NSMutableSet addObject:](self->_filterPredicates, "addObject:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 16) = self->_entityOrder;
  *(_QWORD *)(v4 + 24) = self->_groupingType;
  *(_QWORD *)(v4 + 32) = self->_entityLimit;
  v5 = -[NSArray copy](self->_orderingProperties, "copy");
  v6 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v5;

  v7 = -[NSDictionary copy](self->_orderingDirectionMappings, "copy");
  v8 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v7;

  v9 = -[NSMutableSet mutableCopy](self->_filterPredicates, "mutableCopy");
  v10 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v9;

  v11 = -[NSSet copy](self->_itemPropertiesToFetch, "copy");
  v12 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v11;

  v13 = -[NSSet copy](self->_collectionPropertiesToFetch, "copy");
  v14 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v13;

  *(_BYTE *)(v4 + 64) = self->_useSections;
  *(_BYTE *)(v4 + 65) = self->_ignoreSystemFilterPredicates;
  *(_BYTE *)(v4 + 66) = self->_ignoreRestrictionsPredicates;
  *(_BYTE *)(v4 + 67) = self->_includeNonLibraryEntities;
  *(_BYTE *)(v4 + 68) = self->_includeEntitiesWithBlankNames;
  return (id)v4;
}

- (MPMediaQueryCriteria)init
{
  MPMediaQueryCriteria *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPMediaQueryCriteria;
  result = -[MPMediaQueryCriteria init](&v3, sel_init);
  if (result)
  {
    result->_entityOrder = 2;
    result->_useSections = 1;
  }
  return result;
}

- (void)setFilterPredicates:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *v5;
  char isKindOfClass;
  NSMutableSet *v7;
  NSMutableSet *filterPredicates;
  NSMutableSet *v9;

  v4 = (NSMutableSet *)a3;
  v5 = v4;
  if (self->_filterPredicates != v4)
  {
    v9 = v4;
    if (v4)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v5 = v9;
      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("filter predicates must be an NSSet"));
        v5 = v9;
      }
    }
    v7 = (NSMutableSet *)-[NSMutableSet mutableCopy](v5, "mutableCopy");
    filterPredicates = self->_filterPredicates;
    self->_filterPredicates = v7;

    v5 = v9;
  }

}

- (id)ML3ItemsQueryInLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MPMediaQueryCriteria orderingProperties](self, "orderingProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaQueryCriteria orderingDirectionMappings](self, "orderingDirectionMappings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaQueryCriteria ML3OrderingTermsForMPOrderingProperties:directionalityMapping:entityClass:](self, "ML3OrderingTermsForMPOrderingProperties:directionalityMapping:entityClass:", v5, v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPMediaQueryCriteria ML3ItemsQueryInLibrary:orderingTerms:nameBlankProperty:](self, "ML3ItemsQueryInLibrary:orderingTerms:nameBlankProperty:", v4, v7, *MEMORY[0x1E0D51170]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)ML3CollectionsQueryInLibrary:(id)a3
{
  id v4;
  int64_t v5;
  id v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  unint64_t v27;
  __CFString *v28;
  id v29;
  void *v30;
  __CFString *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  __CFString *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[MPMediaQueryCriteria groupingType](self, "groupingType");
  v6 = 0;
  v7 = (id *)MEMORY[0x1E0D50B90];
  switch(v5)
  {
    case 0:
    case 22:
      v7 = (id *)MEMORY[0x1E0D51170];
      goto LABEL_7;
    case 1:
    case 7:
    case 9:
    case 10:
    case 12:
    case 17:
    case 21:
      goto LABEL_7;
    case 2:
    case 8:
      v7 = (id *)MEMORY[0x1E0D50BB8];
      goto LABEL_7;
    case 3:
    case 14:
    case 18:
      v7 = (id *)MEMORY[0x1E0D50B68];
      goto LABEL_7;
    case 4:
    case 15:
    case 19:
      v7 = (id *)MEMORY[0x1E0D50C70];
      goto LABEL_7;
    case 5:
    case 16:
    case 20:
      v7 = (id *)MEMORY[0x1E0D50D80];
LABEL_7:
      v6 = *v7;
      goto LABEL_8;
    case 6:
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      -[MPMediaQueryCriteria filterPredicates](self, "filterPredicates", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v34 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "ML3PredicateForContainer");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
              objc_msgSend(v6, "addObject:", v22);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        }
        while (v19);
      }

      objc_msgSend(MEMORY[0x1E0D511D8], "predicateMatchingPredicates:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaQueryCriteria orderingProperties](self, "orderingProperties");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaQueryCriteria orderingDirectionMappings](self, "orderingDirectionMappings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaQueryCriteria ML3OrderingTermsForMPOrderingProperties:directionalityMapping:entityClass:](self, "ML3OrderingTermsForMPOrderingProperties:directionalityMapping:entityClass:", v23, v24, objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0D51230], "defaultOrderingTerms");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (-[MPMediaQueryCriteria includeNonLibraryEntities](self, "includeNonLibraryEntities"))
        objc_msgSend(MEMORY[0x1E0D51230], "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", v4, v13, v14);
      else
        objc_msgSend(MEMORY[0x1E0D51230], "queryWithLibrary:predicate:orderingTerms:", v4, v13, v14);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v25;
      if (v25)
      {
        if (self->_entityLimit)
          objc_msgSend(v25, "setLimit:");
        if (-[MPMediaQueryCriteria ignoreSystemFilterPredicates](self, "ignoreSystemFilterPredicates"))
          objc_msgSend(v30, "setIgnoreSystemFilterPredicates:", 1);
        if (-[MPMediaQueryCriteria ignoreRestrictionsPredicates](self, "ignoreRestrictionsPredicates"))
          objc_msgSend(v30, "setIgnoreRestrictionsPredicates:", 1);
      }
      goto LABEL_38;
    default:
LABEL_8:
      -[MPMediaQueryCriteria orderingProperties](self, "orderingProperties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaQueryCriteria orderingDirectionMappings](self, "orderingDirectionMappings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaQueryCriteria ML3OrderingTermsForMPOrderingProperties:directionalityMapping:entityClass:](self, "ML3OrderingTermsForMPOrderingProperties:directionalityMapping:entityClass:", v8, v9, objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = v10;
      }
      else
      {
        -[MPMediaQueryCriteria ML3OrderingTermsForGroupingType:](self, "ML3OrderingTermsForGroupingType:", v5);
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = v12;

      -[MPMediaQueryCriteria ML3ItemsQueryInLibrary:orderingTerms:nameBlankProperty:](self, "ML3ItemsQueryInLibrary:orderingTerms:nameBlankProperty:", v4, v13, v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      switch(v5)
      {
        case 0:
        case 22:
          goto LABEL_50;
        case 1:
        case 7:
        case 10:
        case 12:
        case 13:
        case 17:
        case 21:
          v15 = (void *)MEMORY[0x1E0D511C8];
          v16 = (_QWORD *)MEMORY[0x1E0D50B98];
          goto LABEL_34;
        case 2:
        case 8:
          v15 = (void *)MEMORY[0x1E0D511E8];
          v16 = (_QWORD *)MEMORY[0x1E0D50BC8];
          goto LABEL_34;
        case 3:
        case 14:
        case 18:
          v15 = (void *)MEMORY[0x1E0D511D0];
          v16 = (_QWORD *)MEMORY[0x1E0D50B70];
          goto LABEL_34;
        case 4:
        case 15:
        case 19:
          v15 = (void *)MEMORY[0x1E0D51220];
          v16 = (_QWORD *)MEMORY[0x1E0D50C78];
          goto LABEL_34;
        case 5:
        case 16:
        case 20:
          v15 = (void *)MEMORY[0x1E0D51258];
          v16 = (_QWORD *)MEMORY[0x1E0D50D70];
          goto LABEL_34;
        case 9:
          v15 = (void *)MEMORY[0x1E0D511C8];
          v16 = (_QWORD *)MEMORY[0x1E0D50FE8];
LABEL_34:
          objc_msgSend(v15, "aggregateQueryWithUnitQuery:foreignPersistentIDProperty:", v14, *v16);
          v29 = (id)objc_claimAutoreleasedReturnValue();
          break;
        default:
          v26 = os_log_create("com.apple.amp.mediaplayer", "Library");
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v27 = -[MPMediaQueryCriteria groupingType](self, "groupingType");
            if (v27 > 0x16)
              v28 = CFSTR("(unknown grouping type)");
            else
              v28 = off_1E3155020[v27];
            v32 = v28;
            *(_DWORD *)buf = 138412290;
            v38 = v32;
            _os_log_impl(&dword_193B9B000, v26, OS_LOG_TYPE_ERROR, "no ML3 collection query for grouping type %@, using items query", buf, 0xCu);

          }
LABEL_50:
          v29 = v14;
          break;
      }
      v30 = v29;
      if (v29 && self->_entityLimit)
        objc_msgSend(v29, "setLimit:");
LABEL_38:

      return v30;
  }
}

- (id)ML3OrderingTermsForMPOrderingProperties:(id)a3 directionalityMapping:(id)a4 entityClass:(Class)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  id v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (ML3OrderingTermsForMPOrderingProperties_directionalityMapping_entityClass__onceToken != -1)
    dispatch_once(&ML3OrderingTermsForMPOrderingProperties_directionalityMapping_entityClass__onceToken, &__block_literal_global_20586);
  if (!objc_msgSend(v6, "count"))
  {
    v28 = 0;
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = v6;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (!v9)
    goto LABEL_25;
  v10 = v9;
  v11 = *(_QWORD *)v30;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v30 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v12);
      objc_msgSend(v7, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)ML3OrderingTermsForMPOrderingProperties_directionalityMapping_entityClass__orderingTermMap, "objectForKeyedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14)
      {
        if (v15)
        {
          v17 = (void *)MEMORY[0x1E0D51288];
          objc_msgSend(v15, "property");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "orderingTermWithProperty:direction:", v18, objc_msgSend(v14, "intValue"));
          v19 = objc_claimAutoreleasedReturnValue();

          v16 = (void *)v19;
          goto LABEL_18;
        }
        -[objc_class propertyForMPMediaEntityProperty:](a5, "propertyForMPMediaEntityProperty:", v13);
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
LABEL_23:
          v16 = 0;
          goto LABEL_20;
        }
        v18 = (void *)v22;
        objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:direction:", v22, objc_msgSend(v14, "intValue"));
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        v16 = (void *)v21;
LABEL_18:

        if (!v16)
          goto LABEL_21;
        goto LABEL_19;
      }
      if (!v15)
      {
        -[objc_class propertyForMPMediaEntityProperty:](a5, "propertyForMPMediaEntityProperty:", v13);
        v20 = objc_claimAutoreleasedReturnValue();
        if (!v20)
          goto LABEL_23;
        v18 = (void *)v20;
        objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", v20);
        v21 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
LABEL_19:
      objc_msgSend(v28, "addObject:", v16);
LABEL_20:

LABEL_21:
      ++v12;
    }
    while (v10 != v12);
    v23 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    v10 = v23;
  }
  while (v23);
LABEL_25:

  if (!objc_msgSend(v28, "count"))
  {
    v24 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v8;
      _os_log_impl(&dword_193B9B000, v24, OS_LOG_TYPE_ERROR, "Unable to create orderingTerms for properties: %@", buf, 0xCu);
    }

    v28 = 0;
  }
  v6 = v26;
LABEL_31:

  return v28;
}

- (NSArray)orderingProperties
{
  return self->_orderingProperties;
}

- (NSDictionary)orderingDirectionMappings
{
  return self->_orderingDirectionMappings;
}

- (id)ML3OrderingTermsForGroupingType:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[7];
  _QWORD v38[7];
  _QWORD v39[3];
  _QWORD v40[6];
  _QWORD v41[7];

  v41[6] = *MEMORY[0x1E0C80C00];
  v3 = 0;
  switch(a3)
  {
    case 0:
      -[MPMediaQueryCriteria predicateForProperty:](self, "predicateForProperty:", CFSTR("mediaType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[MPMediaQueryCriteria predicateForProperty:](self, "predicateForProperty:", CFSTR("mediaType"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "integerValue");

        if ((v19 & 0xFFFFFFFFFFFFFEFFLL) == 0x200)
          goto LABEL_7;
        -[MPMediaQueryCriteria predicateForProperty:](self, "predicateForProperty:", CFSTR("isITunesU"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "value");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "integerValue");

        if (v29 || (v19 & 1) == 0 && (v19 & 0x140A) != 0 && (v19 & 0xFFFFFFFFFFFFEAF5) == 0)
        {
          objc_msgSend(MEMORY[0x1E0D512C8], "podcastsEpisodesDefaultOrderingTerms");
          v4 = objc_claimAutoreleasedReturnValue();
          goto LABEL_37;
        }
      }
      -[MPMediaQueryCriteria predicateForProperty:](self, "predicateForProperty:", CFSTR("albumPID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {

      }
      else
      {
        -[MPMediaQueryCriteria predicateForProperty:](self, "predicateForProperty:", CFSTR("albumTitle"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v31)
          goto LABEL_36;
      }
      objc_msgSend(MEMORY[0x1E0D512C8], "albumAllArtistsDefaultOrderingTerms");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    case 1:
    case 10:
      objc_msgSend(MEMORY[0x1E0D512C8], "albumsDefaultOrderingTerms");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    case 2:
      objc_msgSend(MEMORY[0x1E0D512C8], "artistsDefaultOrderingTerms");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    case 3:
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50B68]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v5;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50B70]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v6;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50B98]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v39[2] = v7;
      v20 = (void *)MEMORY[0x1E0C99D20];
      v21 = v39;
      goto LABEL_25;
    case 4:
      objc_msgSend(MEMORY[0x1E0D512C8], "composersDefaultOrderingTerms");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    case 5:
      objc_msgSend(MEMORY[0x1E0D512C8], "genresDefaultOrderingTerms");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    case 6:
      return v3;
    case 7:
      objc_msgSend(MEMORY[0x1E0D512C8], "podcastsDefaultOrderingTerms");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    case 8:
    case 9:
LABEL_7:
      objc_msgSend(MEMORY[0x1E0D512C8], "TVShowEpisodesDefaultOrderingTerms");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    case 12:
    case 21:
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:direction:", *MEMORY[0x1E0D50BA0], 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v5;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50B90]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v6;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50B98]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v41[2] = v7;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50CD0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v41[3] = v8;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D51190]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v41[4] = v9;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D51170]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v41[5] = v10;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = v41;
      goto LABEL_14;
    case 13:
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:direction:", *MEMORY[0x1E0D50C98], 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v5;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50B90]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v40[1] = v6;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50B98]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v40[2] = v7;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50CD0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v40[3] = v8;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D51190]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v40[4] = v9;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D51170]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v40[5] = v10;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = v40;
LABEL_14:
      objc_msgSend(v11, "arrayWithObjects:count:", v12, 6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 14:
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:direction:", *MEMORY[0x1E0D50C98], 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v5;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50B68]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = v6;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50B70]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v38[2] = v7;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50B98]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v38[3] = v8;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50CD0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v38[4] = v9;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D51190]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v38[5] = v10;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D51170]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v38[6] = v22;
      v23 = (void *)MEMORY[0x1E0C99D20];
      v24 = v38;
      goto LABEL_19;
    case 15:
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:direction:", *MEMORY[0x1E0D50C98], 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v5;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50C70]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v6;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50C78]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v36[2] = v7;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50B90]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v36[3] = v8;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D51170]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v36[4] = v9;
      v25 = (void *)MEMORY[0x1E0C99D20];
      v26 = v36;
      goto LABEL_22;
    case 16:
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:direction:", *MEMORY[0x1E0D50C98], 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v5;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50D80]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v34[1] = v6;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50D70]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v34[2] = v7;
      v20 = (void *)MEMORY[0x1E0C99D20];
      v21 = v34;
      goto LABEL_25;
    case 17:
    case 22:
      objc_msgSend(MEMORY[0x1E0D512C8], "albumsByAlbumArtistDefaultOrderingTerms");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    case 18:
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:direction:", *MEMORY[0x1E0D50CA8], 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v5;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50B68]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v6;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50B70]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v37[2] = v7;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50B98]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v37[3] = v8;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50CD0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v37[4] = v9;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D51190]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v37[5] = v10;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D51170]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37[6] = v22;
      v23 = (void *)MEMORY[0x1E0C99D20];
      v24 = v37;
LABEL_19:
      objc_msgSend(v23, "arrayWithObjects:count:", v24, 7);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
      goto LABEL_23;
    case 19:
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:direction:", *MEMORY[0x1E0D50CA8], 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v5;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50C70]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v6;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50C78]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = v7;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50B90]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v35[3] = v8;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D51170]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v35[4] = v9;
      v25 = (void *)MEMORY[0x1E0C99D20];
      v26 = v35;
LABEL_22:
      objc_msgSend(v25, "arrayWithObjects:count:", v26, 5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

      goto LABEL_26;
    case 20:
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:direction:", *MEMORY[0x1E0D50CA8], 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50D80], v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v6;
      objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50D70]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v33[2] = v7;
      v20 = (void *)MEMORY[0x1E0C99D20];
      v21 = v33;
LABEL_25:
      objc_msgSend(v20, "arrayWithObjects:count:", v21, 3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

      break;
    default:
LABEL_36:
      objc_msgSend(MEMORY[0x1E0D512C8], "defaultOrderingTerms");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_37:
      v3 = (void *)v4;
      break;
  }
  return v3;
}

void __112__MPMediaQueryCriteria_ML3Additions__ML3OrderingTermsForMPOrderingProperties_directionalityMapping_entityClass___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[12];
  _QWORD v15[14];

  v15[12] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("albumArtist");
  objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50B68]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v13;
  v14[1] = CFSTR("albumTitle");
  objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50B90]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v12;
  v14[2] = CFSTR("artist");
  objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50BB8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v0;
  v14[3] = CFSTR("composer");
  objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50C70]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v1;
  v14[4] = CFSTR("genre");
  objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50D80]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v2;
  v14[5] = CFSTR("seriesName");
  objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50FF8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v3;
  v14[6] = CFSTR("title");
  objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D51170]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v4;
  v14[7] = CFSTR("albumTrackNumber");
  objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D51190]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v5;
  v14[8] = CFSTR("discNumber");
  objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50CD0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v6;
  v14[9] = CFSTR("playCount");
  objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50F50]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[9] = v7;
  v14[10] = CFSTR("seasonNumber");
  objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50FE8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[10] = v8;
  v14[11] = CFSTR("name");
  objc_msgSend(MEMORY[0x1E0D51288], "orderingTermWithProperty:", *MEMORY[0x1E0D50A60]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[11] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 12);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)ML3OrderingTermsForMPOrderingProperties_directionalityMapping_entityClass__orderingTermMap;
  ML3OrderingTermsForMPOrderingProperties_directionalityMapping_entityClass__orderingTermMap = v10;

}

void __54__MPMediaQueryCriteria_excludesEntitiesWithBlankNames__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("artist"), CFSTR("artistPID"), CFSTR("albumArtist"), CFSTR("albumArtistPID"), CFSTR("albumTitle"), CFSTR("albumPID"), CFSTR("composer"), CFSTR("composerPID"), CFSTR("seriesName"), CFSTR("seasonName"), CFSTR("podcastTitle"), CFSTR("podcastPID"), CFSTR("podcastURL"), CFSTR("persistentID"), 0);
  v1 = (void *)excludesEntitiesWithBlankNames_allowedBlankNameProperties;
  excludesEntitiesWithBlankNames_allowedBlankNameProperties = v0;

}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t groupingType;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  groupingType = self->_groupingType;
  if (groupingType > 0x16)
    v6 = CFSTR("(unknown grouping type)");
  else
    v6 = off_1E3155020[groupingType];
  v7 = v6;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@, %@"), v4, self, v7, self->_filterPredicates);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSArray count](self->_orderingProperties, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_orderingProperties, "componentsJoinedByString:", CFSTR(", "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" ordered by %@"), v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  if (self->_orderingDirectionMappings)
  {
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" with sort direction=%@"), self->_orderingDirectionMappings);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  return v8;
}

- (void)addFilterPredicates:(id)a3
{
  NSMutableSet *filterPredicates;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    filterPredicates = self->_filterPredicates;
    if (filterPredicates)
      v5 = filterPredicates;
    else
      v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = self->_filterPredicates;
    self->_filterPredicates = v5;

    -[NSMutableSet addObjectsFromArray:](self->_filterPredicates, "addObjectsFromArray:", v7);
  }

}

- (void)removeFilterPredicate:(id)a3
{
  NSMutableSet *filterPredicates;

  -[NSMutableSet removeObject:](self->_filterPredicates, "removeObject:", a3);
  if (!-[NSMutableSet count](self->_filterPredicates, "count"))
  {
    filterPredicates = self->_filterPredicates;
    self->_filterPredicates = 0;

  }
}

- (void)removePredicatesForProperty:(id)a3
{
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = self->_filterPredicates;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "property");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v18);

          if (v12)
          {
            if (!v7)
              v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v7, "addObject:", v10);
          }
        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        -[MPMediaQueryCriteria removeFilterPredicate:](self, "removeFilterPredicate:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v15);
  }

}

- (BOOL)specifiesPlaylistItems
{
  NSMutableSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_filterPredicates;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "property", (_QWORD)v12);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("playlistPersistentID"));

          if ((v9 & 1) != 0)
          {
            v10 = 1;
            goto LABEL_12;
          }
        }
      }
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (NSSet)collectionPropertiesToFetch
{
  return self->_collectionPropertiesToFetch;
}

- (void)setCollectionPropertiesToFetch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)entityLimit
{
  return self->_entityLimit;
}

- (NSSet)itemPropertiesToFetch
{
  return self->_itemPropertiesToFetch;
}

- (void)setItemPropertiesToFetch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setIgnoreSystemFilterPredicates:(BOOL)a3
{
  self->_ignoreSystemFilterPredicates = a3;
}

- (void)setIgnoreRestrictionsPredicates:(BOOL)a3
{
  self->_ignoreRestrictionsPredicates = a3;
}

- (void)setIncludeNonLibraryEntities:(BOOL)a3
{
  self->_includeNonLibraryEntities = a3;
}

- (BOOL)includeEntitiesWithBlankNames
{
  return self->_includeEntitiesWithBlankNames;
}

- (void)setIncludeEntitiesWithBlankNames:(BOOL)a3
{
  self->_includeEntitiesWithBlankNames = a3;
}

- (void)setOrderingDirectionMappings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setEntityOrder:(unint64_t)a3
{
  self->_entityOrder = a3;
}

@end
