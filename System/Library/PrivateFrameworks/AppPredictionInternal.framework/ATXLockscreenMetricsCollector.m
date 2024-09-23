@implementation ATXLockscreenMetricsCollector

- (void)postDailyMetrics
{
  id v2;

  v2 = -[ATXLockscreenMetricsCollector _dailyMetricsDescription_shouldPost:](self, "_dailyMetricsDescription_shouldPost:", 1);
}

- (id)dailyMetricsDescription
{
  return -[ATXLockscreenMetricsCollector _dailyMetricsDescription_shouldPost:](self, "_dailyMetricsDescription_shouldPost:", 0);
}

- (void)postSwitchMetricWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v10 = (id)objc_opt_new();
  objc_msgSend(v4, "lockscreenId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXLockscreenMetricsCollector _weeklyRollingIdFromLockscreenId:](self, "_weeklyRollingIdFromLockscreenId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLockscreenId:", v6);

  objc_msgSend(v4, "switchMechanism");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSwitchMechanism:", v7);

  objc_msgSend(v4, "outcome");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOutcome:", v8);

  v9 = objc_msgSend(v4, "duration");
  objc_msgSend(v10, "setDuration:", v9);
  objc_msgSend(v10, "logToCoreAnalytics");

}

- (void)postEditMetricWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v10 = (id)objc_opt_new();
  objc_msgSend(v4, "lockscreenId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXLockscreenMetricsCollector _weeklyRollingIdFromLockscreenId:](self, "_weeklyRollingIdFromLockscreenId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLockscreenId:", v6);

  objc_msgSend(v4, "entryPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEntryPoint:", v7);

  objc_msgSend(v10, "setIsNew:", objc_msgSend(v4, "isNewlyCreated"));
  objc_msgSend(v10, "setSecondsSinceLastEdit:", objc_msgSend(v4, "secondsSinceLastEdit"));
  objc_msgSend(v4, "outcome");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOutcome:", v8);

  objc_msgSend(v10, "setDuration:", objc_msgSend(v4, "duration"));
  objc_msgSend(v10, "setUserChangedColor:", objc_msgSend(v4, "userChangedColor"));
  objc_msgSend(v10, "setUserChangedFont:", objc_msgSend(v4, "userChangedFont"));
  objc_msgSend(v10, "setUserChangedNumberingSystem:", objc_msgSend(v4, "userChangedNumberingSystem"));
  objc_msgSend(v10, "setUserChangedPosterContent:", objc_msgSend(v4, "userChangedPosterContent"));
  objc_msgSend(v10, "setUserChangedWidgets:", objc_msgSend(v4, "userChangedWidgets"));
  v9 = objc_msgSend(v4, "didLockscreenHaveWidgetsBeforeEdit");

  objc_msgSend(v10, "setDidLockscreenHaveWidgetsBeforeEdit:", v9);
  objc_msgSend(v10, "logToCoreAnalytics");

}

- (id)_dailyMetricsDescription_shouldPost:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  void *v27;
  _BOOL4 v28;
  id obj;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
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
  _BYTE v50[128];
  uint64_t v51;

  v28 = a3;
  v51 = *MEMORY[0x1E0C80C00];
  +[ATXPosterConfigurationCache sharedInstance](ATXPosterConfigurationCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v27 = (void *)objc_opt_new();
  -[ATXLockscreenMetricsCollector _fillSummaryMetric:configurations:](self, "_fillSummaryMetric:configurations:");
  objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v5;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v33)
  {
    v30 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v45 != v30)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v8, "posterUUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXLockscreenMetricsCollector _weeklyRollingIdFromLockscreenId:](self, "_weeklyRollingIdFromLockscreenId:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[ATXLockscreenMetricsCollector _configurationMetricFromPosterConfiguration:lockscreenId:modeClient:](self, "_configurationMetricFromPosterConfiguration:lockscreenId:modeClient:", v8, v10, v31);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObject:");
        objc_msgSend(v8, "inlineComplication");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXLockscreenMetricsCollector _widgetMetricFromComplication:lockscreenId:isLandscape:](self, "_widgetMetricFromComplication:lockscreenId:isLandscape:", v11, v10, 0);
        v12 = objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v6, "addObject:", v12);
        v34 = (void *)v12;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend(v8, "complications");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v41;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v41 != v16)
                objc_enumerationMutation(v13);
              -[ATXLockscreenMetricsCollector _widgetMetricFromComplication:lockscreenId:isLandscape:](self, "_widgetMetricFromComplication:lockscreenId:isLandscape:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j), v10, 0);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
                objc_msgSend(v6, "addObject:", v18);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          }
          while (v15);
        }

        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v8, "landscapeComplications");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v37;
          do
          {
            for (k = 0; k != v21; ++k)
            {
              if (*(_QWORD *)v37 != v22)
                objc_enumerationMutation(v19);
              -[ATXLockscreenMetricsCollector _widgetMetricFromComplication:lockscreenId:isLandscape:](self, "_widgetMetricFromComplication:lockscreenId:isLandscape:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * k), v10, 1);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v24)
                objc_msgSend(v6, "addObject:", v24);

            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
          }
          while (v21);
        }

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v33);
  }

  if (v28)
    -[ATXLockscreenMetricsCollector _postConfigurationMetrics:widgetMetrics:summaryMetric:](self, "_postConfigurationMetrics:widgetMetrics:summaryMetric:", v32, v6, v27);
  -[ATXLockscreenMetricsCollector _dailyMetricsDescriptionGivenConfigurationMetrics:widgetMetrics:summaryMetric:](self, "_dailyMetricsDescriptionGivenConfigurationMetrics:widgetMetrics:summaryMetric:", v32, v6, v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)_configurationMetricFromPosterConfiguration:(id)a3 lockscreenId:(id)a4 modeClient:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setLockscreenId:", v9);

  objc_msgSend(v7, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v11);

  objc_msgSend(v7, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColor:", v12);

  objc_msgSend(v7, "numberingSystem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberingSystem:", v13);

  objc_msgSend(v7, "complications");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    objc_msgSend(v7, "complications");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNumWidgets:", objc_msgSend(v16, "count"));

  }
  objc_msgSend(v7, "landscapeComplications");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    objc_msgSend(v7, "landscapeComplications");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNumLandscapeWidgets:", objc_msgSend(v19, "count"));

  }
  objc_msgSend(v10, "setHasCustomInlineComplication:", 0);
  objc_msgSend(v7, "inlineComplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    objc_msgSend(v10, "setHasCustomInlineComplication:", 1);
  objc_msgSend(v7, "galleryItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSource:", objc_msgSend(v21, "source"));

  objc_msgSend(v7, "extensionBundleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setExtensionBundleId:", v22);

  if (objc_msgSend(v7, "isActive"))
  {
    objc_msgSend(v10, "setIsSelected:", 1);
  }
  else
  {
    v23 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v24 = (void *)objc_msgSend(v23, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    objc_msgSend(v24, "dictionaryForKey:", *MEMORY[0x1E0CF95E8]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "posterUUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_opt_new();
      objc_msgSend(v28, "dateByAddingUnit:value:toDate:options:", 16, -7, v29, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v30, "compare:", v27) == -1)
        objc_msgSend(v10, "setIsSelected:", 1);

    }
  }
  objc_msgSend(v7, "modeUUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_msgSend(v8, "modeConfigurationForDNDModeWithUUID:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      objc_msgSend(v32, "mode");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(v33, "mode");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "semanticType");
        DNDModeSemanticTypeToString();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setRelatedFocus:", v36);

      }
    }

  }
  return v10;
}

- (id)_widgetMetricFromComplication:(id)a3 lockscreenId:(id)a4 isLandscape:(BOOL)a5
{
  void *v5;
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a3;
  if (a3)
  {
    v6 = a5;
    v7 = a4;
    v8 = v5;
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setLockscreenId:", v7);

    objc_msgSend(v8, "extensionBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExtensionBundleId:", v9);

    objc_msgSend(v8, "kind");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setKind:", v10);

    objc_msgSend(v5, "setFamily:", objc_msgSend(v8, "widgetFamily"));
    LODWORD(v10) = objc_msgSend(v8, "source");

    objc_msgSend(v5, "setSource:", (int)v10);
    objc_msgSend(v5, "setIsLandscape:", v6);
  }
  return v5;
}

- (void)_postConfigurationMetrics:(id)a3 widgetMetrics:(id)a4 summaryMetric:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v13++), "logToCoreAnalytics");
      }
      while (v11 != v13);
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v11);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "logToCoreAnalytics", (_QWORD)v19);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

  objc_msgSend(v9, "logToCoreAnalytics");
}

- (id)_dailyMetricsDescriptionGivenConfigurationMetrics:(id)a3 widgetMetrics:(id)a4 summaryMetric:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v10, "appendString:", CFSTR("\n------------------------------------------------------\n"));
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metricName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v12);

    objc_msgSend(v10, "appendString:", CFSTR("\n"));
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v38;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v17), "coreAnalyticsDictionary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "description");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendString:", v19);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v15);
  }

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v10, "appendString:", CFSTR("\n------------------------------------------------------\n"));
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "metricName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v21);

    objc_msgSend(v10, "appendString:", CFSTR("\n"));
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = v8;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v34;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v26), "coreAnalyticsDictionary", (_QWORD)v33);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "description");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendString:", v28);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v24);
  }

  objc_msgSend(v10, "appendString:", CFSTR("\n------------------------------------------------------\n"));
  objc_msgSend(v9, "metricName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendString:", v29);

  objc_msgSend(v10, "appendString:", CFSTR("\n"));
  objc_msgSend(v9, "coreAnalyticsDictionary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "description");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendString:", v31);

  return v10;
}

- (void)_fillSummaryMetric:(id)a3 configurations:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v5 = a4;
  v6 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v7 = (void *)objc_msgSend(v6, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  if ((objc_msgSend(v7, "BOOLForKey:", *MEMORY[0x1E0CF95C8]) & 1) == 0)
  {
    v10 = v16;
    v11 = 0;
LABEL_8:
    objc_msgSend(v10, "setEditingUiExperienced:", v11);
    goto LABEL_9;
  }
  objc_msgSend(v16, "setEditingUiExperienced:", 2);
  if (!objc_msgSend(v5, "count"))
  {
    v10 = v16;
    v11 = 1;
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extensionBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.PaperBoard.LegacyPoster")))
    {

    }
    else
    {
      objc_msgSend(v8, "extensionBundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.WallpaperKit.CollectionsPoster"));

      if (!v13)
      {
LABEL_15:

        goto LABEL_9;
      }
    }
    objc_msgSend(v8, "complications");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {

    }
    else
    {
      objc_msgSend(v8, "inlineComplication");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        objc_msgSend(v16, "setEditingUiExperienced:", 1);
    }
    goto LABEL_15;
  }
LABEL_9:

}

- (id)_weeklyRollingIdFromLockscreenId:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v12;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "rangeOfUnit:startDate:interval:forDate:", 0x2000, &v12, 0, v6);
  v7 = v12;
  v8 = objc_msgSend(v4, "hash");

  v9 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v9 - v8 + 32 * v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
