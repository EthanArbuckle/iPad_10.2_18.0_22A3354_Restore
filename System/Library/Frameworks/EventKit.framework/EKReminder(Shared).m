@implementation EKReminder(Shared)

- (NSDateComponents)startDateComponents
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__EKReminder_Shared__startDateComponents__block_invoke;
  v3[3] = &unk_1E4784B98;
  v3[4] = self;
  -[EKObject cachedValueForKey:populateBlock:](self, "cachedValueForKey:populateBlock:", CFSTR("startDateComponents"), v3);
  return (NSDateComponents *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setStartDateComponents:()Shared
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  id v24;
  id v25;
  id v26;

  v4 = a3;
  if (!v4)
  {
    v19 = 0;
    v20 = 0;
    goto LABEL_16;
  }
  v5 = v4;
  objc_msgSend(v4, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = (_QWORD *)MEMORY[0x1E0C996C8];
  if (v6)
  {
    objc_msgSend(v6, "calendarIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *v8);

    if ((v10 & 1) == 0)
    {
      v21 = (void *)MEMORY[0x1E0C99DA0];
      v22 = *MEMORY[0x1E0C99778];
      v23 = CFSTR("Calendar must be nil or Gregorian");
LABEL_18:
      objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, v23, 0);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v24);
    }
  }
  if (objc_msgSend(v5, "year") == 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v5, "month") == 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v5, "day") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = CFSTR("Invalid date components: must have at least a year, a month, and a day");
    goto LABEL_18;
  }
  -[EKReminder setAllDay:](self, "setAllDay:", objc_msgSend(v5, "hour") == 0x7FFFFFFFFFFFFFFFLL);
  v25 = (id)objc_msgSend(v5, "copy");

  if (objc_msgSend(v25, "second") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = (void *)objc_msgSend(v25, "copy");

    objc_msgSend(v11, "setSecond:", (uint64_t)(double)objc_msgSend(v11, "second"));
    v25 = v11;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "calendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    objc_msgSend(v25, "setCalendar:", v12);
  objc_msgSend(v25, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "timeZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKReminder setTimeZone:](self, "setTimeZone:", v15);

  objc_msgSend(v25, "timeZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v16, CFSTR("timeZone"));

  -[EKReminder dueDateTimeZone](self, "dueDateTimeZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsInTimeZone:fromDate:", v18, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v12, "components:fromDate:", 1048830, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v20 = v25;
LABEL_16:
  v26 = v20;
  -[EKObject setCachedValue:forKey:](self, "setCachedValue:forKey:", v20, CFSTR("startDateComponents"));
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v19, CFSTR("startDateComponents"));

}

- (NSDateComponents)dueDateComponents
{
  return (NSDateComponents *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", CFSTR("dueDateComponents"));
}

- (void)setDueDateComponents:()Shared
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
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
  uint64_t v26;
  const __CFString *v27;
  id v28;
  id v29;

  v4 = a3;
  if (!v4)
  {
    -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", 0, CFSTR("dueDateComponents"));
    v22 = 0;
    goto LABEL_29;
  }
  v5 = v4;
  objc_msgSend(v4, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = (_QWORD *)MEMORY[0x1E0C996C8];
  if (v6)
  {
    objc_msgSend(v6, "calendarIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *v8);

    if ((v10 & 1) == 0)
    {
      v25 = (void *)MEMORY[0x1E0C99DA0];
      v26 = *MEMORY[0x1E0C99778];
      v27 = CFSTR("Calendar must be nil or Gregorian");
LABEL_31:
      objc_msgSend(v25, "exceptionWithName:reason:userInfo:", v26, v27, 0);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v28);
    }
  }
  v11 = (void *)objc_msgSend(v5, "copy");

  v12 = objc_msgSend(v11, "hour");
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v11, "setTimeZone:", 0);
  if (!v7)
  {
    objc_msgSend(v11, "timeZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      -[EKObject eventStore](self, "eventStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", *v8);
    objc_msgSend(v7, "setTimeZone:", v13);
    objc_msgSend(v11, "setCalendar:", v7);

  }
  if (objc_msgSend(v11, "year") == 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v11, "month") == 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v11, "day") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v25 = (void *)MEMORY[0x1E0C99DA0];
    v26 = *MEMORY[0x1E0C99778];
    v27 = CFSTR("Invalid date components: must have at least a year, a month, and a day");
    goto LABEL_31;
  }
  if (objc_msgSend(v11, "second") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = (void *)objc_msgSend(v11, "copy");

    objc_msgSend(v15, "setSecond:", (uint64_t)(double)objc_msgSend(v15, "second"));
    v11 = v15;
  }
  -[EKReminder(Shared) startDateComponents](self, "startDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 == 0x7FFFFFFFFFFFFFFFLL || !v16)
  {
    v19 = v7;
    v29 = v11;
  }
  else
  {
    -[EKReminder timeZone](self, "timeZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v19, "setTimeZone:", v17);
      objc_msgSend(v19, "components:fromDate:", 1048830, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v20;
      v21 = v17;
    }
    else
    {
      objc_msgSend(v19, "components:fromDate:", 1048830, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v20;
      v21 = 0;
    }
    objc_msgSend(v20, "setTimeZone:", v21);

    -[EKReminder(Shared) dueDateComponents](self, "dueDateComponents");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
      -[EKReminder _adjustPersistedStartDateComponentsForNewTimeZone:](self, "_adjustPersistedStartDateComponentsForNewTimeZone:", v17);

  }
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v29, CFSTR("dueDateComponents"));
  v22 = v29;
  if (v29)
  {
    -[EKReminder(Shared) startDateComponents](self, "startDateComponents");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
      -[EKReminder(Shared) setStartDateComponents:](self, "setStartDateComponents:", v29);
    v22 = v29;
  }
LABEL_29:

}

@end
