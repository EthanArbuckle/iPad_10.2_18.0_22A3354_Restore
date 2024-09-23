@implementation ATXHeroDataServerHelper

+ (id)bundleIdForPrediction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2FC90];
  v6 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D2FC90]);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v3, "bundleId");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v7 = objc_msgSend(v3, "adamId");
  if (v7 != *MEMORY[0x1E0D2FC88])
  {
    objc_msgSend(MEMORY[0x1E0CF8CE8], "bundleIdForAdamIdIfInstalled:", objc_msgSend(v3, "adamId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_msgSend(MEMORY[0x1E0CF8CE8], "isAppClipForBundleId:", v10);
      v12 = v10;
      if (!v11)
      {
LABEL_14:
        v9 = v12;

        goto LABEL_15;
      }
      __atxlog_handle_hero();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "bundleId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v14;
        v15 = "App clip predicted as a Hero App. Ignoring. BundleId: %@";
LABEL_12:
        _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v17, 0xCu);

      }
    }
    else
    {
      __atxlog_handle_hero();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "adamId"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v14;
        v15 = "Adam id: %@ is not installed or is restricted.";
        goto LABEL_12;
      }
    }

    v12 = v5;
    goto LABEL_14;
  }
  v8 = v5;
LABEL_5:
  v9 = v8;
LABEL_15:

  return v9;
}

+ (id)inRadiusPredictionsFrom:(id)a3 currentLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__ATXHeroDataServerHelper_inRadiusPredictionsFrom_currentLocation___block_invoke;
  v10[3] = &unk_1E82EBD28;
  v11 = v6;
  v12 = a1;
  v7 = v6;
  objc_msgSend(a3, "_pas_filteredArrayWithTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __67__ATXHeroDataServerHelper_inRadiusPredictionsFrom_currentLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "isPredictionInRadius:currentLocation:", a2, *(_QWORD *)(a1 + 32));
}

+ (BOOL)isPredictionInRadius:(id)a3 currentLocation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  id v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v5 = a3;
  v6 = a4;
  +[ATXHeroAndClipConstants sharedInstance](ATXHeroAndClipConstants, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latitude");
  v8 = *MEMORY[0x1E0D2FC80];
  if (v9 == *MEMORY[0x1E0D2FC80] && (objc_msgSend(v5, "longitude"), v10 == v8))
  {
    v11 = 1;
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v5, "latitude");
    v14 = v13;
    objc_msgSend(v5, "longitude");
    v16 = (void *)objc_msgSend(v12, "initWithLatitude:longitude:", v14, v15);
    objc_msgSend(v6, "distanceFromLocation:", v16);
    v18 = v17;

    objc_msgSend(v6, "horizontalAccuracy");
    if (v19 < 0.0 || (v20 = v19, objc_msgSend(v7, "heroAppWorstCaseLocationAccuracy"), v20 > v21))
    {
      objc_msgSend(v7, "heroAppWorstCaseLocationAccuracy");
      v20 = v22;
    }
    v11 = v18 <= v20 + (double)(unint64_t)objc_msgSend(v5, "radiusInMeters");
  }

  return v11;
}

+ (BOOL)canPredictClipsGivenRecentMotion
{
  void *v2;
  int v3;
  ATXPredictionContextBuilder *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableLocationQualityChecksForHeroApp");

  if (v3)
  {
    __atxlog_handle_hero();
    v4 = (ATXPredictionContextBuilder *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1C9A3B000, &v4->super, OS_LOG_TYPE_DEFAULT, "Not filtering by motion because testing mode is enabled", (uint8_t *)&v12, 2u);
    }
    LOBYTE(v5) = 1;
  }
  else
  {
    v4 = objc_alloc_init(ATXPredictionContextBuilder);
    -[ATXPredictionContextBuilder predictionContextForCurrentContext](v4, "predictionContextForCurrentContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "locationMotionContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "canPredictClipsGivenRecentMotion");

      __atxlog_handle_hero();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = CFSTR("NO");
        if (v5)
          v10 = CFSTR("YES");
        v12 = 138412290;
        v13 = v10;
        _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Are clips eligible according to motion: %@", (uint8_t *)&v12, 0xCu);
      }

    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  return v5;
}

+ (id)heroAppPredictionsSortedByDistance:(id)a3 currentLocation:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  __atxlog_handle_hero();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "Sorting predictions based on distance.", buf, 2u);
    }

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __78__ATXHeroDataServerHelper_heroAppPredictionsSortedByDistance_currentLocation___block_invoke;
    v11[3] = &unk_1E82EBD50;
    v12 = v6;
    objc_msgSend(v5, "sortedArrayUsingComparator:", v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "Cant sort predictions with nil location. Returning as is", buf, 2u);
    }

    v9 = v5;
  }

  return v9;
}

uint64_t __78__ATXHeroDataServerHelper_heroAppPredictionsSortedByDistance_currentLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;

  v5 = *(void **)(a1 + 32);
  v6 = (objc_class *)MEMORY[0x1E0C9E3B8];
  v7 = a3;
  v8 = a2;
  v9 = [v6 alloc];
  objc_msgSend(v8, "latitude");
  v11 = v10;
  objc_msgSend(v8, "longitude");
  v13 = v12;

  v14 = (void *)objc_msgSend(v9, "initWithLatitude:longitude:", v11, v13);
  objc_msgSend(v5, "distanceFromLocation:", v14);
  v16 = v15;

  v17 = *(void **)(a1 + 32);
  v18 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend(v7, "latitude");
  v20 = v19;
  objc_msgSend(v7, "longitude");
  v22 = v21;

  v23 = (void *)objc_msgSend(v18, "initWithLatitude:longitude:", v20, v22);
  objc_msgSend(v17, "distanceFromLocation:", v23);
  v25 = v24;

  if (v16 < v25)
    return -1;
  else
    return v16 > v25;
}

@end
