@implementation FMFFence

- (NSString)displayLocationName
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  -[FMFFence label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[FMFFence label](self, "label");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    v6 = 0;
    goto LABEL_11;
  }
  -[FMFFence placemark](self, "placemark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FENCE_GENERIC_LOCATION"), &stru_1EA4F34A0, 0);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_3;
  }
  v6 = v7;
  objc_msgSend(v7, "streetAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    objc_msgSend(v6, "streetAddress");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "streetName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      objc_msgSend(v6, "streetName");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "locality");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");

      objc_msgSend(v6, "locality");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v5 = v17;
      if (v16)
        goto LABEL_11;
      v18 = -[__CFString length](v17, "length");

      if (v18)
      {
        objc_msgSend(v6, "locality");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v6, "administrativeArea");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "length");

        if (!v20)
        {
          v5 = &stru_1EA4F34A0;
          goto LABEL_11;
        }
        objc_msgSend(v6, "administrativeArea");
        v10 = objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v5 = (__CFString *)v10;
LABEL_11:

  return (NSString *)v5;
}

+ (NSString)genericFriendName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FENCE_GENERIC_FRIEND"), &stru_1EA4F34A0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)localizedNotificationStringForFollower:(id)a3 locationName:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  __CFString *v16;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v6 = a3;
  v7 = a4;
  v8 = -[FMFFence isRecurring](self, "isRecurring");
  if (!v7)
  {
    -[FMFFence displayLocationName](self, "displayLocationName");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[FMFFence trigger](self, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[FMFFence genericFriendName](FMFFence, "genericFriendName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("enter")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("FENCE_NOTIFY_FRIEND_WHEN_I_ARRIVE_AT_LOCATION");
    v13 = CFSTR("FENCE_NOTIFY_FRIEND_WHEN_I_ARRIVE_AT_LOCATION_EVERY_TIME");
LABEL_9:
    if (v8)
      v14 = v13;
    else
      v14 = v12;
    objc_msgSend(v10, "localizedStringForKey:value:table:", v14, &stru_1EA4F34A0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v15, v6, v7);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("exit")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("FENCE_NOTIFY_FRIEND_WHEN_I_LEAVE_LOCATION");
    v13 = CFSTR("FENCE_NOTIFY_FRIEND_WHEN_I_LEAVE_LOCATION_EVERY_TIME");
    goto LABEL_9;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("scheduled")))
  {
    v16 = &stru_1EA4F34A0;
    goto LABEL_14;
  }
  -[FMFFence schedule](self, "schedule");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "startHour");

  -[FMFFence schedule](self, "schedule");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "startMin");

  -[FMFFence schedule](self, "schedule");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "endHour");

  -[FMFFence schedule](self, "schedule");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "endMin");

  -[FMFFence schedule](self, "schedule");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "daysOfWeek");

  +[FMFSchedule localizedTimeStringForHour:andMinute:timeStyle:](FMFSchedule, "localizedTimeStringForHour:andMinute:timeStyle:", v19, v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 == v23 && v21 == v25)
  {
    if (v27 == 127)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("FENCE_NOTIFY_FRIEND_WHEN_I_AM_NOT_AT_LOCATION_BY_TIME_EVERY_DAY"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v29, v6, v7, v15);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[FMFSchedule localizedDaysOfWeekStringFor:](FMFSchedule, "localizedDaysOfWeekStringFor:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("FENCE_NOTIFY_FRIEND_WHEN_I_AM_NOT_AT_LOCATION_BY_TIME_ON_DAYSLIST"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v35, v6, v7, v15, v29);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    +[FMFSchedule localizedTimeStringForHour:andMinute:timeStyle:](FMFSchedule, "localizedTimeStringForHour:andMinute:timeStyle:", v23, v25, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27 == 127)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("FENCE_NOTIFY_FRIEND_WHEN_I_AM_NOT_AT_LOCATION_BETWEEN_TIMES_EVERY_DAY"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v31, v6, v7, v15, v29);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[FMFSchedule localizedDaysOfWeekStringFor:](FMFSchedule, "localizedDaysOfWeekStringFor:", v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("FENCE_NOTIFY_FRIEND_WHEN_I_AM_NOT_AT_LOCATION_BETWEEN_TIMES_ON_DAYSLIST"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v33, v6, v7, v15, v29, v31);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }

LABEL_13:
LABEL_14:

  return v16;
}

- (id)localizedRequestNotificationStringForFollower:(id)a3 locationName:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v6 = a3;
  v7 = a4;
  v8 = -[FMFFence isRecurring](self, "isRecurring");
  if (!v7)
  {
    -[FMFFence displayLocationName](self, "displayLocationName");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[FMFFence trigger](self, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[FMFFence genericFriendName](FMFFence, "genericFriendName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("enter")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v11 = CFSTR("FENCE_FRIEND_REQUESTS_NOTIFICATION_WHEN_YOU_ARRIVE_AT_LOCATION_EVERY_TIME");
LABEL_11:
      v12 = CFSTR("Localizable-TINKER");
      v13 = v10;
LABEL_20:
      objc_msgSend(v13, "localizedStringForKey:value:table:", v11, &stru_1EA4F34A0, v12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v24, v6, v7);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    v11 = CFSTR("FENCE_FRIEND_REQUESTS_NOTIFICATION_WHEN_YOU_ARRIVE_AT_LOCATION");
    goto LABEL_19;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("exit")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v11 = CFSTR("FENCE_FRIEND_REQUESTS_NOTIFICATION_WHEN_YOU_LEAVE_LOCATION_EVERY_TIME");
      goto LABEL_11;
    }
    v11 = CFSTR("FENCE_FRIEND_REQUESTS_NOTIFICATION_WHEN_YOU_LEAVE_LOCATION");
LABEL_19:
    v13 = v10;
    v12 = 0;
    goto LABEL_20;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("scheduled")))
  {
    v27 = &stru_1EA4F34A0;
    goto LABEL_22;
  }
  -[FMFFence schedule](self, "schedule");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "startHour");

  -[FMFFence schedule](self, "schedule");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "startMin");

  -[FMFFence schedule](self, "schedule");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "endHour");

  -[FMFFence schedule](self, "schedule");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "endMin");

  -[FMFFence schedule](self, "schedule");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "daysOfWeek");

  +[FMFSchedule localizedTimeStringForHour:andMinute:timeStyle:](FMFSchedule, "localizedTimeStringForHour:andMinute:timeStyle:", v15, v17, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 == v19 && v17 == v21)
  {
    if (v23 == 127)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("FENCE_FRIEND_REQUESTS_NOTIFICATION_WHEN_YOU_ARE_NOT_AT_LOCATION_BY_TIME_EVERY_DAY"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v26, v6, v7, v24);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[FMFSchedule localizedDaysOfWeekStringFor:](FMFSchedule, "localizedDaysOfWeekStringFor:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("FENCE_FRIEND_REQUESTS_NOTIFICATION_WHEN_YOU_ARE_NOT_AT_LOCATION_BY_TIME_ON_DAYSLIST"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v34, v6, v7, v24, v26);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    +[FMFSchedule localizedTimeStringForHour:andMinute:timeStyle:](FMFSchedule, "localizedTimeStringForHour:andMinute:timeStyle:", v19, v21, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23 == 127)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("FENCE_FRIEND_REQUESTS_NOTIFICATION_WHEN_YOU_ARE_NOT_AT_LOCATION_BETWEEN_TIMES_EVERY_DAY"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v30, v6, v7, v24, v26);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[FMFSchedule localizedDaysOfWeekStringFor:](FMFSchedule, "localizedDaysOfWeekStringFor:", v23);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("FENCE_FRIEND_REQUESTS_NOTIFICATION_WHEN_YOU_ARE_NOT_AT_LOCATION_BETWEEN_TIMES_ON_DAYSLIST"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v32, v6, v7, v24, v26, v30);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }

LABEL_21:
LABEL_22:

  return v27;
}

- (id)localizedWillBeNotifiedStringForFollower:(id)a3 locationName:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v6 = a3;
  v7 = a4;
  v8 = -[FMFFence isRecurring](self, "isRecurring");
  if (!v7)
  {
    -[FMFFence displayLocationName](self, "displayLocationName");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[FMFFence trigger](self, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[FMFFence genericFriendName](FMFFence, "genericFriendName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("enter")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v11 = CFSTR("FENCE_FRIEND_WILL_BE_NOTIFIED_WHEN_YOU_ARRIVE_AT_LOCATION_EVERY_TIME");
LABEL_11:
      v12 = CFSTR("Localizable-TINKER");
      v13 = v10;
LABEL_20:
      objc_msgSend(v13, "localizedStringForKey:value:table:", v11, &stru_1EA4F34A0, v12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v24, v6, v7);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    v11 = CFSTR("FENCE_FRIEND_WILL_BE_NOTIFIED_WHEN_YOU_ARRIVE_AT_LOCATION");
    goto LABEL_19;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("exit")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v11 = CFSTR("FENCE_FRIEND_WILL_BE_NOTIFIED_WHEN_YOU_LEAVE_LOCATION_EVERY_TIME");
      goto LABEL_11;
    }
    v11 = CFSTR("FENCE_FRIEND_WILL_BE_NOTIFIED_WHEN_YOU_LEAVE_LOCATION");
LABEL_19:
    v13 = v10;
    v12 = 0;
    goto LABEL_20;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("scheduled")))
  {
    v27 = &stru_1EA4F34A0;
    goto LABEL_22;
  }
  -[FMFFence schedule](self, "schedule");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "startHour");

  -[FMFFence schedule](self, "schedule");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "startMin");

  -[FMFFence schedule](self, "schedule");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "endHour");

  -[FMFFence schedule](self, "schedule");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "endMin");

  -[FMFFence schedule](self, "schedule");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "daysOfWeek");

  +[FMFSchedule localizedTimeStringForHour:andMinute:timeStyle:](FMFSchedule, "localizedTimeStringForHour:andMinute:timeStyle:", v15, v17, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 == v19 && v17 == v21)
  {
    if (v23 == 127)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("FENCE_FRIEND_WILL_BE_NOTIFIED_WHEN_YOU_ARE_NOT_AT_LOCATION_BY_TIME_EVERY_DAY"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v26, v6, v7, v24);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[FMFSchedule localizedDaysOfWeekStringFor:](FMFSchedule, "localizedDaysOfWeekStringFor:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("FENCE_FRIEND_WILL_BE_NOTIFIED_WHEN_YOU_ARE_NOT_AT_LOCATION_BY_TIME_ON_DAYSLIST"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v34, v6, v7, v24, v26);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    +[FMFSchedule localizedTimeStringForHour:andMinute:timeStyle:](FMFSchedule, "localizedTimeStringForHour:andMinute:timeStyle:", v19, v21, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23 == 127)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("FENCE_FRIEND_WILL_BE_NOTIFIED_WHEN_YOU_ARE_NOT_AT_LOCATION_BETWEEN_TIMES_EVERY_DAY"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v30, v6, v7, v24, v26);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[FMFSchedule localizedDaysOfWeekStringFor:](FMFSchedule, "localizedDaysOfWeekStringFor:", v23);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("FENCE_FRIEND_WILL_BE_NOTIFIED_WHEN_YOU_ARE_NOT_AT_LOCATION_BETWEEN_TIMES_ON_DAYSLIST"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v32, v6, v7, v24, v26, v30);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }

LABEL_21:
LABEL_22:

  return v27;
}

- (id)localizedSubtitleStringWithLocationName:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  __CFString *v11;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  v5 = -[FMFFence isRecurring](self, "isRecurring");
  if (!v4)
  {
    -[FMFFence displayLocationName](self, "displayLocationName");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[FMFFence trigger](self, "trigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("enter")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("exit")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
      v9 = CFSTR("FENCE_NOTIFICATION_LOCATION_AND_EVERY_TIME");
    else
      v9 = CFSTR("FENCE_NOTIFICATION_LOCATION_AND_NEXT_TIME");
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1EA4F34A0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v10, v4);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("scheduled")))
    {
      v11 = &stru_1EA4F34A0;
      goto LABEL_10;
    }
    -[FMFFence schedule](self, "schedule");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "startHour");

    -[FMFFence schedule](self, "schedule");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "startMin");

    -[FMFFence schedule](self, "schedule");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "endHour");

    -[FMFFence schedule](self, "schedule");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "endMin");

    -[FMFFence schedule](self, "schedule");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "daysOfWeek");

    +[FMFSchedule localizedTimeStringForHour:andMinute:timeStyle:](FMFSchedule, "localizedTimeStringForHour:andMinute:timeStyle:", v14, v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 == v18 && v16 == v20)
    {
      if (v22 == 127)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("FENCE_NOTIFICATION_LOCATION_AND_SCHEDULE_BY_TIME_EVERY_DAY"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v24, v4, v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[FMFSchedule localizedDaysOfWeekStringFor:](FMFSchedule, "localizedDaysOfWeekStringFor:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("FENCE_NOTIFICATION_LOCATION_AND_SCHEDULE_BY_TIME_ON_DAYSLIST"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v30, v4, v10, v24);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      +[FMFSchedule localizedTimeStringForHour:andMinute:timeStyle:](FMFSchedule, "localizedTimeStringForHour:andMinute:timeStyle:", v18, v20, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22 == 127)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("FENCE_NOTIFICATION_LOCATION_AND_SCHEDULE_BETWEEN_TIMES_EVERY_DAY"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v26, v4, v10, v24);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[FMFSchedule localizedDaysOfWeekStringFor:](FMFSchedule, "localizedDaysOfWeekStringFor:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("FENCE_NOTIFICATION_LOCATION_AND_SCHEDULE_BETWEEN_TIMES_ON_DAYSLIST"), &stru_1EA4F34A0, CFSTR("Localizable-TINKER"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v28, v4, v10, v24, v26);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
LABEL_10:

  return v11;
}

+ (id)endDateForMuteTimespan:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startOfDayForDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, 1, v5, 1024);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 64, -1, v7, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (FMFFence)initWithRecipient:(id)a3 location:(id)a4 placemark:(id)a5 label:(id)a6 trigger:(id)a7 type:(id)a8 locationType:(unint64_t)a9 recurring:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  FMFFence *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  int v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = -[FMFFence init](self, "init");
  if (v22)
  {
    LogCategory_Daemon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412290;
      v29 = v16;
      _os_log_impl(&dword_1DC81B000, v23, OS_LOG_TYPE_DEFAULT, "FMFFence: initWithRecipient %@", (uint8_t *)&v28, 0xCu);
    }

    -[FMFFence setRecipients:](v22, "setRecipients:", v16);
    -[FMFFence setLocation:](v22, "setLocation:", v17);
    -[FMFFence setPlacemark:](v22, "setPlacemark:", v18);
    -[FMFFence setLabel:](v22, "setLabel:", v19);
    -[FMFFence setTrigger:](v22, "setTrigger:", v20);
    -[FMFFence setType:](v22, "setType:", v21);
    -[FMFFence setLocationType:](v22, "setLocationType:", a9);
    -[FMFFence setRecurring:](v22, "setRecurring:", a10);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFFence setTimestamp:](v22, "setTimestamp:", v24);

    v25 = (void *)objc_opt_new();
    objc_msgSend(v25, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFFence setPendingIdentifier:](v22, "setPendingIdentifier:", v26);

    -[FMFFence setActive:](v22, "setActive:", 1);
    -[FMFFence setFromMe:](v22, "setFromMe:", 1);
  }

  return v22;
}

- (FMFFence)initWithDictionary:(id)a3
{
  id v4;
  FMFFence *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  FMFPlacemark *v56;
  void *v57;
  void *v58;
  void *v59;
  FMFPlacemark *v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  const __CFString *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  const __CFString *v87;
  void *v88;
  char v89;
  void *v90;
  void *v91;
  int v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  FMFSchedule *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  FMFFence *v108;
  NSObject *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  uint8_t buf[4];
  void *v126;
  __int16 v127;
  void *v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  void *v132;
  __int16 v133;
  void *v134;
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[FMFFence init](self, "init");
  if (!v5)
    goto LABEL_100;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isOn"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {
    v124 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isOn"));
    v124 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("onetimeonly"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("onetimeonly"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phoneNumbers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)MEMORY[0x1E0C9AA60];
  if (v11 != v12)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phoneNumbers"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = v13;
    v13 = v16;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("emails"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0C9AA60];
  if (v17 == v18)
  {
    v24 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("emails"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v22 = (void *)v20;
    else
      v22 = v19;
    v23 = v22;

    v24 = v23;
  }

  objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("updateTimestamp"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26 == v27)
  {
    v123 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("updateTimestamp"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationType"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = v13;
  if (v28 == v29)
  {
    v122 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationType"));
    v122 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v120 = v24;

  -[FMFFence setActive:](v5, "setActive:", objc_msgSend(v124, "BOOLValue"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("createdById"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30 == v31)
  {
    -[FMFFence setCreatedByIdentifier:](v5, "setCreatedByIdentifier:", &stru_1EA4F34A0);
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("createdById"));
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    if (v32)
      v34 = (const __CFString *)v32;
    else
      v34 = &stru_1EA4F34A0;
    -[FMFFence setCreatedByIdentifier:](v5, "setCreatedByIdentifier:", v34);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followerIds"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35 == v36)
  {
    -[FMFFence setFollowerIds:](v5, "setFollowerIds:", MEMORY[0x1E0C9AA60]);
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followerIds"));
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)v37;
    if (v37)
      v39 = v37;
    else
      v39 = (uint64_t)v19;
    -[FMFFence setFollowerIds:](v5, "setFollowerIds:", v39);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("friendId"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40 == v41)
  {
    -[FMFFence setFriendIdentifier:](v5, "setFriendIdentifier:", &stru_1EA4F34A0);
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("friendId"));
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)v42;
    if (v42)
      v44 = (const __CFString *)v42;
    else
      v44 = &stru_1EA4F34A0;
    -[FMFFence setFriendIdentifier:](v5, "setFriendIdentifier:", v44);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45 == v46)
  {
    -[FMFFence setIdentifier:](v5, "setIdentifier:", &stru_1EA4F34A0);
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)v47;
    if (v47)
      v49 = (const __CFString *)v47;
    else
      v49 = &stru_1EA4F34A0;
    -[FMFFence setIdentifier:](v5, "setIdentifier:", v49);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("label"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50 == v51)
  {
    -[FMFFence setLabel:](v5, "setLabel:", &stru_1EA4F34A0);
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("label"));
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = (void *)v52;
    if (v52)
      v54 = (const __CFString *)v52;
    else
      v54 = &stru_1EA4F34A0;
    -[FMFFence setLabel:](v5, "setLabel:", v54);

  }
  -[FMFFence locationForDictionary:](v5, "locationForDictionary:", v4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence setLocation:](v5, "setLocation:", v55);

  v56 = [FMFPlacemark alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fullAddress"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57 == v58)
  {
    v59 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fullAddress"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v60 = -[FMFPlacemark initWithDictionary:](v56, "initWithDictionary:", v59);
  -[FMFFence setPlacemark:](v5, "setPlacemark:", v60);

  if (v57 != v58)
  -[FMFFence handlesForArray:](v5, "handlesForArray:", v25);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence setRecipients:](v5, "setRecipients:", v61);

  -[FMFFence setRecurring:](v5, "setRecurring:", objc_msgSend(v10, "BOOLValue") ^ 1);
  v62 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v123, "doubleValue");
  objc_msgSend(v62, "dateWithTimeIntervalSince1970:", v63 / 1000.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence setTimestamp:](v5, "setTimestamp:", v64);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trigger"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65 == v66)
  {
    -[FMFFence setTrigger:](v5, "setTrigger:", 0);
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trigger"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFFence setTrigger:](v5, "setTrigger:", v67);

  }
  -[FMFFence setLocationType:](v5, "setLocationType:", (int)objc_msgSend(v122, "intValue"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ckRecordName"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v68 == v69)
  {
    -[FMFFence setCkRecordName:](v5, "setCkRecordName:", &stru_1EA4F34A0);
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ckRecordName"));
    v70 = objc_claimAutoreleasedReturnValue();
    v71 = (void *)v70;
    if (v70)
      v72 = (const __CFString *)v70;
    else
      v72 = &stru_1EA4F34A0;
    -[FMFFence setCkRecordName:](v5, "setCkRecordName:", v72);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ckRecordZoneOwnerName"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73 == v74)
  {
    -[FMFFence setCkRecordZoneOwnerName:](v5, "setCkRecordZoneOwnerName:", &stru_1EA4F34A0);
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ckRecordZoneOwnerName"));
    v75 = objc_claimAutoreleasedReturnValue();
    v76 = (void *)v75;
    if (v75)
      v77 = (const __CFString *)v75;
    else
      v77 = &stru_1EA4F34A0;
    -[FMFFence setCkRecordZoneOwnerName:](v5, "setCkRecordZoneOwnerName:", v77);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acceptanceStatus"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v78 == v79)
  {
    -[FMFFence setAcceptanceStatus:](v5, "setAcceptanceStatus:", &stru_1EA4F34A0);
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acceptanceStatus"));
    v80 = objc_claimAutoreleasedReturnValue();
    v81 = (void *)v80;
    if (v80)
      v82 = (const __CFString *)v80;
    else
      v82 = &stru_1EA4F34A0;
    -[FMFFence setAcceptanceStatus:](v5, "setAcceptanceStatus:", v82);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (v83 == v84)
  {
    v85 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v85, "lowercaseString");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = CFSTR("NotifyMe");
  objc_msgSend(CFSTR("NotifyMe"), "lowercaseString");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v86, "isEqualToString:", v88);

  if ((v89 & 1) != 0)
    goto LABEL_86;
  objc_msgSend(v85, "lowercaseString");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = CFSTR("NotifyOthers");
  objc_msgSend(CFSTR("NotifyOthers"), "lowercaseString");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v90, "isEqualToString:", v91);

  if (v92)
LABEL_86:
    -[FMFFence setType:](v5, "setType:", v87);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fenceTimeRange"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v94 = objc_claimAutoreleasedReturnValue();
  if (v93 == (void *)v94)
  {

  }
  else
  {
    v95 = (void *)v94;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fenceTimeRange"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    if (v96)
    {
      v97 = -[FMFSchedule initWithDictionary:]([FMFSchedule alloc], "initWithDictionary:", v96);
      -[FMFFence setSchedule:](v5, "setSchedule:", v97);

      goto LABEL_92;
    }
  }
  -[FMFFence setSchedule:](v5, "setSchedule:", 0);
  v96 = 0;
LABEL_92:
  v119 = v85;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("muteEndDate"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (v98 == v99)
  {
    -[FMFFence setMuteEndDate:](v5, "setMuteEndDate:", 0);
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("muteEndDate"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFFence setMuteEndDate:](v5, "setMuteEndDate:", v100);

  }
  -[FMFFence trigger](v5, "trigger");
  v101 = objc_claimAutoreleasedReturnValue();
  if (!v101)
    goto LABEL_103;
  v102 = (void *)v101;
  -[FMFFence type](v5, "type");
  v103 = objc_claimAutoreleasedReturnValue();
  if (!v103)
  {
LABEL_102:

    goto LABEL_103;
  }
  v104 = (void *)v103;
  -[FMFFence location](v5, "location");
  v105 = objc_claimAutoreleasedReturnValue();
  if (!v105)
  {

    goto LABEL_102;
  }
  v106 = (void *)v105;
  -[FMFFence timestamp](v5, "timestamp");
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  if (v107)
  {

LABEL_100:
    v108 = v5;
    goto LABEL_106;
  }
LABEL_103:
  LogCategory_Daemon();
  v109 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
  {
    -[FMFFence identifier](v5, "identifier");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFFence trigger](v5, "trigger");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFFence type](v5, "type");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFFence location](v5, "location");
    v118 = v96;
    v113 = v10;
    v114 = v25;
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFFence timestamp](v5, "timestamp");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v126 = v110;
    v127 = 2112;
    v128 = v111;
    v129 = 2112;
    v130 = v112;
    v131 = 2112;
    v132 = v115;
    v133 = 2112;
    v134 = v116;
    _os_log_impl(&dword_1DC81B000, v109, OS_LOG_TYPE_DEFAULT, "FMFFence: Cannot initialize fence with nil value (Identifier:%@, trigger: %@, type: %@, location: %@, timestamp: %@)", buf, 0x34u);

    v25 = v114;
    v10 = v113;
    v96 = v118;

  }
  v108 = 0;
LABEL_106:

  return v108;
}

- (FMFFence)initWithCoder:(id)a3
{
  id v4;
  FMFFence *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  FMFFence *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[FMFFence init](self, "init");
  if (!v5)
    goto LABEL_23;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullAddress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("recipients"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[FMFFence setActive:](v5, "setActive:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isOn")));
  -[FMFFence setFromMe:](v5, "setFromMe:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fromMe")));
  -[FMFFence setRecurring:](v5, "setRecurring:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onetimeonly")));
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("createdById"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_1EA4F34A0;
  -[FMFFence setCreatedByIdentifier:](v5, "setCreatedByIdentifier:", v14);

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("followerIds"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence setFollowerIds:](v5, "setFollowerIds:", v15);

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("friendId"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = &stru_1EA4F34A0;
  -[FMFFence setFriendIdentifier:](v5, "setFriendIdentifier:", v18);

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("id"));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = &stru_1EA4F34A0;
  -[FMFFence setIdentifier:](v5, "setIdentifier:", v21);

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("label"));
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (const __CFString *)v22;
  else
    v24 = &stru_1EA4F34A0;
  -[FMFFence setLabel:](v5, "setLabel:", v24);

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("updateTimestamp"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence setTimestamp:](v5, "setTimestamp:", v25);

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("trigger"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence setTrigger:](v5, "setTrigger:", v26);

  -[FMFFence setLocationType:](v5, "setLocationType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("locationType")));
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("type"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = CFSTR("NotifyMe");
  if ((objc_msgSend(v27, "isEqualToString:", CFSTR("NotifyMe")) & 1) != 0
    || (v28 = CFSTR("NotifyOthers"), objc_msgSend(v27, "isEqualToString:", CFSTR("NotifyOthers"))))
  {
    -[FMFFence setType:](v5, "setType:", v28);
  }
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("acceptanceStatus"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence setAcceptanceStatus:](v5, "setAcceptanceStatus:", v29);

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("ckRecordName"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence setCkRecordName:](v5, "setCkRecordName:", v30);

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("ckRecordZoneOwnerName"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence setCkRecordZoneOwnerName:](v5, "setCkRecordZoneOwnerName:", v31);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fenceTimeRange"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence setSchedule:](v5, "setSchedule:", v32);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("muteEndDate"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence setMuteEndDate:](v5, "setMuteEndDate:", v33);

  -[FMFFence trigger](v5, "trigger");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[FMFFence type](v5, "type");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      if (v6 && v7 && v11)
      {
        -[FMFFence setLocation:](v5, "setLocation:", v6);
        -[FMFFence setPlacemark:](v5, "setPlacemark:", v7);
        -[FMFFence setRecipients:](v5, "setRecipients:", v11);

LABEL_23:
        v37 = v5;
        goto LABEL_27;
      }
    }
  }
  LogCategory_Daemon();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    -[FMFFence identifier](v5, "identifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFFence trigger](v5, "trigger");
    v48 = v7;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFFence type](v5, "type");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFFence location](v5, "location");
    v47 = v27;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFFence timestamp](v5, "timestamp");
    v43 = v11;
    v44 = v6;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v50 = v39;
    v51 = 2112;
    v52 = v40;
    v53 = 2112;
    v54 = v41;
    v55 = 2112;
    v56 = v42;
    v57 = 2112;
    v58 = v45;
    _os_log_impl(&dword_1DC81B000, v38, OS_LOG_TYPE_DEFAULT, "FMFFence: Cannot initialize fence with nil value (Identifier:%@, trigger: %@, type: %@, location: %@, timestamp: %@)", buf, 0x34u);

    v6 = v44;
    v11 = v43;

    v27 = v47;
    v7 = v48;

  }
  v37 = 0;
LABEL_27:

  return v37;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 active;
  id v5;

  active = self->_active;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", active, CFSTR("isOn"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_fromMe, CFSTR("fromMe"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_recurring, CFSTR("onetimeonly"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_createdByIdentifier, CFSTR("createdById"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_followerIds, CFSTR("followerIds"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_friendIdentifier, CFSTR("friendId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_placemark, CFSTR("fullAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipients, CFSTR("recipients"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("updateTimestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trigger, CFSTR("trigger"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_locationType, CFSTR("locationType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_acceptanceStatus, CFSTR("acceptanceStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ckRecordName, CFSTR("ckRecordName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ckRecordZoneOwnerName, CFSTR("ckRecordZoneOwnerName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_schedule, CFSTR("fenceTimeRange"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_muteEndDate, CFSTR("muteEndDate"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isOnMe
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  char v7;

  v3 = -[FMFFence isFromMe](self, "isFromMe");
  -[FMFFence type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("NotifyOthers");
  else
    v6 = CFSTR("NotifyMe");
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  return v7;
}

- (BOOL)shouldUseIDSTrigger
{
  void *v2;
  void *v4;
  int v5;
  char v6;
  void *v7;
  void *v8;

  -[FMFFence type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("NotifyMe"));
  if (!v5)
    goto LABEL_6;
  if (!-[FMFFence isRecurring](self, "isRecurring"))
  {
    -[FMFFence trigger](self, "trigger");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("scheduled")) & 1) != 0)
    {
      v6 = 1;
      goto LABEL_10;
    }
LABEL_6:
    -[FMFFence type](self, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("NotifyOthers")))
    {
      -[FMFFence trigger](self, "trigger");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "isEqualToString:", CFSTR("scheduled"));

      if ((v5 & 1) == 0)
        goto LABEL_11;
    }
    else
    {

      v6 = 0;
      if (!v5)
        goto LABEL_11;
    }
LABEL_10:

    goto LABEL_11;
  }
  v6 = 1;
LABEL_11:

  return v6;
}

- (BOOL)isMuted
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[FMFFence muteEndDate](self, "muteEndDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FMFFence muteEndDate](self, "muteEndDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "compare:", v5);

    if (v6 == 1)
      return 1;
    -[FMFFence setMuteEndDate:](self, "setMuteEndDate:", 0);
  }
  return 0;
}

- (NSDate)inviteDate
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  -[FMFFence trigger](self, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("scheduled"));

  if (v4)
  {
    -[FMFFence schedule](self, "schedule");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFFence timestamp](self, "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nextStartDateFrom:options:", v6, 1024);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSDate *)v7;
}

- (BOOL)isSupported
{
  return 1;
}

- (BOOL)isRegionAllowed
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class();
  -[FMFFence location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinate");
  LOBYTE(v3) = objc_msgSend(v3, "isAllowedAtLocation:");

  return (char)v3;
}

+ (BOOL)isAllowedAtLocation:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  void *v5;
  char v6;

  longitude = a3.longitude;
  latitude = a3.latitude;
  GEOSouthKoreaRegion();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsCoordinate:", latitude, longitude) ^ 1;

  return v6;
}

- (void)updateFenceLocation:(id)a3 placemark:(id)a4 label:(id)a5 trigger:(id)a6 type:(id)a7 locationType:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  -[FMFFence setLocation:](self, "setLocation:", a3);
  -[FMFFence setPlacemark:](self, "setPlacemark:", v17);

  -[FMFFence setLabel:](self, "setLabel:", v16);
  -[FMFFence setTrigger:](self, "setTrigger:", v15);

  -[FMFFence setType:](self, "setType:", v14);
  -[FMFFence setLocationType:](self, "setLocationType:", a8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setActive:", self->_active);
  objc_msgSend(v4, "setCreatedByIdentifier:", self->_createdByIdentifier);
  objc_msgSend(v4, "setFollowerIds:", self->_followerIds);
  objc_msgSend(v4, "setFriendIdentifier:", self->_friendIdentifier);
  objc_msgSend(v4, "setIdentifier:", self->_identifier);
  objc_msgSend(v4, "setLabel:", self->_label);
  objc_msgSend(v4, "setLocation:", self->_location);
  objc_msgSend(v4, "setPlacemark:", self->_placemark);
  objc_msgSend(v4, "setRecipients:", self->_recipients);
  objc_msgSend(v4, "setRecurring:", self->_recurring);
  objc_msgSend(v4, "setTimestamp:", self->_timestamp);
  objc_msgSend(v4, "setTrigger:", self->_trigger);
  objc_msgSend(v4, "setType:", self->_type);
  objc_msgSend(v4, "setLocationType:", self->_locationType);
  v5 = (void *)-[FMFSchedule copy](self->_schedule, "copy");
  objc_msgSend(v4, "setSchedule:", v5);

  v6 = (void *)-[NSDate copy](self->_muteEndDate, "copy");
  objc_msgSend(v4, "setMuteEndDate:", v6);

  objc_msgSend(v4, "setAcceptanceStatus:", self->_acceptanceStatus);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[FMFFence identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      -[FMFFence pendingIdentifier](self, "pendingIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pendingIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "isEqualToString:", v10);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  -[FMFFence identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "hash");
  }
  else
  {
    -[FMFFence pendingIdentifier](self, "pendingIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "hash");

  }
  return v5;
}

- (id)locationForDictionary:(id)a3
{
  id v3;
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
  double v14;
  CLLocationDegrees v15;
  CLLocationDegrees v16;
  CLLocationCoordinate2D v17;
  id v18;
  double v19;
  double v20;
  void *v21;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("latitude"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("latitude"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("longitude"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("longitude"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("radius"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v11)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("radius"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v13 = 0;
  if (v6 && v9 && v12)
  {
    objc_msgSend(v6, "doubleValue");
    v15 = v14;
    objc_msgSend(v9, "doubleValue");
    v17 = CLLocationCoordinate2DMake(v15, v16);
    v18 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v12, "doubleValue");
    v20 = v19;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v18, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v21, v17.latitude, v17.longitude, 0.0, v20, -1.0);

  }
  return v13;
}

- (id)handlesForArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[FMFHandle handleWithId:](FMFHandle, "handleWithId:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;

  v22 = (void *)MEMORY[0x1E0CB3940];
  -[FMFFence identifier](self, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[FMFFence isActive](self, "isActive");
  -[FMFFence location](self, "location");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[FMFFence locationType](self, "locationType");
  -[FMFFence label](self, "label");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence type](self, "type");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence trigger](self, "trigger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[FMFFence isRecurring](self, "isRecurring");
  v13 = -[FMFFence isFromMe](self, "isFromMe");
  -[FMFFence friendIdentifier](self, "friendIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence recipients](self, "recipients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence followerIds](self, "followerIds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence schedule](self, "schedule");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence muteEndDate](self, "muteEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence ckRecordName](self, "ckRecordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence ckRecordZoneOwnerName](self, "ckRecordZoneOwnerName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFence acceptanceStatus](self, "acceptanceStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("<FMFFence 0x%lX: identifier: %@, isActive: %d, location: %@,  locationType: %ld, label: %@, type: %@, trigger: %@, isRecurring: %d, isFromMe: %d, friendIdentifier: %@, recipient(s): %@, followerId(s): %@, schedule: %@, muteEndDate: %@, ckRecordName: %@ ckRecordZoneOwnerName: %@ acceptanceStatus: %@>"), self, v21, v20, v19, v18, v23, v17, v12, v15, v13, v14, v11, v3, v4, v5, v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (FMFPlacemark)placemark
{
  return self->_placemark;
}

- (void)setPlacemark:(id)a3
{
  objc_storeStrong((id *)&self->_placemark, a3);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (NSArray)followerIds
{
  return self->_followerIds;
}

- (void)setFollowerIds:(id)a3
{
  objc_storeStrong((id *)&self->_followerIds, a3);
}

- (NSString)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_trigger, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (unint64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(unint64_t)a3
{
  self->_locationType = a3;
}

- (NSString)acceptanceStatus
{
  return self->_acceptanceStatus;
}

- (void)setAcceptanceStatus:(id)a3
{
  objc_storeStrong((id *)&self->_acceptanceStatus, a3);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isRecurring
{
  return self->_recurring;
}

- (void)setRecurring:(BOOL)a3
{
  self->_recurring = a3;
}

- (BOOL)isFromMe
{
  return self->_fromMe;
}

- (void)setFromMe:(BOOL)a3
{
  self->_fromMe = a3;
}

- (FMFSchedule)schedule
{
  return self->_schedule;
}

- (void)setSchedule:(id)a3
{
  objc_storeStrong((id *)&self->_schedule, a3);
}

- (NSDate)muteEndDate
{
  return self->_muteEndDate;
}

- (void)setMuteEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_muteEndDate, a3);
}

- (NSString)ckRecordName
{
  return self->_ckRecordName;
}

- (void)setCkRecordName:(id)a3
{
  objc_storeStrong((id *)&self->_ckRecordName, a3);
}

- (NSString)ckRecordZoneOwnerName
{
  return self->_ckRecordZoneOwnerName;
}

- (void)setCkRecordZoneOwnerName:(id)a3
{
  objc_storeStrong((id *)&self->_ckRecordZoneOwnerName, a3);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (NSString)friendIdentifier
{
  return self->_friendIdentifier;
}

- (void)setFriendIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_friendIdentifier, a3);
}

- (NSString)createdByIdentifier
{
  return self->_createdByIdentifier;
}

- (void)setCreatedByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_createdByIdentifier, a3);
}

- (NSString)pendingIdentifier
{
  return self->_pendingIdentifier;
}

- (void)setPendingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pendingIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingIdentifier, 0);
  objc_storeStrong((id *)&self->_createdByIdentifier, 0);
  objc_storeStrong((id *)&self->_friendIdentifier, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_ckRecordZoneOwnerName, 0);
  objc_storeStrong((id *)&self->_ckRecordName, 0);
  objc_storeStrong((id *)&self->_muteEndDate, 0);
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_storeStrong((id *)&self->_acceptanceStatus, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_followerIds, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
