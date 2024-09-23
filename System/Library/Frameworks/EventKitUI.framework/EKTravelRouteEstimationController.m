@implementation EKTravelRouteEstimationController

- (EKTravelRouteEstimationController)initWithDestinationStructuredLocation:(id)a3 eventStore:(id)a4
{
  id v6;
  id v7;
  EKTravelRouteEstimationController *v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EKTravelRouteEstimationController;
  v8 = -[EKTravelRouteEstimationController init](&v10, sel_init);
  if (v8)
  {
    EKUILogInitIfNeeded();
    -[EKTravelRouteEstimationController setDestinationStructuredLocation:](v8, "setDestinationStructuredLocation:", v6);
    objc_storeStrong((id *)&v8->_eventStore, a4);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)EKTravelRouteEstimationController;
  -[EKTravelRouteEstimationController dealloc](&v3, sel_dealloc);
}

- (void)beginOriginLocationEstimationLookup
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  __int16 v11;

  -[EKTravelRouteEstimationController arrivalDate](self, "arrivalDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v7 = kEKUILogHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      return;
    v11 = 0;
    v8 = "Travel origin location lookup called with nil arrivalDate.";
    v9 = (uint8_t *)&v11;
LABEL_10:
    _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
    return;
  }
  if (!self->_eventStore)
  {
    v7 = kEKUILogHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      return;
    v10 = 0;
    v8 = "Can't compute origin location with nil eventStore.";
    v9 = (uint8_t *)&v10;
    goto LABEL_10;
  }
  -[EKTravelRouteEstimationController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[EKTravelRouteEstimationController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "routeEstimationControllerDidBeginOriginLocationLookup:", self);

  }
  -[EKTravelRouteEstimationController _beginOriginLocationEstimationEventKitLookup](self, "_beginOriginLocationEstimationEventKitLookup");
}

- (void)_beginOriginLocationEstimationCoreRoutineLookup
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(-32768, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__EKTravelRouteEstimationController__beginOriginLocationEstimationCoreRoutineLookup__block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(v3, block);

}

void __84__EKTravelRouteEstimationController__beginOriginLocationEstimationCoreRoutineLookup__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  char v4;
  objc_class *v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint8_t buf[16];

  v2 = *MEMORY[0x1E0D0C468];
  v3 = objc_msgSend(MEMORY[0x1E0D0C330], "authorizationStatusForBundleIdentifier:", *MEMORY[0x1E0D0C468]);
  v4 = objc_msgSend(MEMORY[0x1E0D0C330], "preciseLocationAuthorizedForBundleIdentifier:", v2);
  if (v3 >= 3 && (v4 & 1) != 0)
  {
    v5 = (objc_class *)EKWeakLinkClass();
    v6 = EKWeakLinkClass();
    v7 = objc_alloc_init(v5);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __84__EKTravelRouteEstimationController__beginOriginLocationEstimationCoreRoutineLookup__block_invoke_13;
    v10[3] = &unk_1E601B528;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v7;
    v12 = v6;
    v8 = v7;
    objc_msgSend(v8, "fetchRoutineStateWithHandler:", v10);

  }
  else
  {
    v9 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_INFO, "Not estimating starting point using CoreRoutine because we don't have precise location authorization", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_originLocationEstimationCompletedCoreRoutineLookup");
  }
}

void __84__EKTravelRouteEstimationController__beginOriginLocationEstimationCoreRoutineLookup__block_invoke_13(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[6];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_ERROR, "Error fetching routine state: %@", buf, 0xCu);
    }
  }
  if (a2 == 2)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "arrivalDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __84__EKTravelRouteEstimationController__beginOriginLocationEstimationCoreRoutineLookup__block_invoke_14;
    v10[3] = &unk_1E601B500;
    v9 = *(_QWORD *)(a1 + 48);
    v10[4] = *(_QWORD *)(a1 + 32);
    v10[5] = v9;
    objc_msgSend(v7, "fetchPredictedLocationsOfInterestOnDate:withHandler:", v8, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_originLocationEstimationCompletedCoreRoutineLookup");
  }

}

void __84__EKTravelRouteEstimationController__beginOriginLocationEstimationCoreRoutineLookup__block_invoke_14(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a2;
  v5 = objc_msgSend(v29, "count");
  if (!a3 && v5)
  {
    objc_msgSend(v29, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "confidence");
    if (v7 >= 0.5)
    {
      objc_msgSend(v6, "locationOfInterest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "destinationStructuredLocation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "geoLocation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "coordinate");
      v12 = v11;
      v14 = v13;

      v15 = objc_alloc(*(Class *)(a1 + 40));
      objc_msgSend(v8, "location");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "latitude");
      v18 = v17;
      objc_msgSend(v8, "location");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "longitude");
      v21 = (void *)objc_msgSend(v15, "initWithLatitude:longitude:", v18, v20);

      v22 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithLatitude:longitude:", v12, v14);
      objc_msgSend(v21, "distanceFromLocation:", v22);
      if (v23 > 10.0)
      {
        v24 = (void *)MEMORY[0x1E0CAA158];
        objc_msgSend(v8, "mapItem");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "locationWithTitle:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setEvaluatedOriginLocation:", v27);

        objc_msgSend(*(id *)(a1 + 32), "evaluatedOriginLocation");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setGeoLocation:", v21);

      }
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_originLocationEstimationCompletedCoreRoutineLookup");

}

- (void)_beginOriginLocationEstimationEventKitLookup
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(-32768, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__EKTravelRouteEstimationController__beginOriginLocationEstimationEventKitLookup__block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(v3, block);

}

void __81__EKTravelRouteEstimationController__beginOriginLocationEstimationEventKitLookup__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "arrivalDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingUnit:value:toDate:options:", 32, -2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 128, -1, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD **)(a1 + 32);
  v8 = (void *)v7[1];
  objc_msgSend(v7, "arrivalDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateForEventsWithStartDate:endDate:calendars:loadDefaultProperties:", v6, v9, 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 8);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__EKTravelRouteEstimationController__beginOriginLocationEstimationEventKitLookup__block_invoke_2;
  v14[3] = &unk_1E6018B10;
  v14[4] = v11;
  v13 = (id)objc_msgSend(v12, "fetchEventsMatchingPredicate:resultHandler:", v10, v14);

}

void __81__EKTravelRouteEstimationController__beginOriginLocationEstimationEventKitLookup__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__EKTravelRouteEstimationController__beginOriginLocationEstimationEventKitLookup__block_invoke_3;
  v10[3] = &unk_1E601B4D0;
  v10[4] = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
    {
      objc_msgSend(v5, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_47);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v7, "structuredLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "duplicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setEvaluatedOriginLocation:", v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setEvaluatedOriginLocation:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "_originLocationEstimationCompletedEventKitLookup");

}

BOOL __81__EKTravelRouteEstimationController__beginOriginLocationEstimationEventKitLookup__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(v3, "structuredLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isStructured"))
  {
    objc_msgSend(v3, "endDateUnadjustedForLegacyClients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "arrivalDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "compare:", v6) != 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __81__EKTravelRouteEstimationController__beginOriginLocationEstimationEventKitLookup__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "endDateUnadjustedForLegacyClients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDateUnadjustedForLegacyClients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)_originLocationEstimationCompletedEventKitLookup
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__EKTravelRouteEstimationController__originLocationEstimationCompletedEventKitLookup__block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __85__EKTravelRouteEstimationController__originLocationEstimationCompletedEventKitLookup__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "evaluatedOriginLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "routeEstimationControllerDidFinishOriginLocationLookup:", *(_QWORD *)(a1 + 32));

    }
  }
  else
  {
    objc_msgSend(v3, "_beginOriginLocationEstimationCoreRoutineLookup");
  }
}

- (void)_originLocationEstimationCompletedCoreRoutineLookup
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__EKTravelRouteEstimationController__originLocationEstimationCompletedCoreRoutineLookup__block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __88__EKTravelRouteEstimationController__originLocationEstimationCompletedCoreRoutineLookup__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "routeEstimationControllerDidFinishOriginLocationLookup:", *(_QWORD *)(a1 + 32));

  }
}

- (id)_routingModeTypesAsEnum
{
  if (objc_msgSend(MEMORY[0x1E0D274C8], "transitTTLSupportedInCurrentCountry"))
    return &unk_1E606FA40;
  else
    return &unk_1E606FA58;
}

- (void)beginTravelTimeEstimationLookup
{
  NSMutableArray *rows;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];

  self->_isEstimating = 1;
  rows = self->_rows;
  self->_rows = 0;

  -[EKTravelRouteEstimationController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[EKTravelRouteEstimationController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "routeEstimationControllerDidBeginTravelTimeLookup:", self);

  }
  -[EKTravelRouteEstimationController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__lookupTimedOut, 0, 60.0);
  dispatch_get_global_queue(-32768, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__EKTravelRouteEstimationController_beginTravelTimeEstimationLookup__block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(v7, block);

}

void __68__EKTravelRouteEstimationController_beginTravelTimeEstimationLookup__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_routingModeTypesAsEnum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0D0C328], "routeTypeStringForCalLocationRoutingMode:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v8), "integerValue"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "originStructuredLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "calLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "destinationStructuredLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "calLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CAA180], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "arrivalDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__EKTravelRouteEstimationController_beginTravelTimeEstimationLookup__block_invoke_2;
  v16[3] = &unk_1E601A650;
  v16[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v14, "travelTimeFrom:to:arrivalDate:withRouteTypes:withCompletionBlock:", v11, v13, v15, v3, v16);

}

void __68__EKTravelRouteEstimationController_beginTravelTimeEstimationLookup__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD block[5];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__EKTravelRouteEstimationController_beginTravelTimeEstimationLookup__block_invoke_3;
  block[3] = &unk_1E6018688;
  v18 = a1;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v10 = objc_msgSend(MEMORY[0x1E0D0C328], "routingModeEnumForCalRouteType:", v9, v18);
        objc_msgSend(v4, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v11, v12);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_11;
          objc_msgSend(v11, "duration");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", ceil(v13 / 300.0) * 300.0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v12, v14);

        }
LABEL_11:

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __68__EKTravelRouteEstimationController_beginTravelTimeEstimationLookup__block_invoke_4;
  v21[3] = &unk_1E6018660;
  v21[4] = *(_QWORD *)(v18 + 32);
  v22 = v19;
  v23 = v20;
  v15 = v20;
  v16 = v19;
  v17 = (void *)MEMORY[0x1E0C80D38];
  dispatch_async(MEMORY[0x1E0C80D38], v21);

}

uint64_t __68__EKTravelRouteEstimationController_beginTravelTimeEstimationLookup__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel__lookupTimedOut, 0);
}

void __68__EKTravelRouteEstimationController_beginTravelTimeEstimationLookup__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  _BOOL4 v15;
  double v16;
  _BOOL4 v17;
  double v18;
  BOOL v19;
  int v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTravelTimeEstimatedValues:", v2);

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTravelTimeLookupErrors:", v3);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_routingModeTypesAsEnum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "travelTimeLookupErrors");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "travelTimeEstimatedValues");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "doubleValue");
          v15 = v14 != 0.0;
        }
        else
        {
          v15 = 0;
        }
        objc_msgSend(v13, "doubleValue");
        v17 = v16 > 18000.0 && objc_msgSend(v9, "integerValue") == 2;
        objc_msgSend(v13, "doubleValue");
        v19 = v18 > 18000.0 && objc_msgSend(v9, "integerValue") == 4;
        v20 = !v15;
        if (v11)
          v20 = 1;
        if (((v20 | v17) & 1) == 0 && !v19)
          objc_msgSend(v25, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v6);
  }

  v21 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setRowData:", v21);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "routeEstimationControllerDidFinishTravelTimeLookup:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_lookupTimedOut
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[EKTravelRouteEstimationController _routingModeTypesAsEnum](self, "_routingModeTypesAsEnum", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 1001);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  -[EKTravelRouteEstimationController setTravelTimeEstimatedValues:](self, "setTravelTimeEstimatedValues:", MEMORY[0x1E0C9AA70]);
  -[EKTravelRouteEstimationController setTravelTimeLookupErrors:](self, "setTravelTimeLookupErrors:", v3);
  -[EKTravelRouteEstimationController setRowData:](self, "setRowData:", MEMORY[0x1E0C9AA60]);
  self->_isEstimating = 0;
  -[EKTravelRouteEstimationController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[EKTravelRouteEstimationController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "routeEstimationControllerDidFinishTravelTimeLookup:", self);

  }
}

- (void)setOriginStructuredLocation:(id)a3
{
  objc_storeStrong((id *)&self->_originStructuredLocation, a3);
  -[EKTravelRouteEstimationController setTravelTimeEstimatedValues:](self, "setTravelTimeEstimatedValues:", 0);
  -[EKTravelRouteEstimationController setTravelTimeLookupErrors:](self, "setTravelTimeLookupErrors:", 0);
  -[EKTravelRouteEstimationController setRowData:](self, "setRowData:", MEMORY[0x1E0C9AA60]);
}

- (EKStructuredLocation)originStructuredLocation
{
  return self->_originStructuredLocation;
}

- (double)estimatedTravelTimeValueAtRowIndex:(unint64_t)a3
{
  NSDictionary *travelTimeEstimatedValues;
  void *v4;
  void *v5;
  double v6;
  double v7;

  travelTimeEstimatedValues = self->_travelTimeEstimatedValues;
  -[NSArray objectAtIndexedSubscript:](self->_rowData, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](travelTimeEstimatedValues, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (id)estimatedTravelTimeRowErrorAtRowIndex:(unint64_t)a3
{
  void *v3;

  if (self->_isEstimating)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EKTravelRouteEstimationControllerIsEstimating"), 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)estimatedTravelTimeRowHasErrorAtRowIndex:(unint64_t)a3
{
  return self->_isEstimating;
}

- (unint64_t)numberOfOutputRows
{
  if (self->_isEstimating)
    return 1;
  else
    return -[NSArray count](self->_rowData, "count");
}

- (int64_t)estimatedTravelTimeRoutingModeAtRowIndex:(unint64_t)a3
{
  void *v3;
  int64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_rowData, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)_imageForCellAtIndex:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[NSArray objectAtIndexedSubscript:](self->_rowData, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  switch(v4)
  {
    case -1:
    case 0:
    case 1:
      CarImage();
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      WalkmanImage();
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      TransitImage();
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4:
      BicycleImage();
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v6 = (void *)v5;
      break;
    default:
      v6 = 0;
      break;
  }
  objc_msgSend(v6, "imageWithRenderingMode:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)estimatedTravelTimeTableViewCellWithRowIndex:(unint64_t)a3 tableView:(id)a4
{
  id v6;
  NSMutableArray *rows;
  NSMutableArray *v8;
  NSMutableArray *v9;
  EKEventEstimatedTravelTimeResultCell *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  EKEventEstimatedTravelTimeResultCell *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v6 = a4;
  rows = self->_rows;
  if (!rows)
  {
    v8 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
    v9 = self->_rows;
    self->_rows = v8;

    rows = self->_rows;
  }
  if (-[NSMutableArray count](rows, "count") <= a3
    || (-[NSMutableArray objectAtIndex:](self->_rows, "objectAtIndex:", a3),
        (v10 = (EKEventEstimatedTravelTimeResultCell *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v10 = -[EKCalendarChooserCell initWithStyle:reuseIdentifier:]([EKEventEstimatedTravelTimeResultCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
    -[EKEventEstimatedTravelTimeResultCell frame](v10, "frame");
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, "frame");
    -[EKEventEstimatedTravelTimeResultCell setFrame:](v10, "setFrame:", v12, v14);
    objc_msgSend((id)objc_opt_class(), "_basedOnLocationLocalizedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEstimatedTravelTimeResultCell textLabel](v10, "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v15);

    CUIKDisplayStringForTravelTimeUsingShortFormat();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEstimatedTravelTimeResultCell detailTextLabel](v10, "detailTextLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v17);

    -[EKCalendarChooserCell layoutSubviews](v10, "layoutSubviews");
    BicycleImage();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserCell setColorDotImage:](v10, "setColorDotImage:", v19);

    -[EKCalendarChooserCell setShowsColorDot:](v10, "setShowsColorDot:", 1);
    -[EKCalendarChooserCell textLeadingIndent](v10, "textLeadingIndent");
    v21 = v20;
    objc_msgSend(v6, "layoutMargins");
    v23 = v22;
    objc_msgSend(v6, "layoutMargins");
    v25 = v21 + v23 + v24;
    -[EKEventEstimatedTravelTimeResultCell detailTextLabel](v10, "detailTextLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
    v28 = v27;
    -[EKEventEstimatedTravelTimeResultCell textLabel](v10, "textLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "frame");
    v31 = v25 + v28 + v30;
    -[EKEventEstimatedTravelTimeResultCell frame](v10, "frame");
    v33 = v32 * 0.95;

    if (v31 > v33)
    {
      v34 = -[EKCalendarChooserCell initWithStyle:reuseIdentifier:]([EKEventEstimatedTravelTimeResultCell alloc], "initWithStyle:reuseIdentifier:", 3, 0);

      -[EKEventEstimatedTravelTimeResultCell textLabel](v34, "textLabel");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setNumberOfLines:", 0);

      v10 = v34;
    }
    -[EKEventEstimatedTravelTimeResultCell textLabel](v10, "textLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setText:", 0);

    -[EKEventEstimatedTravelTimeResultCell detailTextLabel](v10, "detailTextLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setText:", 0);

    -[EKCalendarChooserCell setColorDotImage:](v10, "setColorDotImage:", 0);
    -[EKCalendarChooserCell setShowsColorDot:](v10, "setShowsColorDot:", 0);
    -[NSMutableArray insertObject:atIndex:](self->_rows, "insertObject:atIndex:", v10, a3);
  }
  if (self->_isEstimating)
  {
    EventKitUIBundle();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Estimating travel time…"), &stru_1E601DFA8, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEstimatedTravelTimeResultCell textLabel](v10, "textLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setText:", v39);

    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_basedOnLocationLocalizedString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserCell setTextLabelText:](v10, "setTextLabelText:", v41);

    -[EKTravelRouteEstimationController estimatedTravelTimeValueAtRowIndex:](self, "estimatedTravelTimeValueAtRowIndex:", a3);
    CUIKDisplayStringForTravelTimeUsingShortFormat();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEstimatedTravelTimeResultCell detailTextLabel](v10, "detailTextLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setText:", v42);

    -[EKTravelRouteEstimationController _imageForCellAtIndex:](self, "_imageForCellAtIndex:", a3);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserCell setColorDotImage:](v10, "setColorDotImage:", v44);

    -[EKCalendarChooserCell setShowsColorDot:](v10, "setShowsColorDot:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEstimatedTravelTimeResultCell textLabel](v10, "textLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setTextColor:", v45);

  return v10;
}

+ (id)_basedOnLocationLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Based on location"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (EKTravelRouteEstimationControllerDelegate)delegate
{
  return (EKTravelRouteEstimationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDate)arrivalDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setArrivalDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (EKStructuredLocation)destinationStructuredLocation
{
  return (EKStructuredLocation *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDestinationStructuredLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)isEstimating
{
  return self->_isEstimating;
}

- (void)setIsEstimating:(BOOL)a3
{
  self->_isEstimating = a3;
}

- (EKStructuredLocation)evaluatedOriginLocation
{
  return (EKStructuredLocation *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEvaluatedOriginLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDictionary)travelTimeEstimatedValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTravelTimeEstimatedValues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDictionary)travelTimeLookupErrors
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTravelTimeLookupErrors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSArray)rowData
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRowData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowData, 0);
  objc_storeStrong((id *)&self->_travelTimeLookupErrors, 0);
  objc_storeStrong((id *)&self->_travelTimeEstimatedValues, 0);
  objc_storeStrong((id *)&self->_evaluatedOriginLocation, 0);
  objc_storeStrong((id *)&self->_destinationStructuredLocation, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_originStructuredLocation, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end
