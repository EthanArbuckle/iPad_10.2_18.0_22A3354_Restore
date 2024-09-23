@implementation ATXComplicationSuggestionGenerator

- (ATXComplicationSuggestionGenerator)init
{
  ATXComplicationSuggestionGenerator *v2;
  uint64_t v3;
  ATXWidgetDescriptorCache *descriptorCache;
  uint64_t v5;
  ATXComplicationSuggestionCache *complicationSuggestionCache;
  uint64_t v7;
  ATXComplicationSuggestionScorer *complicationScorer;
  uint64_t v9;
  ATXComplicationSuggestionParameters *parameters;
  uint64_t v11;
  ATXPosterConfigurationCache *posterConfigurationCache;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ATXComplicationSuggestionGenerator;
  v2 = -[ATXComplicationSuggestionGenerator init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    descriptorCache = v2->_descriptorCache;
    v2->_descriptorCache = (ATXWidgetDescriptorCache *)v3;

    v5 = objc_opt_new();
    complicationSuggestionCache = v2->_complicationSuggestionCache;
    v2->_complicationSuggestionCache = (ATXComplicationSuggestionCache *)v5;

    v7 = objc_opt_new();
    complicationScorer = v2->_complicationScorer;
    v2->_complicationScorer = (ATXComplicationSuggestionScorer *)v7;

    +[ATXComplicationSuggestionParameters sharedInstance](ATXComplicationSuggestionParameters, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    parameters = v2->_parameters;
    v2->_parameters = (ATXComplicationSuggestionParameters *)v9;

    +[ATXPosterConfigurationCache sharedInstance](ATXPosterConfigurationCache, "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    posterConfigurationCache = v2->_posterConfigurationCache;
    v2->_posterConfigurationCache = (ATXPosterConfigurationCache *)v11;

  }
  return v2;
}

- (void)refreshComplicationCache
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Could not load accessory widget descriptors for complication refresh: %@", a5, a6, a7, a8, 2u);
}

- (id)_recentsSet_unusedComplications:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[ATXComplicationSuggestionGenerator _recentsComplications_unusedComplications:](self, "_recentsComplications_unusedComplications:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setSource:", 1);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D40]), "initWithComplications:", v4);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_recentsComplications_unusedComplications:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  void *v39;
  void *v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[5];
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  -[ATXWidgetDescriptorCache modularComplicationWidgetDescriptors](self->_descriptorCache, "modularComplicationWidgetDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_pas_mappedSetWithTransform:", &__block_literal_global_105);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterConfigurationCache configurations](self->_posterConfigurationCache, "configurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXLockscreenBlacklist appsLockedOrHiddenByAppProtection](ATXLockscreenBlacklist, "appsLockedOrHiddenByAppProtection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
  v40 = v4;
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v64;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v64 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v11);
      if (objc_msgSend(v12, "isSelected"))
      {
        objc_msgSend(v12, "complications");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[ATXComplicationSuggestionGenerator _layoutIsValidGivenComplications:allowedComplicationPersonalities:](self, "_layoutIsValidGivenComplications:allowedComplicationPersonalities:", v13, v46))
        {
          v61[0] = MEMORY[0x1E0C809B0];
          v61[1] = 3221225472;
          v61[2] = __80__ATXComplicationSuggestionGenerator__recentsComplications_unusedComplications___block_invoke_2;
          v61[3] = &unk_1E82E38C0;
          v61[4] = self;
          v62 = v6;
          objc_msgSend(v13, "_pas_mappedArrayWithTransform:", v61);
          v14 = objc_claimAutoreleasedReturnValue();

          if (v14)
            goto LABEL_26;
          goto LABEL_13;
        }

      }
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

LABEL_13:
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v58;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v58 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        if ((objc_msgSend(v20, "isSelected") & 1) == 0)
        {
          objc_msgSend(v20, "complications");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[ATXComplicationSuggestionGenerator _layoutIsValidGivenComplications:allowedComplicationPersonalities:](self, "_layoutIsValidGivenComplications:allowedComplicationPersonalities:", v21, v46))
          {
            v55[0] = MEMORY[0x1E0C809B0];
            v55[1] = 3221225472;
            v55[2] = __80__ATXComplicationSuggestionGenerator__recentsComplications_unusedComplications___block_invoke_3;
            v55[3] = &unk_1E82E38C0;
            v55[4] = self;
            v56 = v6;
            objc_msgSend(v21, "_pas_mappedArrayWithTransform:", v55);
            v14 = objc_claimAutoreleasedReturnValue();

            goto LABEL_25;
          }

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
      if (v17)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_25:

LABEL_26:
  v39 = v6;
  v22 = objc_alloc(MEMORY[0x1E0C99E60]);
  v38 = (id)v14;
  if (v14)
    v23 = v14;
  else
    v23 = MEMORY[0x1E0C9AA60];
  v24 = (void *)objc_msgSend(v22, "initWithArray:", v23);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v7;
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
  if (v43)
  {
    v42 = *(_QWORD *)v52;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v52 != v42)
          objc_enumerationMutation(obj);
        v44 = v25;
        v26 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v25);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        objc_msgSend(v26, "complications");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v67, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v48;
          do
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v48 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
              v33 = objc_alloc(MEMORY[0x1E0CF9220]);
              objc_msgSend(v32, "extensionBundleIdentifier");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "kind");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = (void *)objc_msgSend(v33, "initWithExtensionBundleId:kind:", v34, v35);

              if ((objc_msgSend(v24, "containsObject:", v32) & 1) == 0
                && objc_msgSend(v46, "containsObject:", v36))
              {
                objc_msgSend(v45, "addObject:", v32);
              }

            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v67, 16);
          }
          while (v29);
        }

        v25 = v44 + 1;
      }
      while (v44 + 1 != v43);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
    }
    while (v43);
  }

  return v38;
}

id __80__ATXComplicationSuggestionGenerator__recentsComplications_unusedComplications___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x1E0CF9220];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v4, "initWithExtensionBundleId:kind:", v5, v6);
  return v7;
}

id __80__ATXComplicationSuggestionGenerator__recentsComplications_unusedComplications___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldAddComplication:andFilterFromAppsDisabledByAppProtection:", v3, *(_QWORD *)(a1 + 40)))v4 = (void *)objc_msgSend(v3, "copy");
  else
    v4 = 0;

  return v4;
}

id __80__ATXComplicationSuggestionGenerator__recentsComplications_unusedComplications___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldAddComplication:andFilterFromAppsDisabledByAppProtection:", v3, *(_QWORD *)(a1 + 40)))v4 = (void *)objc_msgSend(v3, "copy");
  else
    v4 = 0;

  return v4;
}

- (id)_recentInlineComplications
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  id v18;
  ATXComplicationSuggestionGenerator *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v18 = (id)objc_opt_new();
  v22 = (void *)objc_opt_new();
  -[ATXWidgetDescriptorCache inlineComplicationWidgetDescriptors](self->_descriptorCache, "inlineComplicationWidgetDescriptors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_pas_mappedSetWithTransform:", &__block_literal_global_21_1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = self;
  -[ATXPosterConfigurationCache configurations](self->_posterConfigurationCache, "configurations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXLockscreenBlacklist appsLockedOrHiddenByAppProtection](ATXLockscreenBlacklist, "appsLockedOrHiddenByAppProtection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v9, "inlineComplication");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "copy");

        v12 = objc_alloc(MEMORY[0x1E0CF9220]);
        objc_msgSend(v11, "extensionBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "kind");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v12, "initWithExtensionBundleId:kind:", v13, v14);

        if (v11
          && (objc_msgSend(v22, "containsObject:", v11) & 1) == 0
          && objc_msgSend(v21, "containsObject:", v15)
          && -[ATXComplicationSuggestionGenerator _shouldAddComplication:andFilterFromAppsDisabledByAppProtection:](v19, "_shouldAddComplication:andFilterFromAppsDisabledByAppProtection:", v11, v20))
        {
          if (objc_msgSend(v9, "isSelected"))
            objc_msgSend(v18, "insertObject:atIndex:", v11, 0);
          else
            objc_msgSend(v18, "addObject:", v11);
          objc_msgSend(v11, "setSource:", 1);
          objc_msgSend(v22, "addObject:", v11);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  return v18;
}

id __64__ATXComplicationSuggestionGenerator__recentInlineComplications__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x1E0CF9220];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v4, "initWithExtensionBundleId:kind:", v5, v6);
  return v7;
}

- (id)_recentLandscapeComplicationsWithPresetDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[16];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v45 = *MEMORY[0x1E0CF89E8];
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "complications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v52 = v8;

  v44 = *MEMORY[0x1E0CF89F0];
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "complications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_opt_new();
  v51 = v13;

  v43 = *MEMORY[0x1E0CF89F8];
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "complications");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");
  v17 = v16;
  if (v16)
    v18 = v16;
  else
    v18 = (id)objc_opt_new();
  v50 = v18;

  v19 = (void *)objc_opt_new();
  -[ATXWidgetDescriptorCache landscapeModularComplicationWidgetDescriptors](self->_descriptorCache, "landscapeModularComplicationWidgetDescriptors");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "_pas_mappedSetWithTransform:", &__block_literal_global_22_0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterConfigurationCache configurations](self->_posterConfigurationCache, "configurations");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXLockscreenBlacklist appsLockedOrHiddenByAppProtection](ATXLockscreenBlacklist, "appsLockedOrHiddenByAppProtection");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v20;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
  if (v48)
  {
    v47 = *(_QWORD *)v62;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v62 != v47)
          objc_enumerationMutation(obj);
        v49 = v21;
        v22 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v21);
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v53 = v22;
        objc_msgSend(v22, "landscapeComplications");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v58;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v58 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
              objc_msgSend(v28, "setSource:", 1);
              v29 = objc_alloc(MEMORY[0x1E0CF9220]);
              objc_msgSend(v28, "extensionBundleIdentifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "kind");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = (void *)objc_msgSend(v29, "initWithExtensionBundleId:kind:", v30, v31);

              if (v28
                && (objc_msgSend(v19, "containsObject:", v28) & 1) == 0
                && objc_msgSend(v56, "containsObject:", v32)
                && -[ATXComplicationSuggestionGenerator _shouldAddComplication:andFilterFromAppsDisabledByAppProtection:](self, "_shouldAddComplication:andFilterFromAppsDisabledByAppProtection:", v28, v54))
              {
                v33 = objc_msgSend(v28, "widgetFamily");
                if (v33 == 1)
                {
                  if (!objc_msgSend(v53, "isSelected"))
                  {
                    v37 = v50;
                    goto LABEL_40;
                  }
                  v35 = v50;
                }
                else
                {
                  v34 = v33;
                  if (v33 != 11)
                  {
                    if (v33 == 10)
                    {
                      if (objc_msgSend(v53, "isSelected"))
                      {
                        v35 = v52;
                        goto LABEL_33;
                      }
                      v37 = v52;
LABEL_40:
                      objc_msgSend(v37, "addObject:", v28);
                    }
                    else
                    {
                      __atxlog_handle_lock_screen();
                      v36 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                        -[ATXComplicationSuggestionGenerator _recentLandscapeComplicationsWithPresetDictionary:].cold.1((uint64_t)v65, v34);

                    }
LABEL_41:
                    objc_msgSend(v19, "addObject:", v28);
                    goto LABEL_42;
                  }
                  if (!objc_msgSend(v53, "isSelected"))
                  {
                    v37 = v51;
                    goto LABEL_40;
                  }
                  v35 = v51;
                }
LABEL_33:
                objc_msgSend(v35, "insertObject:atIndex:", v28, 0);
                goto LABEL_41;
              }
LABEL_42:

            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
          }
          while (v25);
        }

        v21 = v49 + 1;
      }
      while (v49 + 1 != v48);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    }
    while (v48);
  }

  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D40]), "initWithComplications:", v50);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, v43);

  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D40]), "initWithComplications:", v51);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, v44);

  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D40]), "initWithComplications:", v52);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, v45);

  return v3;
}

id __88__ATXComplicationSuggestionGenerator__recentLandscapeComplicationsWithPresetDictionary___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x1E0CF9220];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v4, "initWithExtensionBundleId:kind:", v5, v6);
  return v7;
}

- (id)modularSetsWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[ATXComplicationSuggestionParameters alwaysUseFallbackSets](self->_parameters, "alwaysUseFallbackSets"))
  {
    -[ATXComplicationSuggestionGenerator _modularFallbackSets](self, "_modularFallbackSets");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_new();
    v13 = (void *)objc_opt_new();
    -[ATXComplicationSuggestionGenerator _recentsSet_unusedComplications:](self, "_recentsSet_unusedComplications:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v8;
    if (v14)
    {
      objc_msgSend(v27, "addObject:", v14);
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      objc_msgSend(v14, "complications");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v31;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v31 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(v12, "addObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v19++), v27);
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        }
        while (v17);
      }

      v8 = v29;
    }
    -[ATXComplicationSuggestionGenerator _modularLayoutTypesGivenRecentsLayoutType:](self, "_modularLayoutTypesGivenRecentsLayoutType:", -[ATXComplicationSuggestionGenerator _layoutTypeForSet:](self, "_layoutTypeForSet:", v14, v27));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXComplicationSuggestionGenerator modularSetsWithDesiredLayouts:unusedRecentComplications:alreadyAddedComplications:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:](self, "modularSetsWithDesiredLayouts:unusedRecentComplications:alreadyAddedComplications:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:", v20, v13, v12, v8, v9, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");
    __atxlog_handle_lock_screen();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (v24)
      {
        *(_DWORD *)buf = 138412290;
        v35 = v21;
        _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEFAULT, "Received modular sets: %@. Returning.", buf, 0xCu);
      }

      v25 = v28;
      objc_msgSend(v28, "addObjectsFromArray:", v21);
      v11 = v28;
    }
    else
    {
      if (v24)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEFAULT, "No modular sets receiving. Returning fallback sets.", buf, 2u);
      }

      -[ATXComplicationSuggestionGenerator _modularFallbackSets](self, "_modularFallbackSets");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v25 = v28;
    }

    v8 = v29;
  }

  return v11;
}

- (id)modularSetsWithDesiredLayouts:(id)a3 unusedRecentComplications:(id)a4 alreadyAddedComplications:(id)a5 widgetDescriptorsAdditionalData:(id)a6 aggregatedAppLaunchData:(id)a7 bundleIdToCompanionBundleId:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  -[ATXComplicationSuggestionGenerator _modularDescriptors_ShouldRefresh:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:](self, "_modularDescriptors_ShouldRefresh:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:", 0, a6, a7, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_opt_new();
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXComplicationSuggestionGenerator _setWithDesiredLayout:complicationDescriptors:unusedRecentsComplications:alreadyAddedComplications:](self, "_setWithDesiredLayout:complicationDescriptors:unusedRecentsComplications:alreadyAddedComplications:", objc_msgSend(v19, "longValue"), v17, v15, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    __atxlog_handle_lock_screen();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v20;
      _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "Set 1 complications: %@", buf, 0xCu);
    }

    if (objc_msgSend(v20, "count"))
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D40]), "initWithComplications:", v20);
      objc_msgSend(v18, "addObject:", v22);
      if ((unint64_t)objc_msgSend(v14, "count") > 1)
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXComplicationSuggestionGenerator _setWithDesiredLayout:complicationDescriptors:unusedRecentsComplications:alreadyAddedComplications:](self, "_setWithDesiredLayout:complicationDescriptors:unusedRecentsComplications:alreadyAddedComplications:", objc_msgSend(v24, "longValue"), v17, v15, v16);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        __atxlog_handle_lock_screen();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v25;
          _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEFAULT, "Set 2 complications: %@", buf, 0xCu);
        }

        if (objc_msgSend(v25, "count"))
        {
          v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D40]), "initWithComplications:", v25);
          objc_msgSend(v18, "addObject:", v27);
          if ((unint64_t)objc_msgSend(v14, "count") > 2)
          {
            v34 = v27;
            objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[ATXComplicationSuggestionGenerator _setWithDesiredLayout:complicationDescriptors:unusedRecentsComplications:alreadyAddedComplications:](self, "_setWithDesiredLayout:complicationDescriptors:unusedRecentsComplications:alreadyAddedComplications:", objc_msgSend(v28, "longValue"), v17, v15, v16);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            __atxlog_handle_lock_screen();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v25;
              _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_DEFAULT, "Set 3 complications: %@", buf, 0xCu);
            }

            if (objc_msgSend(v35, "count"))
            {
              v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D40]), "initWithComplications:", v35);
              objc_msgSend(v18, "addObject:");
              v27 = v34;
              if ((unint64_t)objc_msgSend(v14, "count") >= 4)
              {
                __atxlog_handle_lock_screen();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  -[ATXComplicationSuggestionGenerator modularSetsWithDesiredLayouts:unusedRecentComplications:alreadyAddedComplications:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:].cold.1(v30);

              }
              v23 = v18;
            }
            else
            {
              __atxlog_handle_lock_screen();
              v31 = objc_claimAutoreleasedReturnValue();
              v27 = v34;
              v33 = v31;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_DEFAULT, "Showing fallback sets since we couldn't fill Set 3", buf, 2u);
              }
              v23 = 0;
            }

          }
          else
          {
            v23 = v18;
          }
        }
        else
        {
          __atxlog_handle_lock_screen();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C9A3B000, v27, OS_LOG_TYPE_DEFAULT, "Showing fallback sets since we couldn't fill Set 2", buf, 2u);
          }
          v23 = 0;
        }

      }
      else
      {
        v23 = v18;
      }
    }
    else
    {
      __atxlog_handle_lock_screen();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "Showing fallback sets since we couldn't fill Set 1", buf, 2u);
      }
      v23 = 0;
    }

  }
  else
  {
    v23 = v18;
  }

  return v23;
}

- (id)_modularDescriptors_ShouldRefresh:(BOOL)a3 widgetDescriptorsAdditionalData:(id)a4 aggregatedAppLaunchData:(id)a5 bundleIdToCompanionBundleId:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint8_t v19[16];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[ATXComplicationSuggestionCache fetchModularSetComplicationDescriptors](self->_complicationSuggestionCache, "fetchModularSetComplicationDescriptors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a3 || !objc_msgSend(v13, "count"))
  {
    -[ATXWidgetDescriptorCache modularComplicationWidgetDescriptors](self->_descriptorCache, "modularComplicationWidgetDescriptors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXComplicationSuggestionScorer complicationDescriptorsForModularSetGivenComplicationDescriptors:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:](self->_complicationScorer, "complicationDescriptorsForModularSetGivenComplicationDescriptors:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:", v16, v10, v11, v12);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!-[ATXComplicationSuggestionCache writeComplicationsModularSetCache:](self->_complicationSuggestionCache, "writeComplicationsModularSetCache:", v15))
    {
      __atxlog_handle_lock_screen();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "Error while writing complication cache for set 2", v19, 2u);
      }

    }
  }
  else
  {
    v15 = v14;
  }

  return v15;
}

- (id)_scoredModularComplicationDescriptorsWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5
{
  ATXWidgetDescriptorCache *descriptorCache;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  descriptorCache = self->_descriptorCache;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[ATXWidgetDescriptorCache modularComplicationWidgetDescriptors](descriptorCache, "modularComplicationWidgetDescriptors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXComplicationSuggestionScorer scoredComplicationDescriptorsForModularSetGivenComplicationDescriptors:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:checkEligibility:](self->_complicationScorer, "scoredComplicationDescriptorsForModularSetGivenComplicationDescriptors:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:checkEligibility:", v12, v11, v10, v9, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)landscapeModularSetsDictsWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5 portraitSets:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v12;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(obj);
        -[ATXComplicationSuggestionGenerator _presetLandscapeComplicationsFromPortraitSet:](self, "_presetLandscapeComplicationsFromPortraitSet:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v17));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "mutableCopy");
        -[ATXComplicationSuggestionGenerator landscapeModularSetsWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:presetPortraitComplications:](self, "landscapeModularSetsWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:presetPortraitComplications:", v23, v10, v11, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "addObject:", v20);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v15);
  }

  return v13;
}

- (id)landscapeModularSetsWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5
{
  return -[ATXComplicationSuggestionGenerator landscapeModularSetsWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:presetPortraitComplications:](self, "landscapeModularSetsWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:presetPortraitComplications:", a3, a4, a5, 0);
}

- (id)landscapeModularSetsWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5 presetPortraitComplications:(id)a6
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1CAA48B6C]();
  if (!-[ATXComplicationSuggestionParameters alwaysUseFallbackSets](self->_parameters, "alwaysUseFallbackSets"))
  {
    v16 = (void *)objc_opt_new();
    -[ATXComplicationSuggestionGenerator _landscapeModularSetDescriptors_ShouldRefresh:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:](self, "_landscapeModularSetDescriptors_ShouldRefresh:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:", 0, v10, v11, v12);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_opt_new();
    v49 = v11;
    v50 = v10;
    v47 = v13;
    v48 = v12;
    v46 = v14;
    if (v13)
    {
      -[ATXComplicationSuggestionGenerator _recentLandscapeComplicationsWithPresetDictionary:](self, "_recentLandscapeComplicationsWithPresetDictionary:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = (void *)objc_opt_new();
      -[ATXComplicationSuggestionGenerator _recentLandscapeComplicationsWithPresetDictionary:](self, "_recentLandscapeComplicationsWithPresetDictionary:", v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v19 = objc_alloc(MEMORY[0x1E0CF8D40]);
    v20 = *MEMORY[0x1E0CF89F8];
    v51 = *MEMORY[0x1E0CF89F8];
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CF89F8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "complications");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXComplicationSuggestionGenerator _getComplicationsOfFamily:descriptors:alreadyAddedDescriptors:presetComplications:limit:](self, "_getComplicationsOfFamily:descriptors:alreadyAddedDescriptors:presetComplications:limit:", 1, v53, v52, v22, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v19, "initWithComplications:", v23);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, v20);

    v25 = objc_alloc(MEMORY[0x1E0CF8D40]);
    v26 = *MEMORY[0x1E0CF89F0];
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CF89F0]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "complications");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXComplicationSuggestionGenerator _getComplicationsOfFamily:descriptors:alreadyAddedDescriptors:presetComplications:limit:](self, "_getComplicationsOfFamily:descriptors:alreadyAddedDescriptors:presetComplications:limit:", 11, v53, v52, v28, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v25, "initWithComplications:", v29);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v30, v26);

    v31 = objc_alloc(MEMORY[0x1E0CF8D40]);
    v32 = *MEMORY[0x1E0CF89E8];
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CF89E8]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "complications");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXComplicationSuggestionGenerator _getComplicationsOfFamily:descriptors:alreadyAddedDescriptors:presetComplications:limit:](self, "_getComplicationsOfFamily:descriptors:alreadyAddedDescriptors:presetComplications:limit:", 10, v53, v52, v34, 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v31, "initWithComplications:", v35);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v36, v32);

    objc_msgSend(v16, "objectForKeyedSubscript:", v51);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "complications");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "count") == 2)
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", v26);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "complications");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v40, "count") == 2)
      {
        objc_msgSend(v16, "objectForKeyedSubscript:", v32);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "complications");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "count");

        v11 = v49;
        v10 = v50;
        v13 = v47;
        v12 = v48;
        v14 = v46;
        if (v43 == 4)
        {
          v44 = objc_msgSend(v16, "copy");
LABEL_13:
          v15 = (void *)v44;

          goto LABEL_14;
        }
LABEL_12:
        -[ATXComplicationSuggestionGenerator _landscapeModularFallbackSets](self, "_landscapeModularFallbackSets");
        v44 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }

    }
    v11 = v49;
    v10 = v50;
    v13 = v47;
    v12 = v48;
    v14 = v46;
    goto LABEL_12;
  }
  -[ATXComplicationSuggestionGenerator _landscapeModularFallbackSets](self, "_landscapeModularFallbackSets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
  objc_autoreleasePoolPop(v14);

  return v15;
}

- (id)_landscapeModularSetDescriptors_ShouldRefresh:(BOOL)a3 widgetDescriptorsAdditionalData:(id)a4 aggregatedAppLaunchData:(id)a5 bundleIdToCompanionBundleId:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint8_t v19[16];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[ATXComplicationSuggestionCache fetchLandscapeModularSetComplicationDescriptors](self->_complicationSuggestionCache, "fetchLandscapeModularSetComplicationDescriptors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a3 || !objc_msgSend(v13, "count"))
  {
    -[ATXWidgetDescriptorCache landscapeModularComplicationWidgetDescriptors](self->_descriptorCache, "landscapeModularComplicationWidgetDescriptors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXComplicationSuggestionScorer complicationDescriptorsForModularSetGivenComplicationDescriptors:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:](self->_complicationScorer, "complicationDescriptorsForModularSetGivenComplicationDescriptors:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:", v16, v10, v11, v12);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!-[ATXComplicationSuggestionCache writeComplicationsInlineSetCache:](self->_complicationSuggestionCache, "writeComplicationsInlineSetCache:", v15))
    {
      __atxlog_handle_lock_screen();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "Error while writing complication cache for inline set", v19, 2u);
      }

    }
  }
  else
  {
    v15 = v14;
  }

  return v15;
}

- (id)_getComplicationsOfFamily:(int64_t)a3 descriptors:(id)a4 alreadyAddedDescriptors:(id)a5 presetComplications:(id)a6 limit:(unint64_t)a7
{
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  NSObject *v31;
  void *v32;
  id v34;
  id v35;
  void *v36;
  void *v38;
  id obj;
  void *v40;
  uint8_t buf[16];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v34 = a4;
  v11 = a5;
  v12 = a6;
  v36 = (void *)objc_opt_new();
  v40 = (void *)objc_opt_new();
  +[ATXLockscreenBlacklist appsLockedOrHiddenByAppProtection](ATXLockscreenBlacklist, "appsLockedOrHiddenByAppProtection");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v47;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v47 != v15)
        objc_enumerationMutation(obj);
      if (!a7)
        goto LABEL_20;
      v17 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v16);
      objc_msgSend(v17, "widgetDescriptor", v34);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "containsObject:", v18) & 1) == 0)
        break;
LABEL_18:

      if (v14 == ++v16)
      {
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        if (v14)
          goto LABEL_3;
        goto LABEL_20;
      }
    }
    objc_msgSend(v17, "containerBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19
      || (objc_msgSend(v17, "extensionBundleIdentifier"), (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      if ((objc_msgSend(v40, "containsObject:", v19) & 1) != 0)
      {
LABEL_17:

        goto LABEL_18;
      }
      v20 = 0;
    }
    else
    {
      v20 = 1;
    }
    if (-[ATXComplicationSuggestionGenerator _shouldAddComplication:andFilterFromAppsDisabledByAppProtection:](self, "_shouldAddComplication:andFilterFromAppsDisabledByAppProtection:", v17, v38))
    {
      objc_msgSend(v36, "addObject:", v17);
      objc_msgSend(v11, "addObject:", v18);
      if ((v20 & 1) == 0)
        objc_msgSend(v40, "addObject:", v19);
      --a7;
    }
    goto LABEL_17;
  }
LABEL_20:

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v21 = v34;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v43;
    v35 = v21;
LABEL_22:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v24)
        objc_enumerationMutation(v21);
      if (!a7)
        goto LABEL_44;
      v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v25);
      if ((objc_msgSend(v11, "containsObject:", v26) & 1) == 0)
        break;
LABEL_42:
      if (v23 == ++v25)
      {
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        if (v23)
          goto LABEL_22;
        goto LABEL_44;
      }
    }
    objc_msgSend(v26, "extensionIdentity");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "containerBundleIdentifier");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)v28;

    }
    else
    {
      objc_msgSend(v26, "extensionBundleIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        v30 = 1;
        goto LABEL_33;
      }
    }
    if ((objc_msgSend(v40, "containsObject:", v29, v35) & 1) != 0)
    {
LABEL_41:

      goto LABEL_42;
    }
    v30 = 0;
LABEL_33:
    objc_msgSend(v26, "disfavoredFamiliesForLocation:", 1, v35);
    objc_msgSend(v26, "supportedFamilies");
    if (CHSWidgetFamilyMaskContainsFamily() && (CHSWidgetFamilyMaskContainsFamily() & 1) == 0)
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D38]), "initWithWidgetDescriptor:widgetFamily:intent:source:", v26, a3, 0, 2);
      objc_msgSend(v36, "addObject:", v31);
      objc_msgSend(v11, "addObject:", v26);
      if ((v30 & 1) == 0)
        objc_msgSend(v40, "addObject:", v29);
      --a7;
      v21 = v35;
    }
    else
    {
      __atxlog_handle_lock_screen();
      v31 = objc_claimAutoreleasedReturnValue();
      v21 = v35;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_DEFAULT, "Incorrect complication descriptor received", buf, 2u);
      }
    }

    goto LABEL_41;
  }
LABEL_44:

  v32 = (void *)objc_msgSend(v36, "copy");
  return v32;
}

- (id)_presetLandscapeComplicationsFromPortraitSet:(id)a3
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
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[16];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v22 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v21 = v3;
  objc_msgSend(v3, "complications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "widgetFamily");
        if (v13 == 1)
        {
          v15 = v6;
          goto LABEL_12;
        }
        v14 = v13;
        if (v13 == 11)
        {
          v15 = v5;
          goto LABEL_12;
        }
        if (v13 == 10)
        {
          v15 = v4;
LABEL_12:
          objc_msgSend(v15, "addObject:", v12);
          continue;
        }
        __atxlog_handle_lock_screen();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[ATXComplicationSuggestionGenerator _recentLandscapeComplicationsWithPresetDictionary:].cold.1((uint64_t)v27, v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D40]), "initWithComplications:", v6);
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CF89F8]);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D40]), "initWithComplications:", v5);
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0CF89F0]);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D40]), "initWithComplications:", v4);
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0CF89E8]);

  return v22;
}

- (ATXComplicationSet)inlineSet
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  NSObject *v31;
  void *v32;
  void *v34;
  void *v35;
  ATXComplicationSuggestionGenerator *v36;
  void *v37;
  id obj;
  uint8_t buf[16];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  +[ATXLockscreenBlacklist appsLockedOrHiddenByAppProtection](ATXLockscreenBlacklist, "appsLockedOrHiddenByAppProtection");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v36 = self;
  -[ATXComplicationSuggestionGenerator _recentInlineComplications](self, "_recentInlineComplications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "count");
    if (v6 >= 3)
      v7 = 3;
    else
      v7 = v6;
    objc_msgSend(v5, "subarrayWithRange:", 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mutableCopy");

    v3 = (void *)v9;
  }
  v10 = objc_msgSend(v3, "count");
  if (v10 != 3)
  {
    v11 = v10;
    v34 = v5;
    v12 = (void *)objc_opt_new();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v35 = v3;
    v13 = v3;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v45 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v18, "containerBundleIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v18, "containerBundleIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v20);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v15);
    }

    -[ATXComplicationSuggestionGenerator _inlineSetDescriptors_ShouldRefresh:](v36, "_inlineSetDescriptors_ShouldRefresh:", 0);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v21)
    {
      v22 = v21;
      v23 = 3 - v11;
      v24 = *(_QWORD *)v41;
LABEL_18:
      v25 = 0;
      while (1)
      {
        if (*(_QWORD *)v41 != v24)
          objc_enumerationMutation(obj);
        if (!v23)
          break;
        v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v25);
        objc_msgSend(v26, "extensionIdentity");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "containerBundleIdentifier");
        v28 = objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v29 = (void *)v28;

        }
        else
        {
          objc_msgSend(v26, "extensionBundleIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v29)
          {
            v30 = 1;
LABEL_28:
            objc_msgSend(v26, "disfavoredFamiliesForLocation:", 1);
            objc_msgSend(v26, "supportedFamilies");
            if (CHSWidgetFamilyMaskContainsFamily() && (CHSWidgetFamilyMaskContainsFamily() & 1) == 0)
            {
              v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D38]), "initWithWidgetDescriptor:widgetFamily:intent:source:", v26, 12, 0, 2);
              if (-[ATXComplicationSuggestionGenerator _shouldAddComplication:andFilterFromAppsDisabledByAppProtection:](v36, "_shouldAddComplication:andFilterFromAppsDisabledByAppProtection:", v31, v37))
              {
                objc_msgSend(v13, "addObject:", v31);
                if ((v30 & 1) == 0)
                  objc_msgSend(v12, "addObject:", v29);
                --v23;
              }
            }
            else
            {
              __atxlog_handle_lock_screen();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_DEFAULT, "Non inline complication descriptor received", buf, 2u);
              }
            }

            goto LABEL_37;
          }
        }
        if ((objc_msgSend(v12, "containsObject:", v29) & 1) == 0)
        {
          v30 = 0;
          goto LABEL_28;
        }
LABEL_37:

        if (v22 == ++v25)
        {
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          if (v22)
            goto LABEL_18;
          break;
        }
      }
    }

    v5 = v34;
    v3 = v35;
  }
  if (v3)
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D40]), "initWithComplications:", v3);
  else
    v32 = 0;

  return (ATXComplicationSet *)v32;
}

- (id)_inlineSetDescriptors_ShouldRefresh:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];

  -[ATXComplicationSuggestionCache fetchInlineSetComplicationDescriptors](self->_complicationSuggestionCache, "fetchInlineSetComplicationDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 || !objc_msgSend(v5, "count"))
  {
    -[ATXWidgetDescriptorCache inlineComplicationWidgetDescriptors](self->_descriptorCache, "inlineComplicationWidgetDescriptors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXComplicationSuggestionScorer complicationDescriptorsForInlineSetGivenComplicationDescriptors:](self->_complicationScorer, "complicationDescriptorsForInlineSetGivenComplicationDescriptors:", v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!-[ATXComplicationSuggestionCache writeComplicationsInlineSetCache:](self->_complicationSuggestionCache, "writeComplicationsInlineSetCache:", v7))
    {
      __atxlog_handle_lock_screen();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Error while writing complication cache for inline set", v11, 2u);
      }

    }
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (id)_scoredInlineComplicationDescriptors
{
  void *v3;
  void *v4;

  -[ATXWidgetDescriptorCache inlineComplicationWidgetDescriptors](self->_descriptorCache, "inlineComplicationWidgetDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXComplicationSuggestionScorer scoredComplicationDescriptorsForInlineSetGivenComplicationDescriptors:](self->_complicationScorer, "scoredComplicationDescriptorsForInlineSetGivenComplicationDescriptors:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)scoredComplicationsDescription
{
  void *v3;
  ATXWidgetDescriptorCache *descriptorCache;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendString:", CFSTR("Modular Set Scores:\n"));
  descriptorCache = self->_descriptorCache;
  v24 = 0;
  -[ATXWidgetDescriptorCache fetchAccessoryWidgetDescriptorMetadataWithError:](descriptorCache, "fetchAccessoryWidgetDescriptorMetadataWithError:", &v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v24;
  v7 = v5;
  if (!v5)
  {
    __atxlog_handle_lock_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXComplicationSuggestionGenerator scoredComplicationsDescription].cold.1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

    v7 = (void *)MEMORY[0x1E0C9AA70];
  }
  v15 = objc_alloc_init(MEMORY[0x1E0CF8CB8]);
  objc_msgSend(v15, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXCompanionBundleIdMapper generateMappingForAppBundleIds:](_TtC21AppPredictionInternal26ATXCompanionBundleIdMapper, "generateMappingForAppBundleIds:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXComplicationSuggestionGenerator _scoredModularComplicationDescriptorsWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:](self, "_scoredModularComplicationDescriptorsWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:", v7, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXComplicationSuggestionGenerator descriptionForScoredSet:](self, "descriptionForScoredSet:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendString:", v20);
  objc_msgSend(v3, "appendString:", CFSTR("\nInline Set Scores:\n"));
  -[ATXComplicationSuggestionGenerator _scoredInlineComplicationDescriptors](self, "_scoredInlineComplicationDescriptors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXComplicationSuggestionGenerator descriptionForScoredSet:](self, "descriptionForScoredSet:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendString:", v22);
  return v3;
}

- (id)inputDescriptionForComplicationSuggestionSignal:(id)a3
{
  ATXWidgetDescriptorCache *descriptorCache;
  id v5;
  void *v6;
  void *v7;

  descriptorCache = self->_descriptorCache;
  v5 = a3;
  -[ATXWidgetDescriptorCache complicationWidgetDescriptors](descriptorCache, "complicationWidgetDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXComplicationSuggestionScorer inputDescriptionForSignal:complicationDescriptors:](self->_complicationScorer, "inputDescriptionForSignal:complicationDescriptors:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)modelDescription
{
  return -[ATXComplicationSuggestionScorer modelDescription](self->_complicationScorer, "modelDescription");
}

- (id)descriptionForScoredSet:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id obj;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v27 = v3;
  objc_msgSend(v3, "keysSortedByValueUsingComparator:", &__block_literal_global_31_1);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    v8 = &unk_1E83CC9A0;
    v24 = v4;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v27, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v8);

        if ((v12 & 1) == 0)
        {
          v13 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v10, "extensionIdentity");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "containerBundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "extensionBundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "kind");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "supportedFamilies");
          CHSWidgetFamilyMaskDescription();
          v17 = v6;
          v18 = v8;
          v19 = v7;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", v10);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("\nContainer: %@\nExtension: %@\nKind: %@\nFamilies:%@\nScore: %@\n"), v14, v15, v16, v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v7 = v19;
          v8 = v18;
          v6 = v17;

          v4 = v24;
          objc_msgSend(v24, "appendString:", v22);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v6);
  }
  objc_msgSend(v4, "appendString:", CFSTR("--------------------------------------------"));

  return v4;
}

uint64_t __62__ATXComplicationSuggestionGenerator_descriptionForScoredSet___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (int64_t)_layoutTypeForSet:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v17 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v3, "complications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_msgSend(v4, "complications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 != 4)
  {
    v18 = objc_msgSend(v7, "count");

    objc_msgSend(v4, "complications");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v19;
    if (v18 == 3)
    {
      objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "widgetFamily") == 11)
      {
        objc_msgSend(v4, "complications");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "widgetFamily") == 10)
        {
          objc_msgSend(v4, "complications");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "widgetFamily");

          if (v22 == 10)
          {
            v17 = 3;
            goto LABEL_22;
          }
LABEL_21:
          v17 = 4;
          goto LABEL_22;
        }
        goto LABEL_19;
      }
    }
    else
    {
      v23 = objc_msgSend(v19, "count");

      if (v23 != 2)
        goto LABEL_21;
      objc_msgSend(v4, "complications");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "widgetFamily") == 11)
      {
        objc_msgSend(v4, "complications");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 1;
        objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "widgetFamily");

        if (v26 == 11)
          goto LABEL_22;
        goto LABEL_21;
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "widgetFamily") != 10)
    goto LABEL_20;
  objc_msgSend(v4, "complications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "widgetFamily") != 10)
  {
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend(v4, "complications");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "widgetFamily") != 10)
  {

    goto LABEL_19;
  }
  objc_msgSend(v4, "complications");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "widgetFamily");

  if (v16 != 10)
    goto LABEL_21;
  v17 = 2;
LABEL_22:

  return v17;
}

- (id)_modularLayoutTypesGivenRecentsLayoutType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return &unk_1E83CFB48;
  else
    return (id)qword_1E82E3940[a3];
}

- (id)_modularFallbackSets
{
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
  void *v21;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[ATXWidgetDescriptorCache landscapeModularComplicationWidgetDescriptors](self->_descriptorCache, "landscapeModularComplicationWidgetDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  +[ATXLockscreenBlacklist appsLockedOrHiddenByAppProtection](ATXLockscreenBlacklist, "appsLockedOrHiddenByAppProtection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXComplicationSuggestionParameters fallbackSetsForSet1](self->_parameters, "fallbackSetsForSet1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v7, "count")));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXComplicationSuggestionGenerator _complicationsFromFallbackSet:complicationDescriptors:alreadyAddedDescriptors:andFilterFromAppsDisabledByAppProtection:](self, "_complicationsFromFallbackSet:complicationDescriptors:alreadyAddedDescriptors:andFilterFromAppsDisabledByAppProtection:", v9, v4, v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D40]), "initWithComplications:", v10);
      objc_msgSend(v3, "addObject:", v11);

    }
  }

  -[ATXComplicationSuggestionParameters fallbackSetsForSet2](self->_parameters, "fallbackSetsForSet2");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v12, "count")));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXComplicationSuggestionGenerator _complicationsFromFallbackSet:complicationDescriptors:alreadyAddedDescriptors:andFilterFromAppsDisabledByAppProtection:](self, "_complicationsFromFallbackSet:complicationDescriptors:alreadyAddedDescriptors:andFilterFromAppsDisabledByAppProtection:", v14, v4, v5, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D40]), "initWithComplications:", v15);
      objc_msgSend(v3, "addObject:", v16);

    }
  }

  -[ATXComplicationSuggestionParameters fallbackSetsForSet3](self->_parameters, "fallbackSetsForSet3");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v17, "count")));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXComplicationSuggestionGenerator _complicationsFromFallbackSet:complicationDescriptors:alreadyAddedDescriptors:andFilterFromAppsDisabledByAppProtection:](self, "_complicationsFromFallbackSet:complicationDescriptors:alreadyAddedDescriptors:andFilterFromAppsDisabledByAppProtection:", v19, v4, v5, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D40]), "initWithComplications:", v20);
      objc_msgSend(v3, "addObject:", v21);

    }
  }

  __atxlog_handle_lock_screen();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = v3;
    _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "Fallback Sets: %@", (uint8_t *)&v25, 0xCu);
  }

  v23 = (void *)objc_msgSend(v3, "copy");
  return v23;
}

- (id)_landscapeModularFallbackSets
{
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
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  +[ATXLockscreenBlacklist appsLockedOrHiddenByAppProtection](ATXLockscreenBlacklist, "appsLockedOrHiddenByAppProtection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXWidgetDescriptorCache landscapeModularComplicationWidgetDescriptors](self->_descriptorCache, "landscapeModularComplicationWidgetDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  -[ATXComplicationSuggestionParameters fallbackSetForLandscape](self->_parameters, "fallbackSetForLandscape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v7, "count")));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v6;
    v30 = v5;
    v31 = v4;
    -[ATXComplicationSuggestionGenerator _complicationsFromFallbackSet:complicationDescriptors:alreadyAddedDescriptors:andFilterFromAppsDisabledByAppProtection:](self, "_complicationsFromFallbackSet:complicationDescriptors:alreadyAddedDescriptors:andFilterFromAppsDisabledByAppProtection:", v9, v5, v6, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_new();
    v13 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          v20 = objc_msgSend(v19, "widgetFamily");
          v21 = v11;
          if (v20 != 10)
          {
            v22 = objc_msgSend(v19, "widgetFamily");
            v21 = v12;
            if (v22 != 11)
            {
              v23 = objc_msgSend(v19, "widgetFamily");
              v21 = v13;
              if (v23 != 1)
                continue;
            }
          }
          objc_msgSend(v21, "addObject:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v16);
    }

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D40]), "initWithComplications:", v11);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CF89E8]);

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D40]), "initWithComplications:", v12);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0CF89F0]);

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D40]), "initWithComplications:", v13);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CF89F8]);

    v5 = v30;
    v4 = v31;
    v6 = v29;
  }
  v27 = (void *)objc_msgSend(v3, "copy");

  return v27;
}

- (id)_setWithDesiredLayout:(int64_t)a3 complicationDescriptors:(id)a4 unusedRecentsComplications:(id)a5 alreadyAddedComplications:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  uint8_t buf[16];

  v9 = a4;
  v32 = a5;
  v10 = a6;
  +[ATXLockscreenBlacklist appsLockedOrHiddenByAppProtection](ATXLockscreenBlacklist, "appsLockedOrHiddenByAppProtection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v12 = 0;
  switch(a3)
  {
    case 0:
    case 4:
      goto LABEL_43;
    case 1:
      v13 = &unk_1E83CFBC0;
      goto LABEL_6;
    case 2:
      v13 = &unk_1E83CFB90;
      goto LABEL_6;
    case 3:
      v13 = &unk_1E83CFBA8;
      goto LABEL_6;
    default:
      v13 = &unk_1E83CFB78;
LABEL_6:
      if (!objc_msgSend(v9, "count"))
        goto LABEL_38;
      v28 = v11;
      v30 = v10;
      v14 = 0;
      v15 = 0;
      v16 = 4;
      break;
  }
  do
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v16)
    {

      v10 = v30;
      v11 = v28;
      goto LABEL_42;
    }
    objc_msgSend(v17, "supportedFamilies");
    objc_msgSend(v18, "disfavoredFamiliesForLocation:", 1);
    objc_msgSend(v13, "objectAtIndexedSubscript:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntValue");

    if (v20 == 1)
    {
      -[ATXComplicationSuggestionGenerator _rectangularComplicationFromComplications:](self, "_rectangularComplicationFromComplications:", v32);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setSource:", 1);
      if (v21)
      {
        if ((objc_msgSend(v30, "containsObject:", v21) & 1) != 0
          || !-[ATXComplicationSuggestionGenerator _shouldAddComplication:andFilterFromAppsDisabledByAppProtection:](self, "_shouldAddComplication:andFilterFromAppsDisabledByAppProtection:", v21, v29))
        {
          goto LABEL_20;
        }
        objc_msgSend(v28, "addObject:", v21);
        objc_msgSend(v30, "addObject:", v21);
        v16 -= 2;
LABEL_19:
        ++v14;
LABEL_20:
        objc_msgSend(v32, "removeObject:", v21);

        goto LABEL_36;
      }
      if (CHSWidgetFamilyMaskContainsFamily() && (CHSWidgetFamilyMaskContainsFamily() & 1) == 0)
      {
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D38]), "initWithWidgetDescriptor:widgetFamily:intent:source:", v18, 11, 0, 2);
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D38]), "initWithWidgetDescriptor:widgetFamily:intent:source:", v18, 10, 0, 2);
        if ((objc_msgSend(v30, "containsObject:", v24) & 1) == 0
          && (objc_msgSend(v30, "containsObject:", v25) & 1) == 0
          && -[ATXComplicationSuggestionGenerator _shouldAddComplication:andFilterFromAppsDisabledByAppProtection:](self, "_shouldAddComplication:andFilterFromAppsDisabledByAppProtection:", v24, v29))
        {
          objc_msgSend(v28, "addObject:", v24);
          objc_msgSend(v30, "addObject:", v24);
          v16 -= 2;
          goto LABEL_33;
        }
        goto LABEL_34;
      }
    }
    else
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "unsignedIntValue");

      if (v23)
        goto LABEL_36;
      -[ATXComplicationSuggestionGenerator _circularComplicationFromComplications:](self, "_circularComplicationFromComplications:", v32);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setSource:", 1);
      if (v21)
      {
        if ((objc_msgSend(v30, "containsObject:", v21) & 1) != 0
          || !-[ATXComplicationSuggestionGenerator _shouldAddComplication:andFilterFromAppsDisabledByAppProtection:](self, "_shouldAddComplication:andFilterFromAppsDisabledByAppProtection:", v21, v29))
        {
          goto LABEL_20;
        }
        objc_msgSend(v28, "addObject:", v21);
        objc_msgSend(v30, "addObject:", v21);
        --v16;
        goto LABEL_19;
      }
      if (CHSWidgetFamilyMaskContainsFamily() && (CHSWidgetFamilyMaskContainsFamily() & 1) == 0)
      {
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D38]), "initWithWidgetDescriptor:widgetFamily:intent:source:", v18, 10, 0, 2);
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D38]), "initWithWidgetDescriptor:widgetFamily:intent:source:", v18, 11, 0, 2);
        if ((objc_msgSend(v30, "containsObject:", v24) & 1) == 0
          && (objc_msgSend(v30, "containsObject:", v25) & 1) == 0
          && -[ATXComplicationSuggestionGenerator _shouldAddComplication:andFilterFromAppsDisabledByAppProtection:](self, "_shouldAddComplication:andFilterFromAppsDisabledByAppProtection:", v24, v29))
        {
          objc_msgSend(v28, "addObject:", v24);
          objc_msgSend(v30, "addObject:", v24);
          --v16;
LABEL_33:
          ++v14;
        }
LABEL_34:

      }
    }
    ++v15;
LABEL_36:

  }
  while (v15 < objc_msgSend(v9, "count"));
  v10 = v30;
  v11 = v28;
  if (!v16)
  {
LABEL_42:
    v12 = v11;
    goto LABEL_43;
  }
LABEL_38:
  __atxlog_handle_lock_screen();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEFAULT, "Not enough complications available on device to fill layout", buf, 2u);
  }

  v12 = 0;
LABEL_43:

  return v12;
}

- (id)_rectangularComplicationFromComplications:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "widgetFamily", (_QWORD)v9) == 11)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_circularComplicationFromComplications:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "widgetFamily", (_QWORD)v9) == 10)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_complicationsFromFallbackSet:(id)a3 complicationDescriptors:(id)a4 alreadyAddedDescriptors:(id)a5 andFilterFromAppsDisabledByAppProtection:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  uint64_t v48;
  uint64_t v49;
  id obj;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  char v59;
  void *v60;
  void *v61;
  id v63;
  __CFString *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint8_t v78[128];
  uint8_t buf[4];
  uint64_t v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v63 = a6;
  if (!v9)
  {
    v43 = 0;
    goto LABEL_64;
  }
  v12 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v10, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = v14;
  objc_msgSend(v14, "shuffle");
  v15 = (void *)objc_opt_new();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v9;
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
  if (!v56)
    goto LABEL_55;
  v55 = *(_QWORD *)v74;
  v54 = *MEMORY[0x1E0CF89E8];
  v49 = *MEMORY[0x1E0CF89F0];
  v48 = *MEMORY[0x1E0CF89F8];
  v52 = v10;
  v53 = v9;
  v60 = v15;
  v61 = v11;
LABEL_4:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v74 != v55)
      objc_enumerationMutation(obj);
    objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * v16), "componentsSeparatedByString:", CFSTR(":"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count") != 3)
    {
      __atxlog_handle_lock_screen();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v44 = objc_msgSend(v17, "count");
        *(_DWORD *)buf = 134217984;
        v80 = v44;
        _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "Complication set is invalid. Components count: %lu", buf, 0xCu);
      }
      goto LABEL_62;
    }
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
    v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad")
      && -[NSObject isEqualToString:](v18, "isEqualToString:", CFSTR("com.apple.Fitness.FitnessWidget")))
    {

      v64 = CFSTR("MentalHealthLauncherComplication");
      v18 = CFSTR("com.apple.Health.HealthMentalHealthWidgetExtension");
    }
    objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", v54);

    v57 = v16;
    v58 = v17;
    if ((v20 & 1) == 0)
      break;
    v21 = 10;
LABEL_17:
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v26 = v10;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    if (v27)
    {
      v28 = v27;
      v59 = 0;
      v29 = *(_QWORD *)v70;
      while (1)
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v70 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
          objc_msgSend(v31, "disfavoredFamiliesForLocation:", 1);
          objc_msgSend(v31, "extensionBundleIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v32, "isEqualToString:", v18))
          {
            objc_msgSend(v31, "kind");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v33, "isEqualToString:", v64)
              && (objc_msgSend(v31, "supportedFamilies"), (CHSWidgetFamilyMaskContainsFamily() & 1) != 0))
            {
              v34 = CHSWidgetFamilyMaskContainsFamily();

              if ((v34 & 1) != 0)
                continue;
              if ((objc_msgSend(v61, "containsObject:", v31) & 1) != 0)
                goto LABEL_33;
              v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D38]), "initWithWidgetDescriptor:widgetFamily:intent:source:", v31, v21, 0, 3);
              if (-[ATXComplicationSuggestionGenerator _shouldAddComplication:andFilterFromAppsDisabledByAppProtection:](self, "_shouldAddComplication:andFilterFromAppsDisabledByAppProtection:", v32, v63))
              {
                objc_msgSend(v60, "addObject:", v32);
                objc_msgSend(v61, "addObject:", v31);
                v59 = 1;
              }
            }
            else
            {

            }
          }

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
        if (!v28)
        {
LABEL_33:

          v11 = v61;
          if ((v59 & 1) != 0)
            goto LABEL_53;
          goto LABEL_36;
        }
      }
    }

LABEL_36:
    __atxlog_handle_lock_screen();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v35, OS_LOG_TYPE_DEFAULT, "Fallback complication not found while searching descriptors. Filling in a random one.", buf, 2u);
    }

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v36 = v51;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v66;
      while (2)
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v66 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
          if ((objc_msgSend(v11, "containsObject:", v41) & 1) == 0)
          {
            objc_msgSend(v41, "disfavoredFamiliesForLocation:", 1);
            objc_msgSend(v41, "supportedFamilies");
            if (CHSWidgetFamilyMaskContainsFamily())
            {
              if ((CHSWidgetFamilyMaskContainsFamily() & 1) == 0)
              {
                v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D38]), "initWithWidgetDescriptor:widgetFamily:intent:source:", v41, v21, 0, 3);
                if (-[ATXComplicationSuggestionGenerator _shouldAddComplication:andFilterFromAppsDisabledByAppProtection:](self, "_shouldAddComplication:andFilterFromAppsDisabledByAppProtection:", v42, v63))
                {
                  objc_msgSend(v60, "addObject:", v42);
                  objc_msgSend(v11, "addObject:", v41);

                  goto LABEL_52;
                }

              }
            }
          }
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
        if (v38)
          continue;
        break;
      }
    }
LABEL_52:

LABEL_53:
    v16 = v57 + 1;
    v10 = v52;
    v9 = v53;
    v15 = v60;
    if (v57 + 1 == v56)
    {
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
      if (!v56)
      {
LABEL_55:

        v43 = v15;
        goto LABEL_63;
      }
      goto LABEL_4;
    }
  }
  objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", v49);

  if ((v23 & 1) != 0)
  {
    v21 = 11;
    goto LABEL_17;
  }
  objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToString:", v48);

  if ((v25 & 1) != 0)
  {
    v21 = 1;
    goto LABEL_17;
  }
  __atxlog_handle_lock_screen();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v80 = (uint64_t)v46;
    _os_log_impl(&dword_1C9A3B000, v45, OS_LOG_TYPE_DEFAULT, "Unknown complication family: %@", buf, 0xCu);

  }
LABEL_62:

  v43 = 0;
LABEL_63:

LABEL_64:
  return v43;
}

- (BOOL)_layoutIsValidGivenComplications:(id)a3 allowedComplicationPersonalities:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    v11 = 4;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v14 = objc_alloc(MEMORY[0x1E0CF9220]);
        objc_msgSend(v13, "extensionBundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "kind");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v14, "initWithExtensionBundleId:kind:", v15, v16);

        if (!objc_msgSend(v6, "containsObject:", v17)
          || -[ATXComplicationSuggestionGenerator _complicationIsAlreadyAdded:alreadyAddedComplications:](self, "_complicationIsAlreadyAdded:alreadyAddedComplications:", v13, v7))
        {
LABEL_15:

          v19 = 0;
          goto LABEL_17;
        }
        if (objc_msgSend(v13, "widgetFamily") == 10)
        {
          v18 = -1;
        }
        else
        {
          if (objc_msgSend(v13, "widgetFamily") != 11)
            goto LABEL_15;
          v18 = -2;
        }
        v11 += v18;
        objc_msgSend(v7, "addObject:", v13);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v19 = 1;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v19 = 1;
    v11 = 4;
  }
LABEL_17:

  if (v11)
    v19 = 0;

  return v19;
}

- (BOOL)_complicationIsAlreadyAdded:(id)a3 alreadyAddedComplications:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v5, "isEqual:", v10, (_QWORD)v17))
        {
          objc_msgSend(v5, "intent");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {

          }
          else
          {
            objc_msgSend(v10, "intent");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v12)
              goto LABEL_14;
          }
          objc_msgSend(v5, "intent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "intent");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "atx_isEqualToIntent:", v14);

          if ((v15 & 1) != 0)
          {
LABEL_14:
            LOBYTE(v7) = 1;
            goto LABEL_15;
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_15:

  return v7;
}

- (BOOL)_shouldAddComplication:(id)a3 andFilterFromAppsDisabledByAppProtection:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "containerBundleIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        objc_msgSend(v5, "containerBundleIdentifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v6, "containsObject:", v9),
        v9,
        v8,
        v10))
  {
    __atxlog_handle_home_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "containerBundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v5;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "ATXComplicationSuggestionGenerator: Complication: %@ is not eligible for suggestion. Reason: %@ is locked or hidden by user preference.", (uint8_t *)&v15, 0x16u);

    }
    v13 = 0;
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterConfigurationCache, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_complicationScorer, 0);
  objc_storeStrong((id *)&self->_complicationSuggestionCache, 0);
  objc_storeStrong((id *)&self->_descriptorCache, 0);
}

- (void)_recentLandscapeComplicationsWithPresetDictionary:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_2_2(a1, a2);
  NSStringFromWidgetFamily();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_0_12(&dword_1C9A3B000, v5, v6, "Unexpected complication type, %@");

  OUTLINED_FUNCTION_3_2();
}

- (void)modularSetsWithDesiredLayouts:(os_log_t)log unusedRecentComplications:alreadyAddedComplications:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Only up to 3 sets are supported. Returning 3.", v1, 2u);
}

- (void)scoredComplicationsDescription
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Could not load accessory widget descriptors for scored complications description: %@", a5, a6, a7, a8, 2u);
}

@end
