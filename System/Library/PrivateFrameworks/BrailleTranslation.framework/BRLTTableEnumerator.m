@implementation BRLTTableEnumerator

+ (id)localizedNameForServiceWithIdentifier:(id)a3
{
  return BRLTLocalizedStringForKey(a3);
}

+ (id)localizedNameForLanguageAgnosticTableIdentifier:(id)a3
{
  return BRLTLocalizedStringForKey(a3);
}

+ (id)localizedNameForLanguage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForLanguage:context:", v3, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.language"), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BRLTLocalizedStringForKey(v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }

  return v5;
}

+ (id)defaultTableForLocale:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "defaultTablesArrayForLocale:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)defaultTablesArrayForLocale:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  BRLTTable *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  BRLTTable *v26;
  NSObject *v27;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *obj;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _QWORD v48[3];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (defaultTablesArrayForLocale__onceToken != -1)
    dispatch_once(&defaultTablesArrayForLocale__onceToken, &__block_literal_global_2);
  objc_msgSend(v4, "collatorIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)defaultTablesArrayForLocale__DefaultTables, "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_10;
  v6 = v35;
  v7 = objc_msgSend(v6, "rangeOfString:", CFSTR("-"));
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v7 + 1;
    objc_msgSend(v6, "substringFromIndex:", v7 + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "rangeOfString:", CFSTR("-"));
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "substringToIndex:", v10 + v8);
      v11 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v11;
    }

  }
  objc_msgSend((id)defaultTablesArrayForLocale__DefaultTables, "objectForKeyedSubscript:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_10;
  v12 = (void *)defaultTablesArrayForLocale__DefaultTables;
  objc_msgSend(v4, "languageCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_10;
  objc_msgSend(a1, "systemTranslatorBundle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "brl_supportedTablesForLocale:", v4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "firstObject");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.scrod.braille.table.duxbury"), v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v48[0] = v33;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
LABEL_10:
      v34 = v4;
      v14 = (void *)objc_opt_new();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      obj = v5;
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v15)
      {
        v16 = v15;
        v37 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v43 != v37)
              objc_enumerationMutation(obj);
            v18 = -[BRLTTable initWithIdentifier:]([BRLTTable alloc], "initWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
            -[BRLTTable replacements](v18, "replacements");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "count");

            if (v20)
            {
              v40 = 0u;
              v41 = 0u;
              v38 = 0u;
              v39 = 0u;
              -[BRLTTable replacements](v18, "replacements");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
              if (v22)
              {
                v23 = v22;
                v24 = *(_QWORD *)v39;
                do
                {
                  for (j = 0; j != v23; ++j)
                  {
                    if (*(_QWORD *)v39 != v24)
                      objc_enumerationMutation(v21);
                    v26 = -[BRLTTable initWithIdentifier:]([BRLTTable alloc], "initWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
                    objc_msgSend(v14, "addObject:", v26);

                  }
                  v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
                }
                while (v23);
              }

            }
            else
            {
              objc_msgSend(v14, "addObject:", v18);
            }

          }
          v16 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        }
        while (v16);
      }
      v27 = obj;

      v4 = v34;
      goto LABEL_28;
    }
  }
  else
  {

  }
  objc_msgSend((id)defaultTablesArrayForLocale__DefaultTables, "objectForKeyedSubscript:", CFSTR("en"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_10;
  BRLTLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    +[BRLTTableEnumerator defaultTablesArrayForLocale:].cold.1(v4);
  v14 = (void *)MEMORY[0x24BDBD1A8];
LABEL_28:

  return v14;
}

void __51__BRLTTableEnumerator_defaultTablesArrayForLocale___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("DefaultTables"), CFSTR("plist"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)defaultTablesArrayForLocale__DefaultTables;
  defaultTablesArrayForLocale__DefaultTables = v1;

}

+ (NSBundle)systemTranslatorBundle
{
  return (NSBundle *)objc_msgSend(MEMORY[0x24BDD1488], "brl_brailleTableBundleWithIdentifier:", CFSTR("com.apple.scrod.braille.table.duxbury"));
}

+ (id)tableEnumeratorWithSystemBundlePath
{
  uint64_t (*v2)(void);
  __CFString *v3;
  __CFString *v4;
  void *v5;

  v2 = MEMORY[0x24BDFDF78];
  if (MEMORY[0x24BDFDF78])
  {
    AXBrailleTablesDirectory();
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("/System/Library/ScreenReader/BrailleTables");
  }
  v4 = v3;
  if (v2)

  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTranslatorBundlesPath:", v4);
  return v5;
}

- (BRLTTableEnumerator)initWithTranslatorBundlesPath:(id)a3
{
  id v4;
  BRLTTableEnumerator *v5;
  uint64_t v6;
  NSString *translatorBundlePath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRLTTableEnumerator;
  v5 = -[BRLTTableEnumerator init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    translatorBundlePath = v5->_translatorBundlePath;
    v5->_translatorBundlePath = (NSString *)v6;

  }
  return v5;
}

- (NSArray)translatorBundles
{
  NSArray *translatorBundles;
  NSArray *v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSArray *v23;
  NSArray *v24;
  NSArray *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  translatorBundles = self->_translatorBundles;
  if (translatorBundles)
  {
LABEL_2:
    v3 = translatorBundles;
    return v3;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRLTTableEnumerator translatorBundlePath](self, "translatorBundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v6, &v30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v30;

  if (!v8)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v16, "pathExtension");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("brailletable"));

          if (v18)
          {
            -[BRLTTableEnumerator translatorBundlePath](self, "translatorBundlePath");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringByAppendingPathComponent:", v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              -[NSArray addObject:](v25, "addObject:", v21);
            }
            else
            {
              BRLTLog();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v32 = v20;
                _os_log_error_impl(&dword_2114B8000, v22, OS_LOG_TYPE_ERROR, "Error loading brailletable bundle at %@", buf, 0xCu);
              }

            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      }
      while (v13);
    }

    v23 = self->_translatorBundles;
    self->_translatorBundles = v25;
    v24 = v25;

    translatorBundles = self->_translatorBundles;
    goto LABEL_2;
  }
  BRLTLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[BRLTTableEnumerator translatorBundles].cold.1(self);

  v3 = 0;
  return v3;
}

- (NSSet)supportedLocales
{
  NSSet *supportedLocales;
  NSSet *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSSet *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  supportedLocales = self->_supportedLocales;
  if (!supportedLocales)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[BRLTTableEnumerator translatorBundles](self, "translatorBundles", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "brl_supportedLocales");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSSet unionSet:](v4, "unionSet:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v11 = self->_supportedLocales;
    self->_supportedLocales = v4;

    supportedLocales = self->_supportedLocales;
  }
  return supportedLocales;
}

- (NSSet)supportedLanguageLocales
{
  NSSet *supportedLanguageLocales;
  NSSet *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSSet *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  supportedLanguageLocales = self->_supportedLanguageLocales;
  if (!supportedLanguageLocales)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[BRLTTableEnumerator supportedLocales](self, "supportedLocales", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)MEMORY[0x24BDBCEA0];
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "languageCode");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "localeWithLocaleIdentifier:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSSet addObject:](v4, "addObject:", v12);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    v13 = self->_supportedLanguageLocales;
    self->_supportedLanguageLocales = v4;

    supportedLanguageLocales = self->_supportedLanguageLocales;
  }
  return supportedLanguageLocales;
}

- (NSSet)languageAgnosticTableIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[BRLTTableEnumerator languageAgnosticIdentifiersToTables](self, "languageAgnosticIdentifiersToTables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (id)languageAgnosticTablesInBundle:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BRLTTable *v11;
  void *v12;
  void *v13;
  BRLTTable *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "brl_languageAgnosticTables");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v8), "componentsSeparatedByString:", CFSTR("-"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count") == 2)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }
        v11 = [BRLTTable alloc];
        objc_msgSend(v3, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[BRLTTable initWithServiceIdentifier:language:variant:](v11, "initWithServiceIdentifier:language:variant:", v12, v13, v10);

        objc_msgSend(v4, "addObject:", v14);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)languageAgnosticTablesForIdentifier:(id)a3 inBundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRLTTableEnumerator languageAgnosticTablesInBundle:](self, "languageAgnosticTablesInBundle:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "language");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v6);

        if (v16)
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)tablesForLocale:(id)a3 inBundle:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BRLTTable *v13;
  void *v14;
  void *v15;
  BRLTTable *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v20 = v5;
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v6, "brl_supportedTablesForLocale:", v5);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v10), "componentsSeparatedByString:", CFSTR("-"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count") == 2)
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = 0;
        }
        v13 = [BRLTTable alloc];
        objc_msgSend(v6, "bundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[BRLTTable initWithServiceIdentifier:language:variant:](v13, "initWithServiceIdentifier:language:variant:", v14, v15, v12);

        -[BRLTTable replacements](v16, "replacements");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (!v18)
          objc_msgSend(v21, "addObject:", v16);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  return v21;
}

- (NSMutableDictionary)languageAgnosticIdentifiersToTables
{
  BRLTTableEnumerator *v2;
  NSMutableDictionary *languageAgnosticIdentifiersToTables;
  NSMutableDictionary *v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  id obj;
  uint64_t v18;
  BRLTTableEnumerator *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v2 = self;
  v31 = *MEMORY[0x24BDAC8D0];
  languageAgnosticIdentifiersToTables = self->_languageAgnosticIdentifiersToTables;
  if (!languageAgnosticIdentifiersToTables)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[BRLTTableEnumerator translatorBundles](v2, "translatorBundles");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v20)
    {
      v18 = *(_QWORD *)v26;
      v19 = v2;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(obj);
          -[BRLTTableEnumerator languageAgnosticTablesInBundle:](v2, "languageAgnosticTablesInBundle:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v7)
          {
            v8 = v7;
            v9 = *(_QWORD *)v22;
            do
            {
              for (j = 0; j != v8; ++j)
              {
                if (*(_QWORD *)v22 != v9)
                  objc_enumerationMutation(v6);
                v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
                objc_msgSend(v11, "language");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v12);
                v13 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v13)
                {
                  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "language");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v13, v14);

                }
                objc_msgSend(v13, "addObject:", v11);

              }
              v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            }
            while (v8);
          }

          v2 = v19;
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v20);
    }

    v15 = v2->_languageAgnosticIdentifiersToTables;
    v2->_languageAgnosticIdentifiersToTables = v4;

    languageAgnosticIdentifiersToTables = v2->_languageAgnosticIdentifiersToTables;
  }
  return languageAgnosticIdentifiersToTables;
}

- (void)setLanguageAgnosticIdentifiersToTables:(id)a3
{
  objc_storeStrong((id *)&self->_languageAgnosticIdentifiersToTables, a3);
}

- (NSString)translatorBundlePath
{
  return self->_translatorBundlePath;
}

- (void)setTranslatorBundlePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translatorBundlePath, 0);
  objc_storeStrong((id *)&self->_languageAgnosticIdentifiersToTables, 0);
  objc_storeStrong((id *)&self->_supportedLanguageLocales, 0);
  objc_storeStrong((id *)&self->_supportedLocales, 0);
  objc_storeStrong((id *)&self->_translatorBundles, 0);
}

+ (void)defaultTablesArrayForLocale:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2114B8000, v2, v3, "Couldn't find any table for locale %@ (identifiers: %@)", v4, v5, v6, v7, v8);

}

- (void)translatorBundles
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "translatorBundlePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2114B8000, v2, v3, "Couldn't get contents of %@: %@", v4, v5, v6, v7, v8);

}

@end
