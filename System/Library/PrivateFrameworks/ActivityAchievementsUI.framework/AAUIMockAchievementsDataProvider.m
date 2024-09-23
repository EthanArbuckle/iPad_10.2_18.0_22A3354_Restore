@implementation AAUIMockAchievementsDataProvider

- (AAUIMockAchievementsDataProvider)init
{
  AAUIMockAchievementsDataProvider *v2;
  void *v3;
  void *v4;
  uint64_t v5;
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
  uint64_t v39;
  NSArray *achievements;
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
  objc_super v78;
  _QWORD v79[13];
  _QWORD v80[13];
  _QWORD v81[4];
  uint64_t v82;
  void *v83;
  _QWORD v84[9];

  v84[7] = *MEMORY[0x24BDAC8D0];
  v78.receiver = self;
  v78.super_class = (Class)AAUIMockAchievementsDataProvider;
  v2 = -[AAUIMockAchievementsDataProvider init](&v78, sel_init);
  if (v2)
  {
    BestWorkoutEnergyBurnedTemplateForWorkoutActivityType();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v3, 1, -7, 460, 0, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    -[AAUIMockAchievementsDataProvider _ACHDateComponentIntervalWithMonthOffset:](v2, "_ACHDateComponentIntervalWithMonthOffset:", 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    ACHMonthlyChallengeTypeTotalWorkoutsTemplate();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _currentMonthlyChallengeAchievementForTemplate:localizableSuffix:goalValue:progressValue:isEarned:](v2, "_currentMonthlyChallengeAchievementForTemplate:localizableSuffix:goalValue:progressValue:isEarned:", v4, CFSTR("TotalWorkouts"), 29, 21, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    -[AAUIMockAchievementsDataProvider _ACHDateComponentIntervalWithMonthOffset:](v2, "_ACHDateComponentIntervalWithMonthOffset:", -3);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    ACHMonthlyChallengeTypeStandRingTemplate();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _currentMonthlyChallengeAchievementForTemplate:localizableSuffix:goalValue:progressValue:isEarned:](v2, "_currentMonthlyChallengeAchievementForTemplate:localizableSuffix:goalValue:progressValue:isEarned:", v6, CFSTR("StandRing"), 21, 21, 1);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    -[AAUIMockAchievementsDataProvider _ACHDateComponentIntervalWithMonthOffset:](v2, "_ACHDateComponentIntervalWithMonthOffset:", -2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    ACHMonthlyChallengeTypeTotalDistanceTemplate();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _currentMonthlyChallengeAchievementForTemplate:localizableSuffix:goalValue:progressValue:isEarned:](v2, "_currentMonthlyChallengeAchievementForTemplate:localizableSuffix:goalValue:progressValue:isEarned:", v7, CFSTR("TotalDistance"), 146, 146, 1);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    -[AAUIMockAchievementsDataProvider _ACHDateComponentIntervalWithMonthOffset:](v2, "_ACHDateComponentIntervalWithMonthOffset:", -1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    ACHMonthlyChallengeTypeMoveRingTemplate();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _currentMonthlyChallengeAchievementForTemplate:localizableSuffix:goalValue:progressValue:isEarned:](v2, "_currentMonthlyChallengeAchievementForTemplate:localizableSuffix:goalValue:progressValue:isEarned:", v8, CFSTR("MoveRing"), 24, 24, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    DailyMoveRecordTemplate();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v9, 1, -210, 0, 721, 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    DailyExerciseRecordTemplate();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v10, 1, -205, 0, 53, 14);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    MoveGoal200PercentTemplate();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v11, 0, 0, 0, 500, 324);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    MoveGoal300PercentTemplate();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v12, 0, 0, 0, 500, 324);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    MoveGoal400PercentTemplate();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v13, 0, 0, 0, 500, 324);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    LongestMoveStreakTemplate();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v14, 1, -14, 36, 0, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    PerfectWeekMoveTemplate();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v15, 24, -14, 0, 0, 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    PerfectWeekExerciseTemplate();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v16, 32, -21, 0, 0, 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    PerfectWeekStandTemplate();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v17, 17, -35, 0, 0, 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    PerfectWeekAllTemplate();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v18, 15, -42, 0, 0, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    HundredMoveGoals();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v19, 1, -63, 0, 0, 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    FiveHundredMoveGoals();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v20, 0, 0, 0, 0, 256);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    ThousandMoveGoals();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v21, 0, 0, 0, 0, 256);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    SevenWorkoutWeekTemplate();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v22, 0, 0, 0, 0, 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    FirstWorkoutTemplateForWorkoutActivityType();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v23, 1, -210, 0, 0, 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    FirstWorkoutTemplateForWorkoutActivityType();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v24, 1, -270, 0, 0, 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    FirstWorkoutTemplateForWorkoutActivityType();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v25, 1, -90, 0, 0, 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    FirstWorkoutTemplateForWorkoutActivityType();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v26, 1, -120, 0, 0, 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    FirstWorkoutTemplateForWorkoutActivityType();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v27, 1, -90, 0, 0, 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    FirstWorkoutTemplateForWorkoutActivityType();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v28, 1, -300, 0, 0, 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    BestWorkoutEnergyBurnedTemplateForWorkoutActivityType();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v29, 1, -14, 441, 0, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    BestWorkoutEnergyBurnedTemplateForWorkoutActivityType();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v30, 1, -7, 461, 0, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    BestWorkoutEnergyBurnedTemplateForWorkoutActivityType();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v31, 1, -21, 342, 0, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    BestWorkoutEnergyBurnedTemplateForWorkoutActivityType();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v33, 1, -28, 205, 0, 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    BestWorkoutEnergyBurnedTemplateForWorkoutActivityType();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v34, 1, -35, 276, 0, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    BestWorkoutEnergyBurnedTemplateForWorkoutActivityType();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:](v2, "_achievementForTemplate:earnedInstanceCount:earnedInstanceOffset:earnedInstanceValue:goalValue:progressValue:", v35, 1, -56, 456, 0, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v83 = v53;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v83, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = v45;
    v52 = (void *)v5;
    v82 = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v82, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v84[1] = v43;
    v84[2] = MEMORY[0x24BDBD1A8];
    v84[3] = MEMORY[0x24BDBD1A8];
    v81[0] = v77;
    v81[1] = v76;
    v81[2] = v51;
    v81[3] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v81, 4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v84[4] = v36;
    v80[0] = v75;
    v80[1] = v73;
    v80[2] = v74;
    v80[3] = v68;
    v80[4] = v72;
    v80[5] = v49;
    v80[6] = v71;
    v80[7] = v70;
    v80[8] = v69;
    v80[9] = v48;
    v80[10] = v67;
    v80[11] = v66;
    v80[12] = v46;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 13);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v84[5] = v37;
    v79[0] = v65;
    v79[1] = v64;
    v79[2] = v63;
    v79[3] = v61;
    v79[4] = v62;
    v79[5] = v58;
    v79[6] = v60;
    v79[7] = v59;
    v79[8] = v50;
    v79[9] = v32;
    v79[10] = v47;
    v79[11] = v44;
    v79[12] = v42;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 13);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v84[6] = v38;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 7);
    v39 = objc_claimAutoreleasedReturnValue();
    achievements = v2->_achievements;
    v2->_achievements = (NSArray *)v39;

  }
  return v2;
}

- (id)recentAndRelevantAchievementAtIndexPath:(id)a3
{
  NSArray *achievements;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  achievements = self->_achievements;
  v4 = a3;
  -[NSArray objectAtIndexedSubscript:](achievements, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)achievementAtIndexPath:(id)a3
{
  NSArray *achievements;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  achievements = self->_achievements;
  v4 = a3;
  -[NSArray objectAtIndexedSubscript:](achievements, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_achievements, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)numberOfSections
{
  return -[NSArray count](self->_achievements, "count");
}

- (id)headerStringForSection:(int64_t)a3 isRecentAndRelevant:(BOOL)a4
{
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
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[8];

  v23[7] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("RECENT"), &stru_24E0B4958, CFSTR("Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedUppercaseString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v20;
  v23[1] = &stru_24E0B4958;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", *MEMORY[0x24BE011F0], &stru_24E0B4958, CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedUppercaseString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v16;
  v23[3] = &stru_24E0B4958;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", *MEMORY[0x24BE01208], &stru_24E0B4958, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedUppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v5;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", *MEMORY[0x24BE011E8], &stru_24E0B4958, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedUppercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v8;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", *MEMORY[0x24BE01210], &stru_24E0B4958, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedUppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_achievementForTemplate:(id)a3 earnedInstanceCount:(int64_t)a4 earnedInstanceOffset:(int64_t)a5 earnedInstanceValue:(int64_t)a6 goalValue:(int64_t)a7 progressValue:(int64_t)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  unint64_t v22;
  void *v23;
  unsigned int v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int64_t v30;
  int64_t v31;
  unint64_t v32;
  void *v33;
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
  int64_t v64;
  int64_t v65;
  void *v66;
  AAUIMockAchievementsDataProvider *v67;

  v14 = a3;
  if (ACHShouldUseNewAwardsSystem())
  {
    if (a4 < 1)
    {
      v15 = 0;
    }
    else
    {
      v15 = objc_alloc_init(MEMORY[0x24BE01830]);
      objc_msgSend(v14, "uniqueName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTemplateUniqueName:", v16);

      -[AAUIMockAchievementsDataProvider _dateComponentsWithDayOffset:](self, "_dateComponentsWithDayOffset:", a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setEarnedDateComponents:", v17);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "canonicalUnit");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ACHHKQuantityWithValueAndUnit();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:", v20);

    }
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE017A8]), "initWithTemplate:relevantEarnedInstance:earnedInstanceCount:", v14, v15, a4);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a7);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "canonicalUnit");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    ACHHKQuantityWithValueAndUnit();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setGoal:", v53);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a8);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "canonicalUnit");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    ACHHKQuantityWithValueAndUnit();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setProgress:", v56);

    objc_msgSend(v35, "template");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "uniqueName");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _fitnessUIAssetsURLWithKey:value:](self, "_fitnessUIAssetsURLWithKey:value:", CFSTR("%@/localization/"), v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setLocalizationBundleURL:", v59);

    objc_msgSend(v35, "template");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "uniqueName");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _fitnessUIAssetsURLWithKey:value:](self, "_fitnessUIAssetsURLWithKey:value:", CFSTR("%@/badgemodel/"), v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setResourceBundleURL:", v62);

    objc_msgSend(v35, "template");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "uniqueName");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _fitnessUIAssetsURLWithKey:value:](self, "_fitnessUIAssetsURLWithKey:value:", CFSTR("%@/badgeproperties/"), v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPropertyListBundleURL:", v50);
  }
  else
  {
    v64 = a7;
    v65 = a8;
    v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v15 = v21;
    v22 = 0x24BDD1000uLL;
    v23 = v14;
    v67 = self;
    if (a4 >= 1)
    {
      v24 = 0;
      v66 = v21;
      do
      {
        v25 = objc_alloc_init(MEMORY[0x24BE01830]);
        objc_msgSend(v23, "uniqueName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setTemplateUniqueName:", v26);

        -[AAUIMockAchievementsDataProvider _dateComponentsWithDayOffset:](v67, "_dateComponentsWithDayOffset:", a5 - v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setEarnedDateComponents:", v27);

        objc_msgSend(*(id *)(v22 + 1760), "numberWithInteger:", a6);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "canonicalUnit");
        v29 = v23;
        v30 = a5;
        v31 = a6;
        v32 = v22;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        ACHHKQuantityWithValueAndUnit();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setValue:", v34);

        v22 = v32;
        a6 = v31;
        a5 = v30;
        v23 = v29;

        v15 = v66;
        objc_msgSend(v66, "insertObject:atIndex:", v25, 0);

        v24 += 7;
        --a4;
      }
      while (a4);
    }
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE017A8]), "initWithTemplate:earnedInstances:", v23, v15);
    objc_msgSend(*(id *)(v22 + 1760), "numberWithInteger:", v64);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "canonicalUnit");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    ACHHKQuantityWithValueAndUnit();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setGoal:", v38);

    objc_msgSend(*(id *)(v22 + 1760), "numberWithInteger:", v65);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "canonicalUnit");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    ACHHKQuantityWithValueAndUnit();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setProgress:", v41);

    objc_msgSend(v35, "template");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "uniqueName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _fitnessUIAssetsURLWithKey:value:](v67, "_fitnessUIAssetsURLWithKey:value:", CFSTR("%@/localization/"), v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setLocalizationBundleURL:", v44);

    objc_msgSend(v35, "template");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "uniqueName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _fitnessUIAssetsURLWithKey:value:](v67, "_fitnessUIAssetsURLWithKey:value:", CFSTR("%@/badgemodel/"), v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setResourceBundleURL:", v47);

    objc_msgSend(v35, "template");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "uniqueName");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIMockAchievementsDataProvider _fitnessUIAssetsURLWithKey:value:](v67, "_fitnessUIAssetsURLWithKey:value:", CFSTR("%@/badgeproperties/"), v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPropertyListBundleURL:", v50);
    v14 = v23;
  }

  ACHApplyBadgePropertiesToAchievement();
  return v35;
}

- (id)_currentMonthlyChallengeAchievementForTemplate:(id)a3 localizableSuffix:(id)a4 goalValue:(int64_t)a5 progressValue:(int64_t)a6 isEarned:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  id v21;
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
  void *v41;
  void *v42;
  _QWORD v44[2];

  v7 = a7;
  v44[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  if (ACHShouldUseNewAwardsSystem())
  {
    if (v7)
    {
      v14 = objc_alloc_init(MEMORY[0x24BE01830]);
      objc_msgSend(v12, "uniqueName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTemplateUniqueName:", v15);

      objc_msgSend(v12, "availabilityEnd");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setEarnedDateComponents:", v16);

      objc_msgSend(v12, "canonicalUnit");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "_isMetricDistance") & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[AAUIMockAchievementsDataProvider _distanceUnitForLocale:](self, "_distanceUnitForLocale:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v12, "canonicalUnit");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      ACHHKQuantityWithValueAndUnit();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setValue:", v28);

    }
    else
    {
      v14 = 0;
    }
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE017A8]), "initWithTemplate:relevantEarnedInstance:earnedInstanceCount:", v12, v14, v14 != 0);
    v20 = 0x24BDD1000;
  }
  else
  {
    v20 = 0x24BDD1000uLL;
    if (v7)
    {
      v21 = objc_alloc_init(MEMORY[0x24BE01830]);
      objc_msgSend(v12, "uniqueName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTemplateUniqueName:", v22);

      objc_msgSend(v12, "availabilityEnd");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setEarnedDateComponents:", v23);

      objc_msgSend(v12, "canonicalUnit");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "_isMetricDistance") & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[AAUIMockAchievementsDataProvider _distanceUnitForLocale:](self, "_distanceUnitForLocale:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v12, "canonicalUnit");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      ACHHKQuantityWithValueAndUnit();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setValue:", v31);

      v44[0] = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = (id)MEMORY[0x24BDBD1A8];
    }
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE017A8]), "initWithTemplate:earnedInstances:", v12, v14);
  }
  objc_msgSend(*(id *)(v20 + 1760), "numberWithInteger:", a5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "canonicalUnit");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  ACHHKQuantityWithValueAndUnit();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setGoal:", v34);

  objc_msgSend(*(id *)(v20 + 1760), "numberWithInteger:", a6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "canonicalUnit");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  ACHHKQuantityWithValueAndUnit();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setProgress:", v37);

  objc_msgSend(v12, "uniqueName");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIMockAchievementsDataProvider _monthStringFromTemplateName:](self, "_monthStringFromTemplateName:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAUIMockAchievementsDataProvider _fitnessUIAssetsURLWithKey:value:](self, "_fitnessUIAssetsURLWithKey:value:", CFSTR("MonthlyAchievements/localization/challenge/%@/"), v13);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "setLocalizationBundleURL:", v40);
  -[AAUIMockAchievementsDataProvider _fitnessUIAssetsURLWithKey:value:](self, "_fitnessUIAssetsURLWithKey:value:", CFSTR("MonthlyAchievements/models/%@/badgemodel/"), v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setResourceBundleURL:", v41);

  -[AAUIMockAchievementsDataProvider _fitnessUIAssetsURLWithKey:value:](self, "_fitnessUIAssetsURLWithKey:value:", CFSTR("MonthlyAchievements/models/%@/badgeproperties/challenge/"), v39);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPropertyListBundleURL:", v42);

  ACHApplyBadgePropertiesToAchievement();
  return v29;
}

- (id)_fitnessUIAssetsURLWithKey:(id)a3 value:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v5 = a3;
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@"), &v15, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  v8 = v7;
  if (v6)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (!v9)
  {
    ACHLogDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AAUIMockAchievementsDataProvider _fitnessUIAssetsURLWithKey:value:].cold.1((uint64_t)v5, (uint64_t)v8, v10);

  }
  v11 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(CFSTR("file:///System/Library/Health/Assets/FitnessUIAssets.bundle/ActivityAchievements/"), "stringByAppendingString:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_dateComponentsWithDayOffset:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_startOfDateByAddingDays:toDate:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", *MEMORY[0x24BE012A8], v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_ACHDateComponentIntervalWithMonthOffset:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_startOfMonthForDate:addingMonths:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_startOfMonthForDate:addingMonths:", v5, a3 + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_startOfDateBySubtractingDays:fromDate:", 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE012A8];
  objc_msgSend(v4, "components:fromDate:", *MEMORY[0x24BE012A8], v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01828]), "initWithStartDateComponents:endDateComponents:", v10, v11);

  return v12;
}

- (id)_monthStringFromTemplateName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_distanceUnitForLocale:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDBCB60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 9);
  else
    objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_achievements, 0);
}

- (void)_fitnessUIAssetsURLWithKey:(os_log_t)log value:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_21CC08000, log, OS_LOG_TYPE_ERROR, "Error formatting assets URL with key (%@): %@", (uint8_t *)&v3, 0x16u);
}

@end
