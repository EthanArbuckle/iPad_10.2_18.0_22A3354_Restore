@implementation ACHAchievementLocalizationProvider

- (ACHAchievementLocalizationProvider)init
{
  ACHAchievementLocalizationProvider *v2;
  uint64_t v3;
  NSCalendar *gregorianCalendar;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACHAchievementLocalizationProvider;
  v2 = -[ACHAchievementLocalizationProvider init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v3 = objc_claimAutoreleasedReturnValue();
    gregorianCalendar = v2->_gregorianCalendar;
    v2->_gregorianCalendar = (NSCalendar *)v3;

    v2->_activityMoveMode = 1;
  }
  return v2;
}

- (void)setName:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  NSString *name;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (NSString *)objc_msgSend(v5, "length");
  if (v6)
    v6 = (NSString *)v8;
  name = self->_name;
  self->_name = v6;

}

- (id)currentDate
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[ACHAchievementLocalizationProvider currentDateOverride](self, "currentDateOverride");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)currentLocale
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[ACHAchievementLocalizationProvider currentLocaleOverride](self, "currentLocaleOverride");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)titleForAchievement:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  void *v8;

  v4 = a3;
  -[ACHAchievementLocalizationProvider localizedStringForKey:withAchievement:fitnessExperienceType:](self, "localizedStringForKey:withAchievement:fitnessExperienceType:", CFSTR("ACHIEVEMENT_TITLE"), v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = ACHIsActivityAchievementPrerelease(v4);

  if (v6 && (objc_msgSend(v5, "containsString:", CFSTR("[Prerelease]")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[Prerelease] %@"), v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (id)unachievedDescriptionForAchievement:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[ACHAchievementLocalizationProvider paused](self, "paused") && objc_msgSend(v4, "isRingsBased"))
  {
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isStandalonePhoneFitnessMode");

    if (v6)
      v7 = (id)objc_msgSend(CFSTR("ACHIEVEMENT_UNACHIEVED_RINGS_AWARD_PAUSED_DESCRIPTION"), "stringByAppendingString:", CFSTR("_STANDALONE_PHONE"));
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ACHIEVEMENT_UNACHIEVED_RINGS_AWARD_PAUSED_DESCRIPTION"), &stru_24D1281D8, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ACHAchievementLocalizationProvider localizedStringForKey:withAchievement:fitnessExperienceType:](self, "localizedStringForKey:withAchievement:fitnessExperienceType:", CFSTR("ACHIEVEMENT_UNACHIEVED_DESCRIPTION"), v4, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)unachievedShortDescriptionForAchievement:(id)a3
{
  id v4;
  void *v5;
  char v6;
  __CFString *v7;

  v4 = a3;
  if (-[ACHAchievementLocalizationProvider paused](self, "paused")
    && (objc_msgSend(v4, "section"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ACTIVITY")),
        v5,
        (v6 & 1) != 0))
  {
    v7 = CFSTR("ACHIEVEMENT_UNACHIEVED_SHORT_DESCRIPTION");
  }
  else
  {
    -[ACHAchievementLocalizationProvider localizedStringForKey:withAchievement:fitnessExperienceType:](self, "localizedStringForKey:withAchievement:fitnessExperienceType:", CFSTR("ACHIEVEMENT_UNACHIEVED_SHORT_DESCRIPTION"), v4, 1);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_descriptionKeyForLongestMoveStreak:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  __CFString *v16;
  __CFString *v17;

  v4 = a3;
  -[ACHAchievementLocalizationProvider gregorianCalendar](self, "gregorianCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relevantEarnedInstance");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "earnedDateComponents");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHAchievementLocalizationProvider gregorianCalendar](self, "gregorianCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "isDateInYesterday:", v8);

  -[ACHAchievementLocalizationProvider gregorianCalendar](self, "gregorianCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v10, "isDateInToday:", v8);

  v11 = v6 | v7;
  if (-[ACHAchievementLocalizationProvider paused](self, "paused"))
  {
    objc_msgSend(v4, "goal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "progress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "compare:", v13);

    if (v14)
      v15 = v11;
    else
      v15 = 1;
    if (v15)
      v16 = CFSTR("ACHIEVEMENT_ACHIEVED_DESCRIPTION_ACTIVE_PAUSED");
    else
      v16 = CFSTR("ACHIEVEMENT_ACHIEVED_DESCRIPTION_INACTIVE_PAUSED");
  }
  else if (v11)
  {
    v16 = CFSTR("ACHIEVEMENT_ACHIEVED_DESCRIPTION_ACTIVE");
  }
  else
  {
    v16 = CFSTR("ACHIEVEMENT_ACHIEVED_DESCRIPTION_INACTIVE");
  }
  v17 = v16;

  return v17;
}

- (id)achievedDescriptionForAchievement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  __CFString *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "template");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("LongestMoveStreak"));

  if (v7)
  {
    -[ACHAchievementLocalizationProvider _descriptionKeyForLongestMoveStreak:](self, "_descriptionKeyForLongestMoveStreak:", v4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("ACHIEVEMENT_ACHIEVED_DESCRIPTION");
  }
  -[ACHAchievementLocalizationProvider localizedStringForKey:withAchievement:fitnessExperienceType:](self, "localizedStringForKey:withAchievement:fitnessExperienceType:", v8, v4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)achievedShortDescriptionForAchievement:(id)a3
{
  return -[ACHAchievementLocalizationProvider localizedStringForKey:withAchievement:fitnessExperienceType:](self, "localizedStringForKey:withAchievement:fitnessExperienceType:", CFSTR("ACHIEVEMENT_ACHIEVED_SHORT_DESCRIPTION"), a3, 1);
}

- (id)friendAchievedTitleForAchievement:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[ACHAchievementLocalizationProvider localizedStringForKey:withAchievement:fitnessExperienceType:](self, "localizedStringForKey:withAchievement:fitnessExperienceType:", CFSTR("ACHIEVEMENT_ACHIEVED_FRIEND_TITLE"), v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("ACHIEVEMENT_ACHIEVED_FRIEND_TITLE")))
  {
    -[ACHAchievementLocalizationProvider titleForAchievement:](self, "titleForAchievement:", v4);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return v5;
}

- (id)friendAchievedDescriptionForAchievement:(id)a3
{
  return -[ACHAchievementLocalizationProvider localizedStringForKey:withAchievement:fitnessExperienceType:](self, "localizedStringForKey:withAchievement:fitnessExperienceType:", CFSTR("ACHIEVEMENT_ACHIEVED_FRIEND_DESCRIPTION"), a3, 1);
}

- (id)_backDateStringForDate:(id)a3 achievement:(id)a4 dateStyle:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v7 = a3;
  objc_msgSend(a4, "template");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("MonthlyChallenges"));

  if (v10)
  {
    if (a5 > 2)
      v11 = 1;
    else
      v11 = qword_214063920[a5];
    ACHFormatDateWithStyle(v7, v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v7, a5, 0);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  return v13;
}

- (id)achievedAlertBackDescriptionForAchievement:(id)a3 sizeVariant:(int64_t)a4 dateSizeVariant:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v33;
  id v34;

  v8 = a3;
  if (!objc_msgSend(v8, "unearned"))
  {
    if ((ACHShouldUseNewAwardsSystem() & 1) != 0)
    {
      objc_msgSend(v8, "relevantEarnedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "earnedInstances");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[ACHAchievementLocalizationProvider gregorianCalendar](self, "gregorianCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "earnedDateComponents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateFromComponents:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACHAchievementLocalizationProvider name](self, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("EARNED_BY_NAME_%@_ON_DATE_%@");
    if (!v15)
      v16 = CFSTR("EARNED_ON_DATE_%@");
    v17 = v16;

    if ((unint64_t)a4 >= 2)
    {
      if (a4 == 2)
      {
        -[__CFString stringByAppendingString:](v17, "stringByAppendingString:", CFSTR("_SMALL"));
        v19 = objc_claimAutoreleasedReturnValue();

        if (a5)
          v18 = 1;
        else
          v18 = 2;
        v17 = (__CFString *)v19;
      }
      else
      {
        v18 = 0;
      }
    }
    else if (a5)
    {
      v18 = 2;
    }
    else
    {
      v18 = 3;
    }
    objc_msgSend(v8, "template");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sourceName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("MonthlyChallenges"));

    if (v22)
    {
      if ((-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("EARNED_ON_DATE_%@")) & 1) != 0)
      {
        v23 = CFSTR("EARNED_ON_DATE_%@_MC");
      }
      else
      {
        if (!-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("EARNED_BY_NAME_%@_ON_DATE_%@")))goto LABEL_24;
        v23 = CFSTR("EARNED_BY_NAME_%@_ON_DATE_%@_MC");
      }

      v17 = (__CFString *)v23;
    }
LABEL_24:
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", v17, &stru_24D1281D8, CFSTR("Localizable"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHAchievementLocalizationProvider _backDateStringForDate:achievement:dateStyle:](self, "_backDateStringForDate:achievement:dateStyle:", v14, v8, v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHAchievementLocalizationProvider name](self, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x24BDD17C8];
    if (v27)
    {
      v34 = 0;
      -[ACHAchievementLocalizationProvider name](self, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v25, CFSTR("%@%@"), &v34, v29, v26);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v30 = v34;

      if (v9)
        goto LABEL_32;
    }
    else
    {
      v33 = 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v25, CFSTR("%@"), &v33, v26);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v30 = v33;
      if (v9)
      {
LABEL_32:

        goto LABEL_33;
      }
    }
    if (v30)
    {
      ACHLogDefault();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[ACHAchievementLocalizationProvider achievedAlertBackDescriptionForAchievement:sizeVariant:dateSizeVariant:].cold.1();

      v9 = v25;
    }
    goto LABEL_32;
  }
  -[ACHAchievementLocalizationProvider unachievedAlertBackDescriptionForAchievement:](self, "unachievedAlertBackDescriptionForAchievement:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

  return v9;
}

- (id)unachievedAlertDescriptionForAchievement:(id)a3 fitnessExperienceType:(unint64_t)a4
{
  return -[ACHAchievementLocalizationProvider localizedStringForKey:withAchievement:fitnessExperienceType:](self, "localizedStringForKey:withAchievement:fitnessExperienceType:", CFSTR("ACHIEVEMENT_UNACHIEVED_ALERT_DESCRIPTION"), a3, a4);
}

- (id)achievedAlertDescriptionForAchievement:(id)a3 fitnessExperienceType:(unint64_t)a4
{
  return -[ACHAchievementLocalizationProvider localizedStringForKey:withAchievement:fitnessExperienceType:](self, "localizedStringForKey:withAchievement:fitnessExperienceType:", CFSTR("ACHIEVEMENT_ACHIEVED_ALERT_DESCRIPTION"), a3, a4);
}

- (id)unachievedAlertBackDescriptionForAchievement:(id)a3
{
  return -[ACHAchievementLocalizationProvider localizedStringForKey:withAchievement:fitnessExperienceType:](self, "localizedStringForKey:withAchievement:fitnessExperienceType:", CFSTR("ACHIEVEMENT_UNACHIEVED_ALERT_BACK_DESCRIPTION"), a3, 1);
}

- (id)shareDescriptionForAchievement:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "unearned"))
    v5 = CFSTR("ACHIEVEMENT_SHARING_UNACHIEVED_DESCRIPTION");
  else
    v5 = CFSTR("ACHIEVEMENT_SHARING_DESCRIPTION");
  -[ACHAchievementLocalizationProvider localizedStringForKey:withAchievement:fitnessExperienceType:](self, "localizedStringForKey:withAchievement:fitnessExperienceType:", v5, v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_localizedStringWithKey:(id)a3 withAchievement:(id)a4 experienceType:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "localizationBundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (ACHMonthlyChallengeShouldUseAvailableSuffixes(v8))
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(v8, "template");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "availableSuffixes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v11;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v29 != v14)
              objc_enumerationMutation(obj);
            v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            v17 = (void *)MEMORY[0x24BDBCF48];
            objc_msgSend(v9, "path");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringByAppendingString:", v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "fileURLWithPath:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            -[ACHAchievementLocalizationProvider _localizedStringWithKey:withAchievement:localizationBundleURL:experienceType:](self, "_localizedStringWithKey:withAchievement:localizationBundleURL:experienceType:", v7, v8, v20, a5);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21;
            if (v21 && !objc_msgSend(v21, "isEqualToString:", v7))
            {

              goto LABEL_18;
            }

          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          if (v13)
            continue;
          break;
        }
      }

    }
    -[ACHAchievementLocalizationProvider _localizedStringWithKey:withAchievement:localizationBundleURL:experienceType:](self, "_localizedStringWithKey:withAchievement:localizationBundleURL:experienceType:", v7, v8, v9, a5);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ACHLogDefault();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[ACHAchievementLocalizationProvider _localizedStringWithKey:withAchievement:experienceType:].cold.1((uint64_t)v7, v8, v24);

    v23 = v7;
  }
  v22 = v23;
LABEL_18:

  return v22;
}

- (id)_localizedStringWithKey:(id)a3 withAchievement:(id)a4 localizationBundleURL:(id)a5 experienceType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[ACHAchievementLocalizationProvider _suffixesForLocalizedStringLookup](self, "_suffixesForLocalizedStringLookup");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHAchievementLocalizationProvider _allStringCombinationsWithPrefix:andSuffixes:](self, "_allStringCombinationsWithPrefix:andSuffixes:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("length"), 1);
    v39 = v36;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v14;
    objc_msgSend(v14, "sortedArrayUsingDescriptors:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    v18 = CFSTR("Localizable");
    if (a6 == 2)
      v18 = CFSTR("Localizable-Modified-tinker");
    if (a6 == 3)
      v18 = CFSTR("Localizable-Simplified-tinker");
    v19 = v18;
    v20 = 0;
    if (!objc_msgSend(v17, "count"))
      goto LABEL_30;
    do
    {
      v21 = v20;
      objc_msgSend(v17, "lastObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      FIRandomStringForPrefixWithTableName();
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20 && !objc_msgSend(v20, "isEqualToString:", v22))
      {
        v23 = 1;
      }
      else
      {
        objc_msgSend(v17, "removeLastObject");
        v23 = 0;
      }

      v24 = objc_msgSend(v17, "count");
    }
    while ((v23 & 1) == 0 && v24);
    if ((v23 & 1) == 0)
    {
LABEL_30:
      v25 = v20;
      FIRandomStringForPrefixWithTableName();
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20 || objc_msgSend(v20, "isEqualToString:", v10))
      {
        FIRandomStringForPrefixWithTableName();
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v26)
          goto LABEL_20;
        v20 = v26;
        if ((objc_msgSend(v26, "isEqualToString:", v10) & 1) != 0)
          goto LABEL_20;
      }
    }
    -[ACHAchievementLocalizationProvider _pluralizeLocalizedString:withAchievement:](self, "_pluralizeLocalizedString:withAchievement:", v20, v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26
      || (-[ACHAchievementLocalizationProvider _replacePlaceholdersInString:withAchievement:](self, "_replacePlaceholdersInString:withAchievement:", v26, v11), (v27 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_20:
      ACHLogDefault();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "template");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "uniqueName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "bundlePath");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v41 = v10;
        v42 = 2114;
        v43 = v31;
        v44 = 2114;
        v45 = v32;
        _os_log_error_impl(&dword_214029000, v28, OS_LOG_TYPE_ERROR, "No localization found for key (%{public}@) for achievement (%{public}@} in bundle path (%{public}@)", buf, 0x20u);

      }
      v27 = v10;
    }

  }
  else
  {
    ACHLogDefault();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "template");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "uniqueName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v10;
      v42 = 2114;
      v43 = v34;
      v44 = 2114;
      v45 = v12;
      _os_log_error_impl(&dword_214029000, v29, OS_LOG_TYPE_ERROR, "Could not load localization bundle for key: %{public}@, achievement: %{public}@}, localizationBundleURL: %{public}@}", buf, 0x20u);

    }
    v27 = v10;
  }

  return v27;
}

- (id)_pluralizeLocalizedString:(id)a3 withAchievement:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  id v27;
  int v28;
  BOOL v29;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  id v39;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v41 = a4;
  v6 = v5;
  v52 = 0uLL;
  v53 = 0;
  if (objc_msgSend(v6, "containsString:", CFSTR("%#@")))
  {
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isAtEnd") & 1) == 0)
    {
      v8 = 0;
      v9 = 0;
      do
      {
        v10 = v9;
        objc_msgSend(v7, "scanUpToString:intoString:", CFSTR("%#@"), 0);
        v11 = objc_msgSend(v7, "scanString:intoString:", CFSTR("%#@"), 0);
        v48 = v9;
        objc_msgSend(v7, "scanUpToString:intoString:", CFSTR("@"), &v48);
        v9 = v48;

        v12 = objc_msgSend(v7, "scanString:intoString:", CFSTR("@"), 0);
        if (v11 && v12)
        {
          if (v8 <= 2)
          {
            -[ACHAchievementLocalizationProvider _valueFromPlaceholder:withAchievement:](self, "_valueFromPlaceholder:withAchievement:", v9, v41);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v14 = objc_msgSend(v13, "integerValue");
            }
            else
            {
              ACHLogDefault();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v51 = v9;
                _os_log_error_impl(&dword_214029000, v15, OS_LOG_TYPE_ERROR, "Placeholder value for pluralization does not respond to -integerValue. Using zero instead for placeholder: %@", buf, 0xCu);
              }

              v14 = 0;
            }
            *((_QWORD *)&v52 + v8) = v14;

          }
          ++v8;
        }
      }
      while ((objc_msgSend(v7, "isAtEnd") & 1) == 0);

      if (v8 >= 4)
      {
        ACHLogDefault();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[ACHAchievementLocalizationProvider _pluralizeLocalizedString:withAchievement:].cold.2((uint64_t)v6, v34, v36);
        v18 = v6;
        goto LABEL_49;
      }
LABEL_41:
      v42 = 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%ld%ld%ld"), &v42, v52, v53);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v34 = v42;

      if (!v18 && v34)
      {
        ACHLogDefault();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          -[ACHAchievementLocalizationProvider _pluralizeLocalizedString:withAchievement:].cold.1();

        v18 = v6;
      }
LABEL_49:

      goto LABEL_50;
    }
LABEL_39:

    goto LABEL_41;
  }
  objc_msgSend(&unk_24D138F28, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v6, "containsString:", v16);

  v18 = v6;
  if (v17)
  {
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v19 = objc_msgSend(&unk_24D138F40, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v19)
    {
      v20 = v19;
      v39 = v6;
      v21 = 0;
      v22 = *(_QWORD *)v45;
      do
      {
        v23 = 0;
        v24 = v21;
        v25 = (char *)&v52 + 8 * v21;
        do
        {
          if (*(_QWORD *)v45 != v22)
            objc_enumerationMutation(&unk_24D138F40);
          v26 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v23);
          objc_msgSend(v7, "setScanLocation:", 0);
          objc_msgSend(v7, "scanUpToString:intoString:", v26, 0);
          LODWORD(v26) = objc_msgSend(v7, "scanString:intoString:", v26, 0);
          v43 = 0;
          objc_msgSend(v7, "scanUpToString:intoString:", CFSTR("@"), &v43);
          v27 = v43;
          v28 = objc_msgSend(v7, "scanString:intoString:", CFSTR("@"), 0);
          if ((_DWORD)v26)
            v29 = v28 == 0;
          else
            v29 = 1;
          if (!v29 && v24 + v23 <= 2)
          {
            -[ACHAchievementLocalizationProvider _valueFromPlaceholder:withAchievement:](self, "_valueFromPlaceholder:withAchievement:", v27, v41);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v32 = objc_msgSend(v31, "integerValue");
            }
            else
            {
              ACHLogDefault();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v51 = v27;
                _os_log_error_impl(&dword_214029000, v33, OS_LOG_TYPE_ERROR, "Placeholder value for pluralization does not respond to -integerValue. Using zero instead for placeholder: %@", buf, 0xCu);
              }

              v32 = 0;
            }
            *(_QWORD *)&v25[8 * v23] = v32;

          }
          ++v23;
        }
        while (v20 != v23);
        v20 = objc_msgSend(&unk_24D138F40, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        v21 = v24 + v23;
      }
      while (v20);
      v6 = v39;
    }
    goto LABEL_39;
  }
LABEL_50:
  v37 = v18;

  return v37;
}

- (id)_stringByTrimmingPlaceholderMarkersFromString:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{{"), &stru_24D1281D8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("}}"), &stru_24D1281D8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_replacePlaceholdersInString:(id)a3 withAchievement:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  id v22;
  void *v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v28 = a4;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\{\\{.*?\\}\\}"), 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "length");
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __83__ACHAchievementLocalizationProvider__replacePlaceholdersInString_withAchievement___block_invoke;
  v34[3] = &unk_24D1269B8;
  v35 = v5;
  v8 = v6;
  v36 = v8;
  v22 = v35;
  objc_msgSend(v23, "enumerateMatchesInString:options:range:usingBlock:", v35, 0, 0, v7, v34);
  v27 = (id)objc_msgSend(v22, "mutableCopy");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v8;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v31;
    *(_QWORD *)&v9 = 138412802;
    v21 = v9;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(":"), v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACHAchievementLocalizationProvider _stringByTrimmingPlaceholderMarkersFromString:](self, "_stringByTrimmingPlaceholderMarkersFromString:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)objc_msgSend(v12, "count") < 2)
        {
          v15 = 0;
        }
        else
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[ACHAchievementLocalizationProvider _stringByTrimmingPlaceholderMarkersFromString:](self, "_stringByTrimmingPlaceholderMarkersFromString:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[ACHAchievementLocalizationProvider _valueFromPlaceholder:withAchievement:](self, "_valueFromPlaceholder:withAchievement:", v14, v28);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "template");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACHAchievementLocalizationProvider _formatValue:forPlaceholder:usingFormatterNamed:template:](self, "_formatValue:forPlaceholder:usingFormatterNamed:template:", v17, v14, v16, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "replaceOccurrencesOfString:withString:options:range:", v11, v19, 0, 0, objc_msgSend(v27, "length"));
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    }
    while (v26);
  }

  return v27;
}

void __83__ACHAchievementLocalizationProvider__replacePlaceholdersInString_withAchievement___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = objc_msgSend(a2, "range");
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v3, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (id)_valueFromPlaceholder:(id)a3 withAchievement:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int IsMonthlyChallenge;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  NSObject *v74;
  uint8_t buf[4];
  id v76;
  __int16 v77;
  NSObject *v78;
  __int16 v79;
  __CFString *v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("progress_value")))
  {
    -[ACHAchievementLocalizationProvider _progressValueWithAchievement:](self, "_progressValueWithAchievement:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v12 = (__CFString *)v8;
    goto LABEL_14;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("achievement_value")))
  {
    -[ACHAchievementLocalizationProvider _achievementValueWithAchievement:](self, "_achievementValueWithAchievement:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("daily_target")))
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v7, "template");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dailyTarget");
    objc_msgSend(v9, "numberWithDouble:");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v12 = v11;
LABEL_8:

    goto LABEL_14;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("goal_value")))
  {
    -[ACHAchievementLocalizationProvider _goalValueWithAchievement:](self, "_goalValueWithAchievement:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("quantity_to_goal")))
  {
    -[ACHAchievementLocalizationProvider _quantityToGoalValueWithAchievement:](self, "_quantityToGoalValueWithAchievement:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("reference_progress_value")))
  {
    objc_msgSend(v7, "customPlaceholderValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("reference_progress_value"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      ACHLogDefault();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ACHAchievementLocalizationProvider _valueFromPlaceholder:withAchievement:].cold.1(v7);
      v12 = (__CFString *)&unk_24D139000;
      goto LABEL_45;
    }
    v15 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    -[NSObject setNumberStyle:](v15, "setNumberStyle:", 1);
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setLocale:](v15, "setLocale:", v16);

    -[NSObject numberFromString:](v15, "numberFromString:", v10);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    ACHLogDefault();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    objc_msgSend(v7, "template");
    v18 = objc_claimAutoreleasedReturnValue();
    -[NSObject uniqueName](v18, "uniqueName");
    v19 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v76 = v6;
    v77 = 2114;
    v78 = v19;
    v79 = 2114;
    v80 = v12;
    _os_log_impl(&dword_214029000, v17, OS_LOG_TYPE_DEFAULT, "Value from placeholder %{public}@ for template: %{public}@: %{public}@", buf, 0x20u);
    goto LABEL_19;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("workout_type")))
  {
    objc_msgSend(v7, "customPlaceholderValues");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("workout_type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      ACHLogDefault();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ACHAchievementLocalizationProvider _valueFromPlaceholder:withAchievement:].cold.2(v7);
      v12 = &stru_24D1281D8;
      goto LABEL_45;
    }
    objc_msgSend(v7, "template");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uniqueName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = ACHMonthlyChallengeTypeFromTemplateUniqueName(v22);

    ACHWorkoutLocationTypeForMonthlyChallengeType(v23);
    objc_msgSend(MEMORY[0x24BDD4118], "_workoutActivityTypeFromString:", v10);
    FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural();
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    ACHLogDefault();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
LABEL_45:

      goto LABEL_8;
    }
    objc_msgSend(v7, "template");
    v17 = objc_claimAutoreleasedReturnValue();
    -[NSObject uniqueName](v17, "uniqueName");
    v18 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v76 = v6;
    v77 = 2114;
    v78 = v18;
    v79 = 2114;
    v80 = v12;
    _os_log_impl(&dword_214029000, v15, OS_LOG_TYPE_DEFAULT, "Value from placeholder %{public}@ for template: %{public}@: %{public}@", buf, 0x20u);
    goto LABEL_24;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("pace_to_reach_goal")))
  {
    objc_msgSend(v7, "template");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ACHUnitForTemplateAndActivityMoveMode(v24, self->_activityMoveMode);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "template");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    IsMonthlyChallenge = ACHTemplateIsMonthlyChallenge(v26);

    v12 = (__CFString *)&unk_24D139000;
    if (!IsMonthlyChallenge || !v25)
      goto LABEL_58;
    objc_msgSend(v7, "progress");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValueForUnit:", v25);
    v30 = v29;

    objc_msgSend(v7, "goal");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "doubleValueForUnit:", v25);
    v33 = v32;

    if (v33 - v30 >= 0.0)
      v34 = v33 - v30;
    else
      v34 = 0.0;
    -[ACHAchievementLocalizationProvider gregorianCalendar](self, "gregorianCalendar");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHAchievementLocalizationProvider currentDate](self, "currentDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "components:fromDate:", 28, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "template");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "availabilityEnd");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "components:fromDateComponents:toDateComponents:options:", 16, v37, v39, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = objc_msgSend(v40, "day");
    if (v41 < 0)
    {
      v12 = (__CFString *)&unk_24D139000;
    }
    else
    {
      if (v41)
        v34 = v34 / (double)(v41 + 1);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v34);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_54;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("number_of_times_earned")))
  {
    v42 = ACHShouldUseNewAwardsSystem();
    v43 = (void *)MEMORY[0x24BDD16E0];
    if (v42)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "earnedInstanceCount"));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    objc_msgSend(v7, "earnedInstances");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("earned_date")))
  {
    if ((ACHShouldUseNewAwardsSystem() & 1) != 0)
    {
      objc_msgSend(v7, "relevantEarnedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "earnedInstances");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "lastObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[ACHAchievementLocalizationProvider gregorianCalendar](self, "gregorianCalendar");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "earnedDateComponents");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "dateFromComponents:", v46);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_57:
    goto LABEL_58;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("current_date")))
  {
    -[ACHAchievementLocalizationProvider currentDate](self, "currentDate");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("monthly_challenge_month")))
  {
    objc_msgSend(v7, "template");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "uniqueName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "componentsSeparatedByString:", CFSTR("_"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "lastObject");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectAtIndex:", objc_msgSend(v35, "count") - 2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHAchievementLocalizationProvider gregorianCalendar](self, "gregorianCalendar");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v51, "setDay:", 15);
    objc_msgSend(v51, "setMonth:", objc_msgSend(v48, "integerValue"));
    objc_msgSend(v51, "setYear:", objc_msgSend(v49, "integerValue"));
    objc_msgSend(v50, "dateFromComponents:", v51);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_54:
LABEL_58:

    goto LABEL_14;
  }
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("seymour_workout_modality")))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("seymour_workout_milestone")))
    {
      objc_msgSend(v7, "template");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "uniqueName");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "componentsSeparatedByString:", CFSTR("-"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "lastObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        ACHLogDefault();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[ACHAchievementLocalizationProvider _valueFromPlaceholder:withAchievement:].cold.4(v7);
        v12 = (__CFString *)&unk_24D139000;
        goto LABEL_25;
      }
      v17 = objc_alloc_init(MEMORY[0x24BDD16F0]);
      -[NSObject setNumberStyle:](v17, "setNumberStyle:", 1);
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setLocale:](v17, "setLocale:", v65);

      -[NSObject numberFromString:](v17, "numberFromString:", v15);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      ACHLogDefault();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_24:

LABEL_25:
        goto LABEL_45;
      }
      objc_msgSend(v7, "template");
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject uniqueName](v19, "uniqueName");
      v66 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v76 = v6;
      v77 = 2114;
      v78 = v66;
      v79 = 2114;
      v80 = v12;
      _os_log_impl(&dword_214029000, v18, OS_LOG_TYPE_DEFAULT, "Value from placeholder %{public}@ for template: %{public}@: %{public}@", buf, 0x20u);

LABEL_19:
      goto LABEL_24;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("user_first_name")))
    {
      -[ACHAchievementLocalizationProvider name](self, "name");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("vocative_user_first_name")))
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "invertedSet");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v69);

      if (v70 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "integerValue"));
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      objc_msgSend(v7, "customPlaceholderValues");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "objectForKeyedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v72 = objc_msgSend(v10, "length");
      v73 = v10;
      if (!v72)
      {
        ACHLogDefault();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v76 = v6;
          _os_log_impl(&dword_214029000, v74, OS_LOG_TYPE_DEFAULT, "Unknown localization placeholder: %@", buf, 0xCu);
        }

        v73 = v6;
      }
      v11 = v73;
      goto LABEL_7;
    }
    -[ACHAchievementLocalizationProvider currentLocale](self, "currentLocale");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[ACHAchievementLocalizationProvider name](self, "name");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (__CFString *)objc_msgSend(v67, "initWithFormat:locale:", CFSTR("%[VocativeName]@"), v25, v45);
    goto LABEL_57;
  }
  objc_msgSend(v7, "template");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "uniqueName");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "componentsSeparatedByString:", CFSTR("-"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v54, "count") < 2)
  {
    v56 = v54;
    ACHLogDefault();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      -[ACHAchievementLocalizationProvider _valueFromPlaceholder:withAchievement:].cold.3(v7);
    v12 = &stru_24D1281D8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = v54;
    objc_msgSend(v54, "objectAtIndexedSubscript:", 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v57;
    if (self->_wheelchairUser)
    {
      objc_msgSend(v57, "stringByAppendingString:", CFSTR("_WHEELCHAIR"));
      v59 = objc_claimAutoreleasedReturnValue();

      v58 = (void *)v59;
    }
    -[NSObject localizedStringForKey:value:table:](v55, "localizedStringForKey:value:table:", v58, &stru_24D1281D8, CFSTR("Localizable"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    ACHLogDefault();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "template");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "uniqueName");
      v62 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v76 = v6;
      v77 = 2114;
      v78 = v62;
      v79 = 2114;
      v80 = v12;
      _os_log_impl(&dword_214029000, v60, OS_LOG_TYPE_DEFAULT, "Value from placeholder %{public}@ for template: %{public}@: %{public}@", buf, 0x20u);

    }
  }

LABEL_14:
  return v12;
}

- (id)_formatValue:(id)a3 forPlaceholder:(id)a4 usingFormatterNamed:(id)a5 template:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("daily_target")))
  {
    objc_msgSend(v12, "dailyTargetCanonicalUnit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHAchievementLocalizationProvider _formatValue:usingFormatterNamed:template:forCanonicalUnit:](self, "_formatValue:usingFormatterNamed:template:forCanonicalUnit:", v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ACHAchievementLocalizationProvider _formatValue:usingFormatterNamed:template:forCanonicalUnit:](self, "_formatValue:usingFormatterNamed:template:forCanonicalUnit:", v10, v11, v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)_formatValue:(id)a3 usingFormatterNamed:(id)a4 template:(id)a5 forCanonicalUnit:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  ACHAchievementLocalizationProvider *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  int v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("count")))
  {
LABEL_2:
    ACHFormatCount(v10);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v15 = (void *)v14;
    goto LABEL_14;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("ordinal")))
  {
    ACHFormatOrdinal(v10);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("percentage")))
  {
    objc_msgSend(v10, "doubleValue");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16 / 100.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ACHFormatPercent(v17);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v15 = (void *)v18;

    goto LABEL_14;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("calories")))
  {
    objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self;
    v20 = v10;
    v21 = v17;
    v22 = 3;
LABEL_12:
    -[ACHAchievementLocalizationProvider _formattedEnergyValue:canonicalUnit:unitStyle:](v19, "_formattedEnergyValue:canonicalUnit:unitStyle:", v20, v21, v22);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("medium_calories")))
  {
    objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self;
    v20 = v10;
    v21 = v17;
    v22 = 2;
    goto LABEL_12;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("calories_without_units")))
  {
    objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHAchievementLocalizationProvider _formattedEnergyValueWithoutUnit:canonicalUnit:](self, "_formattedEnergyValueWithoutUnit:canonicalUnit:", v10, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("move_minutes")))
  {
    -[ACHAchievementLocalizationProvider _formattedMoveTimeValue:](self, "_formattedMoveTimeValue:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("move_goal")))
  {
    -[ACHAchievementLocalizationProvider _formattedMoveGoal:template:](self, "_formattedMoveGoal:template:", v10, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("distance")))
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("swim_distance")))
    {
      -[ACHAchievementLocalizationProvider achUnitManager](self, "achUnitManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
        goto LABEL_51;
      objc_msgSend(v12, "canonicalUnit");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHAchievementLocalizationProvider achUnitManager](self, "achUnitManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "userLapLengthHKUnit");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "doubleValue");
      objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "doubleValueForUnit:", v29);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v28) = objc_msgSend(v29, "isEqual:", v32);

      v33 = (_DWORD)v28 == 0;
      v34 = 1283;
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("elevation_gain")))
      {
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("duration")))
        {
          ACHFormatDuration(v10);
          v14 = objc_claimAutoreleasedReturnValue();
          goto LABEL_5;
        }
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("minutes")))
        {
          ACHFormatMinutes(v10);
          v14 = objc_claimAutoreleasedReturnValue();
          goto LABEL_5;
        }
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("days")))
        {
          ACHFormatNumberOfDays(v10);
          v14 = objc_claimAutoreleasedReturnValue();
          goto LABEL_5;
        }
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("date")))
        {
          v51 = v10;
          v52 = 0;
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("week")))
        {
          v51 = v10;
          v52 = 4;
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("month")))
        {
          v51 = v10;
          v52 = 5;
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("monthyear")))
        {
          v51 = v10;
          v52 = 1;
        }
        else
        {
          if (!objc_msgSend(v11, "isEqualToString:", CFSTR("year")))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(v10, "description");
              v14 = objc_claimAutoreleasedReturnValue();
              goto LABEL_5;
            }
            goto LABEL_2;
          }
          v51 = v10;
          v52 = 6;
        }
        ACHFormatDateWithStyle(v51, v52);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_5;
      }
      -[ACHAchievementLocalizationProvider achUnitManager](self, "achUnitManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
        goto LABEL_51;
      objc_msgSend(v12, "canonicalUnit");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHAchievementLocalizationProvider achUnitManager](self, "achUnitManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "userDistanceWalkingRunningHKUnit");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isEqual:", v38);

      if (v39)
        objc_msgSend(MEMORY[0x24BDD4048], "footUnit");
      else
        objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "doubleValue");
      objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "doubleValueForUnit:", v29);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v29, "isEqual:", v48);

      v33 = v49 == 0;
      v34 = 1282;
    }
    if (v33)
      v50 = v34;
    else
      v50 = 11;
    ACHFormatDistanceWithUserUnitAndUnitStyle(v31, v50, 3, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v31;
    if (v15)
      goto LABEL_14;
LABEL_51:
    ACHFormatDistanceWithUserUnitAndUnitStyle(v10, 11, 3, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[ACHAchievementLocalizationProvider achUnitManager](self, "achUnitManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
LABEL_42:
    ACHFormatDistance(v10);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v13)
  {
    v25 = v13;
  }
  else
  {
    objc_msgSend(v12, "canonicalUnit");
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v40 = v25;
  -[ACHAchievementLocalizationProvider achUnitManager](self, "achUnitManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "userDistanceWalkingRunningHKUnit");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40 == v42)
  {

    goto LABEL_42;
  }
  objc_msgSend(v10, "doubleValue");
  objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v40);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "doubleValueForUnit:", v42);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 9);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v42, "isEqual:", v45);

  if (v46)
    v47 = 14;
  else
    v47 = 1284;
  ACHFormatDistanceWithUserUnit(v44, v47);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v44;
  if (!v15)
    goto LABEL_42;
LABEL_14:

  return v15;
}

- (id)_userEnergyUnitSuffix
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  const __CFString *v8;
  void *v9;
  int v10;

  -[ACHAchievementLocalizationProvider achUnitManager](self, "achUnitManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ACHAchievementLocalizationProvider achUnitManager](self, "achUnitManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userActiveEnergyBurnedUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD4048], "jouleUnitWithMetricPrefix:", 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = CFSTR("_KJ");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "isEqual:", v9);

    if (v10)
      v8 = CFSTR("_KCAL");
    else
      v8 = CFSTR("_CAL");
  }

  return (id)v8;
}

- (id)_suffixesForLocalizedStringLookup
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (-[NSString length](self->_name, "length"))
    objc_msgSend(v3, "addObject:", CFSTR("_NAME"));
  if (self->_wheelchairUser && self->_activityMoveMode != 2)
    objc_msgSend(v3, "addObject:", CFSTR("_WHEELCHAIR"));
  if (self->_activityMoveMode != 2)
  {
    -[ACHAchievementLocalizationProvider _userEnergyUnitSuffix](self, "_userEnergyUnitSuffix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isStandalonePhoneFitnessMode");

  if (v6)
    objc_msgSend(v3, "addObject:", CFSTR("_STANDALONE_PHONE"));
  if (self->_isPregnant)
    objc_msgSend(v3, "addObject:", CFSTR("_PREGNANCY"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (id)_allStringCombinationsWithPrefix:(id)a3 andSuffixes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    -[ACHAchievementLocalizationProvider _calculateSuffixCombinations:](self, "_calculateSuffixCombinations:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __83__ACHAchievementLocalizationProvider__allStringCombinationsWithPrefix_andSuffixes___block_invoke;
    v16 = &unk_24D1269E0;
    v17 = v6;
    v18 = v9;
    v10 = v9;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v13);
    v11 = (void *)objc_msgSend(v10, "copy", v13, v14, v15, v16);

  }
  else
  {
    v19[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

void __83__ACHAchievementLocalizationProvider__allStringCombinationsWithPrefix_andSuffixes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "componentsJoinedByString:", &stru_24D1281D8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), v4, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
}

- (id)_calculateSuffixCombinations:(id)a3
{
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    do
    {
      v6 = objc_msgSend(v4, "count");
      if (v6)
      {
        v7 = v6;
        for (i = 0; i != v7; ++i)
        {
          v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v10);

          objc_msgSend(v4, "objectAtIndexedSubscript:", i);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObjectsFromArray:", v11);

          objc_msgSend(v4, "addObject:", v9);
        }
      }
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v13);

      ++v5;
    }
    while (v5 < objc_msgSend(v3, "count"));
  }
  v14 = (void *)objc_msgSend(v4, "copy");

  return v14;
}

- (id)_formattedMoveGoal:(id)a3 template:(id)a4
{
  int64_t activityMoveMode;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  activityMoveMode = self->_activityMoveMode;
  v7 = a3;
  ACHUnitForTemplateAndActivityMoveMode(a4, activityMoveMode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
    -[ACHAchievementLocalizationProvider _formattedMoveTimeValue:](self, "_formattedMoveTimeValue:", v7);
  else
    -[ACHAchievementLocalizationProvider _formattedEnergyValue:canonicalUnit:unitStyle:](self, "_formattedEnergyValue:canonicalUnit:unitStyle:", v7, v8, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_formattedEnergyValue:(id)a3 canonicalUnit:(id)a4 unitStyle:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  -[ACHAchievementLocalizationProvider achUnitManager](self, "achUnitManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_4;
  -[ACHAchievementLocalizationProvider achUnitManager](self, "achUnitManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userActiveEnergyBurnedUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqual:", v12))
  {

LABEL_4:
    ACHFormatEnergyWithUserUnit(v8, 1794, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8;
    goto LABEL_9;
  }
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValueForUnit:", v12);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD4048], "jouleUnitWithMetricPrefix:", 9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v12, "isEqual:", v16);

  if ((v17 & 1) != 0)
  {
    v18 = 14;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "isEqual:", v19);

    v18 = 1794;
  }
  ACHFormatEnergyWithUserUnitAndFormatterUnit(v14, v12, v18, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v13;
}

- (id)_formattedEnergyValueWithoutUnit:(id)a3 canonicalUnit:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[ACHAchievementLocalizationProvider achUnitManager](self, "achUnitManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ACHAchievementLocalizationProvider achUnitManager](self, "achUnitManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userActiveEnergyBurnedUnit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "isEqual:", v10) & 1) == 0)
    {
      objc_msgSend(v6, "doubleValue");
      objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValueForUnit:", v10);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
      v12 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v12;
    }

  }
  ACHFormatCount(v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_formattedMoveTimeValue:(id)a3
{
  return ACHFormatMoveMinutes(a3);
}

- (id)_progressValueWithAchievement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "template");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canonicalUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "progress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValueForUnit:", v5);
    objc_msgSend(v6, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &unk_24D139000;
  }

  return v8;
}

- (id)_achievementValueWithAchievement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if ((ACHShouldUseNewAwardsSystem() & 1) != 0)
  {
    objc_msgSend(v3, "relevantEarnedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "earnedInstances");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "template");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "canonicalUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = &unk_24D139000;
  if (v7 && v4)
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValueForUnit:", v7);
    objc_msgSend(v9, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_goalValueWithAchievement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "template");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canonicalUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "goal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValueForUnit:", v5);
    objc_msgSend(v6, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &unk_24D139000;
  }

  return v8;
}

- (id)_quantityToGoalValueWithAchievement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "template");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "canonicalUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ACHAchievementLocalizationProvider _remainingProgressValueWithUnit:achievement:](self, "_remainingProgressValueWithUnit:achievement:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &unk_24D139000;
  }

  return v7;
}

- (id)_remainingProgressValueWithUnit:(id)a3 achievement:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v6);
  v9 = v8;

  objc_msgSend(v5, "goal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValueForUnit:", v6);
  v12 = v11;

  v13 = v12 - v9;
  if (v12 - v9 < 0.0)
    v13 = 0.0;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)wheelchairUser
{
  return self->_wheelchairUser;
}

- (void)setWheelchairUser:(BOOL)a3
{
  self->_wheelchairUser = a3;
}

- (int64_t)activityMoveMode
{
  return self->_activityMoveMode;
}

- (void)setActivityMoveMode:(int64_t)a3
{
  self->_activityMoveMode = a3;
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (BOOL)isPregnant
{
  return self->_isPregnant;
}

- (void)setIsPregnant:(BOOL)a3
{
  self->_isPregnant = a3;
}

- (ACHUnitManager)achUnitManager
{
  return self->_achUnitManager;
}

- (void)setAchUnitManager:(id)a3
{
  objc_storeStrong((id *)&self->_achUnitManager, a3);
}

- (NSDate)currentDateOverride
{
  return self->_currentDateOverride;
}

- (void)setCurrentDateOverride:(id)a3
{
  objc_storeStrong((id *)&self->_currentDateOverride, a3);
}

- (NSLocale)currentLocaleOverride
{
  return self->_currentLocaleOverride;
}

- (void)setCurrentLocaleOverride:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocaleOverride, a3);
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (void)setGregorianCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_gregorianCalendar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_currentLocaleOverride, 0);
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
  objc_storeStrong((id *)&self->_achUnitManager, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)achievedAlertBackDescriptionForAchievement:sizeVariant:dateSizeVariant:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214029000, v0, v1, "Error formatting alert back description: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_localizedStringWithKey:(uint64_t)a1 withAchievement:(void *)a2 experienceType:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "template");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = a1;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_4(&dword_214029000, a3, v7, "Invalid localization URL for key (%{public}@) for achievement (%{public}@}))", (uint8_t *)&v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)_pluralizeLocalizedString:withAchievement:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214029000, v0, v1, "Error formatting pluarlized string: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_pluralizeLocalizedString:(uint64_t)a3 withAchievement:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = 3;
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_4(&dword_214029000, a2, a3, "Cannot use more than %ld placeholder values in an achievement localized string. Failing string: \"%@\", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)_valueFromPlaceholder:(void *)a1 withAchievement:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "template");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uniqueName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_214029000, v3, v4, "No reference_progress_value custom placeholder set for achievement %{public}@ when it was localized.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_0();
}

- (void)_valueFromPlaceholder:(void *)a1 withAchievement:.cold.2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "template");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uniqueName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_214029000, v3, v4, "No workout_type custom placeholder set for achievement %{public}@ when it was localized.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_0();
}

- (void)_valueFromPlaceholder:(void *)a1 withAchievement:.cold.3(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "template");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uniqueName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_214029000, v3, v4, "No seymour_workout_modality custom placeholder set for achievement %{public}@ when it was localized.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_0();
}

- (void)_valueFromPlaceholder:(void *)a1 withAchievement:.cold.4(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "template");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uniqueName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_214029000, v3, v4, "No seymour_workout_milestone custom placeholder set for achievement %{public}@ when it was localized.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_0();
}

@end
