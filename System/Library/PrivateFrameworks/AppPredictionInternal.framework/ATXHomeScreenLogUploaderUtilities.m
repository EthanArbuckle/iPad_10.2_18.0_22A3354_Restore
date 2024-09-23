@implementation ATXHomeScreenLogUploaderUtilities

+ (BOOL)isFirstPartyApp:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Shortcuts")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple."));

  return v4;
}

+ (BOOL)isValidAppLaunch:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.springboard.")) & 1) != 0)
    v5 = 0;
  else
    v5 = objc_msgSend(v3, "starting");

  return v5;
}

+ (BOOL)isRotationSessionDueToProactive:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "startingStackChangeEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringForATXHomeScreenStackChangeReason();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

+ (BOOL)isRotationSessionDueToUserScroll:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "startingStackChangeEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringForATXHomeScreenStackChangeReason();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

+ (id)keyByConcatenatingAccumulatorKey:(id)a3 withLocation:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  ATXCAStringForStackLocation();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_keyByConcatenatingAccumulatorKey:withString:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)keyByConcatenatingAccumulatorKey:(id)a3 withSize:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  ATXCAStringForStackLayoutSize();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_keyByConcatenatingAccumulatorKey:withString:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_keyByConcatenatingAccumulatorKey:(id)a3 withString:(id)a4
{
  void *v4;
  objc_class *v6;
  id v7;
  id v8;

  v4 = 0;
  if (a3 && a4)
  {
    v6 = (objc_class *)MEMORY[0x1E0CB3940];
    v7 = a4;
    v8 = a3;
    v4 = (void *)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%@%@"), v8, v7);

  }
  return v4;
}

+ (void)add:(unint64_t)a3 toDictionary:(id)a4 forKey:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  if (v7)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB37E8];
    if (v8)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "numberWithUnsignedInteger:", a3 + (int)objc_msgSend(v10, "intValue"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v7);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v7);
    }

  }
}

+ (void)incrementDictionary:(id)a3 forKey:(id)a4
{
  objc_msgSend(a1, "add:toDictionary:forKey:", 1, a3, a4);
}

+ (void)add:(unint64_t)a3 toTwoLevelDictionary:(id)a4 forKey1:(id)a5 key2:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v10 = a5;
  if (v10 && a6)
  {
    v11 = a6;
    objc_msgSend(v15, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = (void *)objc_opt_new();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, v10);

    }
    objc_msgSend(v15, "objectForKeyedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "add:toDictionary:forKey:", a3, v14, v11);

  }
}

+ (void)incrementTwoLevelDictionary:(id)a3 forKey1:(id)a4 key2:(id)a5
{
  objc_msgSend(a1, "add:toTwoLevelDictionary:forKey1:key2:", 1, a3, a4, a5);
}

+ (BOOL)_isDwellLongEnoughForPseudoTap:(id)a3 endingEventTime:(double)a4
{
  double v5;

  if (!a3)
    return 0;
  objc_msgSend(a3, "timestamp");
  return a4 - v5 >= 3.0;
}

+ (id)stackShownEventsForPseudoTapIfPossible:(id)a3 currentEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeScreenEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "eventTypeString");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v11 = 0;
LABEL_59:

LABEL_60:
    objc_msgSend(v9, "stackId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v12 = 0;
LABEL_74:

      goto LABEL_75;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v11 == 15)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "eventBody");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "homeScreenEvent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "removeObjectForKey:", v22);
    }
    else
    {
      if (v11 == 14)
      {
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v22);
        goto LABEL_72;
      }
      v12 = 0;
      if (v11 != 3 || !v23)
        goto LABEL_73;
      objc_msgSend(v23, "eventBody");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "homeScreenEvent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v22);
    }
    objc_msgSend(v7, "timestamp");
    if (objc_msgSend(a1, "_isDwellLongEnoughForPseudoTap:endingEventTime:", v24))
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v27, 0);

LABEL_73:
      goto LABEL_74;
    }

LABEL_72:
    v12 = 0;
    goto LABEL_73;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("HomeScreenPageShown")) & 1) != 0)
  {
    v11 = 1;
    goto LABEL_59;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("HomeScreenDisappeared")) & 1) != 0)
  {
    v11 = 2;
    goto LABEL_59;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("StackChanged")) & 1) != 0)
  {
    v11 = 3;
    goto LABEL_59;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WidgetTapped")) & 1) != 0)
  {
    v11 = 4;
    goto LABEL_59;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WidgetLongLook")) & 1) != 0)
  {
    v11 = 5;
    goto LABEL_59;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WidgetUserFeedback")) & 1) != 0)
  {
    v11 = 6;
    goto LABEL_59;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("UserStackConfigChanged")) & 1) != 0)
  {
    v11 = 7;
    goto LABEL_59;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("DeviceLocked")) & 1) == 0)
  {
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("DeviceUnlocked")) & 1) != 0)
    {
      v11 = 9;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("PinnedWidgetAdded")) & 1) != 0)
    {
      v11 = 10;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("PinnedWidgetDeleted")) & 1) != 0)
    {
      v11 = 11;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("SpecialPageAppeared")) & 1) != 0)
    {
      v11 = 12;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("SpecialPageDisappeared")) & 1) != 0)
    {
      v11 = 13;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("StackShown")) & 1) != 0)
    {
      v11 = 14;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("StackDisappeared")) & 1) != 0)
    {
      v11 = 15;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("StackCreated")) & 1) != 0)
    {
      v11 = 16;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("StackDeleted")) & 1) != 0)
    {
      v11 = 17;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WidgetAddedToStack")) & 1) != 0)
    {
      v11 = 18;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WidgetRemovedFromStack")) & 1) != 0)
    {
      v11 = 19;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("StackVisibilityChanged")) & 1) != 0)
    {
      v11 = 20;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("AppAdded")) & 1) != 0)
    {
      v11 = 21;
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("AppRemoved")))
    {
      v11 = 22;
    }
    else
    {
      v11 = 0;
    }
    goto LABEL_59;
  }
  v30 = v9;

  v12 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v31 = v6;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "timestamp");
        if (objc_msgSend(a1, "_isDwellLongEnoughForPseudoTap:endingEventTime:", v18))
        {
          objc_msgSend(v18, "eventBody");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "homeScreenEvent");
          v20 = a1;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v21);

          a1 = v20;
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v15);
  }

  objc_msgSend(v13, "removeAllObjects");
  if (!objc_msgSend(v12, "count"))
  {

    v11 = 8;
    v9 = v30;
    v6 = v31;
    goto LABEL_60;
  }
  v9 = v30;
  v6 = v31;
LABEL_75:

  return v12;
}

+ (int)suggestionReasonForSuggestionLayout:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  uint64_t v14;
  NSObject *v15;

  v3 = a3;
  objc_msgSend(v3, "allSuggestionsInLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
    __atxlog_handle_home_screen();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[ATXHomeScreenLogUploaderUtilities suggestionReasonForSuggestionLayout:].cold.1(v6);
    goto LABEL_6;
  }
  if ((objc_msgSend(v3, "isValidForSuggestionsWidget") & 1) == 0)
  {
    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      __atxlog_handle_home_screen();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        +[ATXHomeScreenLogUploaderUtilities suggestionReasonForSuggestionLayout:].cold.3(v4, (uint64_t)v3, v7);

    }
    objc_msgSend(v4, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D81198];
    -[NSObject clientModelSpecification](v6, "clientModelSpecification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientModelId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "clientModelTypeFromClientModelId:", v10);

    if (objc_msgSend(v3, "isLowConfidenceStackRotationForStaleStack"))
    {
      if (v11 == 19)
        v5 = 3;
      else
        v5 = 8 * (v11 == 20);
      goto LABEL_17;
    }
    if ((objc_msgSend(v3, "isShortcutConversion") & 1) != 0)
    {
      v5 = 1;
      goto LABEL_17;
    }
    -[NSObject executableSpecification](v6, "executableSpecification");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "executableType");

    if (v14 == 3)
    {
      switch(v11)
      {
        case 18:
          v5 = 4;
          goto LABEL_17;
        case 20:
          v5 = 7;
          goto LABEL_17;
        case 19:
          v5 = 2;
          goto LABEL_17;
      }
    }
    else
    {
      __atxlog_handle_home_screen();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        +[ATXHomeScreenLogUploaderUtilities suggestionReasonForSuggestionLayout:].cold.2((uint64_t)v6, v15);

    }
LABEL_6:
    v5 = 6;
LABEL_17:

    goto LABEL_18;
  }
  v5 = 5;
LABEL_18:

  return v5;
}

+ (id)countsForRotationEngagementStatusHistory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "engagementStatusHistory", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "unsignedIntValue");
        if (objc_msgSend(v11, "unsignedIntValue") <= 4)
          objc_msgSend(a1, "incrementDictionary:forKey:", v5, v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)abGroup
{
  if (abGroup_onceToken != -1)
    dispatch_once(&abGroup_onceToken, &__block_literal_global_202);
  return (id)abGroup_abGroup;
}

void __44__ATXHomeScreenLogUploaderUtilities_abGroup__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "abGroupIdentifierForConsumerSubType:", 36);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "abGroupIdentifierForConsumerSubType:", 37);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "abGroupIdentifierForConsumerSubType:", 38);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu:%@:%@:%@"), 0, v0, v1, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)abGroup_abGroup;
  abGroup_abGroup = v3;

}

+ (void)suggestionReasonForSuggestionLayout:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXHomeScreenLogUploader: Found no suggestions in suggestionLayout", v1, 2u);
}

+ (void)suggestionReasonForSuggestionLayout:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "ATXHomeScreenLogUploader: Suggestion is not of type widget: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)suggestionReasonForSuggestionLayout:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 134218242;
  v6 = objc_msgSend(a1, "count");
  v7 = 2112;
  v8 = a2;
  _os_log_fault_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_FAULT, "ATXHomeScreenLogUploader: Unexpected behavior - %lu suggestions exist in a stackLayout that is not valid for a suggestions widget. Continuing to use first suggestion. Layout: %@", (uint8_t *)&v5, 0x16u);
}

@end
