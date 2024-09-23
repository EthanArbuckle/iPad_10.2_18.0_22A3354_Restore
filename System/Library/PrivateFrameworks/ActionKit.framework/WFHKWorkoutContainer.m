@implementation WFHKWorkoutContainer

- (WFHKWorkoutContainer)initWithWorkout:(id)a3
{
  return -[WFHKWorkoutContainer initWithWorkout:distanceUnit:caloriesUnit:](self, "initWithWorkout:distanceUnit:caloriesUnit:", a3, 0, 0);
}

- (WFHKWorkoutContainer)initWithWorkout:(id)a3 distanceUnit:(id)a4 caloriesUnit:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFHKWorkoutContainer *v11;
  void *v12;
  objc_super v14;

  v8 = a4;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)WFHKWorkoutContainer;
  v10 = a3;
  v11 = -[WFHKWorkoutContainer init](&v14, sel_init);
  -[WFHKWorkoutContainer setWorkout:](v11, "setWorkout:", v10, v14.receiver, v14.super_class);

  -[WFHKWorkoutContainer workout](v11, "workout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[WFHKWorkoutContainer setDistanceUnit:](v11, "setDistanceUnit:", v8);
    -[WFHKWorkoutContainer setCaloriesUnit:](v11, "setCaloriesUnit:", v9);
  }

  return v11;
}

- (double)caloriesValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[WFHKWorkoutContainer workout](self, "workout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "totalEnergyBurned");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[WFHKWorkoutContainer caloriesUnit](self, "caloriesUnit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return 0.0;
    -[WFHKWorkoutContainer workout](self, "workout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "totalEnergyBurned");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHKWorkoutContainer caloriesUnit](self, "caloriesUnit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValueForUnit:", v8);
    v10 = v9;

  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (double)distanceValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[WFHKWorkoutContainer workout](self, "workout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "totalDistance");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[WFHKWorkoutContainer distanceUnit](self, "distanceUnit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return 0.0;
    -[WFHKWorkoutContainer workout](self, "workout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "totalDistance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHKWorkoutContainer distanceUnit](self, "distanceUnit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValueForUnit:", v8);
    v10 = v9;

  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (NSString)wfName
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  -[WFHKWorkoutContainer workout](self, "workout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFHealthKitHelper readableWorkoutActivityTypeFromWorkoutActivityType:](WFHealthKitHelper, "readableWorkoutActivityTypeFromWorkoutActivityType:", objc_msgSend(v4, "workoutActivityType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFHKWorkoutContainer workout](self, "workout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "totalDistance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[WFHKWorkoutContainer distanceUnit](self, "distanceUnit");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {

LABEL_8:
      v12 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("%@ Workout, no unit data"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringWithFormat:", v13, v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
  -[WFHKWorkoutContainer workout](self, "workout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "totalEnergyBurned");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[WFHKWorkoutContainer caloriesUnit](self, "caloriesUnit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {

    }
    if (!v11)
      goto LABEL_8;
  }
  else
  {

    if (v7)
    {

    }
  }
  v13 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v13, "setNumberStyle:", 1);
  objc_msgSend(v13, "setUsesGroupingSeparator:", 0);
  v15 = objc_alloc_init(MEMORY[0x24BDD14F8]);
  objc_msgSend(v15, "setUnitsStyle:", 1);
  v16 = (void *)MEMORY[0x24BDD16A8];
  WFLocalizedString(CFSTR("%1$@ Workout, %2$@"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHKWorkoutContainer workout](self, "workout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "duration");
  objc_msgSend(v15, "stringFromTimeInterval:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringWithFormat:", v17, v5, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFHKWorkoutContainer workout](self, "workout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "totalDistance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[WFHKWorkoutContainer workout](self, "workout");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "totalDistance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHKWorkoutContainer distanceUnit](self, "distanceUnit");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValueForUnit:", v25);
    v27 = v26;

    WFLocalizedString(CFSTR(", total distance %1$@ %2$@"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringFromNumber:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHKWorkoutContainer distanceUnit](self, "distanceUnit");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "unitString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appendFormat:", v28, v30, v32);

  }
  -[WFHKWorkoutContainer workout](self, "workout");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "totalEnergyBurned");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[WFHKWorkoutContainer workout](self, "workout");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "totalEnergyBurned");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHKWorkoutContainer caloriesUnit](self, "caloriesUnit");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "doubleValueForUnit:", v37);
    v39 = v38;

    WFLocalizedString(CFSTR(", total calories %1$@ %2$@"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringFromNumber:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHKWorkoutContainer caloriesUnit](self, "caloriesUnit");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "unitString");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appendFormat:", v40, v42, v44);

  }
  v14 = (void *)objc_msgSend(v20, "copy");

LABEL_17:
  return (NSString *)v14;
}

- (WFHKWorkoutContainer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFHKWorkoutContainer *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("distanceUnit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("caloriesUnit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFHKWorkoutContainer initWithWorkout:distanceUnit:caloriesUnit:](self, "initWithWorkout:distanceUnit:caloriesUnit:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFHKWorkoutContainer workout](self, "workout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("workout"));

  -[WFHKWorkoutContainer distanceUnit](self, "distanceUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("distanceUnit"));

  -[WFHKWorkoutContainer caloriesUnit](self, "caloriesUnit");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("caloriesUnit"));

}

- (HKWorkout)workout
{
  return self->_workout;
}

- (void)setWorkout:(id)a3
{
  objc_storeStrong((id *)&self->_workout, a3);
}

- (HKUnit)distanceUnit
{
  return self->_distanceUnit;
}

- (void)setDistanceUnit:(id)a3
{
  objc_storeStrong((id *)&self->_distanceUnit, a3);
}

- (HKUnit)caloriesUnit
{
  return self->_caloriesUnit;
}

- (void)setCaloriesUnit:(id)a3
{
  objc_storeStrong((id *)&self->_caloriesUnit, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caloriesUnit, 0);
  objc_storeStrong((id *)&self->_distanceUnit, 0);
  objc_storeStrong((id *)&self->_workout, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
