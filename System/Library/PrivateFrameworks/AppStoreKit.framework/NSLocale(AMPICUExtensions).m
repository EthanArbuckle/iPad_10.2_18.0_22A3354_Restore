@implementation NSLocale(AMPICUExtensions)

+ (id)ISOScriptCodes
{
  if (+[NSLocale(AMPICUExtensions) ISOScriptCodes]::onceToken != -1)
    dispatch_once(&+[NSLocale(AMPICUExtensions) ISOScriptCodes]::onceToken, &__block_literal_global_3);
  return (id)_scriptCodes;
}

+ (id)ICUNumberingSystems
{
  if (+[NSLocale(AMPICUExtensions) ICUNumberingSystems]::onceToken != -1)
    dispatch_once(&+[NSLocale(AMPICUExtensions) ICUNumberingSystems]::onceToken, &__block_literal_global_14);
  return (id)_numberingSystems;
}

+ (id)ISOTerritoryGroupCodes
{
  if (+[NSLocale(AMPICUExtensions) ISOTerritoryGroupCodes]::onceToken != -1)
    dispatch_once(&+[NSLocale(AMPICUExtensions) ISOTerritoryGroupCodes]::onceToken, &__block_literal_global_17);
  return (id)_territoryGroupCodes;
}

+ (id)ISO3CharacterTerritoryGroupCodes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__NSLocale_AMPICUExtensions__ISO3CharacterTerritoryGroupCodes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[NSLocale(AMPICUExtensions) ISO3CharacterTerritoryGroupCodes]::onceToken != -1)
    dispatch_once(&+[NSLocale(AMPICUExtensions) ISO3CharacterTerritoryGroupCodes]::onceToken, block);
  return (id)_territoryGroupCodes3;
}

+ (id)ISO3CharacterLanguageCodes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__NSLocale_AMPICUExtensions__ISO3CharacterLanguageCodes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[NSLocale(AMPICUExtensions) ISO3CharacterLanguageCodes]::onceToken != -1)
    dispatch_once(&+[NSLocale(AMPICUExtensions) ISO3CharacterLanguageCodes]::onceToken, block);
  return (id)_languageCodes3;
}

+ (id)ISO3CharacterRegionCodes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__NSLocale_AMPICUExtensions__ISO3CharacterRegionCodes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[NSLocale(AMPICUExtensions) ISO3CharacterRegionCodes]::onceToken != -1)
    dispatch_once(&+[NSLocale(AMPICUExtensions) ISO3CharacterRegionCodes]::onceToken, block);
  return (id)_regionCodes3;
}

+ (id)threeCharacterLanguageCodeFromTwoCharacterCode:()AMPICUExtensions
{
  id v3;
  _BYTE *ISO3Language;
  void *v5;

  v3 = objc_retainAutorelease(a3);
  objc_msgSend(v3, "UTF8String");
  ISO3Language = (_BYTE *)uloc_getISO3Language();
  if (ISO3Language && *ISO3Language)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ISO3Language);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)twoCharacterLanguageCodeFromThreeCharacterCode:()AMPICUExtensions
{
  id v3;
  void *v4;
  _BYTE v6[12];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  objc_msgSend(v3, "UTF8String");
  uloc_getLanguage();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)threeCharacterRegionCodeFromTwoCharacterCode:()AMPICUExtensions
{
  id v3;
  id v4;
  _BYTE *ISO3Country;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_msgSend(CFSTR("_"), "stringByAppendingString:", v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "UTF8String");
  ISO3Country = (_BYTE *)uloc_getISO3Country();
  if (ISO3Country && *ISO3Country)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ISO3Country);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_msgSend(v3, "copy", ISO3Country);
  }
  v7 = (void *)v6;

  return v7;
}

+ (id)twoCharacterRegionCodeFromThreeCharacterCode:()AMPICUExtensions
{
  id v0;
  void *v1;
  _BYTE v3[4];

  objc_msgSend(CFSTR("_"), "stringByAppendingString:");
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v0, "UTF8String");
  uloc_getCountry();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)threeCharacterLanguageCode
{
  void *v1;
  id v2;

  objc_msgSend(a1, "languageCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "threeCharacterLanguageCodeFromTwoCharacterCode:", v1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = v1;

  return v2;
}

- (id)threeCharacterRegionCode
{
  void *v1;
  id v2;

  objc_msgSend(a1, "countryCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "threeCharacterRegionCodeFromTwoCharacterCode:", v1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = v1;

  return v2;
}

- (id)availableResourcesOfStyle:()AMPICUExtensions icuPath:availableResourcesKeyPrefix:baseResourceKey:resourceKeyPath:availableResourcesResourceKey:availableResourcesResourceValue:allowFallbackResources:
{
  __CFString *v15;
  id v16;
  __CFString *v17;
  NSString *v18;
  SEL v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  _BYTE *v24;
  const char *v25;
  size_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t i;
  _BYTE *Key;
  _BYTE *v33;
  uint64_t String;
  void *v35;
  void *v36;
  uint64_t *v37;
  void *v38;
  id obj;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  __CFString *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  int v55;
  const __CFString *v56;
  id v57;
  NSString *v58;
  id v59;
  id v60;
  _QWORD v61[4];
  uint64_t v62;
  char v63[128];
  char __dst[4];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v49 = a7;
  v47 = a8;
  v48 = a9;
  v44 = v16;
  objc_msgSend(a1, "localeIdentifier");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  v17 = &stru_1E9DB4A20;
  if (v15)
    v17 = v15;
  v45 = v17;
  objc_msgSend(v16, "stringByAppendingString:");
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  v19 = NSSelectorFromString(v18);
  objc_getAssociatedObject(a1, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("localeID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isEqual:", v50))
  {
    if (objc_msgSend(v49, "length"))
    {
      objc_msgSend(v20, "objectForKeyedSubscript:", v47);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqual:", v48);

      if (!v23)
      {
        if (!v20)
          goto LABEL_10;
        goto LABEL_9;
      }
    }
    else
    {

    }
    objc_msgSend(v20, "objectForKeyedSubscript:", v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }

  if (v20)
LABEL_9:
    objc_setAssociatedObject(a1, v19, 0, (void *)0x303);
LABEL_10:
  v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v43 = objc_retainAutorelease(v50);
  v24 = (_BYTE *)objc_msgSend(v43, "UTF8String");
  if (v24 && *v24)
  {
    v42 = ures_open();
    v55 = 0;
    if (-[__CFString length](v15, "length"))
    {
      strcpy(__dst, a6);
      *(_WORD *)&__dst[strlen(__dst)] = 37;
      v25 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v15), "UTF8String");
      v26 = strlen(__dst);
      strncat(__dst, v25, 255 - v26);
      ures_getByKey();
    }
    else
    {
      ures_getByKey();
    }
    if (v55 <= 0)
    {
      if (objc_msgSend(v49, "length"))
      {
        objc_msgSend(v49, "componentsSeparatedByString:", CFSTR("."));
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
        if (v28)
        {
          v41 = *(_QWORD *)v52;
LABEL_21:
          v29 = 0;
          while (1)
          {
            if (*(_QWORD *)v52 != v41)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v29);
            v55 = 0;
            objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
            if (a10)
              ures_getByKeyWithFallback();
            else
              ures_getByKey();
            if (v55 > 0)
              break;
            ures_close();
            if (v28 == ++v29)
            {
              v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
              if (v28)
                goto LABEL_21;
              break;
            }
          }
        }

        if (v55 > 0)
        {
          ures_close();

          goto LABEL_43;
        }

      }
      v55 = 0;
      for (i = ures_getNextResource(); i; i = ures_getNextResource())
      {
        if (!ures_getType())
        {
          Key = (_BYTE *)ures_getKey();
          v33 = Key;
          if (Key)
          {
            if (*Key)
            {
              v55 = 0;
              *(_DWORD *)__dst = 0;
              String = ures_getString();
              if (String)
              {
                if (*(_DWORD *)__dst)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v33);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", String, *(int *)__dst);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "setObject:forKeyedSubscript:", v36, v35);

                }
              }
            }
          }
        }
        ures_close();
        v55 = 0;
      }
      ures_close();
    }
LABEL_43:
    if (v42)
      ures_close();
  }
  v27 = (void *)objc_msgSend(v46, "copy");
  if (objc_msgSend(v49, "length"))
  {
    v56 = CFSTR("localeID");
    v57 = v47;
    v59 = v43;
    v60 = v48;
    v37 = v61;
    v58 = v18;
  }
  else
  {
    v61[2] = v18;
    v61[3] = v43;
    v61[1] = CFSTR("localeID");
    v37 = &v62;
  }
  *v37 = (uint64_t)v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_setAssociatedObject(a1, v19, v38, (void *)0x303);
  v20 = v38;
LABEL_49:

  return v27;
}

- (uint64_t)availableVariants
{
  uint64_t v3;

  if (icuDataLangPath(void)::onceToken != -1)
    dispatch_once(&icuDataLangPath(void)::onceToken, &__block_literal_global_94);
  LOBYTE(v3) = 1;
  return objc_msgSend(a1, "availableResourcesOfStyle:icuPath:availableResourcesKeyPrefix:baseResourceKey:resourceKeyPath:availableResourcesResourceKey:availableResourcesResourceValue:allowFallbackResources:", 0, &icuDataLangPath(void)::sICUDataLangPath, CFSTR("availableVariants"), "Variants", 0, 0, 0, v3);
}

- (id)availableCountriesOfLength:()AMPICUExtensions
{
  id v4;
  void *v5;
  uint64_t v7;

  v4 = a3;
  if (icuDataRegionPath(void)::onceToken[0] != -1)
    dispatch_once(icuDataRegionPath(void)::onceToken, &__block_literal_global_101);
  LOBYTE(v7) = 1;
  objc_msgSend(a1, "availableResourcesOfStyle:icuPath:availableResourcesKeyPrefix:baseResourceKey:resourceKeyPath:availableResourcesResourceKey:availableResourcesResourceValue:allowFallbackResources:", v4, &icuDataRegionPath(void)::sICUDataRegionPath, CFSTR("availableCountries"), "Countries", 0, 0, 0, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)availableLanguagesOfLength:()AMPICUExtensions
{
  id v4;
  void *v5;
  uint64_t v7;

  v4 = a3;
  if (icuDataLangPath(void)::onceToken != -1)
    dispatch_once(&icuDataLangPath(void)::onceToken, &__block_literal_global_94);
  LOBYTE(v7) = 1;
  objc_msgSend(a1, "availableResourcesOfStyle:icuPath:availableResourcesKeyPrefix:baseResourceKey:resourceKeyPath:availableResourcesResourceKey:availableResourcesResourceValue:allowFallbackResources:", v4, &icuDataLangPath(void)::sICUDataLangPath, CFSTR("availableLanguages"), "Languages", 0, 0, 0, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)availableScriptsOfLength:()AMPICUExtensions
{
  id v4;
  void *v5;
  uint64_t v7;

  v4 = a3;
  if (icuDataLangPath(void)::onceToken != -1)
    dispatch_once(&icuDataLangPath(void)::onceToken, &__block_literal_global_94);
  LOBYTE(v7) = 1;
  objc_msgSend(a1, "availableResourcesOfStyle:icuPath:availableResourcesKeyPrefix:baseResourceKey:resourceKeyPath:availableResourcesResourceKey:availableResourcesResourceValue:allowFallbackResources:", v4, &icuDataLangPath(void)::sICUDataLangPath, CFSTR("availableScripts"), "Scripts", 0, 0, 0, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)availableDateFormatTemplates
{
  uint64_t v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "calendarIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (__CFString *)v2;
  else
    v3 = CFSTR("gregorian");
  v9[0] = v3;
  v9[1] = CFSTR("availableFormats");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = 1;
  objc_msgSend(a1, "availableResourcesOfStyle:icuPath:availableResourcesKeyPrefix:baseResourceKey:resourceKeyPath:availableResourcesResourceKey:availableResourcesResourceValue:allowFallbackResources:", 0, 0, CFSTR("availableDateFormatTemplates"), "calendar", v5, CFSTR("calendarID"), v3, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedStringForNumberingSystem:()AMPICUExtensions
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(CFSTR("@numbers="), "stringByAppendingString:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedStringForLocaleIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (v5 = objc_msgSend(v3, "rangeOfString:", CFSTR("=")), v6))
  {
    objc_msgSend(v4, "substringFromIndex:", v5 + v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)localizedStringForLanguageCode:()AMPICUExtensions length:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifierFromString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    v9 = 0;
    while (1)
    {
      v10 = (void *)v9;
      if (!objc_msgSend(v7, "length") || v9)
        break;
      objc_msgSend(a1, "availableLanguagesOfLength:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        objc_msgSend((id)AMPICUFormattingLengthFallbacks, "objectForKeyedSubscript:", v7);
        v12 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v12;
        if (!v12)
          v7 = (id)AMPICUFormattingLengthStandard;
      }
    }
    if (!v9)
    {
      objc_msgSend(a1, "localizedStringForLanguageCode:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)localizedStringForCountryCode:()AMPICUExtensions length:
{
  id v6;
  id v7;
  NSLocaleRegion *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  v8 = -[NSLocaleRegion initWithRegionIdentifier:]([NSLocaleRegion alloc], "initWithRegionIdentifier:", v6);
  -[NSLocaleRegion twoCharacterCode](v8, "twoCharacterCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
  {
    v10 = 0;
    while (1)
    {
      v11 = (void *)v10;
      if (!objc_msgSend(v7, "length") || v10)
        break;
      objc_msgSend(a1, "availableCountriesOfLength:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        objc_msgSend((id)AMPICUFormattingLengthFallbacks, "objectForKeyedSubscript:", v7);
        v13 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v13;
        if (!v13)
          v7 = (id)AMPICUFormattingLengthStandard;
      }
    }
    if (!v10)
    {
      objc_msgSend(a1, "localizedStringForCountryCode:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)localizedStringForScriptCode:()AMPICUExtensions length:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v8 = 0;
    while (1)
    {
      v9 = (void *)v8;
      if (!objc_msgSend(v7, "length") || v8)
        break;
      objc_msgSend(a1, "availableScriptsOfLength:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v6);
      v8 = objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend((id)AMPICUFormattingLengthFallbacks, "objectForKeyedSubscript:", v7);
        v11 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v11;
        if (!v11)
          v7 = (id)AMPICUFormattingLengthStandard;
      }
    }
    if (!v8)
    {
      objc_msgSend(a1, "localizedStringForScriptCode:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
