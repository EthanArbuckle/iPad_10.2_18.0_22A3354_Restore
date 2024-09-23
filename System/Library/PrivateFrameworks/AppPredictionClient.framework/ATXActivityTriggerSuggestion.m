@implementation ATXActivityTriggerSuggestion

- (ATXActivityTriggerSuggestion)initWithActivity:(id)a3 activitySuggestionClient:(id)a4
{
  id v7;
  id v8;
  ATXActivityTriggerSuggestion *v9;
  ATXActivityTriggerSuggestion *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXActivityTriggerSuggestion;
  v9 = -[ATXActivityTriggerSuggestion init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activity, a3);
    objc_storeStrong((id *)&v10->_activitySuggestionClient, a4);
  }

  return v10;
}

- (NSString)uuidString
{
  return -[ATXActivity modeUUID](self->_activity, "modeUUID");
}

- (unint64_t)location
{
  return -[ATXActivity location](self->_activity, "location");
}

- (NSArray)triggers
{
  return -[ATXActivity triggers](self->_activity, "triggers");
}

- (NSString)localizedTriggerSuggestionText
{
  ATXActivitySuggestionClient *activitySuggestionClient;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  unint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;

  activitySuggestionClient = self->_activitySuggestionClient;
  -[ATXActivity triggers](self->_activity, "triggers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActivitySuggestionClient triggersToDNDModeConfigurationTriggers:](activitySuggestionClient, "triggersToDNDModeConfigurationTriggers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "count"))
  {
    __atxlog_handle_modes();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[ATXActivityTriggerSuggestion localizedTriggerSuggestionText].cold.1(v6, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_11;
  }
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    __atxlog_handle_modes();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[ATXActivityTriggerSuggestion localizedTriggerSuggestionText].cold.2(v6, v7, v8, v9, v10, v11, v12, v13);
    goto LABEL_11;
  }
  v21 = -[ATXActivity activityType](self->_activity, "activityType");
  ATXActivityTypeToDNDModeSemanticType(v21, v22);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ATXActivity userModeName](self->_activity, "userModeName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v23, "length"))
    {
      __atxlog_handle_modes();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        -[ATXActivityTriggerSuggestion localizedTriggerSuggestionText].cold.3(v25, v30, v31, v32, v33, v34, v35, v36);
      v28 = 0;
      goto LABEL_28;
    }
    v24 = -[NSObject integerValue](v6, "integerValue");
    objc_msgSend(v5, "firstObject");
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ATXActivityTriggerSuggestion _localizedStringForSmartActivationFromBundle:semanticType:userModeName:](self, "_localizedStringForSmartActivationFromBundle:semanticType:userModeName:", v26, v24, v23);
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[ATXActivityTriggerSuggestion _localizedStringForLocationTriggerFromBundle:semanticType:userModeName:](self, "_localizedStringForLocationTriggerFromBundle:semanticType:userModeName:", v26, v24, v23);
        v27 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[ATXActivityTriggerSuggestion _localizedStringForSleepingTriggerFromBundle:semanticType:userModeName:](self, "_localizedStringForSleepingTriggerFromBundle:semanticType:userModeName:", v26, v24, v23);
          v27 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[ATXActivityTriggerSuggestion _localizedStringForDrivingTriggerFromBundle:semanticType:userModeName:](self, "_localizedStringForDrivingTriggerFromBundle:semanticType:userModeName:", v26, v24, v23);
            v27 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[ATXActivityTriggerSuggestion _localizedStringForWorkoutTriggerFromBundle:semanticType:userModeName:](self, "_localizedStringForWorkoutTriggerFromBundle:semanticType:userModeName:", v26, v24, v23);
              v27 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                __atxlog_handle_modes();
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
                  -[ATXActivityTriggerSuggestion localizedTriggerSuggestionText].cold.4((uint64_t)v25, v37);

                v28 = 0;
                goto LABEL_27;
              }
              -[ATXActivityTriggerSuggestion _localizedStringForGameControllerTriggerFromBundle:semanticType:userModeName:](self, "_localizedStringForGameControllerTriggerFromBundle:semanticType:userModeName:", v26, v24, v23);
              v27 = objc_claimAutoreleasedReturnValue();
            }
          }
        }
      }
    }
    v28 = (void *)v27;
LABEL_27:

LABEL_28:
    goto LABEL_12;
  }
LABEL_11:
  v28 = 0;
LABEL_12:

  return (NSString *)v28;
}

- (id)_localizableStringForModeSemanticType:(int64_t)a3
{
  int64_t v4;
  NSObject *v5;
  uint64_t v6;

  v4 = a3 + 1;
  if ((unint64_t)(a3 + 1) < 0xB && ((0x5FFu >> v4) & 1) != 0)
    return (id)qword_1E4D5ABB0[v4];
  __atxlog_handle_modes();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[ATXActivityTriggerSuggestion _localizableStringForModeSemanticType:].cold.1(a3, v5, v6);

  return 0;
}

- (id)_localizedStringForSmartActivationFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a5;
  -[ATXActivityTriggerSuggestion _localizableStringForModeSemanticType:](self, "_localizableStringForModeSemanticType:", a4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E0CB3940];
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Use Smart Activation to turn on %@ automatically based on signals like your location, app usage, and others."), v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", v13, &stru_1E4D5DB30, 0);
  }
  else
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Use Smart Activation to turn on %@ Focus automatically based on signals like your location, app usage, and others."), &stru_1E4D5DB30, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v13, v9);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_localizedStringForLocationTriggerFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5
{
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  v7 = a3;
  -[ATXActivityTriggerSuggestion _localizableStringForModeSemanticType:](self, "_localizableStringForModeSemanticType:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 5)
  {
    v9 = CFSTR("Allow %@ to automatically turn on when you are at home?");
  }
  else
  {
    if (a4 != 4)
    {
      v11 = 0;
      goto LABEL_7;
    }
    v9 = CFSTR("Allow %@ to automatically turn on when you are at work?");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v10, &stru_1E4D5DB30, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v11;
}

- (id)_localizedStringForSleepingTriggerFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a3;
  -[ATXActivityTriggerSuggestion _localizableStringForModeSemanticType:](self, "_localizableStringForModeSemanticType:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Allow %@ to automatically turn on during your scheduled bedtime?"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E4D5DB30, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_localizedStringForDrivingTriggerFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a5;
  -[ATXActivityTriggerSuggestion _localizableStringForModeSemanticType:](self, "_localizableStringForModeSemanticType:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == -1)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Allow %@ Focus to automatically turn on when you are driving?"), &stru_1E4D5DB30, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v11, v9);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 2)
    {
      v14 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Allow %@ to automatically turn on when you are driving?"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", v11, &stru_1E4D5DB30, 0);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v12;

LABEL_7:
  return v14;
}

- (id)_localizedStringForWorkoutTriggerFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a5;
  -[ATXActivityTriggerSuggestion _localizableStringForModeSemanticType:](self, "_localizableStringForModeSemanticType:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == -1)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Allow %@ Focus to automatically turn on when you start a workout on your Apple Watch?"), &stru_1E4D5DB30, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v11, v9);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 3)
    {
      v14 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Allow %@ to automatically turn on when you start a workout on your Apple Watch?"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", v11, &stru_1E4D5DB30, 0);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v12;

LABEL_7:
  return v14;
}

- (id)_localizedStringForGameControllerTriggerFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a3;
  -[ATXActivityTriggerSuggestion _localizableStringForModeSemanticType:](self, "_localizableStringForModeSemanticType:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Allow %@ to automatically turn on when you connect a game controller?"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E4D5DB30, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_localizedStringForScreenActivityTriggerFromBundle:(id)a3 semanticType:(int64_t)a4 userModeName:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a3;
  -[ATXActivityTriggerSuggestion _localizableStringForModeSemanticType:](self, "_localizableStringForModeSemanticType:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Allow %@ to automatically turn on when you share or record your screen?"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", v10, &stru_1E4D5DB30, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (NSString)suggestionUUID
{
  return -[ATXActivity suggestionUUID](self->_activity, "suggestionUUID");
}

- (unint64_t)hash
{
  return -[ATXActivity hash](self->_activity, "hash");
}

- (BOOL)isEqual:(id)a3
{
  ATXActivityTriggerSuggestion *v4;
  ATXActivityTriggerSuggestion *v5;
  BOOL v6;

  v4 = (ATXActivityTriggerSuggestion *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXActivityTriggerSuggestion isEqualToATXActivityTriggerSuggestion:](self, "isEqualToATXActivityTriggerSuggestion:", v5);

  return v6;
}

- (BOOL)isEqualToATXActivityTriggerSuggestion:(id)a3
{
  ATXActivity *activity;
  void *v4;

  activity = self->_activity;
  objc_msgSend(a3, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(activity) = -[ATXActivity isEqual:](activity, "isEqual:", v4);

  return (char)activity;
}

- (ATXActivity)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_activitySuggestionClient, 0);
}

- (void)localizedTriggerSuggestionText
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_1_10(&dword_1A49EF000, a2, v5, "The trigger %{public}@ was not handled", (uint8_t *)&v6);

}

- (void)_localizableStringForModeSemanticType:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_1_10(&dword_1A49EF000, a2, a3, "Unhandled DND semantic type: %ld", (uint8_t *)&v3);
}

@end
