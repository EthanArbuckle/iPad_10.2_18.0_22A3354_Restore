@implementation HKDataMetadataWorkoutActivitySection

- (HKDataMetadataWorkoutActivitySection)initWithSample:(id)a3 displayTypeController:(id)a4 unitController:(id)a5 healthStore:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HKDataMetadataWorkoutActivitySection *v15;
  id *p_workout;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HKDataMetadataWorkoutActivitySection *v25;
  NSDateComponentsFormatter *v26;
  NSDateComponentsFormatter *dateFormatter;
  HKWorkoutDurationNumberFormatter *v28;
  HKWorkoutDurationNumberFormatter *durationFormatter;
  char v31;
  void *v32;
  id v33;
  id v34;
  objc_super v35;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v35.receiver = self;
  v35.super_class = (Class)HKDataMetadataWorkoutActivitySection;
  v15 = -[HKDataMetadataWorkoutActivitySection init](&v35, sel_init);
  if (!v15)
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    p_workout = (id *)&v15->_workout;
    objc_storeStrong((id *)&v15->_workout, a3);
    -[HKWorkout workoutActivities](v15->_workout, "workoutActivities");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      v33 = v12;
      v34 = v13;
      objc_msgSend(*p_workout, "workoutActivities");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (!v20)
      {
        v25 = 0;
        v12 = v33;
        goto LABEL_10;
      }
      objc_msgSend(*p_workout, "workoutActivities");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "count") == 1)
      {
        objc_msgSend(*p_workout, "workoutActivities");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "UUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*p_workout, "UUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v23, "isEqual:", v24);

        v12 = v33;
        if ((v31 & 1) != 0)
        {
          v25 = 0;
LABEL_10:
          v13 = v34;
          goto LABEL_14;
        }
      }
      else
      {

        v12 = v33;
      }
      objc_storeStrong((id *)&v15->_displayTypeController, a4);
      objc_storeStrong((id *)&v15->_unitPreferenceController, a5);
      objc_storeStrong((id *)&v15->_healthstore, a6);
      v26 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E0CB3570]);
      dateFormatter = v15->_dateFormatter;
      v15->_dateFormatter = v26;

      -[NSDateComponentsFormatter setZeroFormattingBehavior:](v15->_dateFormatter, "setZeroFormattingBehavior:", 0x10000);
      -[NSDateComponentsFormatter setAllowedUnits:](v15->_dateFormatter, "setAllowedUnits:", 224);
      v28 = objc_alloc_init(HKWorkoutDurationNumberFormatter);
      durationFormatter = v15->_durationFormatter;
      v15->_durationFormatter = v28;

      -[HKTimePeriodWithSecondsNumberFormatter setAllowMillisecondPrecision:](v15->_durationFormatter, "setAllowMillisecondPrecision:", 1);
      v13 = v34;
LABEL_13:
      v25 = v15;
      goto LABEL_14;
    }
  }
  v25 = 0;
LABEL_14:

  return v25;
}

- (id)sectionTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("WORKOUT_ACTIVITIES_NUMBERLESS_UNIT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)numberOfRowsInSection
{
  void *v2;
  unint64_t v3;

  -[HKWorkout workoutActivities](self->_workout, "workoutActivities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  HKDataMetadataSimpleTableViewCell *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("activitiesCell"));
  v6 = (HKDataMetadataSimpleTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[HKDataMetadataSimpleTableViewCell initWithReuseIdentifier:]([HKDataMetadataSimpleTableViewCell alloc], "initWithReuseIdentifier:", CFSTR("activitiesCell"));
    -[HKDataMetadataSimpleTableViewCell setAccessoryType:](v6, "setAccessoryType:", 1);
  }
  -[HKWorkout workoutActivities](self->_workout, "workoutActivities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB6DD0];
  objc_msgSend(v8, "workoutConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_stringFromWorkoutActivityType:", objc_msgSend(v11, "activityType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v12, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKDataMetadataSimpleTableViewCell titleTextLabel](v6, "titleTextLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  return v6;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  HKWorkout *workout;
  id v8;
  void *v9;
  HKWorkoutActivityViewController *v10;
  HKWorkout *v11;
  HKDisplayTypeController *displayTypeController;
  HKUnitPreferenceController *unitPreferenceController;
  void *v14;
  HKWorkoutActivityViewController *v15;
  id v16;

  workout = self->_workout;
  v8 = a4;
  -[HKWorkout workoutActivities](workout, "workoutActivities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v10 = [HKWorkoutActivityViewController alloc];
  v11 = self->_workout;
  displayTypeController = self->_displayTypeController;
  unitPreferenceController = self->_unitPreferenceController;
  -[HKDataMetadataWorkoutActivitySection healthstore](self, "healthstore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HKWorkoutActivityViewController initWithWorkout:activity:displayTypeController:unitController:healthStore:](v10, "initWithWorkout:activity:displayTypeController:unitController:healthStore:", v11, v16, displayTypeController, unitPreferenceController, v14);
  objc_msgSend(v8, "pushViewController:animated:", v15, 1);

}

- (HKWorkout)workout
{
  return self->_workout;
}

- (void)setWorkout:(id)a3
{
  objc_storeStrong((id *)&self->_workout, a3);
}

- (NSDateComponentsFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (HKWorkoutDurationNumberFormatter)durationFormatter
{
  return self->_durationFormatter;
}

- (void)setDurationFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_durationFormatter, a3);
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (void)setDisplayTypeController:(id)a3
{
  objc_storeStrong((id *)&self->_displayTypeController, a3);
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (void)setUnitPreferenceController:(id)a3
{
  objc_storeStrong((id *)&self->_unitPreferenceController, a3);
}

- (HKHealthStore)healthstore
{
  return self->_healthstore;
}

- (void)setHealthstore:(id)a3
{
  objc_storeStrong((id *)&self->_healthstore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthstore, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_workout, 0);
}

@end
