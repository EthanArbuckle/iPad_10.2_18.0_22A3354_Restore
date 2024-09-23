@implementation PHAssetCollectionReference

- (PHAssetCollectionReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4 type:(int64_t)a5 subtype:(int64_t)a6 assetReferences:(id)a7 transientIdentifier:(id)a8 transientTitle:(id)a9
{
  id v15;
  PHAssetCollectionReference *v16;
  PHAssetCollectionReference *v17;
  uint64_t v18;
  NSArray *transientAssetReferences;
  objc_super v21;

  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PHAssetCollectionReference;
  v16 = -[PHCollectionReference initWithLocalIdentifier:libraryURL:transientIdentifier:transientTitle:](&v21, sel_initWithLocalIdentifier_libraryURL_transientIdentifier_transientTitle_, a3, a4, a8, a9);
  v17 = v16;
  if (v16)
  {
    v16->_assetCollectionType = a5;
    v16->_assetCollectionSubtype = a6;
    v18 = objc_msgSend(v15, "copy");
    transientAssetReferences = v17->_transientAssetReferences;
    v17->_transientAssetReferences = (NSArray *)v18;

  }
  return v17;
}

- (PHAssetCollectionReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4 type:(int64_t)a5 subtype:(int64_t)a6
{
  return -[PHAssetCollectionReference initWithLocalIdentifier:libraryURL:type:subtype:assetReferences:transientIdentifier:transientTitle:](self, "initWithLocalIdentifier:libraryURL:type:subtype:assetReferences:transientIdentifier:transientTitle:", a3, a4, a5, a6, 0, 0, 0);
}

- (PHAssetCollectionReference)initWithDictionary:(id)a3 referenceType:(id)a4
{
  id v6;
  PHAssetCollectionReference *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *transientAssetReferences;
  objc_super v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PHAssetCollectionReference;
  v7 = -[PHCollectionReference initWithDictionary:referenceType:](&v16, sel_initWithDictionary_referenceType_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("assetCollectionType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("assetCollectionSubtype"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_assetCollectionType = objc_msgSend(v8, "integerValue");
    v7->_assetCollectionSubtype = objc_msgSend(v9, "integerValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transientAssetReferences"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = CFSTR("com.apple.photos.object-reference.asset");
    v18[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PHObjectReferencesForDictionaries(v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "copy");
    transientAssetReferences = v7->_transientAssetReferences;
    v7->_transientAssetReferences = (NSArray *)v13;

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
  v10.super_class = (Class)PHAssetCollectionReference;
  -[PHCollectionReference dictionaryForReferenceType:](&v10, sel_dictionaryForReferenceType_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHAssetCollectionReference assetCollectionType](self, "assetCollectionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("assetCollectionType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHAssetCollectionReference assetCollectionSubtype](self, "assetCollectionSubtype"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("assetCollectionSubtype"));

  if (-[PHAssetCollectionReference transient](self, "transient"))
  {
    -[PHAssetCollectionReference transientAssetReferences](self, "transientAssetReferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PHObjectReferenceDictionariesForReferences(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("transientAssetReferences"));

  }
  return v4;
}

- (BOOL)transient
{
  void *v2;
  BOOL v3;

  -[PHAssetCollectionReference transientAssetReferences](self, "transientAssetReferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_transientCollectionInLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PHAssetCollectionReference transientAssetReferences](self, "transientAssetReferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAsset fetchAssetsForReferences:photoLibrary:](PHAsset, "fetchAssetsForReferences:photoLibrary:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHCollectionReference transientTitle](self, "transientTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCollectionReference transientIdentifier](self, "transientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    +[PHAssetCollection transientAssetCollectionWithAssetFetchResult:title:identifier:](PHAssetCollection, "transientAssetCollectionWithAssetFetchResult:title:identifier:", v6, v7, v8);
  else
    +[PHAssetCollection transientAssetCollectionWithAssets:title:identifier:photoLibrary:](PHAssetCollection, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", MEMORY[0x1E0C9AA60], v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)assetCollectionType
{
  return self->_assetCollectionType;
}

- (int64_t)assetCollectionSubtype
{
  return self->_assetCollectionSubtype;
}

- (NSArray)transientAssetReferences
{
  return self->_transientAssetReferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientAssetReferences, 0);
}

+ (id)representedType
{
  return CFSTR("com.apple.photos.object-reference.assetcollection");
}

+ (id)referenceForAssetCollection:(id)a3
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
    +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v4, 0);
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
  v19 = (void *)objc_msgSend(v15, "initWithLocalIdentifier:libraryURL:type:subtype:assetReferences:transientIdentifier:transientTitle:", v16, v18, objc_msgSend(v4, "assetCollectionType"), objc_msgSend(v4, "assetCollectionSubtype"), v8, v5, v6);

  return v19;
}

@end
