@implementation UNNotificationRequest

+ (id)_requestIDForNotification:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "scheduleItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dueDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[HKMedicationScheduleItem isScheduleItemIdentifier:matchingDateTime:](HKMedicationScheduleItem, "isScheduleItemIdentifier:matchingDateTime:", v3, v4);

  objc_msgSend(v2, "scheduleItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v2, "dueDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("-%f"), v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }

  return v6;
}

+ (id)_contentForNotification:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v2 = a2;
  v3 = objc_opt_self();
  v4 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  objc_msgSend(v2, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MedicationsNotificationIsFollowUpKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
    v8 = CFSTR("MEDICATIONS_NOTIFICATION_TITLE_NOT_MISSED_FOLLOW_UP");
  else
    v8 = CFSTR("MEDICATIONS_NOTIFICATION_TITLE_NOT_MISSED");
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v9);

  objc_msgSend(v2, "category");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "argument");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduleItemIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  +[UNNotificationRequest _bodyForCategory:argument:identifier:](v3, v10, v13, (void *)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBody:", v14);

  objc_msgSend(v2, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MedicationsNotificationIsCriticalKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = objc_msgSend(v16, "BOOLValue");

  objc_msgSend(v2, "category");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCategoryIdentifier:", v17);

  objc_msgSend(v2, "scheduleItemIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setThreadIdentifier:", v18);

  if ((v12 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEC760], "defaultCriticalSound");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEC760], "soundWithAlertType:", 25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 2;
  }
  objc_msgSend(v4, "setSound:", v19);

  objc_msgSend(v2, "userInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInfo:", v21);

  objc_msgSend(v4, "setInterruptionLevel:", v20);
  +[UNNotificationRequest _contentByAddingCommonUserInfoTo:](v3, v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)_timeZoneContent
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_opt_self();
  v0 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("MEDICATIONS_NOTIFICATION_TIMEZONE_TITLE"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTitle:", v1);

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("MEDICATIONS_NOTIFICATION_TIMEZONE_BODY"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setBody:", v2);

  +[UNNotificationRequest _timeZoneUserInfo]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setUserInfo:", v3);

  objc_msgSend(v0, "setCategoryIdentifier:", CFSTR("MedicationsHealthAppPlugin.TimeZone"));
  objc_msgSend(MEMORY[0x1E0CEC760], "soundWithAlertType:", 25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setSound:", v4);

  objc_msgSend(v0, "setInterruptionLevel:", 2);
  return v0;
}

+ (id)_bodyForCategory:(uint64_t)a3 argument:(void *)a4 identifier:
{
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a4;
  objc_opt_self();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("MedicationsHealthAppPlugin.BeforeFirstUnlock")))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = CFSTR("MEDICATIONS_NOTIFICATION_BODY_BEFORE_FIRST_UNLOCK");
LABEL_7:
    objc_msgSend(v7, "localizedUserNotificationStringForKey:arguments:", v8, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!objc_msgSend(MEMORY[0x1E0CEC740], "isNotMissedCategory:", v5))
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("MedicationsHealthAppPlugin.Missed")))
    {
      v15 = 0;
      goto LABEL_8;
    }
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = CFSTR("MEDICATIONS_NOTIFICATION_BODY_MISSED");
    goto LABEL_7;
  }
  v9 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v10, 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3578], "hm_localizableTimeStringKeyWithPrefix:date:", CFSTR("MEDICATIONS_NOTIFICATION_BODY_NOT_MISSED"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3940];
  v17[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedUserNotificationStringForKey:arguments:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v15;
}

+ (id)_contentByAddingCommonUserInfoTo:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v2, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E6CE0128, *MEMORY[0x1E0CB7760]);
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v3, "setUserInfo:", v6);

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

+ (id)_timeZoneUserInfo
{
  void *v0;
  void *v1;

  objc_opt_self();
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("x-apple-health://MedicationsHealthAppPlugin.healthplugin"), *MEMORY[0x1E0CB7770]);
  objc_msgSend(v0, "setObject:forKeyedSubscript:", &unk_1E6CE0128, *MEMORY[0x1E0CB7760]);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v0);

  return v1;
}

@end
