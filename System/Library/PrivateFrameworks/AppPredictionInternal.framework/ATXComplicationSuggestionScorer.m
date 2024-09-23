@implementation ATXComplicationSuggestionScorer

- (ATXComplicationSuggestionScorer)init
{
  ATXComplicationSuggestionScorer *v2;
  uint64_t v3;
  ATXComplicationAppBundleIdsScorer *bundleIdsScorer;
  uint64_t v5;
  ATXComplicationSuggestionHeuristics *heuristics;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXComplicationSuggestionScorer;
  v2 = -[ATXComplicationSuggestionScorer init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    bundleIdsScorer = v2->_bundleIdsScorer;
    v2->_bundleIdsScorer = (ATXComplicationAppBundleIdsScorer *)v3;

    v5 = objc_opt_new();
    heuristics = v2->_heuristics;
    v2->_heuristics = (ATXComplicationSuggestionHeuristics *)v5;

  }
  return v2;
}

- (id)complicationDescriptorsForModularSetGivenComplicationDescriptors:(id)a3 widgetDescriptorsAdditionalData:(id)a4 aggregatedAppLaunchData:(id)a5 bundleIdToCompanionBundleId:(id)a6
{
  void *v6;
  void *v7;

  -[ATXComplicationSuggestionScorer scoredComplicationDescriptorsForModularSetGivenComplicationDescriptors:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:checkEligibility:](self, "scoredComplicationDescriptorsForModularSetGivenComplicationDescriptors:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:checkEligibility:", a3, a4, a5, a6, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keysSortedByValueUsingComparator:", &__block_literal_global_148);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __184__ATXComplicationSuggestionScorer_complicationDescriptorsForModularSetGivenComplicationDescriptors_widgetDescriptorsAdditionalData_aggregatedAppLaunchData_bundleIdToCompanionBundleId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (id)complicationDescriptorsForInlineSetGivenComplicationDescriptors:(id)a3
{
  void *v3;
  void *v4;

  -[ATXComplicationSuggestionScorer scoredComplicationDescriptorsForInlineSetGivenComplicationDescriptors:](self, "scoredComplicationDescriptorsForInlineSetGivenComplicationDescriptors:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keysSortedByValueUsingComparator:", &__block_literal_global_9_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __99__ATXComplicationSuggestionScorer_complicationDescriptorsForInlineSetGivenComplicationDescriptors___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (id)scoredComplicationDescriptorsForModularSetGivenComplicationDescriptors:(id)a3 widgetDescriptorsAdditionalData:(id)a4 aggregatedAppLaunchData:(id)a5 bundleIdToCompanionBundleId:(id)a6 checkEligibility:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a5;
  -[ATXComplicationSuggestionScorer _appBundleIdsForComplicationDescriptors:](self, "_appBundleIdsForComplicationDescriptors:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXComplicationAppBundleIdsScorer scoredComplicationBundleIdsForModularSet:aggregatedAppLaunchData:bundleIdToCompanionBundleId:](self->_bundleIdsScorer, "scoredComplicationBundleIdsForModularSet:aggregatedAppLaunchData:bundleIdToCompanionBundleId:", v16, v15, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && !-[ATXComplicationSuggestionScorer _modularSetIsSuggestibleGivenAppScoreDictionary:](self, "_modularSetIsSuggestibleGivenAppScoreDictionary:", v17))
  {
    v20 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    -[ATXComplicationSuggestionHeuristics complicationHeuristicsDictionary](self->_heuristics, "complicationHeuristicsDictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXComplicationSuggestionScorer _scoredComplicationsForModularSetGivenDescriptors:appBundleIdScores:heuristicScores:widgetDescriptorsAdditionalData:](self, "_scoredComplicationsForModularSetGivenDescriptors:appBundleIdScores:heuristicScores:widgetDescriptorsAdditionalData:", v12, v17, v18, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXComplicationSuggestionScorer _decaySubsequentScoresFromSameBundleId:decayFactor:](self, "_decaySubsequentScoresFromSameBundleId:decayFactor:", v19, 0.2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v20;
}

- (id)_appBundleIdsForComplicationDescriptors:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "extensionIdentity", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "containerBundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_decaySubsequentScoresFromSameBundleId:(id)a3 decayFactor:(double)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  double v30;
  void *v31;
  id obj;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v12, "extensionIdentity");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "containerBundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v6, "valueForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              v17 = v16;
              objc_msgSend(v16, "insertObject:atIndex:", v13, objc_msgSend(v16, "indexOfObject:inSortedRange:options:usingComparator:", v13, 0, objc_msgSend(v16, "count"), 1024, &__block_literal_global_12_4));
            }
            else
            {
              v17 = (void *)objc_opt_new();
              objc_msgSend(v17, "addObject:", v13);
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v15);
            }

          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v9);
  }
  v34 = v6;

  v18 = (void *)objc_msgSend(v7, "mutableCopy");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v7;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        objc_msgSend(v23, "extensionIdentity");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "containerBundleIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v18, "objectForKeyedSubscript:", v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "valueForKey:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "indexOfObject:", v26);
          v29 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v26, "doubleValue");
          objc_msgSend(v29, "numberWithDouble:", (double)(v30 * pow(a4, (double)v28)));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v31, v23);

        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v20);
  }

  return v18;
}

uint64_t __86__ATXComplicationSuggestionScorer__decaySubsequentScoresFromSameBundleId_decayFactor___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (id)modelDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Model: %@"), CFSTR("uniqueDaysLaunched + rawLaunchCount / 5 + appPrior / 100 + hasHomescreenWidget * 3 + heursitics + complicationPrior / 100 + watchBundleIdCount * 2 + hyperRecentlyInstalled * 30"));
}

- (id)inputDescriptionForSignal:(id)a3 complicationDescriptors:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  uint64_t v29;
  id v30;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("appLaunchUniqueDays")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("appLaunchTotalCount")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("preConfiguredWidgets")) & 1) == 0
    && !objc_msgSend(v6, "isEqualToString:", CFSTR("appPriors")))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("heuristics")))
    {
      -[ATXComplicationSuggestionHeuristics flushCache](self->_heuristics, "flushCache");
      -[ATXComplicationSuggestionHeuristics description](self->_heuristics, "description");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v14)
        v16 = (const __CFString *)v14;
      else
        v16 = &stru_1E82FDC98;
      objc_msgSend(v8, "appendString:", v16);
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("complicationPriors")))
      {
        if (!objc_msgSend(v6, "isEqualToString:", CFSTR("hyperRecency")))
        {
          objc_msgSend(v8, "appendString:", CFSTR("Unrecognized Signal"));
          goto LABEL_10;
        }
        objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        objc_msgSend(v25, "fetchAccessoryWidgetDescriptorMetadataWithError:", &v30);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v30;

        if (v9 || !v11)
        {
          objc_msgSend(v8, "appendString:", CFSTR("Error while fetching widget install dates: "));
          objc_msgSend(v9, "description");
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          v28 = CFSTR("<Unknown error>");
        }
        else
        {
          objc_msgSend(v8, "appendString:", CFSTR("Install Dates for Complication Descriptors:\n%"));
          objc_msgSend(v11, "description");
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          v28 = &stru_1E82FDC98;
        }
        if (v26)
          v29 = v26;
        else
          v29 = (uint64_t)v28;
        objc_msgSend(v8, "appendString:", v29);

        goto LABEL_9;
      }
      +[ATXComplicationSuggestionParameters sharedInstance](ATXComplicationSuggestionParameters, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "modularComplicationsToPriorsMapping");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "inlineComplicationsToPriorsMapping");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendString:", CFSTR("Prior values for Modular Complications:\n"));
      objc_msgSend(v17, "description");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v19)
        v21 = (const __CFString *)v19;
      else
        v21 = &stru_1E82FDC98;
      objc_msgSend(v8, "appendString:", v21);

      objc_msgSend(v8, "appendString:", CFSTR("\n\nPrior values for Inline Complications:\n"));
      objc_msgSend(v18, "description");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (v22)
        v24 = (const __CFString *)v22;
      else
        v24 = &stru_1E82FDC98;
      objc_msgSend(v8, "appendString:", v24);

    }
    goto LABEL_10;
  }
  -[ATXComplicationSuggestionScorer _appBundleIdsForComplicationDescriptors:](self, "_appBundleIdsForComplicationDescriptors:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXComplicationAppBundleIdsScorer inputDescriptionForSignal:complicationAppBundleIds:](self->_bundleIdsScorer, "inputDescriptionForSignal:complicationAppBundleIds:", v6, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = &stru_1E82FDC98;
  objc_msgSend(v8, "appendString:", v12);
LABEL_9:

LABEL_10:
  return v8;
}

- (id)_scoredComplicationsForModularSetGivenDescriptors:(id)a3 appBundleIdScores:(id)a4 heuristicScores:(id)a5 widgetDescriptorsAdditionalData:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  _BOOL4 v41;
  double v42;
  double v43;
  void *v44;
  void *v46;
  id v47;
  id obj;
  id v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v49 = a4;
  v10 = a5;
  v11 = a6;
  v47 = (id)objc_opt_new();
  +[ATXComplicationSuggestionParameters sharedInstance](ATXComplicationSuggestionParameters, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "modularComplicationsToPriorsMapping");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v9;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v52 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v17, "extensionIdentity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "containerBundleIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = 0.0;
        v21 = 0.0;
        if (v19)
        {
          objc_msgSend(v17, "extensionIdentity");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "containerBundleIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "doubleValue");
          v21 = v25;

        }
        objc_msgSend(v17, "extensionBundleIdentifier");
        v26 = objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = (void *)v26;
          objc_msgSend(v17, "kind");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            v29 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v17, "extensionBundleIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "kind");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("%@:%@"), v30, v31);

            objc_msgSend(v46, "objectForKeyedSubscript:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "doubleValue");
            v20 = v34 / 100.0;

          }
        }
        v35 = objc_alloc(MEMORY[0x1E0CF9220]);
        objc_msgSend(v17, "extensionBundleIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "kind");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)objc_msgSend(v35, "initWithExtensionBundleId:kind:", v36, v37);

        objc_msgSend(v10, "objectForKeyedSubscript:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v37) = objc_msgSend(v39, "unsignedIntValue");

        v40 = v20
            + (double)+[ATXComplicationSuggestionHeuristics scoreFromConfidence:](ATXComplicationSuggestionHeuristics, "scoreFromConfidence:", v37);
        v41 = -[ATXComplicationSuggestionScorer _isNewlyInstalledWidget:additionalData:](self, "_isNewlyInstalledWidget:additionalData:", v17, v11);
        v42 = v40 + 30.0;
        if (!v41)
          v42 = v40;
        v43 = v21 + v42;
        if (v43 > 0.0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43 + (double)arc4random_uniform(0x64u) * 0.01);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v44, v17);

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v14);
  }

  return v47;
}

- (id)_scoredComplicationsForInlineSetGivenDescriptors:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  +[ATXComplicationSuggestionParameters sharedInstance](ATXComplicationSuggestionParameters, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inlineComplicationsToPriorsMapping");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v11, "extensionBundleIdentifier");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = 0.0;
        if (v12)
        {
          v14 = (void *)v12;
          objc_msgSend(v11, "kind");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v16 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v11, "extensionBundleIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "kind");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("%@:%@"), v17, v18);

            objc_msgSend(v24, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "doubleValue");
            v13 = v21 / 10.0;

          }
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13 + 0.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  return v4;
}

- (BOOL)_modularSetIsSuggestibleGivenAppScoreDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "doubleValue");
        v10 = v9;

        if (v10 > v6)
          v6 = v10;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
    LOBYTE(v4) = v6 >= 11.0;
  }

  return v4;
}

- (BOOL)_isNewlyInstalledWidget:(id)a3 additionalData:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;

  if (!a4)
    return 0;
  v5 = (objc_class *)MEMORY[0x1E0CF9220];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithDescriptor:", v7);

  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "installDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, -1, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "compare:", v10);
    if (v14 == -1)
      v15 = 1;
    else
LABEL_5:
      v15 = 0;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heuristics, 0);
  objc_storeStrong((id *)&self->_bundleIdsScorer, 0);
}

@end
