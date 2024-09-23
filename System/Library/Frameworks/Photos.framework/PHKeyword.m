@implementation PHKeyword

- (PHKeyword)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  PHKeyword *v9;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSString *shortcut;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHKeyword;
  v9 = -[PHObject initWithFetchDictionary:propertyHint:photoLibrary:](&v15, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v9->_title;
    v9->_title = (NSString *)v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("shortcut"));
    v12 = objc_claimAutoreleasedReturnValue();
    shortcut = v9->_shortcut;
    v9->_shortcut = (NSString *)v12;

  }
  return v9;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHKeyword;
  -[PHObject description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" title=%@, shortcut=%@"), self->_title, self->_shortcut);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)shortcut
{
  return self->_shortcut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  pl_dispatch_once();
  return (id)propertiesToFetchWithHint__pl_once_object_15;
}

+ (id)managedEntityName
{
  return (id)objc_msgSend(MEMORY[0x1E0D718A0], "entityName");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHKeyword");
  return CFSTR("PHKeyword");
}

+ (id)identifierCode
{
  return CFSTR("190");
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_16_39190;
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

+ (id)fetchKeywordsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_40);
}

+ (id)fetchKeywordsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__PHKeyword_fetchKeywordsWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchKeywordsWithTitles:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__PHKeyword_fetchKeywordsWithTitles_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchKeywordsForAsset:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__PHKeyword_fetchKeywordsForAsset_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __43__PHKeyword_fetchKeywordsForAsset_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForKeywordsForAsset:options:](PHQuery, "queryForKeywordsForAsset:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __45__PHKeyword_fetchKeywordsWithTitles_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForKeywordsWithTitles:options:](PHQuery, "queryForKeywordsWithTitles:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __55__PHKeyword_fetchKeywordsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForKeywordsWithLocalIdentifiers:options:](PHQuery, "queryForKeywordsWithLocalIdentifiers:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __38__PHKeyword_fetchKeywordsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForKeywordsWithOptions:](PHQuery, "queryForKeywordsWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __25__PHKeyword_entityKeyMap__block_invoke()
{
  PHEntityKeyMap *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v0 = [PHEntityKeyMap alloc];
  v9 = CFSTR("uuid");
  v10[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v1;
  v10[1] = CFSTR("title");
  v8 = CFSTR("title");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v2;
  v10[2] = CFSTR("shortcut");
  v7 = CFSTR("shortcut");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v0, "initWithPropertyKeysByEntityKey:", v4);
  v6 = (void *)entityKeyMap_pl_once_object_16_39190;
  entityKeyMap_pl_once_object_16_39190 = v5;

}

void __39__PHKeyword_propertiesToFetchWithHint___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D718A8], "objectIDDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  v4[1] = CFSTR("uuid");
  v4[2] = CFSTR("title");
  v4[3] = CFSTR("shortcut");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)propertiesToFetchWithHint__pl_once_object_15;
  propertiesToFetchWithHint__pl_once_object_15 = v2;

}

@end
