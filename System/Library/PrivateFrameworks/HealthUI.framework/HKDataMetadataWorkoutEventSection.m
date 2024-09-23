@implementation HKDataMetadataWorkoutEventSection

- (HKDataMetadataWorkoutEventSection)initWithSample:(id)a3
{
  id v5;
  HKDataMetadataWorkoutEventSection *v6;
  HKDataMetadataWorkoutEventSection *v7;
  void *v8;
  uint64_t v9;
  NSDateComponentsFormatter *v10;
  NSDateComponentsFormatter *dateFormatter;
  HKWorkoutDurationNumberFormatter *v12;
  HKWorkoutDurationNumberFormatter *durationFormatter;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKDataMetadataWorkoutEventSection;
  v6 = -[HKDataMetadataWorkoutEventSection init](&v15, sel_init);
  if (!v6)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v6->_workout, a3);
  -[HKWorkout workoutEvents](v6->_workout, "workoutEvents");
  v7 = (HKDataMetadataWorkoutEventSection *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HKWorkout workoutEvents](v6->_workout, "workoutEvents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E0CB3570]);
      dateFormatter = v6->_dateFormatter;
      v6->_dateFormatter = v10;

      -[NSDateComponentsFormatter setZeroFormattingBehavior:](v6->_dateFormatter, "setZeroFormattingBehavior:", 0x10000);
      -[NSDateComponentsFormatter setAllowedUnits:](v6->_dateFormatter, "setAllowedUnits:", 224);
      v12 = objc_alloc_init(HKWorkoutDurationNumberFormatter);
      durationFormatter = v6->_durationFormatter;
      v6->_durationFormatter = v12;

      -[HKTimePeriodWithSecondsNumberFormatter setAllowMillisecondPrecision:](v6->_durationFormatter, "setAllowMillisecondPrecision:", 1);
LABEL_6:
      v7 = v6;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (id)sectionTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("WORKOUT_EVENTS_NUMBERLESS_UNIT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)numberOfRowsInSection
{
  void *v2;
  unint64_t v3;

  -[HKWorkout workoutEvents](self->_workout, "workoutEvents");
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
  double v13;
  double v14;
  HKWorkoutDurationNumberFormatter *durationFormatter;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;

  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("eventCell"));
  v6 = (HKDataMetadataSimpleTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[HKDataMetadataSimpleTableViewCell initWithReuseIdentifier:]([HKDataMetadataSimpleTableViewCell alloc], "initWithReuseIdentifier:", CFSTR("eventCell"));
    -[HKDataMetadataSimpleTableViewCell setAccessoryType:](v6, "setAccessoryType:", 1);
  }
  -[HKWorkout workoutEvents](self->_workout, "workoutEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "type");
  _HKWorkoutEventTypeName();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v10, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dateInterval");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "duration");
  v14 = v13;

  if (v14 > 0.0)
  {
    durationFormatter = self->_durationFormatter;
    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "dateInterval");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "duration");
    objc_msgSend(v16, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKTimePeriodWithSecondsNumberFormatter stringFromNumber:displayType:unitController:](durationFormatter, "stringFromNumber:displayType:unitController:", v18, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v11, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v20;
  }
  objc_msgSend(v8, "dateInterval");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "startDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKWorkout startDate](self->_workout, "startDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeIntervalSinceDate:", v23);
  v25 = v24;

  -[HKDataMetadataSimpleTableViewCell titleTextLabel](v6, "titleTextLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setText:", v11);

  -[HKDataMetadataSimpleTableViewCell subtitleTextLabel](v6, "subtitleTextLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateComponentsFormatter stringFromTimeInterval:](self->_dateFormatter, "stringFromTimeInterval:", v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setText:", v28);

  return v6;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  HKWorkout *workout;
  id v7;
  void *v8;
  HKWorkoutEventDetailViewController *v9;
  id v10;

  workout = self->_workout;
  v7 = a4;
  -[HKWorkout workoutEvents](workout, "workoutEvents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v9 = -[HKWorkoutEventDetailViewController initWithEvent:]([HKWorkoutEventDetailViewController alloc], "initWithEvent:", v10);
  objc_msgSend(v7, "pushViewController:animated:", v9, 1);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_workout, 0);
}

@end
