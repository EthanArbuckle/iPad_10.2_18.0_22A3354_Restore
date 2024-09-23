@implementation MPConcreteMediaItemCollection

- (id)representativeItem
{
  MPMediaItem **p_representativeItem;
  MPMediaItem *representativeItem;
  unint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  MPMediaItem *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  MPMediaItem *v24;
  void *v25;
  MPMediaItem *v26;
  MPMediaItem *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  p_representativeItem = &self->_representativeItem;
  representativeItem = self->_representativeItem;
  v4 = 0x1E0C99000;
  if (!representativeItem)
  {
    +[MPMediaItemCollection representativePersistentIDPropertyForGroupingType:](MPMediaItemCollection, "representativePersistentIDPropertyForGroupingType:", self->_grouping);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[MPConcreteMediaItemCollection valueForProperty:](self, "valueForProperty:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7 && objc_msgSend(v7, "longLongValue"))
      {
        -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[MPConcreteMediaItem concreteMediaItemWithPersistentID:library:](MPConcreteMediaItem, "concreteMediaItemWithPersistentID:library:", objc_msgSend(v8, "unsignedLongLongValue"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "existsInLibrary"))
          objc_storeStrong((id *)p_representativeItem, v10);

      }
    }
    else
    {
      v8 = 0;
    }
    if (!*p_representativeItem)
    {
      -[MPConcreteMediaItemCollection items](self, "items");
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v30;
LABEL_12:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v15);
          objc_msgSend(v16, "artwork");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
            objc_storeStrong((id *)p_representativeItem, v16);
          if (objc_msgSend(v16, "mediaType") != 2048)
            break;
          if (v13 == ++v15)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
            if (v13)
              goto LABEL_12;
            break;
          }
        }
      }

      if (!*p_representativeItem)
      {
        v18 = objc_msgSend(v11, "count");
        if (v18)
        {
          objc_msgSend(v11, "objectAtIndex:", 0);
          v18 = objc_claimAutoreleasedReturnValue();
        }
        v19 = *p_representativeItem;
        *p_representativeItem = (MPMediaItem *)v18;

      }
      v4 = 0x1E0C99000uLL;
      if (self->_grouping != 9)
      {
        if (*p_representativeItem)
        {
          -[MPConcreteMediaItemCollection mediaLibrary](self, "mediaLibrary");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "writable");

          if (v21)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[MPMediaEntity persistentID](*p_representativeItem, "persistentID"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPConcreteMediaItemCollection setValue:forProperty:withCompletionBlock:](self, "setValue:forProperty:withCompletionBlock:", v22, v6, 0);

          }
        }
      }

      if (!*p_representativeItem)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *p_representativeItem;
        *p_representativeItem = (MPMediaItem *)v23;

      }
    }

    representativeItem = *p_representativeItem;
  }
  objc_msgSend(*(id *)(v4 + 3640), "null");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPMediaItem isEqual:](representativeItem, "isEqual:", v25))
    v26 = 0;
  else
    v26 = *p_representativeItem;
  v27 = v26;

  return v27;
}

- (id)valueForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t identifier;
  int64_t grouping;
  id v10;
  _QWORD v12[4];
  id v13;
  MPConcreteMediaItemCollection *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  char v22;

  v4 = a3;
  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryDataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__19541;
  v20 = __Block_byref_object_dispose__19542;
  -[MPConcreteMediaEntityPropertiesCache valueForProperty:isCached:](self->_propertiesCache, "valueForProperty:isCached:", v4, &v22);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (!v22 && v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    grouping = self->_grouping;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__MPConcreteMediaItemCollection_valueForProperty___block_invoke;
    v12[3] = &unk_1E31575D0;
    v15 = &v16;
    v13 = v4;
    v14 = self;
    objc_msgSend(v6, "loadProperties:ofCollectionWithIdentifier:groupingType:completionBlock:", v7, identifier, grouping, v12);

  }
  v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

uint64_t __50__MPConcreteMediaItemCollection_valueForProperty___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKey:", a1[4]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return objc_msgSend(*(id *)(a1[5] + 104), "cacheValue:forProperty:persistValueInBackgroundBlock:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4], 0);
}

- (MPConcreteMediaItemCollection)initWithIdentifier:(int64_t)a3 valuesForProperties:(id)a4 itemsQuery:(id)a5 grouping:(int64_t)a6 representativeItemIdentifier:(int64_t)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  MPConcreteMediaItemCollection *v21;
  id v22;
  MPConcreteMediaItemCollection *v23;
  _QWORD v25[4];
  id v26;
  MPConcreteMediaItemCollection *v27;
  id v28;
  int64_t v29;
  int64_t v30;
  int64_t v31;

  v12 = a4;
  v13 = a5;
  objc_msgSend(v13, "mediaLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  objc_msgSend(v17, "libraryDataProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "entityCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __121__MPConcreteMediaItemCollection_initWithIdentifier_valuesForProperties_itemsQuery_grouping_representativeItemIdentifier___block_invoke;
  v25[3] = &unk_1E31576C0;
  v26 = v12;
  v27 = self;
  v28 = v13;
  v29 = a3;
  v30 = a6;
  v31 = a7;
  v20 = v13;
  v21 = self;
  v22 = v12;
  objc_msgSend(v19, "collectionWithIdentifier:grouping:loadEntityBlock:", a3, a6, v25);
  v23 = (MPConcreteMediaItemCollection *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id __121__MPConcreteMediaItemCollection_initWithIdentifier_valuesForProperties_itemsQuery_grouping_representativeItemIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a2;
  objc_msgSend(v3, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachePropertyValues:forProperties:persistValueInBackgroundBlock:", v3, v7, 0);

  v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "_initWithIdentifier:valuesForProperties:itemsQuery:grouping:representativeItemIdentifier:propertiesCache:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v5);
  return v8;
}

- (MPConcreteMediaItemCollection)initWithIdentifier:(int64_t)a3 itemsQuery:(id)a4 grouping:(int64_t)a5
{
  return -[MPConcreteMediaItemCollection initWithIdentifier:valuesForProperties:itemsQuery:grouping:representativeItemIdentifier:](self, "initWithIdentifier:valuesForProperties:itemsQuery:grouping:representativeItemIdentifier:", a3, 0, a4, a5, 0);
}

- (id)_initWithIdentifier:(int64_t)a3 valuesForProperties:(id)a4 itemsQuery:(id)a5 grouping:(int64_t)a6 representativeItemIdentifier:(int64_t)a7 propertiesCache:(id)a8
{
  id v13;
  id v14;
  MPConcreteMediaItemCollection *v15;
  MPConcreteMediaItemCollection *v16;
  uint64_t v17;
  MPMediaQuery *itemsQuery;
  void *v19;
  uint64_t v20;
  MPMediaItem *representativeItem;
  MPMediaItem *v22;
  objc_super v24;

  v13 = a5;
  v14 = a8;
  v24.receiver = self;
  v24.super_class = (Class)MPConcreteMediaItemCollection;
  v15 = -[MPMediaItemCollection initWithItems:](&v24, sel_initWithItems_, 0);
  v16 = v15;
  if (v15)
  {
    v15->_identifier = a3;
    v17 = objc_msgSend(v13, "copy");
    itemsQuery = v16->_itemsQuery;
    v16->_itemsQuery = (MPMediaQuery *)v17;

    v16->_grouping = a6;
    objc_storeStrong((id *)&v16->_propertiesCache, a8);
    if (a7)
    {
      objc_msgSend(v13, "mediaLibrary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPConcreteMediaItem concreteMediaItemWithPersistentID:library:](MPConcreteMediaItem, "concreteMediaItemWithPersistentID:library:", a7, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      representativeItem = v16->_representativeItem;
      v16->_representativeItem = (MPMediaItem *)v20;

      if (!-[MPMediaItem existsInLibrary](v16->_representativeItem, "existsInLibrary"))
      {
        v22 = v16->_representativeItem;
        v16->_representativeItem = 0;

      }
    }
  }

  return v16;
}

- (MPConcreteMediaItemCollection)initWithMultiverseIdentifier:(id)a3 library:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  void *v22;
  MPConcreteMediaItemCollection *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  MPMediaQuery *v28;
  void *v29;
  MPMediaQuery *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  MPMediaQuery *v38;
  void *v39;
  MPMediaQuery *v40;
  MPConcreteMediaItemCollection *v41;
  void *v42;
  char v43;
  uint64_t v45;
  unsigned int v47;
  MPConcreteMediaItemCollection *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v45 = objc_msgSend(v6, "mediaObjectType");
  v47 = v45 - 1;
  if ((v45 - 1) > 7)
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v8 = qword_193F0A5D0[(v45 - 1)];
  objc_msgSend(v6, "libraryIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = self;
  v49 = v6;
  v50 = v7;
  if (v7)
  {
    v10 = v7;
  }
  else
  {
    +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v51 = v10;
  objc_msgSend(v10, "uniqueIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (!v13)
    goto LABEL_21;
  v14 = v13;
  v15 = *(_QWORD *)v54;
  while (2)
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v54 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
      objc_msgSend(v17, "libraryName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v18, "length"))
      {

        continue;
      }
      objc_msgSend(v17, "libraryName");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (v19 == v11)
      {

      }
      else
      {
        v20 = v19;
        v21 = objc_msgSend(v19, "isEqual:", v11);

        if ((v21 & 1) == 0)
          continue;
      }
      v52 = 0;
      v52 = objc_msgSend(v17, "libraryId");
      if ((objc_msgSend(v51, "collectionExistsContainedWithinPersistentIDs:count:groupingType:existentPID:", &v52, 1, v8, &v57) & 1) != 0)
      {
        v27 = v12;
        v23 = v48;
        v22 = v49;
        goto LABEL_27;
      }
    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v14)
      continue;
    break;
  }
LABEL_21:

  v22 = v49;
  v23 = v48;
  if (objc_msgSend(v49, "hasCloudUniversalLibraryId"))
  {
    objc_msgSend(v49, "cloudUniversalLibraryId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    if (v25)
    {
      objc_msgSend(v49, "cloudUniversalLibraryId");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v26, CFSTR("storeCloudAlbumID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = [MPMediaQuery alloc];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[MPMediaQuery initWithFilterPredicates:library:](v28, "initWithFilterPredicates:library:", v29, v51);

      -[MPMediaQuery setEntityLimit:](v30, "setEntityLimit:", 1);
      -[MPMediaQuery setGroupingType:](v30, "setGroupingType:", v8);
      -[MPMediaQuery items](v30, "items");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "firstObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = objc_msgSend(v32, "albumPersistentID");
      if (v32 && v33)
      {
        v57 = v33;

LABEL_27:
LABEL_28:
        if (v47 > 7 || ((0xCFu >> v47) & 1) == 0 || (v35 = *off_1E3157870[v47]) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, v23, CFSTR("MPMediaLibraryDataProvider.m"), 616, CFSTR("No persistent ID property could be found for media object of type %d"), v45);

          v35 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v57);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v36, v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = [MPMediaQuery alloc];
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[MPMediaQuery initWithFilterPredicates:](v38, "initWithFilterPredicates:", v39);

        -[MPMediaQuery setGroupingType:](v40, "setGroupingType:", v8);
        v23 = -[MPConcreteMediaItemCollection initWithIdentifier:itemsQuery:grouping:](v23, "initWithIdentifier:itemsQuery:grouping:", v57, v40, v8);

        v41 = v23;
        goto LABEL_40;
      }

    }
  }
  if (objc_msgSend(v49, "hasStoreId")
    && objc_msgSend(v49, "storeId")
    && (objc_msgSend(v51, "collectionExistsWithStoreID:groupingType:existentPID:", objc_msgSend(v49, "storeId"), v8, &v57) & 1) != 0)
  {
    goto LABEL_28;
  }
  if (objc_msgSend(v49, "hasName"))
  {
    objc_msgSend(v49, "name");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v51, "collectionExistsWithName:groupingType:existentPID:", v42, v8, &v57);

    if ((v43 & 1) != 0)
      goto LABEL_28;
  }
  v41 = 0;
LABEL_40:

  return v41;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4[9] == self->_identifier && v4[11] == self->_grouping;

  return v5;
}

- (unint64_t)hash
{
  return self->_grouping ^ self->_identifier;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[MPConcreteMediaItemCollection mediaLibrary](self, "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryDataProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeEntityWithIdentifier:dataProviderEntityClass:", self->_identifier, -[MPConcreteMediaEntityPropertiesCache dataProviderEntityClass](self->_propertiesCache, "dataProviderEntityClass"));

  v6.receiver = self;
  v6.super_class = (Class)MPConcreteMediaItemCollection;
  -[MPConcreteMediaItemCollection dealloc](&v6, sel_dealloc);
}

- (int64_t)groupingType
{
  return self->_grouping;
}

- (MPConcreteMediaEntityPropertiesCache)cachedPropertyValues
{
  return self->_propertiesCache;
}

- (void)invalidateCachedProperties
{
  -[MPConcreteMediaEntityPropertiesCache invalidate](self->_propertiesCache, "invalidate");
}

- (MPConcreteMediaItemCollection)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MPConcreteMediaItemCollection *v6;
  uint64_t v7;
  MPMediaQuery *itemsQuery;
  MPConcreteMediaItemCollection *v9;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPLibrary"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v11.receiver = self;
      v11.super_class = (Class)MPConcreteMediaItemCollection;
      v6 = -[MPMediaItemCollection initWithItems:](&v11, sel_initWithItems_, 0);
      if (v6)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPQuery"));
        v7 = objc_claimAutoreleasedReturnValue();
        itemsQuery = v6->_itemsQuery;
        v6->_itemsQuery = (MPMediaQuery *)v7;

        v6->_identifier = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("id"));
        v6->_grouping = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("group"));
      }
      self = v6;
      v9 = self;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "allowsKeyedCoding"))
  {
    -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("MPLibrary"));

    objc_msgSend(v5, "encodeObject:forKey:", self->_itemsQuery, CFSTR("MPQuery"));
    objc_msgSend(v5, "encodeInt64:forKey:", self->_identifier, CFSTR("id"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_grouping, CFSTR("group"));
  }

}

- (id)mediaLibrary
{
  return -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
}

- (unint64_t)persistentID
{
  return self->_identifier;
}

- (id)_tokenBinaryIdentifierAsString
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if ((unint64_t)(-[MPConcreteMediaItemCollection groupingType](self, "groupingType") - 1) > 4)
  {
    v3 = 0;
  }
  else
  {
    objc_opt_class();
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = -[MPConcreteMediaItemCollection persistentID](self, "persistentID");
  -[MPConcreteMediaItemCollection mediaLibrary](self, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ml3Library");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForEntityWithPersistentID:libraryUID:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  int64_t identifier;
  int64_t grouping;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v6 = a3;
  v7 = a4;
  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "libraryDataProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v6, "mutableCopy");
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v11 = MEMORY[0x1E0C809B0];
  v26 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73__MPConcreteMediaItemCollection_enumerateValuesForProperties_usingBlock___block_invoke;
  v19[3] = &unk_1E3157620;
  v19[4] = self;
  v12 = v10;
  v20 = v12;
  v13 = v7;
  v21 = v13;
  v22 = &v23;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v19);
  if (!*((_BYTE *)v24 + 24))
  {
    identifier = self->_identifier;
    grouping = self->_grouping;
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __73__MPConcreteMediaItemCollection_enumerateValuesForProperties_usingBlock___block_invoke_2;
    v16[3] = &unk_1E31576E8;
    v16[4] = self;
    v17 = v12;
    v18 = v13;
    objc_msgSend(v9, "loadProperties:ofCollectionWithIdentifier:groupingType:completionBlock:", v17, identifier, grouping, v16);

  }
  _Block_object_dispose(&v23, 8);

}

- (id)valuesForProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  int64_t identifier;
  int64_t grouping;
  id v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;

  v4 = a3;
  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryDataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __53__MPConcreteMediaItemCollection_valuesForProperties___block_invoke;
  v25[3] = &unk_1E3157710;
  v25[4] = self;
  v10 = v7;
  v26 = v10;
  v11 = v8;
  v27 = v11;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v25);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__19541;
  v23 = __Block_byref_object_dispose__19542;
  v24 = 0;
  if (v6 && objc_msgSend(v10, "count"))
  {
    identifier = self->_identifier;
    grouping = self->_grouping;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __53__MPConcreteMediaItemCollection_valuesForProperties___block_invoke_2;
    v16[3] = &unk_1E31575D0;
    v16[4] = self;
    v17 = v10;
    v18 = &v19;
    objc_msgSend(v6, "loadProperties:ofCollectionWithIdentifier:groupingType:completionBlock:", v17, identifier, grouping, v16);

  }
  if (v20[5])
    objc_msgSend(v11, "addEntriesFromDictionary:");
  v14 = v11;
  _Block_object_dispose(&v19, 8);

  return v14;
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__MPConcreteMediaItemCollection_setValue_forProperty___block_invoke;
  v11[3] = &unk_1E3157760;
  v9 = v8;
  v12 = v9;
  v13 = &v14;
  -[MPConcreteMediaItemCollection setValue:forProperty:withCompletionBlock:](self, "setValue:forProperty:withCompletionBlock:", v6, v7, v11);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (void)setValue:(id)a3 forProperty:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  MPConcreteMediaEntityPropertiesCache *propertiesCache;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MPConcreteMediaItemCollection mediaLibrary](self, "mediaLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "libraryDataProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74__MPConcreteMediaItemCollection_setValue_forProperty_withCompletionBlock___block_invoke;
    v16[3] = &unk_1E3157738;
    objc_copyWeak(&v18, &location);
    v17 = v10;
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19403A810](v16);
    propertiesCache = self->_propertiesCache;
    if (propertiesCache)
      -[MPConcreteMediaEntityPropertiesCache cacheValue:forProperty:persistValueInBackgroundBlock:](propertiesCache, "cacheValue:forProperty:persistValueInBackgroundBlock:", v8, v9, v14);
    else
      ((void (**)(_QWORD, id, id))v14)[2](v14, v8, v9);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

- (id)itemsQuery
{
  return self->_itemsQuery;
}

- (id)items
{
  return -[MPMediaQuery items](self->_itemsQuery, "items");
}

- (unint64_t)count
{
  return -[MPMediaQuery _countOfItems](self->_itemsQuery, "_countOfItems");
}

- (void)_enumerateItemPersistentIDsUsingBlock:(id)a3
{
  -[MPMediaQuery _enumerateItemPersistentIDsUsingBlock:](self->_itemsQuery, "_enumerateItemPersistentIDsUsingBlock:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesCache, 0);
  objc_storeStrong((id *)&self->_representativeItem, 0);
  objc_storeStrong((id *)&self->_itemsQuery, 0);
}

void __74__MPConcreteMediaItemCollection_setValue_forProperty_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = objc_msgSend(WeakRetained, "persistentID");
    objc_msgSend(v7, "mediaLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "libraryDataProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setValue:forProperty:ofCollectionWithIdentifier:groupingType:completionBlock:", v11, v5, v8, v7[11], *(_QWORD *)(a1 + 32));
  }

}

intptr_t __54__MPConcreteMediaItemCollection_setValue_forProperty___block_invoke(uint64_t a1, char a2)
{
  intptr_t result;

  result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return result;
}

void __53__MPConcreteMediaItemCollection_valuesForProperties___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;

  v3 = a2;
  v5 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "valueForProperty:isCached:", v3, &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v3);
    if (v4)
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v4, v3);
  }

}

void __53__MPConcreteMediaItemCollection_valuesForProperties___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1[4] + 104), "cachePropertyValues:forProperties:persistValueInBackgroundBlock:", v3, a1[5], 0);
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __73__MPConcreteMediaItemCollection_enumerateValuesForProperties_usingBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  char v7;

  v5 = a2;
  v7 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "valueForProperty:isCached:", v5, &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }

}

void __73__MPConcreteMediaItemCollection_enumerateValuesForProperties_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "cachePropertyValues:forProperties:persistValueInBackgroundBlock:", v3, *(_QWORD *)(a1 + 40), 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

+ (id)createUncachedMediaItemCollectionWithIdentifier:(int64_t)a3 valuesForProperties:(id)a4 itemsQuery:(id)a5 grouping:(int64_t)a6 representativeItemIdentifier:(int64_t)a7
{
  id v12;
  id v13;
  void *v14;

  v12 = a5;
  v13 = a4;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:valuesForProperties:itemsQuery:grouping:representativeItemIdentifier:propertiesCache:", a3, v13, v12, a6, a7, 0);

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
