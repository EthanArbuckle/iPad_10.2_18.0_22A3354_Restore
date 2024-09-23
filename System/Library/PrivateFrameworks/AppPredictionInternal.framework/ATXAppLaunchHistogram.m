@implementation ATXAppLaunchHistogram

uint64_t __42___ATXAppLaunchHistogram_encodeWithCoder___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v5 = a2;
  objc_msgSend(v3, "encodeObject:forKey:", v4, CFSTR("histogramData"));
  objc_msgSend(*(id *)(a1 + 32), "encodeInt32:forKey:", *((unsigned __int16 *)v5 + 8), CFSTR("bucketCount"));
  v6 = *(void **)(a1 + 32);
  v7 = *((unsigned __int8 *)v5 + 18);

  return objc_msgSend(v6, "encodeBool:forKey:", v7, CFSTR("filter"));
}

void __72___ATXAppLaunchHistogram_initWithHistogram_bucketCount_filter_timeBase___block_invoke(id *a1, void *a2)
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

void __72___ATXAppLaunchHistogram_initWithHistogram_bucketCount_filter_timeBase___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryWithLegacyPathForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("_ATXAppLaunchHistogram.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameters"));

    v2 = 0;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MinLaunchThreshold"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  kLaunchThreshold = v4;

  if (*(double *)&kLaunchThreshold == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *(double *)&kLaunchThreshold);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("_ATXAppLaunchHistogram.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kLaunchThreshold != 0"));

  }
}

uint64_t __79___ATXAppLaunchHistogram__addLaunchWithBundleId_date_timeZone_arbitraryWeight___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return objc_msgSend(*(id *)(a2 + 8), "add:a:b:", *(unsigned __int16 *)(a1 + 36), *(unsigned __int16 *)(a1 + 38), a3);
}

uint64_t __67___ATXAppLaunchHistogram_addLaunchWithBundleId_elapsedTime_weight___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return objc_msgSend(*(id *)(a2 + 8), "add:a:b:", *(unsigned __int16 *)(a1 + 36), *(unsigned __int16 *)(a1 + 38), a3);
}

void __41___ATXAppLaunchHistogram_resetHistogram___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 8), *(id *)(a1 + 32));
}

void __51___ATXAppLaunchHistogram_removeHistoryForBundleId___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  int v5;
  unsigned __int16 v6;

  v3 = a2;
  v6 = 0;
  +[ATXHistogramBundleIdTable sharedInstance](ATXHistogramBundleIdTable, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "lookup:into:", *(_QWORD *)(a1 + 32), &v6);

  if (v5)
    objc_msgSend(v3[1], "deleteWhereA:b:", v6, 0xFFFFLL);
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __52___ATXAppLaunchHistogram_removeHistoryForBundleIds___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned __int16 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v11 = 0;
        +[ATXHistogramBundleIdTable sharedInstance](ATXHistogramBundleIdTable, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = objc_msgSend(v10, "lookup:into:", v9, &v11);

        if ((_DWORD)v9)
        {
          objc_msgSend(v3[1], "deleteWhereA:b:", v11, 0xFFFFLL);
          ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

uint64_t __60___ATXAppLaunchHistogram_launchPopularityWithBundleId_date___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  double v10;
  float v11;
  id v12;
  double v13;
  uint64_t v14;
  void *v15;
  float v16;
  uint64_t result;
  uint64_t v18;

  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned __int16 *)(a1 + 48);
  v6 = *(unsigned __int16 *)(a1 + 50);
  v7 = *(void **)(a2 + 8);
  if (*(_BYTE *)(a2 + 18))
  {
    v8 = *(unsigned __int16 *)(a2 + 16);
    v9 = (id)a2;
    LODWORD(v10) = 1.0;
    objc_msgSend(v7, "lookupSmoothedWithBucketCount:distanceScale:a:b:", v8, v5, v6, v10);
  }
  else
  {
    v12 = (id)a2;
    objc_msgSend(v7, "lookupUnsmoothedA:b:", v5, v6);
  }
  v13 = v11;
  v14 = *(unsigned __int16 *)(a1 + 48);
  v15 = *(void **)(a2 + 8);

  objc_msgSend(v15, "lookupUnsmoothedA:b:", v14, 0xFFFFLL);
  result = objc_msgSend(v4, "ratio:over:", v13, v16);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v18;
  return result;
}

void __82___ATXAppLaunchHistogram_relativeLaunchPopularityWithBundleId_date_distanceScale___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  float v10;
  void *v11;
  float v12;
  uint64_t v13;
  _QWORD *v14;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = *(unsigned __int16 *)(a1 + 52);
  v7 = *(unsigned __int16 *)(a1 + 54);
  v8 = (void *)v3[1];
  v14 = v3;
  if (*((_BYTE *)v3 + 18))
  {
    LODWORD(v4) = *(_DWORD *)(a1 + 48);
    objc_msgSend(v8, "lookupSmoothedWithBucketCount:distanceScale:a:b:", *((unsigned __int16 *)v3 + 8), v6, v7, v4);
  }
  else
  {
    objc_msgSend(v8, "lookupUnsmoothedA:b:", v6, v7);
  }
  v10 = *(float *)&v9;
  v11 = (void *)v14[1];
  if (*((_BYTE *)v14 + 18))
  {
    LODWORD(v9) = *(_DWORD *)(a1 + 48);
    objc_msgSend(v11, "lookupSmoothedWithBucketCount:distanceScale:a:b:", *((unsigned __int16 *)v14 + 8), 0xFFFFLL, *(unsigned __int16 *)(a1 + 54), v9);
  }
  else
  {
    objc_msgSend(v11, "lookupUnsmoothedA:b:", 0xFFFFLL, *(unsigned __int16 *)(a1 + 54));
  }
  objc_msgSend(v5, "ratio:over:", v10, v12);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v13;

}

void __89___ATXAppLaunchHistogram_relativeLaunchPopularityWithBundleId_elapsedTime_distanceScale___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  float v10;
  void *v11;
  float v12;
  uint64_t v13;
  _QWORD *v14;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = *(unsigned __int16 *)(a1 + 52);
  v7 = *(unsigned __int16 *)(a1 + 54);
  v8 = (void *)v3[1];
  v14 = v3;
  if (*((_BYTE *)v3 + 18))
  {
    LODWORD(v4) = *(_DWORD *)(a1 + 48);
    objc_msgSend(v8, "lookupSmoothedWithBucketCount:distanceScale:a:b:", *((unsigned __int16 *)v3 + 8), v6, v7, v4);
  }
  else
  {
    objc_msgSend(v8, "lookupUnsmoothedA:b:", v6, v7);
  }
  v10 = *(float *)&v9;
  v11 = (void *)v14[1];
  if (*((_BYTE *)v14 + 18))
  {
    LODWORD(v9) = *(_DWORD *)(a1 + 48);
    objc_msgSend(v11, "lookupSmoothedWithBucketCount:distanceScale:a:b:", *((unsigned __int16 *)v14 + 8), 0xFFFFLL, *(unsigned __int16 *)(a1 + 54), v9);
  }
  else
  {
    objc_msgSend(v11, "lookupUnsmoothedA:b:", 0xFFFFLL, *(unsigned __int16 *)(a1 + 54));
  }
  objc_msgSend(v5, "ratio:over:", v10, v12);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v13;

}

double __70___ATXAppLaunchHistogram_totalTimeOfDayLaunchesForDate_distanceScale___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4;
  void *v5;
  float v6;
  double result;

  v4 = *(unsigned __int16 *)(a1 + 44);
  v5 = *(void **)(a2 + 8);
  if (*(_BYTE *)(a2 + 18))
  {
    LODWORD(a3) = *(_DWORD *)(a1 + 40);
    objc_msgSend(v5, "lookupSmoothedWithBucketCount:distanceScale:a:b:", *(unsigned __int16 *)(a2 + 16), 0xFFFFLL, v4, a3);
  }
  else
  {
    objc_msgSend(v5, "lookupUnsmoothedA:b:", 0xFFFFLL, v4);
  }
  result = v6;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __77___ATXAppLaunchHistogram_totalTimeOfDayLaunchesForElapsedTime_distanceScale___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4;
  void *v5;
  float v6;
  double result;

  v4 = *(unsigned __int16 *)(a1 + 44);
  v5 = *(void **)(a2 + 8);
  if (*(_BYTE *)(a2 + 18))
  {
    LODWORD(a3) = *(_DWORD *)(a1 + 40);
    objc_msgSend(v5, "lookupSmoothedWithBucketCount:distanceScale:a:b:", *(unsigned __int16 *)(a2 + 16), 0xFFFFLL, v4, a3);
  }
  else
  {
    objc_msgSend(v5, "lookupUnsmoothedA:b:", 0xFFFFLL, v4);
  }
  result = v6;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __61___ATXAppLaunchHistogram_overallLaunchPopularityForBundleId___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  float v8;
  double v9;
  void *v10;
  float v11;
  uint64_t result;
  uint64_t v13;

  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned __int16 *)(a1 + 48);
  v6 = (void *)a2[1];
  v7 = a2;
  objc_msgSend(v6, "lookupUnsmoothedA:b:", v5, 0xFFFFLL);
  v9 = v8;
  v10 = (void *)a2[1];

  objc_msgSend(v10, "lookupUnsmoothedA:b:", 0xFFFFLL, 0xFFFFLL);
  result = objc_msgSend(v4, "ratio:over:", v9, v11);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v13;
  return result;
}

double __39___ATXAppLaunchHistogram_totalLaunches__block_invoke(uint64_t a1, uint64_t a2)
{
  float v3;
  double result;

  objc_msgSend(*(id *)(a2 + 8), "lookupUnsmoothedA:b:", 0xFFFFLL, 0xFFFFLL);
  result = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __52___ATXAppLaunchHistogram_totalLaunchesForBundleIds___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3[1], "lookupUnsmoothedA:b:", objc_msgSend(*(id *)(a1 + 40), "_eventIdforBundleId:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), (_QWORD)v10), 0xFFFFLL);
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                + 24)
                                                                    + v9;
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

void __74___ATXAppLaunchHistogram_totalLaunchesForBundleIds_forDate_distanceScale___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  double v10;
  void *v11;
  float v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(a1 + 40), "_eventIdforBundleId:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
        v11 = (void *)v3[1];
        if (*((_BYTE *)v3 + 18))
        {
          LODWORD(v10) = *(_DWORD *)(a1 + 56);
          objc_msgSend(v11, "lookupSmoothedWithBucketCount:distanceScale:a:b:", *((unsigned __int16 *)v3 + 8), v9, *(unsigned __int16 *)(a1 + 60), v10);
        }
        else
        {
          objc_msgSend(v11, "lookupUnsmoothedA:b:", v9, *(unsigned __int16 *)(a1 + 60));
        }
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                + 24)
                                                                    + v12;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

void __70___ATXAppLaunchHistogram_unsmoothedLaunchesForBundleIds_forLocalTime___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3[1], "lookupUnsmoothedA:b:", objc_msgSend(*(id *)(a1 + 40), "_eventIdforBundleId:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), (_QWORD)v10), *(unsigned __int16 *)(a1 + 56));
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                + 24)
                                                                    + v9;
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

double __48___ATXAppLaunchHistogram_bundleHasBeenLaunched___block_invoke(uint64_t a1, uint64_t a2)
{
  float v3;
  double result;

  objc_msgSend(*(id *)(a2 + 8), "lookupUnsmoothedA:b:", *(unsigned __int16 *)(a1 + 40), 0xFFFFLL);
  result = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __40___ATXAppLaunchHistogram_decayByFactor___block_invoke(uint64_t a1, uint64_t a2)
{
  double v2;

  v2 = *(double *)(a1 + 32);
  *(float *)&v2 = v2;
  return objc_msgSend(*(id *)(a2 + 8), "decayByFactor:", v2);
}

uint64_t __50___ATXAppLaunchHistogram_decayWithHalfLifeInDays___block_invoke(uint64_t a1, uint64_t a2)
{
  double v2;

  v2 = *(double *)(a1 + 32);
  *(float *)&v2 = v2;
  return objc_msgSend(*(id *)(a2 + 8), "decayWithHalfLifeInDays:", v2);
}

uint64_t __35___ATXAppLaunchHistogram_resetData__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 8), "clear");
}

void __37___ATXAppLaunchHistogram_description__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a2 + 8), "description");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

double __45___ATXAppLaunchHistogram_entropyForBundleId___block_invoke(uint64_t a1, uint64_t a2)
{
  float v3;
  double result;

  objc_msgSend(*(id *)(a2 + 8), "entropyWhereA:b:", *(unsigned __int16 *)(a1 + 40), 0xFFFFLL);
  result = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __41___ATXAppLaunchHistogram_entropyForDate___block_invoke(uint64_t a1, uint64_t a2)
{
  float v3;
  double result;

  objc_msgSend(*(id *)(a2 + 8), "entropyWhereA:b:", 0xFFFFLL, *(unsigned __int16 *)(a1 + 40));
  result = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __33___ATXAppLaunchHistogram_entropy__block_invoke(uint64_t a1, uint64_t a2)
{
  float v3;
  double result;

  objc_msgSend(*(id *)(a2 + 8), "entropyWhereA:b:", 0xFFFFLL, 0xFFFFLL);
  result = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __37___ATXAppLaunchHistogram_bucketCount__block_invoke(uint64_t result, uint64_t a2)
{
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_WORD *)(a2 + 16);
  return result;
}

@end
