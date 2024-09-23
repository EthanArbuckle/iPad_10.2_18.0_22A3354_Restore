@implementation ICIndexerStateHandler

+ (void)registerStateHandler
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__ICIndexerStateHandler_registerStateHandler__block_invoke;
  v2[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v2[4] = a1;
  +[ICStateHandler addStateHandlerWithName:sysdiagnoseOnly:stateBlock:](ICStateHandler, "addStateHandlerWithName:sysdiagnoseOnly:stateBlock:", "Notes Indexer", 1, v2);
}

uint64_t __45__ICIndexerStateHandler_registerStateHandler__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stateDictionary");
}

+ (id)stateDictionary
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[ICAppGroupDefaults sharedAppGroupDefaults](ICAppGroupDefaults, "sharedAppGroupDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("kICIndexerStateUserDefaultsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA70];
  v5 = v3;

  return v5;
}

+ (void)setStateDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ICAppGroupDefaults sharedAppGroupDefaults](ICAppGroupDefaults, "sharedAppGroupDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("kICIndexerStateUserDefaultsKey"));

}

+ (void)logMethodCall:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stateDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = v9;
  else
    v11 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v8, "arrayWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v12, "count") >= 0xA)
  {
    do
      objc_msgSend(v12, "removeObjectAtIndex:", 0);
    while ((unint64_t)objc_msgSend(v12, "count") > 9);
  }
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v14);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v7);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setStateDictionary:", v15);

}

@end
