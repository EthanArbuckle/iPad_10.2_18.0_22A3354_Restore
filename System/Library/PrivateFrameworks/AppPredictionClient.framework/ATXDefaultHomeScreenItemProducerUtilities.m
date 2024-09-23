@implementation ATXDefaultHomeScreenItemProducerUtilities

+ (id)stackFromDefaultStackPersonalities:(id)a3 suggestedSize:(unint64_t)a4 maxWidgetsPerStack:(unint64_t)a5 personalityToDescriptorDictionary:(id)a6 isiPad:(BOOL)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;

  v12 = a3;
  v13 = a6;
  objc_msgSend(a1, "widgetsFromPersonalities:size:personalityToDescriptorDictionary:", v12, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "widgetsFromPersonalities:size:personalityToDescriptorDictionary:", v12, 1, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "widgetsFromPersonalities:size:personalityToDescriptorDictionary:", v12, 2, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a7)
  {
    objc_msgSend(a1, "widgetsFromPersonalities:size:personalityToDescriptorDictionary:", v12, 4, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v20) = 1;
    objc_msgSend(a1, "_defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:", v14, v15, v16, v17, a4, a5, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    LOBYTE(v20) = 0;
    objc_msgSend(a1, "_defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:", v14, v15, v16, 0, a4, a5, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

+ (id)widgetFromPersonality:(id)a3 size:(unint64_t)a4 personalityToDescriptorDictionary:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a5;
  +[ATXDefaultHomeScreenItemProducerUtilities specialWidgetDescriptorForPersonality:size:](ATXDefaultHomeScreenItemProducerUtilities, "specialWidgetDescriptorForPersonality:size:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (objc_msgSend(v8, "objectForKeyedSubscript:", v7),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = (void *)objc_msgSend(v10, "copy"),
        v10,
        v9))
  {
    objc_msgSend((id)objc_opt_class(), "widget:filteredForSize:", v9, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)widgetsFromPersonalities:(id)a3 size:(unint64_t)a4 personalityToDescriptorDictionary:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __109__ATXDefaultHomeScreenItemProducerUtilities_widgetsFromPersonalities_size_personalityToDescriptorDictionary___block_invoke;
  v12[3] = &unk_1E4D5D468;
  v14 = a1;
  v15 = a4;
  v13 = v8;
  v9 = v8;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __109__ATXDefaultHomeScreenItemProducerUtilities_widgetsFromPersonalities_size_personalityToDescriptorDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "widgetFromPersonality:size:personalityToDescriptorDictionary:", a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

+ (id)personalitiesFromAssetsWithKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  ATXWidgetPersonality *v19;
  ATXWidgetPersonality *v20;
  void *v22;
  id v23;
  uint64_t v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1A85A4F90]();
  v5 = (void *)objc_opt_new();
  +[ATXAssets2 dictionaryForClassName:](ATXAssets2, "dictionaryForClassName:", CFSTR("ATXDefaultHomeScreenItemUpdater"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v3;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v22 = v7;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      v24 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(a1, "_specialAvocadoKindsConvertingFromAssetsString:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v13)
            {
              v29 = 0u;
              v30 = 0u;
              v27 = 0u;
              v28 = 0u;
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              if (v15)
              {
                v16 = v15;
                v17 = *(_QWORD *)v28;
                do
                {
                  for (j = 0; j != v16; ++j)
                  {
                    if (*(_QWORD *)v28 != v17)
                      objc_enumerationMutation(v14);
                    v19 = -[ATXWidgetPersonality initWithExtensionBundleId:kind:]([ATXWidgetPersonality alloc], "initWithExtensionBundleId:kind:", &stru_1E4D5DB30, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j));
                    objc_msgSend(v5, "addObject:", v19);

                  }
                  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
                }
                while (v16);
              }
            }
            else
            {
              v20 = -[ATXWidgetPersonality initWithStringRepresentation:]([ATXWidgetPersonality alloc], "initWithStringRepresentation:", v12);
              if (v20)
                objc_msgSend(v5, "addObject:", v20);

            }
            v10 = v24;
          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v9);
    }

    v3 = v23;
    v7 = v22;
  }

  objc_autoreleasePoolPop(v4);
  return v5;
}

+ (id)widget:(id)a3 filteredForSize:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  objc_msgSend(v5, "avocadoDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6
    && (v8 = objc_msgSend(v6, "supportedFamilies"),
        (objc_msgSend((id)objc_opt_class(), "_widgetFamilyMaskForStackLayoutSize:", a4) & v8) != 0))
  {
    v9 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v9, "setSuggestedSize:", a4);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)widgets:(id)a3 filteredForSize:(unint64_t)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__ATXDefaultHomeScreenItemProducerUtilities_widgets_filteredForSize___block_invoke;
  v5[3] = &__block_descriptor_48_e39__16__0__ATXHomeScreenWidgetDescriptor_8l;
  v5[4] = a1;
  v5[5] = a4;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __69__ATXDefaultHomeScreenItemProducerUtilities_widgets_filteredForSize___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "widget:filteredForSize:", a2, *(_QWORD *)(a1 + 40));
}

+ (unint64_t)_widgetFamilyMaskForStackLayoutSize:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return 2;
  else
    return qword_1A4B671F0[a3 - 1];
}

+ (id)_specialAvocadoKindsConvertingFromAssetsString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("suggestions")) & 1) != 0)
  {
    v4 = &unk_1E4DC2D98;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("shortcuts")) & 1) != 0)
  {
    v4 = &unk_1E4DC2DB0;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("files")))
  {
    v4 = &unk_1E4DC2DC8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)specialWidgetDescriptorForPersonality:(id)a3 size:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "_supportedSizeClassesForSpecialAvocadoKind:", v6);
  if ((objc_msgSend(a1, "_widgetFamilyMaskForStackLayoutSize:", a4) & v7) != 0)
  {
    v8 = objc_alloc(MEMORY[0x1E0D10168]);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10038]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", &stru_1E4D5DB30, 0, 0);
    v10 = (void *)objc_msgSend(v8, "initWithExtensionIdentity:kind:supportedFamilies:intentType:", v9, v6, v7, 0);

    if (!v10)
    {
      __atxlog_handle_home_screen();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[ATXDefaultHomeScreenItemProducerUtilities specialWidgetDescriptorForPersonality:size:].cold.1((uint64_t)v6, v12);
      goto LABEL_12;
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindShortcutsSingle")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindShortcutsFolder")) & 1) != 0)
    {
      v11 = CFSTR("com.apple.shortcuts");
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindFiles")))
      {
        v11 = 0;
        goto LABEL_16;
      }
      v11 = CFSTR("com.apple.DocumentsApp");
    }
    if (!+[ATXApplicationRecord isInstalledForBundle:](ATXApplicationRecord, "isInstalledForBundle:", v11))
    {
      __atxlog_handle_home_screen();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v6;
        _os_log_impl(&dword_1A49EF000, v12, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemProducer: could not add %@ widget to default stack because app is not installed on device", (uint8_t *)&v15, 0xCu);
      }
LABEL_12:

      v13 = 0;
LABEL_17:

      goto LABEL_18;
    }
LABEL_16:
    objc_msgSend(a1, "widgetDescriptorFromChronoDescriptor:appBundleId:rankType:", v10, v11, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSuggestedSize:", a4);
    goto LABEL_17;
  }
  v13 = 0;
LABEL_18:

  return v13;
}

+ (unint64_t)_supportedSizeClassesForSpecialAvocadoKind:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindSiri")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindFiles")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindShortcutsFolder")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindShortcutsSingle")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_defaultWidgetStackFromSmallStack:(id)a3 mediumStack:(id)a4 largeStack:(id)a5 extraLargeStack:(id)a6 suggestedSize:(unint64_t)a7 maxWidgetsPerStack:(unint64_t)a8 isiPad:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  int v34;
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if ((unint64_t)objc_msgSend(v14, "count") < 2
    || (unint64_t)objc_msgSend(v15, "count") < 2
    || (unint64_t)objc_msgSend(v16, "count") <= 1)
  {
    __atxlog_handle_home_screen();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v34 = 136315906;
      v35 = "+[ATXDefaultHomeScreenItemProducerUtilities _defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLa"
            "rgeStack:suggestedSize:maxWidgetsPerStack:isiPad:]";
      v36 = 2048;
      v37 = objc_msgSend(v14, "count");
      v38 = 2048;
      v39 = objc_msgSend(v15, "count");
      v40 = 2048;
      v41 = objc_msgSend(v16, "count");
      _os_log_error_impl(&dword_1A49EF000, v18, OS_LOG_TYPE_ERROR, "%s: default stack does not have enough widgets (small: %lu, med: %lu, large: %lu)", (uint8_t *)&v34, 0x2Au);
    }

  }
  if (a9 && (unint64_t)objc_msgSend(v17, "count") <= 1)
  {
    __atxlog_handle_home_screen();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[ATXDefaultHomeScreenItemProducerUtilities _defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:].cold.1(v17);

  }
  v20 = objc_msgSend(v14, "count");
  if (v20 >= a8)
    v21 = a8;
  else
    v21 = v20;
  objc_msgSend(v14, "subarrayWithRange:", 0, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v15, "count");
  if (v23 >= a8)
    v24 = a8;
  else
    v24 = v23;
  objc_msgSend(v15, "subarrayWithRange:", 0, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v16, "count");
  if (v26 >= a8)
    v27 = a8;
  else
    v27 = v26;
  objc_msgSend(v16, "subarrayWithRange:", 0, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v17, "count");
  if (v29 >= a8)
    v30 = a8;
  else
    v30 = v29;
  objc_msgSend(v17, "subarrayWithRange:", 0, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)objc_opt_new();
  objc_msgSend(v32, "setSmallDefaultStack:", v22);
  objc_msgSend(v32, "setMediumDefaultStack:", v25);
  objc_msgSend(v32, "setLargeDefaultStack:", v28);
  objc_msgSend(v32, "setExtraLargeDefaultStack:", v31);
  objc_msgSend(v32, "setSuggestedSize:", a7);

  return v32;
}

+ (id)widgetDescriptorFromChronoDescriptor:(id)a3 appBundleId:(id)a4 rankType:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setAvocadoDescriptor:", v8);

  objc_msgSend(v9, "setAppBundleId:", v7);
  objc_msgSend(v9, "setRankType:", a5);
  return v9;
}

+ (id)defaultWidgetStackFromSmallStack:(id)a3 mediumStack:(id)a4 largeStack:(id)a5 extraLargeStack:(id)a6 suggestedSize:(unint64_t)a7 maxWidgetsPerStack:(unint64_t)a8 isiPad:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  int v34;
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if ((unint64_t)objc_msgSend(v14, "count") < 2
    || (unint64_t)objc_msgSend(v15, "count") < 2
    || (unint64_t)objc_msgSend(v16, "count") <= 1)
  {
    __atxlog_handle_home_screen();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v34 = 136315906;
      v35 = "+[ATXDefaultHomeScreenItemProducerUtilities defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLar"
            "geStack:suggestedSize:maxWidgetsPerStack:isiPad:]";
      v36 = 2048;
      v37 = objc_msgSend(v14, "count");
      v38 = 2048;
      v39 = objc_msgSend(v15, "count");
      v40 = 2048;
      v41 = objc_msgSend(v16, "count");
      _os_log_error_impl(&dword_1A49EF000, v18, OS_LOG_TYPE_ERROR, "%s: default stack does not have enough widgets (small: %lu, med: %lu, large: %lu)", (uint8_t *)&v34, 0x2Au);
    }

  }
  if (a9 && (unint64_t)objc_msgSend(v17, "count") <= 1)
  {
    __atxlog_handle_home_screen();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[ATXDefaultHomeScreenItemProducerUtilities defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:].cold.1(v17);

  }
  v20 = objc_msgSend(v14, "count");
  if (v20 >= a8)
    v21 = a8;
  else
    v21 = v20;
  objc_msgSend(v14, "subarrayWithRange:", 0, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v15, "count");
  if (v23 >= a8)
    v24 = a8;
  else
    v24 = v23;
  objc_msgSend(v15, "subarrayWithRange:", 0, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v16, "count");
  if (v26 >= a8)
    v27 = a8;
  else
    v27 = v26;
  objc_msgSend(v16, "subarrayWithRange:", 0, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v17, "count");
  if (v29 >= a8)
    v30 = a8;
  else
    v30 = v29;
  objc_msgSend(v17, "subarrayWithRange:", 0, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)objc_opt_new();
  objc_msgSend(v32, "setSmallDefaultStack:", v22);
  objc_msgSend(v32, "setMediumDefaultStack:", v25);
  objc_msgSend(v32, "setLargeDefaultStack:", v28);
  objc_msgSend(v32, "setExtraLargeDefaultStack:", v31);
  objc_msgSend(v32, "setSuggestedSize:", a7);

  return v32;
}

+ (id)splitDescriptorsIntoFirstPartyAndThirdParty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(a1, "_isSpecialAvocadoDescriptor:", v12, (_QWORD)v19))
        {
          objc_msgSend(v5, "addObject:", v12);
        }
        else
        {
          objc_msgSend(v12, "avocadoDescriptor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "extensionBundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14 || (v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("com.apple.")), v16 = v5, (v15 & 1) == 0))
            v16 = v6;
          objc_msgSend(v16, "addObject:", v12);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v5, v6);
  return v17;
}

+ (BOOL)_isSpecialAvocadoDescriptor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;

  v3 = a3;
  objc_msgSend(v3, "avocadoDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", &stru_1E4D5DB30);

  if (v6)
  {
    objc_msgSend(v3, "avocadoDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindSiri")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindShortcutsSingle")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindShortcutsFolder")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindFiles")) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindAppPredictions"));
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)specialWidgetDescriptorForPersonality:(uint64_t)a1 size:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "ATXDefaultHomeScreenItemProducer: could not add the %@ widget to default stack due to issue initializing the special CHSWidgetDescriptor", (uint8_t *)&v2, 0xCu);
}

+ (void)_defaultWidgetStackFromSmallStack:(void *)a1 mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v1, v2, "%s: extra large default stack does not have enough widgets: %lu", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)defaultWidgetStackFromSmallStack:(void *)a1 mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v1, v2, "%s: extra large default stack does not have enough widgets: %lu", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3();
}

@end
