@implementation CESRGeoLMRegionIDCache

+ (void)updateGeoLMAssetsInfoDictWithRegionId:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_geoLMAssetsInfoDictForLanguage:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v12, v7);

  objc_msgSend(a1, "_updateUserDefaultsWithGeoLMAssetsInfoDict:language:", v13, v6);
}

+ (id)purgeUnusedGeoLMRegionIdFromCacheForLanguage:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  NSObject *v29;
  id v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _AFPreferencesBoolValueForKeyWithContext();
  objc_msgSend(a1, "_geoLMAssetsInfoDictForLanguage:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = objc_msgSend(v7, "count");
  v9 = v8;
  if (v5)
  {
    v10 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "+[CESRGeoLMRegionIDCache purgeUnusedGeoLMRegionIdFromCacheForLanguage:]";
      v40 = 2048;
      v41 = v9;
      _os_log_debug_impl(&dword_1B3E5F000, v10, OS_LOG_TYPE_DEBUG, "%s GeoLM: GeoLM region specific assets deletion is disabled, number of regionIds used till now: %ld", buf, 0x16u);
    }
    goto LABEL_5;
  }
  if (v8 >= 2)
  {
    v33 = v8;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    v31 = a1;
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = 0;
      v17 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKeyedSubscript:", v19, v31);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v16 | v15)
          {
            if (objc_msgSend(v20, "compare:", v15) == -1)
            {
              v22 = v19;

              v23 = v21;
              v15 = (unint64_t)v23;
              v16 = (unint64_t)v22;
            }
          }
          else
          {
            v16 = v19;
            v15 = v21;
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      }
      while (v14);
    }
    else
    {
      v15 = 0;
      v16 = 0;
    }

    v11 = (id)v16;
    if (v33 == 2)
    {
      objc_msgSend(v12, "valueForKey:", v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = +[CESRUtilities calculateDiffInDaysFromTimestamp:](CESRUtilities, "calculateDiffInDaysFromTimestamp:", v24);

      if (v25 < 8)
      {
LABEL_25:

        goto LABEL_26;
      }
      v26 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v39 = "+[CESRGeoLMRegionIDCache purgeUnusedGeoLMRegionIdFromCacheForLanguage:]";
        v40 = 2112;
        v41 = (uint64_t)v11;
        v42 = 2048;
        v43 = v25;
        v27 = "%s GeoLM: regionIdToBePurged: %@, lastWhenUsed: %ld days ago";
        v28 = v26;
LABEL_28:
        _os_log_debug_impl(&dword_1B3E5F000, v28, OS_LOG_TYPE_DEBUG, v27, buf, 0x20u);
      }
    }
    else
    {
      v29 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v39 = "+[CESRGeoLMRegionIDCache purgeUnusedGeoLMRegionIdFromCacheForLanguage:]";
        v40 = 2112;
        v41 = (uint64_t)v11;
        v42 = 2048;
        v43 = v33;
        v27 = "%s GeoLM: regionIdToBePurged: %@, _geoLMAssetsInfoDict count: %ld";
        v28 = v29;
        goto LABEL_28;
      }
    }
    objc_msgSend(v12, "removeObjectForKey:", v11, v31);
    objc_msgSend(v32, "_updateUserDefaultsWithGeoLMAssetsInfoDict:language:", v12, v4);
    goto LABEL_25;
  }
LABEL_5:
  v11 = 0;
LABEL_26:

  return v11;
}

+ (id)lastUsedGeoLMRegionIdForLanguage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_geoLMAssetsInfoDictForLanguage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = 0;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v13, (_QWORD)v22);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v10 | v9)
          {
            if (v14 && objc_msgSend(v14, "compare:", v9) == 1)
            {
              v16 = v13;

              v17 = v15;
              v9 = (unint64_t)v17;
              v10 = (unint64_t)v16;
            }
          }
          else
          {
            v10 = v13;
            v9 = v15;
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }

    v19 = (id)v10;
    v20 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "+[CESRGeoLMRegionIDCache lastUsedGeoLMRegionIdForLanguage:]";
      v28 = 2112;
      v29 = v19;
      _os_log_debug_impl(&dword_1B3E5F000, v20, OS_LOG_TYPE_DEBUG, "%s GeoLM: Last used GeoLM regionId: %@", buf, 0x16u);
    }

  }
  else
  {
    v18 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "+[CESRGeoLMRegionIDCache lastUsedGeoLMRegionIdForLanguage:]";
      _os_log_debug_impl(&dword_1B3E5F000, v18, OS_LOG_TYPE_DEBUG, "%s GeoLM: No history of GeoLM usage. regionId: nil", buf, 0xCu);
    }
    v19 = 0;
  }

  return v19;
}

+ (void)purgeUserDefaultsGeoLMAssetsInfoDictForLanguages:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  os_log_t *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v17;
    v11 = (os_log_t *)MEMORY[0x1E0CFE6C0];
    *(_QWORD *)&v8 = 136315394;
    v15 = v8;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_userDefaultsGeoLMAssetsInfoDictKeyForLanguage:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), v15, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *v11;
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v15;
          v21 = "+[CESRGeoLMRegionIDCache purgeUserDefaultsGeoLMAssetsInfoDictForLanguages:]";
          v22 = 2112;
          v23 = v13;
          _os_log_debug_impl(&dword_1B3E5F000, v14, OS_LOG_TYPE_DEBUG, "%s GeoLM: Going to delete: %@", buf, 0x16u);
        }
        objc_msgSend(v5, "removeObjectForKey:", v13);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v9);
  }

}

+ (id)_geoLMAssetsInfoDictForLanguage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  objc_msgSend(v4, "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_userDefaultsGeoLMAssetsInfoDictKeyForLanguage:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dictionaryForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)_updateUserDefaultsWithGeoLMAssetsInfoDict:(id)a3 language:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0C99EA0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "standardUserDefaults");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_userDefaultsGeoLMAssetsInfoDictKeyForLanguage:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKey:", v8, v9);
}

+ (id)_userDefaultsGeoLMAssetsInfoDictKeyForLanguage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("GeoLMAssetsInfo"), "stringByAppendingString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
