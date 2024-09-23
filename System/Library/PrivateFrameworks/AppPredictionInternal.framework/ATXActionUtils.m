@implementation ATXActionUtils

uint64_t __52___ATXActionUtils_limitParameterCombinations_limit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "count");
  if (v6 >= objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(v4, "count");
    if (v8 <= objc_msgSend(v5, "count"))
    {
      objc_msgSend(v4, "allObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "allObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sortedArrayUsingSelector:", sel_compare_);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "count"))
      {
        v13 = 0;
        while (1)
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v14, "compare:", v15);

          if (v7)
            break;
          if (objc_msgSend(v10, "count") <= (unint64_t)++v13)
            goto LABEL_9;
        }
      }
      else
      {
LABEL_9:
        v7 = 0;
      }

    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void __49___ATXActionUtils_slotSetsForAction_intentCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(v6, "containsObject:", CFSTR("buckets")) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

BOOL __49___ATXActionUtils_filterContainersWithNilAction___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "scoredAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __66___ATXActionUtils_fetchDataAndUpdateContentAttributeSetForAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  __atxlog_handle_action_prediction();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __66___ATXActionUtils_fetchDataAndUpdateContentAttributeSetForAction___block_invoke_cold_1((uint64_t)v3, v4, v5);

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      if (objc_msgSend(v7, "count"))
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "contentAttributeSet");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setThumbnailURL:", v9);

        }
      }
      if ((unint64_t)objc_msgSend(v7, "count") >= 2)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "contentAttributeSet");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setContentDescription:", v11);

        }
      }

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t __87___ATXActionUtils_actionKeyFilterForCandidateBundleIds_candidateActionTypes_blacklist___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  +[_ATXActionUtils getBundleIdAndActionTypeFromActionKey:](_ATXActionUtils, "getBundleIdAndActionTypeFromActionKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "first");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "second");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)a1[4];
    if (v7 && !objc_msgSend(v7, "containsObject:", v5)
      || (v8 = (void *)a1[5]) != 0 && !objc_msgSend(v8, "containsObject:", v6))
    {
      v10 = 0;
    }
    else
    {
      v9 = (void *)a1[6];
      if (v9)
        v10 = objc_msgSend(v9, "shouldPredictBundleId:action:", v5, v6);
      else
        v10 = 1;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __54___ATXActionUtils_atxActionsFromProactiveSuggestions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "atxActionFromProactiveSuggestion:", a2);
}

void __66___ATXActionUtils_fetchDataAndUpdateContentAttributeSetForAction___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, a2, a3, "CBE: attributeValues: %@", (uint8_t *)&v3);
}

@end
