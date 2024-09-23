@implementation PHCollectionListAncestryContext

- (PHCollectionListAncestryContext)initWithCollectionLists:(id)a3
{
  id v5;
  PHCollectionListAncestryContext *v6;
  PHCollectionListAncestryContext *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *collectionListsByOID;
  NSFastEnumeration *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PHCollectionListAncestryContext;
  v6 = -[PHCollectionListAncestryContext init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_allCollectionLists, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    collectionListsByOID = v7->_collectionListsByOID;
    v7->_collectionListsByOID = v8;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v7->_allCollectionLists;
    v11 = -[NSFastEnumeration countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v15, "objectID", (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_collectionListsByOID, "setObject:forKeyedSubscript:", v15, v16);

        }
        v12 = -[NSFastEnumeration countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v12);
    }

  }
  return v7;
}

- (id)folderForID:(id)a3
{
  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_collectionListsByOID, "objectForKeyedSubscript:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSFastEnumeration)allCollectionLists
{
  return (NSFastEnumeration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAllCollectionLists:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)collectionListsByOID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCollectionListsByOID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionListsByOID, 0);
  objc_storeStrong((id *)&self->_allCollectionLists, 0);
}

@end
