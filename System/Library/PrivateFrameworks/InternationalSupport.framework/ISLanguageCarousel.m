@implementation ISLanguageCarousel

- (ISLanguageCarousel)initWithItems:(id)a3
{
  id v4;
  ISLanguageCarousel *v5;
  ISLanguageCarousel *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ISLanguageCarousel;
  v5 = -[ISLanguageCarousel init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[ISLanguageCarousel setItems:](v5, "setItems:", v4);
    -[ISLanguageCarousel setCycle:](v6, "setCycle:", 1);
    -[ISLanguageCarousel setWeightedRepetition:](v6, "setWeightedRepetition:", 1);
  }

  return v6;
}

- (id)nextItem
{
  unint64_t v3;
  void *v4;
  _BOOL4 v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v3 = -[ISLanguageCarousel queueIndex](self, "queueIndex");
  -[ISLanguageCarousel queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= objc_msgSend(v4, "count"))
  {
    v5 = -[ISLanguageCarousel cycle](self, "cycle");

    if (v5)
      -[ISLanguageCarousel setQueueIndex:](self, "setQueueIndex:", 0);
  }
  else
  {

  }
  v6 = -[ISLanguageCarousel queueIndex](self, "queueIndex");
  -[ISLanguageCarousel queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 >= v8)
  {
    v10 = 0;
  }
  else
  {
    -[ISLanguageCarousel queue](self, "queue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", -[ISLanguageCarousel queueIndex](self, "queueIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[ISLanguageCarousel setQueueIndex:](self, "setQueueIndex:", -[ISLanguageCarousel queueIndex](self, "queueIndex") + 1);
  }
  return v10;
}

+ (id)rankedItemsFromItems:(id)a3 usingSystemLanguages:(id)a4 preferredLanguages:(id)a5 region:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  _QWORD v43[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    v16 = v10;
    v17 = objc_msgSend(v9, "count");
    objc_msgSend(v9, "valueForKey:", CFSTR("languageIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "componentsJoinedByString:", CFSTR(","));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v50 = "+[ISLanguageCarousel rankedItemsFromItems:usingSystemLanguages:preferredLanguages:region:]";
    v51 = 2114;
    v52 = v13;
    v53 = 2114;
    v54 = v14;
    v55 = 2114;
    v56 = v12;
    v57 = 2048;
    v58 = v17;
    v10 = v16;
    v11 = v15;
    v59 = 2114;
    v60 = v19;
    _os_log_impl(&dword_1DA9C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: systemLanguages = [%{public}@], preferredLanguages = [%{public}@], region = %{public}@, items (%lu) = [%{public}@]", buf, 0x3Eu);

  }
  objc_msgSend(v9, "valueForKey:", CFSTR("languageIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  if (!objc_msgSend(v21, "count"))
    +[ISLanguageCarousel rankedItemsFromItems:usingSystemLanguages:preferredLanguages:region:].cold.1();
  v39 = v10;
  if (objc_msgSend(v21, "count"))
  {
    v22 = v10;
    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "languagesForRegion:subdivision:withThreshold:filter:", v12, 0, 1, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "arrayByAddingObjectsFromArray:", v22);
      v24 = objc_claimAutoreleasedReturnValue();

      v22 = (id)v24;
    }
    v38 = v11;
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v22);
      v25 = objc_claimAutoreleasedReturnValue();

      v22 = (id)v25;
    }
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v21, "count"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {
      v26 = MEMORY[0x1E0C809B0];
      v40 = v22;
      v41 = v21;
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "preferredLocalizationsFromArray:forPreferences:", v21, v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v27, "count"))
          +[ISLanguageCarousel rankedItemsFromItems:usingSystemLanguages:preferredLanguages:region:].cold.2();
        if (!objc_msgSend(v27, "count"))
          break;
        objc_msgSend(v21, "removeObjectsInArray:", v27);
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v28 = v27;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v45 != v31)
                objc_enumerationMutation(v28);
              v33 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
              v43[0] = v26;
              v43[1] = 3221225472;
              v43[2] = __90__ISLanguageCarousel_rankedItemsFromItems_usingSystemLanguages_preferredLanguages_region___block_invoke;
              v43[3] = &unk_1EA14D908;
              v43[4] = v33;
              v34 = objc_msgSend(v9, "indexOfObjectPassingTest:", v43);
              if (v34 != 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v9, "objectAtIndexedSubscript:", v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "addObject:", v35);

              }
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
          }
          while (v30);
        }

        v21 = v41;
        v22 = v40;
        if (!objc_msgSend(v41, "count"))
          goto LABEL_26;
      }

    }
LABEL_26:
    objc_msgSend(v42, "array");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v38;
  }
  else
  {
    v36 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v36;
}

uint64_t __90__ISLanguageCarousel_rankedItemsFromItems_usingSystemLanguages_preferredLanguages_region___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "languageIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)guessedRegion
{
  void *v2;
  void *v3;
  void *v4;

  +[ISRegionDetector sharedRegionDetector](ISRegionDetector, "sharedRegionDetector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "guessedCountries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_rankedItems:(id)a3 usePreferredLanguages:(BOOL)a4 guessedRegion:(BOOL)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLanguages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a5)
      goto LABEL_3;
  }
  else
  {
    v10 = 0;
    if (!a5)
    {
LABEL_3:
      objc_msgSend(v8, "rankedItemsFromItems:usingSystemLanguages:preferredLanguages:region:", v7, v9, v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  objc_msgSend((id)objc_opt_class(), "guessedRegion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rankedItemsFromItems:usingSystemLanguages:preferredLanguages:region:", v7, v9, v10, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
LABEL_7:

LABEL_8:
  return v11;
}

- (id)_itemsWithMergedDuplicates:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v27 = (id)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v4;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v39;
    v28 = v5;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v39 != v29)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1E0C99DC8];
        objc_msgSend(v7, "languageIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "baseLanguageFromLanguage:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v31 = v10;
          v32 = i;
          objc_msgSend(v5, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v33 = v12;
          v13 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v35;
            while (2)
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v35 != v15)
                  objc_enumerationMutation(v33);
                v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
                objc_msgSend(v17, "data");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v18)
                {
                  objc_msgSend(v7, "data");
                  v3 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v3)
                  {
LABEL_21:
                    v10 = v31;
                    v22 = v33;
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v17, "languageIdentifier");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v7, "languageIdentifier");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 136315906;
                      v43 = "-[ISLanguageCarousel _itemsWithMergedDuplicates:]";
                      v44 = 2114;
                      v45 = v23;
                      v46 = 2114;
                      v47 = v24;
                      v48 = 2114;
                      v49 = v31;
                      _os_log_impl(&dword_1DA9C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: merging items (%{public}@, %{public}@) with baseLanguage %{public}@", buf, 0x2Au);

                    }
                    v5 = v28;
                    i = v32;
                    goto LABEL_25;
                  }
                }
                objc_msgSend(v17, "data");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "data");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v19, "isEqual:", v20);

                if (v18)
                {

                  if (v21)
                    goto LABEL_21;
                }
                else
                {

                  if ((v21 & 1) != 0)
                    goto LABEL_21;
                }
              }
              v14 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
              if (v14)
                continue;
              break;
            }
          }
          v22 = v33;

          objc_msgSend(v27, "addObject:", v7);
          objc_msgSend(v33, "addObject:", v7);
          v5 = v28;
          v10 = v31;
          i = v32;
        }
        else
        {
          objc_msgSend(v27, "addObject:", v7);
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v7, 0);
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, v10);
        }
LABEL_25:

      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
    }
    while (v30);
  }

  return v27;
}

- (void)reloadQueue
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[ISLanguageCarousel items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v27 = 136315394;
    v28 = "-[ISLanguageCarousel reloadQueue]";
    v29 = 1024;
    LODWORD(v30) = -[ISLanguageCarousel cycle](self, "cycle");
    _os_log_impl(&dword_1DA9C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: cycle = %d", (uint8_t *)&v27, 0x12u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[ISLanguageCarousel mergeDuplicates](self, "mergeDuplicates");
    v27 = 136315394;
    v28 = "-[ISLanguageCarousel reloadQueue]";
    v29 = 1024;
    LODWORD(v30) = v4;
    _os_log_impl(&dword_1DA9C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: mergedDuplicates = %d", (uint8_t *)&v27, 0x12u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[ISLanguageCarousel randomize](self, "randomize");
    v27 = 136315394;
    v28 = "-[ISLanguageCarousel reloadQueue]";
    v29 = 1024;
    LODWORD(v30) = v5;
    _os_log_impl(&dword_1DA9C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: randomize = %d", (uint8_t *)&v27, 0x12u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[ISLanguageCarousel rankingUsesGuessedRegion](self, "rankingUsesGuessedRegion");
    v27 = 136315394;
    v28 = "-[ISLanguageCarousel reloadQueue]";
    v29 = 1024;
    LODWORD(v30) = v6;
    _os_log_impl(&dword_1DA9C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: rankingUsesGuessedRegion = %d", (uint8_t *)&v27, 0x12u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[ISLanguageCarousel rankingUsesPreferredLanguages](self, "rankingUsesPreferredLanguages");
    v27 = 136315394;
    v28 = "-[ISLanguageCarousel reloadQueue]";
    v29 = 1024;
    LODWORD(v30) = v7;
    _os_log_impl(&dword_1DA9C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: rankingUsesPreferredLanguages = %d", (uint8_t *)&v27, 0x12u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[ISLanguageCarousel weightedRepetition](self, "weightedRepetition");
    v27 = 136315394;
    v28 = "-[ISLanguageCarousel reloadQueue]";
    v29 = 1024;
    LODWORD(v30) = v8;
    _os_log_impl(&dword_1DA9C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: weightedRepetition = %d", (uint8_t *)&v27, 0x12u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v3, "count");
    objc_msgSend(v3, "valueForKey:", CFSTR("languageIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 136315650;
    v28 = "-[ISLanguageCarousel reloadQueue]";
    v29 = 2048;
    v30 = v9;
    v31 = 2114;
    v32 = v11;
    _os_log_impl(&dword_1DA9C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: items (%lu) = [%{public}@]", (uint8_t *)&v27, 0x20u);

  }
  if (objc_msgSend(v3, "count"))
  {
    if (-[ISLanguageCarousel mergeDuplicates](self, "mergeDuplicates"))
    {
      -[ISLanguageCarousel _itemsWithMergedDuplicates:](self, "_itemsWithMergedDuplicates:", v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_msgSend(v12, "count");
        objc_msgSend(v12, "valueForKey:", CFSTR("languageIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR(","));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 136315650;
        v28 = "-[ISLanguageCarousel reloadQueue]";
        v29 = 2048;
        v30 = v13;
        v31 = 2114;
        v32 = v15;
        _os_log_impl(&dword_1DA9C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: itemsWithMergedDuplicates (%lu) = [%{public}@]", (uint8_t *)&v27, 0x20u);

      }
      v3 = v12;
    }
    -[ISLanguageCarousel setQueueIndex:](self, "setQueueIndex:", 0);
    if (-[ISLanguageCarousel randomize](self, "randomize"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v3, "mutableCopy");
      v18 = v17;
      while (objc_msgSend(v17, "count"))
      {
        v19 = arc4random_uniform(objc_msgSend(v18, "count"));
        objc_msgSend(v18, "objectAtIndexedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v20);

        objc_msgSend(v18, "removeObjectAtIndex:", v19);
        v17 = v18;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_msgSend(v16, "count");
        objc_msgSend(v16, "valueForKey:", CFSTR("languageIdentifier"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR(","));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 136315650;
        v28 = "-[ISLanguageCarousel reloadQueue]";
        v29 = 2048;
        v30 = v24;
        v31 = 2114;
        v32 = v26;
        _os_log_impl(&dword_1DA9C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: randomizedItems (%lu) = [%{public}@]", (uint8_t *)&v27, 0x20u);

      }
      -[ISLanguageCarousel setQueue:](self, "setQueue:", v16);

    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_rankedItems:usePreferredLanguages:guessedRegion:", v3, -[ISLanguageCarousel rankingUsesPreferredLanguages](self, "rankingUsesPreferredLanguages"), -[ISLanguageCarousel rankingUsesGuessedRegion](self, "rankingUsesGuessedRegion"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_msgSend(v16, "count");
        objc_msgSend(v16, "valueForKey:", CFSTR("languageIdentifier"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR(","));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 136315650;
        v28 = "-[ISLanguageCarousel reloadQueue]";
        v29 = 2048;
        v30 = v21;
        v31 = 2114;
        v32 = v23;
        _os_log_impl(&dword_1DA9C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: rankedItems (%lu) = [%{public}@]", (uint8_t *)&v27, 0x20u);

      }
      -[ISLanguageCarousel setQueue:](self, "setQueue:", v16);
    }

  }
  else
  {
    -[ISLanguageCarousel setQueue:](self, "setQueue:", v3);
  }

}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
  -[ISLanguageCarousel reloadQueue](self, "reloadQueue");
}

- (void)setMergeDuplicates:(BOOL)a3
{
  self->_mergeDuplicates = a3;
  -[ISLanguageCarousel reloadQueue](self, "reloadQueue");
}

- (void)setRandomize:(BOOL)a3
{
  self->_randomize = a3;
  -[ISLanguageCarousel reloadQueue](self, "reloadQueue");
}

- (void)setRankingUsesGuessedRegion:(BOOL)a3
{
  self->_rankingUsesGuessedRegion = a3;
  -[ISLanguageCarousel reloadQueue](self, "reloadQueue");
}

- (void)setRankingUsesPreferredLanguages:(BOOL)a3
{
  self->_rankingUsesPreferredLanguages = a3;
  -[ISLanguageCarousel reloadQueue](self, "reloadQueue");
}

- (void)setWeightedRepetition:(BOOL)a3
{
  self->_weightedRepetition = a3;
  -[ISLanguageCarousel reloadQueue](self, "reloadQueue");
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)cycle
{
  return self->_cycle;
}

- (void)setCycle:(BOOL)a3
{
  self->_cycle = a3;
}

- (BOOL)mergeDuplicates
{
  return self->_mergeDuplicates;
}

- (BOOL)randomize
{
  return self->_randomize;
}

- (BOOL)rankingUsesGuessedRegion
{
  return self->_rankingUsesGuessedRegion;
}

- (BOOL)rankingUsesPreferredLanguages
{
  return self->_rankingUsesPreferredLanguages;
}

- (BOOL)weightedRepetition
{
  return self->_weightedRepetition;
}

- (NSArray)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)queueIndex
{
  return self->_queueIndex;
}

- (void)setQueueIndex:(unint64_t)a3
{
  self->_queueIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

+ (void)rankedItemsFromItems:usingSystemLanguages:preferredLanguages:region:.cold.1()
{
  __assert_rtn("+[ISLanguageCarousel rankedItemsFromItems:usingSystemLanguages:preferredLanguages:region:]", "ISLanguageCarousel.m", 61, "languages.count > 0");
}

+ (void)rankedItemsFromItems:usingSystemLanguages:preferredLanguages:region:.cold.2()
{
  __assert_rtn("+[ISLanguageCarousel rankedItemsFromItems:usingSystemLanguages:preferredLanguages:region:]", "ISLanguageCarousel.m", 82, "preferred.count > 0");
}

@end
