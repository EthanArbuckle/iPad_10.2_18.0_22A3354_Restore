@implementation ATXActivity

- (ATXActivity)initWithBMInferredModeEvent:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  ATXActivity *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "modeUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userModeName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modeType");
  v17 = BMInferredModeTypeToActivity();
  v4 = objc_msgSend(v3, "origin");
  objc_msgSend(v3, "originBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originAnchorType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "isAutomationEnabled");
  objc_msgSend(v3, "suggestionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serializedTriggers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ATXDeserializeTriggers();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "uiLocation");
  v12 = objc_msgSend(v3, "shouldSuggestTriggers");

  LOBYTE(v16) = v12;
  LOBYTE(v15) = v7;
  v13 = -[ATXActivity initWithModeUUID:userModeName:activityType:origin:originBundleId:originAnchorType:allowsSmartEntry:suggestionUUID:triggers:location:shouldSuggestTriggers:](self, "initWithModeUUID:userModeName:activityType:origin:originBundleId:originAnchorType:allowsSmartEntry:suggestionUUID:triggers:location:shouldSuggestTriggers:", v19, v18, v17, v4, v5, v6, v15, v8, v10, v11, v16);

  return v13;
}

- (ATXActivity)initWithBiomeInferredModeEvent:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  ATXActivity *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "modeIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userModeName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modeType");
  v17 = BMUserFocusInferredModeTypeToActivity();
  objc_msgSend(v3, "origin");
  v4 = BMUserFocusInferredModeOriginToLegacy();
  objc_msgSend(v3, "originBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originAnchorType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "isAutomationEnabled");
  objc_msgSend(v3, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serializedTriggers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ATXDeserializeTriggers();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "uiLocation");
  v12 = objc_msgSend(v3, "shouldSuggestTriggers");

  LOBYTE(v16) = v12;
  LOBYTE(v15) = v7;
  v13 = -[ATXActivity initWithModeUUID:userModeName:activityType:origin:originBundleId:originAnchorType:allowsSmartEntry:suggestionUUID:triggers:location:shouldSuggestTriggers:](self, "initWithModeUUID:userModeName:activityType:origin:originBundleId:originAnchorType:allowsSmartEntry:suggestionUUID:triggers:location:shouldSuggestTriggers:", v19, v18, v17, v4, v5, v6, v15, v8, v10, v11, v16);

  return v13;
}

- (ATXActivity)initWithModeUUID:(id)a3 userModeName:(id)a4 activityType:(unint64_t)a5 origin:(int64_t)a6 originBundleId:(id)a7 originAnchorType:(id)a8 allowsSmartEntry:(BOOL)a9 suggestionUUID:(id)a10 triggers:(id)a11 location:(unint64_t)a12 shouldSuggestTriggers:(BOOL)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  ATXActivity *v25;
  uint64_t v26;
  NSString *modeUUID;
  uint64_t v28;
  NSString *userModeName;
  uint64_t v30;
  NSString *originBundleId;
  uint64_t v32;
  NSString *originAnchorType;
  uint64_t v34;
  NSString *suggestionUUID;
  uint64_t v36;
  NSArray *triggers;
  objc_super v39;

  v19 = a3;
  v20 = a4;
  v21 = a7;
  v22 = a8;
  v23 = a10;
  v24 = a11;
  v39.receiver = self;
  v39.super_class = (Class)ATXActivity;
  v25 = -[ATXActivity init](&v39, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v19, "copy");
    modeUUID = v25->_modeUUID;
    v25->_modeUUID = (NSString *)v26;

    v28 = objc_msgSend(v20, "copy");
    userModeName = v25->_userModeName;
    v25->_userModeName = (NSString *)v28;

    v25->_activityType = a5;
    v25->_origin = a6;
    v30 = objc_msgSend(v21, "copy");
    originBundleId = v25->_originBundleId;
    v25->_originBundleId = (NSString *)v30;

    v32 = objc_msgSend(v22, "copy");
    originAnchorType = v25->_originAnchorType;
    v25->_originAnchorType = (NSString *)v32;

    v34 = objc_msgSend(v23, "copy");
    suggestionUUID = v25->_suggestionUUID;
    v25->_suggestionUUID = (NSString *)v34;

    v25->_allowsSmartEntry = a9;
    v25->_location = a12;
    v36 = objc_msgSend(v24, "copy");
    triggers = v25->_triggers;
    v25->_triggers = (NSArray *)v36;

    v25->_shouldSuggestTriggers = a13;
  }

  return v25;
}

- (NSString)identifier
{
  return self->_modeUUID;
}

- (NSString)localizedSuggestionReason
{
  NSObject *v3;
  unint64_t activityType;
  int64_t origin;
  NSString *originAnchorType;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  unint64_t v12;
  __int16 v13;
  int64_t v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_modes();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    activityType = self->_activityType;
    origin = self->_origin;
    originAnchorType = self->_originAnchorType;
    v11 = 134218498;
    v12 = activityType;
    v13 = 2048;
    v14 = origin;
    v15 = 2112;
    v16 = originAnchorType;
    _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "ATXActivity - Generating localizedSuggestionReason for activity type %ld, origin %ld, and origin anchor type %@", (uint8_t *)&v11, 0x20u);
  }

  -[ATXActivity _suggestionReasonLocalizationKey](self, "_suggestionReasonLocalizationKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", v7, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_modes();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[ATXActivity localizedSuggestionReason].cold.1();
    v9 = 0;
  }

  return (NSString *)v9;
}

- (id)_suggestionReasonLocalizationKey
{
  int64_t *p_origin;
  unint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  p_origin = &self->_origin;
  v3 = self->_origin + 1;
  if (v3 > 0x11)
  {
    __atxlog_handle_modes();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXActivity _suggestionReasonLocalizationKey].cold.1((uint64_t)p_origin, v5, v6, v7, v8, v9, v10, v11);

    goto LABEL_9;
  }
  if (((1 << v3) & 0x3E7FC) == 0)
  {
    if (((1 << v3) & 0x1003) == 0)
    {
      -[ATXActivity _anchorSuggestionReasonLocalizationKey](self, "_anchorSuggestionReasonLocalizationKey");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
LABEL_9:
    v4 = 0;
    return v4;
  }
  -[ATXActivity _heuristicSuggestionReasonLocalizationKey](self, "_heuristicSuggestionReasonLocalizationKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)_anchorSuggestionReasonLocalizationKey
{
  NSString **p_originAnchorType;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  p_originAnchorType = &self->_originAnchorType;
  if (-[NSString isEqualToString:](self->_originAnchorType, "isEqualToString:", CFSTR("BluetoothConnectedAnchor")))
    return CFSTR("FOCUS_SUGGESTION_REASON_Anchor_BluetoothConnected");
  if (-[NSString isEqualToString:](*p_originAnchorType, "isEqualToString:", CFSTR("BluetoothDisconnectedAnchor")))
    return CFSTR("FOCUS_SUGGESTION_REASON_Anchor_BluetoothDisconnected");
  if (-[NSString isEqualToString:](*p_originAnchorType, "isEqualToString:", CFSTR("IdleTimeBeginAnchor")))
    return CFSTR("FOCUS_SUGGESTION_REASON_Anchor_IdleTimeBegin");
  if (-[NSString isEqualToString:](*p_originAnchorType, "isEqualToString:", CFSTR("IdleTimeEndAnchor")))
    return CFSTR("FOCUS_SUGGESTION_REASON_Anchor_IdleTimeEnd");
  if (-[NSString isEqualToString:](*p_originAnchorType, "isEqualToString:", CFSTR("CarPlayConnectedAnchor")))
    return CFSTR("FOCUS_SUGGESTION_REASON_Anchor_CarPlayConnected");
  if (-[NSString isEqualToString:](*p_originAnchorType, "isEqualToString:", CFSTR("CarPlayDisconnectedAnchor")))
    return CFSTR("FOCUS_SUGGESTION_REASON_Anchor_CarPlayDisconnected");
  if (-[NSString isEqualToString:](*p_originAnchorType, "isEqualToString:", CFSTR("LOIEntranceAnchor")))
    return CFSTR("FOCUS_SUGGESTION_REASON_Anchor_LOIEntrance");
  if (-[NSString isEqualToString:](*p_originAnchorType, "isEqualToString:", CFSTR("LOIExitAnchor")))
    return CFSTR("FOCUS_SUGGESTION_REASON_Anchor_LOIExit");
  if (-[NSString isEqualToString:](*p_originAnchorType, "isEqualToString:", CFSTR("WiredAudioDeviceConnectedAnchor")))
    return CFSTR("FOCUS_SUGGESTION_REASON_Anchor_WiredAudioDeviceConnected");
  if (-[NSString isEqualToString:](*p_originAnchorType, "isEqualToString:", CFSTR("WiredAudioDeviceDisconnectedAnchor")))
  {
    return CFSTR("FOCUS_SUGGESTION_REASON_Anchor_WiredAudioDeviceDisconnected");
  }
  if (-[NSString isEqualToString:](*p_originAnchorType, "isEqualToString:", CFSTR("ChargerConnectedAnchor")))
    return CFSTR("FOCUS_SUGGESTION_REASON_Anchor_ChargerConnected");
  if (-[NSString isEqualToString:](*p_originAnchorType, "isEqualToString:", CFSTR("MicrolocationVisitAnchor")))
    return CFSTR("FOCUS_SUGGESTION_REASON_Anchor_MicrolocationVisit");
  if (-[NSString isEqualToString:](*p_originAnchorType, "isEqualToString:", CFSTR("UpcomingCommuteToWorkAnchor")))
    return CFSTR("FOCUS_SUGGESTION_REASON_Anchor_UpcomingCommuteToWork");
  if (-[NSString isEqualToString:](*p_originAnchorType, "isEqualToString:", CFSTR("UpcomingCommuteFromWorkAnchor")))
    return CFSTR("FOCUS_SUGGESTION_REASON_Anchor_UpcomingCommuteFromWork");
  if (-[NSString isEqualToString:](*p_originAnchorType, "isEqualToString:", CFSTR("GymArrivalAnchor")))
    return CFSTR("FOCUS_SUGGESTION_REASON_Anchor_GymArrival");
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[ATXActivity _anchorSuggestionReasonLocalizationKey].cold.1((uint64_t)p_originAnchorType, v4, v5, v6, v7, v8, v9, v10);

  return 0;
}

- (id)_heuristicSuggestionReasonLocalizationKey
{
  unint64_t *p_activityType;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  int64_t origin;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  NSObject *v25;

  p_activityType = &self->_activityType;
  ATXActivityTypeToDNDModeSemanticType(self->_activityType, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
    v7 = 0;
    switch(v6)
    {
      case -1:
      case 8:
      case 9:
        goto LABEL_33;
      case 0:
        origin = self->_origin;
        if (origin == 13)
        {
          v7 = CFSTR("FOCUS_SUGGESTION_REASON_Heuristic_Default_ScreenRecording");
        }
        else
        {
          if (origin != 12)
            goto LABEL_29;
          v7 = CFSTR("FOCUS_SUGGESTION_REASON_Heuristic_Default_ScreenShare");
        }
        goto LABEL_33;
      case 1:
        v22 = self->_origin;
        if (v22 == 5)
        {
          v7 = CFSTR("FOCUS_SUGGESTION_REASON_Heuristic_Sleep_Sleep");
        }
        else
        {
          if (v22 != 16)
            goto LABEL_29;
          v7 = CFSTR("FOCUS_SUGGESTION_REASON_Heuristic_Sleep_BacklightData");
        }
        goto LABEL_33;
      case 2:
        if ((unint64_t)(self->_origin - 1) >= 3)
          goto LABEL_29;
        v7 = CFSTR("FOCUS_SUGGESTION_REASON_Heuristic_Driving_CoreMotion_OR_DNDWD_OR_CarPlay");
        goto LABEL_33;
      case 3:
        v23 = self->_origin;
        if (v23 == 7)
        {
          v7 = CFSTR("FOCUS_SUGGESTION_REASON_Heuristic_Exercise_WatchWorkout");
        }
        else
        {
          if (v23 != 15)
            goto LABEL_29;
          v7 = CFSTR("FOCUS_SUGGESTION_REASON_Heuristic_Exercise_NearbyGym");
        }
        goto LABEL_33;
      case 4:
        v24 = self->_origin;
        switch(v24)
        {
          case 4:
            v7 = CFSTR("FOCUS_SUGGESTION_REASON_Heuristic_Work_CoreRoutine");
            goto LABEL_33;
          case 8:
            v7 = CFSTR("FOCUS_SUGGESTION_REASON_Heuristic_Work_WFHClassifier");
            goto LABEL_33;
          case 9:
            v7 = CFSTR("FOCUS_SUGGESTION_REASON_Heuristic_Work_Calendar");
            goto LABEL_33;
        }
LABEL_29:
        __atxlog_handle_modes();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          -[ATXActivity _heuristicSuggestionReasonLocalizationKey].cold.3();

        break;
      case 5:
        if (self->_origin != 4)
          goto LABEL_29;
        v7 = CFSTR("FOCUS_SUGGESTION_REASON_Heuristic_PersonalTime_CoreRoutine");
        goto LABEL_33;
      case 6:
        if (self->_origin != 6)
          goto LABEL_29;
        v7 = CFSTR("FOCUS_SUGGESTION_REASON_Heuristic_Reading_AppLaunch");
        goto LABEL_33;
      case 7:
        if (self->_origin != 6)
          goto LABEL_29;
        v7 = CFSTR("FOCUS_SUGGESTION_REASON_Heuristic_Gaming_AppLaunch");
        goto LABEL_33;
      default:
        __atxlog_handle_modes();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          -[ATXActivity _heuristicSuggestionReasonLocalizationKey].cold.2(v6, v9, v16, v17, v18, v19, v20, v21);
        goto LABEL_8;
    }
  }
  else
  {
    __atxlog_handle_modes();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXActivity _heuristicSuggestionReasonLocalizationKey].cold.1((uint64_t)p_activityType, v9, v10, v11, v12, v13, v14, v15);
LABEL_8:

  }
  v7 = 0;
LABEL_33:

  return (id)v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  NSUInteger v9;
  NSUInteger v10;

  v3 = -[NSString hash](self->_modeUUID, "hash");
  v4 = -[NSString hash](self->_suggestionUUID, "hash");
  v5 = self->_activityType - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  v6 = self->_allowsSmartEntry - v5 + 32 * v5;
  v7 = self->_origin - v6 + 32 * v6;
  v8 = self->_location - v7 + 32 * v7;
  v9 = -[NSString hash](self->_originBundleId, "hash") - v8 + 32 * v8;
  v10 = -[NSString hash](self->_originAnchorType, "hash");
  return self->_shouldSuggestTriggers - (v10 - v9 + 32 * v9) + 32 * (v10 - v9 + 32 * v9);
}

- (BOOL)isEqual:(id)a3
{
  ATXActivity *v4;
  ATXActivity *v5;
  BOOL v6;

  v4 = (ATXActivity *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXActivity isEqualToATXActivity:](self, "isEqualToATXActivity:", v5);

  return v6;
}

- (BOOL)isEqualToATXActivity:(id)a3
{
  id v4;
  NSString *modeUUID;
  void *v6;
  NSString *suggestionUUID;
  void *v8;
  unint64_t activityType;
  int allowsSmartEntry;
  int64_t origin;
  void *location;
  NSString *originBundleId;
  NSString *v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  NSString *originAnchorType;
  NSString *v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  int shouldSuggestTriggers;
  BOOL v24;

  v4 = a3;
  modeUUID = self->_modeUUID;
  objc_msgSend(v4, "modeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(modeUUID) = -[NSString isEqualToString:](modeUUID, "isEqualToString:", v6);

  if (!(_DWORD)modeUUID)
    goto LABEL_21;
  suggestionUUID = self->_suggestionUUID;
  objc_msgSend(v4, "suggestionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(suggestionUUID) = -[NSString isEqualToString:](suggestionUUID, "isEqualToString:", v8);

  if (!(_DWORD)suggestionUUID)
    goto LABEL_21;
  activityType = self->_activityType;
  if (activityType != objc_msgSend(v4, "activityType"))
    goto LABEL_21;
  allowsSmartEntry = self->_allowsSmartEntry;
  if (allowsSmartEntry != objc_msgSend(v4, "allowsSmartEntry"))
    goto LABEL_21;
  origin = self->_origin;
  if (origin != objc_msgSend(v4, "origin"))
    goto LABEL_21;
  location = (void *)self->_location;
  if (location != (void *)objc_msgSend(v4, "location"))
    goto LABEL_21;
  originBundleId = self->_originBundleId;
  v14 = originBundleId;
  if (!originBundleId)
  {
    objc_msgSend(v4, "originBundleId");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_14;
    location = (void *)v15;
    v14 = self->_originBundleId;
  }
  objc_msgSend(v4, "originBundleId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NSString isEqualToString:](v14, "isEqualToString:", v16);

  if (originBundleId)
  {
    if (!v17)
      goto LABEL_21;
  }
  else
  {

    if (!v17)
      goto LABEL_21;
  }
LABEL_14:
  originAnchorType = self->_originAnchorType;
  v19 = originAnchorType;
  if (originAnchorType)
    goto LABEL_17;
  objc_msgSend(v4, "originAnchorType");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    location = (void *)v20;
    v19 = self->_originAnchorType;
LABEL_17:
    objc_msgSend(v4, "originAnchorType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[NSString isEqualToString:](v19, "isEqualToString:", v21);

    if (originAnchorType)
    {
      if (v22)
        goto LABEL_19;
    }
    else
    {

      if (v22)
        goto LABEL_19;
    }
LABEL_21:
    v24 = 0;
    goto LABEL_22;
  }
LABEL_19:
  shouldSuggestTriggers = self->_shouldSuggestTriggers;
  v24 = shouldSuggestTriggers == objc_msgSend(v4, "shouldSuggestTriggers");
LABEL_22:

  return v24;
}

- (NSString)modeUUID
{
  return self->_modeUUID;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (unint64_t)location
{
  return self->_location;
}

- (BOOL)shouldSuggestTriggers
{
  return self->_shouldSuggestTriggers;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (NSString)suggestionUUID
{
  return self->_suggestionUUID;
}

- (BOOL)allowsSmartEntry
{
  return self->_allowsSmartEntry;
}

- (int64_t)origin
{
  return self->_origin;
}

- (NSString)originBundleId
{
  return self->_originBundleId;
}

- (NSString)originAnchorType
{
  return self->_originAnchorType;
}

- (NSString)userModeName
{
  return self->_userModeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userModeName, 0);
  objc_storeStrong((id *)&self->_originAnchorType, 0);
  objc_storeStrong((id *)&self->_originBundleId, 0);
  objc_storeStrong((id *)&self->_suggestionUUID, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_modeUUID, 0);
}

- (void)localizedSuggestionReason
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[14];
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_9();
  v4 = v0;
  v5 = 2112;
  v6 = v1;
  _os_log_fault_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_FAULT, "ATXActivity - Nil localization key found for activity type %ld, origin %ld, and origin anchor type %@", v3, 0x20u);
}

- (void)_suggestionReasonLocalizationKey
{
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, a2, a3, "ATXActivity _suggestionReasonLocalizationKey: mode origin: %ld not captured in switch statement", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)_anchorSuggestionReasonLocalizationKey
{
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, a2, a3, "ATXActivity _anchorSuggestionReasonLocalizationKey - Unexpected _originAnchorType %@ found", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_heuristicSuggestionReasonLocalizationKey
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_9();
  v3 = v0;
  _os_log_fault_impl(&dword_1A49EF000, v1, OS_LOG_TYPE_FAULT, "Unexpected origin %ld found for DND semantic type: %ld", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
