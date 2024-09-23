@implementation PHCollectionListReference

- (PHCollectionListReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4 collectionListType:(int64_t)a5 collectionListSubtype:(int64_t)a6 collectionReferences:(id)a7 transientIdentifier:(id)a8 transientTitle:(id)a9
{
  id v15;
  PHCollectionListReference *v16;
  PHCollectionListReference *v17;
  uint64_t v18;
  NSArray *transientCollectionReferences;
  objc_super v21;

  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PHCollectionListReference;
  v16 = -[PHCollectionReference initWithLocalIdentifier:libraryURL:transientIdentifier:transientTitle:](&v21, sel_initWithLocalIdentifier_libraryURL_transientIdentifier_transientTitle_, a3, a4, a8, a9);
  v17 = v16;
  if (v16)
  {
    v16->_collectionListType = a5;
    v16->_collectionListSubtype = a6;
    v18 = objc_msgSend(v15, "copy");
    transientCollectionReferences = v17->_transientCollectionReferences;
    v17->_transientCollectionReferences = (NSArray *)v18;

  }
  return v17;
}

- (PHCollectionListReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4 collectionListType:(int64_t)a5 collectionListSubtype:(int64_t)a6
{
  return -[PHCollectionListReference initWithLocalIdentifier:libraryURL:collectionListType:collectionListSubtype:collectionReferences:transientIdentifier:transientTitle:](self, "initWithLocalIdentifier:libraryURL:collectionListType:collectionListSubtype:collectionReferences:transientIdentifier:transientTitle:", a3, a4, a5, a6, 0, 0, 0);
}

- (PHCollectionListReference)initWithDictionary:(id)a3 referenceType:(id)a4
{
  id v6;
  PHCollectionListReference *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *transientCollectionReferences;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PHCollectionListReference;
  v7 = -[PHCollectionReference initWithDictionary:referenceType:](&v17, sel_initWithDictionary_referenceType_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("collectionListType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("collectionListSubtype"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_collectionListType = objc_msgSend(v8, "integerValue");
    v7->_collectionListSubtype = objc_msgSend(v9, "integerValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transientCollectionReferences"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = CFSTR("com.apple.photos.object-reference.assetcollection");
    v11 = objc_opt_class();
    v18[1] = CFSTR("com.apple.photos.object-reference.collectionlist");
    v19[0] = v11;
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PHObjectReferencesForDictionaries(v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    transientCollectionReferences = v7->_transientCollectionReferences;
    v7->_transientCollectionReferences = (NSArray *)v14;

  }
  return v7;
}

- (id)dictionaryForReferenceType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHCollectionListReference;
  -[PHCollectionReference dictionaryForReferenceType:](&v10, sel_dictionaryForReferenceType_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHCollectionListReference collectionListType](self, "collectionListType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("collectionListType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHCollectionListReference collectionListSubtype](self, "collectionListSubtype"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("collectionListSubtype"));

  if (-[PHCollectionListReference transient](self, "transient"))
  {
    -[PHCollectionListReference transientCollectionReferences](self, "transientCollectionReferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PHObjectReferenceDictionariesForReferences(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("transientCollectionReferences"));

  }
  return v4;
}

- (BOOL)transient
{
  void *v2;
  BOOL v3;

  -[PHCollectionListReference transientCollectionReferences](self, "transientCollectionReferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_transientCollectionInLibrary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHCollectionListReference transientCollectionReferences](self, "transientCollectionReferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v26 = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[PHAssetCollection fetchAssetCollectionsForReferences:photoLibrary:](PHAssetCollection, "fetchAssetCollectionsForReferences:photoLibrary:", v12, v4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v25 = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[PHCollectionList fetchCollectionListsForReferences:photoLibrary:](PHCollectionList, "fetchCollectionListsForReferences:photoLibrary:", v12, v4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v14 = v13;
        objc_msgSend(v13, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v20, "addObject:", v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v8);
  }

  -[PHCollectionReference transientTitle](self, "transientTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCollectionReference transientIdentifier](self, "transientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHCollectionList transientCollectionListWithCollections:title:identifier:photoLibrary:](PHCollectionList, "transientCollectionListWithCollections:title:identifier:photoLibrary:", v20, v16, v17, v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (int64_t)collectionListType
{
  return self->_collectionListType;
}

- (int64_t)collectionListSubtype
{
  return self->_collectionListSubtype;
}

- (NSArray)transientCollectionReferences
{
  return self->_transientCollectionReferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientCollectionReferences, 0);
}

+ (id)representedType
{
  return CFSTR("com.apple.photos.object-reference.collectionlist");
}

+ (id)referenceForCollectionList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isTransient"))
  {
    objc_msgSend(v4, "transientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHCollection fetchCollectionsInCollectionList:options:](PHCollectionList, "fetchCollectionsInCollectionList:options:", v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v13), "objectReference");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

  }
  else
  {
    v6 = 0;
    v5 = 0;
    v8 = 0;
  }
  v15 = objc_alloc((Class)a1);
  objc_msgSend(v4, "localIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "photoLibraryURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v15, "initWithLocalIdentifier:libraryURL:collectionListType:collectionListSubtype:collectionReferences:transientIdentifier:transientTitle:", v16, v18, objc_msgSend(v4, "collectionListType"), objc_msgSend(v4, "collectionListSubtype"), v8, v5, v6);

  return v19;
}

@end
