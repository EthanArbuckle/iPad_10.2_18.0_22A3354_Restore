@implementation ATXFallbackActions

- (ATXFallbackActions)initWithClientModelSpec:(id)a3
{
  id v5;
  ATXFallbackActions *v6;
  uint64_t v7;
  NSBundle *bundle;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXFallbackActions;
  v6 = -[ATXFallbackActions init](&v10, sel_init);
  if (v6)
  {
    +[ATXFallbackActions fallbackActionsBundle](ATXFallbackActions, "fallbackActionsBundle");
    v7 = objc_claimAutoreleasedReturnValue();
    bundle = v6->_bundle;
    v6->_bundle = (NSBundle *)v7;

    objc_storeStrong((id *)&v6->_clientModelSpec, a3);
  }

  return v6;
}

+ (id)fallbackActionsBundle
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;

  +[ATXAssets2 pathForResource:ofType:isDirectory:](ATXAssets2, "pathForResource:ofType:isDirectory:", CFSTR("ATXFallbackActions"), &stru_1E4D5DB30, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v4 = v3;
      v5 = v4;
    }
    else
    {
      __atxlog_handle_default();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        +[ATXFallbackActions fallbackActionsBundle].cold.2();

      v5 = 0;
    }
  }
  else
  {
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      +[ATXFallbackActions fallbackActionsBundle].cold.1();
    v5 = 0;
  }

  return v5;
}

- (id)localizedStringForKey:(id)a3
{
  return -[NSBundle localizedStringForKey:value:table:](self->_bundle, "localizedStringForKey:value:table:", a3, 0, CFSTR("ATXFallbackActions"));
}

- (id)viewPhotos
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  ATXAction *v7;
  void *v8;
  ATXAction *v9;
  void *v10;
  uint64_t v12;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("com.apple.placeholder.activity.type"));
  -[ATXFallbackActions localizedStringForKey:](self, "localizedStringForKey:", CFSTR("VIEW_PHOTOS_TITLE"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("View photos");
  objc_msgSend(v3, "setTitle:", v6);

  objc_msgSend(v3, "setUserInfo:", MEMORY[0x1E0C9AA70]);
  v7 = [ATXAction alloc];
  v8 = (void *)objc_opt_new();
  LOBYTE(v12) = 0;
  v9 = -[ATXAction initWithNSUserActivity:actionUUID:bundleId:contentAttributeSet:itemIdentifier:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v7, "initWithNSUserActivity:actionUUID:bundleId:contentAttributeSet:itemIdentifier:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v3, v8, CFSTR("com.apple.mobileslideshow"), 0, 0, 0, 0, 0, v12, 0, 0);

  -[ATXFallbackActions proactiveSuggestionForAction:](self, "proactiveSuggestionForAction:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)searchSafari
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  ATXAction *v7;
  void *v8;
  ATXAction *v9;
  void *v10;
  uint64_t v12;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("NSUserActivityTypeBrowsingWeb"));
  -[ATXFallbackActions localizedStringForKey:](self, "localizedStringForKey:", CFSTR("SEARCH_SAFARI_TITLE"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("Search Safari");
  objc_msgSend(v3, "setTitle:", v6);

  objc_msgSend(v3, "setUserInfo:", MEMORY[0x1E0C9AA70]);
  v7 = [ATXAction alloc];
  v8 = (void *)objc_opt_new();
  LOBYTE(v12) = 0;
  v9 = -[ATXAction initWithNSUserActivity:actionUUID:bundleId:contentAttributeSet:itemIdentifier:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v7, "initWithNSUserActivity:actionUUID:bundleId:contentAttributeSet:itemIdentifier:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v3, v8, CFSTR("com.apple.mobilesafari"), 0, 0, 0, 0, 0, v12, 0, 0);

  -[ATXFallbackActions proactiveSuggestionForAction:](self, "proactiveSuggestionForAction:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)startATimer
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  ATXAction *v7;
  void *v8;
  ATXAction *v9;
  void *v10;
  uint64_t v12;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("com.apple.clock.timer"));
  -[ATXFallbackActions localizedStringForKey:](self, "localizedStringForKey:", CFSTR("START_TIMER_TITLE"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("Start a timer");
  objc_msgSend(v3, "setTitle:", v6);

  objc_msgSend(v3, "setUserInfo:", MEMORY[0x1E0C9AA70]);
  v7 = [ATXAction alloc];
  v8 = (void *)objc_opt_new();
  LOBYTE(v12) = 0;
  v9 = -[ATXAction initWithNSUserActivity:actionUUID:bundleId:contentAttributeSet:itemIdentifier:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v7, "initWithNSUserActivity:actionUUID:bundleId:contentAttributeSet:itemIdentifier:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v3, v8, CFSTR("com.apple.mobiletimer"), 0, 0, 0, 0, 0, v12, 0, 0);

  -[ATXFallbackActions proactiveSuggestionForAction:](self, "proactiveSuggestionForAction:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createAnEventForCurrentDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  ATXAction *v12;
  void *v13;
  ATXAction *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v19;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "dateWithoutMinutesAndSeconds:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateByAddingTimeInterval:", 3600.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBD970], "atx_createEventIntentWithStartDate:endDate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    __atxlog_handle_default();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ATXFallbackActions createAnEventForCurrentDate:].cold.1();

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[ATXFallbackActions createAnEventForCurrentDate:].cold.2();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Generic intent created from EKUICreateEventIntent is not an INIntent object."));
LABEL_12:
    v15 = 0;
    goto LABEL_13;
  }
  -[ATXFallbackActions localizedStringForKey:](self, "localizedStringForKey:", CFSTR("CREATE_CALENDAR_EVENT_TITLE"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("Create a new calendar event");
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  v12 = [ATXAction alloc];
  v13 = (void *)objc_opt_new();
  LOBYTE(v19) = 0;
  v14 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v12, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v7, v13, CFSTR("com.apple.mobilecal"), 0, 0, 0, v19, v11, CFSTR(" "));

  -[ATXFallbackActions proactiveSuggestionForAction:](self, "proactiveSuggestionForAction:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v15;
}

+ (id)dateWithoutMinutesAndSeconds:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 62, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateFromComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sendAMessage
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  ATXAction *v12;
  void *v13;
  ATXAction *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA60]), "initWithValue:type:", &stru_1E4D5DB30, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA58]), "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v3, 0, 0, 0, 0, 0);
  v5 = objc_alloc(MEMORY[0x1E0CBDB80]);
  v18[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithRecipients:outgoingMessageType:content:speakableGroupName:conversationIdentifier:serviceName:sender:attachments:", v6, 0, 0, 0, 0, 0, 0, 0);

  -[ATXFallbackActions localizedStringForKey:](self, "localizedStringForKey:", CFSTR("SEND_A_MESSAGE_TITLE"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("Send a message");
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  v12 = [ATXAction alloc];
  v13 = (void *)objc_opt_new();
  LOBYTE(v17) = 0;
  v14 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v12, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v7, v13, CFSTR("com.apple.MobileSMS"), 0, 0, 0, v17, v11, CFSTR(" "));

  -[ATXFallbackActions proactiveSuggestionForAction:](self, "proactiveSuggestionForAction:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)suggestionsForAllFallbackActions
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  for (i = 0; i != 5; ++i)
  {
    -[ATXFallbackActions suggestionforSpecifiedFallbackActionType:](self, "suggestionforSpecifiedFallbackActionType:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v3, "addObject:", v5);

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (id)suggestionforSpecifiedFallbackActionType:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  switch(a3)
  {
    case 0uLL:
      v5 = (void *)objc_opt_new();
      -[ATXFallbackActions createAnEventForCurrentDate:](self, "createAnEventForCurrentDate:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    case 1uLL:
      -[ATXFallbackActions sendAMessage](self, "sendAMessage");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2uLL:
      -[ATXFallbackActions startATimer](self, "startATimer");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3uLL:
      -[ATXFallbackActions searchSafari](self, "searchSafari");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4uLL:
      -[ATXFallbackActions viewPhotos](self, "viewPhotos");
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v6 = (void *)v14;
      break;
    default:
      __atxlog_handle_default();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[ATXFallbackActions suggestionforSpecifiedFallbackActionType:].cold.1(a3, v7, v8, v9, v10, v11, v12, v13);

      v6 = 0;
      break;
  }
  return v6;
}

- (id)proactiveSuggestionForAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", 2, -1000.0);
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v4, "json");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@"), v7);

    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v4, "actionKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "paramHash"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@:%lld"), v10, objc_msgSend(v11, "longLongValue"));

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A8]), "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v4, v8, v12, 2);
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D811B8], "layoutConfigurationsForLayoutOptions:", 44);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc(MEMORY[0x1E0D811D0]);
      objc_msgSend(v4, "actionTitle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "actionSubtitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LOWORD(v21) = 0;
      v18 = (void *)objc_msgSend(v15, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", v16, v17, 0, v14, 0, 1, v21);

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", self->_clientModelSpec, v13, v18, v5);
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (unint64_t)fallbackActionTypeForString:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v5 = 0;
  while (1)
  {
    objc_msgSend(a1, "stringForFallbackActionType:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqualToString:", v6);

    if ((v7 & 1) != 0)
      break;
    if (++v5 == 5)
    {
      __atxlog_handle_default();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        +[ATXFallbackActions fallbackActionTypeForString:].cold.1((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);

      v5 = 5;
      break;
    }
  }

  return v5;
}

+ (id)stringForFallbackActionType:(unint64_t)a3
{
  NSObject *v5;

  if (a3 < 5)
    return off_1E4D5A838[a3];
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[ATXFallbackActions stringForFallbackActionType:].cold.1(a3, v5);

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("stringForFallbackActionType called with invalid ATXFallbackActionType value of %lu"), a3);
  return CFSTR("Error");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientModelSpec, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

+ (void)fallbackActionsBundle
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXFallbackActions Bundle is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)createAnEventForCurrentDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "Failed to create generic intent from EKUICreateEventIntent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)createAnEventForCurrentDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "Generic intent created from EKUICreateEventIntent is not an INIntent object.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)suggestionforSpecifiedFallbackActionType:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, a2, a3, "stringForFallbackActionType called with invalid ATXFallbackActionType value of %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

+ (void)fallbackActionTypeForString:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, a2, a3, "fallbackActionTypeForString called with invalid fallbackAction value of %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)stringForFallbackActionType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "stringForFallbackActionType called with invalid ATXFallbackActionType value of %lu", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
