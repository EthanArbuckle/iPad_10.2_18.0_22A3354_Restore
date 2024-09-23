@implementation HLPHelpLocaleController

- (HLPHelpLocaleController)initWithURL:(id)a3
{
  id v4;
  HLPHelpLocaleController *v5;
  HLPHelpLocaleController *v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HLPHelpLocaleController;
  v5 = -[HLPRemoteDataController initWithURL:](&v11, sel_initWithURL_, v4);
  v6 = v5;
  if (v5)
  {
    -[HLPRemoteDataController URL](v5, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isFileURL");

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("locale-list.json"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPRemoteDataController setURL:](v6, "setURL:", v9);

    }
  }

  return v6;
}

- (void)processFileURLWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPRemoteDataController URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v7, &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;

  if (v9)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__HLPHelpLocaleController_processFileURLWithCompletionHandler___block_invoke;
    block[3] = &unk_24D32F338;
    v19 = v4;
    v18 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v10 = v19;
  }
  else
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
    v12 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __63__HLPHelpLocaleController_processFileURLWithCompletionHandler___block_invoke_2;
    v15[3] = &unk_24D32E958;
    v15[4] = self;
    v16 = v11;
    v10 = v11;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v15);
    -[HLPHelpLocaleController processData:formattedData:](self, "processData:formattedData:", 0, v10);
    v13[0] = v12;
    v13[1] = 3221225472;
    v13[2] = __63__HLPHelpLocaleController_processFileURLWithCompletionHandler___block_invoke_3;
    v13[3] = &unk_24D32E770;
    v13[4] = self;
    v14 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v13);

  }
}

uint64_t __63__HLPHelpLocaleController_processFileURLWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32), 0);
}

void __63__HLPHelpLocaleController_processFileURLWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("lproj"));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:", v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("locale-info.json"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "checkResourceIsReachableAndReturnError:", 0))
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x24BDBCE70];
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dictionaryWithDictionary:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("meta"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("isoCodes"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("isoCodes"));

        objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("folder"));
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);

      }
    }

  }
}

uint64_t __63__HLPHelpLocaleController_processFileURLWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setLoading:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHasLoaded:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)processData:(id)a3 formattedData:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSArray *v10;
  NSArray *supportedLanguageCodes;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v13 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
    v6 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __53__HLPHelpLocaleController_processData_formattedData___block_invoke;
    v14[3] = &unk_24D32F360;
    v15 = v6;
    v16 = v7;
    v8 = v7;
    v9 = v6;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v9);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    supportedLanguageCodes = self->_supportedLanguageCodes;
    self->_supportedLanguageCodes = v10;

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpLocaleController setLocales:](self, "setLocales:", v12);

  }
}

void __53__HLPHelpLocaleController_processData_formattedData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  HLPHelpLocale *v6;

  v3 = a2;
  v6 = -[HLPHelpLocale initWithDictionary:]([HLPHelpLocale alloc], "initWithDictionary:", v3);

  v4 = *(void **)(a1 + 32);
  -[HLPHelpLocale isoCodes](v6, "isoCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
}

- (id)englishLocale
{
  HLPHelpLocale *v2;

  v2 = objc_alloc_init(HLPHelpLocale);
  -[HLPHelpLocale setPath:](v2, "setPath:", CFSTR("en.lproj"));
  -[HLPHelpLocale setIsoCodes:](v2, "setIsoCodes:", &unk_24D33A538);
  return v2;
}

- (id)localeWithPreferredLanguages:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  HLPHelpLocale *v10;
  void *v11;
  id v12;
  id v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  v21 = 0;
  v14 = a3;
  v4 = (void *)objc_msgSend(v14, "mutableCopy");
  v5 = MEMORY[0x24BDAC760];
  do
  {
    if (!objc_msgSend(v4, "count"))
      break;
    objc_msgSend(MEMORY[0x24BDD1488], "preferredLocalizationsFromArray:forPreferences:", self->_supportedLanguageCodes, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __56__HLPHelpLocaleController_localeWithPreferredLanguages___block_invoke;
    v15[3] = &unk_24D32EAE0;
    v15[4] = self;
    v15[5] = &v16;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v15);
    objc_msgSend(v4, "removeObjectAtIndex:", 0);
    v7 = v17[5];

  }
  while (!v7);
  if (!v17[5])
  {
    objc_msgSend(0, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (!v9)
    {
      v10 = objc_alloc_init(HLPHelpLocale);
      v11 = (void *)v17[5];
      v17[5] = (uint64_t)v10;

      objc_msgSend((id)v17[5], "setPath:", CFSTR("en.lproj"));
      objc_msgSend((id)v17[5], "setIsoCodes:", &unk_24D33A550);
    }
  }
  v12 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v12;
}

void __56__HLPHelpLocaleController_localeWithPreferredLanguages___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  objc_msgSend(a2, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "locales");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__HLPHelpLocaleController_localeWithPreferredLanguages___block_invoke_2;
  v10[3] = &unk_24D32F388;
  v8 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v8;
  v9 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;

}

void __56__HLPHelpLocaleController_localeWithPreferredLanguages___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "isoCodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", *(_QWORD *)(a1 + 32));

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)currentLocale
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("HLPHelpBookPreferredLanguageOverride"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  -[HLPHelpLocaleController preferredLanguagesOverride](self, "preferredLanguagesOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[HLPHelpLocaleController preferredLanguagesOverride](self, "preferredLanguagesOverride");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v8);

  }
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  -[HLPHelpLocaleController localeWithPreferredLanguages:](self, "localeWithPreferredLanguages:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)preferredLanguagesOverride
{
  return self->_preferredLanguagesOverride;
}

- (void)setPreferredLanguagesOverride:(id)a3
{
  objc_storeStrong((id *)&self->_preferredLanguagesOverride, a3);
}

- (NSArray)locales
{
  return self->_locales;
}

- (void)setLocales:(id)a3
{
  objc_storeStrong((id *)&self->_locales, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_preferredLanguagesOverride, 0);
  objc_storeStrong((id *)&self->_helpBookURL, 0);
  objc_storeStrong((id *)&self->_supportedLanguageCodes, 0);
}

@end
