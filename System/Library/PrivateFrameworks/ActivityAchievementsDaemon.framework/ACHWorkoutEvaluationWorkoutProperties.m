@implementation ACHWorkoutEvaluationWorkoutProperties

- (ACHWorkoutEvaluationWorkoutProperties)initWithWorkout:(id)a3
{
  id v4;
  ACHWorkoutEvaluationWorkoutProperties *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  _BOOL4 v24;
  int v25;
  BOOL v26;
  BOOL v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  BOOL v42;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)ACHWorkoutEvaluationWorkoutProperties;
  v5 = -[ACHWorkoutEvaluationWorkoutProperties init](&v43, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "workoutActivityType");
    objc_msgSend(v4, "duration");
    v5->_duration = v6;
    objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3340]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statisticsForType:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sumQuantity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValueForUnit:", v10);
    v5->_kilocalories = v11;

    objc_msgSend(v4, "totalDistance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValueForUnit:", v13);
    v5->_kilometers = v14;

    objc_msgSend(v4, "totalDistance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValueForUnit:", v16);
    v5->_meters = v17;

    objc_msgSend(v4, "fi_elevationGain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "unitFromString:", CFSTR("cm"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValueForUnit:", v19);
    v5->_elevationGained = v20;

    objc_msgSend(v4, "fi_elevationGain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValueForUnit:", v22);
    v5->_elevationGainedInMeters = v23;

    v5->_isDuathlon = -[ACHWorkoutEvaluationWorkoutProperties _workoutIsDuathlon:](v5, "_workoutIsDuathlon:", v4);
    v24 = -[ACHWorkoutEvaluationWorkoutProperties _workoutIsTriathlon:swimmingDistanceInKilometers:cyclingDistanceInKilometers:runningDistanceInKilometers:](v5, "_workoutIsTriathlon:swimmingDistanceInKilometers:cyclingDistanceInKilometers:runningDistanceInKilometers:", v4, *MEMORY[0x24BE013C8], *MEMORY[0x24BE013B8], *MEMORY[0x24BE013C0]);
    v5->_isFullDistanceTriathlon = v24;
    if (v24)
    {
      v25 = 0;
      v5->_isHalfDistanceTriathlon = 0;
    }
    else
    {
      v26 = -[ACHWorkoutEvaluationWorkoutProperties _workoutIsTriathlon:swimmingDistanceInKilometers:cyclingDistanceInKilometers:runningDistanceInKilometers:](v5, "_workoutIsTriathlon:swimmingDistanceInKilometers:cyclingDistanceInKilometers:runningDistanceInKilometers:", v4, *MEMORY[0x24BE013F0], *MEMORY[0x24BE013E0], *MEMORY[0x24BE013E8]);
      v5->_isHalfDistanceTriathlon = v26;
      if (v26)
      {
        v25 = 1;
      }
      else
      {
        if (!v5->_isFullDistanceTriathlon)
        {
          v42 = -[ACHWorkoutEvaluationWorkoutProperties _workoutIsTriathlon:swimmingDistanceInKilometers:cyclingDistanceInKilometers:runningDistanceInKilometers:](v5, "_workoutIsTriathlon:swimmingDistanceInKilometers:cyclingDistanceInKilometers:runningDistanceInKilometers:", v4, *MEMORY[0x24BE01330], *MEMORY[0x24BE01320], *MEMORY[0x24BE01328]);
          v5->_isFiftyKilometerTriathlon = v42;
          if (v42 || v5->_isHalfDistanceTriathlon)
            goto LABEL_10;
LABEL_9:
          if (!v5->_isFullDistanceTriathlon)
          {
            v27 = -[ACHWorkoutEvaluationWorkoutProperties _workoutIsTriathlon:swimmingDistanceInKilometers:cyclingDistanceInKilometers:runningDistanceInKilometers:](v5, "_workoutIsTriathlon:swimmingDistanceInKilometers:cyclingDistanceInKilometers:runningDistanceInKilometers:", v4, *MEMORY[0x24BE015C0], *MEMORY[0x24BE015B0], *MEMORY[0x24BE015B8]);
            goto LABEL_11;
          }
LABEL_10:
          v27 = 0;
LABEL_11:
          v5->_isSprintTriathlon = v27;
          v5->_isDuathlon = -[ACHWorkoutEvaluationWorkoutProperties _workoutIsDuathlon:](v5, "_workoutIsDuathlon:", v4);
          objc_msgSend(v4, "aad_best5KDuration");
          v5->_best5KDuration = v28;
          objc_msgSend(v4, "aad_best10KDuration");
          v5->_best10KDuration = v29;
          objc_msgSend(v4, "aad_bestWheelchair5KDuration");
          v5->_bestWheelchair5KDuration = v30;
          objc_msgSend(v4, "aad_bestWheelchair10KDuration");
          v5->_bestWheelchair10KDuration = v31;
          objc_msgSend(v4, "aad_bestHalfMarathonDuration");
          v5->_bestHalfMarathonDuration = v32;
          objc_msgSend(v4, "aad_bestMarathonDuration");
          v5->_bestMarathonDuration = v33;
          objc_msgSend(v4, "aad_bestWheelchairHalfMarathonDuration");
          v5->_bestWheelchairHalfMarathonDuration = v34;
          objc_msgSend(v4, "aad_bestWheelchairMarathonDuration");
          v5->_bestWheelchairMarathonDuration = v35;
          objc_msgSend(v4, "sourceRevision");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "source");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v5->_isFirstParty = objc_msgSend(v37, "_hasFirstPartyBundleID");

          objc_msgSend(v4, "metadata");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x24BDD31C0]);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "BOOLValue");

          v5->_isIndoor = v40;
          goto LABEL_12;
        }
        v25 = 0;
      }
    }
    v5->_isFiftyKilometerTriathlon = 0;
    if (v25)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_12:

  return v5;
}

- (id)_nonMetaActivitiesForWorkout:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "workoutActivities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_filter:", &__block_literal_global_13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __70__ACHWorkoutEvaluationWorkoutProperties__nonMetaActivitiesForWorkout___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "activityType") == 82)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "workoutConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "activityType") != 83;

  }
  return v4;
}

- (BOOL)_workoutIsDuathlon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  BOOL v19;
  BOOL v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  if (objc_msgSend(v4, "workoutActivityType") == 82)
  {
    -[ACHWorkoutEvaluationWorkoutProperties _nonMetaActivitiesForWorkout:](self, "_nonMetaActivitiesForWorkout:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") != 3)
    {
      LOBYTE(v18) = 0;
LABEL_26:

      goto LABEL_27;
    }
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "workoutConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "activityType") == 37)
    {
      objc_msgSend(v7, "workoutConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "activityType") == 13)
      {
        objc_msgSend(v8, "workoutConfiguration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "activityType");

        if (v12 != 37)
        {
          LOBYTE(v18) = 0;
LABEL_25:

          goto LABEL_26;
        }
        objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 9);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *MEMORY[0x24BE01308];
        objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v9, *MEMORY[0x24BE01308]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v9, *MEMORY[0x24BE01300]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v9, v13);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3560]);
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3530]);
        v15 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "statisticsForType:", v14);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "sumQuantity");
        v16 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v15;
        objc_msgSend(v7, "statisticsForType:", v15);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "sumQuantity");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)v14;
        objc_msgSend(v8, "statisticsForType:", v14);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "sumQuantity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)v16;
        if (v16)
          v18 = objc_msgSend(v10, "compare:", v16) != 1;
        else
          v18 = 0;
        if (v30)
          v19 = objc_msgSend(v29, "compare:") != 1;
        else
          v19 = 0;
        if (v17)
          v20 = objc_msgSend(v28, "compare:", v17) != 1;
        else
          v20 = 0;
        if (v18)
          LOBYTE(v18) = v19 && v20;

      }
      else
      {
        LOBYTE(v18) = 0;
      }

    }
    else
    {
      LOBYTE(v18) = 0;
    }

    goto LABEL_25;
  }
  LOBYTE(v18) = 0;
LABEL_27:

  return v18;
}

- (BOOL)_workoutIsTriathlon:(id)a3 swimmingDistanceInKilometers:(double)a4 cyclingDistanceInKilometers:(double)a5 runningDistanceInKilometers:(double)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  BOOL v25;
  BOOL v26;
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

  v10 = a3;
  if (objc_msgSend(v10, "workoutActivityType") == 82)
  {
    -[ACHWorkoutEvaluationWorkoutProperties _nonMetaActivitiesForWorkout:](self, "_nonMetaActivitiesForWorkout:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") != 3)
    {
      LOBYTE(v24) = 0;
LABEL_26:

      goto LABEL_27;
    }
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "workoutConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "activityType") == 46)
    {
      objc_msgSend(v13, "workoutConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "activityType") == 13)
      {
        objc_msgSend(v14, "workoutConfiguration");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "activityType");

        if (v18 != 37)
        {
          LOBYTE(v24) = 0;
LABEL_25:

          goto LABEL_26;
        }
        objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v15, a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v15, a5);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v15, a6);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3558]);
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3530]);
        v20 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3560]);
        v21 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v19;
        objc_msgSend(v12, "statisticsForType:", v19);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "sumQuantity");
        v22 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v20;
        objc_msgSend(v13, "statisticsForType:", v20);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "sumQuantity");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)v21;
        objc_msgSend(v14, "statisticsForType:", v21);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "sumQuantity");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)v22;
        if (v22)
          v24 = objc_msgSend(v16, "compare:", v22, v22) != 1;
        else
          v24 = 0;
        if (v37)
          v25 = objc_msgSend(v36, "compare:") != 1;
        else
          v25 = 0;
        if (v23)
          v26 = objc_msgSend(v35, "compare:", v23) != 1;
        else
          v26 = 0;
        if (v24)
          LOBYTE(v24) = v25 && v26;

      }
      else
      {
        LOBYTE(v24) = 0;
      }

    }
    else
    {
      LOBYTE(v24) = 0;
    }

    goto LABEL_25;
  }
  LOBYTE(v24) = 0;
LABEL_27:

  return v24;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  ACHLogWorkouts();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[ACHWorkoutEvaluationWorkoutProperties valueForUndefinedKey:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  return 0;
}

- (unint64_t)type
{
  return self->_type;
}

- (double)duration
{
  return self->_duration;
}

- (double)kilocalories
{
  return self->_kilocalories;
}

- (double)kilometers
{
  return self->_kilometers;
}

- (double)meters
{
  return self->_meters;
}

- (double)elevationGained
{
  return self->_elevationGained;
}

- (double)elevationGainedInMeters
{
  return self->_elevationGainedInMeters;
}

- (BOOL)isDuathlon
{
  return self->_isDuathlon;
}

- (BOOL)isSprintTriathlon
{
  return self->_isSprintTriathlon;
}

- (BOOL)isFiftyKilometerTriathlon
{
  return self->_isFiftyKilometerTriathlon;
}

- (BOOL)isHalfDistanceTriathlon
{
  return self->_isHalfDistanceTriathlon;
}

- (BOOL)isFullDistanceTriathlon
{
  return self->_isFullDistanceTriathlon;
}

- (double)best5KDuration
{
  return self->_best5KDuration;
}

- (double)best10KDuration
{
  return self->_best10KDuration;
}

- (double)bestWheelchair5KDuration
{
  return self->_bestWheelchair5KDuration;
}

- (double)bestWheelchair10KDuration
{
  return self->_bestWheelchair10KDuration;
}

- (double)bestHalfMarathonDuration
{
  return self->_bestHalfMarathonDuration;
}

- (double)bestMarathonDuration
{
  return self->_bestMarathonDuration;
}

- (double)bestWheelchairHalfMarathonDuration
{
  return self->_bestWheelchairHalfMarathonDuration;
}

- (double)bestWheelchairMarathonDuration
{
  return self->_bestWheelchairMarathonDuration;
}

- (BOOL)isFirstParty
{
  return self->_isFirstParty;
}

- (BOOL)isIndoor
{
  return self->_isIndoor;
}

- (void)valueForUndefinedKey:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_21407B000, a2, a3, "Workout Evaluation workout properties asked for key it doesn't support: %{public}@", a5, a6, a7, a8, 2u);
}

@end
