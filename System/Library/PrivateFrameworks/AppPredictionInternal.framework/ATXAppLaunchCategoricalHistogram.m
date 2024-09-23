@implementation ATXAppLaunchCategoricalHistogram

void __131___ATXAppLaunchCategoricalHistogram_initWithHistogram_categoryToCategoryId_maxCategoryId_maxCategoryCount_lastDates_pruningMethod___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;
  id v8;

  v3 = a2;
  +[ATXHistogramBundleIdTable sharedInstance](ATXHistogramBundleIdTable, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils actionKeyFilterForCandidateBundleIds:candidateActionTypes:blacklist:](_ATXActionUtils, "actionKeyFilterForCandidateBundleIds:candidateActionTypes:blacklist:", v3, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysFilteredBy:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "removeHistoryForBundleIds:", v3);

  v7 = objc_loadWeakRetained(a1);
  objc_msgSend(v7, "removeHistoryForBundleIds:", v8);

}

void __131___ATXAppLaunchCategoricalHistogram_initWithHistogram_categoryToCategoryId_maxCategoryId_maxCategoryCount_lastDates_pruningMethod___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryWithLegacyPathForClass:", objc_opt_class());
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MinLaunchThreshold"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  kLaunchThreshold_0 = v3;

  if (*(double *)&kLaunchThreshold_0 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *(double *)&kLaunchThreshold_0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("_ATXAppLaunchCategoricalHistogram.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kLaunchThreshold != 0"));

  }
}

void __63___ATXAppLaunchCategoricalHistogram__garbageCollectCategoryIds__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(a3, "unsignedIntegerValue")) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

void __76___ATXAppLaunchCategoricalHistogram_launchCountsForEachCategoryForBundleId___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (*(unsigned __int16 *)(a1 + 40) == a2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v7);

  }
}

@end
