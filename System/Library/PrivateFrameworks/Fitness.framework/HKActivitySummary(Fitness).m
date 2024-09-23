@implementation HKActivitySummary(Fitness)

- (uint64_t)isNoticeablyDifferentFromActivitySummary:()Fitness comparingGoalTypes:userActiveEnergyBurnedUnit:
{
  LODWORD(a3) = 1.0;
  return objc_msgSend(a1, "isNoticeablyDifferentFromActivitySummary:comparingGoalTypes:userActiveEnergyBurnedUnit:requiredDelta:", a3);
}

- (uint64_t)isNoticeablyDifferentFromActivitySummary:()Fitness comparingGoalTypes:userActiveEnergyBurnedUnit:requiredDelta:
{
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  float v20;
  double v21;
  char v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  float v30;
  float v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  float v39;
  float v40;
  uint64_t v41;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v10)
    goto LABEL_26;
  if (v11 && (objc_msgSend(v11, "containsObject:", &unk_24CC58C00) & 1) == 0)
  {
    if (!objc_msgSend(v11, "containsObject:", &unk_24CC58C18))
      goto LABEL_19;
    v13 = 0;
  }
  else
  {
    v13 = 1;
  }
  if (objc_msgSend(a1, "activityMoveMode") == 2)
  {
    objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v12;
  }
  v15 = v14;
  if (objc_msgSend(a1, "activityMoveMode") == 2)
    objc_msgSend(a1, "appleMoveTime");
  else
    objc_msgSend(a1, "activeEnergyBurned");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "activityMoveMode") == 2)
    objc_msgSend(v10, "appleMoveTime");
  else
    objc_msgSend(v10, "activeEnergyBurned");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValueForUnit:", v15);
  v19 = v18;
  objc_msgSend(v17, "doubleValueForUnit:", v15);
  v20 = v19;
  *(float *)&v21 = v21;
  *(float *)&v19 = vabds_f32(floorf(v20), floorf(*(float *)&v21));

  if (*(float *)&v19 >= a2)
    goto LABEL_26;
  if ((v13 & 1) != 0)
  {
    v22 = 1;
    goto LABEL_21;
  }
LABEL_19:
  if (!objc_msgSend(v11, "containsObject:", &unk_24CC58C30))
    goto LABEL_23;
  v22 = 0;
LABEL_21:
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appleExerciseTime");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValueForUnit:", v23);
  v26 = v25;

  objc_msgSend(v10, "appleExerciseTime");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValueForUnit:", v23);
  v29 = v28;

  v30 = v26;
  v31 = v29;
  *(float *)&v26 = vabds_f32(floorf(v30), floorf(v31));

  if (*(float *)&v26 >= a2)
    goto LABEL_26;
  if ((v22 & 1) != 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "appleStandHours");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "doubleValueForUnit:", v32);
    v35 = v34;

    objc_msgSend(v10, "appleStandHours");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "doubleValueForUnit:", v32);
    v38 = v37;

    v39 = v35;
    v40 = v38;
    *(float *)&v35 = vabds_f32(floorf(v39), floorf(v40));

    if (*(float *)&v35 < a2)
      goto LABEL_25;
LABEL_26:
    v41 = 1;
    goto LABEL_27;
  }
LABEL_23:
  if (objc_msgSend(v11, "containsObject:", &unk_24CC58C48))
    goto LABEL_24;
LABEL_25:
  v41 = 0;
LABEL_27:

  return v41;
}

@end
