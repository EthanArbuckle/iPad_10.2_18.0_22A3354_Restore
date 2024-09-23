@implementation ACHBuiltinTemplateSource

- (NSString)identifier
{
  return (NSString *)(id)*MEMORY[0x24BE01630];
}

- (int64_t)runCadence
{
  return 1;
}

- (BOOL)sourceShouldRunForDate:(id)a3
{
  return 1;
}

- (void)templatesForDate:(id)a3 completion:(id)a4
{
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
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v34 = a4;
  v33 = objc_alloc(MEMORY[0x24BDBCEF0]);
  NewMoveGoalAchievedTemplate();
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  DailyMoveRecordTemplate();
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  NewMoveTimeGoalAchievedTemplate();
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  DailyMoveTimeRecordTemplate();
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  DailyExerciseRecordTemplate();
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  LongestMoveStreakTemplate();
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  MoveGoal200PercentTemplate();
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  MoveGoal300PercentTemplate();
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  MoveGoal400PercentTemplate();
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  PerfectWeekMoveTemplate();
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  PerfectWeekExerciseTemplate();
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  PerfectWeekStandTemplate();
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  PerfectWeekAllTemplate();
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  HundredMoveGoals();
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  ThreeHundredSixtyFiveMoveGoals();
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  FiveHundredMoveGoals();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  ThousandMoveGoals();
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  TwelveFiftyMoveGoals();
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  FifteenHundredMoveGoals();
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  SeventeenFiftyMoveGoals();
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  TwoThousandMoveGoals();
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  TwentyTwoFiftyMoveGoals();
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  TwentyFiveHundredMoveGoals();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  TwentySevenFiftyMoveGoals();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  ThreeThousandMoveGoals();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  ThreeThousandTwoHundredFiftyMoveGoals();
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  ThreeThousandFiveHundredMoveGoals();
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  ThreeThousandSevenHundredFiftyMoveGoals();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  FourThousandMoveGoals();
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  SevenWorkoutWeekTemplate();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  FiftyMilesCyclingWorkout();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  FiftyKilometersCyclingWorkout();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  OneHundredMilesCyclingWorkout();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  OneHundredKilometersCyclingWorkout();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  HalfMarathonWorkout();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  WheelchairHalfMarathonWorkout();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  FastestHalfMarathonWorkout();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  FastestWheelchairHalfMarathonWorkout();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  MarathonWorkout();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  WheelchairMarathonWorkout();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  FastestMarathonWorkout();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  FastestWheelchairMarathonWorkout();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  DuathlonWorkout();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  SprintTriathlonWorkout();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  FiftyKilometerTriathlonWorkout();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HalfDistanceTriathlonWorkout();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FullDistanceTriathlonWorkout();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  Best5KDuration();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  Best10KDuration();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  BestWheelchair5KDuration();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BestWheelchair10KDuration();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  FiveKilometerWorkout();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  TenKilometerWorkout();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  FiveKilometerWheelchairWorkout();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  TenKilometerWheelchairWorkout();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v33, "initWithObjects:", v78, v79, v76, v77, v74, v75, v72, v73, v70, v71, v68, v69, v66, v67, v64, v65, v62,
                  v63,
                  v60,
                  v61,
                  v58,
                  v59,
                  v56,
                  v57,
                  v54,
                  v55,
                  v52,
                  v53,
                  v50,
                  v51,
                  v49,
                  v48,
                  v47,
                  v46,
                  v45,
                  v44,
                  v43,
                  v42,
                  v41,
                  v40,
                  v39,
                  v38,
                  v37,
                  v36,
                  v5,
                  v6,
                  v7,
                  v8,
                  v32,
                  v9,
                  v10,
                  v11,
                  v12,
                  v13,
                  v31,
                  0);

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v15 = (id)*MEMORY[0x24BE01338];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v85 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        v21 = (void *)MEMORY[0x2199C8FE0]();
        objc_msgSend(v20, "unsignedIntegerValue");
        FirstWorkoutTemplateForWorkoutActivityType();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v22);

        BestWorkoutEnergyBurnedTemplateForWorkoutActivityType();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v23);

        objc_autoreleasePoolPop(v21);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
    }
    while (v17);
  }

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v24 = objc_msgSend(&unk_24D15B930, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v81;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v81 != v26)
          objc_enumerationMutation(&unk_24D15B930);
        objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * j), "unsignedIntegerValue");
        BestWorkoutDistanceTemplateForWorkoutActivityType();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v28);

      }
      v25 = objc_msgSend(&unk_24D15B930, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
    }
    while (v25);
  }
  BestWorkoutElevationGainedTemplateForWorkoutActivityType();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v29);

  if (v34)
  {
    v30 = (void *)objc_msgSend(v14, "copy");
    (*((void (**)(id, void *, _QWORD, _QWORD))v34 + 2))(v34, v30, 0, 0);

  }
}

- (id)localizationBundleURLForTemplate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BE015D8], "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("localization"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)resourceBundleURLForTemplate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BE015D8], "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("badgemodel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)propertyListBundleURLForTemplate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BE015D8], "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("badgeproperties"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stickerBundleURLForTemplate:(id)a3
{
  return 0;
}

@end
