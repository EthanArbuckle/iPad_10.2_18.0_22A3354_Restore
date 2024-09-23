@implementation _GoalDetailCollator

- (_GoalDetailCollator)init
{
  _GoalDetailCollator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_GoalDetailCollator;
  result = -[_GoalDetailCollator init](&v3, sel_init);
  if (result)
  {
    result->_entryCount = 0;
    result->_entriesExceedingGoal = 0;
    result->_totalPercentFromGoal = 0.0;
  }
  return result;
}

- (void)processCoordinateUserInfo:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  id v27;

  v27 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v27;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v27;
    objc_msgSend(v6, "activitySummaryData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "activityPaused") & 1) == 0)
    {
      switch(objc_msgSend(v6, "activityValue"))
      {
        case 0:
          objc_msgSend(v7, "activeEnergyBurned");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_unit");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "activeEnergyBurned");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "doubleValueForUnit:", v9);
          v12 = v11;

          objc_msgSend(v7, "activeEnergyBurnedGoal");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        case 1:
          objc_msgSend(v7, "appleMoveTime");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_unit");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "appleMoveTime");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "doubleValueForUnit:", v9);
          v12 = v16;

          objc_msgSend(v7, "appleMoveTimeGoal");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        case 2:
          objc_msgSend(v7, "appleExerciseTime");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "_unit");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "appleExerciseTime");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "doubleValueForUnit:", v9);
          v12 = v19;

          objc_msgSend(v7, "exerciseTimeGoal");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        case 3:
          objc_msgSend(v7, "appleStandHours");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "_unit");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "appleStandHours");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "doubleValueForUnit:", v9);
          v12 = v22;

          objc_msgSend(v7, "standHoursGoal");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
          v23 = v13;
          objc_msgSend(v13, "doubleValueForUnit:", v9);
          v25 = v24;

          if (v9)
          {
            ++self->_entryCount;
            if (v25 > 0.0)
            {
              v26 = v12 / v25 + -1.0;
              if (v26 >= 0.0)
                ++self->_entriesExceedingGoal;
              self->_totalPercentFromGoal = v26 + self->_totalPercentFromGoal;
            }
          }
          break;
        default:
          v9 = 0;
          break;
      }

    }
    v5 = v27;
  }

}

- (id)activitySummaryDetailStringWithActivitySummary:(id)a3 unitPreferenceController:(id)a4 activityValue:(int64_t)a5 displayTypeController:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  id v47;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  switch(a5)
  {
    case 0:
      _DisplayTypeForActivityValue(0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "unitForDisplayType:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "activeEnergyBurned");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (double)(int)_HKWorkoutFlooredValueForQuantity();

      objc_msgSend(v9, "activeEnergyBurnedGoal");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (double)(int)_HKWorkoutFlooredValueForQuantity();
      goto LABEL_6;
    case 1:
      objc_msgSend(v9, "appleMoveTime");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_unit");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "appleMoveTime");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValueForUnit:", v13);
      v15 = v20;

      objc_msgSend(v9, "appleMoveTimeGoal");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 2:
      objc_msgSend(v9, "appleExerciseTime");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_unit");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "appleExerciseTime");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValueForUnit:", v13);
      v15 = v24;

      objc_msgSend(v9, "exerciseTimeGoal");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
      v16 = v21;
      objc_msgSend(v21, "doubleValueForUnit:", v13);
      v17 = v25;
LABEL_6:

      if (!v13)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedDisplayNameForUnit:value:", v13, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = v11;
      if (a5)
        goto LABEL_11;
      HKActiveEnergyIntegerNumberFormatter();
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 3:
      objc_msgSend(v9, "appleStandHours");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_unit");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "appleStandHours");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "doubleValueForUnit:", v13);
      v15 = v31;

      objc_msgSend(v9, "standHoursGoal");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "doubleValueForUnit:", v13);
      v17 = v33;

      if (!v13)
        goto LABEL_13;
      v47 = v11;
      v34 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("HOURS_MEDIUM"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringWithFormat:", v36);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
      HKIntegerFormatter();
      v28 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v37 = (void *)v28;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringFromNumber:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringFromNumber:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("ACTIVITY_GOAL_IN_LEGEND %@ %@ %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stringWithFormat:", v44, v39, v41, v27);
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v11 = v47;
      break;
    default:
LABEL_13:
      v45 = &stru_1E9C4C428;
      break;
  }

  return v45;
}

- (id)detailStringWithTimeScope:(int64_t)a3
{
  __CFString *v3;
  void *v6;
  void *v7;
  void *v8;

  if (self->_entryCount < 1)
    goto LABEL_5;
  if ((unint64_t)a3 > 8)
  {
    v3 = 0;
    return v3;
  }
  if (((1 << a3) & 0xF) != 0 || ((1 << a3) & 0x1C0) != 0)
  {
LABEL_5:
    v3 = &stru_1E9C4C428;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DAYS_EXCEEDING_GOAL %ld %ld"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v8, self->_entriesExceedingGoal, self->_entryCount);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

@end
