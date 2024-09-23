@implementation NSLocale(Setup)

- (BOOL)_requiresMultilingualSetupWithKeyboardIDs:()Setup
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a1, "_languagesForMultilingualSetupWithKeyboardsIDs:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") < 2)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "countryCode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
    {
      v4 = (void *)MEMORY[0x1E0C99DC8];
      objc_msgSend(CFSTR("zxx_"), "stringByAppendingString:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localeWithLocaleIdentifier:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_languagesForMultilingualSetupWithKeyboardsIDs:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    v9 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(a1, "languageIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "baseLanguageFromLanguage:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "containsObject:", v11))
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "baseSystemLanguages");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "arrayByExcludingObjectsInArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v13, "count") != 0;
    }
    else
    {
      v8 = 1;
    }

  }
  return v8;
}

- (uint64_t)requiresMultilingualSetup
{
  return objc_msgSend(a1, "_requiresMultilingualSetupWithKeyboardIDs:", 0);
}

- (id)_languagesForMultilingualSetupWithKeyboardsIDs:()Setup
{
  void *v2;
  void *v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "languageIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(a1, "languageIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "canonicalLanguageIdentifierFromString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "baseLanguageFromLanguage:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v7);

  }
  v8 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(a1, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsFromLocaleIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("sd"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    v12 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(a1, "countryCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_class();
    objc_msgSend(a1, "countryCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_subdivisionCodeFromSubdivisionTag:restrictedToRegionCode:", v11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "languagesForRegion:subdivision:withThreshold:filter:", v13, v16, 1, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      goto LABEL_6;
  }
  v18 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(a1, "countryCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "languagesForRegion:subdivision:withThreshold:filter:", v19, 0, 1, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
LABEL_6:
    objc_msgSend(v2, "addObjectsFromArray:", v17);

  objc_msgSend(v2, "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (uint64_t)languagesForMultilingualSetup
{
  return objc_msgSend(a1, "_languagesForMultilingualSetupWithKeyboardsIDs:", 0);
}

- (id)defaultLanguagesForMultilingualSetup
{
  void *v2;
  void *v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "languageIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(a1, "languageIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "canonicalLanguageIdentifierFromString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "baseLanguageFromLanguage:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v7);

  }
  v8 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(a1, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsFromLocaleIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("sd"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    v12 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(a1, "countryCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_class();
    objc_msgSend(a1, "countryCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_subdivisionCodeFromSubdivisionTag:restrictedToRegionCode:", v11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "languagesForRegion:subdivision:withThreshold:filter:", v13, v16, 2, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      goto LABEL_6;
  }
  v18 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(a1, "countryCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "languagesForRegion:subdivision:withThreshold:filter:", v19, 0, 2, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
LABEL_6:
    objc_msgSend(v2, "addObjectsFromArray:", v17);

  objc_msgSend(v2, "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)_subdivisionCodeFromSubdivisionTag:()Setup restrictedToRegionCode:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(a4, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringToIndex:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uppercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "substringFromIndex:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "uppercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", v8))
    v11 = v10;
  else
    v11 = 0;

  return v11;
}

@end
