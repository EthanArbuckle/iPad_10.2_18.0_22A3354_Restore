@implementation INResumeWorkoutIntent

- (id)localizeValueOfSlotDescription:(id)a3 withLocalizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "facadePropertyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("workoutName"));

  if (!v9)
    goto LABEL_5;
  -[INResumeWorkoutIntent workoutName](self, "workoutName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "spokenPhrase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v11, "hasPrefix:", CFSTR("com.apple.intents.WorkoutNameIdentifier.")))
  {

LABEL_5:
    v15.receiver = self;
    v15.super_class = (Class)INResumeWorkoutIntent;
    -[INIntent localizeValueOfSlotDescription:withLocalizer:](&v15, sel_localizeValueOfSlotDescription_withLocalizer_, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v11, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.intents.WorkoutNameIdentifier."), "length"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  INLocalizedStringWithLocalizer(v11, v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v13;
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

  -[INResumeWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INResumeWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INResumeWorkoutIntent)initWithWorkoutName:(INSpeakableString *)workoutName
{
  INSpeakableString *v4;
  INResumeWorkoutIntent *v5;
  INResumeWorkoutIntent *v6;
  objc_super v8;

  v4 = workoutName;
  v8.receiver = self;
  v8.super_class = (Class)INResumeWorkoutIntent;
  v5 = -[INIntent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[INResumeWorkoutIntent setWorkoutName:](v5, "setWorkoutName:", v4);

  return v6;
}

- (INSpeakableString)workoutName
{
  void *v2;
  void *v3;
  void *v4;

  -[INResumeWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INResumeWorkoutIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setWorkoutName:", v5);
}

- (id)_dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("workoutName");
  -[INResumeWorkoutIntent workoutName](self, "workoutName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)

  return v4;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INResumeWorkoutIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("Workouts");
}

- (id)verb
{
  return CFSTR("ResumeWorkout");
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
