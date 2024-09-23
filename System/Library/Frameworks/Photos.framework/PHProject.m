@implementation PHProject

- (PHProject)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  PHProject *v9;
  uint64_t v10;
  NSString *projectExtensionIdentifier;
  uint64_t v12;
  NSString *projectDocumentType;
  uint64_t v14;
  NSData *projectExtensionData;
  uint64_t v16;
  NSString *projectRenderUuid;
  uint64_t v18;
  NSDate *creationDate;
  objc_super v21;

  v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PHProject;
  v9 = -[PHAssetCollection initWithFetchDictionary:propertyHint:photoLibrary:](&v21, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("projectExtensionIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    projectExtensionIdentifier = v9->_projectExtensionIdentifier;
    v9->_projectExtensionIdentifier = (NSString *)v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("projectDocumentType"));
    v12 = objc_claimAutoreleasedReturnValue();
    projectDocumentType = v9->_projectDocumentType;
    v9->_projectDocumentType = (NSString *)v12;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("projectData"));
    v14 = objc_claimAutoreleasedReturnValue();
    projectExtensionData = v9->_projectExtensionData;
    v9->_projectExtensionData = (NSData *)v14;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("projectRenderUuid"));
    v16 = objc_claimAutoreleasedReturnValue();
    projectRenderUuid = v9->_projectRenderUuid;
    v9->_projectRenderUuid = (NSString *)v16;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("creationDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    creationDate = v9->_creationDate;
    v9->_creationDate = (NSDate *)v18;

    v9->super._assetCollectionType = 10;
  }

  return v9;
}

- (BOOL)canPerformEditOperation:(int64_t)a3
{
  return a3 != 1;
}

- (BOOL)canContainCustomKeyAssets
{
  return objc_msgSend(MEMORY[0x1E0D71778], "supportsCustomKeyAssetWithAlbumKind:", 1508);
}

- (BOOL)hasProjectPreview
{
  void *v2;
  BOOL v3;

  -[PHProject projectRenderUuid](self, "projectRenderUuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSData)projectExtensionData
{
  PHProject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSData *v9;
  NSData *projectExtensionData;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_projectExtensionData)
  {
    -[PHObject photoLibrary](v2, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assetsdClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resourceClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHObject uuid](v2, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "projectExtensionDataForProjectUuid:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v9 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    projectExtensionData = v2->_projectExtensionData;
    v2->_projectExtensionData = v9;

  }
  objc_sync_exit(v2);

  return v2->_projectExtensionData;
}

- (id)creationDate
{
  return self->_creationDate;
}

- (NSString)projectExtensionIdentifier
{
  return self->_projectExtensionIdentifier;
}

- (NSString)projectDocumentType
{
  return self->_projectDocumentType;
}

- (NSString)projectRenderUuid
{
  return self->_projectRenderUuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_projectRenderUuid, 0);
  objc_storeStrong((id *)&self->_projectDocumentType, 0);
  objc_storeStrong((id *)&self->_projectExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_projectExtensionData, 0);
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  if (propertiesToFetchWithHint__onceToken_1190 != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken_1190, &__block_literal_global_1191);
  return (id)propertiesToFetchWithHint__array;
}

+ (id)managedEntityName
{
  return (id)objc_msgSend(MEMORY[0x1E0D71A20], "entityName");
}

+ (id)localIdentifierWithUUID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "identifierCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/L0/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHProject");
  return CFSTR("PHProject");
}

+ (id)identifierCode
{
  return CFSTR("180");
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15_1181;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PHProject_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken != -1)
    dispatch_once(&transformValueExpression_forKeyPath__onceToken, block);
  if (objc_msgSend((id)transformValueExpression_forKeyPath___passThroughSet, "containsObject:", v7))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

+ (id)fetchProjectsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_52);
}

+ (id)fetchProjectsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__PHProject_fetchProjectsWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __55__PHProject_fetchProjectsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForProjectsWithLocalIdentifiers:options:](PHQuery, "queryForProjectsWithLocalIdentifiers:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __38__PHProject_fetchProjectsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssetCollectionsWithType:subtype:options:](PHQuery, "queryForAssetCollectionsWithType:subtype:options:", 10, 0x7FFFFFFFFFFFFFFFLL, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __49__PHProject_transformValueExpression_forKeyPath___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[10];

  v4[9] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("projectExtensionIdentifier");
  v4[1] = CFSTR("projectDocumentType");
  v4[2] = CFSTR("projectExtensionData");
  v4[3] = CFSTR("projectRenderUuid");
  v4[4] = CFSTR("projectData");
  v4[5] = CFSTR("cloudGUID");
  v4[6] = CFSTR("title");
  v4[7] = CFSTR("uuid");
  v4[8] = CFSTR("creationDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet;
  transformValueExpression_forKeyPath___passThroughSet = v2;

}

void __25__PHProject_entityKeyMap__block_invoke()
{
  PHEntityKeyMap *v0;
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
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  _QWORD v17[2];
  const __CFString *v18;
  const __CFString *v19;
  _QWORD v20[8];
  _QWORD v21[10];

  v21[8] = *MEMORY[0x1E0C80C00];
  v0 = [PHEntityKeyMap alloc];
  v19 = CFSTR("projectExtensionIdentifier");
  v20[0] = CFSTR("projectExtensionIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v1;
  v20[1] = CFSTR("projectDocumentType");
  v18 = CFSTR("projectDocumentType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v2;
  v20[2] = CFSTR("projectData");
  v17[0] = CFSTR("projectExtensionData");
  v17[1] = CFSTR("projectData");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v3;
  v20[3] = CFSTR("projectRenderUuid");
  v16 = CFSTR("projectRenderUuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v4;
  v20[4] = CFSTR("cloudGUID");
  v15 = CFSTR("cloudGUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v5;
  v20[5] = CFSTR("title");
  v14 = CFSTR("title");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v6;
  v20[6] = CFSTR("uuid");
  v13 = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v7;
  v20[7] = CFSTR("creationDate");
  v12 = CFSTR("creationDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[7] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v0, "initWithPropertyKeysByEntityKey:", v9);
  v11 = (void *)entityKeyMap_pl_once_object_15_1181;
  entityKeyMap_pl_once_object_15_1181 = v10;

}

void __39__PHProject_propertiesToFetchWithHint___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[10];

  v3[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D718A8], "objectIDDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  v3[1] = CFSTR("trashedState");
  v3[2] = CFSTR("projectExtensionIdentifier");
  v3[3] = CFSTR("projectDocumentType");
  v3[4] = CFSTR("projectRenderUuid");
  v3[5] = CFSTR("cloudGUID");
  v3[6] = CFSTR("title");
  v3[7] = CFSTR("uuid");
  v3[8] = CFSTR("creationDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)propertiesToFetchWithHint__array;
  propertiesToFetchWithHint__array = v1;

}

@end
