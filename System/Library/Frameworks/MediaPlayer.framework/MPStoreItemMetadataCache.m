@implementation MPStoreItemMetadataCache

- (id)addMetadata:(id)a3 forItemIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  -[MPStoreItemMetadataCache metadataForItemIdentifier:](self, "metadataForItemIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v8;
  if (v9)
  {
    v11 = v8;
    if ((objc_msgSend(v9, "isExpired") & 1) == 0)
    {
      objc_msgSend(v10, "metadataByAppendingMetadata:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v21 = v8;
  objc_msgSend(v11, "childStoreItemMetadatas");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v17, "cacheableItemIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "length"))
          v19 = -[MPStoreItemMetadataCache addMetadata:forItemIdentifier:](self, "addMetadata:forItemIdentifier:", v17, v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }
  -[MSVLRUDictionary setObject:forKey:](self->_itemIdentifierToCompositeStoreItemMetadataLRUDictionary, "setObject:forKey:", v11, v7);
  -[NSMapTable setObject:forKey:](self->_itemIdentifierToCompositeStoreItemMetadataMapTable, "setObject:forKey:", v11, v7);

  return v11;
}

- (id)metadataForItemIdentifier:(id)a3 ignoreExpiration:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  -[MSVLRUDictionary objectForKey:](self->_itemIdentifierToCompositeStoreItemMetadataLRUDictionary, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (a4 || (objc_msgSend(v7, "isExpired") & 1) == 0))
  {
    v11 = v8;
  }
  else
  {
    -[NSMapTable objectForKey:](self->_itemIdentifierToCompositeStoreItemMetadataMapTable, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && (a4 || (objc_msgSend(v9, "isExpired") & 1) == 0))
      v11 = v10;
    else
      v11 = 0;

  }
  return v11;
}

- (id)metadataForItemIdentifier:(id)a3
{
  return -[MPStoreItemMetadataCache metadataForItemIdentifier:ignoreExpiration:](self, "metadataForItemIdentifier:ignoreExpiration:", a3, 0);
}

- (MPStoreItemMetadataCache)initWithCacheSize:(int64_t)a3
{
  MPStoreItemMetadataCache *v4;
  uint64_t v5;
  MSVLRUDictionary *itemIdentifierToCompositeStoreItemMetadataLRUDictionary;
  uint64_t v7;
  NSMapTable *itemIdentifierToCompositeStoreItemMetadataMapTable;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MPStoreItemMetadataCache;
  v4 = -[MPStoreItemMetadataCache init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4D078]), "initWithMaximumCapacity:", a3);
    itemIdentifierToCompositeStoreItemMetadataLRUDictionary = v4->_itemIdentifierToCompositeStoreItemMetadataLRUDictionary;
    v4->_itemIdentifierToCompositeStoreItemMetadataLRUDictionary = (MSVLRUDictionary *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 0);
    itemIdentifierToCompositeStoreItemMetadataMapTable = v4->_itemIdentifierToCompositeStoreItemMetadataMapTable;
    v4->_itemIdentifierToCompositeStoreItemMetadataMapTable = (NSMapTable *)v7;

  }
  return v4;
}

- (int64_t)count
{
  unint64_t v3;
  int64_t result;

  v3 = -[MSVLRUDictionary count](self->_itemIdentifierToCompositeStoreItemMetadataLRUDictionary, "count");
  result = -[NSMapTable count](self->_itemIdentifierToCompositeStoreItemMetadataMapTable, "count");
  if (v3 < result)
    return v3;
  return result;
}

- (void)removeExpiredMetadata
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  NSMapTable *v10;
  NSMapTable *v11;
  NSMapTable *itemIdentifierToCompositeStoreItemMetadataMapTable;
  NSMapTable *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[MSVLRUDictionary allKeys](self->_itemIdentifierToCompositeStoreItemMetadataLRUDictionary, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[MSVLRUDictionary objectForKey:](self->_itemIdentifierToCompositeStoreItemMetadataLRUDictionary, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isExpired"))
          -[MSVLRUDictionary removeObjectForKey:](self->_itemIdentifierToCompositeStoreItemMetadataLRUDictionary, "removeObjectForKey:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v5);
  }
  v10 = self->_itemIdentifierToCompositeStoreItemMetadataMapTable;
  v11 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, -[NSMapTable count](v10, "count"));
  itemIdentifierToCompositeStoreItemMetadataMapTable = self->_itemIdentifierToCompositeStoreItemMetadataMapTable;
  self->_itemIdentifierToCompositeStoreItemMetadataMapTable = v11;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v10;
  v14 = -[NSMapTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j);
        -[NSMapTable objectForKey:](v13, "objectForKey:", v18, (_QWORD)v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "isExpired") & 1) == 0)
          -[NSMapTable setObject:forKey:](self->_itemIdentifierToCompositeStoreItemMetadataMapTable, "setObject:forKey:", v19, v18);

      }
      v15 = -[NSMapTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifierToCompositeStoreItemMetadataMapTable, 0);
  objc_storeStrong((id *)&self->_itemIdentifierToCompositeStoreItemMetadataLRUDictionary, 0);
}

@end
