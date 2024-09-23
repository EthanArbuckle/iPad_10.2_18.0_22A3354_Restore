@implementation SFSearchEngineController

void __51___SFSearchEngineController__populateSearchEngines__block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SearchEngineControllerInstanceDidFinishPopulatingSearchEngines"), *(_QWORD *)(a1 + 32));

}

void __62___SFSearchEngineController__postDefaultSearchEngineDidChange__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SearchEngineControllerDefaultSearchEngineDidChange"), *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_notificationNameForUserDefaultsKey:", CFSTR("PrivateSearchEngineStringSetting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:deliverImmediately:", v4, 0, 0, 1);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_notificationNameForUserDefaultsKey:", CFSTR("SearchEngineStringSetting"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:deliverImmediately:", v5, 0, 0, 1);

}

uint64_t __51___SFSearchEngineController__populateSearchEngines__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "shortName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "shortName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void __51___SFSearchEngineController__populateSearchEngines__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t (**v32)(_QWORD, _QWORD);
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD block[5];
  _QWORD v40[4];
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = _SFDeviceIsPad();
  objc_msgSend(MEMORY[0x1E0C99EA0], "_web_preferredLanguageCode");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_setEngines:defaultSearchEngineIndex:forPrivateBrowsing:", 0, 0x7FFFFFFFFFFFFFFFLL, 0);
  objc_msgSend(*(id *)(a1 + 32), "_setEngines:defaultSearchEngineIndex:forPrivateBrowsing:", 0, 0x7FFFFFFFFFFFFFFFLL, 1);
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariSharedDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("SearchEngineStringSetting"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v38 = v5;
  objc_msgSend(v5, "objectForKey:", CFSTR("PrivateSearchEngineStringSetting"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v7;
  if (v6)
  {
LABEL_4:
    if (v8)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (useBaiduAsPresetDefaultSearchEngine)
  {
    v6 = (id)*MEMORY[0x1E0D8B520];
    goto LABEL_4;
  }
  v6 = 0;
  if (!v7)
LABEL_5:
    v8 = v6;
LABEL_6:
  objc_msgSend(*(id *)(a1 + 32), "_loadSystemPropertiesForSearchEngine:", v6);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D8B528]);
  v37 = v8;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D8B530]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_addAllWebSearchEngineInfosToArray:andAddUserVisibleWebSearchEngineInfosToArray:", v11, v10);
  objc_msgSend(MEMORY[0x1E0D8AC30], "sharedRecorder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)v11;
  objc_msgSend(v12, "setSearchProviders:", v11);
  v13 = v10;
  if (_SFDeviceRegionCodeIsChina())
  {
    v14 = (uint64_t *)MEMORY[0x1E0D8B578];
    v15 = (uint64_t *)MEMORY[0x1E0D8B548];
    v16 = (uint64_t *)MEMORY[0x1E0D8B570];
    v17 = (uint64_t *)MEMORY[0x1E0D8B558];
    v18 = (uint64_t *)MEMORY[0x1E0D8B540];
    v42 = *MEMORY[0x1E0D8B538];
    v19 = (uint64_t *)MEMORY[0x1E0D8B560];
    v20 = (uint64_t *)MEMORY[0x1E0D8B568];
  }
  else
  {
    v14 = (uint64_t *)MEMORY[0x1E0D8B560];
    v15 = (uint64_t *)MEMORY[0x1E0D8B568];
    v16 = (uint64_t *)MEMORY[0x1E0D8B548];
    v17 = (uint64_t *)MEMORY[0x1E0D8B578];
    v18 = (uint64_t *)MEMORY[0x1E0D8B538];
    v42 = *MEMORY[0x1E0D8B558];
    v19 = (uint64_t *)MEMORY[0x1E0D8B540];
    v20 = (uint64_t *)MEMORY[0x1E0D8B570];
  }
  v21 = *v19;
  v43 = *v20;
  v44 = v21;
  v22 = *v17;
  v45 = *v18;
  v46 = v22;
  v23 = *v15;
  v47 = *v16;
  v48 = v23;
  v24 = *MEMORY[0x1E0D8B550];
  v49 = *v14;
  v50 = v24;
  v51 = CFSTR("Wikipedia");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSSearchProvider sortedSearchProvidersInArray:usingShortNameOrder:](_SFSearchEngineInfo, "sortedSearchProvidersInArray:usingShortNameOrder:", v13, v25);
  v26 = v13;
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  +[WBSSearchProvider defaultProviderInUserVisibleProviders:usingSettings:forPrivateBrowsing:](_SFSearchEngineInfo, "defaultProviderInUserVisibleProviders:usingSettings:forPrivateBrowsing:", v27, v9, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSSearchProvider defaultProviderInUserVisibleProviders:usingSettings:forPrivateBrowsing:](_SFSearchEngineInfo, "defaultProviderInUserVisibleProviders:usingSettings:forPrivateBrowsing:", v27, v9, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __51___SFSearchEngineController__populateSearchEngines__block_invoke_2;
  v40[3] = &unk_1E4AC4488;
  v41 = v27;
  v31 = v27;
  v32 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1A8598C40](v40);
  v33 = ((uint64_t (**)(_QWORD, void *))v32)[2](v32, v28);
  objc_msgSend(*(id *)(a1 + 32), "_setEngines:defaultSearchEngineIndex:forPrivateBrowsing:", v31, v33, 0);
  objc_msgSend(*(id *)(a1 + 32), "_setEngines:defaultSearchEngineIndex:forPrivateBrowsing:", v31, ((uint64_t (**)(_QWORD, void *))v32)[2](v32, v29), 1);
  objc_msgSend(v31, "objectAtIndexedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDefaultSearchProvider:", v34);

  block[0] = v30;
  block[1] = 3221225472;
  block[2] = __51___SFSearchEngineController__populateSearchEngines__block_invoke_4;
  block[3] = &unk_1E4ABFE00;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __51___SFSearchEngineController__populateSearchEngines__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51___SFSearchEngineController__populateSearchEngines__block_invoke_3;
  v8[3] = &unk_1E4AC4460;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "indexOfObjectPassingTest:", v8);

  return v6;
}

void __85___SFSearchEngineController__getEngines_defaultSearchEngineIndex_forPrivateBrowsing___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD **)(a1 + 48);
  if (v2)
  {
    v3 = 40;
    if (!*(_BYTE *)(a1 + 56))
      v3 = 16;
    *v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + v3);
  }
}

uint64_t __54___SFSearchEngineController_sharedInstanceIfAvailable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initializeSharedInstance");
}

uint64_t __71___SFSearchEngineController_setDefaultSearchEngine_forPrivateBrowsing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDefaultSearchEngine:forPrivateBrowsing:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

void __72___SFSearchEngineController__setDefaultSearchEngine_forPrivateBrowsing___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFString **v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "shortName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32)))
  {
    v9 = 40;
    if (!*(_BYTE *)(a1 + 48))
      v9 = 16;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + v9) = a3;
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariSharedDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = &_SFPrivateSearchEngineStringDefaultsKey;
    if (!*(_BYTE *)(a1 + 48))
      v12 = _SFSearchEngineStringDefaultsKey;
    objc_msgSend(v10, "setObject:forKey:", *(_QWORD *)(a1 + 32), *v12);

    os_unfair_lock_lock(&defaultSearchEngineLock);
    v13 = 48;
    if (!*(_BYTE *)(a1 + 48))
      v13 = 32;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + v13), a2);
    os_unfair_lock_unlock(&defaultSearchEngineLock);
    objc_msgSend(*(id *)(a1 + 40), "_postDefaultSearchEngineDidChange");
    *a4 = 1;
  }

}

void __43___SFSearchEngineController_engineInfoFor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_existingEngineInfoFor:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __69___SFSearchEngineController_enginesAvailableForUnifiedFieldSearching__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "shortName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Wikipedia")) ^ 1;

  return v3;
}

@end
