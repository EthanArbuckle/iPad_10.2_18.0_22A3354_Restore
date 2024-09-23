@implementation EKReminder

- (void)forceUpdateFrozenCalendar:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EKObject changeSet](self, "changeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasUnsavedChangeForKey:", CFSTR("calendar")))
    objc_msgSend(v4, "forceChangeValue:forKey:", v5, CFSTR("calendar"));

}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownSingleValueKeysForComparison
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__EKReminder_knownSingleValueKeysForComparison__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (knownSingleValueKeysForComparison_onceToken_3 != -1)
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_3, block);
  return (id)knownSingleValueKeysForComparison_keys_3;
}

void __47__EKReminder_knownSingleValueKeysForComparison__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v2 = (void *)knownSingleValueKeysForComparison_keys_3;
  knownSingleValueKeysForComparison_keys_3 = (uint64_t)&unk_1E47B5BF0;

  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___EKReminder;
  objc_msgSendSuper2(&v6, sel_knownSingleValueKeysForComparison);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", knownSingleValueKeysForComparison_keys_3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)knownSingleValueKeysForComparison_keys_3;
  knownSingleValueKeysForComparison_keys_3 = v4;

}

+ (EKReminder)reminderWithEventStore:(EKEventStore *)eventStore
{
  EKEventStore *v3;
  NSObject *v4;
  void *v5;
  void *v6;

  v3 = eventStore;
  if (!v3)
  {
    v4 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      +[EKReminder reminderWithEventStore:].cold.1(v4);
  }
  -[EKEventStore reminderStore](v3, "reminderStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createNewReminder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKReminder *)v6;
}

- (EKReminder)initWithPersistentObject:(id)a3
{
  id v4;
  EKReminder *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKReminder;
  v5 = -[EKObject initWithPersistentObject:](&v9, sel_initWithPersistentObject_, v4);
  if (v5 && objc_msgSend(v4, "isNew"))
  {
    objc_msgSend(v4, "eventStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKReminder setTimeZone:](v5, "setTimeZone:", v7);

  }
  return v5;
}

- (unint64_t)entityType
{
  return 1;
}

- (EKReminder)init
{
  if (objc_msgSend(MEMORY[0x1E0D0C278], "isProgramSDKAtLeast:", 0x7E60901FFFFFFFFLL))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("You must use [EKReminder reminderWithEventStore:] to create a reminder"));

  return 0;
}

- (id)title
{
  __CFString *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKReminder;
  -[EKCalendarItem title](&v4, sel_title);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = &stru_1E4789A58;
  return v2;
}

- (id)externalURI
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[EKReminder reminderIdentifier](self, "reminderIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (externalURI_onceToken != -1)
      dispatch_once(&externalURI_onceToken, &__block_literal_global_45);
    objc_msgSend(v2, "stringByAddingPercentEncodingWithAllowedCharacters:", externalURI_allowedCharacters);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@/%@"), CFSTR("x-apple-reminderkit"), CFSTR("REMCDReminder"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __25__EKReminder_externalURI__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "URLFragmentAllowedCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "removeCharactersInString:", CFSTR("/?&:$+,;=@"));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)externalURI_allowedCharacters;
  externalURI_allowedCharacters = v1;

}

- (NSDate)completionDate
{
  return (NSDate *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", CFSTR("completionDate"));
}

- (void)setCompletionDate:(NSDate *)completionDate
{
  NSDate *v4;
  NSDate *v5;
  void *v6;
  double v7;
  id v8;

  v4 = completionDate;
  if (v4)
  {
    v5 = v4;
    v6 = (void *)MEMORY[0x1E0C99D68];
    -[NSDate timeIntervalSinceReferenceDate](v4, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:", floor(v7));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v8, CFSTR("completionDate"));

}

- (id)firstAlertDate
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", CFSTR("firstAlertDate"));
}

- (void)setFirstAlertDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, CFSTR("firstAlertDate"));
}

- (unint64_t)displayOrder
{
  void *v2;
  unint64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", CFSTR("displayOrder"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setDisplayOrder:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, CFSTR("displayOrder"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKReminder title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKReminder dueDate](self, "dueDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKReminder completionDate](self, "completionDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKCalendarItem priority](self, "priority");
  -[EKCalendarItem calendarItemIdentifier](self, "calendarItemIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem alarms](self, "alarms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {title = %@; dueDate = %@; completionDate = %@; priority = %ld; calendarItemIdentifier = %@; alarms = %@}"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setCompleted:(BOOL)completed
{
  id v4;

  if (completed)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[EKReminder setCompletionDate:](self, "setCompletionDate:", v4);

  }
  else
  {
    -[EKReminder setCompletionDate:](self, "setCompletionDate:", 0);
  }
}

- (BOOL)isCompleted
{
  void *v2;
  BOOL v3;

  -[EKReminder completionDate](self, "completionDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)clearParentID
{
  -[EKReminder setParentID:](self, "setParentID:", 0);
}

- (void)snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4 pinsTriggerToStartDate:(BOOL)a5
{
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAcknowledgedDate:", v7);
  -[EKCalendarItem calendar](self, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "maxAlarmsAllowed");

  if (v10 > 1)
  {
    objc_msgSend(v24, "duplicate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v24;
  }
  v12 = v11;
  objc_msgSend(v7, "dateByAddingTimeInterval:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKReminder dueDate](self, "dueDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[EKReminder dueDate](self, "dueDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", v15);
    v17 = v16;

    if (v17 > 0.0 && v17 < a4)
    {
      -[EKReminder dueDate](self, "dueDate");
      v19 = objc_claimAutoreleasedReturnValue();

      v17 = 0.0;
      v13 = (void *)v19;
    }
    objc_msgSend(v12, "absoluteDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v12, "setAbsoluteDate:", v13);
    }
    else
    {
      objc_msgSend(v12, "structuredLocation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        objc_msgSend(v12, "setRelativeOffset:", v17);
    }
  }
  else
  {
    objc_msgSend(v7, "dateByAddingTimeInterval:", a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAbsoluteDate:", v21);

  }
  if (v10 >= 2)
  {
    -[EKCalendarItem findOriginalAlarmStartingWith:](self, "findOriginalAlarmStartingWith:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setOriginalAlarm:", v23);
    -[EKCalendarItem addAlarm:](self, "addAlarm:", v12);

  }
}

- (id)committedConstraints
{
  void *v2;
  void *v3;

  -[EKObject committedValueForKey:](self, "committedValueForKey:", *MEMORY[0x1E0D0B280]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)validate:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)EKReminder;
  v5 = -[EKCalendarItem validate:](&v18, sel_validate_);
  if (v5)
  {
    -[EKCalendarItem calendar](self, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "allowReminders");

    if ((v7 & 1) != 0)
    {
      if (-[EKCalendarItem hasRecurrenceRules](self, "hasRecurrenceRules")
        && (-[EKReminder(Shared) dueDateComponents](self, "dueDateComponents"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v8,
            !v8))
      {
        if (a3)
        {
          v12 = 18;
          goto LABEL_11;
        }
      }
      else
      {
        -[EKReminder constraints](self, "constraints");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "supportsReminderLocations");

        if ((v10 & 1) != 0
          || (-[EKCalendarItem structuredLocation](self, "structuredLocation"),
              v11 = (void *)objc_claimAutoreleasedReturnValue(),
              v11,
              !v11))
        {
          -[EKReminder constraints](self, "constraints");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "supportsReminderActions");

          if ((v15 & 1) != 0
            || (-[EKCalendarItem action](self, "action"),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v16,
                !v16))
          {
            if (-[EKCalendarItem priority](self, "priority") < 0xA)
            {
              LOBYTE(v5) = 1;
              return v5;
            }
            if (a3)
            {
              v12 = 26;
              goto LABEL_11;
            }
          }
          else if (a3)
          {
            v12 = 42;
            goto LABEL_11;
          }
        }
        else if (a3)
        {
          v12 = 20;
LABEL_11:
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", v12);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          LOBYTE(v5) = 0;
          *a3 = v13;
          return v5;
        }
      }
    }
    else if (a3)
    {
      v12 = 23;
      goto LABEL_11;
    }
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)save:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  if (!-[EKObject isNew](self, "isNew", a3))
  {
    v4 = *MEMORY[0x1E0D0B280];
    if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B280]))
    {
      -[EKObject committedValueForKey:](self, "committedValueForKey:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendarItem calendar](self, "calendar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKReminder _adjustAfterMovingOrCopyingFromOldCalendar:toNewCalendar:cachedConstraintsForOldCalendar:savingItem:](self, "_adjustAfterMovingOrCopyingFromOldCalendar:toNewCalendar:cachedConstraintsForOldCalendar:savingItem:", v5, v6, 0, self);

    }
  }
  -[EKCalendarItem pinRecurrenceRuleToEndsOfFreqency](self, "pinRecurrenceRuleToEndsOfFreqency");
  return 1;
}

- (void)_adjustAfterMovingOrCopyingFromOldCalendar:(id)a3 toNewCalendar:(id)a4 cachedConstraintsForOldCalendar:(id)a5 savingItem:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v12;
  v15 = v14;
  if (!v14)
  {
    objc_msgSend(v10, "constraints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v15, "supportsAlarmProximity"))
  {
    objc_msgSend(v11, "constraints");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "supportsAlarmProximity");

    if ((v17 & 1) == 0)
    {
      -[EKCalendarItem alarms](self, "alarms");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v25 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            if (objc_msgSend(v23, "proximity"))
              objc_msgSend(v23, "setProximity:", 0);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v20);
      }

    }
  }

}

- (id)_generateNewUniqueID
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[EKCalendarItem calendar](self, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generateUniqueIDWithReminder:calendar:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_reset
{
  _BOOL4 v3;
  uint64_t v4;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKReminder;
  v3 = -[EKObject _reset](&v7, sel__reset);
  if (v3)
  {
    v4 = objc_opt_class();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __20__EKReminder__reset__block_invoke;
    v6[3] = &unk_1E47864F0;
    v6[4] = self;
    LOBYTE(v3) = -[EKObject _resetIfBackingObjectIsOfClass:fetchResetFrozenObjectBlock:](self, "_resetIfBackingObjectIsOfClass:fetchResetFrozenObjectBlock:", v4, v6);
  }
  return v3;
}

id __20__EKReminder__reset__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "eventStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reminderStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "calendarItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingReminderWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)_removeSnoozedAlarmsFromReminder:(id)a3 usingDueDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "constraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v7, "maxAlarmsAllowed") >= 2)
  {

    if (v6)
      goto LABEL_4;
LABEL_25:
    objc_msgSend(v5, "dueDateComponents");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventStore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeZone");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    EKDateComponentsGetDate();
    v6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_4;
  }
  objc_msgSend(v5, "allAlarms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 < 2)
    goto LABEL_23;
  if (!v6)
    goto LABEL_25;
LABEL_4:
  v10 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v5, "allAlarms");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v5, "allAlarms");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v18, "originalAlarm");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          if (!objc_msgSend(v18, "isAbsolute"))
            continue;
          objc_msgSend(v18, "absoluteDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "compare:", v6);

          if (v21 != 1)
            continue;
        }
        objc_msgSend(v12, "addObject:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v15);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v22 = v12;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(v5, "removeAlarm:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j), (_QWORD)v30);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v24);
  }

LABEL_23:
}

- (id)bestDisplayAlarm
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  id v31;
  id v32;
  id v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[EKCalendarItem alarms](self, "alarms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[EKCalendarItem hasAlarms](self, "hasAlarms"))
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[EKCalendarItem allAlarms](self, "allAlarms");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v40;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v11);
        objc_msgSend(v12, "structuredLocation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v33 = v12;
LABEL_55:
          v15 = v33;

          goto LABEL_56;
        }
        objc_msgSend(v12, "originalAlarm");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v9 = 1;
        }
        else
        {
          objc_msgSend(v5, "addObject:", v12);
          if ((v9 & 1) == 0)
            goto LABEL_12;
        }
        if ((unint64_t)objc_msgSend(v5, "count") >= 2)
        {
          objc_msgSend(v5, "objectAtIndex:", 0);
          v33 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_55;
        }
LABEL_12:
        if (v8 == ++v11)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
          if (v8)
            goto LABEL_4;

          if ((v9 & 1) != 0 && objc_msgSend(v5, "count"))
          {
            objc_msgSend(v5, "objectAtIndex:", 0);
            v15 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_56;
          }
          goto LABEL_18;
        }
      }
    }

  }
LABEL_18:
  if (objc_msgSend(v5, "count"))
  {
    -[EKReminder(Shared) dueDateComponents](self, "dueDateComponents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject eventStore](self, "eventStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    EKDateComponentsGetDate();
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v20 = v5;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v21)
    {
      v22 = v21;
      v15 = 0;
      v23 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v36 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if (v15)
          {
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "isAbsolute", (_QWORD)v35) & 1) != 0)
            {
              objc_msgSend(v25, "absoluteDate");
            }
            else
            {
              objc_msgSend(v25, "relativeOffset");
              objc_msgSend(v19, "dateByAddingTimeInterval:");
            }
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v15, "isAbsolute") & 1) != 0)
            {
              objc_msgSend(v15, "absoluteDate");
            }
            else
            {
              objc_msgSend(v15, "relativeOffset");
              objc_msgSend(v19, "dateByAddingTimeInterval:");
            }
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v26, "isEqualToDate:", v19) & 1) != 0)
            {
              v32 = v25;

              v15 = v32;
              goto LABEL_56;
            }
            if (objc_msgSend(v19, "compare:", v27) == -1 && objc_msgSend(v19, "compare:", v26) != -1)
              goto LABEL_44;
            if (objc_msgSend(v19, "compare:", v27) == -1 || objc_msgSend(v19, "compare:", v26) != -1)
            {
              objc_msgSend(v19, "timeIntervalSinceDate:", v26);
              v29 = v28 >= 0.0 ? v28 : -v28;
              objc_msgSend(v19, "timeIntervalSinceDate:", v27);
              if (v30 < 0.0)
                v30 = -v30;
              if (v29 < v30)
              {
LABEL_44:
                v31 = v25;

                v15 = v31;
              }
            }

          }
          else
          {
            v15 = v25;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v22)
          continue;
        break;
      }
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
LABEL_56:

  return v15;
}

- (id)constraints
{
  void *v3;
  void *v4;

  -[EKObject eventStore](self, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedConstraintsForReminder:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)generateUniqueIDWithReminder:(id)a3 calendar:(id)a4
{
  void *v4;
  int v5;

  objc_msgSend(a4, "constraints", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "requiresMSFormattedUID");

  if (v5)
    _EKMSUUIDString();
  else
    EKUUIDString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDateComponents)startDateComponents
{
  return self->_startDateComponents;
}

- (void)setStartDateComponents:(NSDateComponents *)startDateComponents
{
  objc_setProperty_nonatomic_copy(self, a2, startDateComponents, 72);
}

- (NSDateComponents)dueDateComponents
{
  return self->_dueDateComponents;
}

- (void)setDueDateComponents:(NSDateComponents *)dueDateComponents
{
  objc_setProperty_nonatomic_copy(self, a2, dueDateComponents, 80);
}

- (EKObjectID)parentID
{
  return self->_parentID;
}

- (void)setParentID:(id)a3
{
  objc_storeStrong((id *)&self->_parentID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentID, 0);
  objc_storeStrong((id *)&self->_dueDateComponents, 0);
  objc_storeStrong((id *)&self->_startDateComponents, 0);
}

id __41__EKReminder_Shared__startDateComponents__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "singleChangedValueForKey:", CFSTR("startDateComponents"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "dueDateTimeZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTimeZone:", v5);

      objc_msgSend(v3, "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "componentsInTimeZone:fromDate:", v4, v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTimeZone:", v4);

    }
    else
    {
      objc_msgSend(v3, "setTimeZone:", 0);
      v8 = v3;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)startDateComponentsRaw
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", CFSTR("startDateComponents"));
}

- (NSTimeZone)dueDateTimeZone
{
  void *v2;
  void *v3;

  -[EKReminder(Shared) dueDateComponents](self, "dueDateComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSTimeZone *)v3;
}

- (BOOL)dueDateAllDay
{
  void *v2;
  void *v3;
  BOOL v4;

  -[EKReminder(Shared) dueDateComponents](self, "dueDateComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "hour") == 0x7FFFFFFFFFFFFFFFLL;
  else
    v4 = 0;

  return v4;
}

- (id)dueDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[EKReminder dueDateTimeZone](self, "dueDateTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKReminder(Shared) dueDateComponents](self, "dueDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EKObject eventStore](self, "eventStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    EKDateComponentsGetDate();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)setDueDate:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (objc_class *)MEMORY[0x1E0C99D48];
  v5 = a3;
  v6 = [v4 alloc];
  v10 = (id)objc_msgSend(v6, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  -[EKObject eventStore](self, "eventStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimeZone:", v8);

  objc_msgSend(v10, "components:fromDate:", 2097278, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setCalendar:", v10);
  -[EKReminder(Shared) setDueDateComponents:](self, "setDueDateComponents:", v9);

}

- (void)setTimeZone:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;

  v16 = a3;
  -[EKReminder timeZone](self, "timeZone");
  v4 = objc_claimAutoreleasedReturnValue();
  if (-[EKReminder isAllDay](self, "isAllDay"))
  {

    v5 = 0;
  }
  else
  {
    v5 = (unint64_t)v16;
  }
  v17 = (id)v5;
  if (v4 | v5 && (objc_msgSend((id)v4, "isEqual:", v5) & 1) == 0)
  {
    -[EKReminder(Shared) startDateComponents](self, "startDateComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKReminder(Shared) dueDateComponents](self, "dueDateComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "hour");
      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        v12 = 1048606;
      else
        v12 = 1048830;
      if (v17)
      {
        objc_msgSend(v11, "setTimeZone:", v17);
        objc_msgSend(v11, "components:fromDate:", v12, v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v15 = v17;
      }
      else
      {
        objc_msgSend(v11, "components:fromDate:", v12, v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v15 = 0;
      }
      objc_msgSend(v13, "setTimeZone:", v15);
      -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v14, CFSTR("dueDateComponents"));

    }
    if (v6)
    {
      objc_msgSend(v6, "setTimeZone:", v17);
      -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v17, CFSTR("timeZone"));
      -[EKReminder(Shared) setStartDateComponents:](self, "setStartDateComponents:", v6);
    }

  }
}

- (id)timeZone
{
  void *v3;
  void *v4;
  void *v5;

  -[EKReminder(Shared) dueDateComponents](self, "dueDateComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "timeZone");
  else
    -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", CFSTR("timeZone"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setAllDay:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[EKReminder(Shared) dueDateComponents](self, "dueDateComponents");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v11, "hour") == 0x7FFFFFFFFFFFFFFFLL;
  v6 = v11;
  v7 = !v5;
  if (v11 && ((v7 ^ v3) & 1) == 0)
  {
    objc_msgSend(v11, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "components:fromDate:", 1048606, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTimeZone:", 0);
    -[EKReminder(Shared) setDueDateComponents:](self, "setDueDateComponents:", v10);

    v6 = v11;
  }

}

- (void)_adjustPersistedStartDateComponentsForNewTimeZone:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[EKReminder startDateComponentsRaw](self, "startDateComponentsRaw");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13 = v5;
    -[EKReminder dueDateTimeZone](self, "dueDateTimeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a3 == 0) == (v6 != 0))
    {
      if (objc_msgSend(v13, "hour") == 0x7FFFFFFFFFFFFFFFLL)
        v7 = 1048606;
      else
        v7 = 1048830;
      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTimeZone:", v9);

        objc_msgSend(v13, "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setTimeZone:", v11);

        objc_msgSend(v8, "components:fromDate:", v7, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v13, "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "components:fromDate:", v7, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTimeZone:", 0);
      }

      -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v12, CFSTR("startDateComponents"));
      -[EKObject clearCachedValueForKey:](self, "clearCachedValueForKey:", CFSTR("startDateComponents"));

    }
    v5 = v13;
  }

}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKReminder;
  -[EKObject reset](&v3, sel_reset);
  -[EKObject clearCachedValueForKey:](self, "clearCachedValueForKey:", CFSTR("startDateComponents"));
}

- (void)rollback
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKReminder;
  -[EKObject rollback](&v3, sel_rollback);
  -[EKObject clearCachedValueForKey:](self, "clearCachedValueForKey:", CFSTR("startDateComponents"));
}

- (BOOL)refresh
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKReminder;
  v3 = -[EKObject refresh](&v5, sel_refresh);
  if (v3)
    -[EKObject clearCachedValueForKey:](self, "clearCachedValueForKey:", CFSTR("startDateComponents"));
  return v3;
}

+ (void)reminderWithEventStore:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "API MISUSE: nil event store used in initialization of EKReminder instance", v1, 2u);
}

@end
