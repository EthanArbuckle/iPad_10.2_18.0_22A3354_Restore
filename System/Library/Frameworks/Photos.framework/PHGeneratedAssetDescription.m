@implementation PHGeneratedAssetDescription

- (PHGeneratedAssetDescription)initWithNodeContainer:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PHGeneratedAssetDescription *v12;
  uint64_t v13;
  NSString *descriptionText;
  objc_super v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18[0] = MEMORY[0x1E0C9AAA0];
  v17[0] = CFSTR("deleted");
  v17[1] = CFSTR("uuid");
  v7 = a4;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  v17[2] = CFSTR("objectID");
  objc_msgSend(v6, "sourceNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)PHGeneratedAssetDescription;
  v12 = -[PHObject initWithFetchDictionary:propertyHint:photoLibrary:](&v16, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v11, 2, v7);

  if (v12)
  {
    objc_msgSend(v6, "descriptionText");
    v13 = objc_claimAutoreleasedReturnValue();
    descriptionText = v12->_descriptionText;
    v12->_descriptionText = (NSString *)v13;

    v12->_analysisVersion = objc_msgSend(v6, "analysisVersion");
    v12->_analysisSourceType = objc_msgSend(v6, "analysisSourceType");
  }

  return v12;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PHObject objectID](self, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObject uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("UUID: %@, "), v4);

  -[PHGeneratedAssetDescription descriptionText](self, "descriptionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("descriptionText: %@, "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("analysisVersion: %d, "), -[PHGeneratedAssetDescription analysisVersion](self, "analysisVersion"));
  objc_msgSend(v3, "appendFormat:", CFSTR("sourceType: %ld, "), -[PHGeneratedAssetDescription analysisSourceType](self, "analysisSourceType"));
  return v3;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (signed)analysisVersion
{
  return self->_analysisVersion;
}

- (void)setAnalysisVersion:(signed __int16)a3
{
  self->_analysisVersion = a3;
}

- (int64_t)analysisSourceType
{
  return self->_analysisSourceType;
}

- (void)setAnalysisSourceType:(int64_t)a3
{
  self->_analysisSourceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionText, 0);
}

+ (id)fetchGeneratedAssetDescriptionsGroupedByAssetLocalIdentifierWithType:(int64_t)a3 forAssets:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  void *v24;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "_pl_indexBy:", &__block_literal_global_38627);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "photoLibraryForCurrentQueueQoS");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D71770], "fetchGeneratedAssetDescriptionsGroupedByAssetIdWithType:forAssetsIDs:inLibrary:", a3, v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __110__PHGeneratedAssetDescription_fetchGeneratedAssetDescriptionsGroupedByAssetLocalIdentifierWithType_forAssets___block_invoke_2;
    v20[3] = &unk_1E35DE750;
    v21 = v12;
    v22 = v7;
    v13 = v6;
    v23 = v13;
    v24 = v10;
    v14 = v10;
    v15 = v7;
    v16 = v12;
    objc_msgSend(v11, "performBlockAndWait:", v20);
    v17 = v24;
    v18 = v13;

  }
  return v6;
}

+ (id)managedEntityName
{
  return (id)objc_msgSend(MEMORY[0x1E0D71788], "entityName");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHGeneratedAssetDescription");
  return CFSTR("PHGeneratedAssetDescription");
}

+ (id)identifierCode
{
  return CFSTR("240");
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15_38620;
}

void __43__PHGeneratedAssetDescription_entityKeyMap__block_invoke()
{
  PHEntityKeyMap *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v0 = [PHEntityKeyMap alloc];
  v7 = CFSTR("uuid");
  v8[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("objectID");
  v9[0] = v1;
  v6 = CFSTR("objectID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v0, "initWithPropertyKeysByEntityKey:", v3);
  v5 = (void *)entityKeyMap_pl_once_object_15_38620;
  entityKeyMap_pl_once_object_15_38620 = v4;

}

void __110__PHGeneratedAssetDescription_fetchGeneratedAssetDescriptionsGroupedByAssetLocalIdentifierWithType_forAssets___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  PHGeneratedAssetDescription *v10;
  void *v11;
  PHGeneratedAssetDescription *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uuid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHObject localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = [PHGeneratedAssetDescription alloc];
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[PHGeneratedAssetDescription initWithNodeContainer:photoLibrary:](v10, "initWithNodeContainer:photoLibrary:", v11, *(_QWORD *)(a1 + 56));
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v12, v9);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v3);
  }

}

uint64_t __110__PHGeneratedAssetDescription_fetchGeneratedAssetDescriptionsGroupedByAssetLocalIdentifierWithType_forAssets___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

@end
