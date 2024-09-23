@implementation WFStartWorkoutIntentAction

- (BOOL)allowsContinueInAppWhenRunningRemotely
{
  return 1;
}

- (BOOL)skipsProcessingHiddenParameters
{
  return 0;
}

- (id)appResource
{
  return 0;
}

- (id)parameterForSlot:(id)a3
{
  id v4;
  void *v5;
  char v6;
  int v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "wf_slotName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("goalValue"));
  v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("workoutGoalUnitType"));
  if ((v6 & 1) != 0 || v7)
  {
    -[WFStartWorkoutIntentAction goalParameter](self, "goalParameter");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFStartWorkoutIntentAction;
    -[WFHandleIntentAction parameterForSlot:](&v11, sel_parameterForSlot_, v4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, uint64_t, _QWORD);
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, uint64_t, _QWORD))a7;
  objc_msgSend(v12, "wf_slotName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("workoutName"));

  if (v18)
  {
    -[WFStartWorkoutIntentAction workoutNameForActivityType:](self, "workoutNameForActivityType:", v13);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v12, "wf_slotName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("goalValue"));

    if (v21)
    {
      -[WFStartWorkoutIntentAction goalValueFromValue:](self, "goalValueFromValue:", v13);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v12, "wf_slotName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("workoutGoalUnitType"));

      if (v23)
      {
        -[WFStartWorkoutIntentAction goalUnitTypeFromValue:](self, "goalUnitTypeFromValue:", v13);
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v12, "wf_slotName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("workoutLocationType"));

        if (!v25)
        {
          v27.receiver = self;
          v27.super_class = (Class)WFStartWorkoutIntentAction;
          -[WFHandleIntentAction resolveSlot:withProcessedValue:parameter:input:completion:](&v27, sel_resolveSlot_withProcessedValue_parameter_input_completion_, v12, v13, v14, v15, v16);
          goto LABEL_10;
        }
        -[WFStartWorkoutIntentAction location](self, "location");
        v19 = objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v26 = (void *)v19;
  v16[2](v16, v19, 0);

LABEL_10:
}

- (id)workoutNameForActivityType:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isCategorizedOtherWorkout"))
    v5 = objc_msgSend(v4, "auxiliaryTypeIdentifier");
  else
    v5 = objc_msgSend(v4, "identifier");
  v6 = v5;
  getWFActionsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v13 = 136315394;
    v14 = "-[WFStartWorkoutIntentAction workoutNameForActivityType:]";
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_INFO, "%s Retrieving an identifier for workout activity type %{public}@", (uint8_t *)&v13, 0x16u);
  }

  -[WFStartWorkoutIntentAction identifierForActivityType:](self, "identifierForActivityType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BDDA1A0]);
  objc_msgSend(v4, "localizedName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v8, v10, 0);

  return v11;
}

- (id)goalValueFromValue:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  -[WFStartWorkoutIntentAction goalParameter](self, "goalParameter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFStartWorkoutIntentAction isParameterHidden:](self, "isParameterHidden:", v5);

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    if (-[WFStartWorkoutIntentAction isKmGoal:](self, "isKmGoal:", v4))
    {
      -[WFStartWorkoutIntentAction kmGoalConvertedToM:](self, "kmGoalConvertedToM:", v4);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[WFStartWorkoutIntentAction isKjGoal:](self, "isKjGoal:", v4))
        -[WFStartWorkoutIntentAction kjGoalConvertedToJ:](self, "kjGoalConvertedToJ:", v4);
      else
        objc_msgSend(v4, "magnitude");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v8;
  }

  return v7;
}

- (BOOL)isKmGoal:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "unitString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("km"));

  return v4;
}

- (BOOL)isKjGoal:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "unitString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("kJ"));

  return v4;
}

- (id)kmGoalConvertedToM:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (objc_class *)MEMORY[0x24BDD1660];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "magnitude");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "doubleValue");
  v8 = v7;
  objc_msgSend(MEMORY[0x24BDD1928], "kilometers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithDoubleValue:unit:", v9, v8);

  objc_msgSend(MEMORY[0x24BDD1928], "miles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "measurementByConvertingToUnit:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v12, "doubleValue");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)kjGoalConvertedToJ:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (objc_class *)MEMORY[0x24BDD1660];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "magnitude");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "doubleValue");
  v8 = v7;
  objc_msgSend(MEMORY[0x24BDD1900], "kilojoules");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithDoubleValue:unit:", v9, v8);

  objc_msgSend(MEMORY[0x24BDD1900], "joules");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "measurementByConvertingToUnit:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v12, "doubleValue");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)goalUnitTypeFromValue:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WFStartWorkoutIntentAction goalParameter](self, "goalParameter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFStartWorkoutIntentAction isParameterHidden:](self, "isParameterHidden:", v5);

  if (v6)
  {
    v7 = &unk_24F93A5C8;
  }
  else if (-[WFStartWorkoutIntentAction isKmGoal:](self, "isKmGoal:", v4))
  {
    v7 = &unk_24F93A5E0;
  }
  else if (-[WFStartWorkoutIntentAction isKjGoal:](self, "isKjGoal:", v4))
  {
    v7 = &unk_24F93A5F8;
  }
  else
  {
    objc_msgSend(v4, "unitString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFStartWorkoutIntentAction workoutGoalUnitTypeNumberForUnitString:](self, "workoutGoalUnitTypeNumberForUnitString:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)location
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  -[WFStartWorkoutIntentAction processedParameters](self, "processedParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("workoutName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    if (objc_msgSend(v3, "isIndoor"))
      v5 = 2;
    else
      v5 = 1;
    objc_msgSend(v4, "numberWithInteger:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDD3200]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (int)objc_msgSend(v8, "intValue");

    if (v9 == 1)
    {
      v10 = &unk_24F93A610;
    }
    else if (v9 == 2)
    {
      v10 = &unk_24F93A628;
    }
    else
    {
      v10 = v6;
    }

  }
  else
  {
    v10 = &unk_24F93A5C8;
  }

  return v10;
}

- (id)workoutGoalUnitTypeNumberForUnitString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  +[WFStartWorkoutIntentAction unitStringsToWorkoutGoalUnits](WFStartWorkoutIntentAction, "unitStringsToWorkoutGoalUnits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = &unk_24F93A5C8;
  v7 = v6;

  return v7;
}

- (id)identifierForActivityType:(unint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  int v16;
  const char *v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  +[WFStartWorkoutIntentAction workoutActivityTypeToWorkoutIdentifier](WFStartWorkoutIntentAction, "workoutActivityTypeToWorkoutIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", &unk_24F93A6B8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFStartWorkoutIntentAction normalizedWorkoutActivityType:](self, "normalizedWorkoutActivityType:", a3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = v6;
    getWFActionsLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315394;
      v17 = "-[WFStartWorkoutIntentAction identifierForActivityType:]";
      v18 = 2050;
      v19 = a3;
      _os_log_impl(&dword_22D353000, v10, OS_LOG_TYPE_ERROR, "%s Failed to find an identifier for workout activity type %{public}lu", (uint8_t *)&v16, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = v6;
  v14 = v12;

  return v14;
}

- (id)selectedAppNotSupportedError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Unsupported Device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("This action can only be run on Apple Watch."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStartWorkoutIntentAction localizedName](self, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD1540];
  v9 = *MEMORY[0x24BEC4270];
  v10 = *MEMORY[0x24BDD0FC8];
  v14[0] = *MEMORY[0x24BDD0FD8];
  v14[1] = v10;
  v15[0] = v3;
  v15[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)normalizedWorkoutActivityType:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;

  v3 = 14;
  v4 = 37;
  if (a3 != 71)
    v4 = a3;
  if (a3 != 77)
    v3 = v4;
  if (a3 == 70)
    return 52;
  else
    return v3;
}

- (id)goalParameter
{
  void *v2;
  void *v3;
  id v4;

  -[WFStartWorkoutIntentAction parameterForKey:](self, "parameterForKey:", CFSTR("WorkoutGoal"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

- (id)workoutTypeParameter
{
  void *v2;
  void *v3;
  id v4;

  -[WFStartWorkoutIntentAction parameterForKey:](self, "parameterForKey:", CFSTR("workoutName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

- (BOOL)isParameterHidden:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "resourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "resourcesRequiredForDisplayAvailable"))
    v5 = objc_msgSend(v3, "isHidden");
  else
    v5 = 1;

  return v5;
}

- (void)initializeParameters
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFStartWorkoutIntentAction;
  -[WFHandleSystemIntentAction initializeParameters](&v5, sel_initializeParameters);
  -[WFStartWorkoutIntentAction goalParameter](self, "goalParameter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStartWorkoutIntentAction workoutTypeParameter](self, "workoutTypeParameter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAction:", self);
  objc_msgSend(v4, "setAction:", self);

}

- (void)wasAddedToWorkflow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFStartWorkoutIntentAction;
  -[WFStartWorkoutIntentAction wasAddedToWorkflow:](&v5, sel_wasAddedToWorkflow_, a3);
  -[WFStartWorkoutIntentAction resourceManager](self, "resourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:selector:", self, sel_resourceAvailabilityChanged);

  -[WFStartWorkoutIntentAction resourceAvailabilityChanged](self, "resourceAvailabilityChanged");
}

- (void)wasRemovedFromWorkflow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFStartWorkoutIntentAction;
  -[WFStartWorkoutIntentAction wasRemovedFromWorkflow:](&v5, sel_wasRemovedFromWorkflow_, a3);
  -[WFStartWorkoutIntentAction resourceManager](self, "resourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:selector:", self, sel_resourceAvailabilityChanged);

}

- (void)resourceAvailabilityChanged
{
  id v2;

  -[WFStartWorkoutIntentAction goalParameter](self, "goalParameter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatePossibleUnits");

}

- (id)actionForAppIdentifier:(id)a3
{
  return 0;
}

+ (id)unitStringsToWorkoutGoalUnits
{
  return &unk_24F93C680;
}

+ (id)workoutActivityTypeToWorkoutIdentifier
{
  _QWORD v3[77];
  _QWORD v4[78];

  v4[77] = *MEMORY[0x24BDAC8D0];
  v3[0] = &unk_24F93A6D0;
  v3[1] = &unk_24F93A6E8;
  v4[0] = CFSTR("com.apple.intents.WorkoutNameIdentifier.AmericanFootball");
  v4[1] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Archery");
  v3[2] = &unk_24F93A700;
  v3[3] = &unk_24F93A718;
  v4[2] = CFSTR("com.apple.intents.WorkoutNameIdentifier.AustralianFootball");
  v4[3] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Badminton");
  v3[4] = &unk_24F93A730;
  v3[5] = &unk_24F93A748;
  v4[4] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Barre");
  v4[5] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Baseball");
  v3[6] = &unk_24F93A760;
  v3[7] = &unk_24F93A778;
  v4[6] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Basketball");
  v4[7] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Bowling");
  v3[8] = &unk_24F93A790;
  v3[9] = &unk_24F93A7A8;
  v4[8] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Boxing");
  v4[9] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Climbing");
  v3[10] = &unk_24F93A7C0;
  v3[11] = &unk_24F93A7D8;
  v4[10] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Cooldown");
  v4[11] = CFSTR("com.apple.intents.WorkoutNameIdentifier.CoreTraining");
  v3[12] = &unk_24F93A7F0;
  v3[13] = &unk_24F93A808;
  v4[12] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Cricket");
  v4[13] = CFSTR("com.apple.intents.WorkoutNameIdentifier.CrossCountrySkiing");
  v3[14] = &unk_24F93A820;
  v3[15] = &unk_24F93A838;
  v4[14] = CFSTR("com.apple.intents.WorkoutNameIdentifier.CrossTraining");
  v4[15] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Curling");
  v3[16] = &unk_24F93A850;
  v3[17] = &unk_24F93A868;
  v4[16] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Cycle");
  v4[17] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Dance");
  v3[18] = &unk_24F93A880;
  v3[19] = &unk_24F93A898;
  v4[18] = CFSTR("com.apple.intents.WorkoutNameIdentifier.DiscSports");
  v4[19] = CFSTR("com.apple.intents.WorkoutNameIdentifier.DownhillSkiing");
  v3[20] = &unk_24F93A8B0;
  v3[21] = &unk_24F93A8C8;
  v4[20] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Elliptical");
  v4[21] = CFSTR("com.apple.intents.WorkoutNameIdentifier.EquestrianSports");
  v3[22] = &unk_24F93A8E0;
  v3[23] = &unk_24F93A8F8;
  v4[22] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Fencing");
  v4[23] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Fishing");
  v3[24] = &unk_24F93A910;
  v3[25] = &unk_24F93A928;
  v4[24] = CFSTR("com.apple.intents.WorkoutNameIdentifier.FitnessGaming");
  v4[25] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Flexibility");
  v3[26] = &unk_24F93A940;
  v3[27] = &unk_24F93A958;
  v4[26] = CFSTR("com.apple.intents.WorkoutNameIdentifier.FunctionalStrengthTraining");
  v4[27] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Golf");
  v3[28] = &unk_24F93A970;
  v3[29] = &unk_24F93A988;
  v4[28] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Gymnastics");
  v4[29] = CFSTR("com.apple.intents.WorkoutNameIdentifier.HandCycling");
  v3[30] = &unk_24F93A9A0;
  v3[31] = &unk_24F93A9B8;
  v4[30] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Handball");
  v4[31] = CFSTR("com.apple.intents.WorkoutNameIdentifier.HighIntensityIntervalTraining");
  v3[32] = &unk_24F93A9D0;
  v3[33] = &unk_24F93A9E8;
  v4[32] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Hike");
  v4[33] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Hockey");
  v3[34] = &unk_24F93AA00;
  v3[35] = &unk_24F93AA18;
  v4[34] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Hunting");
  v4[35] = CFSTR("com.apple.intents.WorkoutNameIdentifier.JumpRope");
  v3[36] = &unk_24F93AA30;
  v3[37] = &unk_24F93AA48;
  v4[36] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Kickboxing");
  v4[37] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Lacrosse");
  v3[38] = &unk_24F93AA60;
  v3[39] = &unk_24F93AA78;
  v4[38] = CFSTR("com.apple.intents.WorkoutNameIdentifier.MartialArts");
  v4[39] = CFSTR("com.apple.intents.WorkoutNameIdentifier.MindAndBody");
  v3[40] = &unk_24F93AA90;
  v3[41] = &unk_24F93A6B8;
  v4[40] = CFSTR("com.apple.intents.WorkoutNameIdentifier.MixedCardio");
  v4[41] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Other");
  v3[42] = &unk_24F93AAA8;
  v3[43] = &unk_24F93AAC0;
  v4[42] = CFSTR("com.apple.intents.WorkoutNameIdentifier.PaddleSports");
  v4[43] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Pickleball");
  v3[44] = &unk_24F93AAD8;
  v3[45] = &unk_24F93AAF0;
  v4[44] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Pilates");
  v4[45] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Play");
  v3[46] = &unk_24F93AB08;
  v3[47] = &unk_24F93AB20;
  v4[46] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Racquetball");
  v4[47] = CFSTR("com.apple.intents.WorkoutNameIdentifier.PreparationAndRecovery");
  v3[48] = &unk_24F93AB38;
  v3[49] = &unk_24F93AB50;
  v4[48] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Rower");
  v4[49] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Rugby");
  v3[50] = &unk_24F93AB68;
  v3[51] = &unk_24F93AB80;
  v4[50] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Run");
  v4[51] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Sailing");
  v3[52] = &unk_24F93AB98;
  v3[53] = &unk_24F93ABB0;
  v4[52] = CFSTR("com.apple.intents.WorkoutNameIdentifier.SkatingSports");
  v4[53] = CFSTR("com.apple.intents.WorkoutNameIdentifier.SnowSports");
  v3[54] = &unk_24F93ABC8;
  v3[55] = &unk_24F93ABE0;
  v4[54] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Snowboarding");
  v4[55] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Soccer");
  v3[56] = &unk_24F93ABF8;
  v3[57] = &unk_24F93AC10;
  v4[56] = CFSTR("com.apple.intents.WorkoutNameIdentifier.SocialDance");
  v4[57] = CFSTR("com.apple.intents.WorkoutNameIdentifier.CardioDance");
  v3[58] = &unk_24F93AC28;
  v3[59] = &unk_24F93AC40;
  v4[58] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Softball");
  v4[59] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Squash");
  v3[60] = &unk_24F93AC58;
  v3[61] = &unk_24F93AC70;
  v4[60] = CFSTR("com.apple.intents.WorkoutNameIdentifier.StairsClimbing");
  v4[61] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Stairs");
  v3[62] = &unk_24F93AC88;
  v3[63] = &unk_24F93ACA0;
  v4[62] = CFSTR("com.apple.intents.WorkoutNameIdentifier.StepTraining");
  v4[63] = CFSTR("com.apple.intents.WorkoutNameIdentifier.SurfingSports");
  v3[64] = &unk_24F93ACB8;
  v4[64] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Swim");
  v3[65] = &unk_24F93ACD0;
  v4[65] = CFSTR("com.apple.intents.WorkoutNameIdentifier.TableTennis");
  v3[66] = &unk_24F93ACE8;
  v4[66] = CFSTR("com.apple.intents.WorkoutNameIdentifier.TaiChi");
  v3[67] = &unk_24F93AD00;
  v4[67] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Tennis");
  v3[68] = &unk_24F93AD18;
  v4[68] = CFSTR("com.apple.intents.WorkoutNameIdentifier.TrackAndField");
  v3[69] = &unk_24F93AD30;
  v4[69] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Volleyball");
  v3[70] = &unk_24F93AD48;
  v4[70] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Walk");
  v3[71] = &unk_24F93AD60;
  v4[71] = CFSTR("com.apple.intents.WorkoutNameIdentifier.WaterFitness");
  v3[72] = &unk_24F93AD78;
  v4[72] = CFSTR("com.apple.intents.WorkoutNameIdentifier.WaterPolo");
  v3[73] = &unk_24F93AD90;
  v4[73] = CFSTR("com.apple.intents.WorkoutNameIdentifier.WaterSports");
  v3[74] = &unk_24F93ADA8;
  v4[74] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Wrestling");
  v3[75] = &unk_24F93ADC0;
  v4[75] = CFSTR("com.apple.intents.WorkoutNameIdentifier.Yoga");
  v3[76] = &unk_24F93ADD8;
  v4[76] = CFSTR("com.apple.intents.WorkoutNameIdentifier.TraditionalStrengthTraining");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 77);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
