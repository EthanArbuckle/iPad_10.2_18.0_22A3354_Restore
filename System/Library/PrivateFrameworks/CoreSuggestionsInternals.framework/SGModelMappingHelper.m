@implementation SGModelMappingHelper

+ (id)mappingsForType:(id)a3 andLanguage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  objc_msgSend(a1, "loadMappingsForType:andLanguage:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__SGModelMappingHelper_mappingsForType_andLanguage___block_invoke;
  v14[3] = &unk_1E7DAE818;
  v9 = v8;
  v15 = v9;
  v16 = v6;
  v10 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);
  v11 = v16;
  v12 = v9;

  return v12;
}

+ (id)loadMappingsForType:(id)a3 andLanguage:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0D19EC8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "mappings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __52__SGModelMappingHelper_mappingsForType_andLanguage___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), a2);
}

@end
