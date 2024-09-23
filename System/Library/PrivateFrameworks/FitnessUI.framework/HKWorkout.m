@implementation HKWorkout

BOOL __42__HKWorkout_FitnessUI__fiui_eventsOfType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

void __97__HKWorkout_FitnessUI__fiui_splitsFromDistanceSamples_distanceInMetersPerSplit_workoutStartDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  unint64_t v11;
  double v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  FIUIWorkoutSplit *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  unint64_t v57;
  double v58;
  uint64_t v59;
  void *v60;
  _BYTE *v61;
  uint8_t v62;
  _BYTE v63[7];
  uint8_t v64;
  _BYTE v65[15];

  v6 = a2;
  v7 = a3;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(_QWORD *)(v8 + 40);
  v9 = (id *)(v8 + 40);
  if (!v10)
    objc_storeStrong(v9, a2);
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v11 >= objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(v7, "timeIntervalSinceDate:", v6);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v12
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24);
  }
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v13 < objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v61 = v63;
    while (1)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v61);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v15 == objc_msgSend(*(id *)(a1 + 32), "count") - 1)
      {
        v16 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "startDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timeIntervalSinceReferenceDate");
        v20 = v19;
        objc_msgSend(v7, "timeIntervalSinceReferenceDate");
        v16 = v20 > v21;

      }
      objc_msgSend(v14, "quantity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValueForUnit:", v23);
      v25 = v24;

      objc_msgSend(v14, "endDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "startDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeIntervalSinceDate:", v27);
      v29 = v28;

      objc_msgSend(v14, "startDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "compare:", *(_QWORD *)(a1 + 40));

      if (v31 == -1)
      {
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        {
          _HKInitializeLogging();
          v32 = *MEMORY[0x24BDD3078];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_ERROR))
            __97__HKWorkout_FitnessUI__fiui_splitsFromDistanceSamples_distanceInMetersPerSplit_workoutStartDate___block_invoke_cold_2(&v64, v65, v32);
        }
        v33 = *(void **)(a1 + 40);
        objc_msgSend(v14, "endDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v33, "compare:", v34);

        if (v35 == -1)
        {
          _HKInitializeLogging();
          v36 = *MEMORY[0x24BDD3078];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_ERROR))
            __97__HKWorkout_FitnessUI__fiui_splitsFromDistanceSamples_distanceInMetersPerSplit_workoutStartDate___block_invoke_cold_1(&v62, v61, v36);
        }
        objc_msgSend(v14, "endDate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
        v39 = v38;
        objc_msgSend(v14, "endDate");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "startDate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "timeIntervalSinceDate:", v41);
        v43 = v39 / v42;

        v25 = v25 * v43;
        objc_msgSend(v14, "endDate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
        v29 = v45;

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
      }
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v25
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                              + 24);
      if (v16)
        break;
      v46 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v47 = *(double *)(a1 + 88);
      if (v46 >= v47)
      {
        v48 = v46 - v47;
        v49 = v29 * ((v46 - v47) / v25);
        objc_msgSend(v14, "endDate");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v51
                                                                    - v49
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                + 24);

        v52 = -[FIUIWorkoutSplit initWithDistance:duration:]([FIUIWorkoutSplit alloc], "initWithDistance:duration:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) - v48, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "addObject:", v52);
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v49;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v48;
        objc_msgSend(v14, "endDate");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "dateByAddingTimeInterval:", -v49);
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v56 = *(void **)(v55 + 40);
        *(_QWORD *)(v55 + 40) = v54;

      }
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

      v57 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v57 >= objc_msgSend(*(id *)(a1 + 32), "count"))
        goto LABEL_24;
    }
    objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v58
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24);
    v59 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v60 = *(void **)(v59 + 40);
    *(_QWORD *)(v59 + 40) = 0;

  }
LABEL_24:
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

}

FIUIWorkoutSplit *__81__HKWorkout_FIUISplitsAdditions__fiui_workoutSplitsForUserPreferredDistanceUnit___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  FIUIWorkoutSplit *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  FIUIWorkoutSplit *v23;

  v2 = a2;
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE32770]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE32778]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x24BDD3078];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_ERROR))
      __81__HKWorkout_FIUISplitsAdditions__fiui_workoutSplitsForUserPreferredDistanceUnit___block_invoke_cold_1((uint64_t)v2, v8, v9, v10, v11, v12, v13, v14);
    v23 = 0;
  }
  else
  {
    v15 = [FIUIWorkoutSplit alloc];
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValueForUnit:", v16);
    v18 = v17;
    objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValueForUnit:", v19);
    v21 = v20;
    objc_msgSend(v2, "dateInterval");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[FIUIWorkoutSplit initWithDistance:duration:dateInterval:](v15, "initWithDistance:duration:dateInterval:", v22, v18, v21);

  }
  return v23;
}

FIUIWorkoutSplit *__58__HKWorkout_FIUISplitsAdditions__fiui_workoutCustomSplits__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  FIUIWorkoutSplit *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  FIUIWorkoutSplit *v23;

  v2 = a2;
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE32770]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE32778]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x24BDD3078];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_ERROR))
      __81__HKWorkout_FIUISplitsAdditions__fiui_workoutSplitsForUserPreferredDistanceUnit___block_invoke_cold_1((uint64_t)v2, v8, v9, v10, v11, v12, v13, v14);
    v23 = 0;
  }
  else
  {
    v15 = [FIUIWorkoutSplit alloc];
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValueForUnit:", v16);
    v18 = v17;
    objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValueForUnit:", v19);
    v21 = v20;
    objc_msgSend(v2, "dateInterval");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[FIUIWorkoutSplit initWithDistance:duration:dateInterval:](v15, "initWithDistance:duration:dateInterval:", v22, v18, v21);

  }
  return v23;
}

void __97__HKWorkout_FitnessUI__fiui_splitsFromDistanceSamples_distanceInMetersPerSplit_workoutStartDate___block_invoke_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1_1(&dword_21307C000, (int)a2, a3, "[FIUI] Sample cannot have end date and start date earlier than workout's start date", a1);
}

void __97__HKWorkout_FitnessUI__fiui_splitsFromDistanceSamples_distanceInMetersPerSplit_workoutStartDate___block_invoke_cold_2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1_1(&dword_21307C000, (int)a2, a3, "[FIUI] Sample cannot have an earlier start date than workout's start date if it's not the first sample", a1);
}

void __81__HKWorkout_FIUISplitsAdditions__fiui_workoutSplitsForUserPreferredDistanceUnit___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21307C000, a2, a3, "Skipping split event %@ because it's missing duration or distance", a5, a6, a7, a8, 2u);
}

@end
