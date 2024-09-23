@implementation ATXModeFaceComplicationWidgetDataSource

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
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v24;
  id v25;
  id v26;
  void *v27;
  ATXSuggestedPagesWidgetAggregator *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v28 = objc_alloc_init(ATXSuggestedPagesWidgetAggregator);
  -[ATXSuggestedPagesWidgetAggregator provideWidgetsForPageType:environment:](v28, "provideWidgetsForPageType:environment:", ATXSuggestedPageTypeFromSuggestedFaceType(a3), v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v10 = objc_alloc(MEMORY[0x1E0C99E60]);
  v27 = v9;
  objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_233);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithArray:", v11);

  objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "complicationWidgetDescriptors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_alloc_init(MEMORY[0x1E0CF8E58]);
  objc_msgSend(v26, "homeScreenWidgetPersonalities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __96__ATXModeFaceComplicationWidgetDataSource_provideComplicationsForSuggestedFaceType_environment___block_invoke_2;
  v35[3] = &unk_1E82EAAC8;
  v25 = v12;
  v36 = v25;
  v24 = v15;
  v37 = v24;
  objc_msgSend(v14, "_pas_filteredSetWithTest:", v35);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "supportedFamilies");
        v29 = v5;
        v30 = v17;
        CHSWidgetFamilyMaskEnumerateFamilies();

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    }
    while (v20);
  }

  return v17;
}

uint64_t __96__ATXModeFaceComplicationWidgetDataSource_provideComplicationsForSuggestedFaceType_environment___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appBundleId");
}

uint64_t __96__ATXModeFaceComplicationWidgetDataSource_provideComplicationsForSuggestedFaceType_environment___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "extensionIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length") && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
  {
    v6 = objc_alloc(MEMORY[0x1E0CF9220]);
    objc_msgSend(v3, "extensionBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithExtensionBundleId:kind:", v7, v8);

    v10 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __96__ATXModeFaceComplicationWidgetDataSource_provideComplicationsForSuggestedFaceType_environment___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  double v5;
  id v6;

  if (CHSWidgetFamilyIsAccessory())
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D38]), "initWithWidgetDescriptor:widgetFamily:intent:source:", *(_QWORD *)(a1 + 32), a2, 0, 4);
    objc_msgSend(v6, "setPredictionSource:", CFSTR("Widget"));
    objc_msgSend(v6, "containerBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXModeFaceComplicationUtilities complicationScoreForAppLaunch:environment:](ATXModeFaceComplicationUtilities, "complicationScoreForAppLaunch:environment:", v4, *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "setScore:", v5 * 0.3);

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
  }
}

- (id)provideLandscapeComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
