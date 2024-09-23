@implementation INStartWorkoutIntent

- (id)_intents_backgroundHandlingAssertionForBundleIdentifier:(id)a3 context:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  id v14;

  v7 = a3;
  if (!a4)
  {
    objc_msgSend(getAVSystemControllerClass(), "sharedAVSystemController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    getAVSystemController_AllowAppToInitiatePlaybackTemporarilyAttribute();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v10 = objc_msgSend(v8, "setAttribute:forKey:error:", v7, v9, &v14);
    v11 = v14;

    if ((v10 & 1) == 0)
      *a5 = objc_retainAutorelease(v11);

  }
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C9E3A8], "newAssertionForBundleIdentifier:withReason:level:", v7, CFSTR("SiriKit Background Workout"), 1);

  return v12;
}

- (id)localizeValueOfSlotDescription:(id)a3 withLocalizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "facadePropertyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("goalValue"));

  if (v9)
  {
    -[INStartWorkoutIntent goalValue](self, "goalValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    switch(-[INStartWorkoutIntent workoutGoalUnitType](self, "workoutGoalUnitType"))
    {
      case INWorkoutGoalUnitTypeInch:
        v13 = objc_alloc(MEMORY[0x1E0CB3758]);
        objc_msgSend(MEMORY[0x1E0CB3AD8], "inches");
        v14 = objc_claimAutoreleasedReturnValue();
        break;
      case INWorkoutGoalUnitTypeMeter:
        v13 = objc_alloc(MEMORY[0x1E0CB3758]);
        objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
        v14 = objc_claimAutoreleasedReturnValue();
        break;
      case INWorkoutGoalUnitTypeFoot:
        v13 = objc_alloc(MEMORY[0x1E0CB3758]);
        objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
        v14 = objc_claimAutoreleasedReturnValue();
        break;
      case INWorkoutGoalUnitTypeMile:
        v13 = objc_alloc(MEMORY[0x1E0CB3758]);
        objc_msgSend(MEMORY[0x1E0CB3AD8], "miles");
        v14 = objc_claimAutoreleasedReturnValue();
        break;
      case INWorkoutGoalUnitTypeYard:
        v13 = objc_alloc(MEMORY[0x1E0CB3758]);
        objc_msgSend(MEMORY[0x1E0CB3AD8], "yards");
        v14 = objc_claimAutoreleasedReturnValue();
        break;
      case INWorkoutGoalUnitTypeSecond:
        v13 = objc_alloc(MEMORY[0x1E0CB3758]);
        objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
        v14 = objc_claimAutoreleasedReturnValue();
        break;
      case INWorkoutGoalUnitTypeMinute:
        v13 = objc_alloc(MEMORY[0x1E0CB3758]);
        objc_msgSend(MEMORY[0x1E0CB3A88], "minutes");
        v14 = objc_claimAutoreleasedReturnValue();
        break;
      case INWorkoutGoalUnitTypeHour:
        v13 = objc_alloc(MEMORY[0x1E0CB3758]);
        objc_msgSend(MEMORY[0x1E0CB3A88], "hours");
        v14 = objc_claimAutoreleasedReturnValue();
        break;
      case INWorkoutGoalUnitTypeJoule:
        v13 = objc_alloc(MEMORY[0x1E0CB3758]);
        objc_msgSend(MEMORY[0x1E0CB3AB0], "joules");
        v14 = objc_claimAutoreleasedReturnValue();
        break;
      case INWorkoutGoalUnitTypeKiloCalorie:
        v13 = objc_alloc(MEMORY[0x1E0CB3758]);
        objc_msgSend(MEMORY[0x1E0CB3AB0], "kilocalories");
        v14 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_23;
    }
    v25 = (void *)v14;
    v26 = (void *)objc_msgSend(v13, "initWithDoubleValue:unit:", v14, v12);

    if (v26)
    {
      v27 = objc_alloc_init(MEMORY[0x1E0CB3760]);
      objc_msgSend(v27, "setUnitOptions:", 3);
      objc_msgSend(v7, "locale");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setLocale:", v28);

      objc_msgSend(v27, "setUnitStyle:", 3);
      objc_msgSend(v27, "stringFromMeasurement:", v26);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_25;
    }
    goto LABEL_23;
  }
  objc_msgSend(v6, "facadePropertyName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("workoutName"));

  if (!v16)
  {
    objc_msgSend(v6, "facadePropertyName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("isOpenEnded")))
    {
      -[INStartWorkoutIntent isOpenEnded](self, "isOpenEnded");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[INStartWorkoutIntent isOpenEnded](self, "isOpenEnded");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "BOOLValue");

        if (!v23)
        {
          v20 = &stru_1E2295770;
          goto LABEL_25;
        }
        INLocalizedStringWithLocalizer(CFSTR("com.apple.intents.WorkoutIsOpenEnded"), CFSTR("com.apple.intents.WorkoutIsOpenEnded"), v7);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
LABEL_23:
      v30.receiver = self;
      v30.super_class = (Class)INStartWorkoutIntent;
      -[INIntent localizeValueOfSlotDescription:withLocalizer:](&v30, sel_localizeValueOfSlotDescription_withLocalizer_, v6, v7);
      v24 = objc_claimAutoreleasedReturnValue();
LABEL_24:
      v20 = (__CFString *)v24;
      goto LABEL_25;
    }
LABEL_11:

    goto LABEL_23;
  }
  -[INStartWorkoutIntent workoutName](self, "workoutName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "spokenPhrase");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v18, "hasPrefix:", CFSTR("com.apple.intents.WorkoutNameIdentifier.")))
    goto LABEL_11;
  objc_msgSend(v18, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.intents.WorkoutNameIdentifier."), "length"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  INLocalizedStringWithLocalizer(v18, v19, v7);
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_25:
  return v20;
}

- (id)_titleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  -[INStartWorkoutIntent isOpenEnded](self, "isOpenEnded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", &unk_1E23E9A18);

  if (v9)
  {
    v26.receiver = self;
    v26.super_class = (Class)INStartWorkoutIntent;
    -[INIntent _titleWithLocalizer:fromBundleURL:](&v26, sel__titleWithLocalizer_fromBundleURL_, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[INStartWorkoutIntent workoutName](self, "workoutName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "spokenPhrase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = __tolower((char)objc_msgSend(v12, "characterAtIndex:", 0));
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("aeiou"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "characterIsMember:", (unsigned __int16)v13)
      && -[INStartWorkoutIntent workoutLocationType](self, "workoutLocationType") == INWorkoutLocationTypeUnknown)
    {
      v15 = objc_msgSend(v12, "isEqualToString:", CFSTR("Other"));
      v16 = CFSTR("Start an %1$@ workout for %2$@");
      if (v15)
        v16 = CFSTR("Start %1$@ workout for %2$@");
      v17 = v16;
      -[INStartWorkoutIntent workoutName](self, "workoutName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_intents_readableTitleWithLocalizer:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[INStartWorkoutIntent _goalValueIntentSlotDescription](self, "_goalValueIntentSlotDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[INStartWorkoutIntent localizeValueOfSlotDescription:withLocalizer:](self, "localizeValueOfSlotDescription:withLocalizer:", v20, v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0CB3940];
      INLocalizedStringWithLocalizer(v17, v17, v6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "localizedStringWithFormat:", v23, v19, v21);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25.receiver = self;
      v25.super_class = (Class)INStartWorkoutIntent;
      -[INIntent _titleWithLocalizer:fromBundleURL:](&v25, sel__titleWithLocalizer_fromBundleURL_, v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v10;
}

- (id)_goalValueIntentSlotDescription
{
  void *v2;
  void *v3;

  -[INIntent intentSlotDescriptions](self, "intentSlotDescriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_firstObjectPassingTest:", &__block_literal_global_26885);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __64__INStartWorkoutIntent_Summary___goalValueIntentSlotDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "facadePropertyName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("goalValue"));

  return v3;
}

+ (id)_ignoredParameters
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("associatedItems"), CFSTR("isBuiltInWorkoutType"), CFSTR("isVoiceOnly"), CFSTR("sequenceLabel"), CFSTR("customization"), 0);
}

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_metadata
{
  void *v2;
  void *v3;

  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 6;
}

- (id)_categoryVerb
{
  return CFSTR("Start");
}

- (INStartWorkoutIntent)initWithWorkoutName:(INSpeakableString *)workoutName goalValue:(NSNumber *)goalValue workoutGoalUnitType:(INWorkoutGoalUnitType)workoutGoalUnitType workoutLocationType:(INWorkoutLocationType)workoutLocationType isOpenEnded:(NSNumber *)isOpenEnded
{
  INSpeakableString *v12;
  NSNumber *v13;
  NSNumber *v14;
  INStartWorkoutIntent *v15;
  INStartWorkoutIntent *v16;
  objc_super v18;

  v12 = workoutName;
  v13 = goalValue;
  v14 = isOpenEnded;
  v18.receiver = self;
  v18.super_class = (Class)INStartWorkoutIntent;
  v15 = -[INIntent init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    -[INStartWorkoutIntent setWorkoutName:](v15, "setWorkoutName:", v12);
    -[INStartWorkoutIntent setGoalValue:](v16, "setGoalValue:", v13);
    -[INStartWorkoutIntent setWorkoutGoalUnitType:](v16, "setWorkoutGoalUnitType:", workoutGoalUnitType);
    -[INStartWorkoutIntent setWorkoutLocationType:](v16, "setWorkoutLocationType:", workoutLocationType);
    -[INStartWorkoutIntent setIsOpenEnded:](v16, "setIsOpenEnded:", v14);
  }

  return v16;
}

- (INSpeakableString)workoutName
{
  void *v2;
  void *v3;
  void *v4;

  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workoutName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpeakableString *)v4;
}

- (void)setWorkoutName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setWorkoutName:", v5);
}

- (NSNumber)goalValue
{
  void *v2;
  void *v3;
  void *v4;

  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "goalValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDouble(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setGoalValue:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDouble(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setGoalValue:", v5);
}

- (INWorkoutGoalUnitType)workoutGoalUnitType
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned int v6;
  INWorkoutGoalUnitType v7;

  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasWorkoutGoalUnitType");
  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "workoutGoalUnitType");
  if (((v6 < 0xA) & v4) != 0)
    v7 = v6 + 1;
  else
    v7 = INWorkoutGoalUnitTypeUnknown;

  return v7;
}

- (void)setWorkoutGoalUnitType:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 9)
    objc_msgSend(v4, "setHasWorkoutGoalUnitType:", 0);
  else
    objc_msgSend(v4, "setWorkoutGoalUnitType:", v3);

}

- (INWorkoutLocationType)workoutLocationType
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  INWorkoutLocationType v8;

  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasWorkoutLocationType");
  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "workoutLocationType");
  v7 = 2 * (v6 == 1);
  if (!v6)
    v7 = 1;
  if (v4)
    v8 = v7;
  else
    v8 = INWorkoutLocationTypeUnknown;

  return v8;
}

- (void)setWorkoutLocationType:(int64_t)a3
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a3 == 1)
    v3 = 0;
  else
    v3 = 0x7FFFFFFF;
  if (a3 == 2)
    v4 = 1;
  else
    v4 = v3;
  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v4 == 0x7FFFFFFF)
    objc_msgSend(v5, "setHasWorkoutLocationType:", 0);
  else
    objc_msgSend(v5, "setWorkoutLocationType:", v4);

}

- (NSNumber)isOpenEnded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasIsOpenEnded"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isOpenEnded"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setIsOpenEnded:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setIsOpenEnded:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasIsOpenEnded:", 0);

}

- (NSArray)associatedItems
{
  void *v2;
  void *v3;
  void *v4;

  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "associatedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromWorkoutAssociatedItems(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setAssociatedItems:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToWorkoutAssociatedItems(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAssociatedItems:", v5);
}

- (NSNumber)isBuiltInWorkoutType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasIsBuiltInWorkoutType"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isBuiltInWorkoutType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setIsBuiltInWorkoutType:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setIsBuiltInWorkoutType:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasIsBuiltInWorkoutType:", 0);

}

- (NSNumber)isVoiceOnly
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasIsVoiceOnly"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isVoiceOnly"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setIsVoiceOnly:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setIsVoiceOnly:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasIsVoiceOnly:", 0);

}

- (int64_t)sequenceLabel
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  int64_t v8;

  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSequenceLabel");
  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sequenceLabel");
  v7 = 2 * (v6 == 1);
  if (!v6)
    v7 = 1;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)setSequenceLabel:(int64_t)a3
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a3 == 1)
    v3 = 0;
  else
    v3 = 0x7FFFFFFF;
  if (a3 == 2)
    v4 = 1;
  else
    v4 = v3;
  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v4 == 0x7FFFFFFF)
    objc_msgSend(v5, "setHasSequenceLabel:", 0);
  else
    objc_msgSend(v5, "setSequenceLabel:", v4);

}

- (INWorkoutCustomization)customization
{
  void *v2;
  void *v3;
  void *v4;

  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromWorkoutCustomization(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INWorkoutCustomization *)v4;
}

- (void)setCustomization:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToWorkoutCustomization(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCustomization:", v5);
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  INWorkoutGoalUnitType v7;
  __CFString *v8;
  __CFString *v9;
  INWorkoutLocationType v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("workoutName");
  -[INStartWorkoutIntent workoutName](self, "workoutName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[0] = v4;
  v17[1] = CFSTR("goalValue");
  -[INStartWorkoutIntent goalValue](self, "goalValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = v6;
  v17[2] = CFSTR("workoutGoalUnitType");
  v7 = -[INStartWorkoutIntent workoutGoalUnitType](self, "workoutGoalUnitType");
  if ((unint64_t)(v7 - 1) > 9)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E228C560[v7 - 1];
  v9 = v8;
  v18[2] = v9;
  v17[3] = CFSTR("workoutLocationType");
  v10 = -[INStartWorkoutIntent workoutLocationType](self, "workoutLocationType");
  v11 = CFSTR("unknown");
  if (v10 == INWorkoutLocationTypeIndoor)
    v11 = CFSTR("indoor");
  if (v10 == INWorkoutLocationTypeOutdoor)
    v11 = CFSTR("outdoor");
  v12 = v11;
  v18[3] = v12;
  v17[4] = CFSTR("isOpenEnded");
  -[INStartWorkoutIntent isOpenEnded](self, "isOpenEnded");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)

  if (!v5)
  if (!v3)

  return v15;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  -[INStartWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "goalValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDoubleFromDouble(v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setGoalValue:", v10);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("Workouts");
}

- (id)verb
{
  return CFSTR("StartWorkout");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_intents_isExemptFromMulitWindowRequirementForInAppHandling
{
  return 1;
}

@end
