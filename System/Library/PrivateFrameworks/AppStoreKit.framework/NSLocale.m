@implementation NSLocale

void __44__NSLocale_AMPICUExtensions__ISOScriptCodes__block_invoke()
{
  int32_t IntPropertyMaxValue;
  int v1;
  int v2;
  uint64_t ShortName;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  IntPropertyMaxValue = u_getIntPropertyMaxValue(UCHAR_SCRIPT);
  if ((IntPropertyMaxValue & 0x80000000) == 0)
  {
    v1 = 0;
    v2 = IntPropertyMaxValue + 1;
    do
    {
      ShortName = uscript_getShortName();
      if (ShortName)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ShortName);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v4);

      }
      ++v1;
    }
    while (v2 != v1);
  }
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_scriptCodes;
  _scriptCodes = v5;

}

void __49__NSLocale_AMPICUExtensions__ICUNumberingSystems__block_invoke()
{
  id v0;
  int v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  unumsys_openAvailableNames();
  v1 = uenum_count();
  if (v1 < 1)
  {
    v4 = 0;
  }
  else
  {
    v2 = 0;
    do
    {
      v3 = uenum_next();
      +[NSNumberingSystem numberingSystemWithNumberingSystemName:](NSNumberingSystem, "numberingSystemWithNumberingSystemName:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "setObject:forKeyedSubscript:", v4, v5);

      }
      v2 = v4;
      --v1;
    }
    while (v1);
  }
  uenum_close();
  v6 = objc_msgSend(v0, "copy");
  v7 = (void *)_numberingSystems;
  _numberingSystems = v6;

}

void __52__NSLocale_AMPICUExtensions__ISOTerritoryGroupCodes__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  fillMutableSetWithRegionType(v3);
  fillMutableSetWithRegionType(v3);
  fillMutableSetWithRegionType(v3);
  fillMutableSetWithRegionType(v3);
  objc_msgSend(v3, "allObjects");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_territoryGroupCodes;
  _territoryGroupCodes = v1;

}

void __62__NSLocale_AMPICUExtensions__ISO3CharacterTerritoryGroupCodes__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  id v8;
  _BYTE *ISO3Country;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "ISOTerritoryGroupCodes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v1, "count"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(CFSTR("_"), "stringByAppendingString:", v7, (_QWORD)v13);
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v8, "UTF8String");
        ISO3Country = (_BYTE *)uloc_getISO3Country();
        if (ISO3Country && *ISO3Country)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ISO3Country);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v10);

        }
        else
        {
          objc_msgSend(v2, "addObject:", v7);
        }

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)_territoryGroupCodes3;
  _territoryGroupCodes3 = v11;

}

void __56__NSLocale_AMPICUExtensions__ISO3CharacterLanguageCodes__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  _BYTE *ISO3Language;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "ISOLanguageCodes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v1, "count"));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v7 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i));
        objc_msgSend(v7, "UTF8String", (_QWORD)v12);
        ISO3Language = (_BYTE *)uloc_getISO3Language();
        if (ISO3Language && *ISO3Language)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ISO3Language);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v9);

        }
        else
        {
          objc_msgSend(v2, "addObject:", v7);
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_languageCodes3;
  _languageCodes3 = v10;

}

void __54__NSLocale_AMPICUExtensions__ISO3CharacterRegionCodes__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  id v8;
  _BYTE *ISO3Country;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "ISOCountryCodes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v1, "count"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(CFSTR("_"), "stringByAppendingString:", v7, (_QWORD)v13);
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v8, "UTF8String");
        ISO3Country = (_BYTE *)uloc_getISO3Country();
        if (ISO3Country && *ISO3Country)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ISO3Country);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v10);

        }
        else
        {
          objc_msgSend(v2, "addObject:", v7);
        }

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)_regionCodes3;
  _regionCodes3 = v11;

}

@end
