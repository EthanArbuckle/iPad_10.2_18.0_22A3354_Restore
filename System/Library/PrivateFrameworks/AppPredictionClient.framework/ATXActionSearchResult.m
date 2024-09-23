@implementation ATXActionSearchResult

+ (id)predictedActionSearchResultsWithLimit:(int64_t)a3 forBundleIdentifiers:(id)a4
{
  NSObject *v6;
  uint64_t v7;
  void *v9;
  ATXAVRoutingSessionHelper *v10;
  double v11;
  ATXAVRoutingSessionHelper *v12;
  void *v13;
  id v14;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  int64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_blending();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v45 = a3;
    _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "predictedActionSearchResultsWithLimit %lu.", buf, 0xCu);
  }

  if (!+[ATXDeviceClass shouldComputeActions](ATXDeviceClass, "shouldComputeActions"))
    return 0;
  if (objc_msgSend(a1, "_demoModeEnabled"))
  {
    objc_msgSend(a1, "_demoModeActionResponse");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if ((objc_msgSend(a1, "shouldDisplayRecentDonationsForTesting") & 1) != 0
    || (objc_msgSend(a1, "shouldDisplayUpcomingMediaForTesting") & 1) != 0
    || objc_msgSend(a1, "shouldDisplayValidParameterCombinations"))
  {
    objc_msgSend(a1, "actionResponseForDeveloperMode");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v9 = (void *)v7;
    if (v7)
      goto LABEL_12;
LABEL_39:
    v30 = 0;
    goto LABEL_40;
  }
  v31 = (void *)objc_opt_new();
  v32 = v31;
  if ((int)a3 >= 3)
    v33 = 3;
  else
    v33 = a3;
  objc_msgSend(v31, "actionPredictionsForConsumerSubType:limit:", 21, v33);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_39;
LABEL_12:
  v10 = [ATXAVRoutingSessionHelper alloc];
  LODWORD(v11) = 0.5;
  v12 = -[ATXAVRoutingSessionHelper initWithAcceptThreshold:avRoutingSessionManager:](v10, "initWithAcceptThreshold:avRoutingSessionManager:", 0, v11);
  v13 = (void *)objc_opt_new();
  v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v9, "scoredActions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

  objc_msgSend(v9, "scoredActions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

  }
  else
  {
    objc_msgSend(v9, "proactiveSuggestions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(v9, "proactiveSuggestions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v39 != v27)
              objc_enumerationMutation(v18);
            objc_msgSend(a1, "actionSearchResultFromProactiveSuggestion:actionResponse:avRoutingSessionHelper:nowPlayingDataProvider:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i), v9, v12, v13);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29)
              objc_msgSend(v16, "addObject:", v29);

          }
          v26 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v26);
      }
      goto LABEL_34;
    }
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v9, "scoredActions", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(a1, "actionSearchResultFromScoredAction:actionResponse:avRoutingSessionHelper:nowPlayingDataProvider:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j), v9, v12, v13);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(v16, "addObject:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v20);
  }
LABEL_34:

  v30 = (void *)objc_msgSend(v16, "copy");
LABEL_40:

  return v30;
}

+ (id)actionSearchResultFromScoredAction:(id)a3 actionResponse:(id)a4 avRoutingSessionHelper:(id)a5 nowPlayingDataProvider:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  NSObject *v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "predictedItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[ATXApplicationRecord isDeviceManagementPolicyOkForBundleId:](ATXApplicationRecord, "isDeviceManagementPolicyOkForBundleId:", v14);

  if (v15)
  {
    objc_msgSend(v9, "predictedItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isTVWhiteListedLongFormMedia"))
    {
      if ((objc_msgSend(v12, "isTVExperienceAppNowPlaying") & 1) == 0)
      {
        objc_msgSend(v11, "predictedRouteInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "actionWithRouteInfo:", v17);
        v18 = objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v10, "containsExternalRoute") & 1) == 0)
        {
          objc_msgSend(v11, "predictedRouteInfo");
          v19 = objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = (void *)v19;
            objc_msgSend(v11, "predictedRouteInfo");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isExternalRoute");

            if (v22)
              objc_msgSend(v10, "setContainsExternalRoute:", 1);
          }
        }
        goto LABEL_15;
      }
    }
    else
    {
      if (!objc_msgSend(v16, "isTVAction"))
      {
        v18 = (uint64_t)v16;
LABEL_15:
        +[ATXActionSearchResult generatedSearchResultForAction:actionResponse:](ATXActionSearchResult, "generatedSearchResultForAction:actionResponse:", v18, v10);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)v18;
        goto LABEL_16;
      }
      __atxlog_handle_default();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        +[ATXActionSearchResult actionSearchResultFromScoredAction:actionResponse:avRoutingSessionHelper:nowPlayingDataProvider:].cold.1(v24);

    }
    v23 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v23 = 0;
LABEL_17:

  return v23;
}

+ (id)generatedSearchResultForAction:(id)a3 actionResponse:(id)a4
{
  id v5;
  id v6;
  ATXActionSearchResult *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(ATXActionSearchResult);
  -[ATXActionSearchResult setAtxAction:](v7, "setAtxAction:", v6);

  -[ATXActionSearchResult setActionResponse:](v7, "setActionResponse:", v5);
  return v7;
}

+ (id)actionSearchResultFromProactiveSuggestion:(id)a3 actionResponse:(id)a4 avRoutingSessionHelper:(id)a5 nowPlayingDataProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  int v18;
  void *v19;
  ATXScoredPrediction *v20;
  void *v21;
  double v22;
  ATXScoredPrediction *v23;
  ATXActionSearchResult *v24;
  objc_class *v25;
  void *v26;
  int v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "executableSpecification");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "executableClassString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "isEqualToString:", v17);

  if (!v18)
  {
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v15, "isEqualToString:", v26);

    if (!v27)
    {
      objc_msgSend(a1, "generatedSearchResultForProactiveSuggestion:actionResponse:", v10, v11);
      v24 = (ATXActionSearchResult *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    objc_msgSend(a1, "_unarchiveATXHeroDataFromSuggestion:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v24 = objc_alloc_init(ATXActionSearchResult);
      -[ATXActionSearchResult setHeroApp:](v24, "setHeroApp:", v19);
      -[ATXActionSearchResult setActionResponse:](v24, "setActionResponse:", v11);
      -[ATXSuggestionSearchResult setProactiveSuggestion:](v24, "setProactiveSuggestion:", v10);
      goto LABEL_8;
    }
LABEL_7:
    v24 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v10, "atxActionExecutableObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_7;
  v20 = [ATXScoredPrediction alloc];
  objc_msgSend(v10, "scoreSpecification");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rawScore");
  *(float *)&v22 = v22;
  v23 = -[ATXScoredPrediction initWithPredictedItem:score:](v20, "initWithPredictedItem:score:", v19, v22);

  objc_msgSend(a1, "actionSearchResultFromScoredAction:actionResponse:avRoutingSessionHelper:nowPlayingDataProvider:", v23, v11, v12, v13);
  v24 = (ATXActionSearchResult *)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestionSearchResult setProactiveSuggestion:](v24, "setProactiveSuggestion:", v10);

LABEL_8:
LABEL_10:

  return v24;
}

+ (id)_unarchiveObjectFromSuggestion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  Class v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v16;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A85A4F90]();
  v5 = (void *)MEMORY[0x1E0CB3710];
  objc_msgSend(v3, "executableSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executableClassString");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = NSClassFromString(v7);
  objc_msgSend(v3, "executableSpecification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", v8, v10, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;

  objc_autoreleasePoolPop(v4);
  if (v11 || !v12)
  {
    v14 = v11;
  }
  else
  {
    __atxlog_handle_default();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[ATXActionSearchResult _unarchiveObjectFromSuggestion:].cold.1((uint64_t)v12, v13);

    v14 = 0;
  }

  return v14;
}

+ (id)_unarchiveATXHeroDataFromSuggestion:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a1, "_unarchiveObjectFromSuggestion:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

+ (id)generatedSearchResultForProactiveSuggestion:(id)a3 actionResponse:(id)a4
{
  id v5;
  id v6;
  ATXActionSearchResult *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(ATXActionSearchResult);
  -[ATXSuggestionSearchResult setProactiveSuggestion:](v7, "setProactiveSuggestion:", v6);

  -[ATXActionSearchResult setActionResponse:](v7, "setActionResponse:", v5);
  return v7;
}

- (ATXActionSearchResult)init
{
  ATXActionSearchResult *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXActionSearchResult;
  v2 = -[ATXActionSearchResult init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXActionSearchResult setIdentifier:](v2, "setIdentifier:", v4);

  }
  return v2;
}

- (id)blendingModelUICacheUpdateUUID
{
  return -[ATXActionResponse blendingModelUICacheUpdateUUID](self->_actionResponse, "blendingModelUICacheUpdateUUID");
}

- (void)setAtxAction:(id)a3
{
  ATXAction *v5;
  ATXAction **p_atxAction;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  ATXAction *v11;
  void *v12;
  void *v13;
  ATXAction *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;

  v5 = (ATXAction *)a3;
  p_atxAction = &self->_atxAction;
  if (self->_atxAction != v5)
  {
    objc_storeStrong((id *)&self->_atxAction, a3);
    -[ATXAction _bundleIdForDisplay](*p_atxAction, "_bundleIdForDisplay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXActionSearchResult setApplicationBundleIdentifier:](self, "setApplicationBundleIdentifier:", v7);

    -[ATXActionSearchResult _updateInlineCardWithContent:](self, "_updateInlineCardWithContent:", *p_atxAction);
    -[ATXAction _spotlightContentType](*p_atxAction, "_spotlightContentType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXActionSearchResult setContentType:](self, "setContentType:", v8);

    v9 = objc_alloc_init(MEMORY[0x1E0D8C5E0]);
    -[ATXActionSearchResult setPunchout:](self, "setPunchout:", v9);

    v10 = -[ATXAction actionType](*p_atxAction, "actionType");
    v11 = *p_atxAction;
    if (v10 == 1)
    {
      -[ATXAction userActivityString](v11, "userActivityString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXActionSearchResult setUserActivityRequiredString:](self, "setUserActivityRequiredString:", v12);
LABEL_6:

      goto LABEL_7;
    }
    -[ATXAction intent](v11, "intent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *p_atxAction;
    if (v13)
    {
      -[ATXAction intent](v14, "intent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "_supportsBackgroundExecution");
      -[ATXActionSearchResult punchout](self, "punchout");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setIsRunnableInBackground:", v15);

      goto LABEL_6;
    }
    if (-[ATXAction actionType](v14, "actionType") == 5)
    {
      -[ATXActionSearchResult punchout](self, "punchout");
      v17 = objc_claimAutoreleasedReturnValue();
      -[NSObject setIsRunnableInBackground:](v17, "setIsRunnableInBackground:", 1);
    }
    else
    {
      __atxlog_handle_default();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[ATXActionSearchResult setAtxAction:].cold.1(v17);
    }

  }
LABEL_7:

}

- (void)setHeroApp:(id)a3
{
  ATXHeroData *v5;
  ATXHeroData **p_heroApp;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = (ATXHeroData *)a3;
  p_heroApp = &self->_heroApp;
  if (self->_heroApp != v5)
  {
    objc_storeStrong((id *)&self->_heroApp, a3);
    -[ATXHeroData clipMetadata](v5, "clipMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[ATXActionSearchResult setApplicationBundleIdentifier:](self, "setApplicationBundleIdentifier:", CFSTR("com.apple.application"));
      v8 = (void *)MEMORY[0x1E0CB3940];
      -[ATXHeroData clipMetadata](*p_heroApp, "clipMetadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "webClipID");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = (const __CFString *)v10;
      else
        v12 = &stru_1E4D5DB30;
      objc_msgSend(v8, "stringWithFormat:", CFSTR("com.apple.appclip-%@"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXActionSearchResult setIdentifier:](self, "setIdentifier:", v13);

      -[ATXActionSearchResult setType:](self, "setType:", 23);
      -[ATXActionSearchResult _updateInlineCardWithContent:](self, "_updateInlineCardWithContent:", *p_heroApp);
      v14 = objc_alloc_init(MEMORY[0x1E0D8C5E0]);
      -[ATXActionSearchResult setPunchout:](self, "setPunchout:", v14);

      -[ATXHeroData clipMetadata](v5, "clipMetadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "clipURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXActionSearchResult punchout](self, "punchout");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setUrls:", v17);

      -[ATXActionSearchResult punchout](self, "punchout");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setHasClip:", 1);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Nearby"), &stru_1E4D5DB30, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXActionSearchResult setNearbyBusinessesString:](self, "setNearbyBusinessesString:", v21);

    }
  }

}

- (void)_updateInlineCardWithContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  dispatch_semaphore_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  v16 = 0;
  v17 = (uint64_t)&v16;
  v18 = 0x2020000000;
  v5 = getAPUIRegisterCardServicesIfNeededSymbolLoc_ptr;
  v19 = getAPUIRegisterCardServicesIfNeededSymbolLoc_ptr;
  if (!getAPUIRegisterCardServicesIfNeededSymbolLoc_ptr)
  {
    v6 = (void *)AppPredictionUILibrary();
    v5 = dlsym(v6, "APUIRegisterCardServicesIfNeeded");
    *(_QWORD *)(v17 + 24) = v5;
    getAPUIRegisterCardServicesIfNeededSymbolLoc_ptr = v5;
  }
  _Block_object_dispose(&v16, 8);
  if (!v5)
    -[ATXActionSearchResult _updateInlineCardWithContent:].cold.1();
  ((void (*)(void))v5)();
  v16 = 0;
  v17 = (uint64_t)&v16;
  v18 = 0x2020000000;
  v7 = getAPUIRegisterCardKitProvidersIfNeededSymbolLoc_ptr;
  v19 = getAPUIRegisterCardKitProvidersIfNeededSymbolLoc_ptr;
  if (!getAPUIRegisterCardKitProvidersIfNeededSymbolLoc_ptr)
  {
    v8 = (void *)AppPredictionUILibrary();
    v7 = dlsym(v8, "APUIRegisterCardKitProvidersIfNeeded");
    *(_QWORD *)(v17 + 24) = v7;
    getAPUIRegisterCardKitProvidersIfNeededSymbolLoc_ptr = v7;
  }
  _Block_object_dispose(&v16, 8);
  if (!v7)
    -[ATXActionSearchResult _updateInlineCardWithContent:].cold.2();
  ((void (*)(void))v7)();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v9 = (void *)getCRSCardRequestClass_softClass;
  v24 = getCRSCardRequestClass_softClass;
  v10 = MEMORY[0x1E0C809B0];
  if (!getCRSCardRequestClass_softClass)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = (uint64_t)__getCRSCardRequestClass_block_invoke;
    v19 = &unk_1E4D570B8;
    v20 = &v21;
    __getCRSCardRequestClass_block_invoke((uint64_t)&v16);
    v9 = (void *)v22[3];
  }
  v11 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v21, 8);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setFormat:", 2);
  objc_msgSend(v12, "setContent:", v4);
  objc_msgSend(v12, "setLoadsBundleServices:", 0);
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __54__ATXActionSearchResult__updateInlineCardWithContent___block_invoke;
  v14[3] = &unk_1E4D58EA8;
  v14[4] = self;
  v15 = dispatch_semaphore_create(0);
  v13 = v15;
  objc_msgSend(v12, "startWithReply:", v14);
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v13, 5.0);

}

intptr_t __54__ATXActionSearchResult__updateInlineCardWithContent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "card");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setInlineCard:", v3);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (id)_demoModeActionResponse
{
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  uint64_t v31;
  ATXAction *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  uint64_t v38;
  void *v39;
  __CFString *v40;
  __CFString *v41;
  uint64_t v42;
  void *v43;
  __CFString *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  ATXAction *v51;
  void *v52;
  ATXAction *v53;
  ATXScoredPrediction *v54;
  double v55;
  ATXScoredPrediction *v56;
  ATXScoredPrediction *v57;
  double v58;
  ATXScoredPrediction *v59;
  void *v60;
  ATXActionResponse *v61;
  uint64_t v63;
  uint64_t v64;
  ATXAction *v65;
  __CFString *v66;
  __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  __CFString *v72;
  void *v73;
  void *v74;
  _QWORD v75[2];
  void *v76;
  _QWORD v77[2];

  v77[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.DuetExpertCenter.AppPredictionExpert"));
  objc_msgSend(v2, "stringForKey:", CFSTR("demoActionContactName"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("Eddy Cue");
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  objc_msgSend(v2, "stringForKey:", CFSTR("demoActionContactEmail"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("eddy@example.com");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  objc_msgSend(v2, "stringForKey:", CFSTR("demoActionMessageContent"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = CFSTR("Iʼm running late.");
  if (v11)
    v13 = (__CFString *)v11;
  v14 = v13;

  objc_msgSend(v2, "stringForKey:", CFSTR("demoActionMessageSubtitle"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = CFSTR("“Shortcuts Launch Planning” starts at 3:00 PM.");
  if (v15)
    v17 = (__CFString *)v15;
  v18 = v17;

  objc_msgSend(v2, "stringForKey:", CFSTR("demoActionAppBundleId"));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  v21 = CFSTR("com.apple.MobileSMS");
  if (v19)
    v21 = (__CFString *)v19;
  v22 = v21;

  v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA60]), "initWithValue:type:", v10, 1);
  v74 = (void *)v23;
  v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA58]), "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v23, 0, v6, 0, 0, 0);
  v25 = objc_alloc(MEMORY[0x1E0CBDB80]);
  v73 = (void *)v24;
  v77[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v25, "initWithRecipients:outgoingMessageType:content:speakableGroupName:conversationIdentifier:serviceName:sender:attachments:", v26, 0, v14, 0, 0, 0, 0, 0);

  v28 = v27;
  objc_msgSend(v27, "_setLaunchId:", v22);
  -[__CFString componentsSeparatedByString:](v6, "componentsSeparatedByString:", CFSTR(" "));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v6;
  v31 = (uint64_t)v30;
  if (objc_msgSend(v29, "count"))
  {
    objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
    v31 = objc_claimAutoreleasedReturnValue();

  }
  v71 = (void *)v31;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tell %@ “%@”"), v31, v14);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v30;
  v32 = [ATXAction alloc];
  v69 = v28;
  v70 = v29;
  v33 = (void *)objc_opt_new();
  LOBYTE(v63) = 0;
  v65 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v32, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v28, v33, v22, CFSTR("runningLateText"), 0, 0, v63, v68, v18);

  objc_msgSend(v2, "stringForKey:", CFSTR("demoActionMessagePhone"));
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v34;
  v36 = CFSTR("1-888-555-1212");
  if (v34)
    v36 = (__CFString *)v34;
  v67 = v22;
  v37 = v36;

  objc_msgSend(v2, "stringForKey:", CFSTR("demoActionMeetingTitle"));
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v38;
  v40 = CFSTR("Call in to “Shortcuts Launch Planning”");
  if (v38)
    v40 = (__CFString *)v38;
  v41 = v40;

  objc_msgSend(v2, "stringForKey:", CFSTR("demoActionMeetingSubtitle"));
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v42;
  v44 = CFSTR("Event starts at 3:00 PM.");
  if (v42)
    v44 = (__CFString *)v42;
  v66 = v14;
  v45 = v44;

  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA60]), "initWithValue:type:", v37, 2);
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA58]), "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v46, 0, v41, 0, 0, v37);

  v48 = objc_alloc(MEMORY[0x1E0CBDC10]);
  v76 = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v48, "initWithCallRecordFilter:callRecordToCallBack:audioRoute:destinationType:contacts:callCapability:", 0, 0, 0, 1, v49, 1);

  objc_msgSend(v50, "setPreferredCallProvider:", 1);
  objc_msgSend(v50, "setTTYType:", 1);
  objc_msgSend(v50, "_setLaunchId:", CFSTR("com.apple.InCallService"));
  objc_msgSend(v50, "_setExtensionBundleId:", CFSTR("com.apple.TelephonyUtilities.PhoneIntentHandler"));
  v51 = [ATXAction alloc];
  v52 = (void *)objc_opt_new();
  LOBYTE(v64) = 0;
  v53 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v51, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v50, v52, CFSTR("com.apple.InCallService"), CFSTR("conferenceCall"), 0, 0, v64, v41, v45);

  v54 = [ATXScoredPrediction alloc];
  LODWORD(v55) = 0;
  v56 = -[ATXScoredPrediction initWithPredictedItem:score:](v54, "initWithPredictedItem:score:", v65, v55);
  v75[0] = v56;
  v57 = [ATXScoredPrediction alloc];
  LODWORD(v58) = 0;
  v59 = -[ATXScoredPrediction initWithPredictedItem:score:](v57, "initWithPredictedItem:score:", v53, v58);
  v75[1] = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = -[ATXActionResponse initWithScoredActions:cacheFileData:consumerSubType:error:]([ATXActionResponse alloc], "initWithScoredActions:cacheFileData:consumerSubType:error:", v60, 0, 0, 0);
  return v61;
}

+ (id)actionResponseForDeveloperModeWithShouldShowRecentDonations:(BOOL)a3 shouldShowParameterCombinations:(BOOL)a4 shouldShowUpcomingMedia:(BOOL)a5
{
  return (id)objc_msgSend(a1, "actionResponseForDeveloperModeWithShouldShowRecentDonations:shouldShowParameterCombinations:shouldShowUpcomingMedia:withClientModelId:", a3, a4, a5, CFSTR("developerModeRecentDonations"));
}

+ (id)actionResponseForDeveloperModeWithShouldShowRecentDonations:(BOOL)a3 shouldShowParameterCombinations:(BOOL)a4 shouldShowUpcomingMedia:(BOOL)a5 withClientModelId:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  ATXActionResponse *v21;
  void *v22;
  void *v23;
  ATXActionResponse *v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[16];

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v10 = a6;
  __atxlog_handle_default();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "returning results for DEVELOPER switch", buf, 2u);
  }

  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "dateByAddingTimeInterval:", -3600.0);
  v13 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v13;
  if (v8)
  {
    objc_msgSend(a1, "recentDonationsStarting:end:number:", v13, v12, 10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    if (!v7)
      goto LABEL_5;
LABEL_8:
    objc_msgSend(a1, "mostRecentDonationParameterCombinations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 += objc_msgSend(v16, "count");
    if (!v6)
      goto LABEL_6;
    goto LABEL_9;
  }
  v15 = 0;
  v14 = 0;
  if (v7)
    goto LABEL_8;
LABEL_5:
  v16 = 0;
  if (!v6)
  {
LABEL_6:
    v17 = 0;
    goto LABEL_10;
  }
LABEL_9:
  objc_msgSend(a1, "recentUpcomingMedia");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v15 += objc_msgSend(v17, "count");
LABEL_10:
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
  if (objc_msgSend(v14, "count"))
    objc_msgSend(v18, "addObjectsFromArray:", v14);
  if (objc_msgSend(v16, "count"))
    objc_msgSend(v18, "addObjectsFromArray:", v16);
  if (objc_msgSend(v17, "count"))
    objc_msgSend(v18, "addObjectsFromArray:", v17);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __159__ATXActionSearchResult_actionResponseForDeveloperModeWithShouldShowRecentDonations_shouldShowParameterCombinations_shouldShowUpcomingMedia_withClientModelId___block_invoke;
  v27[3] = &unk_1E4D58ED0;
  v28 = v10;
  v29 = a1;
  v19 = v10;
  objc_msgSend(v18, "_pas_mappedArrayWithTransform:", v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = [ATXActionResponse alloc];
  v22 = (void *)objc_opt_new();
  v23 = (void *)objc_opt_new();
  v24 = -[ATXActionResponse initWithScoredActions:cacheFileData:proactiveSuggestions:blendingModelUICacheUpdateUUID:consumerSubType:predictionDate:error:](v21, "initWithScoredActions:cacheFileData:proactiveSuggestions:blendingModelUICacheUpdateUUID:consumerSubType:predictionDate:error:", 0, 0, v20, v22, 16, v23, 0);

  return v24;
}

id __159__ATXActionSearchResult_actionResponseForDeveloperModeWithShouldShowRecentDonations_shouldShowParameterCombinations_shouldShowUpcomingMedia_withClientModelId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_recentDonationProactiveSuggestionFromScoredAction:withClientModelId:", v3, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_recentDonationProactiveSuggestionFromScoredAction:(id)a3 withClientModelId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A0]), "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v6, CFSTR("1.0"), 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", 4, 0.0);
  v36 = 0;
  v37 = &v36;
  v38 = 0x2050000000;
  v9 = (void *)getATXProactiveSuggestionBuilderClass_softClass;
  v39 = getATXProactiveSuggestionBuilderClass_softClass;
  if (!getATXProactiveSuggestionBuilderClass_softClass)
  {
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __getATXProactiveSuggestionBuilderClass_block_invoke;
    v35[3] = &unk_1E4D570B8;
    v35[4] = &v36;
    __getATXProactiveSuggestionBuilderClass_block_invoke((uint64_t)v35);
    v9 = (void *)v37[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v36, 8);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[ATXActionSearchResult _recentDonationProactiveSuggestionFromScoredAction:withClientModelId:]");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("ATXActionSearchResult.m"), 493, CFSTR("Expected ATXProactiveSuggestionBuilder to not be nil"));

  }
  objc_msgSend(v10, "_uiSpecForScoredAction:scoreSpec:clientModelSpec:predictionReason:shouldClearOnEngagement:allowedOnLockscreen:", v5, v8, v7, 0, 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predictedItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "archivedDataForAction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v34 = v6;
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v5, "predictedItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "json");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@"), v16);

    v17 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v5, "predictedItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "actionKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "predictedItem");
    v21 = v8;
    v22 = v7;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v23, "paramHash"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("%@:%lld"), v19, objc_msgSend(v24, "longLongValue"));

    v26 = objc_alloc(MEMORY[0x1E0D811A8]);
    objc_msgSend(v5, "predictedItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v26, "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v27, v33, v25, 2);

    v7 = v22;
    v8 = v21;
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v7, v28, v11, v21);

    v6 = v34;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

+ (id)actionResponseForDeveloperMode
{
  return (id)objc_msgSend(a1, "actionResponseForDeveloperModeWithShouldShowRecentDonations:shouldShowParameterCombinations:shouldShowUpcomingMedia:withClientModelId:", objc_msgSend(a1, "shouldDisplayRecentDonationsForTesting"), objc_msgSend(a1, "shouldDisplayValidParameterCombinations"), objc_msgSend(a1, "shouldDisplayUpcomingMediaForTesting"), CFSTR("developerModeRecentDonations"));
}

+ (id)actionResponseForDeveloperModeWithClientId:(id)a3 shouldShowRecentDonations:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "actionResponseForDeveloperModeWithShouldShowRecentDonations:shouldShowParameterCombinations:shouldShowUpcomingMedia:withClientModelId:", v4, objc_msgSend(a1, "shouldDisplayValidParameterCombinations"), objc_msgSend(a1, "shouldDisplayUpcomingMediaForTesting"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)recentDonationsStarting:(id)a3 end:(id)a4 number:(unint64_t)a5
{
  id v7;
  id v8;
  ATXCombinedIntentStream *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  ATXScoredPrediction *v21;
  double v22;
  ATXScoredPrediction *v23;
  void *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(ATXCombinedIntentStream);
  v26 = v7;
  -[ATXCombinedIntentStream getSortedActivityAndIntentEventsBetweenStartDate:endDate:bundleIdFilter:comparator:](v9, "getSortedActivityAndIntentEventsBetweenStartDate:endDate:bundleIdFilter:comparator:", v7, v8, 0, &__block_literal_global_25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "count");
  if (v11 >= a5)
    v12 = a5;
  else
    v12 = v11;
  objc_msgSend(v10, "subarrayWithRange:", 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v28;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v19), "action");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = [ATXScoredPrediction alloc];
          LODWORD(v22) = 0;
          v23 = -[ATXScoredPrediction initWithPredictedItem:score:](v21, "initWithPredictedItem:score:", v20, v22);
          objc_msgSend(v14, "addObject:", v23);

        }
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v17);
  }

  v24 = (void *)objc_msgSend(v14, "copy");
  return v24;
}

uint64_t __60__ATXActionSearchResult_recentDonationsStarting_end_number___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)mostRecentDonationParameterCombinations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  ATXScoredPrediction *v13;
  void *v14;
  void *v15;
  double v16;
  ATXScoredPrediction *v17;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dateByAddingTimeInterval:", -7200.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recentDonationsStarting:end:number:", v20, v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predictedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  if (v4)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v6 = (void *)get_ATXActionUtilsClass_softClass;
    v30 = get_ATXActionUtilsClass_softClass;
    if (!get_ATXActionUtilsClass_softClass)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __get_ATXActionUtilsClass_block_invoke;
      v26[3] = &unk_1E4D570B8;
      v26[4] = &v27;
      __get_ATXActionUtilsClass_block_invoke((uint64_t)v26);
      v6 = (void *)v28[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v27, 8);
    objc_msgSend(v7, "slotSetsForAction:intentCache:", v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
          v13 = [ATXScoredPrediction alloc];
          objc_msgSend(v12, "parameters");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v4, "copyWithParameterWhitelist:", v14);
          LODWORD(v16) = 0;
          v17 = -[ATXScoredPrediction initWithPredictedItem:score:](v13, "initWithPredictedItem:score:", v15, v16);
          objc_msgSend(v5, "addObject:", v17);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      }
      while (v9);
    }

  }
  return v5;
}

+ (id)recentUpcomingMedia
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  ATXAction *v21;
  void *v22;
  void *v23;
  ATXAction *v24;
  ATXScoredPrediction *v25;
  double v26;
  ATXScoredPrediction *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  +[ATXUpcomingMediaQuery getAllUpcomingMedia](ATXUpcomingMediaQuery, "getAllUpcomingMedia");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sortedUpcomingMedia");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "first");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v6);
  }
  v31 = v4;

  v10 = objc_msgSend(v3, "count");
  if (v10 >= 3)
    v11 = 3;
  else
    v11 = v10;
  objc_msgSend(v3, "subarrayWithRange:", 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        objc_msgSend(v19, "launchId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v21 = [ATXAction alloc];
          v22 = (void *)objc_opt_new();
          objc_msgSend(v19, "launchId");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v30) = 0;
          v24 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v21, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v19, v22, v23, 0, 0, 0, v30, 0, 0, v31);

          if (v24)
          {
            v25 = [ATXScoredPrediction alloc];
            LODWORD(v26) = 0;
            v27 = -[ATXScoredPrediction initWithPredictedItem:score:](v25, "initWithPredictedItem:score:", v24, v26);
            objc_msgSend(v33, "addObject:", v27);

          }
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v16);
  }

  v28 = (void *)objc_msgSend(v33, "copy");
  return v28;
}

+ (BOOL)_demoModeEnabled
{
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  return CFPreferencesGetAppBooleanValue(CFSTR("zkwActionsDemoModeEnabled"), (CFStringRef)*MEMORY[0x1E0CF9510], &keyExistsAndHasValidFormat) != 0;
}

+ (BOOL)shouldDisplayRecentDonationsForTesting
{
  return CFPreferencesGetAppBooleanValue(CFSTR("displayRecentDonations"), CFSTR("com.apple.duetexpertd"), 0) != 0;
}

+ (BOOL)shouldDisplayUpcomingMediaForTesting
{
  return CFPreferencesGetAppBooleanValue(CFSTR("displayUpcomingMedia"), CFSTR("com.apple.duetexpertd"), 0) != 0;
}

+ (BOOL)shouldDisplayValidParameterCombinations
{
  void *v2;
  char v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.DuetExpertCenter.AppPredictionExpert"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ShowValidParameterCombinations"));

  return v3;
}

+ (BOOL)shouldDisplayRecentActionsOnHomeScreen
{
  void *v2;
  char v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.DuetExpertCenter.AppPredictionExpert"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ATXRecentActionsOnHomeScreen"));

  return v3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ATXActionResponse uuid](self->_actionResponse, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXActionSearchResult *v4;
  ATXActionSearchResult *v5;
  BOOL v6;

  v4 = (ATXActionSearchResult *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXActionSearchResult isEqualToActionSearchResult:](self, "isEqualToActionSearchResult:", v5);

  return v6;
}

- (BOOL)isEqualToActionSearchResult:(id)a3
{
  void *v3;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  _BOOL4 v10;

  v5 = a3;
  -[ATXSuggestionSearchResult proactiveSuggestion](self, "proactiveSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 || (objc_msgSend(v5, "proactiveSuggestion"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[ATXSuggestionSearchResult proactiveSuggestion](self, "proactiveSuggestion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proactiveSuggestion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v6)
      goto LABEL_7;
  }
  else
  {
    v9 = 1;
  }

LABEL_7:
  if (-[ATXAction isEqual:](self->_atxAction, "isEqual:", v5[100]))
    v10 = -[ATXActionResponse isEqual:](self->_actionResponse, "isEqual:", v5[99]) & v9;
  else
    LOBYTE(v10) = 0;

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXActionSearchResult)initWithCoder:(id)a3
{
  id v4;
  ATXActionSearchResult *v5;
  uint64_t v6;
  ATXAction *atxAction;
  uint64_t v8;
  ATXActionResponse *actionResponse;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXActionSearchResult;
  v5 = -[ATXSuggestionSearchResult initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_atxAction"));
    v6 = objc_claimAutoreleasedReturnValue();
    atxAction = v5->_atxAction;
    v5->_atxAction = (ATXAction *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_atxActionResponse"));
    v8 = objc_claimAutoreleasedReturnValue();
    actionResponse = v5->_actionResponse;
    v5->_actionResponse = (ATXActionResponse *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  ATXAction *atxAction;
  id v5;
  objc_super v6;

  atxAction = self->_atxAction;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", atxAction, CFSTR("_atxAction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionResponse, CFSTR("_atxActionResponse"));
  v6.receiver = self;
  v6.super_class = (Class)ATXActionSearchResult;
  -[ATXSuggestionSearchResult encodeWithCoder:](&v6, sel_encodeWithCoder_, v5);

}

- (ATXActionResponse)actionResponse
{
  return self->_actionResponse;
}

- (void)setActionResponse:(id)a3
{
  objc_storeStrong((id *)&self->_actionResponse, a3);
}

- (ATXAction)atxAction
{
  return self->_atxAction;
}

- (ATXHeroData)heroApp
{
  return self->_heroApp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroApp, 0);
  objc_storeStrong((id *)&self->_atxAction, 0);
  objc_storeStrong((id *)&self->_actionResponse, 0);
}

+ (void)actionSearchResultFromScoredAction:(os_log_t)log actionResponse:avRoutingSessionHelper:nowPlayingDataProvider:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "Prevented showing a TV intent which is not a TVWhiteListedLongFormMedia", v1, 2u);
}

+ (void)_unarchiveObjectFromSuggestion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "error unarchiving data for suggestion: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setAtxAction:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A49EF000, log, OS_LOG_TYPE_FAULT, "Unexpected ATXAction configuration found in ATXActionSearchResult.", v1, 2u);
}

- (void)_updateInlineCardWithContent:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void soft_APUIRegisterCardServicesIfNeeded(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ATXActionSearchResult.m"), 63, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)_updateInlineCardWithContent:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void soft_APUIRegisterCardKitProvidersIfNeeded(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ATXActionSearchResult.m"), 64, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
