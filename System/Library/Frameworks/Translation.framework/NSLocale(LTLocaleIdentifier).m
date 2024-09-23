@implementation NSLocale(LTLocaleIdentifier)

+ (id)lt_localeWithLTIdentifier:()LTLocaleIdentifier
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "lt_localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localeWithLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_ltLocaleIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "localeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_ltCsLocaleIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "localeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_vsLocaleIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "localeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)_ltEqual:()LTLocaleIdentifier
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "_ltLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_ltLocaleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqualToString:", v6);
  return v7;
}

- (id)lt_nlLanguageCode
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDBCEA0];
  objc_msgSend(a1, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "baseLanguageFromLanguage:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)lt_preferredLocales
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_ltCompactMap:", &__block_literal_global_15);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)lt_bestMatchForPreferredLocales:()LTLocaleIdentifier fromSupportedLocales:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "lt_preferredLocales");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }
  objc_msgSend(v6, "_ltCompactMap:", &__block_literal_global_5_1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ltCompactMap:", &__block_literal_global_6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "matchedLanguagesFromAvailableLanguages:forPreferredLanguages:", v8, v9);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v22 = (void *)v15;
          v16 = v10;
          goto LABEL_22;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v12)
        continue;
      break;
    }
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = v5;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v17)
  {
    v18 = v17;
    v24 = v8;
    v19 = *(_QWORD *)v26;
LABEL_13:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v19)
        objc_enumerationMutation(v16);
      objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v20), "_ltLocaleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _LTLanguageCodeToSupportedLocale(v21, v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
        break;
      if (v18 == ++v20)
      {
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v18)
          goto LABEL_13;
        v22 = 0;
        break;
      }
    }
    v8 = v24;
  }
  else
  {
    v22 = 0;
  }
LABEL_22:

  return v22;
}

+ (id)lt_fallbackForLocale:()LTLocaleIdentifier
{
  void *v3;
  id v4;
  void *v5;
  _LTLocalePair *v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDBCEA0];
  v4 = a3;
  objc_msgSend(v3, "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_LTLocalePair initWithSourceLocale:targetLocale:]([_LTLocalePair alloc], "initWithSourceLocale:targetLocale:", v4, v5);
  objc_msgSend(v4, "_ltLocaleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_ltLocaleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) != 0)
  {

  }
  else
  {
    v9 = -[_LTLocalePair isVariantPair](v6, "isVariantPair");

    if (!v9)
    {
      v10 = v5;
      goto LABEL_6;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("es_ES"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v11 = v10;

  return v11;
}

+ (id)lt_defaultTargetForSource:()LTLocaleIdentifier systemLocale:availableLocales:targetMap:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  _LTLocalePair *v44;
  id v45;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  _BYTE v63[128];
  void *v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!v13)
  {
    v49 = a1;
    v52 = v12;
    v54 = v11;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLForResource:withExtension:", CFSTR("DefaultTargets"), CFSTR("plist"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v17, 0, 0, &v62);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v62;
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = v18;
    if (!v22
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (v14 = v22, (objc_msgSend(v22, "lt_ensureTypesForKeys:values:", v20, v21) & 1) == 0))
    {

      v14 = 0;
    }

    if (!v14 || v19)
    {
      v23 = _LTOSLogAssets();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        +[NSLocale(LTLocaleIdentifier) lt_defaultTargetForSource:systemLocale:availableLocales:targetMap:].cold.1((uint64_t)v19, v23);
    }

    v12 = v52;
    v11 = v54;
    a1 = v49;
    v13 = 0;
  }
  objc_msgSend(v11, "regionCode");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("source"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
  }
  else
  {
    v26 = 0;
  }
  v27 = v26;

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("target"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;
  }
  else
  {
    v29 = 0;
  }
  v30 = v29;

  v57 = v27;
  if (v14 && v24 && v27 && v30)
  {
    v51 = v13;
    v55 = v11;
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "lt_bestMatchForPreferredLocales:fromSupportedLocales:", v32, v12);
    v33 = objc_claimAutoreleasedReturnValue();

    v48 = v30;
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v34;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v64, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "lt_bestMatchForPreferredLocales:fromSupportedLocales:", v35, v12);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33 && (objc_msgSend(v10, "_ltEqual:", v33) & 1) == 0)
      objc_msgSend(v37, "addObject:", v33);
    v47 = (void *)v33;
    v50 = a1;
    v53 = v12;
    if (v36)
      objc_msgSend(v37, "addObject:", v36);
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v38 = v37;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v59;
      while (2)
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v59 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          v44 = -[_LTLocalePair initWithSourceLocale:targetLocale:]([_LTLocalePair alloc], "initWithSourceLocale:targetLocale:", v10, v43);
          if (!-[_LTLocalePair isVariantPair](v44, "isVariantPair"))
          {
            v45 = v43;

            goto LABEL_41;
          }

        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
        if (v40)
          continue;
        break;
      }
    }

    objc_msgSend(v50, "lt_fallbackForLocale:", v10);
    v45 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:

    v12 = v53;
    v11 = v55;
    v13 = v51;
    v30 = v48;
  }
  else
  {
    objc_msgSend(a1, "lt_fallbackForLocale:", v10);
    v45 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v45;
}

+ (void)lt_defaultTargetForSource:()LTLocaleIdentifier systemLocale:availableLocales:targetMap:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_235438000, a2, OS_LOG_TYPE_ERROR, "Failed to read default target locale mapping: %@", (uint8_t *)&v2, 0xCu);
}

@end
