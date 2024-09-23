@implementation EKEventActionHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_58);
  return (id)sharedInstance_sharedInstance_0;
}

void __38__EKEventActionHandler_sharedInstance__block_invoke()
{
  EKEventActionHandler *v0;
  void *v1;

  v0 = objc_alloc_init(EKEventActionHandler);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

+ (id)_logHandle
{
  if (_logHandle_onceToken != -1)
    dispatch_once(&_logHandle_onceToken, &__block_literal_global_6_5);
  return (id)_logHandle_handle;
}

void __34__EKEventActionHandler__logHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("EventKit", "EKEventActionHandler");
  v1 = (void *)_logHandle_handle;
  _logHandle_handle = (uint64_t)v0;

}

- (void)handleEventCreation:(id)a3
{
  id v4;

  v4 = a3;
  -[EKEventActionHandler donateInteractionForAction:onEvent:](self, "donateInteractionForAction:onEvent:", CFSTR("createEvent"), v4);
  -[EKEventActionHandler donatePredictiveAction:forEvent:](self, "donatePredictiveAction:forEvent:", CFSTR("createEvent"), v4);

}

- (void)prepareForEventUpdate:(id)a3
{
  -[EKEventActionHandler donateInteractionForAction:onEvent:](self, "donateInteractionForAction:onEvent:", CFSTR("willUpdateEvent"), a3);
}

- (void)handleEventUpdate:(id)a3
{
  -[EKEventActionHandler donateInteractionForAction:onEvent:](self, "donateInteractionForAction:onEvent:", CFSTR("didUpdateEvent"), a3);
}

- (void)handleEventDeletion:(id)a3
{
  -[EKEventActionHandler donateInteractionForAction:onEvent:](self, "donateInteractionForAction:onEvent:", CFSTR("deleteEvent"), a3);
}

- (void)removeInteractionsForCalendar:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CBD9A8];
  objc_msgSend(v3, "calendarIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteInteractionsWithGroupIdentifier:completion:", v5, 0);

  objc_msgSend((id)objc_opt_class(), "_logHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "calendarIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1A2318000, v6, OS_LOG_TYPE_INFO, "Deleting previous interactions on calendar %@", (uint8_t *)&v8, 0xCu);

  }
}

- (id)_intentForAction:(id)a3 onEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[EKDuetSignalEventSerializer serializedEventWithEvent:](EKDuetSignalEventSerializer, "serializedEventWithEvent:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD970]), "initWithDomain:verb:parametersByName:", CFSTR("Calendar"), v5, v6);

  return v7;
}

- (void)donateInteractionForAction:(id)a3 onEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[EKEventActionHandler _intentForAction:onEvent:](self, "_intentForAction:onEvent:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "calendarItemIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "verb");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("deleteEvent"));

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CBD9A8];
      v23[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "deleteInteractionsWithIdentifiers:completion:", v12, 0);

      objc_msgSend((id)objc_opt_class(), "_logHandle");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v19 = 138412290;
        v20 = v8;
        _os_log_impl(&dword_1A2318000, v13, OS_LOG_TYPE_INFO, "Deleting previous interactions on event %@", (uint8_t *)&v19, 0xCu);
      }

    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v7, 0);
    objc_msgSend(v14, "setIdentifier:", v8);
    objc_msgSend(v6, "calendar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "calendarIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setGroupIdentifier:", v16);

    objc_msgSend(v14, "donateInteractionWithCompletion:", 0);
    objc_msgSend((id)objc_opt_class(), "_logHandle");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "verb");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v18;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1A2318000, v17, OS_LOG_TYPE_INFO, "Donated interaction for action %@ on event %@", (uint8_t *)&v19, 0x16u);

    }
  }

}

- (void)donatePredictiveAction:(id)a3 forEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.mobilecal"));

  if (v9 && objc_msgSend(v15, "isEqualToString:", CFSTR("createEvent")))
  {
    -[EKEventActionHandler createEventIntentForEvent:](self, "createEventIntentForEvent:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v10, 0);
    objc_msgSend(v6, "calendarItemIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIdentifier:", v12);

    objc_msgSend(v6, "calendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "calendarIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setGroupIdentifier:", v14);

    objc_msgSend(v11, "donateInteractionWithCompletion:", 0);
  }

}

- (id)createEventIntentForEvent:(id)a3
{
  return -[EKEventActionHandler createEventIntentForEvent:withSuggestionsInfoUniqueKey:](self, "createEventIntentForEvent:withSuggestionsInfoUniqueKey:", a3, 0);
}

+ (id)_displayStringForDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (_displayStringForDate__onceToken != -1)
    dispatch_once(&_displayStringForDate__onceToken, &__block_literal_global_26);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1;
  objc_sync_enter(v6);
  objc_msgSend(v5, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_displayStringForDate__cachedLocale, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("EEEMMMdjmm"), 0, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_displayStringForDate__dateFormatter, "setDateFormat:", v10);

    objc_storeStrong((id *)&_displayStringForDate__cachedLocale, v5);
  }
  objc_msgSend((id)_displayStringForDate__dateFormatter, "stringFromDate:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v6);

  return v11;
}

void __46__EKEventActionHandler__displayStringForDate___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_displayStringForDate__dateFormatter;
  _displayStringForDate__dateFormatter = v0;

}

- (id)createEventIntentForEvent:(id)a3 withSuggestionsInfoUniqueKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  EKUICreateEventIntent *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
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
  id v44;
  void *v45;
  void *v46;
  void *v47;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;
  objc_msgSend(v5, "startTimeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%f#%@"), v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "endDateUnadjustedForLegacyClients");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v17 = v16;
  objc_msgSend(v5, "endTimeZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%f#%@"), v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@#%@"), v13, v6);
    v21 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v21;
  }
  v22 = objc_alloc_init(EKUICreateEventIntent);
  v23 = objc_alloc(MEMORY[0x1E0CBDA08]);
  v24 = (void *)objc_opt_class();
  objc_msgSend(v5, "startDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_displayStringForDate:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v23, "initWithIdentifier:displayString:", v13, v26);

  v28 = objc_alloc(MEMORY[0x1E0CBDA08]);
  v29 = (void *)objc_opt_class();
  objc_msgSend(v5, "endDateUnadjustedForLegacyClients");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_displayStringForDate:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v28, "initWithIdentifier:displayString:", v20, v31);

  objc_msgSend(v5, "title");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUICreateEventIntent setTitle:](v22, "setTitle:", v33);

  -[EKUICreateEventIntent setStartDate:](v22, "setStartDate:", v27);
  -[EKUICreateEventIntent setEndDate:](v22, "setEndDate:", v32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isAllDay"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUICreateEventIntent setAllDay:](v22, "setAllDay:", v34);

  -[EKUICreateEventIntent _setLaunchId:](v22, "_setLaunchId:", CFSTR("com.apple.mobilecal"));
  EKBundle();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Create event"), &stru_1E4789A58, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUICreateEventIntent setSuggestedInvocationPhrase:](v22, "setSuggestedInvocationPhrase:", v36);

  objc_msgSend(v5, "structuredLocation");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v5, "structuredLocation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "title");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUICreateEventIntent setLocationName:](v22, "setLocationName:", v39);

    objc_msgSend(v5, "structuredLocation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "address");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUICreateEventIntent setLocationAddress:](v22, "setLocationAddress:", v41);

    objc_msgSend(v5, "structuredLocation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "geoLocation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      v44 = objc_alloc((Class)EKWeakLinkClass());
      objc_msgSend(v5, "structuredLocation");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "geoLocation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)objc_msgSend(v44, "initWithLocation:addressDictionary:region:areasOfInterest:", v46, 0, 0, 0);
      -[EKUICreateEventIntent setGeolocation:](v22, "setGeolocation:", v47);

    }
  }

  return v22;
}

@end
