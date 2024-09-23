@implementation HKActivityGoalSchedule(HDCodingSupport)

+ (id)createWithCodable:()HDCodingSupport
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend([a1 alloc], "_init");
    if (objc_msgSend(v5, "applyToObject:", v6))
    {
      v7 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
      objc_msgSend(v6, "_validateWithConfiguration:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v10 = 0;
      else
        v10 = v6;
      v11 = v10;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (HDCodableActivityGoalSchedule)codableRepresentationForSync
{
  HDCodableActivityGoalSchedule *v2;
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
  objc_super v15;

  v2 = objc_alloc_init(HDCodableActivityGoalSchedule);
  v15.receiver = a1;
  v15.super_class = (Class)&off_1EF224D40;
  objc_msgSendSuper2(&v15, sel_codableRepresentationForSync);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableActivityGoalSchedule setSample:](v2, "setSample:", v3);
  -[HDCodableActivityGoalSchedule setGoalType:](v2, "setGoalType:", objc_msgSend(a1, "goalType"));
  objc_msgSend(a1, "mondayGoal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_unit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "unitString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableActivityGoalSchedule setUnitString:](v2, "setUnitString:", v6);

  objc_msgSend(a1, "mondayGoal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v5);
  -[HDCodableActivityGoalSchedule setMondayGoal:](v2, "setMondayGoal:");

  objc_msgSend(a1, "tuesdayGoal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v5);
  -[HDCodableActivityGoalSchedule setTuesdayGoal:](v2, "setTuesdayGoal:");

  objc_msgSend(a1, "wednesdayGoal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", v5);
  -[HDCodableActivityGoalSchedule setWednesdayGoal:](v2, "setWednesdayGoal:");

  objc_msgSend(a1, "thursdayGoal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValueForUnit:", v5);
  -[HDCodableActivityGoalSchedule setThursdayGoal:](v2, "setThursdayGoal:");

  objc_msgSend(a1, "fridayGoal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValueForUnit:", v5);
  -[HDCodableActivityGoalSchedule setFridayGoal:](v2, "setFridayGoal:");

  objc_msgSend(a1, "saturdayGoal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValueForUnit:", v5);
  -[HDCodableActivityGoalSchedule setSaturdayGoal:](v2, "setSaturdayGoal:");

  objc_msgSend(a1, "sundayGoal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValueForUnit:", v5);
  -[HDCodableActivityGoalSchedule setSundayGoal:](v2, "setSundayGoal:");

  return v2;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "codableRepresentationForSync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addActivityGoalSchedules:", v5);

  return v5 != 0;
}

@end
