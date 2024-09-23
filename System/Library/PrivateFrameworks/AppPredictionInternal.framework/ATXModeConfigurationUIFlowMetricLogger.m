@implementation ATXModeConfigurationUIFlowMetricLogger

- (ATXModeConfigurationUIFlowMetricLogger)initWithContactStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ATXModeConfigurationUIFlowMetricLogger *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = -[ATXModeConfigurationUIFlowMetricLogger initWithModeConfigurationUIFlowLoggingBiomeStream:focusModeSignalsLogger:contactStore:](self, "initWithModeConfigurationUIFlowLoggingBiomeStream:focusModeSignalsLogger:contactStore:", v5, v6, v4);

  return v7;
}

- (ATXModeConfigurationUIFlowMetricLogger)initWithFocusModeSignalsLogger:(id)a3 contactStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ATXModeConfigurationUIFlowMetricLogger *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = -[ATXModeConfigurationUIFlowMetricLogger initWithModeConfigurationUIFlowLoggingBiomeStream:focusModeSignalsLogger:contactStore:](self, "initWithModeConfigurationUIFlowLoggingBiomeStream:focusModeSignalsLogger:contactStore:", v8, v7, v6);

  return v9;
}

- (ATXModeConfigurationUIFlowMetricLogger)initWithModeConfigurationUIFlowLoggingBiomeStream:(id)a3 focusModeSignalsLogger:(id)a4 contactStore:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXModeConfigurationUIFlowMetricLogger *v12;
  ATXModeConfigurationUIFlowMetricLogger *v13;
  ATXFocusModeContactsMetricLogger *v14;
  ATXFocusModeContactsMetricLogger *focusModeContactsLogger;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXModeConfigurationUIFlowMetricLogger;
  v12 = -[ATXModeConfigurationUIFlowMetricLogger init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_modeConfigurationUIFlowLoggingBiomeStream, a3);
    objc_storeStrong((id *)&v13->_focusModeSignalsLogger, a4);
    v14 = -[ATXFocusModeContactsMetricLogger initWithContactStore:]([ATXFocusModeContactsMetricLogger alloc], "initWithContactStore:", v11);
    focusModeContactsLogger = v13->_focusModeContactsLogger;
    v13->_focusModeContactsLogger = v14;

  }
  return v13;
}

- (void)logModeConfigurationUIFlowMetric
{
  -[ATXModeConfigurationUIFlowMetricLogger logModeConfigurationUIFlowMetricWithXPCActivity:](self, "logModeConfigurationUIFlowMetricWithXPCActivity:", 0);
}

- (id)modeConfigurationUIFlowBookmark
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(MEMORY[0x1E0CF94D8], "bookmarksPathFile:", CFSTR("modeConfigurationUIFlowBookmark"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initFileURLWithPath:", v3);

  objc_msgSend(MEMORY[0x1E0CF94A0], "bookmarkFromURLPath:maxFileSize:versionNumber:", v4, 1000000, &unk_1E83CDC30);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CF94A0]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithURLPath:versionNumber:bookmark:metadata:", v4, v7, 0, 0);

  }
  return v5;
}

- (void)logCompletion:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "state");
  __atxlog_handle_hero();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      objc_msgSend(v3, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = 136315138;
      v10 = objc_msgSend(v8, "UTF8String");
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Error in receiving events from modeConfigurationUIFlowLogging stream: %s\n", (uint8_t *)&v9, 0xCu);

    }
  }
  else if (v6)
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Received all events from modeConfigurationUIFlowLogging stream\n", (uint8_t *)&v9, 2u);
  }

}

- (void)logModeConfigurationUIFlowMetricWithXPCActivity:(id)a3
{
  id v4;
  void *v5;
  ATXModeConfigurationUIFlowLoggingBiomeStream *modeConfigurationUIFlowLoggingBiomeStream;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;

  v4 = a3;
  -[ATXModeConfigurationUIFlowMetricLogger modeConfigurationUIFlowBookmark](self, "modeConfigurationUIFlowBookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  modeConfigurationUIFlowLoggingBiomeStream = self->_modeConfigurationUIFlowLoggingBiomeStream;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[ATXModeConfigurationUIFlowLoggingBiomeStream publisherFromStartTime:](modeConfigurationUIFlowLoggingBiomeStream, "publisherFromStartTime:", v7 + -1209600.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  objc_msgSend(v5, "bookmark");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __90__ATXModeConfigurationUIFlowMetricLogger_logModeConfigurationUIFlowMetricWithXPCActivity___block_invoke;
  v17[3] = &unk_1E82E8688;
  v17[4] = self;
  v19 = v20;
  v11 = v5;
  v18 = v11;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __90__ATXModeConfigurationUIFlowMetricLogger_logModeConfigurationUIFlowMetricWithXPCActivity___block_invoke_18;
  v14[3] = &unk_1E82DBF90;
  v14[4] = self;
  v12 = v4;
  v15 = v12;
  v16 = v20;
  v13 = (id)objc_msgSend(v8, "drivableSinkWithBookmark:completion:shouldContinue:", v9, v17, v14);

  _Block_object_dispose(v20, 8);
}

void __90__ATXModeConfigurationUIFlowMetricLogger_logModeConfigurationUIFlowMetricWithXPCActivity___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "logCompletion:", a2);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    __atxlog_handle_metrics();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "%@ - XPC Activity deferred, terminating.", (uint8_t *)&v9, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setBookmark:", v5);
  objc_msgSend(*(id *)(a1 + 32), "writeBookmarkToFile:", *(_QWORD *)(a1 + 40));

}

uint64_t __90__ATXModeConfigurationUIFlowMetricLogger_logModeConfigurationUIFlowMetricWithXPCActivity___block_invoke_18(uint64_t a1, void *a2)
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
  int v15;
  uint64_t v16;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "dndModeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setModeUUID:", v6);

  objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dndModeUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "atxModeForDNDMode:", v8);
  ATXModeToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setModeSemanticType:", v9);

  objc_msgSend(v3, "modeConfigurationUI");
  ATXModeConfigurationUIToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setModeConfigurationUI:", v10);

  if (objc_msgSend(v3, "modeConfigurationEntityType"))
  {
    if (objc_msgSend(v3, "modeConfigurationEntityType") == 1)
    {
      objc_msgSend(v4, "setNumContactsAdded:", objc_msgSend(*(id *)(a1 + 32), "numEntitiesAdded:", v3));
      objc_msgSend(v4, "setNumContactsRemoved:", objc_msgSend(*(id *)(a1 + 32), "numEntitiesRemoved:", v3));
      objc_msgSend(v3, "suggestedEntityIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setNumContactsSuggested:", objc_msgSend(v11, "count"));

      objc_msgSend(v3, "currentEntityIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setNumExistingAllowedContacts:", objc_msgSend(v12, "count"));

      objc_msgSend(v4, "setNumSuggestedContactsAdded:", objc_msgSend(*(id *)(a1 + 32), "numSuggestedEntitiesAdded:", v3));
      objc_msgSend(v4, "setNumSuggestedContactsRemoved:", objc_msgSend(*(id *)(a1 + 32), "numSuggestedEntitiesRemoved:", v3));
    }
  }
  else
  {
    objc_msgSend(v4, "setNumAppsAdded:", objc_msgSend(*(id *)(a1 + 32), "numEntitiesAdded:", v3));
    objc_msgSend(v4, "setNumAppsRemoved:", objc_msgSend(*(id *)(a1 + 32), "numEntitiesRemoved:", v3));
    objc_msgSend(v3, "suggestedEntityIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNumAppsSuggested:", objc_msgSend(v13, "count"));

    objc_msgSend(v3, "currentEntityIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNumExistingAllowedApps:", objc_msgSend(v14, "count"));

    objc_msgSend(v4, "setNumSuggestedAppsAdded:", objc_msgSend(*(id *)(a1 + 32), "numSuggestedEntitiesAdded:", v3));
    objc_msgSend(v4, "setNumSuggestedAppsRemoved:", objc_msgSend(*(id *)(a1 + 32), "numSuggestedEntitiesRemoved:", v3));
  }
  objc_msgSend(v4, "logToCoreAnalytics");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "logFocusModeAppSignalsWithModeConfigurationUIFlowLoggingEvent:xpcActivity:", v3, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "logFocusModeContactSignalsWithModeConfigurationUIFlowLoggingEvent:xpcActivity:", v3, *(_QWORD *)(a1 + 40));
  v15 = objc_msgSend(*(id *)(a1 + 40), "didDefer");
  if (v15)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  v16 = v15 ^ 1u;

  return v16;
}

- (void)writeBookmarkToFile:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v6 = 0;
  objc_msgSend(a3, "saveBookmarkWithError:", &v6);
  v4 = v6;
  if (v4)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ATXDigestOnboardingAppSelectionMetricsLogger writeBookmarkToFile:].cold.1((uint64_t)self, (uint64_t)v4, v5);

  }
}

- (unint64_t)numEntitiesAdded:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v3, "previousEntityIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "currentEntityIdentifiers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v7);
        v10 += objc_msgSend(v6, "containsObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i)) ^ 1;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)numEntitiesRemoved:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v3, "currentEntityIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "previousEntityIdentifiers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v7);
        v10 += objc_msgSend(v6, "containsObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i)) ^ 1;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)numSuggestedEntitiesAdded:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v3, "suggestedEntityIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v3, "previousEntityIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "currentEntityIdentifiers", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v9, "containsObject:", v16) & 1) == 0)
          v13 += objc_msgSend(v6, "containsObject:", v16);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)numSuggestedEntitiesRemoved:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  __int128 v34;
  __int128 v35;
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
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dndModeUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "atxModeForDNDMode:", v7);

  if (objc_msgSend(v3, "modeConfigurationEntityType"))
  {
    if (objc_msgSend(v3, "modeConfigurationEntityType") != 1)
      goto LABEL_19;
    +[ATXModeEntityScorerServer sharedInstance](ATXModeEntityScorerServer, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rankedContactsForMode:options:", v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recommendedAllowedContactsForContactScores:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v39 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v14);
    }

  }
  else
  {
    objc_msgSend(v4, "recommendedAllowedAppsForMode:", v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v18 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v43 != v20)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v22);

        }
        v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v19);
    }
  }

LABEL_19:
  v23 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v3, "currentEntityIdentifiers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithArray:", v24);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v3, "previousEntityIdentifiers", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v27)
  {
    v28 = v27;
    v29 = 0;
    v30 = *(_QWORD *)v35;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v35 != v30)
          objc_enumerationMutation(v26);
        v32 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k);
        if ((objc_msgSend(v25, "containsObject:", v32) & 1) == 0)
          v29 += objc_msgSend(v5, "containsObject:", v32);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v28);
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusModeContactsLogger, 0);
  objc_storeStrong((id *)&self->_focusModeSignalsLogger, 0);
  objc_storeStrong((id *)&self->_modeConfigurationUIFlowLoggingBiomeStream, 0);
}

@end
