@implementation GEOAPSharedStateData

+ (id)sharedData
{
  if (qword_254316990 != -1)
    dispatch_once(&qword_254316990, &__block_literal_global_17);
  return (id)_MergedGlobals_1;
}

void __34__GEOAPSharedStateData_sharedData__block_invoke()
{
  GEOAPSharedStateData *v0;
  void *v1;

  v0 = objc_alloc_init(GEOAPSharedStateData);
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = (uint64_t)v0;

}

- (GEOAPSharedStateData)init
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t global_queue;
  void *v38;
  dispatch_source_t v39;
  void *v40;
  NSObject *v41;
  _QWORD v43[4];
  id v44;
  id location;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)GEOAPSharedStateData;
  v2 = -[GEOAnalyticsPipelineStateData init](&v46, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v2 + 744) = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE3CB30]);

    v5 = geo_reentrant_isolater_create_with_format();
    v6 = (void *)*((_QWORD *)v2 + 94);
    *((_QWORD *)v2 + 94) = v5;

    v7 = geo_isolater_create();
    v8 = (void *)*((_QWORD *)v2 + 95);
    *((_QWORD *)v2 + 95) = v7;

    v9 = geo_isolater_create();
    v10 = (void *)*((_QWORD *)v2 + 96);
    *((_QWORD *)v2 + 96) = v9;

    v11 = geo_isolater_create();
    v12 = (void *)*((_QWORD *)v2 + 97);
    *((_QWORD *)v2 + 97) = v11;

    v13 = geo_isolater_create();
    v14 = (void *)*((_QWORD *)v2 + 98);
    *((_QWORD *)v2 + 98) = v13;

    v15 = geo_isolater_create();
    v16 = (void *)*((_QWORD *)v2 + 99);
    *((_QWORD *)v2 + 99) = v15;

    v17 = geo_isolater_create();
    v18 = (void *)*((_QWORD *)v2 + 100);
    *((_QWORD *)v2 + 100) = v17;

    v19 = geo_isolater_create();
    v20 = (void *)*((_QWORD *)v2 + 101);
    *((_QWORD *)v2 + 101) = v19;

    v21 = geo_isolater_create();
    v22 = (void *)*((_QWORD *)v2 + 102);
    *((_QWORD *)v2 + 102) = v21;

    v23 = geo_isolater_create();
    v24 = (void *)*((_QWORD *)v2 + 103);
    *((_QWORD *)v2 + 103) = v23;

    v25 = geo_isolater_create();
    v26 = (void *)*((_QWORD *)v2 + 104);
    *((_QWORD *)v2 + 104) = v25;

    v27 = geo_isolater_create();
    v28 = (void *)*((_QWORD *)v2 + 105);
    *((_QWORD *)v2 + 105) = v27;

    v29 = geo_isolater_create();
    v30 = (void *)*((_QWORD *)v2 + 106);
    *((_QWORD *)v2 + 106) = v29;

    v31 = geo_isolater_create();
    v32 = (void *)*((_QWORD *)v2 + 107);
    *((_QWORD *)v2 + 107) = v31;

    v33 = geo_isolater_create();
    v34 = (void *)*((_QWORD *)v2 + 108);
    *((_QWORD *)v2 + 108) = v33;

    v35 = geo_isolater_create();
    v36 = (void *)*((_QWORD *)v2 + 109);
    *((_QWORD *)v2 + 109) = v35;

    global_queue = geo_get_global_queue();
    v38 = (void *)*((_QWORD *)v2 + 110);
    *((_QWORD *)v2 + 110) = global_queue;

    v39 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *((dispatch_queue_t *)v2 + 110));
    v40 = (void *)*((_QWORD *)v2 + 111);
    *((_QWORD *)v2 + 111) = v39;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 111), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    objc_initWeak(&location, v2);
    v41 = *((_QWORD *)v2 + 111);
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __28__GEOAPSharedStateData_init__block_invoke;
    v43[3] = &unk_250DC62A0;
    objc_copyWeak(&v44, &location);
    dispatch_source_set_event_handler(v41, v43);
    dispatch_activate(*((dispatch_object_t *)v2 + 111));
    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }
  return (GEOAPSharedStateData *)v2;
}

void __28__GEOAPSharedStateData_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleTaskTimer");

}

- (void)_resetTaskTimer
{
  unsigned int UInteger;
  dispatch_time_t v4;

  UInteger = GEOConfigGetUInteger();
  v4 = dispatch_time(0, 1000000000 * UInteger);
  dispatch_source_set_timer((dispatch_source_t)self->_periodicSettingsTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)_stopTaskTimer
{
  dispatch_source_set_timer((dispatch_source_t)self->_periodicSettingsTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
}

- (void)_handleTaskTimer
{
  -[GEOAPSharedStateData periodicSettingsHandler](self, "periodicSettingsHandler");
  -[GEOAPSharedStateData _stopTaskTimer](self, "_stopTaskTimer");
}

- (void)setCarPlayInfo:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_23CBB4000, v5, OS_LOG_TYPE_DEBUG, "setting carplay info : %@", buf, 0xCu);
  }

  v10.receiver = self;
  v10.super_class = (Class)GEOAPSharedStateData;
  -[GEOAnalyticsPipelineStateData setCarPlayInfo:](&v10, sel_setCarPlayInfo_, v4);
  if (self->_isMapsApp)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_23CBB4000, v6, OS_LOG_TYPE_DEBUG, "Maps.app set carplay info : %@", buf, 0xCu);
    }

    +[GEOAPStateFactory sharedFactory](GEOAPStateFactory, "sharedFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stateForType:", 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[GEOAPServiceManager sharedManager](GEOAPServiceManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateSharedStateType:state:", 404, v8);

  }
}

- (void)_performSyncStateUpdateWithIsolator:(id)a3 updateBlock:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  geo_assert_not_isolated();
  geo_isolate_sync();

}

- (void)performMapViewStateUpdate:(id)a3
{
  -[GEOAPSharedStateData _performSyncStateUpdateWithIsolator:updateBlock:](self, "_performSyncStateUpdateWithIsolator:updateBlock:", self->_mapViewIso, a3);
}

- (void)performPlaceCardStateUpdate:(id)a3
{
  geo_reentrant_isolate_sync();
}

- (void)clearPlaceCardStateData
{
  geo_reentrant_isolate_sync();
}

uint64_t __47__GEOAPSharedStateData_clearPlaceCardStateData__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPlaceCardState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "clearPlaceCardPossibleActions");
  objc_msgSend(*(id *)(a1 + 32), "clearPlaceCardUnactionableUiElements");
  objc_msgSend(*(id *)(a1 + 32), "setHasPlaceCardPlaceCardType:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPlaceCardPlaceCardCategory:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHasPlaceCardPlaceActionDetailsAnimationId:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHasPlaceCardPlaceActionDetailsBusinessId:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPlaceCardPlaceActionDetailsDestinationApp:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPlaceCardPlaceActionDetailsPhotoId:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHasPlaceCardPlaceActionDetailsPlaceId:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPlaceCardPlaceActionDetailsRichProviderId:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHasPlaceCardPlaceActionDetailsSearchResponseRelativeTimestamp:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHasPlaceCardPlaceActionDetailsTargetId:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHasPlaceCardPlaceActionDetailsLocalSearchProviderId:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHasPlaceCardPlaceActionDetailsResultIndex:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHasPlaceCardPlaceActionDetailsTransitPlaceCardTransitCategory:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPlaceCardIsPersonPlacecard:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPlaceCardIsPersonAddressAvailable:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setPlaceCardIsPersonLocationShared:", 0);
}

- (void)populateWithPlaceActionDetails:(id)a3
{
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
  id v14;

  v14 = a3;
  geo_assert_reentrant_isolated();
  if (objc_msgSend(v14, "hasPhotoId"))
  {
    objc_msgSend(v14, "photoId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsPhotoId:](self, "setPlaceCardPlaceActionDetailsPhotoId:", v4);

  }
  if (objc_msgSend(v14, "hasPlaceID"))
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsPlaceId:](self, "setPlaceCardPlaceActionDetailsPlaceId:", objc_msgSend(v14, "placeID"));
  if (objc_msgSend(v14, "hasTargetID"))
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsTargetId:](self, "setPlaceCardPlaceActionDetailsTargetId:", objc_msgSend(v14, "targetID"));
  if (objc_msgSend(v14, "hasActionUrl"))
  {
    objc_msgSend(v14, "actionUrl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsActionUrl:](self, "setPlaceCardPlaceActionDetailsActionUrl:", v6);

  }
  if (objc_msgSend(v14, "hasBusinessID"))
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsBusinessId:](self, "setPlaceCardPlaceActionDetailsBusinessId:", objc_msgSend(v14, "businessID"));
  if (objc_msgSend(v14, "hasAnimationID"))
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsAnimationId:](self, "setPlaceCardPlaceActionDetailsAnimationId:", objc_msgSend(v14, "animationID"));
  if (objc_msgSend(v14, "hasResultIndex"))
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsResultIndex:](self, "setPlaceCardPlaceActionDetailsResultIndex:", objc_msgSend(v14, "resultIndex"));
  if (objc_msgSend(v14, "hasDestinationApp"))
  {
    objc_msgSend(v14, "destinationApp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsDestinationApp:](self, "setPlaceCardPlaceActionDetailsDestinationApp:", v8);

  }
  if (objc_msgSend(v14, "hasRichProviderId"))
  {
    objc_msgSend(v14, "richProviderId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsRichProviderId:](self, "setPlaceCardPlaceActionDetailsRichProviderId:", v10);

  }
  if (objc_msgSend(v14, "hasSearchResponseRelativeTimestamp"))
  {
    objc_msgSend(v14, "searchResponseRelativeTimestamp");
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsSearchResponseRelativeTimestamp:](self, "setPlaceCardPlaceActionDetailsSearchResponseRelativeTimestamp:");
  }
  if (objc_msgSend(v14, "hasLocalSearchProviderID"))
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsLocalSearchProviderId:](self, "setPlaceCardPlaceActionDetailsLocalSearchProviderId:", objc_msgSend(v14, "localSearchProviderID"));
  if (objc_msgSend(v14, "hasTransitPlaceCard"))
  {
    objc_msgSend(v14, "transitPlaceCard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOAPSharedStateData _populateWithGEOTransitPlaceCard:](self, "_populateWithGEOTransitPlaceCard:", v11);

  }
  if (objc_msgSend(v14, "hasShowcaseId"))
  {
    objc_msgSend(v14, "showcaseId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsShowcaseId:](self, "setPlaceCardPlaceActionDetailsShowcaseId:", v13);

  }
}

- (void)_populateWithGEOTransitPlaceCard:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  geo_assert_reentrant_isolated();
  if (objc_msgSend(v9, "hasIncidentType"))
  {
    objc_msgSend(v9, "incidentType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType:](self, "setPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType:", v5);

  }
  if (objc_msgSend(v9, "hasTransitCategory"))
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsTransitPlaceCardTransitCategory:](self, "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitCategory:", objc_msgSend(v9, "transitCategory"));
  if (objc_msgSend(v9, "hasTransitSystemName"))
  {
    objc_msgSend(v9, "transitSystemName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName:](self, "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName:", v7);

  }
  if (objc_msgSend(v9, "hasTransitDepartureSequenceUsage"))
  {
    objc_msgSend(v9, "transitDepartureSequenceUsage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOAPSharedStateData _populateWithGEOTransitDepartureSequenceUsage:](self, "_populateWithGEOTransitDepartureSequenceUsage:", v8);

  }
}

- (void)_populateWithGEOTransitDepartureSequenceUsage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  geo_assert_reentrant_isolated();
  if (objc_msgSend(v8, "hasLineId"))
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId:](self, "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId:", objc_msgSend(v8, "lineId"));
  if (objc_msgSend(v8, "hasHeadsign"))
  {
    objc_msgSend(v8, "headsign");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign:](self, "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign:", v5);

  }
  if (objc_msgSend(v8, "hasDirection"))
  {
    objc_msgSend(v8, "direction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection:](self, "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection:", v7);

  }
}

- (void)populateWithPlace:(id)a3 timestamp:(double)a4 resultIndex:(int)a5
{
  id v5;
  id v6;

  v6 = a3;
  v5 = v6;
  geo_reentrant_isolate_sync();

}

void __64__GEOAPSharedStateData_populateWithPlace_timestamp_resultIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setPlaceCardState:", 0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(MEMORY[0x24BE3CFC0], "actionDetailsWithMapItem:timestamp:resultIndex:", v2, *(unsigned int *)(a1 + 56), *(double *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "populateWithPlaceActionDetails:", v3);

}

- (void)populateWithChildPlace:(id)a3 timestamp:(double)a4 resultIndex:(int)a5
{
  id v5;
  id v6;

  v6 = a3;
  v5 = v6;
  geo_reentrant_isolate_sync();

}

void __69__GEOAPSharedStateData_populateWithChildPlace_timestamp_resultIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setPlaceCardState:", 0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(MEMORY[0x24BE3CFC0], "actionDetailsWithChildPlace:timestamp:resultIndex:", v2, *(unsigned int *)(a1 + 56), *(double *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "populateWithPlaceActionDetails:", v3);

}

- (BOOL)hasPlaceCardStateData
{
  return -[GEOAnalyticsPipelineStateData placeCardPossibleActionsCount](self, "placeCardPossibleActionsCount")
      || -[GEOAnalyticsPipelineStateData placeCardUnactionableUiElementsCount](self, "placeCardUnactionableUiElementsCount")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceCardType](self, "hasPlaceCardPlaceCardType")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceCardCategory](self, "hasPlaceCardPlaceCardCategory")|| -[GEOAnalyticsPipelineStateData hasPlaceCardTransitAdvisoryBanner](self, "hasPlaceCardTransitAdvisoryBanner")|| -[GEOAPSharedStateData hasPlaceCard_PlaceActionDetails](self, "hasPlaceCard_PlaceActionDetails");
}

- (BOOL)hasPlaceCard_PlaceActionDetails
{
  return -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsActionUrl](self, "hasPlaceCardPlaceActionDetailsActionUrl")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsAnimationId](self, "hasPlaceCardPlaceActionDetailsAnimationId")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsBusinessId](self, "hasPlaceCardPlaceActionDetailsBusinessId")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsDestinationApp](self, "hasPlaceCardPlaceActionDetailsDestinationApp")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsPhotoId](self, "hasPlaceCardPlaceActionDetailsPhotoId")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsPlaceId](self, "hasPlaceCardPlaceActionDetailsPlaceId")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsRichProviderId](self,
           "hasPlaceCardPlaceActionDetailsRichProviderId")
      || -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsSearchResponseRelativeTimestamp](self, "hasPlaceCardPlaceActionDetailsSearchResponseRelativeTimestamp")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsTargetId](self, "hasPlaceCardPlaceActionDetailsTargetId")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsLocalSearchProviderId](self, "hasPlaceCardPlaceActionDetailsLocalSearchProviderId")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsResultIndex](self, "hasPlaceCardPlaceActionDetailsResultIndex")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsShowcaseId](self, "hasPlaceCardPlaceActionDetailsShowcaseId")|| -[GEOAPSharedStateData hasPlaceCard_PlaceActionDetails_TransitPlaceCard](self, "hasPlaceCard_PlaceActionDetails_TransitPlaceCard");
}

- (BOOL)hasPlaceCard_PlaceActionDetails_TransitPlaceCard
{
  return -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType](self, "hasPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName](self, "hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitCategory](self, "hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitCategory")|| -[GEOAPSharedStateData hasPlaceCard_PlaceActionDetails_TransitPlaceCard_TransitDepartureSequence](self, "hasPlaceCard_PlaceActionDetails_TransitPlaceCard_TransitDepartureSequence");
}

- (BOOL)hasPlaceCard_PlaceActionDetails_TransitPlaceCard_TransitDepartureSequence
{
  return -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection](self, "hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId](self, "hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId")|| -[GEOAnalyticsPipelineStateData hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign](self, "hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign");
}

- (void)addPlaceCardModulesForRevealAction:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_reentrant_isolate_sync();

}

void __59__GEOAPSharedStateData_addPlaceCardModulesForRevealAction___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "placeCardRevealedPlaceCardModules");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "placeCardRevealedPlaceCardModules", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(v9, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (BOOL)hasMapsServerData
{
  BOOL v3;
  void *v4;

  if (-[GEOAnalyticsPipelineStateData hasMapsServerMetadata](self, "hasMapsServerMetadata")
    || -[GEOAnalyticsPipelineStateData hasMapsServerMetadataSuggestionEntryTappedOn](self, "hasMapsServerMetadataSuggestionEntryTappedOn"))
  {
    return 1;
  }
  -[GEOAnalyticsPipelineStateData mapsServerMetadataSuggestionEntryDisplayeds](self, "mapsServerMetadataSuggestionEntryDisplayeds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "count") != 0;

  return v3;
}

- (BOOL)hasSuggestionsData
{
  BOOL v3;
  void *v5;

  if (-[GEOAnalyticsPipelineStateData hasSuggestionsSearchString](self, "hasSuggestionsSearchString")
    || -[GEOAnalyticsPipelineStateData hasSuggestionsSelectedIndex](self, "hasSuggestionsSelectedIndex")
    || -[GEOAnalyticsPipelineStateData hasSuggestionsSearchFieldType](self, "hasSuggestionsSearchFieldType")
    || -[GEOAnalyticsPipelineStateData hasSuggestionsAcSequenceNumber](self, "hasSuggestionsAcSequenceNumber"))
  {
    return 1;
  }
  -[GEOAnalyticsPipelineStateData suggestionsDisplayedResults](self, "suggestionsDisplayedResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "count") != 0;

  return v3;
}

- (void)clearSuggestionsData
{
  -[GEOAnalyticsPipelineStateData setSuggestionsSearchString:](self, "setSuggestionsSearchString:", 0);
  -[GEOAnalyticsPipelineStateData setHasSuggestionsSelectedIndex:](self, "setHasSuggestionsSelectedIndex:", 0);
  -[GEOAnalyticsPipelineStateData setHasSuggestionsSearchFieldType:](self, "setHasSuggestionsSearchFieldType:", 0);
  -[GEOAnalyticsPipelineStateData setHasSuggestionsAcSequenceNumber:](self, "setHasSuggestionsAcSequenceNumber:", 0);
  -[GEOAnalyticsPipelineStateData clearSuggestionsDisplayedResults](self, "clearSuggestionsDisplayedResults");
}

- (BOOL)hasMapRestoreData
{
  return -[GEOAnalyticsPipelineStateData hasRestoreUiTarget](self, "hasRestoreUiTarget")
      || -[GEOAnalyticsPipelineStateData hasRestoreLayoutInfo](self, "hasRestoreLayoutInfo")
      || -[GEOAnalyticsPipelineStateData hasRestoreLayoutStyle](self, "hasRestoreLayoutStyle");
}

- (BOOL)hasMapLaunchData
{
  return -[GEOAnalyticsPipelineStateData hasMapLaunchSourceAppId](self, "hasMapLaunchSourceAppId")
      || -[GEOAnalyticsPipelineStateData hasMapLaunchLaunchUri](self, "hasMapLaunchLaunchUri")
      || -[GEOAnalyticsPipelineStateData hasMapLaunchReferringWebsite](self, "hasMapLaunchReferringWebsite")
      || -[GEOAnalyticsPipelineStateData hasMapLaunchIsHandoff](self, "hasMapLaunchIsHandoff")
      || -[GEOAnalyticsPipelineStateData hasMapLaunchSourceHandoffDevice](self, "hasMapLaunchSourceHandoffDevice");
}

- (int)moduleButtonLinkTypeAsGEOActionButtonLinkType:(int)a3
{
  if ((a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

- (int)moduleButtonTypeAsGEOModuleButtonType:(int64_t)a3
{
  int result;

  switch(a3)
  {
    case 1:
      result = 1;
      break;
    case 2:
      result = 2;
      break;
    case 3:
      result = 3;
      break;
    case 4:
      result = 4;
      break;
    case 5:
      result = 5;
      break;
    case 6:
      result = 6;
      break;
    case 7:
      result = 7;
      break;
    case 8:
      result = 8;
      break;
    case 9:
      result = 9;
      break;
    case 10:
      result = 10;
      break;
    default:
      switch(a3)
      {
        case '2':
          result = 50;
          break;
        case '3':
          result = 51;
          break;
        case '4':
          result = 52;
          break;
        case '5':
          result = 53;
          break;
        case '6':
          result = 54;
          break;
        case '7':
          result = 55;
          break;
        case '8':
          result = 56;
          break;
        default:
          result = 0;
          break;
      }
      break;
  }
  return result;
}

- (int)navVoiceVolumeAsGEONavVoiceVolume
{
  int result;

  result = -[GEOAnalyticsPipelineStateData hasMapSettingsNavVolume](self, "hasMapSettingsNavVolume");
  if (result)
  {
    result = -[GEOAnalyticsPipelineStateData mapSettingsNavVolume](self, "mapSettingsNavVolume");
    if ((result - 1) >= 4)
      return 0;
  }
  return result;
}

- (int)_geoVoiceGuidanceLevelFromAPVoiceGuidanceLevel:(int)a3
{
  if ((a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

- (int)_geoTransportModeForAPTransportMode:(int)a3
{
  if ((a3 - 1) >= 5)
    return 0;
  else
    return a3;
}

- (int)transportModeAsGEOTransportMode
{
  int result;

  result = -[GEOAnalyticsPipelineStateData hasMapSettingsTransportMode](self, "hasMapSettingsTransportMode");
  if (result)
    return -[GEOAPSharedStateData _geoTransportModeForAPTransportMode:](self, "_geoTransportModeForAPTransportMode:", -[GEOAnalyticsPipelineStateData mapSettingsTransportMode](self, "mapSettingsTransportMode"));
  return result;
}

- (int)activeNavModeAsGEOTransportType
{
  int v3;

  if (-[GEOAnalyticsPipelineStateData hasMapUiShownActiveNavMode](self, "hasMapUiShownActiveNavMode")
    && (v3 = -[GEOAnalyticsPipelineStateData mapUiShownActiveNavMode](self, "mapUiShownActiveNavMode") - 1,
        v3 <= 4))
  {
    return dword_23CC49DFC[v3];
  }
  else
  {
    return 4;
  }
}

- (int)locationPrecisionTypeAsGEOSettingsLocationType
{
  int result;

  result = -[GEOAnalyticsPipelineStateData hasMapSettingsLocationPrecisionType](self, "hasMapSettingsLocationPrecisionType");
  if (result)
  {
    result = -[GEOAnalyticsPipelineStateData mapSettingsLocationPrecisionType](self, "mapSettingsLocationPrecisionType");
    if ((result - 1) >= 3)
      return 0;
  }
  return result;
}

- (int)layoutInfoAsGEOLayoutInfo
{
  int result;

  result = -[GEOAnalyticsPipelineStateData hasMapUiLayoutInfo](self, "hasMapUiLayoutInfo");
  if (result)
  {
    result = -[GEOAnalyticsPipelineStateData mapUiLayoutInfo](self, "mapUiLayoutInfo");
    if ((result - 1) >= 3)
      return 0;
  }
  return result;
}

- (int)layoutStyleAsGEOLayoutStyle
{
  int result;

  result = -[GEOAnalyticsPipelineStateData hasMapUiLayoutStyle](self, "hasMapUiLayoutStyle");
  if (result)
  {
    result = -[GEOAnalyticsPipelineStateData mapUiLayoutStyle](self, "mapUiLayoutStyle");
    if ((result - 1) >= 5)
      return 0;
  }
  return result;
}

- (void)_performUserProfileStateOperation:(id)a3
{
  id v4;
  geo_isolater *userProfileIso;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  userProfileIso = self->_userProfileIso;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__GEOAPSharedStateData__performUserProfileStateOperation___block_invoke;
  v7[3] = &unk_250DC06B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[GEOAPSharedStateData _performSyncStateUpdateWithIsolator:updateBlock:](self, "_performSyncStateUpdateWithIsolator:updateBlock:", userProfileIso, v7);

}

uint64_t __58__GEOAPSharedStateData__performUserProfileStateOperation___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_resetTaskTimer");
  return result;
}

- (void)setUserProfileUserIsLoggedIntoICloud:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __61__GEOAPSharedStateData_setUserProfileUserIsLoggedIntoICloud___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData _performUserProfileStateOperation:](self, "_performUserProfileStateOperation:", v3);
}

uint64_t __61__GEOAPSharedStateData_setUserProfileUserIsLoggedIntoICloud___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  int v5;
  uint64_t v7;
  void *v8;

  if (!objc_msgSend(*(id *)(a1 + 32), "hasAccount"))
  {
    v2 = objc_alloc_init(MEMORY[0x24BE3CDE8]);
    objc_msgSend(*(id *)(a1 + 32), "setAccount:", v2);
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "account");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "hasSignedIntoIcloud") & 1) == 0)
  {
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "signedIntoIcloud");
  v5 = *(unsigned __int8 *)(a1 + 40);

  if (v5 == v4)
    return 0;
LABEL_7:
  v7 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSignedIntoIcloud:", v7);

  return 1;
}

- (void)setUserProfileAvailableActions:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__GEOAPSharedStateData_setUserProfileAvailableActions___block_invoke;
  v6[3] = &unk_250DC62F0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[GEOAPSharedStateData _performUserProfileStateOperation:](self, "_performUserProfileStateOperation:", v6);

}

uint64_t __55__GEOAPSharedStateData_setUserProfileAvailableActions___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "hasAccount") & 1) == 0)
  {
    v2 = objc_alloc_init(MEMORY[0x24BE3CDE8]);
    objc_msgSend(*(id *)(a1 + 32), "setAccount:", v2);

  }
  objc_msgSend(*(id *)(a1 + 32), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearPossibleActions");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 40);
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
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 32), "account", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addPossibleAction:", objc_msgSend(v9, "intValue"));

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return 1;
}

- (void)performMapUIShownStateOperation:(id)a3
{
  id v4;
  geo_isolater *mapUIShownIso;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  mapUIShownIso = self->_mapUIShownIso;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__GEOAPSharedStateData_performMapUIShownStateOperation___block_invoke;
  v7[3] = &unk_250DC06B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[GEOAPSharedStateData _performSyncStateUpdateWithIsolator:updateBlock:](self, "_performSyncStateUpdateWithIsolator:updateBlock:", mapUIShownIso, v7);

}

uint64_t __56__GEOAPSharedStateData_performMapUIShownStateOperation___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_resetTaskTimer");
  return result;
}

- (void)setMapUiShownAqiShown:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__GEOAPSharedStateData_setMapUiShownAqiShown___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapUIShownStateOperation:](self, "performMapUIShownStateOperation:", v3);
}

uint64_t __46__GEOAPSharedStateData_setMapUiShownAqiShown___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapUiShownAqiShown") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapUiShownAqiShown");
    v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapUiShownAqiShown_, v3 != 0);
  return 1;
}

- (void)setHasMapUiShownAqiShown:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__GEOAPSharedStateData_setHasMapUiShownAqiShown___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapUIShownStateOperation:](self, "performMapUIShownStateOperation:", v3);
}

BOOL __49__GEOAPSharedStateData_setHasMapUiShownAqiShown___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapUiShownAqiShown");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapUiShownAqiShown_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapUiShownWeatherShown:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__GEOAPSharedStateData_setMapUiShownWeatherShown___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapUIShownStateOperation:](self, "performMapUIShownStateOperation:", v3);
}

uint64_t __50__GEOAPSharedStateData_setMapUiShownWeatherShown___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapUiShownWeatherShown") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapUiShownWeatherShown");
    v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapUiShownWeatherShown_, v3 != 0);
  return 1;
}

- (void)setHasMapUiShownWeatherShown:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__GEOAPSharedStateData_setHasMapUiShownWeatherShown___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapUIShownStateOperation:](self, "performMapUIShownStateOperation:", v3);
}

BOOL __53__GEOAPSharedStateData_setHasMapUiShownWeatherShown___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapUiShownWeatherShown");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapUiShownWeatherShown_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapUiShownActiveNavMode:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__GEOAPSharedStateData_setMapUiShownActiveNavMode___block_invoke;
  v3[3] = &unk_250DC6318;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapUIShownStateOperation:](self, "performMapUIShownStateOperation:", v3);
}

uint64_t __51__GEOAPSharedStateData_setMapUiShownActiveNavMode___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapUiShownActiveNavMode") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapUiShownActiveNavMode");
    v3 = *(unsigned int *)(a1 + 40);
    if (v2 == (_DWORD)v3)
      return 0;
  }
  else
  {
    v3 = *(unsigned int *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapUiShownActiveNavMode_, v3);
  return 1;
}

- (void)setHasMapUiShownActiveNavMode:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__GEOAPSharedStateData_setHasMapUiShownActiveNavMode___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapUIShownStateOperation:](self, "performMapUIShownStateOperation:", v3);
}

BOOL __54__GEOAPSharedStateData_setHasMapUiShownActiveNavMode___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapUiShownActiveNavMode");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapUiShownActiveNavMode_, v3 != 0);
  }
  return v3 != v2;
}

- (void)performMapSettingsStateOperation:(id)a3
{
  id v4;
  geo_isolater *mapSettingsIso;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  mapSettingsIso = self->_mapSettingsIso;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__GEOAPSharedStateData_performMapSettingsStateOperation___block_invoke;
  v7[3] = &unk_250DC06B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[GEOAPSharedStateData _performSyncStateUpdateWithIsolator:updateBlock:](self, "_performSyncStateUpdateWithIsolator:updateBlock:", mapSettingsIso, v7);

}

uint64_t __57__GEOAPSharedStateData_performMapSettingsStateOperation___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_resetTaskTimer");
  return result;
}

- (void)setNavVoiceGuidanceLevel:(int)a3 forTransportMode:(int)a4
{
  uint64_t v4;
  int v6;
  int v7;
  _QWORD v8[5];
  int v9;
  int v10;

  v4 = *(_QWORD *)&a4;
  v6 = -[GEOAPSharedStateData _geoVoiceGuidanceLevelFromAPVoiceGuidanceLevel:](self, "_geoVoiceGuidanceLevelFromAPVoiceGuidanceLevel:", *(_QWORD *)&a3);
  v7 = -[GEOAPSharedStateData _geoTransportModeForAPTransportMode:](self, "_geoTransportModeForAPTransportMode:", v4);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__GEOAPSharedStateData_setNavVoiceGuidanceLevel_forTransportMode___block_invoke;
  v8[3] = &unk_250DC6340;
  v9 = v7;
  v10 = v6;
  v8[4] = self;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v8);
}

uint64_t __66__GEOAPSharedStateData_setNavVoiceGuidanceLevel_forTransportMode___block_invoke(uint64_t a1)
{
  int v1;
  objc_super v3;
  objc_super v4;
  objc_super v5;

  v1 = *(_DWORD *)(a1 + 40);
  switch(v1)
  {
    case 5:
      objc_msgSendSuper2(&v3, sel_setMapSettingsCyclingVoiceSettings_, *(unsigned int *)(a1 + 44), *(_QWORD *)(a1 + 32), GEOAPSharedStateData, v4.receiver, v4.super_class, v5.receiver, v5.super_class);
      break;
    case 2:
      objc_msgSendSuper2(&v4, sel_setMapSettingsWalkingVoiceSettings_, *(unsigned int *)(a1 + 44), v3.receiver, v3.super_class, *(_QWORD *)(a1 + 32), GEOAPSharedStateData, v5.receiver, v5.super_class);
      break;
    case 1:
      objc_msgSendSuper2(&v5, sel_setMapSettingsDrivingVoiceSettings_, *(unsigned int *)(a1 + 44), v3.receiver, v3.super_class, v4.receiver, v4.super_class, *(_QWORD *)(a1 + 32), GEOAPSharedStateData);
      break;
  }
  return 1;
}

- (void)setMapSettingsNavVolume:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__GEOAPSharedStateData_setMapSettingsNavVolume___block_invoke;
  v3[3] = &unk_250DC6318;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

uint64_t __48__GEOAPSharedStateData_setMapSettingsNavVolume___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsNavVolume") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapSettingsNavVolume");
    v3 = *(unsigned int *)(a1 + 40);
    if (v2 == (_DWORD)v3)
      return 0;
  }
  else
  {
    v3 = *(unsigned int *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsNavVolume_, v3);
  return 1;
}

- (void)setHasMapSettingsNavVolume:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__GEOAPSharedStateData_setHasMapSettingsNavVolume___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

BOOL __51__GEOAPSharedStateData_setHasMapSettingsNavVolume___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsNavVolume");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsNavVolume_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsTransportMode:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__GEOAPSharedStateData_setMapSettingsTransportMode___block_invoke;
  v3[3] = &unk_250DC6318;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

uint64_t __52__GEOAPSharedStateData_setMapSettingsTransportMode___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsTransportMode") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapSettingsTransportMode");
    v3 = *(unsigned int *)(a1 + 40);
    if (v2 == (_DWORD)v3)
      return 0;
  }
  else
  {
    v3 = *(unsigned int *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsTransportMode_, v3);
  return 1;
}

- (void)setHasMapSettingsTransportMode:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__GEOAPSharedStateData_setHasMapSettingsTransportMode___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

BOOL __55__GEOAPSharedStateData_setHasMapSettingsTransportMode___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsTransportMode");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsTransportMode_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsAvoidHighways:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__GEOAPSharedStateData_setMapSettingsAvoidHighways___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

uint64_t __52__GEOAPSharedStateData_setMapSettingsAvoidHighways___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsAvoidHighways") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapSettingsAvoidHighways");
    v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsAvoidHighways_, v3 != 0);
  return 1;
}

- (void)setHasMapSettingsAvoidHighways:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__GEOAPSharedStateData_setHasMapSettingsAvoidHighways___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

BOOL __55__GEOAPSharedStateData_setHasMapSettingsAvoidHighways___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsAvoidHighways");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsAvoidHighways_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsAvoidTolls:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__GEOAPSharedStateData_setMapSettingsAvoidTolls___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

uint64_t __49__GEOAPSharedStateData_setMapSettingsAvoidTolls___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsAvoidTolls") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapSettingsAvoidTolls");
    v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsAvoidTolls_, v3 != 0);
  return 1;
}

- (void)setHasMapSettingsAvoidTolls:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__GEOAPSharedStateData_setHasMapSettingsAvoidTolls___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

BOOL __52__GEOAPSharedStateData_setHasMapSettingsAvoidTolls___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsAvoidTolls");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsAvoidTolls_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsFindMyCarEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__GEOAPSharedStateData_setMapSettingsFindMyCarEnabled___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

uint64_t __55__GEOAPSharedStateData_setMapSettingsFindMyCarEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsFindMyCarEnabled") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapSettingsFindMyCarEnabled");
    v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsFindMyCarEnabled_, v3 != 0);
  return 1;
}

- (void)setHasMapSettingsFindMyCarEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__GEOAPSharedStateData_setHasMapSettingsFindMyCarEnabled___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

BOOL __58__GEOAPSharedStateData_setHasMapSettingsFindMyCarEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsFindMyCarEnabled");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsFindMyCarEnabled_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsHeadingEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__GEOAPSharedStateData_setMapSettingsHeadingEnabled___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

uint64_t __53__GEOAPSharedStateData_setMapSettingsHeadingEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsHeadingEnabled") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapSettingsHeadingEnabled");
    v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsHeadingEnabled_, v3 != 0);
  return 1;
}

- (void)setHasMapSettingsHeadingEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__GEOAPSharedStateData_setHasMapSettingsHeadingEnabled___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

BOOL __56__GEOAPSharedStateData_setHasMapSettingsHeadingEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsHeadingEnabled");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsHeadingEnabled_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsLabelEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__GEOAPSharedStateData_setMapSettingsLabelEnabled___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

uint64_t __51__GEOAPSharedStateData_setMapSettingsLabelEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsLabelEnabled") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapSettingsLabelEnabled");
    v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsLabelEnabled_, v3 != 0);
  return 1;
}

- (void)setHasMapSettingsLabelEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__GEOAPSharedStateData_setHasMapSettingsLabelEnabled___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

BOOL __54__GEOAPSharedStateData_setHasMapSettingsLabelEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsLabelEnabled");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsLabelEnabled_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsPauseSpokenAudioEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __62__GEOAPSharedStateData_setMapSettingsPauseSpokenAudioEnabled___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

uint64_t __62__GEOAPSharedStateData_setMapSettingsPauseSpokenAudioEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsPauseSpokenAudioEnabled") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapSettingsPauseSpokenAudioEnabled");
    v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsPauseSpokenAudioEnabled_, v3 != 0);
  return 1;
}

- (void)setHasMapSettingsPauseSpokenAudioEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __65__GEOAPSharedStateData_setHasMapSettingsPauseSpokenAudioEnabled___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

BOOL __65__GEOAPSharedStateData_setHasMapSettingsPauseSpokenAudioEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsPauseSpokenAudioEnabled");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsPauseSpokenAudioEnabled_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsSpeedLimitEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__GEOAPSharedStateData_setMapSettingsSpeedLimitEnabled___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

uint64_t __56__GEOAPSharedStateData_setMapSettingsSpeedLimitEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsSpeedLimitEnabled") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapSettingsSpeedLimitEnabled");
    v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsSpeedLimitEnabled_, v3 != 0);
  return 1;
}

- (void)setHasMapSettingsSpeedLimitEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__GEOAPSharedStateData_setHasMapSettingsSpeedLimitEnabled___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

BOOL __59__GEOAPSharedStateData_setHasMapSettingsSpeedLimitEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsSpeedLimitEnabled");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsSpeedLimitEnabled_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsTrafficEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__GEOAPSharedStateData_setMapSettingsTrafficEnabled___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

uint64_t __53__GEOAPSharedStateData_setMapSettingsTrafficEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsTrafficEnabled") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapSettingsTrafficEnabled");
    v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsTrafficEnabled_, v3 != 0);
  return 1;
}

- (void)setHasMapSettingsTrafficEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__GEOAPSharedStateData_setHasMapSettingsTrafficEnabled___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

BOOL __56__GEOAPSharedStateData_setHasMapSettingsTrafficEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsTrafficEnabled");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsTrafficEnabled_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsAvoidHills:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__GEOAPSharedStateData_setMapSettingsAvoidHills___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

uint64_t __49__GEOAPSharedStateData_setMapSettingsAvoidHills___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsAvoidHills") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapSettingsAvoidHills");
    v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsAvoidHills_, v3 != 0);
  return 1;
}

- (void)setHasMapSettingsAvoidHills:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__GEOAPSharedStateData_setHasMapSettingsAvoidHills___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

BOOL __52__GEOAPSharedStateData_setHasMapSettingsAvoidHills___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsAvoidHills");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsAvoidHills_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsAvoidStairs:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__GEOAPSharedStateData_setMapSettingsAvoidStairs___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

uint64_t __50__GEOAPSharedStateData_setMapSettingsAvoidStairs___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsAvoidStairs") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapSettingsAvoidStairs");
    v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsAvoidStairs_, v3 != 0);
  return 1;
}

- (void)setHasMapSettingsAvoidStairs:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__GEOAPSharedStateData_setHasMapSettingsAvoidStairs___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

BOOL __53__GEOAPSharedStateData_setHasMapSettingsAvoidStairs___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsAvoidStairs");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsAvoidStairs_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsAvoidBusyRoads:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__GEOAPSharedStateData_setMapSettingsAvoidBusyRoads___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

uint64_t __53__GEOAPSharedStateData_setMapSettingsAvoidBusyRoads___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsAvoidBusyRoads") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapSettingsAvoidBusyRoads");
    v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsAvoidBusyRoads_, v3 != 0);
  return 1;
}

- (void)setHasMapSettingsAvoidBusyRoads:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__GEOAPSharedStateData_setHasMapSettingsAvoidBusyRoads___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

BOOL __56__GEOAPSharedStateData_setHasMapSettingsAvoidBusyRoads___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsAvoidBusyRoads");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsAvoidBusyRoads_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsLocationPrecisionType:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__GEOAPSharedStateData_setMapSettingsLocationPrecisionType___block_invoke;
  v3[3] = &unk_250DC6318;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

uint64_t __60__GEOAPSharedStateData_setMapSettingsLocationPrecisionType___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsLocationPrecisionType") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapSettingsLocationPrecisionType");
    v3 = *(unsigned int *)(a1 + 40);
    if (v2 == (_DWORD)v3)
      return 0;
  }
  else
  {
    v3 = *(unsigned int *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsLocationPrecisionType_, v3);
  return 1;
}

- (void)setHasMapSettingsLocationPrecisionType:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __63__GEOAPSharedStateData_setHasMapSettingsLocationPrecisionType___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

BOOL __63__GEOAPSharedStateData_setHasMapSettingsLocationPrecisionType___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsLocationPrecisionType");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsLocationPrecisionType_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsEBike:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__GEOAPSharedStateData_setMapSettingsEBike___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

uint64_t __44__GEOAPSharedStateData_setMapSettingsEBike___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsEBike") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapSettingsEBike");
    v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsEBike_, v3 != 0);
  return 1;
}

- (void)setHasMapSettingsEBike:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__GEOAPSharedStateData_setHasMapSettingsEBike___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

BOOL __47__GEOAPSharedStateData_setHasMapSettingsEBike___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsEBike");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsEBike_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsWalkingAvoidHills:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__GEOAPSharedStateData_setMapSettingsWalkingAvoidHills___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

uint64_t __56__GEOAPSharedStateData_setMapSettingsWalkingAvoidHills___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsWalkingAvoidHills") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapSettingsWalkingAvoidHills");
    v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsWalkingAvoidHills_, v3 != 0);
  return 1;
}

- (void)setHasMapSettingsWalkingAvoidHills:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__GEOAPSharedStateData_setHasMapSettingsWalkingAvoidHills___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

BOOL __59__GEOAPSharedStateData_setHasMapSettingsWalkingAvoidHills___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsWalkingAvoidHills");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsWalkingAvoidHills_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsWalkingAvoidStairs:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__GEOAPSharedStateData_setMapSettingsWalkingAvoidStairs___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

uint64_t __57__GEOAPSharedStateData_setMapSettingsWalkingAvoidStairs___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsWalkingAvoidStairs") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapSettingsWalkingAvoidStairs");
    v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsWalkingAvoidStairs_, v3 != 0);
  return 1;
}

- (void)setHasMapSettingsWalkingAvoidStairs:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__GEOAPSharedStateData_setHasMapSettingsWalkingAvoidStairs___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

BOOL __60__GEOAPSharedStateData_setHasMapSettingsWalkingAvoidStairs___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsWalkingAvoidStairs");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsWalkingAvoidStairs_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsWalkingAvoidBusyRoads:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__GEOAPSharedStateData_setMapSettingsWalkingAvoidBusyRoads___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

uint64_t __60__GEOAPSharedStateData_setMapSettingsWalkingAvoidBusyRoads___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsWalkingAvoidBusyRoads") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapSettingsWalkingAvoidBusyRoads");
    v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsWalkingAvoidBusyRoads_, v3 != 0);
  return 1;
}

- (void)setHasMapSettingsWalkingAvoidBusyRoads:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __63__GEOAPSharedStateData_setHasMapSettingsWalkingAvoidBusyRoads___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

BOOL __63__GEOAPSharedStateData_setHasMapSettingsWalkingAvoidBusyRoads___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsWalkingAvoidBusyRoads");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsWalkingAvoidBusyRoads_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapSettingsDirectionsWakeDevice:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__GEOAPSharedStateData_setMapSettingsDirectionsWakeDevice___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

uint64_t __59__GEOAPSharedStateData_setMapSettingsDirectionsWakeDevice___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsDirectionsWakeDevice") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapSettingsDirectionsWakeDevice");
    v3 = *(unsigned __int8 *)(a1 + 40);
    if (v3 == v2)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v5, sel_setMapSettingsDirectionsWakeDevice_, v3 != 0);
  return 1;
}

- (void)setHasMapSettingsDirectionsWakeDevice:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __62__GEOAPSharedStateData_setHasMapSettingsDirectionsWakeDevice___block_invoke;
  v3[3] = &unk_250DC62C8;
  v3[4] = self;
  v4 = a3;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v3);
}

BOOL __62__GEOAPSharedStateData_setHasMapSettingsDirectionsWakeDevice___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  objc_super v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsDirectionsWakeDevice");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)GEOAPSharedStateData;
    objc_msgSendSuper2(&v5, sel_setHasMapSettingsDirectionsWakeDevice_, v3 != 0);
  }
  return v3 != v2;
}

- (void)setMapFeaturePersonalCollectionsCount:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __62__GEOAPSharedStateData_setMapFeaturePersonalCollectionsCount___block_invoke;
  v3[3] = &unk_250DC6318;
  v4 = a3;
  v3[4] = self;
  -[GEOAPSharedStateData performMapFeaturesStateOperation:](self, "performMapFeaturesStateOperation:", v3);
}

uint64_t __62__GEOAPSharedStateData_setMapFeaturePersonalCollectionsCount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeaturePersonalCollectionsCount_, v1);
  return 1;
}

- (void)setMapFeatureSavedCollectionsCount:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__GEOAPSharedStateData_setMapFeatureSavedCollectionsCount___block_invoke;
  v3[3] = &unk_250DC6318;
  v4 = a3;
  v3[4] = self;
  -[GEOAPSharedStateData performMapFeaturesStateOperation:](self, "performMapFeaturesStateOperation:", v3);
}

uint64_t __59__GEOAPSharedStateData_setMapFeatureSavedCollectionsCount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureSavedCollectionsCount_, v1);
  return 1;
}

- (void)setMapFeatureSubmittedRatingsCount:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__GEOAPSharedStateData_setMapFeatureSubmittedRatingsCount___block_invoke;
  v3[3] = &unk_250DC6318;
  v4 = a3;
  v3[4] = self;
  -[GEOAPSharedStateData performMapFeaturesStateOperation:](self, "performMapFeaturesStateOperation:", v3);
}

uint64_t __59__GEOAPSharedStateData_setMapFeatureSubmittedRatingsCount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureSubmittedRatingsCount_, v1);
  return 1;
}

- (void)setMapFeatureSubmittedPhotosCount:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__GEOAPSharedStateData_setMapFeatureSubmittedPhotosCount___block_invoke;
  v3[3] = &unk_250DC6318;
  v4 = a3;
  v3[4] = self;
  -[GEOAPSharedStateData performMapFeaturesStateOperation:](self, "performMapFeaturesStateOperation:", v3);
}

uint64_t __58__GEOAPSharedStateData_setMapFeatureSubmittedPhotosCount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureSubmittedPhotosCount_, v1);
  return 1;
}

- (void)setMapFeatureElectronicVehicleCount:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__GEOAPSharedStateData_setMapFeatureElectronicVehicleCount___block_invoke;
  v3[3] = &unk_250DC6318;
  v4 = a3;
  v3[4] = self;
  -[GEOAPSharedStateData performMapFeaturesStateOperation:](self, "performMapFeaturesStateOperation:", v3);
}

uint64_t __60__GEOAPSharedStateData_setMapFeatureElectronicVehicleCount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureElectronicVehicleCount_, v1);
  return 1;
}

- (void)setMapFeatureLicensePlateCount:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__GEOAPSharedStateData_setMapFeatureLicensePlateCount___block_invoke;
  v3[3] = &unk_250DC6318;
  v4 = a3;
  v3[4] = self;
  -[GEOAPSharedStateData performMapFeaturesStateOperation:](self, "performMapFeaturesStateOperation:", v3);
}

uint64_t __55__GEOAPSharedStateData_setMapFeatureLicensePlateCount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureLicensePlateCount_, v1);
  return 1;
}

- (void)setMapFeatureLibrarySavedPlacesCount:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __61__GEOAPSharedStateData_setMapFeatureLibrarySavedPlacesCount___block_invoke;
  v3[3] = &unk_250DC6318;
  v4 = a3;
  v3[4] = self;
  -[GEOAPSharedStateData performMapFeaturesStateOperation:](self, "performMapFeaturesStateOperation:", v3);
}

uint64_t __61__GEOAPSharedStateData_setMapFeatureLibrarySavedPlacesCount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureLibrarySavedPlacesCount_, v1);
  return 1;
}

- (void)setMapFeatureLibraryPlacesWithNoteCount:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __64__GEOAPSharedStateData_setMapFeatureLibraryPlacesWithNoteCount___block_invoke;
  v3[3] = &unk_250DC6318;
  v4 = a3;
  v3[4] = self;
  -[GEOAPSharedStateData performMapFeaturesStateOperation:](self, "performMapFeaturesStateOperation:", v3);
}

uint64_t __64__GEOAPSharedStateData_setMapFeatureLibraryPlacesWithNoteCount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureLibraryPlacesWithNoteCount_, v1);
  return 1;
}

- (void)setMapFeatureLibraryGuidesSavedPlacesCount:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __67__GEOAPSharedStateData_setMapFeatureLibraryGuidesSavedPlacesCount___block_invoke;
  v3[3] = &unk_250DC6318;
  v4 = a3;
  v3[4] = self;
  -[GEOAPSharedStateData performMapFeaturesStateOperation:](self, "performMapFeaturesStateOperation:", v3);
}

uint64_t __67__GEOAPSharedStateData_setMapFeatureLibraryGuidesSavedPlacesCount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureLibraryGuidesSavedPlacesCount_, v1);
  return 1;
}

- (void)setMapFeatureLibraryFavoritesGuideSavedPlacesCount:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __75__GEOAPSharedStateData_setMapFeatureLibraryFavoritesGuideSavedPlacesCount___block_invoke;
  v3[3] = &unk_250DC6318;
  v4 = a3;
  v3[4] = self;
  -[GEOAPSharedStateData performMapFeaturesStateOperation:](self, "performMapFeaturesStateOperation:", v3);
}

uint64_t __75__GEOAPSharedStateData_setMapFeatureLibraryFavoritesGuideSavedPlacesCount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureLibraryFavoritesGuideSavedPlacesCount_, v1);
  return 1;
}

- (void)setMapFeatureFavoritesCount:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__GEOAPSharedStateData_setMapFeatureFavoritesCount___block_invoke;
  v3[3] = &unk_250DC6318;
  v4 = a3;
  v3[4] = self;
  -[GEOAPSharedStateData performMapFeaturesStateOperation:](self, "performMapFeaturesStateOperation:", v3);
}

uint64_t __52__GEOAPSharedStateData_setMapFeatureFavoritesCount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GEOAPSharedStateData;
  objc_msgSendSuper2(&v3, sel_setMapFeatureFavoritesCount_, v1);
  return 1;
}

- (void)performMapFeaturesStateOperation:(id)a3
{
  id v4;
  geo_isolater *mapFeaturesIso;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  mapFeaturesIso = self->_mapFeaturesIso;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__GEOAPSharedStateData_performMapFeaturesStateOperation___block_invoke;
  v7[3] = &unk_250DC06B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[GEOAPSharedStateData _performSyncStateUpdateWithIsolator:updateBlock:](self, "_performSyncStateUpdateWithIsolator:updateBlock:", mapFeaturesIso, v7);

}

uint64_t __57__GEOAPSharedStateData_performMapFeaturesStateOperation___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_resetTaskTimer");
  return result;
}

- (void)performMapUserSettingsStateOperation:(id)a3
{
  id v4;
  geo_isolater *mapUserSettingsIso;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  mapUserSettingsIso = self->_mapUserSettingsIso;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__GEOAPSharedStateData_performMapUserSettingsStateOperation___block_invoke;
  v7[3] = &unk_250DC06B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[GEOAPSharedStateData _performSyncStateUpdateWithIsolator:updateBlock:](self, "_performSyncStateUpdateWithIsolator:updateBlock:", mapUserSettingsIso, v7);

}

uint64_t __61__GEOAPSharedStateData_performMapUserSettingsStateOperation___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_resetTaskTimer");
  return result;
}

- (void)performRoutingSettingsStateOperation:(id)a3
{
  id v4;
  geo_isolater *routingSettingsIso;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  routingSettingsIso = self->_routingSettingsIso;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__GEOAPSharedStateData_performRoutingSettingsStateOperation___block_invoke;
  v7[3] = &unk_250DC06B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[GEOAPSharedStateData _performSyncStateUpdateWithIsolator:updateBlock:](self, "_performSyncStateUpdateWithIsolator:updateBlock:", routingSettingsIso, v7);

}

uint64_t __61__GEOAPSharedStateData_performRoutingSettingsStateOperation___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_resetTaskTimer");
  return result;
}

- (void)periodicSettingsHandler
{
  id v3;
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
  id v14;

  v3 = objc_alloc_init(MEMORY[0x24BE3CD08]);
  -[GEOAPSharedStateData stateMapSettings](self, "stateMapSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMapSettings:", v4);

  -[GEOAPSharedStateData stateMapUIShown](self, "stateMapUIShown");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMapUiShown:", v5);

  -[GEOAPSharedStateData stateMapsFeatures](self, "stateMapsFeatures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMapsFeatures:", v6);

  -[GEOAPSharedStateData stateMapsUserSettings](self, "stateMapsUserSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMapsUserSettings:", v7);

  -[GEOAPSharedStateData stateRoutingSettings](self, "stateRoutingSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRoutingSettings:", v8);

  +[GEOAPStateFactory sharedFactory](GEOAPStateFactory, "sharedFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stateForType:", 37);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeviceSettings:", v11);

  objc_msgSend(v3, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3CD08]), "initWithData:", v12);
  +[GEOAPServiceManager sharedManager](GEOAPServiceManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reportDailySettings:", v14);

}

- (void)populateSearchResultsForQuery:(id)a3 searchResultSpecifierBlock:(id)a4
{
  id v5;
  uint64_t (**v6)(id, unsigned int *, unsigned int *, uint64_t *, unsigned int *);
  id v7;
  void *v8;
  int v9;
  id v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  id v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;

  v5 = a3;
  v6 = (uint64_t (**)(id, unsigned int *, unsigned int *, uint64_t *, unsigned int *))a4;
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BE3CF08]);
    v8 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v7, "setSearchQuery:", v8);

    v18 = 0;
    v17 = 0;
    v16 = 0;
    v15 = 0;
    LOBYTE(v9) = 0;
    if (v6[2](v6, &v18, &v15, &v16, &v17))
    {
      v9 = 0;
      do
      {
        v10 = objc_alloc_init(MEMORY[0x24BE3D048]);
        objc_msgSend(v10, "setResultIndex:", v18);
        objc_msgSend(v10, "setBusinessId:", v16);
        objc_msgSend(v10, "setLocalSearchProviderId:", v17);
        v11 = v15 - 2;
        if (v15 == 1)
          v12 = 1;
        else
          v12 = v9;
        if (v11 >= 2)
          v13 = v15 == 1;
        else
          v13 = v15;
        if (v11 >= 2)
          v9 = v12;
        objc_msgSend(v10, "setResultType:", v13);
        objc_msgSend(v7, "addSearchResults:", v10);

        v18 = 0;
        v17 = 0;
        v16 = 0;
        v15 = 0;
      }
      while ((v6[2](v6, &v18, &v15, &v16, &v17) & 1) != 0);
    }
    objc_msgSend(v7, "setIncludesEnrichedResult:", v9 & 1);
    v14 = v7;
    geo_isolate_sync();

  }
}

uint64_t __81__GEOAPSharedStateData_populateSearchResultsForQuery_searchResultSpecifierBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSearchResultsState:", *(_QWORD *)(a1 + 40));
}

- (void)populateImpressionObjectId:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  objc_msgSend(a3, "getUUIDBytes:", &v10);
  v3 = objc_alloc_init(MEMORY[0x24BE3CE48]);
  v4 = objc_alloc_init(MEMORY[0x24BE3CC00]);
  objc_msgSend(v3, "setImpressionObjectId:", v4);

  v5 = v10;
  objc_msgSend(v3, "impressionObjectId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHigh:", v5);

  v7 = v11;
  objc_msgSend(v3, "impressionObjectId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLow:", v7);

  v9 = v3;
  geo_isolate_sync();

}

uint64_t __51__GEOAPSharedStateData_populateImpressionObjectId___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImpressionObjectState:", *(_QWORD *)(a1 + 40));
}

- (void)populateTapEventForPinType:(int)a3 tapEventSpecifierBlock:(id)a4
{
  uint64_t (**v5)(id, char *, unsigned int *, uint64_t *, uint64_t *, unsigned __int8 *);
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  unsigned __int8 v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (uint64_t (**)(id, char *, unsigned int *, uint64_t *, uint64_t *, unsigned __int8 *))a4;
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BE3CF20]);
    v13 = 0;
    v12 = 0;
    v11 = 0;
    v10 = 0;
    if (v5[2](v5, (char *)&v13 + 4, &v11, &v12, &v13, &v10))
    {
      do
      {
        v7 = objc_alloc_init(MEMORY[0x24BE3D048]);
        objc_msgSend(v7, "setResultIndex:", HIDWORD(v13));
        objc_msgSend(v7, "setBusinessId:", v12);
        objc_msgSend(v7, "setLocalSearchProviderId:", v13);
        objc_msgSend(v7, "setIsEnrichedItem:", v10);
        if (v11 - 1 >= 3)
          v8 = 0;
        else
          v8 = v11;
        objc_msgSend(v7, "setResultType:", v8);
        objc_msgSend(v6, "addSearchResults:", v7);

        v13 = 0;
        v12 = 0;
        v11 = 0;
        v10 = 0;
      }
      while ((v5[2](v5, (char *)&v13 + 4, &v11, &v12, &v13, &v10) & 1) != 0);
    }
    if ((a3 - 1) <= 3)
      objc_msgSend(v6, "setPinType:");
    v9 = v6;
    geo_isolate_sync();

  }
}

uint64_t __74__GEOAPSharedStateData_populateTapEventForPinType_tapEventSpecifierBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTapEventState:", *(_QWORD *)(a1 + 40));
}

- (void)populateTapEventForResultIndex:(unsigned int)a3 resultType:(int)a4 businessId:(unint64_t)a5 localSearchProviderId:(unsigned int)a6 isEnrichedItem:(BOOL)a7
{
  geo_isolate_sync();
}

void __114__GEOAPSharedStateData_populateTapEventForResultIndex_resultType_businessId_localSearchProviderId_isEnrichedItem___block_invoke(uint64_t a1)
{
  id v2;
  unsigned int v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x24BE3CF20]);
  v2 = objc_alloc_init(MEMORY[0x24BE3D048]);
  objc_msgSend(v2, "setResultIndex:", *(unsigned int *)(a1 + 48));
  objc_msgSend(v2, "setBusinessId:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setLocalSearchProviderId:", *(unsigned int *)(a1 + 52));
  objc_msgSend(v2, "setIsEnrichedItem:", *(unsigned __int8 *)(a1 + 60));
  v3 = *(_DWORD *)(a1 + 56);
  if (v3 - 1 >= 3)
    v4 = 0;
  else
    v4 = v3;
  objc_msgSend(v2, "setResultType:", v4);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSearchResults:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setTapEventState:", v6);
}

- (void)populateActionButtonDetails:(id)a3
{
  uint64_t (**v3)(id, id *, id *, int *, unsigned __int8 *);
  id v4;
  int v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  unsigned __int8 v16;
  int v17;

  v3 = (uint64_t (**)(id, id *, id *, int *, unsigned __int8 *))a3;
  v4 = objc_alloc_init(MEMORY[0x24BE3CDF0]);
  while (1)
  {
    v17 = 0;
    v16 = 0;
    v14 = 0;
    v15 = 0;
    v5 = v3[2](v3, &v15, &v14, &v17, &v16);
    v6 = v15;
    v7 = v14;
    v8 = v7;
    if (!v5)
      break;
    v9 = objc_alloc_init(MEMORY[0x24BE3CB60]);
    v10 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v9, "setCategory:", v10);

    v11 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v9, "setProviderId:", v11);

    if (v17 == 1)
      v12 = 1;
    else
      v12 = 2 * (v17 == 2);
    objc_msgSend(v9, "setLinkType:", v12);
    objc_msgSend(v9, "setDropDown:", v16);
    objc_msgSend(v4, "addActionButtonDetails:", v9);

  }
  v13 = v4;
  geo_isolate_sync();

}

uint64_t __52__GEOAPSharedStateData_populateActionButtonDetails___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActionButtonDetailsState:", *(_QWORD *)(a1 + 40));
}

- (void)populatePhotoSubmissionDetailsWithEntryPoint:(int)a3 numberOfPhotos:(unsigned int)a4 numberOfARPSuggestedPhotos:(unsigned int)a5 originTarget:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_class *v9;
  id v10;
  id v11;
  id v12;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v9 = (objc_class *)MEMORY[0x24BE3CDD0];
  v10 = a6;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v11, "setOriginTarget:", v10);

  switch(a3)
  {
    case 2:
      objc_msgSend(v11, "setIsPlacecardInlineSubmission:", 1);
      break;
    case 1:
      objc_msgSend(v11, "setIsFromMapsSuggesions:", 1);
      break;
    case 0:
      objc_msgSend(v11, "setIsFromRecommendationCard:", 1);
      break;
  }
  objc_msgSend(v11, "setNumberOfPhotos:", v7);
  objc_msgSend(v11, "setNumberOfAprSuggestedPhotos:", v6);
  v12 = v11;
  geo_isolate_sync();

}

uint64_t __124__GEOAPSharedStateData_populatePhotoSubmissionDetailsWithEntryPoint_numberOfPhotos_numberOfARPSuggestedPhotos_originTarget___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPhotoSubmissionDetailsState:", *(_QWORD *)(a1 + 40));
}

- (void)populateRatingSubmissionDetailsWithEntryPoint:(int)a3 originTarget:(id)a4 specifierBlock:(id)a5
{
  id v7;
  uint64_t (**v8)(id, id *, _BYTE *);
  id v9;
  int v10;
  id v11;
  id v12;
  id v13;
  id v14;
  unsigned __int8 v15;

  v7 = a4;
  v8 = (uint64_t (**)(id, id *, _BYTE *))a5;
  v9 = objc_alloc_init(MEMORY[0x24BE3CDE0]);
  objc_msgSend(v9, "setOriginTarget:", v7);
  switch(a3)
  {
    case 2:
      objc_msgSend(v9, "setIsPlacecardInlineSubmission:", 1);
      break;
    case 1:
      objc_msgSend(v9, "setIsFromMapsSuggesions:", 1);
      break;
    case 0:
      objc_msgSend(v9, "setIsFromRecommendationCard:", 1);
      break;
  }
  v15 = 0;
  v14 = 0;
  v10 = v8[2](v8, &v14, &v15);
  v11 = v14;
  if (v10)
  {
    do
    {
      v12 = objc_alloc_init(MEMORY[0x24BE3CB58]);
      objc_msgSend(v12, "setRating:", v15);
      objc_msgSend(v12, "setDisplayedText:", v11);
      objc_msgSend(v9, "addRatings:", v12);

      v15 = 0;
      v14 = 0;
      LOBYTE(v12) = v8[2](v8, &v14, &v15);
      v11 = v14;
    }
    while ((v12 & 1) != 0);
  }

  v13 = v9;
  geo_isolate_sync();

}

uint64_t __98__GEOAPSharedStateData_populateRatingSubmissionDetailsWithEntryPoint_originTarget_specifierBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRatingSubmissionDetailsState:", *(_QWORD *)(a1 + 40));
}

- (void)populateRatingPhotoSubmissionDetailsWithEntryPoint:(int)a3 originTarget:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x24BE3CDD8];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setOriginTarget:", v6);

  switch(a3)
  {
    case 2:
      objc_msgSend(v7, "setIsPlacecardInlineSubmission:", 1);
      break;
    case 1:
      objc_msgSend(v7, "setIsFromMapsSuggesions:", 1);
      break;
    case 0:
      objc_msgSend(v7, "setIsFromRecommendationCard:", 1);
      break;
  }
  v8 = v7;
  geo_isolate_sync();

}

uint64_t __88__GEOAPSharedStateData_populateRatingPhotoSubmissionDetailsWithEntryPoint_originTarget___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRatingPhotoSubmissionDetailsState:", *(_QWORD *)(a1 + 40));
}

- (id)stateMapSettings
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x24BE3CE68]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__GEOAPSharedStateData_stateMapSettings__block_invoke;
  v8[3] = &unk_250DC62F0;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

uint64_t __40__GEOAPSharedStateData_stateMapSettings__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsNavVolume"))
    objc_msgSend(*(id *)(a1 + 40), "setNavVoiceVolume:", objc_msgSend(*(id *)(a1 + 32), "navVoiceVolumeAsGEONavVoiceVolume"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsTransportMode"))
    objc_msgSend(*(id *)(a1 + 40), "setPreferredTransportMode:", objc_msgSend(*(id *)(a1 + 32), "transportModeAsGEOTransportMode"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsAvoidHighways"))
    objc_msgSend(*(id *)(a1 + 40), "setAvoidHighways:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsAvoidHighways"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsAvoidTolls"))
    objc_msgSend(*(id *)(a1 + 40), "setAvoidTolls:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsAvoidTolls"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsFindMyCarEnabled"))
    objc_msgSend(*(id *)(a1 + 40), "setFindMyCarEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsFindMyCarEnabled"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsHeadingEnabled"))
    objc_msgSend(*(id *)(a1 + 40), "setHeadingEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsHeadingEnabled"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsLabelEnabled"))
    objc_msgSend(*(id *)(a1 + 40), "setLabelEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsLabelEnabled"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsPauseSpokenAudioEnabled"))
    objc_msgSend(*(id *)(a1 + 40), "setPauseSpokenAudioEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsPauseSpokenAudioEnabled"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsSpeedLimitEnabled"))
    objc_msgSend(*(id *)(a1 + 40), "setSpeedLimitEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsSpeedLimitEnabled"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsTrafficEnabled"))
    objc_msgSend(*(id *)(a1 + 40), "setTrafficEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsTrafficEnabled"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsAvoidHills"))
    objc_msgSend(*(id *)(a1 + 40), "setBikingAvoidHills:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsAvoidHills"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsAvoidStairs"))
    objc_msgSend(*(id *)(a1 + 40), "setBikingAvoidStairs:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsAvoidStairs"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsAvoidBusyRoads"))
    objc_msgSend(*(id *)(a1 + 40), "setBikingAvoidBusyRoads:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsAvoidBusyRoads"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsEBike"))
    objc_msgSend(*(id *)(a1 + 40), "setEBike:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsEBike"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsLocationPrecisionType"))
    objc_msgSend(*(id *)(a1 + 40), "setLocationType:", objc_msgSend(*(id *)(a1 + 32), "locationPrecisionTypeAsGEOSettingsLocationType"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsDrivingVoiceSettings"))
    objc_msgSend(*(id *)(a1 + 40), "setDrivingVoiceSettings:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsDrivingVoiceSettings"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsWalkingVoiceSettings"))
    objc_msgSend(*(id *)(a1 + 40), "setWalkingVoiceSettings:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsWalkingVoiceSettings"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsCyclingVoiceSettings"))
    objc_msgSend(*(id *)(a1 + 40), "setCyclingVoiceSettings:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsCyclingVoiceSettings"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsIsHandsFreeProfileEnabled"))
    objc_msgSend(*(id *)(a1 + 40), "setHFPEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsIsHandsFreeProfileEnabled"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsWalkingAvoidHills"))
    objc_msgSend(*(id *)(a1 + 40), "setWalkingAvoidHills:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsWalkingAvoidHills"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsWalkingAvoidStairs"))
    objc_msgSend(*(id *)(a1 + 40), "setWalkingAvoidStairs:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsWalkingAvoidStairs"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsWalkingAvoidBusyRoads"))
    objc_msgSend(*(id *)(a1 + 40), "setWalkingAvoidBusyRoads:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsWalkingAvoidBusyRoads"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsDirectionsWakeDevice"))
    objc_msgSend(*(id *)(a1 + 40), "setDirectionsWakeDevice:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsDirectionsWakeDevice"));
  return 0;
}

- (id)stateMapSettingsShort
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x24BE3CE68]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__GEOAPSharedStateData_stateMapSettingsShort__block_invoke;
  v8[3] = &unk_250DC62F0;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[GEOAPSharedStateData performMapSettingsStateOperation:](self, "performMapSettingsStateOperation:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

uint64_t __45__GEOAPSharedStateData_stateMapSettingsShort__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsNavVolume"))
    objc_msgSend(*(id *)(a1 + 40), "setNavVoiceVolume:", objc_msgSend(*(id *)(a1 + 32), "navVoiceVolumeAsGEONavVoiceVolume"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsTransportMode"))
    objc_msgSend(*(id *)(a1 + 40), "setPreferredTransportMode:", objc_msgSend(*(id *)(a1 + 32), "transportModeAsGEOTransportMode"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsHeadingEnabled"))
    objc_msgSend(*(id *)(a1 + 40), "setHeadingEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsHeadingEnabled"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsLabelEnabled"))
    objc_msgSend(*(id *)(a1 + 40), "setLabelEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsLabelEnabled"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsPauseSpokenAudioEnabled"))
    objc_msgSend(*(id *)(a1 + 40), "setPauseSpokenAudioEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsPauseSpokenAudioEnabled"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsSpeedLimitEnabled"))
    objc_msgSend(*(id *)(a1 + 40), "setSpeedLimitEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsSpeedLimitEnabled"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsTrafficEnabled"))
    objc_msgSend(*(id *)(a1 + 40), "setTrafficEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsTrafficEnabled"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsLocationPrecisionType"))
    objc_msgSend(*(id *)(a1 + 40), "setLocationType:", objc_msgSend(*(id *)(a1 + 32), "locationPrecisionTypeAsGEOSettingsLocationType"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsDrivingVoiceSettings"))
    objc_msgSend(*(id *)(a1 + 40), "setDrivingVoiceSettings:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsDrivingVoiceSettings"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsWalkingVoiceSettings"))
    objc_msgSend(*(id *)(a1 + 40), "setWalkingVoiceSettings:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsWalkingVoiceSettings"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsCyclingVoiceSettings"))
    objc_msgSend(*(id *)(a1 + 40), "setCyclingVoiceSettings:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsCyclingVoiceSettings"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsIsHandsFreeProfileEnabled"))
    objc_msgSend(*(id *)(a1 + 40), "setHFPEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsIsHandsFreeProfileEnabled"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsDirectionsWakeDevice"))
    objc_msgSend(*(id *)(a1 + 40), "setDirectionsWakeDevice:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsDirectionsWakeDevice"));
  return 0;
}

- (id)stateMapUIShown
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x24BE3CE78]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__GEOAPSharedStateData_stateMapUIShown__block_invoke;
  v8[3] = &unk_250DC62F0;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[GEOAPSharedStateData performMapUIShownStateOperation:](self, "performMapUIShownStateOperation:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

uint64_t __39__GEOAPSharedStateData_stateMapUIShown__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapUiShownAqiShown"))
    objc_msgSend(*(id *)(a1 + 40), "setIsAirQualityShown:", objc_msgSend(*(id *)(a1 + 32), "mapUiShownAqiShown"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapUiShownWeatherShown"))
    objc_msgSend(*(id *)(a1 + 40), "setIsWeatherShown:", objc_msgSend(*(id *)(a1 + 32), "mapUiShownWeatherShown"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasVenueExperienceShown"))
    objc_msgSend(*(id *)(a1 + 40), "setIsVenueExperienceShown:", objc_msgSend(*(id *)(a1 + 32), "venueExperienceShown"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapUiShownActiveNavMode"))
    objc_msgSend(*(id *)(a1 + 40), "setActiveNavMode:", objc_msgSend(*(id *)(a1 + 32), "activeNavModeAsGEOTransportType"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasLookAroundEntryIconShown"))
    objc_msgSend(*(id *)(a1 + 40), "setIsLookAroundEntryIconShown:", objc_msgSend(*(id *)(a1 + 32), "lookAroundEntryIconShown"));
  return 0;
}

- (id)stateMapsFeatures
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x24BE3CE90]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__GEOAPSharedStateData_stateMapsFeatures__block_invoke;
  v8[3] = &unk_250DC62F0;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[GEOAPSharedStateData performMapFeaturesStateOperation:](self, "performMapFeaturesStateOperation:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

uint64_t __41__GEOAPSharedStateData_stateMapsFeatures__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapFeaturePersonalCollectionsCount"))
    objc_msgSend(*(id *)(a1 + 40), "setPersonalCollectionsCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeaturePersonalCollectionsCount"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapFeatureSavedCollectionsCount"))
    objc_msgSend(*(id *)(a1 + 40), "setSavedCollectionsCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureSavedCollectionsCount"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapFeatureSubmittedRatingsCount"))
    objc_msgSend(*(id *)(a1 + 40), "setSubmittedRatingsCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureSubmittedRatingsCount"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapFeatureSubmittedPhotosCount"))
    objc_msgSend(*(id *)(a1 + 40), "setSubmittedPhotosCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureSubmittedPhotosCount"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapFeatureIsHomeFavoriteSet"))
    objc_msgSend(*(id *)(a1 + 40), "setHomeFavoriteSet:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureIsHomeFavoriteSet"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapFeatureIsWorkFavoriteSet"))
    objc_msgSend(*(id *)(a1 + 40), "setWorkFavoriteSet:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureIsWorkFavoriteSet"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapFeatureIsSchoolFavoriteSet"))
    objc_msgSend(*(id *)(a1 + 40), "setSchoolFavoriteSet:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureIsSchoolFavoriteSet"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapFeatureIsTransitFavoriteSet"))
    objc_msgSend(*(id *)(a1 + 40), "setTransitFavoriteSet:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureIsTransitFavoriteSet"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapFeatureFavoritesCount"))
    objc_msgSend(*(id *)(a1 + 40), "setFavoritesCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureFavoritesCount"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapFeatureLibrarySavedPlacesCount"))
    objc_msgSend(*(id *)(a1 + 40), "setLibrarySavedPlacesCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureLibrarySavedPlacesCount"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapFeatureLibraryPlacesWithNoteCount"))
    objc_msgSend(*(id *)(a1 + 40), "setLibraryPlacesWithNoteCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureLibraryPlacesWithNoteCount"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapFeatureLibraryGuidesSavedPlacesCount"))
    objc_msgSend(*(id *)(a1 + 40), "setLibraryGuidesSavedPlacesCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureLibraryGuidesSavedPlacesCount"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapFeatureLibraryFavoritesGuideSavedPlacesCount"))
    objc_msgSend(*(id *)(a1 + 40), "setLibraryFavoritesGuideSavedPlacesCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureLibraryFavoritesGuideSavedPlacesCount"));
  return 0;
}

- (id)stateMapsUserSettings
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x24BE3CEA8]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__GEOAPSharedStateData_stateMapsUserSettings__block_invoke;
  v8[3] = &unk_250DC62F0;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[GEOAPSharedStateData performMapUserSettingsStateOperation:](self, "performMapUserSettingsStateOperation:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

uint64_t __45__GEOAPSharedStateData_stateMapsUserSettings__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "hasSuggestionsSiriEnabled"))
    objc_msgSend(*(id *)(a1 + 40), "setSiriSuggestionsEnabled:", objc_msgSend(*(id *)(a1 + 32), "suggestionsSiriEnabled"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapSettingsNotificationsEnabled"))
    objc_msgSend(*(id *)(a1 + 40), "setNotificationsEnabled:", objc_msgSend(*(id *)(a1 + 32), "mapSettingsNotificationsEnabled"));
  objc_msgSend(*(id *)(a1 + 40), "setIsOptedInToVlCrowdsourcing:", GEOConfigGetBOOL());
  return 0;
}

- (id)stateRoutingSettings
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x24BE3CEF8]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__GEOAPSharedStateData_stateRoutingSettings__block_invoke;
  v8[3] = &unk_250DC62F0;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[GEOAPSharedStateData performRoutingSettingsStateOperation:](self, "performRoutingSettingsStateOperation:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

uint64_t __44__GEOAPSharedStateData_stateRoutingSettings__block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BE3D038]);
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapFeatureElectronicVehicleCount"))
    objc_msgSend(v2, "setElectronicVehicleCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureElectronicVehicleCount"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapFeatureLicensePlateCount"))
    objc_msgSend(v2, "setLicensePlateCount:", objc_msgSend(*(id *)(a1 + 32), "mapFeatureLicensePlateCount"));
  if (objc_msgSend(v2, "electronicVehicleCount") || objc_msgSend(v2, "licensePlateCount"))
    objc_msgSend(*(id *)(a1 + 40), "setVirtualGarageSettings:", v2);

  return 0;
}

- (id)stateSearchResults
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__2;
  v8 = __Block_byref_object_dispose__2;
  v9 = 0;
  geo_isolate_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __42__GEOAPSharedStateData_stateSearchResults__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "searchResultsState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)stateImpressionObject
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__2;
  v8 = __Block_byref_object_dispose__2;
  v9 = 0;
  geo_isolate_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __45__GEOAPSharedStateData_stateImpressionObject__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "impressionObjectState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)stateTapEvents
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__2;
  v8 = __Block_byref_object_dispose__2;
  v9 = 0;
  geo_isolate_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __38__GEOAPSharedStateData_stateTapEvents__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "tapEventState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_hasActualUserHomeMetro
{
  void *v2;
  int v3;

  if (_GEOConfigHasValue())
  {
    GEOConfigGetString();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(&unk_250DE02E8, "containsObject:", v2) ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_hasActualUserHomeCountry
{
  void *v2;
  int v3;

  if (_GEOConfigHasValue())
  {
    GEOConfigGetString();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(&unk_250DE02E8, "containsObject:", v2) ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_hasActualFallbackData
{
  void *v2;
  int v3;
  void *v4;

  if (_GEOConfigHasValue() && _GEOConfigHasValue())
  {
    GEOConfigGetString();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(&unk_250DE02E8, "containsObject:", v2) & 1) != 0)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      GEOConfigGetString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(&unk_250DE02E8, "containsObject:", v4) ^ 1;

    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)bestUserHomeLocation:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  void (**v6)(id, __CFString *, __CFString *);

  v6 = (void (**)(id, __CFString *, __CFString *))a3;
  if (-[GEOAPSharedStateData _hasActualUserHomeCountry](self, "_hasActualUserHomeCountry")
    && -[GEOAPSharedStateData _hasActualUserHomeMetro](self, "_hasActualUserHomeMetro")
    || _GEOConfigHasValue() && (_GEOConfigHasValue() & 1) != 0
    || _GEOConfigHasValue() && _GEOConfigHasValue())
  {
    GEOConfigGetString();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    GEOConfigGetString();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("UNKNOWN");
    v5 = CFSTR("UNKNOWN");
  }
  v6[2](v6, v4, v5);

}

- (id)bestCurrentMetro
{
  __CFString *v2;

  if (_GEOConfigHasValue())
  {
    GEOConfigGetString();
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = CFSTR("UNKNOWN");
  }
  return v2;
}

- (id)_metroForLatLng:(id)a3 inCountry:(id)a4 filterWithAllowList:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  GEOMetroRegionLookup *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  __CFString *v21;
  NSObject *v22;
  int v24;
  NSObject *v25;
  uint64_t v26;

  v5 = a5;
  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  +[GEOMetroRegionAssetProvider sharedProvider](GEOMetroRegionAssetProvider, "sharedProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
  {
    objc_msgSend(v9, "urlForInstalledCountryCode:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_alloc_init(GEOMetroRegionLookup);
      -[GEOMetroRegionLookup lookupRegionWithLocation:countryCodeHint:](v12, "lookupRegionWithLocation:countryCodeHint:", v7, v8);
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        GEOFindOrCreateLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v24 = 138477827;
          v25 = v7;
          _os_log_impl(&dword_23CBB4000, v22, OS_LOG_TYPE_DEBUG, "no metro region region at %{private}@", (uint8_t *)&v24, 0xCu);
        }

        v21 = CFSTR("OTHER");
        goto LABEL_31;
      }
      if (!v5)
        goto LABEL_14;
      GEOFindOrCreateLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v24 = 138477827;
        v25 = v13;
        _os_log_impl(&dword_23CBB4000, v14, OS_LOG_TYPE_DEBUG, "will apply allow list filtering to %{private}@", (uint8_t *)&v24, 0xCu);
      }

      objc_msgSend(v10, "homeMetroAcceptListForCountryCode:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v17 = objc_msgSend(v15, "containsObject:", v13);
        GEOFindOrCreateLog();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
        if (v17)
        {
          if (v19)
          {
            v24 = 138477827;
            v25 = v13;
            _os_log_impl(&dword_23CBB4000, v18, OS_LOG_TYPE_DEBUG, "metros %{private}@ is allowed", (uint8_t *)&v24, 0xCu);
          }

          GEOFindOrCreateLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v24 = 138477827;
            v25 = v13;
            _os_log_impl(&dword_23CBB4000, v20, OS_LOG_TYPE_DEBUG, "using metro %{private}@", (uint8_t *)&v24, 0xCu);
          }

LABEL_14:
          v21 = v13;
LABEL_31:

          goto LABEL_32;
        }
        if (v19)
        {
          v24 = 138477827;
          v25 = v13;
          _os_log_impl(&dword_23CBB4000, v18, OS_LOG_TYPE_DEBUG, "metros %{private}@ is not allowed", (uint8_t *)&v24, 0xCu);
        }
        v21 = CFSTR("OTHER");
      }
      else
      {
        GEOFindOrCreateLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v24 = 138477827;
          v25 = v8;
          _os_log_impl(&dword_23CBB4000, v18, OS_LOG_TYPE_DEBUG, "no metro allow list for %{private}@", (uint8_t *)&v24, 0xCu);
        }
        v21 = CFSTR("MISSING_ALLOW_LIST");
      }

      goto LABEL_31;
    }
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v24 = 138477827;
      v25 = v8;
      _os_log_impl(&dword_23CBB4000, v13, OS_LOG_TYPE_DEBUG, "metro regions for %{private}@ are unavailable", (uint8_t *)&v24, 0xCu);
    }
    v21 = CFSTR("MISSING_REGIONS");
  }
  else
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_23CBB4000, v13, OS_LOG_TYPE_DEBUG, "no metro lat/lng provided", (uint8_t *)&v24, 2u);
    }
    v21 = CFSTR("MISSING_LOCATION");
  }
LABEL_32:

  return v21;
}

- (id)_filteredHomeCountry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  __CFString *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[GEOMetroRegionAssetProvider sharedProvider](GEOMetroRegionAssetProvider, "sharedProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeCountryCodeAcceptList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "containsObject:", v3);
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if ((v6 & 1) != 0)
    {
      if (v8)
      {
        v12 = 138477827;
        v13 = v3;
        _os_log_impl(&dword_23CBB4000, v7, OS_LOG_TYPE_DEBUG, "MeCountry is %{private}@", (uint8_t *)&v12, 0xCu);
      }

      v9 = (__CFString *)v3;
    }
    else
    {
      if (v8)
      {
        v12 = 138477827;
        v13 = v3;
        _os_log_impl(&dword_23CBB4000, v7, OS_LOG_TYPE_DEBUG, "%{private}@ is not on the allow list", (uint8_t *)&v12, 0xCu);
      }

      v9 = CFSTR("OTHER");
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_23CBB4000, v10, OS_LOG_TYPE_DEBUG, "no home countryCode list is available", (uint8_t *)&v12, 2u);
    }

    v9 = CFSTR("MISSING_ALLOW_LIST");
  }

  return v9;
}

- (void)setCurrentMetro:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138477827;
    v15 = v4;
    _os_log_impl(&dword_23CBB4000, v5, OS_LOG_TYPE_DEBUG, "updating current metro at %{private}@", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE3CBB8], "sharedConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "countryCode");
  v7 = objc_claimAutoreleasedReturnValue();

  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138477827;
    v15 = v7;
    _os_log_impl(&dword_23CBB4000, v8, OS_LOG_TYPE_DEBUG, "using countryCode %{private}@", (uint8_t *)&v14, 0xCu);
  }

  -[GEOAPSharedStateData _metroForLatLng:inCountry:filterWithAllowList:](self, "_metroForLatLng:inCountry:filterWithAllowList:", v4, v7, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  GEOFindOrCreateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138477827;
    v15 = v9;
    _os_log_impl(&dword_23CBB4000, v10, OS_LOG_TYPE_DEBUG, "current metro is %{private}@", (uint8_t *)&v14, 0xCu);
  }

  if (v9)
    GEOConfigSetString();
  else
    _GEOConfigRemoveValue();
  if ((GEOConfigGetBOOL() & 1) == 0 && -[GEOAPSharedStateData _hasActualFallbackData](self, "_hasActualFallbackData"))
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_23CBB4000, v11, OS_LOG_TYPE_DEBUG, "fallback metro is already set", (uint8_t *)&v14, 2u);
    }
    goto LABEL_22;
  }
  -[GEOAPSharedStateData _metroForLatLng:inCountry:filterWithAllowList:](self, "_metroForLatLng:inCountry:filterWithAllowList:", v4, v7, 1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    _GEOConfigRemoveValue();
    if (v7)
      goto LABEL_16;
LABEL_18:
    _GEOConfigRemoveValue();
    goto LABEL_19;
  }
  GEOConfigSetString();
  if (!v7)
    goto LABEL_18;
LABEL_16:
  -[GEOAPSharedStateData _filteredHomeCountry:](self, "_filteredHomeCountry:", v7);
  v12 = objc_claimAutoreleasedReturnValue();

  GEOConfigSetString();
  v7 = v12;
LABEL_19:
  GEOConfigSetBOOL();
  GEOFindOrCreateLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138478083;
    v15 = v11;
    v16 = 2113;
    v17 = v7;
    _os_log_impl(&dword_23CBB4000, v13, OS_LOG_TYPE_DEBUG, "setting fallback metro to %{private}@, country to %{private}@", (uint8_t *)&v14, 0x16u);
  }

LABEL_22:
}

- (void)setMeCardHomeCountry:(id)a3 andHomeLocation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138478083;
    v15 = v6;
    v16 = 2113;
    v17 = v7;
    _os_log_impl(&dword_23CBB4000, v8, OS_LOG_TYPE_DEBUG, "setting meCard country with %{private}@, %{private}@", (uint8_t *)&v14, 0x16u);
  }

  if (v6)
  {
    -[GEOAPSharedStateData _filteredHomeCountry:](self, "_filteredHomeCountry:", v6);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3CBB8], "sharedConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "countryCode");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138477827;
      v15 = v6;
      _os_log_impl(&dword_23CBB4000, v11, OS_LOG_TYPE_DEBUG, "no countryCode provided; using countryCode %{private}@",
        (uint8_t *)&v14,
        0xCu);
    }

    v9 = CFSTR("UNKNOWN");
  }
  -[GEOAPSharedStateData _metroForLatLng:inCountry:filterWithAllowList:](self, "_metroForLatLng:inCountry:filterWithAllowList:", v7, v6, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  GEOFindOrCreateLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138477827;
    v15 = v12;
    _os_log_impl(&dword_23CBB4000, v13, OS_LOG_TYPE_DEBUG, "MeMetro is %{private}@", (uint8_t *)&v14, 0xCu);
  }

  GEOConfigSetString();
  GEOConfigSetString();

}

- (BOOL)_isHandoff
{
  return -[GEOAnalyticsPipelineStateData hasMapLaunchIsHandoff](self, "hasMapLaunchIsHandoff")
      && -[GEOAnalyticsPipelineStateData hasMapLaunchSourceHandoffDevice](self, "hasMapLaunchSourceHandoffDevice")
      && -[GEOAnalyticsPipelineStateData mapLaunchIsHandoff](self, "mapLaunchIsHandoff");
}

- (BOOL)_isHandoffFromDeviceType:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (-[GEOAPSharedStateData _isHandoff](self, "_isHandoff"))
  {
    -[GEOAnalyticsPipelineStateData mapLaunchSourceHandoffDevice](self, "mapLaunchSourceHandoffDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasPrefix:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isIPadHandoff
{
  return -[GEOAPSharedStateData _isHandoffFromDeviceType:](self, "_isHandoffFromDeviceType:", CFSTR("iPad"));
}

- (BOOL)isIPhoneHandoff
{
  return -[GEOAPSharedStateData _isHandoffFromDeviceType:](self, "_isHandoffFromDeviceType:", CFSTR("iPhone"));
}

- (BOOL)isWatchHandoff
{
  return -[GEOAPSharedStateData _isHandoffFromDeviceType:](self, "_isHandoffFromDeviceType:", CFSTR("Watch"));
}

- (BOOL)isMacHandoff
{
  _BOOL4 v3;

  v3 = -[GEOAPSharedStateData _isHandoff](self, "_isHandoff");
  if (v3)
  {
    if (-[GEOAPSharedStateData isIPadHandoff](self, "isIPadHandoff")
      || -[GEOAPSharedStateData isIPadHandoff](self, "isIPadHandoff"))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = !-[GEOAPSharedStateData isWatchHandoff](self, "isWatchHandoff");
    }
  }
  return v3;
}

- (void)setMapViewViewMode:(int)a3
{
  uint64_t v3;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v3 = *(_QWORD *)&a3;
  v5 = -[GEOAnalyticsPipelineStateData mapViewViewMode](self, "mapViewViewMode");
  v9.receiver = self;
  v9.super_class = (Class)GEOAPSharedStateData;
  -[GEOAnalyticsPipelineStateData setMapViewViewMode:](&v9, sel_setMapViewViewMode_, v3);
  if (v5 != (_DWORD)v3)
  {
    v6 = v3 - 1;
    if ((v3 - 1) <= 7 && ((0x8Fu >> v6) & 1) != 0)
    {
      v7 = dword_23CC49E10[v6];
      +[GEOAPServiceManager sharedManager](GEOAPServiceManager, "sharedManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reportDailyUsageCountType:usageString:usageBool:appId:completion:", v7, 0, 0, 0, 0);

    }
  }
}

- (BOOL)hasShowcase
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  geo_reentrant_isolate_sync();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __35__GEOAPSharedStateData_hasShowcase__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "placeCardState", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "type") == 40)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (BOOL)shouldCountAsEnrichmentResult
{
  void *v3;
  BOOL v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__GEOAPSharedStateData_shouldCountAsEnrichmentResult__block_invoke;
  v6[3] = &unk_250DC6390;
  v6[4] = &v7;
  -[GEOAPSharedStateData bestUserHomeLocation:](self, "bestUserHomeLocation:", v6);
  -[GEOAnalyticsPipelineStateData searchResultsState](self, "searchResultsState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "includesEnrichedResult"))
    v4 = *((_BYTE *)v8 + 24) != 0;
  else
    v4 = 0;

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __53__GEOAPSharedStateData_shouldCountAsEnrichmentResult__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  id v5;

  v3 = a2;
  GEOConfigGetArray();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "containsObject:", v3);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
}

- (BOOL)_isPunchInAppIdInList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[GEOAnalyticsPipelineStateData hasMapLaunchSourceAppId](self, "hasMapLaunchSourceAppId"))
  {
    -[GEOAnalyticsPipelineStateData mapLaunchSourceAppId](self, "mapLaunchSourceAppId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "lowercaseString", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v6);

          if ((v12 & 1) != 0)
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)isSiriPunchIn
{
  void *v3;

  GEOConfigGetArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[GEOAPSharedStateData _isPunchInAppIdInList:](self, "_isPunchInAppIdInList:", v3);

  return (char)self;
}

- (BOOL)isSafariPunchIn
{
  void *v3;

  GEOConfigGetArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[GEOAPSharedStateData _isPunchInAppIdInList:](self, "_isPunchInAppIdInList:", v3);

  return (char)self;
}

- (BOOL)isSpotlightPunchIn
{
  void *v3;

  GEOConfigGetArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[GEOAPSharedStateData _isPunchInAppIdInList:](self, "_isPunchInAppIdInList:", v3);

  return (char)self;
}

- (BOOL)isSMSPunchIn
{
  void *v3;

  GEOConfigGetArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[GEOAPSharedStateData _isPunchInAppIdInList:](self, "_isPunchInAppIdInList:", v3);

  return (char)self;
}

- (BOOL)isFindMyPunchIn
{
  void *v3;

  GEOConfigGetArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[GEOAPSharedStateData _isPunchInAppIdInList:](self, "_isPunchInAppIdInList:", v3);

  return (char)self;
}

- (BOOL)isOther2ndPartyPunchIn
{
  void *v4;
  void *v5;

  if (!-[GEOAnalyticsPipelineStateData hasMapLaunchSourceAppId](self, "hasMapLaunchSourceAppId")
    || -[GEOAPSharedStateData isSiriPunchIn](self, "isSiriPunchIn")
    || -[GEOAPSharedStateData isSafariPunchIn](self, "isSafariPunchIn")
    || -[GEOAPSharedStateData isSpotlightPunchIn](self, "isSpotlightPunchIn")
    || -[GEOAPSharedStateData isSMSPunchIn](self, "isSMSPunchIn")
    || -[GEOAPSharedStateData isFindMyPunchIn](self, "isFindMyPunchIn"))
  {
    return 0;
  }
  -[GEOAnalyticsPipelineStateData mapLaunchSourceAppId](self, "mapLaunchSourceAppId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple"));
  return (char)v4;
}

- (BOOL)is3rdPartyPunchIn
{
  _BOOL4 v3;

  v3 = -[GEOAnalyticsPipelineStateData hasMapLaunchSourceAppId](self, "hasMapLaunchSourceAppId");
  if (v3)
  {
    if (-[GEOAPSharedStateData isSiriPunchIn](self, "isSiriPunchIn")
      || -[GEOAPSharedStateData isSafariPunchIn](self, "isSafariPunchIn")
      || -[GEOAPSharedStateData isSpotlightPunchIn](self, "isSpotlightPunchIn")
      || -[GEOAPSharedStateData isSMSPunchIn](self, "isSMSPunchIn")
      || -[GEOAPSharedStateData isFindMyPunchIn](self, "isFindMyPunchIn"))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = !-[GEOAPSharedStateData isOther2ndPartyPunchIn](self, "isOther2ndPartyPunchIn");
    }
  }
  return v3;
}

- (void)populatePlaceIdsWithSpecifierBlock:(id)a3
{
  uint64_t (**v3)(id, char *, uint64_t *, uint64_t *, uint64_t *);
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (uint64_t (**)(id, char *, uint64_t *, uint64_t *, uint64_t *))a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BE3CE98]);
    v9 = 0;
    v7 = 0;
    v8 = 0;
    if (v3[2](v3, (char *)&v9 + 4, &v7, &v8, &v9))
    {
      do
      {
        v5 = objc_alloc_init(MEMORY[0x24BE3CFD0]);
        objc_msgSend(v5, "setResultIndex:", HIDWORD(v9));
        objc_msgSend(v5, "setBusinessId:", v8);
        objc_msgSend(v5, "setBasemapId:", v7);
        objc_msgSend(v5, "setLocalSearchProviderId:", v9);
        objc_msgSend(v4, "addPlaceIdDetails:", v5);

        v9 = 0;
        v7 = 0;
        v8 = 0;
      }
      while ((v3[2](v3, (char *)&v9 + 4, &v7, &v8, &v9) & 1) != 0);
    }
    v6 = v4;
    geo_isolate_sync();

  }
}

uint64_t __59__GEOAPSharedStateData_populatePlaceIdsWithSpecifierBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMapsPlaceIdsState:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicSettingsTimer, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_placeMapsIdIso, 0);
  objc_storeStrong((id *)&self->_ratingPhotoSubmissionStateIso, 0);
  objc_storeStrong((id *)&self->_ratingSubmissionStateIso, 0);
  objc_storeStrong((id *)&self->_photoSubmissionStateIso, 0);
  objc_storeStrong((id *)&self->_actionButtonDetailsStateIso, 0);
  objc_storeStrong((id *)&self->_tapEventStateIso, 0);
  objc_storeStrong((id *)&self->_impressionObjectStateIso, 0);
  objc_storeStrong((id *)&self->_searchResultsStateIso, 0);
  objc_storeStrong((id *)&self->_routingSettingsIso, 0);
  objc_storeStrong((id *)&self->_mapUserSettingsIso, 0);
  objc_storeStrong((id *)&self->_mapFeaturesIso, 0);
  objc_storeStrong((id *)&self->_userProfileIso, 0);
  objc_storeStrong((id *)&self->_mapUIShownIso, 0);
  objc_storeStrong((id *)&self->_mapSettingsIso, 0);
  objc_storeStrong((id *)&self->_mapViewIso, 0);
  objc_storeStrong((id *)&self->_placeIso, 0);
}

@end
