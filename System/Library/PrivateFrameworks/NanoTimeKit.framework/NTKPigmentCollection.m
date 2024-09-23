@implementation NTKPigmentCollection

- (NTKPigmentCollection)initWithName:(id)a3
{
  id v5;
  NTKPigmentCollection *v6;
  NTKPigmentCollection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKPigmentCollection;
  v6 = -[NTKPigmentCollection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_collectionName, a3);

  return v7;
}

+ (id)stubCollectionWithName:(id)a3
{
  id v3;
  NTKPigmentCollection *v4;

  v3 = a3;
  v4 = -[NTKPigmentCollection initWithName:]([NTKPigmentCollection alloc], "initWithName:", v3);

  -[NTKPigmentCollection setStub:](v4, "setStub:", 1);
  return v4;
}

- (NSOrderedSet)allItems
{
  NTKPigmentCollection *v2;
  void *v3;
  void *v4;
  void *v5;
  NSOrderedSet *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  NSOrderedSet *allItems;
  _QWORD v14[5];
  _QWORD v15[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_allItems)
  {
    v3 = (void *)MEMORY[0x1E0C99E10];
    -[NTKPigmentCollection items](v2, "items");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "orderedSetWithArray:", v5);
    v6 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();

    -[NTKPigmentCollection config](v2, "config");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "isAddable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[NTKPigmentCollection collections](v2, "collections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __32__NTKPigmentCollection_allItems__block_invoke;
      v15[3] = &unk_1E6BD2C38;
      v10 = v15;
      v15[4] = v6;
      objc_msgSend(v9, "enumerateObjectsWithOptions:usingBlock:", 2, v15);
    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __32__NTKPigmentCollection_allItems__block_invoke_2;
      v14[3] = &unk_1E6BD2C38;
      v10 = v14;
      v14[4] = v6;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);
    }

    -[NTKPigmentCollection config](v2, "config");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeExcludedItemsFromList:", v6);

    allItems = v2->_allItems;
    v2->_allItems = v6;

  }
  objc_sync_exit(v2);

  return v2->_allItems;
}

void __32__NTKPigmentCollection_allItems__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "allItems");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

void __32__NTKPigmentCollection_allItems__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "allItems");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

- (unint64_t)count
{
  NTKPigmentCollection *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  unint64_t v9;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_allItems)
    goto LABEL_5;
  -[NTKPigmentCollection config](v2, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exclusions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {

LABEL_5:
    -[NTKPigmentCollection allItems](v2, "allItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    goto LABEL_6;
  }
  -[NTKPigmentCollection config](v2, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "excludesDuotone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
    goto LABEL_5;
  -[NTKPigmentCollection items](v2, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v11, "count");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NTKPigmentCollection collections](v2, "collections", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v12);
        v9 += objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "count");
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

LABEL_6:
  objc_sync_exit(v2);

  return v9;
}

- (BOOL)hasAddableCollection
{
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NTKPigmentCollection config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isAddable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[NTKPigmentCollection collections](self, "collections", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v7);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "hasAddableCollection") & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v6;
}

- (NSOrderedSet)items
{
  NTKPigmentCollection *v2;
  NSOrderedSet *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_items;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isRootCollection
{
  void *v2;
  char v3;

  -[NTKPigmentCollection collectionName](self, "collectionName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR(".")) ^ 1;

  return v3;
}

- (void)setItems:(id)a3
{
  NTKPigmentCollection *v5;
  NTKPigmentEditOption *defaultOption;
  NSOrderedSet *allItems;
  uint64_t v8;
  NSMutableDictionary *itemsByName;
  NSMutableDictionary *faceSpecificPigmentsByFullname;
  id v11;

  v11 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_items, a3);
  defaultOption = v5->_defaultOption;
  v5->_defaultOption = 0;

  allItems = v5->_allItems;
  v5->_allItems = 0;

  -[NTKPigmentCollection buildNamesMappingWithPigments:](v5, "buildNamesMappingWithPigments:", v11);
  v8 = objc_claimAutoreleasedReturnValue();
  itemsByName = v5->_itemsByName;
  v5->_itemsByName = (NSMutableDictionary *)v8;

  faceSpecificPigmentsByFullname = v5->_faceSpecificPigmentsByFullname;
  v5->_faceSpecificPigmentsByFullname = 0;

  objc_sync_exit(v5);
}

- (NSArray)collections
{
  NTKPigmentCollection *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_collections;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCollections:(id)a3
{
  NSArray *v4;
  NSArray *collections;
  NSArray *v6;
  NSMutableDictionary *collectionsByName;
  NTKPigmentEditOption *defaultOption;
  NSOrderedSet *allItems;
  NSMutableDictionary *faceSpecificPigmentsByFullname;
  NTKPigmentCollection *obj;

  v4 = (NSArray *)a3;
  obj = self;
  objc_sync_enter(obj);
  collections = obj->_collections;
  obj->_collections = v4;
  v6 = v4;

  collectionsByName = obj->_collectionsByName;
  obj->_collectionsByName = 0;

  defaultOption = obj->_defaultOption;
  obj->_defaultOption = 0;

  allItems = obj->_allItems;
  obj->_allItems = 0;

  faceSpecificPigmentsByFullname = obj->_faceSpecificPigmentsByFullname;
  obj->_faceSpecificPigmentsByFullname = 0;

  objc_sync_exit(obj);
}

- (void)appendCollection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  -[NTKPigmentCollection collections](self, "collections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", v5);
  v7 = (void *)objc_msgSend(v8, "copy");
  -[NTKPigmentCollection setCollections:](self, "setCollections:", v7);

}

- (NSDictionary)collectionsByName
{
  NSMutableDictionary *collectionsByName;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  collectionsByName = self->_collectionsByName;
  if (!collectionsByName)
  {
    v4 = (void *)MEMORY[0x1E0C99E08];
    -[NTKPigmentCollection collections](self, "collections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_collectionsByName;
    self->_collectionsByName = v6;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[NTKPigmentCollection collections](self, "collections", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v14 = self->_collectionsByName;
          objc_msgSend(v13, "collectionName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    collectionsByName = self->_collectionsByName;
  }
  return (NSDictionary *)collectionsByName;
}

- (NTKPigmentEditOption)defaultOption
{
  NTKPigmentCollection *v2;
  NTKPigmentEditOption *defaultOption;
  void *v4;
  uint64_t v5;
  NTKPigmentEditOption *v6;
  void *v7;
  uint64_t v8;
  NTKPigmentEditOption *v9;
  void *v10;
  uint64_t v11;
  NTKPigmentEditOption *v12;
  NTKPigmentEditOption *v13;

  v2 = self;
  objc_sync_enter(v2);
  defaultOption = v2->_defaultOption;
  if (!defaultOption)
  {
    -[NTKPigmentCollectionConfig defaultColorOptionName](v2->_config, "defaultColorOptionName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollection defaultOptionWithName:](v2, "defaultOptionWithName:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v2->_defaultOption;
    v2->_defaultOption = (NTKPigmentEditOption *)v5;

    defaultOption = v2->_defaultOption;
    if (!defaultOption)
    {
      -[NTKPigmentCollectionConfig fallbackDefaultColorOptionName](v2->_config, "fallbackDefaultColorOptionName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKPigmentCollection defaultOptionWithName:](v2, "defaultOptionWithName:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v2->_defaultOption;
      v2->_defaultOption = (NTKPigmentEditOption *)v8;

      defaultOption = v2->_defaultOption;
      if (!defaultOption)
      {
        -[NTKPigmentCollection allItems](v2, "allItems");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v2->_defaultOption;
        v2->_defaultOption = (NTKPigmentEditOption *)v11;

        defaultOption = v2->_defaultOption;
      }
    }
  }
  v13 = defaultOption;
  objc_sync_exit(v2);

  return v13;
}

- (id)defaultOptionWithName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  id v11;
  id v12;
  double v13;

  v12 = 0;
  v13 = 0.0;
  v11 = 0;
  +[NTKPigmentEditOption parseFullname:collectionName:optionName:fraction:](NTKPigmentEditOption, "parseFullname:collectionName:optionName:fraction:", a3, &v12, &v11, &v13);
  v4 = v12;
  v5 = v11;
  +[NTKPigmentEditOption fullnameWithCollectionName:optionName:](NTKPigmentEditOption, "fullnameWithCollectionName:optionName:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPigmentCollection _pigmentForName:](self, "_pigmentForName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "supportsSlider"))
  {
    objc_msgSend(v7, "colorFraction");
    if (v8 != v13)
    {
      v9 = objc_msgSend(v7, "copyWithColorFraction:");

      v7 = (void *)v9;
    }
  }

  return v7;
}

- (void)setDefaultOption:(id)a3
{
  NTKPigmentEditOption *v4;
  NTKPigmentEditOption *defaultOption;
  NTKPigmentCollection *obj;

  v4 = (NTKPigmentEditOption *)a3;
  obj = self;
  objc_sync_enter(obj);
  defaultOption = obj->_defaultOption;
  obj->_defaultOption = v4;

  objc_sync_exit(obj);
}

- (void)setDefaultGalleryColorWithNames:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[NTKPigmentCollection _pigmentForName:](self, "_pigmentForName:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  -[NTKPigmentCollection setDefaultGalleryColors:](self, "setDefaultGalleryColors:", v12);

}

- (id)buildNamesMappingWithPigments:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "effectiveOptionName", (_QWORD)v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "effectiveOptionName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v12);

        }
        objc_msgSend(v10, "optionName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v10, "optionName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v14);

        }
        objc_msgSend(v10, "fullname");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v10, "fullname");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v16);

        }
        objc_msgSend(v10, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v10, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v18);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_pigmentForName:(id)a3
{
  id v4;
  NTKPigmentCollection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_itemsByName, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NTKPigmentCollection collections](v5, "collections", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "_pigmentForName:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v6 = 0;
    }

  }
  objc_sync_exit(v5);

  return v6;
}

- (NSDictionary)migration
{
  NTKPigmentCollection *v2;
  NSDictionary *migration;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *v14;
  NSDictionary *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  migration = v2->_migration;
  if (!migration)
  {
    v4 = (void *)MEMORY[0x1E0C99E08];
    -[NTKPigmentCollection config](v2, "config");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "migration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithDictionary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[NTKPigmentCollection collections](v2, "collections", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "migration");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addEntriesFromDictionary:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    v13 = objc_msgSend(v7, "copy");
    v14 = v2->_migration;
    v2->_migration = (NSDictionary *)v13;

    migration = v2->_migration;
  }
  v15 = migration;
  objc_sync_exit(v2);

  return v15;
}

- (id)pigmentsFromMostRecentAddableCollection
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NTKPigmentCollection allItems](self, "allItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "isAddable"))
        {
          if (!v8
            || (objc_msgSend(v11, "collectionName"),
                v12 = (void *)objc_claimAutoreleasedReturnValue(),
                v13 = objc_msgSend(v12, "isEqualToString:", v8),
                v12,
                (v13 & 1) == 0))
          {
            if (v7 > 0)
              goto LABEL_16;
            objc_msgSend(v11, "collectionName");
            v14 = objc_claimAutoreleasedReturnValue();

            v7 = 1;
            v8 = (void *)v14;
          }
          objc_msgSend(v3, "addObject:", v11);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0;
  }
LABEL_16:

  return v3;
}

- (id)pigmentsFromMostRecentAddableCollections
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NTKPigmentCollection allItems](self, "allItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "isAddable"))
        {
          if (!v7
            || (objc_msgSend(v10, "collectionName"),
                v11 = (void *)objc_claimAutoreleasedReturnValue(),
                v12 = objc_msgSend(v11, "isEqualToString:", v7),
                v11,
                (v12 & 1) == 0))
          {
            if ((unint64_t)objc_msgSend(v3, "count") > 1)
              goto LABEL_16;
            objc_msgSend(v10, "collectionName");
            v13 = objc_claimAutoreleasedReturnValue();

            v7 = (void *)v13;
          }
          objc_msgSend(v3, "addObject:", v10);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
LABEL_16:

  return v3;
}

- (void)mergeWithCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char **__ptr32 *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NTKPigmentCollectionConfig *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  NTKPigmentCollection *v61;
  NSOrderedSet *allItems;
  NSMutableDictionary *faceSpecificPigmentsByFullname;
  _QWORD v64[5];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  id v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = MEMORY[0x1E0C809B0];
  v8 = &off_1B755D000;
  if (!v6)
  {
    v12 = 0;
    goto LABEL_20;
  }
  -[NTKPigmentCollection items](self, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v4, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v7;
  v69[1] = 3221225472;
  v69[2] = __44__NTKPigmentCollection_mergeWithCollection___block_invoke;
  v69[3] = &unk_1E6BD2C60;
  v12 = v10;
  v70 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v69);

  -[NTKPigmentCollection config](self, "config");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "collectionOverride");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "length"))
  {

    goto LABEL_7;
  }
  objc_msgSend(v4, "config");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "collectionOverride");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
LABEL_7:
    objc_msgSend(v4, "config");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "collectionOverride");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollection config](self, "config");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCollectionOverride:", v19);

    goto LABEL_8;
  }
  -[NTKPigmentCollection config](self, "config");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applyCollectionOverrideNameOnItems:", v12);
LABEL_8:

  -[NTKPigmentCollection config](self, "config");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "isAddable");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    objc_msgSend(v4, "config");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "isAddable");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v26 = v12;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v66;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v66 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v30);
            -[NTKPigmentCollection config](self, "config");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "isAddable");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setIsAddable:", objc_msgSend(v33, "BOOLValue"));

            ++v30;
          }
          while (v28 != v30);
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
        }
        while (v28);
      }

      v7 = MEMORY[0x1E0C809B0];
      v8 = &off_1B755D000;
    }
  }
  else
  {

  }
LABEL_20:
  -[NTKPigmentCollection config](self, "config");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v34)
  {
    v35 = objc_alloc_init(NTKPigmentCollectionConfig);
    -[NTKPigmentCollection setConfig:](self, "setConfig:", v35);

  }
  objc_msgSend(v4, "config");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "defaultGalleryColorNames");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v4, "config");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "defaultGalleryColorNames");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollection config](self, "config");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setDefaultGalleryColorNames:", v39);

    -[NTKPigmentCollection config](self, "config");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "defaultGalleryColorNames");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollection setDefaultGalleryColorWithNames:](self, "setDefaultGalleryColorWithNames:", v42);

  }
  objc_msgSend(v4, "config");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "defaultColorOptionName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend(v4, "config");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "defaultColorOptionName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollection config](self, "config");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setDefaultColorOptionName:", v46);

    -[NTKPigmentCollection setDefaultOption:](self, "setDefaultOption:", 0);
  }
  objc_msgSend(v4, "config");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "exclusions");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    -[NTKPigmentCollection config](self, "config");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "exclusions");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "arrayByAddingObjectsFromArray:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollection config](self, "config");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setExclusions:", v52);

  }
  if (v12)
  {
    -[NTKPigmentCollection setItems:](self, "setItems:", v12);
    -[NTKPigmentCollection items](self, "items");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setItems:", v54);

  }
  objc_msgSend(v4, "collections");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v7;
  v64[1] = *((_QWORD *)v8 + 84);
  v64[2] = __44__NTKPigmentCollection_mergeWithCollection___block_invoke_2;
  v64[3] = &unk_1E6BD2C38;
  v64[4] = self;
  objc_msgSend(v55, "enumerateObjectsUsingBlock:", v64);

  -[NTKPigmentCollection collections](self, "collections");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCollections:", v56);

  -[NTKPigmentCollection config](self, "config");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "isAddable");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "BOOLValue");

  if (v59)
  {
    objc_msgSend(v4, "allItems");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "enumerateObjectsUsingBlock:", &__block_literal_global_63);

  }
  v61 = self;
  objc_sync_enter(v61);
  allItems = v61->_allItems;
  v61->_allItems = 0;

  faceSpecificPigmentsByFullname = v61->_faceSpecificPigmentsByFullname;
  v61->_faceSpecificPigmentsByFullname = 0;

  objc_sync_exit(v61);
}

void __44__NTKPigmentCollection_mergeWithCollection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "desiredPosition");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        objc_msgSend(v10, "desiredPosition"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "integerValue"),
        v7 = objc_msgSend(*(id *)(a1 + 32), "count") - 1,
        v5,
        v4,
        v6 <= v7))
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v10, "desiredPosition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertObject:atIndex:", v10, objc_msgSend(v9, "integerValue"));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
  }

}

void __44__NTKPigmentCollection_mergeWithCollection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "collectionsByName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "appendCollection:", v6);

}

uint64_t __44__NTKPigmentCollection_mergeWithCollection___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsAddable:", 1);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NTKPigmentCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int shared;
  void *v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v44;
  char v45;
  void *v46;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)-[NSString copy](v5->_collectionName, "copy");
  -[NTKPigmentCollection defaultOption](v5, "defaultOption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = (void *)-[NSOrderedSet copy](v5->_items, "copy");
  v10 = (void *)-[NSArray copy](v5->_defaultGalleryColors, "copy");
  v11 = (void *)-[NSArray copy](v5->_collections, "copy");
  v12 = (void *)-[NTKPigmentCollectionConfig copy](v5->_config, "copy");
  shared = v5->_shared;
  objc_sync_exit(v5);

  if (!v4)
    goto LABEL_22;
  objc_msgSend(v4, "collectionName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = NTKEqualObjects(v6, v14);

  if (!v15)
    goto LABEL_22;
  if (shared == objc_msgSend(v4, "isShared")
    && (objc_msgSend(v4, "defaultOption"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = NTKEqualObjects(v8, v16),
        v16,
        v17))
  {
    v46 = v10;
    v18 = objc_msgSend(v9, "count");
    objc_msgSend(v4, "items");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v18 != v20)
      goto LABEL_24;
    v21 = objc_msgSend(v46, "count");
    objc_msgSend(v4, "defaultGalleryColors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v21 != v23
      || (v24 = objc_msgSend(v11, "count"),
          objc_msgSend(v4, "collections"),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          v26 = objc_msgSend(v25, "count"),
          v25,
          v24 != v26))
    {
LABEL_24:
      v42 = 0;
LABEL_25:
      v10 = v46;
      goto LABEL_23;
    }
    v44 = v8;
    if (objc_msgSend(v9, "count"))
    {
      v27 = 0;
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "items");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectAtIndexedSubscript:", v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v28, "isEqual:", v30);

        if ((v31 & 1) == 0)
          goto LABEL_26;
      }
      while (objc_msgSend(v9, "count") > (unint64_t)++v27);
    }
    objc_msgSend(v4, "config");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = NTKEqualObjects(v12, v32);

    if (!v33)
    {
LABEL_26:
      v42 = 0;
LABEL_27:
      v8 = v44;
      goto LABEL_25;
    }
    v10 = v46;
    if (!objc_msgSend(v46, "count"))
    {
LABEL_17:
      v8 = v44;
      if (!objc_msgSend(v11, "count"))
      {
        v42 = 1;
        goto LABEL_23;
      }
      v38 = 0;
      while (1)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "collections");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectAtIndexedSubscript:", v38);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v39, "isEqual:", v41);

        if ((v42 & 1) == 0)
          goto LABEL_27;
        ++v38;
        v8 = v44;
        v10 = v46;
        if (objc_msgSend(v11, "count") <= v38)
          goto LABEL_23;
      }
    }
    v34 = 0;
    while (1)
    {
      objc_msgSend(v46, "objectAtIndexedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "defaultGalleryColors");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndexedSubscript:", v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v35, "isEqual:", v37);

      if ((v45 & 1) == 0)
        break;
      if (objc_msgSend(v46, "count") <= (unint64_t)++v34)
        goto LABEL_17;
    }
    v42 = 0;
    v8 = v44;
  }
  else
  {
LABEL_22:
    v42 = 0;
  }
LABEL_23:

  return v42;
}

- (id)description
{
  NTKPigmentCollection *v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  __CFString *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NTKPigmentCollection items](v2, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __35__NTKPigmentCollection_description__block_invoke;
  v29[3] = &unk_1E6BD2C60;
  v6 = v3;
  v30 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v29);

  v7 = CFSTR("()");
  if (objc_msgSend(v6, "length"))
    v8 = CFSTR(")");
  else
    v8 = CFSTR("()");
  objc_msgSend(v6, "appendString:", v8);
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NTKPigmentCollection collections](v2, "collections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v5;
  v27[1] = 3221225472;
  v27[2] = __35__NTKPigmentCollection_description__block_invoke_2;
  v27[3] = &unk_1E6BD2C38;
  v11 = v9;
  v28 = v11;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v27);

  if (objc_msgSend(v11, "length"))
    v12 = CFSTR(")");
  else
    v12 = CFSTR("()");
  objc_msgSend(v11, "appendString:", v12);
  v24 = (void *)MEMORY[0x1E0CB3940];
  -[NTKPigmentCollection collectionName](v2, "collectionName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPigmentCollection config](v2, "config");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "exclusions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    -[NTKPigmentCollection config](v2, "config");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "exclusions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "ntk_flatDescription");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR(" , exclusions: %@"), v7);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = &stru_1E6BDC918;
  }
  -[NTKPigmentCollection config](v2, "config");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "excludesDuotone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = CFSTR(", excludesDuotone");
  if (!v18)
    v19 = &stru_1E6BDC918;
  objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ [items: %@, collections: %@%@%@]"), v25, v6, v11, v16, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {

  }
  objc_sync_exit(v2);

  return v20;
}

void __35__NTKPigmentCollection_description__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  const __CFString *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  if (objc_msgSend(v3, "length"))
    v5 = CFSTR(", ");
  else
    v5 = CFSTR("(");
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "description");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendString:", v7);
}

void __35__NTKPigmentCollection_description__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  const __CFString *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  if (objc_msgSend(v3, "length"))
    v5 = CFSTR(", ");
  else
    v5 = CFSTR("(");
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "collectionName");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendString:", v7);
}

+ (id)collectionFromProtoBuffer:(id)a3
{
  return (id)objc_msgSend(a1, "collectionFromProtoBuffer:sharedCollections:", a3, 0);
}

+ (id)collectionFromProtoBuffer:(id)a3 sharedCollections:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NTKPigmentCollection *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NTKPigmentEditOption *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  void *v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[NTKPigmentCollection collectionFromProtoBuffer:sharedCollections:].cold.1((uint64_t)v5, v14);

    v12 = 0;
    goto LABEL_19;
  }
  if (!objc_msgSend(v5, "isStub"))
  {
    v15 = [NTKPigmentCollection alloc];
    objc_msgSend(v5, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NTKPigmentCollection initWithName:](v15, "initWithName:", v16);

    *(_BYTE *)(v12 + 32) = objc_msgSend(v5, "isShared");
    *(_BYTE *)(v12 + 33) = objc_msgSend(v5, "isStub");
    objc_msgSend(v5, "config");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKPigmentCollectionConfig collectionConfigFromProtoBuffer:](NTKPigmentCollectionConfig, "collectionConfigFromProtoBuffer:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(void **)(v12 + 72);
    *(_QWORD *)(v12 + 72) = v18;

    v20 = [NTKPigmentEditOption alloc];
    objc_msgSend(v5, "defaultOption");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[NTKPigmentEditOption initWithProtoBuffer:](v20, "initWithProtoBuffer:", v21);
    v23 = *(void **)(v12 + 56);
    *(_QWORD *)(v12 + 56) = v22;

    objc_msgSend(v5, "items");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = MEMORY[0x1E0C809B0];
    if (v24)
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v5, "itemsCount"));
      objc_msgSend(v5, "items");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v25;
      v51[1] = 3221225472;
      v51[2] = __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke;
      v51[3] = &unk_1E6BD2CC8;
      v52 = v26;
      v53 = v5;
      v28 = v26;
      objc_msgSend(v27, "enumerateObjectsUsingBlock:", v51);

      v29 = (void *)objc_msgSend(v28, "copy");
      objc_msgSend((id)v12, "setItems:", v29);

    }
    objc_msgSend(v5, "defaultGalleryColors");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "defaultGalleryColorsCount"));
      objc_msgSend(v5, "defaultGalleryColors");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v25;
      v48[1] = 3221225472;
      v48[2] = __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke_26;
      v48[3] = &unk_1E6BD2CC8;
      v49 = v31;
      v50 = v5;
      v33 = v31;
      objc_msgSend(v32, "enumerateObjectsUsingBlock:", v48);

      v34 = objc_msgSend(v33, "copy");
      v35 = *(void **)(v12 + 80);
      *(_QWORD *)(v12 + 80) = v34;

    }
    objc_msgSend(v5, "collections");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
      goto LABEL_19;
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "collectionsCount"));
    objc_msgSend(v5, "collections");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v25;
    v43 = 3221225472;
    v44 = __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke_27;
    v45 = &unk_1E6BD2CF0;
    v46 = v6;
    v47 = v37;
    v13 = v37;
    objc_msgSend(v38, "enumerateObjectsUsingBlock:", &v42);

    v39 = -[NSObject copy](v13, "copy", v42, v43, v44, v45);
    v40 = *(void **)(v12 + 48);
    *(_QWORD *)(v12 + 48) = v39;

LABEL_18:
    goto LABEL_19;
  }
  if (!v6
    || (objc_msgSend(v5, "name"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "objectForKeyedSubscript:", v9),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        !v10))
  {
    objc_msgSend(v5, "name");
    v13 = objc_claimAutoreleasedReturnValue();
    +[NTKPigmentCollection stubCollectionWithName:](NTKPigmentCollection, "stubCollectionWithName:", v13);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  objc_msgSend(v5, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[NTKPigmentCollection collectionFromProtoBuffer:sharedCollections:].cold.2(v5);
    goto LABEL_18;
  }
LABEL_19:

  return (id)v12;
}

void __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NTKPigmentEditOption *v4;
  NSObject *v5;

  v3 = a2;
  v4 = -[NTKPigmentEditOption initWithProtoBuffer:]([NTKPigmentEditOption alloc], "initWithProtoBuffer:", v3);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }
  else
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke_cold_1(a1, v3);

  }
}

void __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  NTKPigmentEditOption *v4;
  NSObject *v5;

  v3 = a2;
  v4 = -[NTKPigmentEditOption initWithProtoBuffer:]([NTKPigmentEditOption alloc], "initWithProtoBuffer:", v3);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }
  else
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke_26_cold_1(a1, v3);

  }
}

void __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke_27(uint64_t a1, uint64_t a2)
{
  id v3;

  +[NTKPigmentCollection collectionFromProtoBuffer:sharedCollections:](NTKPigmentCollection, "collectionFromProtoBuffer:sharedCollections:", a2, *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (id)protoBuffer
{
  return -[NTKPigmentCollection protoBufferIgnoringSharedCollections:](self, "protoBufferIgnoringSharedCollections:", 0);
}

- (id)protoBufferIgnoringSharedCollections:(BOOL)a3
{
  NTKPigmentCollection *v4;
  NTKProtoPigmentCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  NSOrderedSet *items;
  uint64_t v10;
  NTKProtoPigmentCollection *v11;
  NSArray *defaultGalleryColors;
  NTKProtoPigmentCollection *v13;
  NSArray *collections;
  NTKProtoPigmentCollection *v15;
  NTKProtoPigmentCollection *v16;
  NTKProtoPigmentCollection *v17;
  _QWORD v19[4];
  NTKProtoPigmentCollection *v20;
  BOOL v21;
  _QWORD v22[4];
  NTKProtoPigmentCollection *v23;
  _QWORD v24[4];
  NTKProtoPigmentCollection *v25;

  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_alloc_init(NTKProtoPigmentCollection);
  -[NTKProtoPigmentCollection setIsShared:](v5, "setIsShared:", v4->_shared);
  -[NTKProtoPigmentCollection setIsStub:](v5, "setIsStub:", v4->_stub);
  -[NTKProtoPigmentCollection setName:](v5, "setName:", v4->_collectionName);
  -[NTKPigmentCollectionConfig protoBuffer](v4->_config, "protoBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKProtoPigmentCollection setConfig:](v5, "setConfig:", v6);

  -[NTKPigmentCollection defaultOption](v4, "defaultOption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "protoBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKProtoPigmentCollection setDefaultOption:](v5, "setDefaultOption:", v8);

  items = v4->_items;
  v10 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __61__NTKPigmentCollection_protoBufferIgnoringSharedCollections___block_invoke;
  v24[3] = &unk_1E6BD2C60;
  v11 = v5;
  v25 = v11;
  -[NSOrderedSet enumerateObjectsUsingBlock:](items, "enumerateObjectsUsingBlock:", v24);
  defaultGalleryColors = v4->_defaultGalleryColors;
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __61__NTKPigmentCollection_protoBufferIgnoringSharedCollections___block_invoke_2;
  v22[3] = &unk_1E6BD2C60;
  v13 = v11;
  v23 = v13;
  -[NSArray enumerateObjectsUsingBlock:](defaultGalleryColors, "enumerateObjectsUsingBlock:", v22);
  collections = v4->_collections;
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __61__NTKPigmentCollection_protoBufferIgnoringSharedCollections___block_invoke_3;
  v19[3] = &unk_1E6BD2D18;
  v15 = v13;
  v20 = v15;
  v21 = a3;
  -[NSArray enumerateObjectsUsingBlock:](collections, "enumerateObjectsUsingBlock:", v19);
  v16 = v20;
  v17 = v15;

  objc_sync_exit(v4);
  return v17;
}

void __61__NTKPigmentCollection_protoBufferIgnoringSharedCollections___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "protoBuffer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addItems:", v3);

}

void __61__NTKPigmentCollection_protoBufferIgnoringSharedCollections___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "protoBuffer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addDefaultGalleryColors:", v3);

}

void __61__NTKPigmentCollection_protoBufferIgnoringSharedCollections___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = v7;
  if (objc_msgSend(v7, "isShared"))
  {
    objc_msgSend(v7, "collectionName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKPigmentCollection stubCollectionWithName:](NTKPigmentCollection, "stubCollectionWithName:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "protoBufferIgnoringSharedCollections:", *(unsigned __int8 *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addCollections:", v6);

}

- (void)fulfillWithSharedCollections:(id)a3
{
  NTKPigmentCollection *v4;
  void *v5;
  void *v6;
  unint64_t i;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NTKPigmentCollection collections](v4, "collections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  for (i = 0; ; ++i)
  {
    -[NTKPigmentCollection collections](v4, "collections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 <= i)
      break;
    -[NTKPigmentCollection collections](v4, "collections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "isStub"))
    {
      objc_msgSend(v11, "collectionName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v11, "collectionName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v11, "collectionName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:atIndexedSubscript:", v16, i);

        }
      }
    }

  }
  -[NTKPigmentCollection setCollections:](v4, "setCollections:", v6);

  objc_sync_exit(v4);
}

- (NSString)collectionName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCollectionName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NTKPigmentCollectionConfig)config
{
  return (NTKPigmentCollectionConfig *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSArray)defaultGalleryColors
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDefaultGalleryColors:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSMutableDictionary)faceSpecificPigmentsByFullname
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFaceSpecificPigmentsByFullname:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setMigration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)isShared
{
  return self->_shared;
}

- (void)setShared:(BOOL)a3
{
  self->_shared = a3;
}

- (BOOL)isStub
{
  return self->_stub;
}

- (void)setStub:(BOOL)a3
{
  self->_stub = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migration, 0);
  objc_storeStrong((id *)&self->_faceSpecificPigmentsByFullname, 0);
  objc_storeStrong((id *)&self->_defaultGalleryColors, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_collectionName, 0);
  objc_storeStrong((id *)&self->_defaultOption, 0);
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_collectionsByName, 0);
  objc_storeStrong((id *)&self->_itemsByName, 0);
}

+ (void)collectionFromProtoBuffer:(uint64_t)a1 sharedCollections:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "#color-sync Failure while creating pigment collection from protobuffer. Collection name can not be empty - %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)collectionFromProtoBuffer:(void *)a1 sharedCollections:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v2, v3, "#color-sync shared collection for %{public}@ could not be found in shared collections while decoding protobuffer object. Collection will be nil %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8();
}

void __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(*(id *)(a1 + 40), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "formattedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v5, v6, "#color-sync Failure while decoding collection's items from protobuffer. %{publib}@ - pigment protobuffer: %{public}@ ", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_8();
}

void __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke_26_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(*(id *)(a1 + 40), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "formattedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v5, v6, "#color-sync Failure while decoding collection's defaultGalleryColors from protobuffer. %{publib}@ - pigment protobuffer: %{public}@ ", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_8();
}

@end
