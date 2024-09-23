@implementation ACHMonthlyChallengeTemplateDataProvider

- (ACHMonthlyChallengeTemplateDataProvider)initWithHealthStore:(id)a3 earnedInstanceStore:(id)a4 templateStore:(id)a5 activitySummaryIterator:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ACHMonthlyChallengeTemplateDataProvider *v15;
  ACHMonthlyChallengeTemplateDataProvider *v16;
  uint64_t v17;
  NSCalendar *currentCalendar;
  uint64_t v19;
  NSDate *currentDate;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ACHMonthlyChallengeTemplateDataProvider;
  v15 = -[ACHMonthlyChallengeTemplateDataProvider init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_healthStore, a3);
    objc_storeStrong((id *)&v16->_earnedInstanceStore, a4);
    objc_storeStrong((id *)&v16->_templateStore, a5);
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendarWithLocalTimeZone");
    v17 = objc_claimAutoreleasedReturnValue();
    currentCalendar = v16->_currentCalendar;
    v16->_currentCalendar = (NSCalendar *)v17;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v19 = objc_claimAutoreleasedReturnValue();
    currentDate = v16->_currentDate;
    v16->_currentDate = (NSDate *)v19;

    objc_storeStrong((id *)&v16->_activitySummaryIterator, a6);
  }

  return v16;
}

- (ACHMonthlyChallengeTemplateDataProvider)initWithProfile:(id)a3 achievementStore:(id)a4 activitySummaryUtility:(id)a5
{
  id v8;
  id v9;
  id v10;
  ACHMonthlyChallengeTemplateDataProvider *v11;
  ACHMonthlyChallengeTemplateDataProvider *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ACHMonthlyChallengeTemplateDataProvider;
  v11 = -[ACHMonthlyChallengeTemplateDataProvider init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    -[ACHMonthlyChallengeTemplateDataProvider setProfile:](v11, "setProfile:", v8);
    -[ACHMonthlyChallengeTemplateDataProvider setAchievementStore:](v12, "setAchievementStore:", v9);
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendarWithLocalTimeZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHMonthlyChallengeTemplateDataProvider setCurrentCalendar:](v12, "setCurrentCalendar:", v13);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHMonthlyChallengeTemplateDataProvider setCurrentDate:](v12, "setCurrentDate:", v14);

    -[ACHMonthlyChallengeTemplateDataProvider setActivitySummaryUtility:](v12, "setActivitySummaryUtility:", v10);
  }

  return v12;
}

- (BOOL)isUsingNewAwardingSystem
{
  void *v2;
  BOOL v3;

  -[ACHMonthlyChallengeTemplateDataProvider healthStore](self, "healthStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)numberOfEarnedInstancesOfTemplateWithUniqueName:(id)a3 inDateComponentInterval:(id)a4 withCalendar:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  ACHMonthlyChallengeTemplateDataProvider *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;

  v10 = a3;
  v11 = a5;
  v12 = a4;
  if (-[ACHMonthlyChallengeTemplateDataProvider isUsingNewAwardingSystem](self, "isUsingNewAwardingSystem"))
  {
    -[ACHMonthlyChallengeTemplateDataProvider earnedInstanceStore](self, "earnedInstanceStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countOfEarnedInstancesForTemplateUniqueName:inDateComponentInterval:withCalendar:error:", v10, v12, v11, a6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHMonthlyChallengeTemplateDataProvider achievementStore](self, "achievementStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allAchievements");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __134__ACHMonthlyChallengeTemplateDataProvider_numberOfEarnedInstancesOfTemplateWithUniqueName_inDateComponentInterval_withCalendar_error___block_invoke;
    v35[3] = &unk_24D13BAB8;
    v36 = v10;
    objc_msgSend(v13, "hk_filter:", v35);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startDateComponents");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateFromComponents:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "endDateComponents");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "dateFromComponents:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __134__ACHMonthlyChallengeTemplateDataProvider_numberOfEarnedInstancesOfTemplateWithUniqueName_inDateComponentInterval_withCalendar_error___block_invoke_2;
    v29 = &unk_24D13C0B8;
    v30 = v11;
    v31 = self;
    v32 = v20;
    v33 = v22;
    v34 = v15;
    v12 = v15;
    v23 = v22;
    v24 = v20;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", &v26);
    v14 = objc_msgSend(v12, "count", v26, v27, v28, v29);

  }
  return v14;
}

uint64_t __134__ACHMonthlyChallengeTemplateDataProvider_numberOfEarnedInstancesOfTemplateWithUniqueName_inDateComponentInterval_withCalendar_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "template");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

void __134__ACHMonthlyChallengeTemplateDataProvider_numberOfEarnedInstancesOfTemplateWithUniqueName_inDateComponentInterval_withCalendar_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  objc_msgSend(a2, "earnedInstances");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __134__ACHMonthlyChallengeTemplateDataProvider_numberOfEarnedInstancesOfTemplateWithUniqueName_inDateComponentInterval_withCalendar_error___block_invoke_3;
  v8[3] = &unk_24D13C090;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v12 = *(id *)(a1 + 56);
  objc_msgSend(v7, "hk_filter:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "addObjectsFromArray:", v6);

}

uint64_t __134__ACHMonthlyChallengeTemplateDataProvider_numberOfEarnedInstancesOfTemplateWithUniqueName_inDateComponentInterval_withCalendar_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "earnedDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFromComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(*(id *)(a1 + 40), "isDate:betweenStartDate:andEndDate:", v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return v6;
}

- (id)existingMonthlyChallengeTemplates
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (-[ACHMonthlyChallengeTemplateDataProvider isUsingNewAwardingSystem](self, "isUsingNewAwardingSystem"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    -[ACHMonthlyChallengeTemplateDataProvider templateStore](self, "templateStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allTemplates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
          if (ACHTemplateIsMonthlyChallenge())
            objc_msgSend(v3, "addObject:", v11, (_QWORD)v19);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_msgSend(v3, "copy");
    return v12;
  }
  else
  {
    -[ACHMonthlyChallengeTemplateDataProvider achievementStore](self, "achievementStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allAchievements");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "hk_map:", &__block_literal_global_18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    return v18;
  }
}

id __76__ACHMonthlyChallengeTemplateDataProvider_existingMonthlyChallengeTemplates__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int IsMonthlyChallenge;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "template");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsMonthlyChallenge = ACHTemplateIsMonthlyChallenge();

  if (IsMonthlyChallenge)
  {
    objc_msgSend(v2, "template");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)monthlyChallengeTypeForMonth:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  uint8_t buf[8];
  _QWORD v18[4];
  id v19;

  v4 = a3;
  -[ACHMonthlyChallengeTemplateDataProvider existingMonthlyChallengeTemplates](self, "existingMonthlyChallengeTemplates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = objc_msgSend(v4, "year");
  v8 = objc_msgSend(v4, "month");

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%04ld_%02ld"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __72__ACHMonthlyChallengeTemplateDataProvider_monthlyChallengeTypeForMonth___block_invoke;
  v18[3] = &unk_24D13C120;
  v19 = v9;
  v11 = v9;
  objc_msgSend(v10, "hk_firstObjectPassingTest:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "uniqueName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = ACHMonthlyChallengeTypeFromTemplateUniqueName();

  }
  else
  {
    ACHLogMonthlyChallenges();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v15, OS_LOG_TYPE_DEFAULT, "No monthly challenge created last month", buf, 2u);
    }

    v14 = 0;
  }

  return v14;
}

uint64_t __72__ACHMonthlyChallengeTemplateDataProvider_monthlyChallengeTypeForMonth___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)monthlyChallengeExistsForMonth:(id)a3
{
  return -[ACHMonthlyChallengeTemplateDataProvider monthlyChallengeTypeForMonth:](self, "monthlyChallengeTypeForMonth:", a3) != 0;
}

- (BOOL)isDate:(id)a3 betweenStartDate:(id)a4 andEndDate:(id)a5
{
  id v7;
  id v8;
  char v9;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "hk_isAfterOrEqualToDate:", a4))
    v9 = objc_msgSend(v7, "hk_isBeforeOrEqualToDate:", v8);
  else
    v9 = 0;

  return v9;
}

- (BOOL)hasMinimumActiveDaysWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v19;
  _QWORD v20[5];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  if (!-[ACHMonthlyChallengeTemplateDataProvider isUsingNewAwardingSystem](self, "isUsingNewAwardingSystem"))
    return -[ACHMonthlyChallengeTemplateDataProvider hasMinimumActiveDays](self, "hasMinimumActiveDays");
  -[ACHMonthlyChallengeTemplateDataProvider currentCalendar](self, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateDataProvider currentDate](self, "currentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_dateByAddingDays:toDate:", -35, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHMonthlyChallengeTemplateDataProvider currentCalendar](self, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE012A8];
  objc_msgSend(v8, "components:fromDate:", *MEMORY[0x24BE012A8], v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHMonthlyChallengeTemplateDataProvider currentCalendar](self, "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateDataProvider currentDate](self, "currentDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "components:fromDate:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01828]), "initWithStartDateComponents:endDateComponents:", v10, v13);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__19;
  v26 = __Block_byref_object_dispose__19;
  v27 = 0;
  -[ACHMonthlyChallengeTemplateDataProvider activitySummaryIterator](self, "activitySummaryIterator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = &v22;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __73__ACHMonthlyChallengeTemplateDataProvider_hasMinimumActiveDaysWithError___block_invoke;
  v21[3] = &unk_24D13B490;
  v21[4] = &v28;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __73__ACHMonthlyChallengeTemplateDataProvider_hasMinimumActiveDaysWithError___block_invoke_2;
  v20[3] = &unk_24D13AEA8;
  objc_msgSend(v15, "enumerateActivitySummariesForDateComponentInterval:handler:errorHandler:", v14, v21, v20);

  v16 = (id)v23[5];
  v17 = v16;
  if (v16)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v16);
    else
      _HKLogDroppedError();
  }

  v19 = v29[3] > 13;
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v19;
}

void __73__ACHMonthlyChallengeTemplateDataProvider_hasMinimumActiveDaysWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  double v6;
  id v7;

  v3 = a2;
  if (objc_msgSend(v3, "activityMoveMode") == 2)
    objc_msgSend(v3, "appleMoveTime");
  else
    objc_msgSend(v3, "activeEnergyBurned");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityMoveMode");

  if (v4 == 2)
    objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  else
    objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v5);
  if (v6 > 2.22044605e-16)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

void __73__ACHMonthlyChallengeTemplateDataProvider_hasMinimumActiveDaysWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)isWheelchairUserWithError:(id *)a3
{
  void *v5;
  void *v6;
  BOOL v7;

  if (!-[ACHMonthlyChallengeTemplateDataProvider isUsingNewAwardingSystem](self, "isUsingNewAwardingSystem"))
    return -[ACHMonthlyChallengeTemplateDataProvider isWheelchairUser](self, "isWheelchairUser");
  -[ACHMonthlyChallengeTemplateDataProvider healthStore](self, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wheelchairUseWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "wheelchairUse") == 2;
  else
    v7 = 0;

  return v7;
}

- (int64_t)currentActivityMoveModeWithError:(id *)a3
{
  NSNumber *moveModeOverride;
  int64_t v5;
  void *v7;
  void *v8;

  moveModeOverride = self->_moveModeOverride;
  if (moveModeOverride)
    return -[NSNumber intValue](moveModeOverride, "intValue", a3);
  if (!-[ACHMonthlyChallengeTemplateDataProvider isUsingNewAwardingSystem](self, "isUsingNewAwardingSystem"))
    return -[ACHMonthlyChallengeTemplateDataProvider currentActivityMoveMode](self, "currentActivityMoveMode");
  -[ACHMonthlyChallengeTemplateDataProvider healthStore](self, "healthStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activityMoveModeWithError:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v5 = objc_msgSend(v8, "activityMoveMode");
  else
    v5 = 1;

  return v5;
}

- (unint64_t)currentExperienceTypeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  if (!-[ACHMonthlyChallengeTemplateDataProvider isUsingNewAwardingSystem](self, "isUsingNewAwardingSystem"))
    return -[ACHMonthlyChallengeTemplateDataProvider currentExperienceType](self, "currentExperienceType");
  -[ACHMonthlyChallengeTemplateDataProvider healthStore](self, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateOfBirthComponentsWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ACHMonthlyChallengeTemplateDataProvider currentCalendar](self, "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHMonthlyChallengeTemplateDataProvider currentDate](self, "currentDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = FIExperienceTypeForBirthDateComponentsWithCurrentDateAndCalendar();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isWheelchairUser
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3DC0], "characteristicTypeForIdentifier:", *MEMORY[0x24BDD2A98]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "userCharacteristicsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "userCharacteristicForType:error:", v3, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = objc_msgSend(v6, "integerValue");

  if (v7)
  {
    ACHLogMonthlyChallenges();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "Cannot determine if user is wheelchair user with error %@", buf, 0xCu);
    }

    v10 = 0;
  }
  else
  {
    v10 = v8 == 2;
  }

  return v10;
}

- (int64_t)currentActivityMoveMode
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  int64_t v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3DC0], "characteristicTypeForIdentifier:", *MEMORY[0x24BDD2A70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "userCharacteristicsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "userCharacteristicForType:error:", v3, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  if (v6)
  {
    v8 = objc_msgSend(v6, "integerValue");
  }
  else
  {
    ACHLogMonthlyChallenges();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "Cannot determine user activity move mode with error [%{public}@], falling back to active energy.", buf, 0xCu);
    }

    v8 = 1;
  }

  return v8;
}

- (unint64_t)currentExperienceType
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3DC0], "characteristicTypeForIdentifier:", *MEMORY[0x24BDD2A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "userCharacteristicsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "userCharacteristicForType:error:", v3, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;

  if (v6)
  {
    -[ACHMonthlyChallengeTemplateDataProvider currentCalendar](self, "currentCalendar");
    v8 = objc_claimAutoreleasedReturnValue();
    -[ACHMonthlyChallengeTemplateDataProvider currentDate](self, "currentDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = FIExperienceTypeForBirthDateComponentsWithCurrentDateAndCalendar();

  }
  else
  {
    if (!v7)
    {
      v10 = 3;
      goto LABEL_8;
    }
    ACHLogMonthlyChallenges();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "MonthlyChallengeDataProvider failed to get date of birth when determining current exprience type: %@", buf, 0xCu);
    }
    v10 = 3;
  }

LABEL_8:
  return v10;
}

- (BOOL)hasMinimumActiveDays
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  -[ACHMonthlyChallengeTemplateDataProvider currentCalendar](self, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateDataProvider currentDate](self, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_dateByAddingDays:toDate:", -35, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHMonthlyChallengeTemplateDataProvider currentCalendar](self, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE012A8];
  objc_msgSend(v6, "components:fromDate:", *MEMORY[0x24BE012A8], v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHMonthlyChallengeTemplateDataProvider currentCalendar](self, "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateDataProvider currentDate](self, "currentDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "components:fromDate:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01828]), "initWithStartDateComponents:endDateComponents:", v8, v11);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[ACHMonthlyChallengeTemplateDataProvider activitySummaryUtility](self, "activitySummaryUtility");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__ACHMonthlyChallengeTemplateDataProvider_hasMinimumActiveDays__block_invoke;
  v15[3] = &unk_24D13C068;
  v15[4] = &v16;
  objc_msgSend(v13, "enumerateActivitySummariesForDateComponentInterval:handler:", v12, v15);

  LOBYTE(v13) = v17[3] > 13;
  _Block_object_dispose(&v16, 8);

  return (char)v13;
}

void __63__ACHMonthlyChallengeTemplateDataProvider_hasMinimumActiveDays__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  double v6;
  id v7;

  v3 = a2;
  if (objc_msgSend(v3, "activityMoveMode") == 2)
    objc_msgSend(v3, "appleMoveTime");
  else
    objc_msgSend(v3, "activeEnergyBurned");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityMoveMode");

  if (v4 == 2)
    objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  else
    objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v5);
  if (v6 > 2.22044605e-16)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

- (void)setCurrentDateOverride:(id)a3
{
  objc_storeStrong((id *)&self->_currentDateOverride, a3);
}

- (void)setCurrentCalendarOverride:(id)a3
{
  objc_storeStrong((id *)&self->_currentCalendarOverride, a3);
}

- (void)setMoveModeOverride:(int64_t)a3
{
  NSNumber *v4;
  NSNumber *moveModeOverride;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  moveModeOverride = self->_moveModeOverride;
  self->_moveModeOverride = v4;

}

- (NSDate)currentDate
{
  NSDate *currentDateOverride;

  currentDateOverride = self->_currentDateOverride;
  if (currentDateOverride)
    return currentDateOverride;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSCalendar)currentCalendar
{
  NSCalendar *currentCalendarOverride;

  currentCalendarOverride = self->_currentCalendarOverride;
  if (currentCalendarOverride)
    return currentCalendarOverride;
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendarWithLocalTimeZone");
  return (NSCalendar *)(id)objc_claimAutoreleasedReturnValue();
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (ACHActivitySummaryIterator)activitySummaryIterator
{
  return self->_activitySummaryIterator;
}

- (void)setActivitySummaryIterator:(id)a3
{
  objc_storeStrong((id *)&self->_activitySummaryIterator, a3);
}

- (ACHAchievementStoring)achievementStore
{
  return (ACHAchievementStoring *)objc_loadWeakRetained((id *)&self->_achievementStore);
}

- (void)setAchievementStore:(id)a3
{
  objc_storeWeak((id *)&self->_achievementStore, a3);
}

- (ACHEarnedInstanceStore)earnedInstanceStore
{
  return self->_earnedInstanceStore;
}

- (void)setEarnedInstanceStore:(id)a3
{
  objc_storeStrong((id *)&self->_earnedInstanceStore, a3);
}

- (ACHTemplateStore)templateStore
{
  return self->_templateStore;
}

- (void)setTemplateStore:(id)a3
{
  objc_storeStrong((id *)&self->_templateStore, a3);
}

- (void)setCurrentCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_currentCalendar, a3);
}

- (void)setCurrentDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentDate, a3);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (ACHActivitySummaryUtility)activitySummaryUtility
{
  return (ACHActivitySummaryUtility *)objc_loadWeakRetained((id *)&self->_activitySummaryUtility);
}

- (void)setActivitySummaryUtility:(id)a3
{
  objc_storeWeak((id *)&self->_activitySummaryUtility, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activitySummaryUtility);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_templateStore, 0);
  objc_storeStrong((id *)&self->_earnedInstanceStore, 0);
  objc_destroyWeak((id *)&self->_achievementStore);
  objc_storeStrong((id *)&self->_activitySummaryIterator, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_moveModeOverride, 0);
  objc_storeStrong((id *)&self->_currentCalendarOverride, 0);
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
}

@end
