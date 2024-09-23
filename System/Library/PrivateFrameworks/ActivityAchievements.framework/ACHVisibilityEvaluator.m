@implementation ACHVisibilityEvaluator

- (BOOL)unearnedAchievementIsVisibleNow:(id)a3 activityMoveMode:(int64_t)a4 experienceType:(unint64_t)a5 isFitnessPlusSubscriber:(BOOL)a6
{
  return -[ACHVisibilityEvaluator unearnedAchievementIsVisibleNow:activityMoveMode:experienceType:isFitnessPlusSubscriber:isWheelchairUser:](self, "unearnedAchievementIsVisibleNow:activityMoveMode:experienceType:isFitnessPlusSubscriber:isWheelchairUser:", a3, a4, a5, a6, 0);
}

- (BOOL)unearnedAchievementIsVisibleNow:(id)a3 activityMoveMode:(int64_t)a4 experienceType:(unint64_t)a5
{
  return -[ACHVisibilityEvaluator unearnedAchievementIsVisibleNow:activityMoveMode:experienceType:isFitnessPlusSubscriber:](self, "unearnedAchievementIsVisibleNow:activityMoveMode:experienceType:isFitnessPlusSubscriber:", a3, a4, a5, 0);
}

- (BOOL)unearnedAchievementIsVisibleNow:(id)a3 activityMoveMode:(int64_t)a4 experienceType:(unint64_t)a5 isFitnessPlusSubscriber:(BOOL)a6 isWheelchairUser:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  ACHVisibilityEnvironment *v22;
  void *v23;
  uint64_t v24;
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
  id v40;
  int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  _BOOL4 v53;
  void *v54;
  int v55;
  int v56;
  NSObject *v57;
  NSObject *v59;
  int v60;
  void *v61;
  ACHPredicateExpressionValidator *v62;
  _BOOL4 v63;
  void *v64;
  int v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  int v73;
  __int16 v74;
  int v75;
  __int16 v76;
  int v77;
  __int16 v78;
  int v79;
  __int16 v80;
  int v81;
  __int16 v82;
  int v83;
  _BYTE v84[128];
  uint64_t v85;

  v7 = a7;
  v63 = a6;
  v85 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  objc_msgSend(v11, "template");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHVisibilityEvaluator injectedNow](self, "injectedNow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  -[ACHVisibilityEvaluator injectedIsStandalonePhoneFitnessMode](self, "injectedIsStandalonePhoneFitnessMode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[ACHVisibilityEvaluator injectedIsStandalonePhoneFitnessMode](self, "injectedIsStandalonePhoneFitnessMode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isStandalonePhoneFitnessMode");
  }
  v20 = v19;

  v62 = objc_alloc_init(ACHPredicateExpressionValidator);
  -[ACHPredicateExpressionValidator validateTemplate:](v62, "validateTemplate:", v12);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v61, "isValid"))
  {
    objc_msgSend(v12, "graceVisibilityPredicate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21 || (objc_msgSend(v12, "visibilityPredicate"), (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v22 = objc_alloc_init(ACHVisibilityEnvironment);
      -[ACHVisibilityEnvironment setActivityMoveMode:](v22, "setActivityMoveMode:", a4);
      -[ACHVisibilityEnvironment setExperienceType:](v22, "setExperienceType:", a5);
      -[ACHVisibilityEnvironment setIsStandalonePhoneFitnessMode:](v22, "setIsStandalonePhoneFitnessMode:", v20);
      -[ACHVisibilityEnvironment setPrerequisiteMet:](v22, "setPrerequisiteMet:", objc_msgSend(v11, "prerequisiteMet"));
      -[ACHVisibilityEnvironment setEarnedInstanceCount:](v22, "setEarnedInstanceCount:", objc_msgSend(v11, "earnedInstanceCount"));
      -[ACHVisibilityEnvironment setIsWheelchairUser:](v22, "setIsWheelchairUser:", v7);
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v23, "evaluateWithObject:", v22);

    }
    else
    {
      v60 = 1;
    }
  }
  else
  {
    v60 = 0;
  }
  objc_msgSend(v12, "visibilityStart");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24
    && (v25 = (void *)v24,
        objc_msgSend(v12, "visibilityEnd"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v26,
        v25,
        v26))
  {
    -[ACHVisibilityEvaluator calendar](self, "calendar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "visibilityStart");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dateFromComponents:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACHVisibilityEvaluator calendar](self, "calendar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "visibilityEnd");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dateFromComponents:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACHVisibilityEvaluator calendar](self, "calendar");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "hk_startOfDateByAddingDays:toDate:", 1, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v29, v34);
    v65 = objc_msgSend(v35, "containsDate:", v16);

  }
  else
  {
    v65 = 1;
  }
  objc_msgSend(v12, "availableCountryCodes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v36, "count");

  if (v37)
  {
    -[ACHVisibilityEvaluator injectedWatchCountryCode](self, "injectedWatchCountryCode");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38)
    {
      v40 = v38;
    }
    else
    {
      ACHPairedWatchCountryCode();
      v40 = (id)objc_claimAutoreleasedReturnValue();
    }
    v42 = v40;

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    objc_msgSend(v12, "availableCountryCodes");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
    if (v44)
    {
      v45 = v44;
      v37 = *(void **)v67;
      while (2)
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(void **)v67 != v37)
            objc_enumerationMutation(v43);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "caseInsensitiveCompare:", v42))
          {
            v41 = 1;
            goto LABEL_31;
          }
        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
        if (v45)
          continue;
        break;
      }
    }
    v41 = 0;
LABEL_31:

  }
  else
  {
    v41 = 1;
  }
  if (ACHTemplateIsRemote(v12)
    && (unint64_t)objc_msgSend(v12, "mobileAssetVersion") >= 4
    && (objc_msgSend(v12, "availableOnPairedDevice") & 1) == 0)
  {
    ACHLogTemplates();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      -[ACHVisibilityEvaluator unearnedAchievementIsVisibleNow:activityMoveMode:experienceType:isFitnessPlusSubscriber:isWheelchairUser:].cold.1(v12, v59);

    v47 = 0;
  }
  else
  {
    v47 = 1;
  }
  objc_msgSend(v12, "goalExpression");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v48)
  {
    objc_msgSend(v12, "graceGoalExpression");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v37)
    {
      v49 = v16;
      v53 = 0;
LABEL_44:

      goto LABEL_45;
    }
  }
  v49 = v16;
  objc_msgSend(v11, "goal");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    objc_msgSend(v11, "goal");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "_value");
    v53 = v52 == 0.0;

  }
  else
  {
    v53 = 1;
  }

  if (!v48)
    goto LABEL_44;
LABEL_45:

  objc_msgSend(v12, "sourceName");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "isEqualToString:", CFSTR("FitnessPlusAwards"));

  v56 = v55 ^ 1 | v63;
  if (((v60 & v65) & !v53 & (v41 & v47) & v56 & 1) == 0)
  {
    ACHLogDefault();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v12, "uniqueName");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413826;
      v71 = v64;
      v72 = 1024;
      v73 = v60;
      v74 = 1024;
      v75 = v65;
      v76 = 1024;
      v77 = v41;
      v78 = 1024;
      v79 = v47;
      v80 = 1024;
      v81 = !v53;
      v82 = 1024;
      v83 = v56;
      _os_log_debug_impl(&dword_214029000, v57, OS_LOG_TYPE_DEBUG, "[%@] not visibile: visibleForPredicate = %{BOOL}d,\nvisibleForDates = %{BOOL}d,\nvisibleForCountryCode = %{BOOL}d,\nvisibleOnPairedDevice = %{BOOL}d,\nvisibleForGoalValue = %{BOOL}d,\nvisibleForFitnessPlusSubscriptionState = %{BOOL}d", buf, 0x30u);

    }
  }

  return v60 & v65 & !v53 & v41 & v47 & v56;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDate)injectedNow
{
  return self->_injectedNow;
}

- (NSNumber)injectedIsStandalonePhoneFitnessMode
{
  return self->_injectedIsStandalonePhoneFitnessMode;
}

- (ACHVisibilityEvaluator)init
{
  ACHVisibilityEvaluator *v2;
  uint64_t v3;
  NSCalendar *calendar;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACHVisibilityEvaluator;
  v2 = -[ACHVisibilityEvaluator init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendarWithLocalTimeZone");
    v3 = objc_claimAutoreleasedReturnValue();
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v3;

  }
  return v2;
}

- (BOOL)unearnedAchievementIsVisibleNow:(id)a3
{
  return -[ACHVisibilityEvaluator unearnedAchievementIsVisibleNow:activityMoveMode:experienceType:](self, "unearnedAchievementIsVisibleNow:activityMoveMode:experienceType:", a3, 1, 3);
}

- (BOOL)unearnedAchievementIsVisibleNow:(id)a3 activityMoveMode:(int64_t)a4
{
  return -[ACHVisibilityEvaluator unearnedAchievementIsVisibleNow:activityMoveMode:experienceType:](self, "unearnedAchievementIsVisibleNow:activityMoveMode:experienceType:", a3, a4, 3);
}

- (void)_injectIsStandalonePhoneFitnessMode:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ACHVisibilityEvaluator setInjectedIsStandalonePhoneFitnessMode:](self, "setInjectedIsStandalonePhoneFitnessMode:", v4);

}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (void)setInjectedNow:(id)a3
{
  objc_storeStrong((id *)&self->_injectedNow, a3);
}

- (NSString)injectedWatchCountryCode
{
  return self->_injectedWatchCountryCode;
}

- (void)setInjectedWatchCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_injectedWatchCountryCode, a3);
}

- (void)setInjectedIsStandalonePhoneFitnessMode:(id)a3
{
  objc_storeStrong((id *)&self->_injectedIsStandalonePhoneFitnessMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_injectedIsStandalonePhoneFitnessMode, 0);
  objc_storeStrong((id *)&self->_injectedWatchCountryCode, 0);
  objc_storeStrong((id *)&self->_injectedNow, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

- (void)unearnedAchievementIsVisibleNow:(void *)a1 activityMoveMode:(NSObject *)a2 experienceType:isFitnessPlusSubscriber:isWheelchairUser:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_214029000, a2, OS_LOG_TYPE_DEBUG, "Template %@ is not available on the paired device, so we won't show it on this device.", (uint8_t *)&v4, 0xCu);

}

@end
