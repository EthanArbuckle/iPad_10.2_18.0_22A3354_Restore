@implementation ATXModeEntityCorrelator

- (ATXModeEntityCorrelator)initWithModeEventProvider:(id)a3 entityEventProvider:(id)a4
{
  id v7;
  id v8;
  ATXModeEntityCorrelator *v9;
  ATXModeEntityCorrelator *v10;
  uint64_t v11;
  ATXInformationStore *informationStore;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXModeEntityCorrelator;
  v9 = -[ATXModeEntityCorrelator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modeEventProvider, a3);
    objc_storeStrong((id *)&v10->_entityEventProvider, a4);
    objc_msgSend(MEMORY[0x1E0CF8EC8], "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    informationStore = v10->_informationStore;
    v10->_informationStore = (ATXInformationStore *)v11;

  }
  return v10;
}

- (ATXModeEntityCorrelator)initWithModeEventProvider:(id)a3 appLaunchEventProvider:(id)a4 macPortableAppEventProvider:(id)a5 macDesktopAppEventProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXModeEntityCorrelator *v15;
  ATXModeEntityCorrelator *v16;
  uint64_t v17;
  ATXInformationStore *informationStore;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ATXModeEntityCorrelator;
  v15 = -[ATXModeEntityCorrelator init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_modeEventProvider, a3);
    objc_storeStrong((id *)&v16->_localAppLaunchEventProvider, a4);
    objc_storeStrong((id *)&v16->_macPortableAppLaunchEventProvider, a5);
    objc_storeStrong((id *)&v16->_macDesktopAppLaunchEventProvider, a6);
    objc_msgSend(MEMORY[0x1E0CF8EC8], "sharedInstance");
    v17 = objc_claimAutoreleasedReturnValue();
    informationStore = v16->_informationStore;
    v16->_informationStore = (ATXInformationStore *)v17;

  }
  return v16;
}

- (id)entityFeaturesForModeEntityScoring
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  ATXModeEntityCorrelator *v14;
  id v15;

  if (!self->_modeEventProvider)
    return (id)objc_opt_new();
  if (self->_localAppLaunchEventProvider
    && self->_macDesktopAppLaunchEventProvider
    && self->_macPortableAppLaunchEventProvider)
  {
    -[ATXModeEntityCorrelator mergedWithRemotePublishers](self, "mergedWithRemotePublishers");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ATXModeEntityCorrelator mergedWithLocalPublisher](self, "mergedWithLocalPublisher");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
  v5 = (void *)objc_opt_new();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __61__ATXModeEntityCorrelator_entityFeaturesForModeEntityScoring__block_invoke_2;
  v13 = &unk_1E82DCD98;
  v14 = self;
  v15 = v5;
  v6 = v5;
  v7 = (id)objc_msgSend(v4, "sinkWithCompletion:receiveInput:", &__block_literal_global_221, &v10);
  -[ATXModeEntityCorrelator featuresForEntitiesFromCompleteCorrelatorState:](self, "featuresForEntitiesFromCompleteCorrelatorState:", v6, v10, v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __61__ATXModeEntityCorrelator_entityFeaturesForModeEntityScoring__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
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
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
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
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 16)
    && (v5 = objc_msgSend(*(id *)(v4 + 16), "isEventFromProvider:", v3), v4 = *(_QWORD *)(a1 + 32), v5))
  {
    objc_msgSend(*(id *)(v4 + 16), "aggregationEventsFromEvent:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    v4 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      objc_msgSend((id)v4, "updateCorrelatorState:forAggregationEvents:", *(_QWORD *)(a1 + 40), v6);
      v4 = *(_QWORD *)(a1 + 32);
    }
  }
  else
  {
    v6 = 0;
  }
  v8 = *(void **)(v4 + 24);
  if (v8 && objc_msgSend(v8, "isEventFromProvider:", v3))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "aggregationEventsFromEvent:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      v60 = v3;
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v6 = v9;
      v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v72;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v72 != v12)
              objc_enumerationMutation(v6);
            v14 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v13);
            v15 = (void *)MEMORY[0x1CAA48B6C]();
            objc_msgSend(*(id *)(a1 + 40), "setSeenAtLeastOneEntityEvent:", 1);
            v16 = *(void **)(a1 + 32);
            objc_msgSend(*(id *)(a1 + 40), "localDeviceGlobalAppLaunchesHistogramPerEntity");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "today");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "updateDateBasedHistogram:aggregationEvent:today:", v17, v14, v18);

            objc_msgSend(*(id *)(a1 + 40), "mostRecentModeEvent");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              v20 = *(void **)(a1 + 32);
              objc_msgSend(*(id *)(a1 + 40), "mostRecentModeEvent");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v20) = objc_msgSend(v20, "eventOccurredWhileInModeForAggregationEvent:modeTransitionEvent:", v14, v21);

              if ((_DWORD)v20)
              {
                v22 = *(void **)(a1 + 32);
                objc_msgSend(*(id *)(a1 + 40), "localDeviceModeAppLaunchesHistogramPerEntity");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 40), "today");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "updateDateBasedHistogram:aggregationEvent:today:", v23, v14, v24);

              }
            }
            objc_autoreleasePoolPop(v15);
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
        }
        while (v11);
      }

      objc_msgSend(*(id *)(a1 + 32), "updateCorrelatorState:forAggregationEvents:", *(_QWORD *)(a1 + 40), v6);
      v3 = v60;
    }
    else
    {
      v6 = v9;
    }
  }
  v25 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v25 && objc_msgSend(v25, "isEventFromProvider:", v3))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "aggregationEventsFromEvent:", v3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v26, "count"))
    {
      v61 = v3;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v6 = v26;
      v27 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v68;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v68 != v29)
              objc_enumerationMutation(v6);
            v31 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v30);
            v32 = (void *)MEMORY[0x1CAA48B6C]();
            objc_msgSend(*(id *)(a1 + 40), "setSeenAtLeastOneEntityEvent:", 1);
            v33 = *(void **)(a1 + 32);
            objc_msgSend(*(id *)(a1 + 40), "macPortableGlobalAppLaunchesHistogramPerEntity");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "today");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "updateDateBasedHistogram:aggregationEvent:today:", v34, v31, v35);

            objc_msgSend(*(id *)(a1 + 40), "mostRecentModeEvent");
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
            {
              v37 = *(void **)(a1 + 32);
              objc_msgSend(*(id *)(a1 + 40), "mostRecentModeEvent");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v37) = objc_msgSend(v37, "eventOccurredWhileInModeForAggregationEvent:modeTransitionEvent:", v31, v38);

              if ((_DWORD)v37)
              {
                v39 = *(void **)(a1 + 32);
                objc_msgSend(*(id *)(a1 + 40), "macPortableModeAppLaunchesHistogramPerEntity");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 40), "today");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "updateDateBasedHistogram:aggregationEvent:today:", v40, v31, v41);

              }
            }
            objc_autoreleasePoolPop(v32);
            ++v30;
          }
          while (v28 != v30);
          v28 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
        }
        while (v28);
      }

      objc_msgSend(*(id *)(a1 + 32), "updateCorrelatorState:forAggregationEvents:", *(_QWORD *)(a1 + 40), v6);
      v3 = v61;
    }
    else
    {
      v6 = v26;
    }
  }
  v42 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (v42 && objc_msgSend(v42, "isEventFromProvider:", v3))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "aggregationEventsFromEvent:", v3);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v43, "count"))
    {
      v62 = v3;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v6 = v43;
      v44 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v64;
        do
        {
          v47 = 0;
          do
          {
            if (*(_QWORD *)v64 != v46)
              objc_enumerationMutation(v6);
            v48 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v47);
            v49 = (void *)MEMORY[0x1CAA48B6C]();
            objc_msgSend(*(id *)(a1 + 40), "setSeenAtLeastOneEntityEvent:", 1);
            v50 = *(void **)(a1 + 32);
            objc_msgSend(*(id *)(a1 + 40), "macDesktopGlobalAppLaunchesHistogramPerEntity");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "today");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "updateDateBasedHistogram:aggregationEvent:today:", v51, v48, v52);

            objc_msgSend(*(id *)(a1 + 40), "mostRecentModeEvent");
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            if (v53)
            {
              v54 = *(void **)(a1 + 32);
              objc_msgSend(*(id *)(a1 + 40), "mostRecentModeEvent");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v54) = objc_msgSend(v54, "eventOccurredWhileInModeForAggregationEvent:modeTransitionEvent:", v48, v55);

              if ((_DWORD)v54)
              {
                v56 = *(void **)(a1 + 32);
                objc_msgSend(*(id *)(a1 + 40), "macDesktopModeAppLaunchesHistogramPerEntity");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 40), "today");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "updateDateBasedHistogram:aggregationEvent:today:", v57, v48, v58);

              }
            }
            objc_autoreleasePoolPop(v49);
            ++v47;
          }
          while (v45 != v47);
          v45 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
        }
        while (v45);
      }

      objc_msgSend(*(id *)(a1 + 32), "updateCorrelatorState:forAggregationEvents:", *(_QWORD *)(a1 + 40), v6);
      v3 = v62;
    }
    else
    {
      v6 = v43;
    }
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isEventFromProvider:", v3))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "aggregationEventsFromEvent:", v3);
    v59 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "trackNewModeTransitionEvent:correlatorState:", v59, *(_QWORD *)(a1 + 40));
    v6 = (id)v59;
  }

}

- (void)updateCorrelatorState:(id)a3 forAggregationEvents:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1CAA48B6C](v8);
        objc_msgSend(v6, "setSeenAtLeastOneEntityEvent:", 1, (_QWORD)v18);
        objc_msgSend(v12, "entity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[ATXModeEntityCorrelator updateInternalStateForGlobalOccurrenceEvent:correlatorState:](self, "updateInternalStateForGlobalOccurrenceEvent:correlatorState:", v12, v6);
          objc_msgSend(v6, "mostRecentModeEvent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v6, "mostRecentModeEvent");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[ATXModeEntityCorrelator eventOccurredWhileInModeForAggregationEvent:modeTransitionEvent:](self, "eventOccurredWhileInModeForAggregationEvent:modeTransitionEvent:", v12, v16);

            if (v17)
              -[ATXModeEntityCorrelator updateInternalStateForLocalOccurrenceEvent:correlatorState:](self, "updateInternalStateForLocalOccurrenceEvent:correlatorState:", v12, v6);
          }
        }
        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v9 = v8;
    }
    while (v8);
  }

}

- (id)entityFeaturesForWidgetScoring
{
  void *v3;
  ATXWidgetModeEventProvider *v4;
  void *v5;
  id v6;
  ATXWidgetModeEventProvider *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  ATXWidgetModeEventProvider *v12;
  id v13;

  if (!self->_modeEventProvider)
    return (id)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v4 = -[ATXWidgetModeEventProvider initWithInformationStore:]([ATXWidgetModeEventProvider alloc], "initWithInformationStore:", self->_informationStore);
  -[ATXModeEntityCorrelator populateGlobalOccurencesForAllWidgetsWithWidgetModeEventProvider:correlatorState:](self, "populateGlobalOccurencesForAllWidgetsWithWidgetModeEventProvider:correlatorState:", v4, v3);
  -[ATXModeEntityEventProviderProtocol biomePublisherWithBookmark:](self->_modeEventProvider, "biomePublisherWithBookmark:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__ATXModeEntityCorrelator_entityFeaturesForWidgetScoring__block_invoke_2;
  v11[3] = &unk_1E82DC3A0;
  v11[4] = self;
  v12 = v4;
  v13 = v3;
  v6 = v3;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "sinkWithCompletion:receiveInput:", &__block_literal_global_12_6, v11);

  -[ATXModeEntityCorrelator featuresForEntitiesFromCompleteCorrelatorState:](self, "featuresForEntitiesFromCompleteCorrelatorState:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __57__ATXModeEntityCorrelator_entityFeaturesForWidgetScoring__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf;
  _BYTE v20[15];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v18 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "aggregationEventsFromEvent:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetModeEventsBetweenStartDate:endDate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(*(id *)(a1 + 48), "setSeenAtLeastOneEntityEvent:", 1);
        objc_msgSend(v13, "entity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(*(id *)(a1 + 32), "updateInternalStateForLocalOccurrenceEvent:correlatorState:", v13, *(_QWORD *)(a1 + 48));
        }
        else
        {
          __atxlog_handle_modes();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            __57__ATXModeEntityCorrelator_entityFeaturesForWidgetScoring__block_invoke_2_cold_1(&buf, v20, v16);

        }
        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(a1 + 32), "trackNewModeTransitionEvent:correlatorState:", v17, *(_QWORD *)(a1 + 48));
}

- (void)populateGlobalOccurencesForAllWidgetsWithWidgetModeEventProvider:(id)a3 correlatorState:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -2419200.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v5;
  objc_msgSend(v5, "widgetEngagementCountSinceStartDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "integerValue");

        if (v16 >= 1)
        {
          v17 = 0;
          do
          {
            objc_msgSend(v6, "globalEntityOccurrences");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v14);

            ++v17;
            objc_msgSend(v9, "objectForKeyedSubscript:", v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "integerValue");

          }
          while (v17 < v20);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

}

- (BOOL)eventOccurredWhileInModeForAggregationEvent:(id)a3 modeTransitionEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  BOOL v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;
  objc_msgSend(v6, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  if (v9 <= v11)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v5, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    v14 = v13;
    objc_msgSend(v6, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    v17 = v14 < v16;

  }
  return v17;
}

- (void)trackNewModeTransitionEvent:(id)a3 correlatorState:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMostRecentModeEvent:", v5);

  v6 = (void *)objc_opt_new();
  objc_msgSend(v7, "setEntitiesSeenForMostRecentModeEvent:", v6);

  objc_msgSend(v7, "setModeOccurrences:", objc_msgSend(v7, "modeOccurrences") + 1);
  if ((objc_msgSend(v7, "seenAtLeastOneEntityEvent") & 1) == 0)
    objc_msgSend(v7, "setModeOccurrences:", 1);

}

- (id)featuresForEntitiesFromCompleteCorrelatorState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  ATXModeEntityCorrelator *v19;
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  _QWORD v26[4];
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  _QWORD v30[4];

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0x3E45798EE2308C3ALL;
  objc_msgSend(v4, "modeLocalEntityOccurrences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __74__ATXModeEntityCorrelator_featuresForEntitiesFromCompleteCorrelatorState___block_invoke;
  v27[3] = &unk_1E82E9D38;
  v29 = v30;
  v8 = v4;
  v28 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v27);

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0x3E45798EE2308C3ALL;
  objc_msgSend(v8, "globalEntityOccurrences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __74__ATXModeEntityCorrelator_featuresForEntitiesFromCompleteCorrelatorState___block_invoke_2;
  v23[3] = &unk_1E82E9D38;
  v25 = v26;
  v10 = v8;
  v24 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v23);

  objc_msgSend(v10, "globalEntityOccurrences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __74__ATXModeEntityCorrelator_featuresForEntitiesFromCompleteCorrelatorState___block_invoke_3;
  v17[3] = &unk_1E82E9D60;
  v12 = v10;
  v18 = v12;
  v19 = self;
  v21 = v30;
  v22 = v26;
  v13 = v5;
  v20 = v13;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v17);

  v14 = v20;
  v15 = v13;

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v30, 8);

  return v15;
}

void __74__ATXModeEntityCorrelator_featuresForEntitiesFromCompleteCorrelatorState___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  unint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "modeLocalEntityOccurrences");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "countForObject:", v4);

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + (double)v5;

}

void __74__ATXModeEntityCorrelator_featuresForEntitiesFromCompleteCorrelatorState___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  unint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "globalEntityOccurrences");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "countForObject:", v4);

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + (double)v5;

}

void __74__ATXModeEntityCorrelator_featuresForEntitiesFromCompleteCorrelatorState___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;

  v61 = a2;
  objc_msgSend(*(id *)(a1 + 32), "globalEntityOccurrences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countForObject:", v61);

  objc_msgSend(*(id *)(a1 + 32), "modeLocalEntityOccurrences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countForObject:", v61);

  objc_msgSend(*(id *)(a1 + 32), "uniqueModeOccurrences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countForObject:", v61);

  v9 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setModeDescription:", v10);

  objc_msgSend(v61, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEntityDescription:", v11);

  v12 = objc_msgSend(*(id *)(a1 + 32), "modeOccurrences");
  v13 = 0.0;
  v14 = 0.0;
  if (v12)
    v14 = (double)v8 / (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "modeOccurrences", 0.0);
  objc_msgSend(v9, "setPosteriorProbability:", v14);
  if (v4)
    v13 = (double)v6 / (double)v4;
  objc_msgSend(v9, "setClassConditionalProbability:", v13);
  objc_msgSend(v9, "setUniqueOccurrencesInMode:", v8);
  objc_msgSend(v9, "setModeOccurrences:", objc_msgSend(*(id *)(a1 + 32), "modeOccurrences"));
  objc_msgSend(v9, "setGlobalOccurrences:", v4);
  objc_msgSend(v9, "setLocalOccurrences:", v6);
  objc_msgSend(v9, "setLocalOccurrencesAcrossAllEntities:", (unint64_t)*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v15 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v16 = 0.0;
  v17 = 0.0;
  if (v15 != 0.0)
    v17 = (double)v6 / v15;
  objc_msgSend(v9, "setModePopularity:", v17);
  v18 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v18 != 0.0)
    v16 = (double)v4 / v18;
  objc_msgSend(v9, "setGlobalPopularity:", v16);
  objc_msgSend(v9, "globalPopularity");
  v19 = 0.0;
  if (v20 > 0.0)
  {
    objc_msgSend(v9, "modePopularity");
    v22 = v21;
    objc_msgSend(v9, "globalPopularity");
    v19 = v22 / v23 + -1.0;
  }
  objc_msgSend(v9, "setRatioModeAndGlobalPopularity:", fmin(v19, 5.0));
  objc_msgSend(*(id *)(a1 + 32), "entityToEntityFeaturesDict");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v61);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEntitySpecificFeatures:", v25);

  objc_msgSend(*(id *)(a1 + 32), "totalModeLaunchesHistogramPerEntity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", v61);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  v29 = MEMORY[0x1E0C9AA60];
  if (v27)
    v30 = v27;
  else
    v30 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v9, "setTotalModeLaunchesHistogramForLast28Days:", v30);

  objc_msgSend(*(id *)(a1 + 32), "totalGlobalLaunchesHistogramPerEntity");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", v61);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (v32)
    v34 = v32;
  else
    v34 = v29;
  objc_msgSend(v9, "setTotalGlobalLaunchesHistogramForLast28Days:", v34);

  objc_msgSend(*(id *)(a1 + 32), "macPortableGlobalAppLaunchesHistogramPerEntity");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", v61);
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v36;
  if (v36)
    v38 = v36;
  else
    v38 = v29;
  objc_msgSend(v9, "setMacPortableGlobalAppLaunchesHistogramForLast28Days:", v38);

  objc_msgSend(*(id *)(a1 + 32), "macPortableModeAppLaunchesHistogramPerEntity");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKeyedSubscript:", v61);
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v40;
  if (v40)
    v42 = v40;
  else
    v42 = v29;
  objc_msgSend(v9, "setMacPortableModeAppLaunchesHistogramForLast28Days:", v42);

  objc_msgSend(*(id *)(a1 + 32), "macDesktopGlobalAppLaunchesHistogramPerEntity");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectForKeyedSubscript:", v61);
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v44;
  if (v44)
    v46 = v44;
  else
    v46 = v29;
  objc_msgSend(v9, "setMacDesktopGlobalAppLaunchesHistogramForLast28Days:", v46);

  objc_msgSend(*(id *)(a1 + 32), "macDesktopModeAppLaunchesHistogramPerEntity");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectForKeyedSubscript:", v61);
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)v48;
  if (v48)
    v50 = v48;
  else
    v50 = v29;
  objc_msgSend(v9, "setMacDesktopModeAppLaunchesHistogramForLast28Days:", v50);

  objc_msgSend(*(id *)(a1 + 32), "localDeviceGlobalAppLaunchesHistogramPerEntity");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectForKeyedSubscript:", v61);
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = (void *)v52;
  if (v52)
    v54 = v52;
  else
    v54 = v29;
  objc_msgSend(v9, "setLocalDeviceGlobalAppLaunchesHistogramForLast28Days:", v54);

  objc_msgSend(*(id *)(a1 + 32), "localDeviceModeAppLaunchesHistogramPerEntity");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectForKeyedSubscript:", v61);
  v56 = objc_claimAutoreleasedReturnValue();
  v57 = (void *)v56;
  if (v56)
    v58 = v56;
  else
    v58 = v29;
  objc_msgSend(v9, "setLocalDeviceModeAppLaunchesHistogramForLast28Days:", v58);

  objc_msgSend(v9, "setEntity:", v61);
  v59 = *(void **)(a1 + 48);
  objc_msgSend(v61, "identifier");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setObject:forKey:", v9, v60);

}

- (id)mergedWithRemotePublishers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  -[ATXModeEntityEventProviderProtocol biomePublisherWithBookmark:](self->_modeEventProvider, "biomePublisherWithBookmark:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeEntityEventProviderProtocol biomePublisherWithBookmark:](self->_localAppLaunchEventProvider, "biomePublisherWithBookmark:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  -[ATXModeEntityEventProviderProtocol biomePublisherWithBookmark:](self->_macPortableAppLaunchEventProvider, "biomePublisherWithBookmark:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  -[ATXModeEntityEventProviderProtocol biomePublisherWithBookmark:](self->_macDesktopAppLaunchEventProvider, "biomePublisherWithBookmark:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__ATXModeEntityCorrelator_mergedWithRemotePublishers__block_invoke;
  v10[3] = &unk_1E82DBFF8;
  v10[4] = self;
  objc_msgSend(v3, "orderedMergeWithOthers:comparator:", v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __53__ATXModeEntityCorrelator_mergedWithRemotePublishers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "dateIntervalFromEvent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "dateIntervalFromEvent:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "dateIntervalFromEvent:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dateIntervalFromEvent:", v5);
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v7 = v10;

      if (!v7)
      {
        __atxlog_handle_notification_management();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __53__ATXModeEntityCorrelator_mergedWithRemotePublishers__block_invoke_cold_1();

        v7 = 0;
      }
    }
  }
  objc_msgSend(v7, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "dateIntervalFromEvent:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "dateIntervalFromEvent:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "dateIntervalFromEvent:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = v16;
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dateIntervalFromEvent:", v6);
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v18;

      if (!v15)
      {
        __atxlog_handle_notification_management();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          __53__ATXModeEntityCorrelator_mergedWithRemotePublishers__block_invoke_cold_1();

        v15 = 0;
      }
    }
  }
  objc_msgSend(v15, "startDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSinceReferenceDate");
  v22 = v21;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "compare:", v24);

  return v25;
}

- (id)mergedWithLocalPublisher
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[ATXModeEntityEventProviderProtocol biomePublisherWithBookmark:](self->_modeEventProvider, "biomePublisherWithBookmark:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeEntityEventProviderProtocol biomePublisherWithBookmark:](self->_entityEventProvider, "biomePublisherWithBookmark:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__ATXModeEntityCorrelator_mergedWithLocalPublisher__block_invoke;
  v8[3] = &unk_1E82DBFF8;
  v8[4] = self;
  objc_msgSend(v3, "orderedMergeWithOthers:comparator:", v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __51__ATXModeEntityCorrelator_mergedWithLocalPublisher__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "dateIntervalFromEvent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dateIntervalFromEvent:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      __atxlog_handle_notification_management();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __53__ATXModeEntityCorrelator_mergedWithRemotePublishers__block_invoke_cold_1();

      v7 = 0;
    }
  }
  objc_msgSend(v7, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "dateIntervalFromEvent:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dateIntervalFromEvent:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      __atxlog_handle_notification_management();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __53__ATXModeEntityCorrelator_mergedWithRemotePublishers__block_invoke_cold_1();

      v12 = 0;
    }
  }
  objc_msgSend(v12, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  v16 = v15;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "compare:", v18);

  return v19;
}

- (void)updateInternalStateForGlobalOccurrenceEvent:(id)a3 correlatorState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ATXModeEntityEventProviderProtocol *localAppLaunchEventProvider;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v6, "globalEntityOccurrences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  objc_msgSend(v6, "totalGlobalLaunchesHistogramPerEntity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "today");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeEntityCorrelator updateDateBasedHistogram:aggregationEvent:today:](self, "updateDateBasedHistogram:aggregationEvent:today:", v9, v13, v10);

  localAppLaunchEventProvider = self->_localAppLaunchEventProvider;
  if (!localAppLaunchEventProvider)
    localAppLaunchEventProvider = self->_entityEventProvider;
  objc_msgSend(v6, "entityToEntityFeaturesDict");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXModeEntityEventProviderProtocol updateEntitySpecificFeaturesDict:aggregationEvent:isLocalToMode:](localAppLaunchEventProvider, "updateEntitySpecificFeaturesDict:aggregationEvent:isLocalToMode:", v12, v13, 0);
}

- (void)updateInternalStateForLocalOccurrenceEvent:(id)a3 correlatorState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ATXModeEntityEventProviderProtocol *localAppLaunchEventProvider;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  objc_msgSend(v6, "modeLocalEntityOccurrences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  objc_msgSend(v6, "totalModeLaunchesHistogramPerEntity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "today");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeEntityCorrelator updateDateBasedHistogram:aggregationEvent:today:](self, "updateDateBasedHistogram:aggregationEvent:today:", v9, v20, v10);

  localAppLaunchEventProvider = self->_localAppLaunchEventProvider;
  if (!localAppLaunchEventProvider)
    localAppLaunchEventProvider = self->_entityEventProvider;
  objc_msgSend(v6, "entityToEntityFeaturesDict");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeEntityEventProviderProtocol updateEntitySpecificFeaturesDict:aggregationEvent:isLocalToMode:](localAppLaunchEventProvider, "updateEntitySpecificFeaturesDict:aggregationEvent:isLocalToMode:", v12, v20, 1);

  objc_msgSend(v6, "entitiesSeenForMostRecentModeEvent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "entity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v14);

  if ((v15 & 1) == 0)
  {
    objc_msgSend(v6, "uniqueModeOccurrences");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "entity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

  }
  objc_msgSend(v6, "entitiesSeenForMostRecentModeEvent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "entity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v19);

}

- (void)updateDateBasedHistogram:(id)a3 aggregationEvent:(id)a4 today:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[ATXModeEntityCorrelator zerosArray](self, "zerosArray");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v12, v13);

  }
  objc_msgSend(v8, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ATXModeEntityCorrelator daysSinceDate:today:](self, "daysSinceDate:today:", v14, v9);

  if (v15 <= 0x1B)
  {
    objc_msgSend(v8, "entity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "integerValue") + 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:atIndexedSubscript:", v19, v15);

  }
}

- (id)zerosArray
{
  void *v2;
  uint64_t i;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 28);
  for (i = 0; i != 28; ++i)
    objc_msgSend(v2, "setObject:atIndexedSubscript:", &unk_1E83CDEB8, i);
  return v2;
}

- (int64_t)daysSinceDate:(id)a3 today:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;

  v5 = (void *)MEMORY[0x1E0C99D48];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:toDate:options:", 16, v7, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "day");
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_informationStore, 0);
  objc_storeStrong((id *)&self->_macDesktopAppLaunchEventProvider, 0);
  objc_storeStrong((id *)&self->_macPortableAppLaunchEventProvider, 0);
  objc_storeStrong((id *)&self->_localAppLaunchEventProvider, 0);
  objc_storeStrong((id *)&self->_entityEventProvider, 0);
  objc_storeStrong((id *)&self->_modeEventProvider, 0);
}

void __57__ATXModeEntityCorrelator_entityFeaturesForWidgetScoring__block_invoke_2_cold_1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Encountered widget engagement mode event in ModeEntityCorrelator without a valid entity.", buf, 2u);
}

void __53__ATXModeEntityCorrelator_mergedWithRemotePublishers__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "During ordered merge, encountered unknown event: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
