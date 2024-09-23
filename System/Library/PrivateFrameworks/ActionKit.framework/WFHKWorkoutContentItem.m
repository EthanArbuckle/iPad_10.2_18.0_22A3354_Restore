@implementation WFHKWorkoutContentItem

- (id)readableActivityType
{
  void *v2;
  void *v3;

  -[WFHKWorkoutContentItem workout](self, "workout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFHealthKitHelper readableWorkoutActivityTypeFromWorkoutActivityType:](WFHealthKitHelper, "readableWorkoutActivityTypeFromWorkoutActivityType:", objc_msgSend(v2, "workoutActivityType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)workout
{
  void *v2;
  void *v3;

  -[WFHKWorkoutContentItem workoutContainer](self, "workoutContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)workoutContainer
{
  return (id)-[WFHKWorkoutContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)sourceName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFHKWorkoutContentItem workout](self, "workout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceRevision");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  void *v7;
  void *v8;
  void (*v9)(void);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
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
  void *v26;
  void *v27;
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
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v41 = a3;
  v7 = (void *)objc_opt_new();
  if ((Class)objc_opt_class() == a5)
  {
    -[WFHKWorkoutContentItem workout](self, "workout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFHKWorkoutContentItem workout](self, "workout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "isEqualToDate:", v12))
    {
      v13 = (void *)MEMORY[0x24BE19590];
      v14 = CFSTR("Workout Date");
      v15 = v8;
    }
    else
    {
      if (v8)
      {
        objc_msgSend(MEMORY[0x24BE19590], "object:named:", v8, CFSTR("Sample Start Date"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v38);

      }
      if (!v12)
        goto LABEL_17;
      v13 = (void *)MEMORY[0x24BE19590];
      v14 = CFSTR("Sample End Date");
      v15 = v12;
    }
    objc_msgSend(v13, "object:named:", v15, v14);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v39);

LABEL_17:
    v40 = (void *)objc_msgSend(v7, "copy");
    (*((void (**)(id, void *, _QWORD))v41 + 2))(v41, v40, 0);

    goto LABEL_18;
  }
  if ((Class)objc_opt_class() == a5)
  {
    v16 = (void *)MEMORY[0x24BE19590];
    v17 = (void *)MEMORY[0x24BDD16E0];
    -[WFHKWorkoutContentItem workoutContainer](self, "workoutContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "workout");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "duration");
    objc_msgSend(v17, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "object:named:", v20, CFSTR("Duration"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v21);

    -[WFHKWorkoutContentItem workoutContainer](self, "workoutContainer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "workout");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "totalEnergyBurned");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = (void *)MEMORY[0x24BE19590];
      v26 = (void *)MEMORY[0x24BDD16E0];
      -[WFHKWorkoutContentItem workoutContainer](self, "workoutContainer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "caloriesValue");
      objc_msgSend(v26, "numberWithDouble:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "object:named:", v28, CFSTR("Calories Value"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v29);

    }
    -[WFHKWorkoutContentItem workoutContainer](self, "workoutContainer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "workout");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "totalDistance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = (void *)MEMORY[0x24BE19590];
      v34 = (void *)MEMORY[0x24BDD16E0];
      -[WFHKWorkoutContentItem workoutContainer](self, "workoutContainer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "distanceValue");
      objc_msgSend(v34, "numberWithDouble:");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "object:named:", v36, CFSTR("Distance Value"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v37);

    }
    v8 = (void *)objc_msgSend(v7, "copy");
    v9 = (void (*)(void))*((_QWORD *)v41 + 2);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void (*)(void))*((_QWORD *)v41 + 2);
  }
  v9();
LABEL_18:

}

+ (id)itemWithWorkout:(id)a3
{
  return (id)objc_msgSend(a1, "itemWithWorkout:distanceUnit:caloriesUnit:", a3, 0, 0);
}

+ (id)itemWithWorkout:(id)a3 distanceUnit:(id)a4 caloriesUnit:(id)a5
{
  id v7;
  id v8;
  id v9;
  WFHKWorkoutContainer *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[WFHKWorkoutContainer initWithWorkout:distanceUnit:caloriesUnit:]([WFHKWorkoutContainer alloc], "initWithWorkout:distanceUnit:caloriesUnit:", v9, v8, v7);

  +[WFContentItem itemWithObject:](WFHKWorkoutContentItem, "itemWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)propertyBuilders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[10];

  v32[8] = *MEMORY[0x24BDAC8D0];
  +[WFHealthKitHelper readableWorkoutActivityTypes](WFHealthKitHelper, "readableWorkoutActivityTypes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Activity Type"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyPath:name:class:", CFSTR("readableActivityType"), v31, objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "primary:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "possibleValues:", v30);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v27;
  v3 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Calories"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath:name:class:", CFSTR("workoutContainer.caloriesValue"), v26, objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v25;
  v4 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Distance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPath:name:class:", CFSTR("workoutContainer.distanceValue"), v24, objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v23;
  v5 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Calories Unit"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyPath:name:class:", CFSTR("workoutContainer.caloriesUnit.unitString"), v22, objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v21;
  v6 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Distance Unit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyPath:name:class:", CFSTR("workoutContainer.distanceUnit.unitString"), v7, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v8;
  v9 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Start Date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyPath:name:class:", CFSTR("workout.startDate"), v10, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v11;
  v12 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("End Date"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "keyPath:name:class:", CFSTR("workout.endDate"), v13, objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v14;
  v15 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Source"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "keyPath:name:class:", CFSTR("sourceName"), v16, objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "possibleValues:", MEMORY[0x24BDBD1A8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Workout sample"), CFSTR("Workout sample"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Workout samples"), CFSTR("Workout samples"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Workout samples"));
}

+ (id)contentCategories
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
