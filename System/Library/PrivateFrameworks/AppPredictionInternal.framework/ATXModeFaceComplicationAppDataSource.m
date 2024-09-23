@implementation ATXModeFaceComplicationAppDataSource

- (id)provideComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  id v25;
  id v26;
  id v27;
  void *v28;
  ATXSuggestedPagesAppAggregator *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v29 = objc_alloc_init(ATXSuggestedPagesAppAggregator);
  -[ATXSuggestedPagesAppAggregator provideAppsForSuggestedPageType:candidateApps:environment:](v29, "provideAppsForSuggestedPageType:candidateApps:environment:", ATXSuggestedPageTypeFromSuggestedFaceType(a3), 0, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v10 = objc_alloc(MEMORY[0x1E0C99E60]);
  v28 = v9;
  objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_126);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithArray:", v11);

  objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "complicationWidgetDescriptors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_alloc_init(MEMORY[0x1E0CF8E58]);
  objc_msgSend(v27, "homeScreenWidgetPersonalities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __93__ATXModeFaceComplicationAppDataSource_provideComplicationsForSuggestedFaceType_environment___block_invoke_2;
  v36[3] = &unk_1E82E4EB0;
  v26 = v12;
  v37 = v26;
  v16 = v5;
  v38 = v16;
  v25 = v15;
  v39 = v25;
  objc_msgSend(v14, "_pas_filteredSetWithTest:", v36);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "supportedFamilies");
        v30 = v16;
        v31 = v18;
        CHSWidgetFamilyMaskEnumerateFamilies();

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v21);
  }

  return v18;
}

uint64_t __93__ATXModeFaceComplicationAppDataSource_provideComplicationsForSuggestedFaceType_environment___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleId");
}

uint64_t __93__ATXModeFaceComplicationAppDataSource_provideComplicationsForSuggestedFaceType_environment___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  objc_msgSend(v3, "extensionIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length")
    && objc_msgSend(a1[4], "containsObject:", v5)
    && (objc_msgSend(a1[5], "appLaunchCounts"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "objectForKeyedSubscript:", v5),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "uniqueDaysLaunched"),
        v7,
        v6,
        v8 >= 0xA))
  {
    v11 = objc_alloc(MEMORY[0x1E0CF9220]);
    objc_msgSend(v3, "extensionBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "kind");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithExtensionBundleId:kind:", v12, v13);

    v9 = objc_msgSend(a1[6], "containsObject:", v14);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __93__ATXModeFaceComplicationAppDataSource_provideComplicationsForSuggestedFaceType_environment___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  double v5;
  id v6;

  if (CHSWidgetFamilyIsAccessory())
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D38]), "initWithWidgetDescriptor:widgetFamily:intent:source:", *(_QWORD *)(a1 + 32), a2, 0, 4);
    objc_msgSend(v6, "setPredictionSource:", CFSTR("App"));
    objc_msgSend(v6, "containerBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXModeFaceComplicationUtilities complicationScoreForAppLaunch:environment:](ATXModeFaceComplicationUtilities, "complicationScoreForAppLaunch:environment:", v4, *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "setScore:", v5 * 0.2);

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
  }
}

- (id)provideLandscapeComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
