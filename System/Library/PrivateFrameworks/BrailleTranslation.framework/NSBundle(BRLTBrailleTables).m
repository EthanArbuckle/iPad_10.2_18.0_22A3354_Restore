@implementation NSBundle(BRLTBrailleTables)

+ (id)brl_brailleTableBundleWithIdentifier:()BRLTBrailleTables
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[BRLTTableEnumerator tableEnumeratorWithSystemBundlePath](BRLTTableEnumerator, "tableEnumeratorWithSystemBundlePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "translatorBundles", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v3);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)brl_brailleTablesDictionary
{
  void *v1;
  id v2;
  NSObject *v3;

  objc_msgSend(a1, "objectForInfoDictionaryKey:", CFSTR("BrailleTables"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BRLTLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[NSBundle(BRLTBrailleTables) brl_brailleTablesDictionary].cold.1((uint64_t)v1, v3);

    v2 = 0;
  }
  else
  {
    v2 = v1;
  }

  return v2;
}

- (id)brl_supportedLocales
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v1 = a1;
  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "brl_brailleTablesDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      v17 = v5;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v7);
        if ((objc_msgSend(v1, "brl_tableIsLanguageAgnosticWithIdentifier:", v8, v17) & 1) == 0)
        {
          v9 = v1;
          objc_msgSend(v1, "brl_supportedLocalesForTableWithIdentifier:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v20;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v20 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (v15)
                  objc_msgSend(v3, "addObject:", v15);

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v12);
          }

          v5 = v17;
          v1 = v9;
        }
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)brl_supportedTablesForLocale:()BRLTBrailleTables
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id obj;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v30 = a1;
  objc_msgSend(a1, "brl_brailleTablesDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v5;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v31)
  {
    v29 = *(_QWORD *)v41;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(obj);
        v32 = v7;
        v8 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v7);
        objc_msgSend(v30, "brl_supportedLocalesForTableWithIdentifier:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v33 = v9;
        v35 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v35)
        {
          v34 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v35; ++i)
            {
              if (*(_QWORD *)v37 != v34)
                objc_enumerationMutation(v33);
              v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
              v12 = (void *)MEMORY[0x24BDBCEA0];
              objc_msgSend(v4, "languageCode");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "localeWithLocaleIdentifier:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v4, "localeIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              __60__NSBundle_BRLTBrailleTables__brl_supportedTablesForLocale___block_invoke((uint64_t)v15, v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              __60__NSBundle_BRLTBrailleTables__brl_supportedTablesForLocale___block_invoke((uint64_t)v16, v11);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v16, "isEqualToString:", v17);

              if (v18)
              {
                if (objc_msgSend(v6, "containsObject:", v8))
                  objc_msgSend(v6, "removeObject:", v8);
                objc_msgSend(v6, "insertObject:atIndex:", v8, 0);
              }
              else
              {
                objc_msgSend(v4, "languageCode");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                __60__NSBundle_BRLTBrailleTables__brl_supportedTablesForLocale___block_invoke((uint64_t)v19, v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                __60__NSBundle_BRLTBrailleTables__brl_supportedTablesForLocale___block_invoke((uint64_t)v20, v11);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v20, "isEqualToString:", v21);

                if (v22)
                  goto LABEL_17;
                objc_msgSend(v14, "languageCode");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                __60__NSBundle_BRLTBrailleTables__brl_supportedTablesForLocale___block_invoke((uint64_t)v23, v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                __60__NSBundle_BRLTBrailleTables__brl_supportedTablesForLocale___block_invoke((uint64_t)v24, v11);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v24, "isEqualToString:", v25);

                if (v26)
                {
LABEL_17:
                  if ((objc_msgSend(v6, "containsObject:", v8) & 1) == 0)
                    objc_msgSend(v6, "addObject:", v8);
                }
              }

            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          }
          while (v35);
        }

        v7 = v32 + 1;
      }
      while (v32 + 1 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v31);
  }

  return v6;
}

- (id)brl_languageAgnosticTables
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "brl_brailleTablesDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(a1, "brl_tableIsLanguageAgnosticWithIdentifier:", v9, (_QWORD)v11))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)brl_supportedLocalesForTableWithIdentifier:()BRLTBrailleTables
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "brl_brailleTablesDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("languages"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)brl_tableIsLanguageAgnosticWithIdentifier:()BRLTBrailleTables
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "brl_brailleTablesDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("languageAgnostic"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = objc_msgSend(v7, "BOOLValue");
  else
    v8 = 0;

  return v8;
}

- (void)brl_brailleTablesDictionary
{
  id v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 138412546;
  v5 = CFSTR("BrailleTables");
  v6 = 2112;
  v7 = (id)objc_opt_class();
  v3 = v7;
  _os_log_error_impl(&dword_2114B8000, a2, OS_LOG_TYPE_ERROR, "Expected NSDictionary for %@ key, but found %@ instead.", (uint8_t *)&v4, 0x16u);

}

@end
