@implementation PHImportSession

- (PHImportSession)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  PHImportSession *v9;
  uint64_t v10;
  NSString *importSessionID;
  uint64_t v12;
  NSDate *startDate;
  uint64_t v14;
  NSDate *endDate;
  objc_super v17;

  v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PHImportSession;
  v9 = -[PHAssetCollection initWithFetchDictionary:propertyHint:photoLibrary:](&v17, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("importSessionID"));
    v10 = objc_claimAutoreleasedReturnValue();
    importSessionID = v9->_importSessionID;
    v9->_importSessionID = (NSString *)v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("startDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    startDate = v9->super._startDate;
    v9->super._startDate = (NSDate *)v12;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("endDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    endDate = v9->super._endDate;
    v9->super._endDate = (NSDate *)v14;

    v9->super._assetCollectionType = 9;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHImportSession;
  -[PHAssetCollection description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportSession importSessionID](self, "importSessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCollection startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCollection endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@ (%@ - %@)"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)importSessionID
{
  return self->_importSessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importSessionID, 0);
}

+ (id)managedEntityName
{
  return CFSTR("ImportSession");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHImportSession");
  return CFSTR("PHImportSession");
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 0;
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PHImportSession_propertiesToFetchWithHint___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesToFetchWithHint__onceToken_10220 != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken_10220, block);
  return (id)propertiesToFetchWithHint__array_10221;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15_10215;
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
  block[2] = __55__PHImportSession_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_10210 != -1)
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_10210, block);
  if (objc_msgSend((id)transformValueExpression_forKeyPath___passThroughSet_10211, "containsObject:", v7))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

+ (id)identifierCode
{
  return CFSTR("170");
}

+ (id)fetchImportSessionsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_10206);
}

id __50__PHImportSession_fetchImportSessionsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForImportSessionsWithOptions:](PHQuery, "queryForImportSessionsWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __55__PHImportSession_transformValueExpression_forKeyPath___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("importSessionID");
  v4[1] = CFSTR("startDate");
  v4[2] = CFSTR("endDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_10211;
  transformValueExpression_forKeyPath___passThroughSet_10211 = v2;

}

void __31__PHImportSession_entityKeyMap__block_invoke()
{
  PHEntityKeyMap *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v0 = [PHEntityKeyMap alloc];
  v11 = CFSTR("uuid");
  v12[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v1;
  v12[1] = CFSTR("importSessionID");
  v10 = CFSTR("importSessionID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v2;
  v12[2] = CFSTR("startDate");
  v9 = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v3;
  v12[3] = CFSTR("endDate");
  v8 = CFSTR("endDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v0, "initWithPropertyKeysByEntityKey:", v5);
  v7 = (void *)entityKeyMap_pl_once_object_15_10215;
  entityKeyMap_pl_once_object_15_10215 = v6;

}

void __45__PHImportSession_propertiesToFetchWithHint___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v0, "setName:", CFSTR("objectID"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setExpression:", v1);

  objc_msgSend(v0, "setExpressionResultType:", 2000);
  v4[0] = v0;
  v4[1] = CFSTR("uuid");
  v4[2] = CFSTR("importSessionID");
  v4[3] = CFSTR("startDate");
  v4[4] = CFSTR("endDate");
  v4[5] = CFSTR("cachedCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 6);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)propertiesToFetchWithHint__array_10221;
  propertiesToFetchWithHint__array_10221 = v2;

}

@end
