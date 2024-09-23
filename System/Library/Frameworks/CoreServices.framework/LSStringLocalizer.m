@implementation LSStringLocalizer

void __40___LSStringLocalizer_coreTypesLocalizer__block_invoke()
{
  _LSStringLocalizer *v0;
  void *v1;
  _LSStringLocalizer *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", CFSTR("/System/Library/CoreServices/MobileCoreTypes.bundle"), 1);
  if (v4)
  {
    v0 = -[_LSStringLocalizer initWithBundleURL:stringsFile:checkMainBundle:legacyLocalizationList:]([_LSStringLocalizer alloc], "initWithBundleURL:stringsFile:checkMainBundle:legacyLocalizationList:", v4, CFSTR("InfoPlist"), 0, 0);
    v1 = (void *)+[_LSStringLocalizer coreTypesLocalizer]::result;
    +[_LSStringLocalizer coreTypesLocalizer]::result = (uint64_t)v0;

  }
  if (!+[_LSStringLocalizer coreTypesLocalizer]::result)
  {
    v2 = objc_alloc_init(_LSStringLocalizer);
    v3 = (void *)+[_LSStringLocalizer coreTypesLocalizer]::result;
    +[_LSStringLocalizer coreTypesLocalizer]::result = (uint64_t)v2;

  }
}

void __52___LSStringLocalizer_missingLocalizationPlaceholder__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[_LSStringLocalizer missingLocalizationPlaceholder]::result;
  +[_LSStringLocalizer missingLocalizationPlaceholder]::result = v0;

}

uint64_t __137___LSStringLocalizer_gatherLocalizedStringsForLSBundleProvider_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a4);
}

void __137___LSStringLocalizer_gatherLocalizedStringsForLSBundleProvider_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _LSStringLocalizer *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x186DAE7A0]();
  if (objc_msgSend(v5, "isEqual:", &stru_1E10473A0))
  {
    v8 = (_LSStringLocalizer *)*(id *)(a1 + 32);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("_LSBundleLibraryPath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      if (!v10)
      {
        objc_msgSend(*(id *)(a1 + 48), "bundleURL");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

        v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      }
      objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v9, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v5, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v8 = (_LSStringLocalizer *)objc_msgSend(objc_alloc(*(Class *)(a1 + 72)), "initWithBundleURL:stringsFile:checkMainBundle:legacyLocalizationList:", v16, CFSTR("InfoPlist"), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81));
          _LSStringLocalizerPrewarmAllLocalizations(v8);
        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __137___LSStringLocalizer_gatherLocalizedStringsForLSBundleProvider_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_3;
  v20[3] = &unk_1E1045540;
  v21 = *(id *)(a1 + 56);
  v17 = v5;
  v18 = *(_QWORD *)(a1 + 72);
  v19 = v17;
  v22 = v17;
  v23 = v18;
  -[_LSStringLocalizer enumerateLocalizedStringsForKeys:usingBlock:](v8, "enumerateLocalizedStringsForKeys:usingBlock:", v6, v20);

  objc_autoreleasePoolPop(v7);
}

void __137___LSStringLocalizer_gatherLocalizedStringsForLSBundleProvider_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_3(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v19 = a3;
  v8 = a4;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || (v10 = objc_msgSend(a1[5], "isEqual:", &stru_1E10473A0), v9, (v10 & 1) != 0))
  {
    if (objc_msgSend(v8, "count"))
    {
      v11 = (void *)objc_msgSend(v19, "mutableCopy");
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v12 = v8;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v21;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v21 != v14)
              objc_enumerationMutation(v12);
            v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
            objc_msgSend(a1[6], "missingLocalizationPlaceholder");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v16);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v13);
      }

      v18 = (void *)objc_msgSend(v11, "copy");
      objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v18, v7);

    }
    else
    {
      objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v19, v7);
    }
  }

}

uint64_t __129___LSStringLocalizer_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a4);
}

void __129___LSStringLocalizer_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _LSStringLocalizer *v8;
  void *v9;
  void *v10;
  CFURLRef v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x186DAE7A0]();
  if (objc_msgSend(v5, "isEqual:", &stru_1E10473A0))
  {
    v8 = (_LSStringLocalizer *)*(id *)(a1 + 32);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("_LSBundleLibraryPath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (!v10)
      {
        v11 = CFBundleCopyBundleURL(*(CFBundleRef *)(a1 + 64));
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

        v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      }
      objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v9, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v5, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v8 = (_LSStringLocalizer *)objc_msgSend(objc_alloc(*(Class *)(a1 + 72)), "initWithBundleURL:stringsFile:checkMainBundle:legacyLocalizationList:", v16, CFSTR("InfoPlist"), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81));
          _LSStringLocalizerPrewarmAllLocalizations(v8);
        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __129___LSStringLocalizer_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_3;
  v20[3] = &unk_1E1045540;
  v21 = *(id *)(a1 + 48);
  v17 = v5;
  v18 = *(_QWORD *)(a1 + 72);
  v19 = v17;
  v22 = v17;
  v23 = v18;
  -[_LSStringLocalizer enumerateLocalizedStringsForKeys:usingBlock:](v8, "enumerateLocalizedStringsForKeys:usingBlock:", v6, v20);

  objc_autoreleasePoolPop(v7);
}

void __129___LSStringLocalizer_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_3(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v19 = a3;
  v8 = a4;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || (v10 = objc_msgSend(a1[5], "isEqual:", &stru_1E10473A0), v9, (v10 & 1) != 0))
  {
    if (objc_msgSend(v8, "count"))
    {
      v11 = (void *)objc_msgSend(v19, "mutableCopy");
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v12 = v8;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v21;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v21 != v14)
              objc_enumerationMutation(v12);
            v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
            objc_msgSend(a1[6], "missingLocalizationPlaceholder");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v16);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v13);
      }

      v18 = (void *)objc_msgSend(v11, "copy");
      objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v18, v7);

    }
    else
    {
      objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v19, v7);
    }
  }

}

@end
