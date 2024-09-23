@implementation EKEvent

- (int64_t)travelRoutingMode
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  v2 = (void *)MEMORY[0x1E0D0C328];
  -[EKCalendarItem travelStartLocation](self, "travelStartLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "routing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "routingModeEnumForCalRouteType:", v4);

  return v5;
}

- (BOOL)isProposedTimeEvent
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[EKEvent proposedStartDate](self, "proposedStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[EKEvent proposedStartDate](self, "proposedStartDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent startDate](self, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToDate:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSDate)proposedStartDate
{
  void *v2;
  double v3;
  id v4;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B6D8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  if (fabs(v3) >= 2.22044605e-16)
    v4 = v2;
  else
    v4 = 0;

  return (NSDate *)v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  double v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKEvent;
  v3 = -[EKObject hash](&v8, sel_hash);
  -[EKEvent occurrenceStartDate](self, "occurrenceStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteTime");
  v6 = v3 ^ (unint64_t)v5;

  return v6;
}

- (EKCalendarDate)occurrenceStartDate
{
  return self->_occurrenceStartDate;
}

- (EKVirtualConference)virtualConference
{
  id v2;
  void *v3;
  id v5;

  v5 = 0;
  -[EKEvent parsedConference:andNotes:](self, "parsedConference:andNotes:", &v5, 0);
  v2 = v5;
  objc_msgSend(v2, "conference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKVirtualConference *)v3;
}

- (void)parsedConference:(id *)a3 andNotes:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__EKEvent_EKEvent_Shared__parsedConference_andNotes___block_invoke;
  v10[3] = &unk_1E4784B98;
  v10[4] = self;
  -[EKObject cachedValueForKey:populateBlock:](self, "cachedValueForKey:populateBlock:", CFSTR("parsedConferenceKey"), v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    if (a3)
      *a3 = 0;
    if (a4)
      *a4 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("parseResult"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("notes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
      *a3 = objc_retainAutorelease(v8);
    if (a4)
      *a4 = objc_retainAutorelease(v9);

  }
}

id __53__EKEvent_EKEvent_Shared__parsedConference_andNotes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "notes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "notes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKConferencePersistence deserializeConference:](EKConferencePersistence, "deserializeConference:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v3)
      v6 = v4 == 0;
    else
      v6 = 1;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10[0] = CFSTR("parseResult");
      v10[1] = CFSTR("notes");
      v11[0] = v4;
      v11[1] = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v8;

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)isEqual:(id)a3
{
  EKEvent *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (EKEvent *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      -[EKObject objectID](v4, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKObject objectID](self, "objectID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[EKEvent originalOccurrenceStartDate](v4, "originalOccurrenceStartDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEvent originalOccurrenceStartDate](self, "originalOccurrenceStartDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 == v10)
        {
          v6 = 1;
        }
        else
        {
          -[EKEvent originalOccurrenceStartDate](v4, "originalOccurrenceStartDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKEvent originalOccurrenceStartDate](self, "originalOccurrenceStartDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v11, "isEqual:", v12);

        }
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)title
{
  __CFString *v3;
  uint64_t v4;
  int64_t v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  _QWORD v14[5];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)EKEvent;
  -[EKCalendarItem title](&v15, sel_title);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = -[__CFString length](v3, "length");
  v5 = -[EKEvent privacyLevel](self, "privacyLevel");
  if (!-[EKObject isNew](self, "isNew") && (!v4 ? (v6 = (v5 & 0xFFFFFFFFFFFFFFFELL) == 2) : (v6 = 0), v6))
  {
    EKBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Private Event"), &stru_1E4789A58, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v8;
  }
  else
  {
    -[EKEvent birthdayContactIdentifier](self, "birthdayContactIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __16__EKEvent_title__block_invoke;
      v14[3] = &unk_1E4784B98;
      v14[4] = self;
      -[EKObject cachedValueForKey:populateBlock:](self, "cachedValueForKey:populateBlock:", CFSTR("birthdayTitle"), v14);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  v11 = &stru_1E4789A58;
  if (v3)
    v11 = v3;
  v10 = v11;
  v3 = v10;
LABEL_13:
  v12 = v10;

  return v12;
}

- (EKEvent)initWithPersistentObject:(id)a3 occurrenceDate:(id)a4
{
  id v6;
  id v7;
  EKEvent *v8;
  EKEvent *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  id v24;
  id v25;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Can't create EKEvent without persistent event"));
  v26.receiver = self;
  v26.super_class = (Class)EKEvent;
  v8 = -[EKObject initWithPersistentObject:](&v26, sel_initWithPersistentObject_, v6);
  v9 = v8;
  if (v8)
  {
    v8->_locationPredictionLock._os_unfair_lock_opaque = 0;
    v8->_locationPredictionAllowed = 1;
    -[EKEvent setOccurrenceIsAllDay:](v8, "setOccurrenceIsAllDay:", -[EKEvent _isAllDay](v8, "_isAllDay"));
    -[EKEvent startDateRaw](v9, "startDateRaw");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v11 = -[EKEvent adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:](v9, "adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:", v10, 1, 0, &v25);
    v12 = v25;

    -[EKEvent endDateRaw](v9, "endDateRaw");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v14 = -[EKEvent adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:](v9, "adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:", v13, 1, 1, &v24);
    v15 = v24;

    if (v7)
    {
      v16 = (void *)MEMORY[0x1E0D0C420];
      -[EKEvent effectiveTimeZone](v9, "effectiveTimeZone");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "calendarDateWithDate:timeZone:", v7, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[EKEvent setOccurrenceStartDate:](v9, "setOccurrenceStartDate:", v18);
      -[EKEvent _calculateDurationWithStart:end:allDay:](v9, "_calculateDurationWithStart:end:allDay:", v12, v15, -[EKEvent occurrenceIsAllDay](v9, "occurrenceIsAllDay"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v18, "calendarDateByComponentwiseAddingComponents:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEvent setOccurrenceEndDate:](v9, "setOccurrenceEndDate:", v20);

      }
      else
      {
        -[EKEvent setOccurrenceEndDate:](v9, "setOccurrenceEndDate:", v18);
      }

    }
    else
    {
      -[EKEvent setOccurrenceStartDate:](v9, "setOccurrenceStartDate:", v12);
      -[EKEvent setOccurrenceEndDate:](v9, "setOccurrenceEndDate:", v15);
      v18 = v15;
    }

    v21 = !-[EKEvent isDetached](v9, "isDetached") && -[EKEvent isFirstOccurrence](v9, "isFirstOccurrence");
    v9->_isMainOccurrence = v21;
    -[EKEvent _invalidateRecurrenceIdentifier](v9, "_invalidateRecurrenceIdentifier");
    if (objc_msgSend(v6, "isNew")
      && -[EKEvent isReminderIntegrationEvent](v9, "isReminderIntegrationEvent")
      && !-[EKEvent isDetached](v9, "isDetached"))
    {
      objc_msgSend(v6, "eventStore");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addPendingIntegrationEvent:", v9);

    }
  }

  return v9;
}

- (id)adjustedPersistedDateForDate:(id)a3 withAdjustmentMode:(unint64_t)a4 pinMode:(unint64_t)a5 clientCalendarDate:(id *)a6
{
  id v10;
  _BOOL8 v11;
  id v12;
  id v14;

  v10 = a3;
  v11 = -[EKEvent isFloating](self, "isFloating") || -[EKEvent isAllDay](self, "isAllDay");
  v14 = 0;
  -[EKEvent adjustedDatesForDate:persistedDateIsInUTC:withAdjustmentMode:pinMode:outClientCalendarDate:outPersistedDate:](self, "adjustedDatesForDate:persistedDateIsInUTC:withAdjustmentMode:pinMode:outClientCalendarDate:outPersistedDate:", v10, v11, a4, a5, a6, &v14);
  v12 = v14;

  return v12;
}

- (BOOL)isAllDay
{
  return self->_occurrenceIsAllDay;
}

- (BOOL)isFloating
{
  void *v2;
  BOOL v3;

  -[EKCalendarItem timeZone](self, "timeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)effectiveTimeZone
{
  void *v3;
  void *v4;

  -[EKCalendarItem timeZone](self, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[EKObject eventStore](self, "eventStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeZone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)startDateRaw
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B3D0]);
}

- (void)setOccurrenceStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setOccurrenceIsAllDay:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  self->_occurrenceIsAllDay = a3;
  if (-[EKObject isNew](self, "isNew"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[EKEvent setOriginalOccurrenceIsAllDay:](self, "setOriginalOccurrenceIsAllDay:", v5);

  }
}

- (void)setOccurrenceEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)occurrenceIsAllDay
{
  return self->_occurrenceIsAllDay;
}

- (BOOL)isFirstOccurrence
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[EKObject isNew](self, "isNew"))
    return 1;
  -[EKCalendarItem originalItem](self, "originalItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKCalendarItem hasRecurrenceRules](self, "hasRecurrenceRules")
    || (-[EKCalendarItem originalItem](self, "originalItem"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    if (v4)
    {
      -[EKEvent originalStartDate](self, "originalStartDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_committedStartDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v6, "isEqualToDate:", v7);

    }
    else
    {
      v3 = -[EKEvent _isOriginalOccurrenceStartDateSameAsCommittedStartDate](self, "_isOriginalOccurrenceStartDateSameAsCommittedStartDate");
    }
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (BOOL)isDetached
{
  void *v2;
  BOOL v3;

  -[EKObject frozenOrMeltedCachedSingleRelationObjectForKey:](self, "frozenOrMeltedCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B338]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)endDateRaw
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B680]);
}

- (void)_invalidateRecurrenceIdentifier
{
  -[EKObject clearCachedValueForKey:](self, "clearCachedValueForKey:", CFSTR("recurrenceIdentifier"));
}

- (id)_calculateDurationWithStart:(id)a3 end:(id)a4 allDay:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a5)
  {
    objc_msgSend(v8, "differenceAsDateComponents:units:", v7, 242);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hour") <= 11)
      objc_msgSend(v10, "setDay:", objc_msgSend(v10, "day") - 1);
    objc_msgSend(v10, "setHour:", 23);
    objc_msgSend(v10, "setMinute:", 59);
    objc_msgSend(v10, "setSecond:", 59);
  }
  else
  {
    objc_msgSend(v7, "timeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "secondsFromGMTForDate:", v12);
    v15 = objc_msgSend(v11, "secondsFromGMTForDate:", v13);
    v16 = v14 <= v15;
    v17 = v14 - v15;
    if (v16)
    {

      objc_msgSend(v9, "differenceAsDateComponents:units:", v7, 242);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "calendar");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dateByAddingTimeInterval:", (double)v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "components:fromDate:toDate:options:", 242, v19, v13, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v10;
}

- (BOOL)_isAllDay
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  BOOL v4;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B308]);
  v2 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = CFBooleanGetValue(v2) != 0;
  else
    v4 = 0;

  return v4;
}

- (id)_committedStartDate
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x1E0D0B3D0];
  v4.receiver = self;
  v4.super_class = (Class)EKEvent;
  -[EKObject committedValueForKey:](&v4, sel_committedValueForKey_, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_isOriginalOccurrenceStartDateSameAsCommittedStartDate
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  const void *v11;
  double v12;

  -[EKEvent originalOccurrenceStartDate](self, "originalOccurrenceStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent _committedStartDate](self, "_committedStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;

  objc_msgSend(v3, "absoluteTime");
  v8 = v7;
  -[EKObject _previousValueForKey:](self, "_previousValueForKey:", *MEMORY[0x1E0D0B3D8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9 || objc_msgSend(v9, "isEqualToString:", CFSTR("_float")))
  {
    v11 = (const void *)CalTimeZoneCopyCFTimeZone();
    -[EKEvent effectiveTimeZone](self, "effectiveTimeZone");
    CalAbsoluteTimeGetAbsoluteTimeInTimeZone();
    v8 = v12;
    CFRelease(v11);
  }

  return vabdd_f64(v8, v6) < 2.22044605e-16;
}

- (EKCalendarDate)originalOccurrenceStartDate
{
  EKCalendarDate *originalOccurrenceStartDate;

  originalOccurrenceStartDate = self->_originalOccurrenceStartDate;
  if (!originalOccurrenceStartDate)
    originalOccurrenceStartDate = self->_occurrenceStartDate;
  return originalOccurrenceStartDate;
}

+ (id)knownRelationshipSingleValueKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__EKEvent_knownRelationshipSingleValueKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (knownRelationshipSingleValueKeys_onceToken_2 != -1)
    dispatch_once(&knownRelationshipSingleValueKeys_onceToken_2, block);
  return (id)knownRelationshipSingleValueKeys_keys_2;
}

+ (id)knownRelationshipMultiValueKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__EKEvent_knownRelationshipMultiValueKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (knownRelationshipMultiValueKeys_onceToken_2 != -1)
    dispatch_once(&knownRelationshipMultiValueKeys_onceToken_2, block);
  return (id)knownRelationshipMultiValueKeys_keys_2;
}

- (int64_t)privacyLevel
{
  void *v2;
  void *v3;
  int64_t v4;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B6D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (NSString)birthdayContactIdentifier
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B630]);
}

- (BOOL)supportsJunkReporting
{
  void *v2;
  char v3;

  -[EKCalendarItem calendar](self, "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsJunkReporting");

  return v3;
}

- (NSString)eventIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[EKCalendarItem uniqueID](self, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject eventStore](self, "eventStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceIdentifierForEvent:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (v3 && v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v5, *MEMORY[0x1E0D0C518], v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v6;
}

- (BOOL)conferenceURLForDisplayCached
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;

  -[EKCalendarItem calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sourceType");

  if (v5 == 2)
  {
    -[EKObject cachedValueForKey:populateBlock:](self, "cachedValueForKey:populateBlock:", CFSTR("conferenceURLDetectedKey"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;
  }
  else
  {
    -[EKEvent conferenceURL](self, "conferenceURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = 1;
    }
    else
    {
      -[EKObject cachedValueForKey:populateBlock:](self, "cachedValueForKey:populateBlock:", CFSTR("conferenceURLDetectedKey"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8 != 0;

    }
  }

  return v7;
}

- (int64_t)specialDayType
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[EKCalendarItem calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isChinaHolidayCalendar");

  if (!v4)
    return 0;
  -[EKEvent specialDayString](self, "specialDayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DDB958]) & 1) != 0)
    {
      v7 = 1;
    }
    else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DDB950]))
    {
      v7 = 3;
    }
    else
    {
      v7 = 4;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (EKEventStatus)status
{
  void *v2;
  EKEventStatus v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B6F8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSDate)endDateUnadjustedForLegacyClients
{
  void *v2;
  void *v3;

  -[EKEvent occurrenceEndDate](self, "occurrenceEndDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (int64_t)compareStartDateIncludingTravelWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[EKEvent startDateIncludingTravel](self, "startDateIncludingTravel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDateIncludingTravel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NSDate)startDateIncludingTravel
{
  void *v3;
  double v4;
  void *v5;

  -[EKEvent startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent travelTime](self, "travelTime");
  objc_msgSend(v3, "dateByAddingTimeInterval:", -v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (NSDate)startDate
{
  return (NSDate *)-[EKCalendarDate date](self->_occurrenceStartDate, "date");
}

- (double)travelTime
{
  void *v2;
  double v3;
  double v4;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B710]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return fmax(v4, 0.0);
}

- (EKCalendarDate)occurrenceEndDate
{
  return self->_occurrenceEndDate;
}

- (NSString)locationWithoutPrediction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[EKEvent preferredLocationWithoutPrediction](self, "preferredLocationWithoutPrediction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEvent preferredLocationWithoutPrediction](self, "preferredLocationWithoutPrediction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D0C328], "fullDisplayStringWithTitle:address:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (EKStructuredLocation)preferredLocationWithoutPrediction
{
  void *v3;

  -[EKCalendarItem clientLocation](self, "clientLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[EKCalendarItem structuredLocationWithoutPrediction](self, "structuredLocationWithoutPrediction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (EKStructuredLocation *)v3;
}

- (EKStructuredLocation)structuredLocation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[EKEvent _updatePredictedLocationCacheIfNeeded](self, "_updatePredictedLocationCacheIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[EKCalendarItem structuredLocationWithoutPrediction](self, "structuredLocationWithoutPrediction");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (EKStructuredLocation *)v6;
}

- (id)_updatePredictedLocationCacheIfNeeded
{
  os_unfair_lock_s *p_locationPredictionLock;
  EKStructuredLocation *v4;
  _BOOL4 v5;
  uint64_t v6;
  EKStructuredLocation *v7;

  p_locationPredictionLock = &self->_locationPredictionLock;
  os_unfair_lock_lock(&self->_locationPredictionLock);
  v4 = self->_cachedLocationPrediction;
  v5 = -[EKEvent _needsPredictedLocationCacheUpdateHoldingLock](self, "_needsPredictedLocationCacheUpdateHoldingLock");
  os_unfair_lock_unlock(p_locationPredictionLock);
  if (v5)
  {
    os_unfair_lock_lock(p_locationPredictionLock);
    -[EKEvent _updatePredictedLocationCacheIfNeededHoldingLock](self, "_updatePredictedLocationCacheIfNeededHoldingLock");
    v6 = objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_locationPredictionLock);
    v4 = (EKStructuredLocation *)v6;
  }
  v7 = v4;

  return v7;
}

- (BOOL)_needsPredictedLocationCacheUpdateHoldingLock
{
  NSDate *cachedLocationPredictionExpirationDate;
  NSDate *v4;
  void *v5;
  char v6;

  if (self->_locationPredictionFrozen || !self->_locationPredictionAllowed)
    return 0;
  cachedLocationPredictionExpirationDate = self->_cachedLocationPredictionExpirationDate;
  if (!cachedLocationPredictionExpirationDate)
    return 1;
  v4 = cachedLocationPredictionExpirationDate;
  v5 = (void *)objc_opt_new();
  v6 = -[NSDate CalIsAfterDate:](v4, "CalIsAfterDate:", v5);

  return v6 ^ 1;
}

- (int64_t)participationStatus
{
  void *v2;
  void *v3;
  int64_t v4;

  -[EKCalendarItem selfAttendee](self, "selfAttendee");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "participantStatus");
  else
    v4 = 2;

  return v4;
}

- (BOOL)_invitationChangedPropertyForFlag:(unsigned int)a3
{
  return (-[EKEvent invitationChangedProperties](self, "invitationChangedProperties") & a3) != 0;
}

- (unsigned)invitationChangedProperties
{
  void *v2;
  unsigned int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B6A0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (BOOL)videoConferenceChanged
{
  return -[EKEvent _invitationChangedPropertyForFlag:](self, "_invitationChangedPropertyForFlag:", 256);
}

- (BOOL)titleChanged
{
  return -[EKEvent _invitationChangedPropertyForFlag:](self, "_invitationChangedPropertyForFlag:", 4);
}

- (BOOL)timeChanged
{
  return -[EKEvent _invitationChangedPropertyForFlag:](self, "_invitationChangedPropertyForFlag:", 2);
}

- (BOOL)recurrenceChanged
{
  return -[EKEvent _invitationChangedPropertyForFlag:](self, "_invitationChangedPropertyForFlag:", 512);
}

- (BOOL)locationChanged
{
  return -[EKEvent _invitationChangedPropertyForFlag:](self, "_invitationChangedPropertyForFlag:", 8);
}

- (unint64_t)invitationStatus
{
  void *v2;
  unint64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B6A8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (BOOL)dateChanged
{
  return -[EKEvent _invitationChangedPropertyForFlag:](self, "_invitationChangedPropertyForFlag:", 1);
}

- (BOOL)attendeeReplyChanged
{
  return -[EKEvent _invitationChangedPropertyForFlag:](self, "_invitationChangedPropertyForFlag:", 240);
}

id __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v2 = objc_msgSend(*(id *)(a1 + 32), "junkStatus");
  objc_msgSend(*(id *)(a1 + 32), "selfAttendee");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "participantStatus");

  if (v2)
  {
    +[EKLogSubsystem junk](EKLogSubsystem, "junk");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_5(v2, v5);
    goto LABEL_14;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isNew"))
  {
    +[EKLogSubsystem junk](EKLogSubsystem, "junk");
    v5 = objc_claimAutoreleasedReturnValue();
    v2 = 2;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      goto LABEL_14;
    __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
LABEL_18:
    v2 = 2;
    goto LABEL_14;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isSelfOrganized") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "hasAttendees") & 1) == 0)
  {
    +[EKLogSubsystem junk](EKLogSubsystem, "junk");
    v5 = objc_claimAutoreleasedReturnValue();
    v2 = 2;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      goto LABEL_14;
    __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_2(v5, v20, v21, v22, v23, v24, v25, v26);
    goto LABEL_18;
  }
  if (v4 == 4 || v4 == 2)
  {
    +[EKLogSubsystem junk](EKLogSubsystem, "junk");
    v5 = objc_claimAutoreleasedReturnValue();
    v2 = 2;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      goto LABEL_14;
    __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_4(v5, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_18;
  }
  v2 = +[EKJunkInvitationProtocol_Shared junkStatusForInvitation:](EKJunkInvitationProtocol_Shared, "junkStatusForInvitation:", *(_QWORD *)(a1 + 32));
  +[EKLogSubsystem junk](EKLogSubsystem, "junk");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_3(v2, v5, v28, v29, v30, v31, v32, v33);
LABEL_14:

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasAttendeeProposedTimes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[EKCalendarItem isSelfOrganizedInvitation](self, "isSelfOrganizedInvitation"))
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[EKCalendarItem attendees](self, "attendees", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          objc_msgSend(v9, "proposedStartDateForEvent:", self);
          v10 = objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = (void *)v10;
            v12 = objc_msgSend(v9, "proposedStartDateStatus");

            if (v12 != 3)
            {

              v13 = 1;
              goto LABEL_16;
            }
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_16:

  return v13;
}

- (NSDate)participationStatusModifiedDate
{
  return (NSDate *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B6C8]);
}

- (unint64_t)junkStatus
{
  void *v2;
  unint64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B6B0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

- (NSURL)externalURL
{
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
  double v13;
  void *v14;
  void *v15;

  -[EKCalendarItem calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "sourceIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[EKEvent uniqueId](self, "uniqueId");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          if (externalURL_onceToken != -1)
            dispatch_once(&externalURL_onceToken, &__block_literal_global_44);
          objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", externalURL_allowedCharacters);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringByAddingPercentEncodingWithAllowedCharacters:", externalURL_allowedCharacters);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)MEMORY[0x1E0CB3940];
          -[EKEvent startDate](self, "startDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "timeIntervalSinceReferenceDate");
          objc_msgSend(v11, "stringWithFormat:", CFSTR("x-apple-calevent://%@/%@?o=%lld"), v9, v10, (uint64_t)v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

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

  return (NSURL *)v15;
}

- (id)earliestOccurrenceEndingAfter:(id)a3 excludeSignificantDetachments:(BOOL)a4 excludeCanceledDetachments:(BOOL)a5 excludeDeclinedDetachments:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  EKEvent *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  double v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  EKEvent *v44;
  void *v45;
  id v47;
  void *v48;
  EKEvent *v49;
  void *v50;
  void *v51;
  void *v52;
  EKRecurrenceGenerator *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v65 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (-[EKCalendarItem hasRecurrenceRules](self, "hasRecurrenceRules"))
  {
    v54 = v10;
    v53 = objc_alloc_init(EKRecurrenceGenerator);
    -[EKCalendarItem exceptionDates](self, "exceptionDates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem detachedItems](self, "detachedItems");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedArrayUsingSelector:", sel_compareStartDateWithEvent_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    v52 = v11;
    if (v15)
    {
      v16 = v15;
      v49 = self;
      v17 = *(_QWORD *)v60;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v60 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          if ((!v8 || (objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "isSignificantlyDetached") & 1) == 0)
            && (!v7 || objc_msgSend(v19, "status") != 3)
            && (!v6 || objc_msgSend(v19, "selfParticipantStatus") != 3))
          {
            objc_msgSend(v19, "endDateUnadjustedForLegacyClients");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "CalIsAfterDate:", v54);

            if (v21)
            {
              v47 = v19;
              goto LABEL_20;
            }
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
        if (v16)
          continue;
        break;
      }
      v47 = 0;
LABEL_20:
      v11 = v52;
      self = v49;
    }
    else
    {
      v47 = 0;
    }

    if (objc_msgSend(v14, "count"))
    {
      v25 = (void *)objc_msgSend(v11, "mutableCopy");
      if (!v25)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v14, "count"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v25 = 0;
    }
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v26 = v14;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v56 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * j), "recurrenceDate", v47);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
            objc_msgSend(v25, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      }
      while (v28);
    }

    -[EKEvent duration](self, "duration");
    v10 = v54;
    objc_msgSend(v54, "dateByAddingTimeInterval:", -v32);
    v33 = objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      v35 = v25;
    else
      v35 = v11;
    -[EKEvent startCalendarDate](self, "startCalendarDate", v47);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)MEMORY[0x1E0D0C420];
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)v33;
    objc_msgSend(v37, "calendarDateWithDate:timeZone:", v33, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKRecurrenceGenerator nextOccurrenceDateWithEKRecurrences:forCalendarItem:exceptionDates:initialDate:afterDate:](v53, "nextOccurrenceDateWithEKRecurrences:forCalendarItem:exceptionDates:initialDate:afterDate:", v34, self, v35, v36, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      v41 = v48;
      if (!v48
        || (objc_msgSend(v48, "startDate"),
            v42 = (void *)objc_claimAutoreleasedReturnValue(),
            v43 = objc_msgSend(v42, "CalIsBeforeDate:", v40),
            v42,
            !v43))
      {
        v44 = [EKEvent alloc];
        -[EKObject persistentObject](self, "persistentObject");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[EKEvent initWithPersistentObject:occurrenceDate:](v44, "initWithPersistentObject:occurrenceDate:", v45, v40);

LABEL_45:
        goto LABEL_46;
      }
    }
    else
    {
      v41 = v48;
    }
    v24 = (EKEvent *)objc_msgSend(v41, "copy");
    goto LABEL_45;
  }
  -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "CalIsAfterDate:", v10);

  if (v23)
    v24 = self;
  else
    v24 = 0;
LABEL_46:

  return v24;
}

- (EKCalendarDate)startCalendarDate
{
  return self->_occurrenceStartDate;
}

- (double)duration
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[EKEvent occurrenceEndDate](self, "occurrenceEndDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarDate date](self->_occurrenceStartDate, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  return v7;
}

- (id)constraints
{
  void *v3;
  void *v4;

  -[EKObject eventStore](self, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedConstraintsForEvent:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setLocationPredictionAllowed:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_locationPredictionLock;

  v3 = a3;
  p_locationPredictionLock = &self->_locationPredictionLock;
  os_unfair_lock_lock(&self->_locationPredictionLock);
  if (self->_locationPredictionAllowed != v3)
    self->_locationPredictionAllowed = v3;
  os_unfair_lock_unlock(p_locationPredictionLock);
}

void __22__EKEvent_externalURL__block_invoke()
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
  v2 = (void *)externalURL_allowedCharacters;
  externalURL_allowedCharacters = v1;

}

void __43__EKEvent_knownRelationshipSingleValueKeys__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D0B2B8];
  v11[0] = *MEMORY[0x1E0D0B700];
  v11[1] = v2;
  v3 = *MEMORY[0x1E0D0B650];
  v11[2] = *MEMORY[0x1E0D0B698];
  v11[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)knownRelationshipSingleValueKeys_keys_2;
  knownRelationshipSingleValueKeys_keys_2 = v4;

  v6 = (void *)knownRelationshipSingleValueKeys_keys_2;
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___EKEvent;
  objc_msgSendSuper2(&v10, sel_knownRelationshipSingleValueKeys);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)knownRelationshipSingleValueKeys_keys_2;
  knownRelationshipSingleValueKeys_keys_2 = v8;

}

void __42__EKEvent_knownRelationshipMultiValueKeys__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0D0B620];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)knownRelationshipMultiValueKeys_keys_2;
  knownRelationshipMultiValueKeys_keys_2 = v2;

  v4 = (void *)knownRelationshipMultiValueKeys_keys_2;
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___EKEvent;
  objc_msgSendSuper2(&v8, sel_knownRelationshipMultiValueKeys);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)knownRelationshipMultiValueKeys_keys_2;
  knownRelationshipMultiValueKeys_keys_2 = v6;

}

- (BOOL)_couldBeJunkCommon
{
  unint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[EKEvent cachedJunkStatus](self, "cachedJunkStatus");
  +[EKLogSubsystem junk](EKLogSubsystem, "junk");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3 == 3)
  {
    if (v5)
      -[EKEvent(EKEvent_Shared) _couldBeJunkCommon].cold.1((uint64_t)self, v4, v6, v7, v8, v9, v10, v11);
  }
  else if (v5)
  {
    -[EKEvent(EKEvent_Shared) _couldBeJunkCommon].cold.2((uint64_t)self, v4, v6, v7, v8, v9, v10, v11);
  }

  return v3 == 3;
}

- (unint64_t)cachedJunkStatus
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke;
  v5[3] = &unk_1E4784B98;
  v5[4] = self;
  -[EKObject cachedValueForKey:populateBlock:](self, "cachedValueForKey:populateBlock:", CFSTR("cachedJunkStatus"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualConferenceTextRepresentation, 0);
  objc_storeStrong((id *)&self->_showEventURLString, 0);
  objc_storeStrong((id *)&self->_originalOccurrenceIsAllDay, 0);
  objc_storeStrong((id *)&self->_originalOccurrenceEndDate, 0);
  objc_storeStrong((id *)&self->_originalOccurrenceStartDate, 0);
  objc_storeStrong((id *)&self->_occurrenceEndDate, 0);
  objc_storeStrong((id *)&self->_occurrenceStartDate, 0);
  objc_storeStrong((id *)&self->_birthdayPersonUniqueID, 0);
  objc_storeStrong((id *)&self->_virtualConferenceURLsToInvalidateOnCommit, 0);
  objc_storeStrong((id *)&self->_cachedLocationPredictionExpirationDate, 0);
  objc_storeStrong((id *)&self->_cachedLocationPrediction, 0);
}

- (void)setIsJunk:(BOOL)a3 shouldSave:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;

  v4 = a4;
  if (a3)
    v7 = 1;
  else
    v7 = 2;
  -[EKEvent setJunkStatus:](self, "setJunkStatus:", v7);
  if (v4)
  {
    -[EKObject eventStore](self, "eventStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v8, "saveEvent:span:commit:error:", self, 2, 1, &v11);
    v9 = v11;

    if (v9)
    {
      v10 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        -[EKEvent(EKEvent_Shared) setIsJunk:shouldSave:].cold.1(a3, (uint64_t)v9, v10);
    }

  }
}

- (void)setCachedJunkStatus:(unint64_t)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[EKObject setCachedValue:forKey:](self, "setCachedValue:forKey:", v4, CFSTR("cachedJunkStatus"));

  }
  else
  {
    -[EKObject clearCachedValueForKey:](self, "clearCachedValueForKey:", CFSTR("cachedJunkStatus"));
  }
}

- (NSArray)locations
{
  void *v2;
  void *v3;

  -[EKCalendarItem location](self, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("; "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setLocations:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_locationStringForLocations:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[EKCalendarItem setLocation:](self, "setLocation:", v5);
}

- (NSArray)locationsWithoutPrediction
{
  void *v2;
  void *v3;

  -[EKEvent locationWithoutPrediction](self, "locationWithoutPrediction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("; "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (id)_locationStringForLocations:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setNotesCommon:(id)a3
{
  -[EKEvent clearDetectedConferenceURL](self, "clearDetectedConferenceURL", a3);
  -[EKEvent clearParsedConference](self, "clearParsedConference");
}

- (void)clearParsedConference
{
  -[EKObject clearCachedValueForKey:](self, "clearCachedValueForKey:", CFSTR("parsedConferenceKey"));
}

- (id)conferenceURLForDisplay
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  -[EKCalendarItem calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sourceType");

  if (v5 != 2)
  {
    -[EKEvent conferenceURL](self, "conferenceURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[EKEvent conferenceURLDetected](self, "conferenceURLDetected");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  -[EKEvent conferenceURLDetected](self, "conferenceURLDetected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
LABEL_5:
    v7 = v6;
    v6 = v7;
    goto LABEL_7;
  }
  -[EKEvent conferenceURL](self, "conferenceURL");
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = v7;

  return v8;
}

- (void)clearDetectedConferenceURL
{
  -[EKObject clearCachedValueForKey:](self, "clearCachedValueForKey:", CFSTR("conferenceURLDetectedKey"));
}

- (id)conferenceURLDetected
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];

  if (!-[EKEvent _detectedConferenceURLOnBackingObjectMayBeInvalid](self, "_detectedConferenceURLOnBackingObjectMayBeInvalid"))
  {
    -[EKEvent conferenceURLDetectedString](self, "conferenceURLDetectedString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__EKEvent_EKEvent_Shared__conferenceURLDetected__block_invoke;
  v8[3] = &unk_1E4784B98;
  v8[4] = self;
  -[EKObject cachedValueForKey:populateBlock:](self, "cachedValueForKey:populateBlock:", CFSTR("conferenceURLDetectedKey"), v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    goto LABEL_7;
  v5 = v3;
LABEL_6:
  v6 = v5;
LABEL_8:

  return v6;
}

id __48__EKEvent_EKEvent_Shared__conferenceURLDetected__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_detectConferenceURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (id)conferenceURLDetectedString
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B658]);
}

- (BOOL)_detectedConferenceURLOnBackingObjectMayBeInvalid
{
  char v3;
  void *v5;

  if (-[EKObject isNew](self, "isNew")
    || -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B328])
    || -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B258])
    || -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B290])
    || -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B3E0]))
  {
    return 1;
  }
  -[EKCalendarItem preferredLocation](self, "preferredLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "_hasChangesForKey:", *MEMORY[0x1E0D0B7A0]) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v5, "_hasChangesForKey:", *MEMORY[0x1E0D0B748]);

  return v3;
}

- (id)_detectConferenceURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D0C288];
  -[EKEvent _prioritizedConferencesSources](self, "_prioritizedConferencesSources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conferenceURLFromSources:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_prioritizedConferencesSources
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  -[EKEvent locationWithoutPrediction](self, "locationWithoutPrediction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[EKEvent locationWithoutPrediction](self, "locationWithoutPrediction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[EKEvent displayNotes](self, "displayNotes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[EKEvent displayNotes](self, "displayNotes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[EKEvent URL](self, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[EKEvent URL](self, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  return v3;
}

+ (id)EKObjectChangeSummarizer_singleValueDiffKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__EKEvent_EKObjectChangeSummarizer__EKObjectChangeSummarizer_singleValueDiffKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (EKObjectChangeSummarizer_singleValueDiffKeys_onceToken_104 != -1)
    dispatch_once(&EKObjectChangeSummarizer_singleValueDiffKeys_onceToken_104, block);
  return (id)EKObjectChangeSummarizer_singleValueDiffKeys_diffKeys_103;
}

void __81__EKEvent_EKObjectChangeSummarizer__EKObjectChangeSummarizer_singleValueDiffKeys__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  _QWORD v13[9];
  _QWORD v14[10];

  v14[9] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D0B710];
  v13[0] = *MEMORY[0x1E0D0B628];
  v13[1] = v2;
  v14[0] = CFSTR("EKChangedAvailability");
  v14[1] = CFSTR("EKChangedTravelTime");
  v3 = *MEMORY[0x1E0D0B680];
  v13[2] = *MEMORY[0x1E0D0B6D0];
  v13[3] = v3;
  v14[2] = CFSTR("EKChangedPrivacy");
  v14[3] = CFSTR("EKChangedEndDate");
  v4 = *MEMORY[0x1E0D0B6B0];
  v13[4] = *MEMORY[0x1E0D0B2C0];
  v13[5] = v4;
  v14[4] = CFSTR("EKChangedEndTimeZone");
  v14[5] = CFSTR("EKChangedJunkStatus");
  +[EKDiff summaryKeyForChangedProperty:subProperty:](EKDiff, "summaryKeyForChangedProperty:subProperty:", *MEMORY[0x1E0D0B358], *MEMORY[0x1E0D0B248]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D0B6D8];
  v13[6] = v5;
  v13[7] = v6;
  v14[6] = CFSTR("EKChangedParticipationStatus");
  v14[7] = CFSTR("EKChangedAlternateTimeProposal");
  v13[8] = *MEMORY[0x1E0D0B6E8];
  v14[8] = CFSTR("EKChangedResponseComment");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)&OBJC_METACLASS___EKEvent;
  objc_msgSendSuper2(&v12, sel_EKObjectChangeSummarizer_singleValueDiffKeys);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "addEntriesFromDictionary:", v7);
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)EKObjectChangeSummarizer_singleValueDiffKeys_diffKeys_103;
  EKObjectChangeSummarizer_singleValueDiffKeys_diffKeys_103 = v10;

}

+ (id)EKObjectChangeSummarizer_multiValueDiffKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__EKEvent_EKObjectChangeSummarizer__EKObjectChangeSummarizer_multiValueDiffKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (EKObjectChangeSummarizer_multiValueDiffKeys_onceToken_108 != -1)
    dispatch_once(&EKObjectChangeSummarizer_multiValueDiffKeys_onceToken_108, block);
  return (id)EKObjectChangeSummarizer_multiValueDiffKeys_diffKeys_107;
}

void __80__EKEvent_EKObjectChangeSummarizer__EKObjectChangeSummarizer_multiValueDiffKeys__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D0B278];
  v12[0] = CFSTR("add");
  v12[1] = CFSTR("remove");
  v13[0] = CFSTR("EKChangedAttendeesAdded");
  v13[1] = CFSTR("EKChangedAttendeesRemoved");
  v12[2] = CFSTR("modify");
  v13[2] = CFSTR("EKChangedAttendeesModified");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = *MEMORY[0x1E0D0B270];
  v15[0] = v2;
  v10[0] = CFSTR("add");
  v10[1] = CFSTR("remove");
  v11[0] = CFSTR("EKChangedAttachmentsAdded");
  v11[1] = CFSTR("EKChangedAttachmentsRemoved");
  v10[2] = CFSTR("modify");
  v11[2] = CFSTR("EKChangedAttachmentsModified");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___EKEvent;
  objc_msgSendSuper2(&v9, sel_EKObjectChangeSummarizer_multiValueDiffKeys);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addEntriesFromDictionary:", v4);
  v7 = objc_msgSend(v6, "copy");
  v8 = (void *)EKObjectChangeSummarizer_multiValueDiffKeys_diffKeys_107;
  EKObjectChangeSummarizer_multiValueDiffKeys_diffKeys_107 = v7;

}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownKeysToSkipForFutureChanges
{
  if (knownKeysToSkipForFutureChanges_onceToken != -1)
    dispatch_once(&knownKeysToSkipForFutureChanges_onceToken, &__block_literal_global_57);
  return (id)knownKeysToSkipForFutureChanges_knownKeysToSkipForFutureChanges;
}

void __42__EKEvent_knownKeysToSkipForFutureChanges__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[10];

  v6[9] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B680];
  v6[0] = *MEMORY[0x1E0D0B3D0];
  v6[1] = v0;
  v1 = *MEMORY[0x1E0D0B300];
  v6[2] = *MEMORY[0x1E0D0B350];
  v6[3] = v1;
  v2 = *MEMORY[0x1E0D0B2B0];
  v6[4] = *MEMORY[0x1E0D0B2A8];
  v6[5] = v2;
  v3 = *MEMORY[0x1E0D0B408];
  v6[6] = *MEMORY[0x1E0D0B338];
  v6[7] = v3;
  v6[8] = *MEMORY[0x1E0D0B280];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)knownKeysToSkipForFutureChanges_knownKeysToSkipForFutureChanges;
  knownKeysToSkipForFutureChanges_knownKeysToSkipForFutureChanges = v4;

}

+ (id)knownKeysToUseForFutureChanges
{
  if (knownKeysToUseForFutureChanges_onceToken != -1)
    dispatch_once(&knownKeysToUseForFutureChanges_onceToken, &__block_literal_global_17);
  return (id)knownKeysToUseForFutureChanges_knownKeysToUseForFutureChanges;
}

void __41__EKEvent_knownKeysToUseForFutureChanges__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B270];
  v5[0] = *MEMORY[0x1E0D0B278];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0D0B330];
  v5[2] = *MEMORY[0x1E0D0B6D0];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0D0B710];
  v5[4] = *MEMORY[0x1E0D0B3E0];
  v5[5] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)knownKeysToUseForFutureChanges_knownKeysToUseForFutureChanges;
  knownKeysToUseForFutureChanges_knownKeysToUseForFutureChanges = v3;

}

+ (id)knownSingleValueKeysForComparison
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__EKEvent_knownSingleValueKeysForComparison__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (knownSingleValueKeysForComparison_onceToken_4 != -1)
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_4, block);
  return (id)knownSingleValueKeysForComparison_keys_4;
}

void __44__EKEvent_knownSingleValueKeysForComparison__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v18;
  _QWORD v19[24];

  v19[23] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D0B630];
  v19[0] = *MEMORY[0x1E0D0B628];
  v19[1] = v2;
  v3 = *MEMORY[0x1E0D0B648];
  v19[2] = *MEMORY[0x1E0D0B640];
  v19[3] = v3;
  v4 = *MEMORY[0x1E0D0B678];
  v19[4] = *MEMORY[0x1E0D0B660];
  v19[5] = v4;
  v5 = *MEMORY[0x1E0D0B688];
  v19[6] = *MEMORY[0x1E0D0B680];
  v19[7] = v5;
  v6 = *MEMORY[0x1E0D0B6A0];
  v19[8] = *MEMORY[0x1E0D0B690];
  v19[9] = v6;
  v7 = *MEMORY[0x1E0D0B6B0];
  v19[10] = *MEMORY[0x1E0D0B6A8];
  v19[11] = v7;
  v8 = *MEMORY[0x1E0D0B6C0];
  v19[12] = *MEMORY[0x1E0D0B6B8];
  v19[13] = v8;
  v9 = *MEMORY[0x1E0D0B340];
  v19[14] = *MEMORY[0x1E0D0B6C8];
  v19[15] = v9;
  v10 = *MEMORY[0x1E0D0B6D8];
  v19[16] = *MEMORY[0x1E0D0B6D0];
  v19[17] = v10;
  v11 = *MEMORY[0x1E0D0B3D0];
  v19[18] = *MEMORY[0x1E0D0B6E8];
  v19[19] = v11;
  v12 = *MEMORY[0x1E0D0B708];
  v19[20] = *MEMORY[0x1E0D0B6F8];
  v19[21] = v12;
  v19[22] = *MEMORY[0x1E0D0B710];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 23);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)knownSingleValueKeysForComparison_keys_4;
  knownSingleValueKeysForComparison_keys_4 = v13;

  v18.receiver = *(id *)(a1 + 32);
  v18.super_class = (Class)&OBJC_METACLASS___EKEvent;
  objc_msgSendSuper2(&v18, sel_knownSingleValueKeysForComparison);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayByAddingObjectsFromArray:", knownSingleValueKeysForComparison_keys_4);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)knownSingleValueKeysForComparison_keys_4;
  knownSingleValueKeysForComparison_keys_4 = v16;

}

+ (EKEvent)eventWithEventStore:(EKEventStore *)eventStore
{
  EKEventStore *v4;
  void *v5;

  v4 = eventStore;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEventStore:", v4);

  return (EKEvent *)v5;
}

- (EKEvent)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("You must use [EKEvent eventWithEventStore:] to create an event"));

  return 0;
}

- (EKEvent)initWithEventStore:(id)a3
{
  id v4;
  EKPersistentEvent *v5;
  EKEvent *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    -[EKEvent initWithEventStore:].cold.1();
  v5 = objc_alloc_init(EKPersistentEvent);
  objc_msgSend(v4, "_registerObject:", v5);
  v6 = -[EKEvent initWithPersistentObject:occurrenceDate:](self, "initWithPersistentObject:occurrenceDate:", v5, 0);
  EKUUIDString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem setCalendarItemIdentifier:](v6, "setCalendarItemIdentifier:", v7);

  objc_msgSend(v4, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent setTimeZone:](v6, "setTimeZone:", v8);

  -[EKEvent defaultAlarms](v6, "defaultAlarms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[EKAlarm alarmWithRelativeOffset:](EKAlarm, "alarmWithRelativeOffset:", 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDefaultAlarm:", 1);
  }
  -[EKCalendarItem addAlarm:](v6, "addAlarm:", v10);

  return v6;
}

- (EKEvent)initWithPersistentObject:(id)a3
{
  return -[EKEvent initWithPersistentObject:occurrenceDate:](self, "initWithPersistentObject:occurrenceDate:", a3, 0);
}

- (EKEvent)initWithPersistentObject:(id)a3 objectForCopy:(id)a4
{
  id v6;
  id v7;
  char isKindOfClass;
  _QWORD *v9;
  void *v10;
  void *v11;
  _BYTE *v12;
  void *v13;
  void *v14;
  EKEvent *v15;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = (_QWORD *)MEMORY[0x1E0C99778];
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Trying to initialize an EKEvent as a copy of an object that is not an EKEvent"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *v9, CFSTR("Trying to initialize an EKEvent with a backing object that is not an EKPersistentEvent"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "raise");

  }
  v12 = v7;
  objc_msgSend(v12, "originalOccurrenceStartDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[EKEvent initWithPersistentObject:occurrenceDate:](self, "initWithPersistentObject:occurrenceDate:", v6, v14);

  LOBYTE(v14) = v12[108];
  v15->_isMainOccurrence = (char)v14;

  return v15;
}

- (unint64_t)entityType
{
  return 0;
}

- (NSString)eventOccurrenceID
{
  void *v2;
  void *v3;

  -[EKEvent recurrenceIdentifier](self, "recurrenceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifierString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (EKRecurrenceIdentifier)recurrenceIdentifier
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__EKEvent_recurrenceIdentifier__block_invoke;
  v3[3] = &unk_1E4784B98;
  v3[4] = self;
  -[EKObject cachedValueForKey:populateBlock:](self, "cachedValueForKey:populateBlock:", CFSTR("recurrenceIdentifier"), v3);
  return (EKRecurrenceIdentifier *)(id)objc_claimAutoreleasedReturnValue();
}

id __31__EKEvent_recurrenceIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "localUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recurrenceDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRecurrenceIdentifier recurrenceIdentifierWithLocalUID:recurrenceDate:](EKRecurrenceIdentifier, "recurrenceIdentifierWithLocalUID:recurrenceDate:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDate)recurrenceDate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[EKEvent originalStartDate](self, "originalStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else if (-[EKCalendarItem hasRecurrenceRules](self, "hasRecurrenceRules"))
  {
    -[EKEvent originalOccurrenceStartDate](self, "originalOccurrenceStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[EKCalendarItem timeZone](self, "timeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[EKEvent effectiveTimeZone](self, "effectiveTimeZone");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateInTimeZone:fromTimeZone:", 0, v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v9;
    }
  }
  else
  {
    v5 = 0;
  }

  return (NSDate *)v5;
}

+ (id)externalUriScheme
{
  return CFSTR("x-apple-calevent");
}

- (BOOL)isStatusDirty
{
  return -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B6F8]);
}

- (BOOL)isStartDateDirty
{
  return -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B3D0]);
}

- (BOOL)isEndDateDirty
{
  return -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B680]);
}

- (BOOL)isAllDayDirty
{
  return -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B308]);
}

+ (id)_modifiedNotificationUserInfoWithIdentifier:(id)a3 forRevert:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  id *v8;
  const __CFString **v9;
  uint64_t v10;
  void *v11;
  const __CFString *v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v4 = a4;
  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v15[0] = CFSTR("EKEventStoreModifiedEventIdentifier");
      v15[1] = CFSTR("EKEventStoreRevert");
      v16[0] = v5;
      v16[1] = MEMORY[0x1E0C9AAB0];
      v7 = (void *)MEMORY[0x1E0C99D80];
      v8 = (id *)v16;
      v9 = (const __CFString **)v15;
      v10 = 2;
    }
    else
    {
      v13 = CFSTR("EKEventStoreModifiedEventIdentifier");
      v14 = v5;
      v7 = (void *)MEMORY[0x1E0C99D80];
      v8 = &v14;
      v9 = &v13;
      v10 = 1;
    }
    objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)postModifiedNotification
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_opt_class();
  -[EKObject uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_modifiedNotificationUserInfoWithIdentifier:forRevert:", v5, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent postModifiedNotificationWithUserInfo:](self, "postModifiedNotificationWithUserInfo:", v4);

}

- (void)postModifiedNotificationWithUserInfo:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("EKEventModifiedNotification"), self, v5);

}

- (BOOL)needsGeocoding
{
  EKEvent *v2;
  void *v3;

  v2 = self;
  -[EKObject eventStore](self, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "needsGeocodingForEvent:", v2);

  return (char)v2;
}

- (void)setNeedsGeocoding:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[EKObject eventStore](self, "eventStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsGeocoding:forEvent:", v3, self);

}

- (id)committedValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D0B3D0]))
  {
    -[EKEvent originalOccurrenceStartDate](self, "originalOccurrenceStartDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D0B680]))
    {
      v9.receiver = self;
      v9.super_class = (Class)EKEvent;
      -[EKObject committedValueForKey:](&v9, sel_committedValueForKey_, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    -[EKEvent originalOccurrenceEndDate](self, "originalOccurrenceEndDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(v5, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v7;
}

- (void)setTitle:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[EKEvent _clearLocationPredictionCacheIfNotFrozen](self, "_clearLocationPredictionCacheIfNotFrozen");
  v5.receiver = self;
  v5.super_class = (Class)EKEvent;
  -[EKCalendarItem setTitle:](&v5, sel_setTitle_, v4);

}

id __16__EKEvent_title__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)MEMORY[0x1E0C99D48];
  objc_msgSend(*(id *)(a1 + 32), "calendarScale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CalCalendarWithUnsanitizedCalendarIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "calendarIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D0C298];
  objc_msgSend(*(id *)(a1 + 32), "birthdayContactName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_committedStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "birthdayStringForContactName:eventDate:birthDate:lunarCalendar:", v7, v8, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isPhantom
{
  void *v2;
  void *v3;
  char v4;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B340]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)isOriginalItemPhantom
{
  void *v2;
  char v3;

  -[EKCalendarItem originalItem](self, "originalItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPhantom");

  return v3;
}

- (void)setIsPhantom:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B340]);

}

- (void)setAllDay:(BOOL)allDay
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v3 = allDay;
  if (-[EKEvent isEditable](self, "isEditable") && -[EKEvent isAllDay](self, "isAllDay") != v3)
  {
    if (!-[EKObject isNew](self, "isNew") && !self->_originalOccurrenceIsAllDay)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_occurrenceIsAllDay);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent setOriginalOccurrenceIsAllDay:](self, "setOriginalOccurrenceIsAllDay:", v5);

    }
    -[EKEvent setOccurrenceIsAllDay:](self, "setOccurrenceIsAllDay:", v3);
    v16.receiver = self;
    v16.super_class = (Class)EKEvent;
    -[EKCalendarItem setAllDay:](&v16, sel_setAllDay_, v3);
    if (-[EKEvent isAllDay](self, "isAllDay"))
    {
      -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent duration](self, "duration");
      if (v7 > 0.0)
      {
        -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEvent effectiveTimeZone](self, "effectiveTimeZone");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "components:forDayInTimeZone:", 254, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v10, "hour") && !objc_msgSend(v10, "minute") && !objc_msgSend(v10, "second"))
        {
          objc_msgSend(v10, "setDay:", objc_msgSend(v10, "day") - 1);
          objc_msgSend(v10, "date");
          v11 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v11;
        }

      }
      -[EKEvent startDate](self, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent _updateStartDateForDate:withAdjustmentMode:](self, "_updateStartDateForDate:withAdjustmentMode:", v12, 0);

      -[EKEvent _updateEndDateForDate:withAdjustmentMode:](self, "_updateEndDateForDate:withAdjustmentMode:", v6, 0);
      -[EKEvent forceSetTimeZone:](self, "forceSetTimeZone:", 0);
    }
    else
    {
      -[EKEvent occurrenceStartDate](self, "occurrenceStartDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeZone");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent forceSetTimeZone:](self, "forceSetTimeZone:", v14);

      -[EKEvent startDate](self, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent _updateStartDateForDate:withAdjustmentMode:](self, "_updateStartDateForDate:withAdjustmentMode:", v15, 0);

      -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent _updateEndDateForDate:withAdjustmentMode:](self, "_updateEndDateForDate:withAdjustmentMode:", v6, 0);
    }

    -[EKEvent updateDefaultAlarms](self, "updateDefaultAlarms");
    +[EKAlarmUtils adjustRelativeAlarmsForEvent:whenConvertingToIsAllDay:](EKAlarmUtils, "adjustRelativeAlarmsForEvent:whenConvertingToIsAllDay:", self, v3);
    -[EKEvent clearCachedTimeValues](self, "clearCachedTimeValues");
  }
}

- (void)updateDefaultAlarms
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[EKCalendarItem alarms](self, "alarms", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "isDefaultAlarm") && (objc_msgSend(v8, "isAbsolute") & 1) == 0)
        {
          -[EKEvent _defaultAlarmOffset](self, "_defaultAlarmOffset");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
          {
            objc_msgSend(v9, "doubleValue");
            if (v11 != 9.22337204e18)
            {
              objc_msgSend(v10, "doubleValue");
              objc_msgSend(v8, "setRelativeOffset:");
            }
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)_updateRecurrenceEndDatesWithAdjustmentMode:(unint64_t)a3
{
  void *v4;
  EKEvent *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self;
  -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "recurrenceEnd");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "endDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          -[EKEvent adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:](v5, "adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:", v13, a3, 1, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[EKRecurrenceEnd recurrenceEndWithEndDate:](EKRecurrenceEnd, "recurrenceEndWithEndDate:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setRecurrenceEnd:", v15);

        }
        objc_msgSend(v4, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  -[EKEvent setRecurrenceRules:](v5, "setRecurrenceRules:", v4);
}

- (EKCalendarDate)startCalendarDateIncludingTravelTime
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D0C420];
  -[EKEvent startDateIncludingTravel](self, "startDateIncludingTravel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem timeZone](self, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarDateWithDate:timeZone:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKCalendarDate *)v6;
}

- (void)setStartDateRaw:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B3D0]);
  -[EKEvent clearCachedTimeValues](self, "clearCachedTimeValues");
}

- (id)_committedEndDate
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x1E0D0B680];
  v4.receiver = self;
  v4.super_class = (Class)EKEvent;
  -[EKObject committedValueForKey:](&v4, sel_committedValueForKey_, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDateComponents)startDateComponents
{
  _BOOL4 v3;
  EKCalendarDate *occurrenceStartDate;
  void *v5;

  v3 = -[EKEvent isAllDay](self, "isAllDay");
  occurrenceStartDate = self->_occurrenceStartDate;
  if (v3)
    -[EKCalendarDate dayComponents](occurrenceStartDate, "dayComponents");
  else
    -[EKCalendarDate allComponents](occurrenceStartDate, "allComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKEvent isFloating](self, "isFloating"))
    objc_msgSend(v5, "setTimeZone:", 0);
  return (NSDateComponents *)v5;
}

- (void)setStartDateComponentsPreservingDuration:(id)a3
{
  int v4;
  char v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v4 = objc_msgSend(v26, "CalHasTimeComponents");
  v5 = v4;
  v6 = v4 ^ 1u;
  objc_msgSend(MEMORY[0x1E0D0C2F8], "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultEventDuration");
  v9 = v8;

  if (-[EKEvent isAllDay](self, "isAllDay"))
  {
    -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateByAddingTimeInterval:", 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianCalendarForTimeZone:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent startDate](self, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "components:fromDate:toDate:options:", 16, v14, v11, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "day");
  }
  else
  {
    -[EKEvent duration](self, "duration");
    v9 = v17;
    v16 = 1;
  }
  objc_msgSend(v26, "timeZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;
  objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianCalendarForTimeZone:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dateFromComponents:", v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent setAllDay:](self, "setAllDay:", v6);
  -[EKEvent setTimeZone:](self, "setTimeZone:", v19);
  -[EKEvent setStartDate:](self, "setStartDate:", v23);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v23, "dateByAddingTimeInterval:", v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v22, "dateByAddingUnit:value:toDate:options:", 16, v16, v23, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dateByAddingTimeInterval:", -1.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[EKEvent setEndDateUnadjustedForLegacyClients:](self, "setEndDateUnadjustedForLegacyClients:", v24);

}

- (void)setStartDate:(NSDate *)startDate
{
  -[EKEvent _setStartDate:andClearProposedTimes:allowSettingIfNotEditable:](self, "_setStartDate:andClearProposedTimes:allowSettingIfNotEditable:", startDate, 1, 0);
}

- (void)overrideStartDate:(id)a3
{
  -[EKEvent _setStartDate:andClearProposedTimes:allowSettingIfNotEditable:](self, "_setStartDate:andClearProposedTimes:allowSettingIfNotEditable:", a3, 0, 1);
}

- (void)overrideEndDate:(id)a3
{
  -[EKEvent _setEndDateUnadjustedForLegacyClients:allowSettingIfNotEditable:](self, "_setEndDateUnadjustedForLegacyClients:allowSettingIfNotEditable:", a3, 1);
}

- (id)_pinDate:(id)a3 withPinMode:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  void *v11;

  v6 = a3;
  if (-[EKEvent isAllDay](self, "isAllDay"))
  {
    if (a4 == 1)
    {
      -[EKEvent effectiveTimeZone](self, "effectiveTimeZone");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ek_ios_dateForEndOfDayInTimeZone:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (!a4)
    {
      -[EKEvent effectiveTimeZone](self, "effectiveTimeZone");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dateForDayInTimeZone:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v11 = (void *)v8;

      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid pin mode: %d"), a4);
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  if (!v6)
    goto LABEL_10;
  v9 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:", floor(v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v11;
}

- (void)adjustedDatesForDate:(id)a3 persistedDateIsInUTC:(BOOL)a4 withAdjustmentMode:(unint64_t)a5 pinMode:(unint64_t)a6 outClientCalendarDate:(id *)a7 outPersistedDate:(id *)a8
{
  _BOOL4 v12;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;

  v12 = a4;
  v20 = a3;
  -[EKEvent effectiveTimeZone](self, "effectiveTimeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 == 1)
  {
    if (v12)
    {
      objc_msgSend(v20, "dateInTimeZone:fromTimeZone:", v14, 0);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = v20;
    }
    v16 = v18;
    v17 = v20;
LABEL_12:
    v19 = v17;
    if (!a7)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (!a5)
  {
    -[EKEvent _pinDate:withPinMode:](self, "_pinDate:withPinMode:", v20, a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v12)
    {
      objc_msgSend(v15, "dateInTimeZone:fromTimeZone:", 0, v14);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = v15;
      v16 = v17;
    }
    goto LABEL_12;
  }
  v16 = 0;
  v19 = 0;
  if (a7)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0D0C420], "calendarDateWithDate:timeZone:", v16, v14);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_14:
  if (a8)
    *a8 = objc_retainAutorelease(v19);

}

- (void)_updateStartDateForDate:(id)a3 withAdjustmentMode:(unint64_t)a4
{
  -[EKEvent _updateStartDateForDate:withAdjustmentMode:adjustEndDate:](self, "_updateStartDateForDate:withAdjustmentMode:adjustEndDate:", a3, a4, 1);
}

- (void)_updateStartDateForDate:(id)a3 withAdjustmentMode:(unint64_t)a4 adjustEndDate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a5;
  v8 = a3;
  if (!-[EKObject isNew](self, "isNew") && !self->_originalOccurrenceStartDate)
  {
    -[EKEvent occurrenceStartDate](self, "occurrenceStartDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setOriginalOccurrenceStartDate:](self, "setOriginalOccurrenceStartDate:", v9);

    -[EKEvent occurrenceEndDate](self, "occurrenceEndDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setOriginalOccurrenceEndDate:](self, "setOriginalOccurrenceEndDate:", v10);

  }
  v16 = 0;
  -[EKEvent adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:](self, "adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:", v8, a4, 0, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  -[EKEvent setOccurrenceStartDate:](self, "setOccurrenceStartDate:", v12);
  -[EKEvent setStartDateRaw:](self, "setStartDateRaw:", v11);
  if (v5 && !-[EKEvent isEndDateDirty](self, "isEndDateDirty"))
  {
    -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:](self, "adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:", v13, a4, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKObject changeSet](self, "changeSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "forceChangeValue:forKey:", v14, *MEMORY[0x1E0D0B680]);

  }
}

- (void)_setStartDate:(id)a3 andClearProposedTimes:(BOOL)a4 allowSettingIfNotEditable:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v6 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a5 || -[EKEvent isEditable](self, "isEditable"))
  {
    -[EKEvent startDate](self, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
      -[EKEvent _updateStartDateForDate:withAdjustmentMode:](self, "_updateStartDateForDate:withAdjustmentMode:", v8, 0);
      if (v6)
      {
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        -[EKCalendarItem attendees](self, "attendees", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v18;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v18 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
              objc_msgSend(v16, "setProposedStartDate:forEvent:", 0, self);
              objc_msgSend(v16, "setProposedStartDateChanged:", 0);
              objc_msgSend(v16, "setCommentChanged:", 0);
              objc_msgSend(v16, "setStatusChanged:", 0);
              objc_msgSend(v16, "setProposedStartDateStatus:", 0);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          }
          while (v13);
        }

      }
    }
  }

}

- (double)durationIncludingTravel
{
  double v3;
  double v4;
  double v5;

  -[EKEvent duration](self, "duration");
  v4 = v3;
  -[EKEvent travelTime](self, "travelTime");
  return v4 + v5;
}

- (void)setEndDateRaw:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B680]);
  -[EKEvent clearCachedTimeValues](self, "clearCachedTimeValues");
}

- (void)setEndDateUnadjustedForLegacyClients:(id)a3
{
  -[EKEvent _setEndDateUnadjustedForLegacyClients:allowSettingIfNotEditable:](self, "_setEndDateUnadjustedForLegacyClients:allowSettingIfNotEditable:", a3, 0);
}

- (void)_setEndDateUnadjustedForLegacyClients:(id)a3 allowSettingIfNotEditable:(BOOL)a4
{
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  if (a4 || -[EKEvent isEditable](self, "isEditable"))
  {
    -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v8);

    if ((v7 & 1) == 0)
      -[EKEvent _updateEndDateForDate:withAdjustmentMode:](self, "_updateEndDateForDate:withAdjustmentMode:", v8, 0);
  }

}

- (void)_updateEndDateForDate:(id)a3 withAdjustmentMode:(unint64_t)a4
{
  -[EKEvent _updateEndDateForDate:withAdjustmentMode:adjustStartDate:](self, "_updateEndDateForDate:withAdjustmentMode:adjustStartDate:", a3, a4, 1);
}

- (void)_updateEndDateForDate:(id)a3 withAdjustmentMode:(unint64_t)a4 adjustStartDate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v5 = a5;
  v8 = a3;
  if (!-[EKObject isNew](self, "isNew") && !self->_originalOccurrenceEndDate)
  {
    -[EKEvent occurrenceStartDate](self, "occurrenceStartDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setOriginalOccurrenceStartDate:](self, "setOriginalOccurrenceStartDate:", v9);

    -[EKEvent occurrenceEndDate](self, "occurrenceEndDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setOriginalOccurrenceEndDate:](self, "setOriginalOccurrenceEndDate:", v10);

  }
  v18 = 0;
  -[EKEvent adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:](self, "adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:", v8, a4, 1, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;
  -[EKEvent setOccurrenceEndDate:](self, "setOccurrenceEndDate:", v12);
  -[EKEvent endDateRaw](self, "endDateRaw");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", v11);

  if ((v14 & 1) == 0)
  {
    -[EKEvent setEndDateRaw:](self, "setEndDateRaw:", v11);
    if (v5 && !-[EKEvent isStartDateDirty](self, "isStartDateDirty"))
    {
      -[EKEvent startDate](self, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:](self, "adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:", v15, a4, 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[EKObject changeSet](self, "changeSet");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "forceChangeValue:forKey:", v16, *MEMORY[0x1E0D0B3D0]);

    }
  }

}

- (void)forceSetTimeZone:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEvent;
  -[EKCalendarItem setTimeZone:](&v3, sel_setTimeZone_, a3);
}

- (void)setTimeZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v4 = a3;
  -[EKCalendarItem timeZone](self, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKEvent isEditable](self, "isEditable"))
  {
    v18.receiver = self;
    v18.super_class = (Class)EKEvent;
    -[EKCalendarItem setTimeZone:](&v18, sel_setTimeZone_, v4);
    if (v4)
    {
      if (-[EKEvent isAllDay](self, "isAllDay"))
      {
        if (!-[EKObject isNew](self, "isNew") && !self->_originalOccurrenceIsAllDay)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_occurrenceIsAllDay);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKEvent setOriginalOccurrenceIsAllDay:](self, "setOriginalOccurrenceIsAllDay:", v6);

        }
        -[EKEvent setOccurrenceIsAllDay:](self, "setOccurrenceIsAllDay:", 0);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v7, *MEMORY[0x1E0D0B308]);

      }
      if (v5)
      {
        if (!-[EKEvent _settingTimeZoneChangesStartEndDates](self, "_settingTimeZoneChangesStartEndDates"))
          goto LABEL_17;
        goto LABEL_16;
      }
      v8 = 0;
    }
    else
    {
      v8 = v5 != 0;
    }
    -[EKEvent startDate](self, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent _updateStartDateForDate:withAdjustmentMode:](self, "_updateStartDateForDate:withAdjustmentMode:", v9, 0);

    -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent _updateEndDateForDate:withAdjustmentMode:](self, "_updateEndDateForDate:withAdjustmentMode:", v10, 0);

    if (-[EKEvent _settingTimeZoneChangesStartEndDates](self, "_settingTimeZoneChangesStartEndDates"))
    {
      if (!v8)
      {
        -[EKObject eventStore](self, "eventStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeZone");
        v12 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v12;
      }
LABEL_16:
      -[EKEvent effectiveTimeZone](self, "effectiveTimeZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent startDate](self, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dateInTimeZone:fromTimeZone:", v13, v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[EKEvent setStartDate:](self, "setStartDate:", v15);
      -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dateInTimeZone:fromTimeZone:", v13, v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[EKEvent setEndDateUnadjustedForLegacyClients:](self, "setEndDateUnadjustedForLegacyClients:", v17);
    }
  }
LABEL_17:

}

- (BOOL)_settingTimeZoneChangesStartEndDates
{
  return 0;
}

- (NSDate)originalStartDate
{
  return (NSDate *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B6C0]);
}

- (void)setOriginalStartDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B6C0]);
}

- (NSDate)initialStartDate
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;

  if (-[EKObject isNew](self, "isNew"))
  {
    -[EKEvent startDate](self, "startDate");
    return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EKObject _previousValueForKey:](self, "_previousValueForKey:", *MEMORY[0x1E0D0B3D0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent originalOccurrenceIsAllDay](self, "originalOccurrenceIsAllDay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[EKEvent originalOccurrenceIsAllDay](self, "originalOccurrenceIsAllDay");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "BOOLValue");

    }
    else
    {
      v7 = -[EKEvent occurrenceIsAllDay](self, "occurrenceIsAllDay");
    }

    -[EKObject _previousValueForKey:](self, "_previousValueForKey:", *MEMORY[0x1E0D0B3D8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "timeZoneFromTimeZoneName:withFloatingTimeZone:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v10 = v7;
    else
      v10 = 1;
    v13 = 0;
    -[EKEvent adjustedDatesForDate:persistedDateIsInUTC:withAdjustmentMode:pinMode:outClientCalendarDate:outPersistedDate:](self, "adjustedDatesForDate:persistedDateIsInUTC:withAdjustmentMode:pinMode:outClientCalendarDate:outPersistedDate:", v4, v10, 1, 0, &v13, 0);
    v11 = v13;
    objc_msgSend(v11, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSDate *)v12;
  }
}

- (NSDate)initialEndDate
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;

  if (-[EKObject isNew](self, "isNew"))
  {
    -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
    return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EKObject _previousValueForKey:](self, "_previousValueForKey:", *MEMORY[0x1E0D0B680]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent originalOccurrenceIsAllDay](self, "originalOccurrenceIsAllDay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[EKEvent originalOccurrenceIsAllDay](self, "originalOccurrenceIsAllDay");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "BOOLValue");

    }
    else
    {
      v7 = -[EKEvent occurrenceIsAllDay](self, "occurrenceIsAllDay");
    }

    -[EKObject _previousValueForKey:](self, "_previousValueForKey:", *MEMORY[0x1E0D0B3D8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "timeZoneFromTimeZoneName:withFloatingTimeZone:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v10 = v7;
    else
      v10 = 1;
    v13 = 0;
    -[EKEvent adjustedDatesForDate:persistedDateIsInUTC:withAdjustmentMode:pinMode:outClientCalendarDate:outPersistedDate:](self, "adjustedDatesForDate:persistedDateIsInUTC:withAdjustmentMode:pinMode:outClientCalendarDate:outPersistedDate:", v4, v10, 1, 1, &v13, 0);
    v11 = v13;
    objc_msgSend(v11, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSDate *)v12;
  }
}

- (BOOL)isMasterOrDetachedOccurrence
{
  return -[EKObject isNew](self, "isNew") || self->_isMainOccurrence || -[EKEvent isDetached](self, "isDetached");
}

- (EKCalendarDate)originalOccurrenceEndDate
{
  EKCalendarDate *originalOccurrenceEndDate;

  originalOccurrenceEndDate = self->_originalOccurrenceEndDate;
  if (originalOccurrenceEndDate)
    return originalOccurrenceEndDate;
  -[EKEvent occurrenceEndDate](self, "occurrenceEndDate");
  return (EKCalendarDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)occurrenceDate
{
  void *v2;
  void *v3;

  -[EKEvent occurrenceStartDate](self, "occurrenceStartDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setStatus:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B6F8]);

}

- (int64_t)locationPredictionState
{
  void *v2;
  int64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B6B8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setLocationPredictionState:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B6B8]);

}

- (BOOL)firedTTL
{
  void *v2;
  char v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B690]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setFiredTTL:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B690]);

}

- (int64_t)selfParticipantStatus
{
  void *v3;
  int v4;
  objc_super v6;

  if (-[EKObject isNew](self, "isNew"))
    return -[EKEvent participationStatus](self, "participationStatus");
  if (!-[EKObject isPropertyUnavailable:](self, "isPropertyUnavailable:", *MEMORY[0x1E0D0B358]))
  {
    -[EKCalendarItem selfAttendee](self, "selfAttendee");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPropertyUnavailable:", *MEMORY[0x1E0D0B248]);

    if (!v4)
      return -[EKEvent participationStatus](self, "participationStatus");
  }
  v6.receiver = self;
  v6.super_class = (Class)EKEvent;
  return -[EKCalendarItem selfParticipantStatus](&v6, sel_selfParticipantStatus);
}

- (BOOL)_isParticipationStatusDirty
{
  void *v2;
  char v3;

  -[EKCalendarItem selfAttendee](self, "selfAttendee");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isParticipantStatusDirty");

  return v3;
}

- (BOOL)_isOnlyChangeToAttendeesSelfAttendeeParticipationStatus
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[EKCalendarItem selfAttendee](self, "selfAttendee");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[EKObject _previousValueForKey:](self, "_previousValueForKey:", *MEMORY[0x1E0D0B358]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0D0B248], *MEMORY[0x1E0D0B240], 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      if (+[EKObject _compareAllKnownKeysExceptKeys:forObject:againstObject:compareIdentityKeys:](EKObject, "_compareAllKnownKeysExceptKeys:forObject:againstObject:compareIdentityKeys:", v5, v3, v4, 0))
      {
        -[EKObject changeSet](self, "changeSet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "hasUnsavedMultiValueRemovalForKey:", *MEMORY[0x1E0D0B278]);

        if ((v8 & 1) != 0)
        {
          v6 = 0;
        }
        else
        {
          -[EKCalendarItem attendeesRaw](self, "attendeesRaw");
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v9 = (id)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v17;
            while (2)
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v17 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
                if (v14 != v3 && (objc_msgSend(v14, "hasChanges") & 1) != 0)
                {
                  v6 = 0;
                  goto LABEL_19;
                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
              if (v11)
                continue;
              break;
            }
          }
          v6 = 1;
LABEL_19:

        }
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setParticipationStatus:(int64_t)a3
{
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (-[EKEvent allowsParticipationStatusModifications](self, "allowsParticipationStatusModifications"))
  {
    -[EKCalendarItem selfAttendee](self, "selfAttendee");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_16;
    v12 = v5;
    v6 = objc_msgSend(v5, "participantStatus") == a3;
    v5 = v12;
    if (v6)
      goto LABEL_16;
    objc_msgSend(v12, "setParticipantStatus:", a3);
    -[EKCalendarItem setModifiedProperties:](self, "setModifiedProperties:", -[EKCalendarItem modifiedProperties](self, "modifiedProperties") | 0x40);
    if (a3 == 3)
    {
      v7 = 1;
    }
    else
    {
      v8 = (void *)objc_opt_class();
      -[EKCalendarItem calendar](self, "calendar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "_eventAvailabilityForParticipantStatus:supportedEventAvailabilities:isAllDayEvent:", a3, objc_msgSend(v9, "supportedEventAvailabilities"), -[EKEvent isAllDay](self, "isAllDay"));

      if (v7 == -1
        || -[EKEvent isAllDay](self, "isAllDay")
        && -[EKEvent availability](self, "availability") != EKEventAvailabilityFree)
      {
LABEL_11:
        -[EKCalendarItem calendar](self, "calendar");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "source");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "sourceType") == 1)
        {

          v5 = v12;
          if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
          {
LABEL_16:

            return;
          }
          -[EKEvent setProposedStartDate:](self, "setProposedStartDate:", 0);
        }
        else
        {

        }
        v5 = v12;
        goto LABEL_16;
      }
    }
    -[EKEvent setAvailability:](self, "setAvailability:", v7);
    goto LABEL_11;
  }
}

- (BOOL)supportsParticipationStatusModificationsWithoutNotification
{
  void *v2;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;

  -[EKCalendarItem organizer](self, "organizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[EKCalendarItem organizer](self, "organizer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "scheduleAgent") == 1)
    {
      v5 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  -[EKEvent constraints](self, "constraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "supportsInvitationModificationsWithoutNotification") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[EKCalendarItem calendar](self, "calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "sourceType") == 0;

  }
  if (v4)
    goto LABEL_8;
LABEL_9:

  return v5;
}

- (BOOL)_userAddressesRepresentInvitedAttendee:(id)a3 checkEmailAddresses:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  id obj;
  _BOOL4 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v35 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "stringRemovingMailto");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lowercaseString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v9);
  }

  -[EKCalendarItem organizer](self, "organizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "absoluteString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringRemovingMailto");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lowercaseString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "containsObject:", v18) & 1) != 0)
  {
    v19 = 0;
  }
  else
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[EKCalendarItem attendees](self, "attendees");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v20)
    {
      v21 = v20;
      v33 = v18;
      v22 = *(_QWORD *)v37;
      while (2)
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          objc_msgSend(v24, "URL");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "absoluteString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringRemovingMailto");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "lowercaseString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28 && (objc_msgSend(v6, "containsObject:", v28) & 1) != 0)
            goto LABEL_26;
          if (v35)
          {
            objc_msgSend(v24, "emailAddress");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "stringRemovingMailto");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "lowercaseString");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (v31 && (objc_msgSend(v6, "containsObject:", v31) & 1) != 0)
            {

LABEL_26:
              v19 = 1;
              goto LABEL_27;
            }

          }
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v21)
          continue;
        break;
      }
      v19 = 0;
LABEL_27:
      v18 = v33;
    }
    else
    {
      v19 = 0;
    }

  }
  return v19;
}

- (int64_t)currentUserGeneralizedParticipantRole
{
  void *v4;

  if (!-[EKCalendarItem hasAttendees](self, "hasAttendees"))
    return 0;
  if (-[EKEvent currentUserMayActAsOrganizer](self, "currentUserMayActAsOrganizer"))
    return 2;
  -[EKCalendarItem selfAttendee](self, "selfAttendee");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 1;
  else
    return 3;
}

- (BOOL)isCurrentUserInvitedAttendee
{
  void *v3;
  BOOL v4;

  if (!-[EKCalendarItem isExternallyOrganizedInvitation](self, "isExternallyOrganizedInvitation"))
    return 0;
  -[EKCalendarItem selfAttendee](self, "selfAttendee");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)currentUserMayActAsOrganizer
{
  void *v3;
  int v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[EKCalendarItem calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsContentModifications");

  if (!v4)
    return 0;
  if (-[EKCalendarItem isSelfOrganized](self, "isSelfOrganized"))
    return 1;
  -[EKCalendarItem calendar](self, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "allowsScheduling"))
  {
    -[EKCalendarItem calendar](self, "calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "sharingStatus") == 2
      && -[EKCalendarItem isOrganizedBySharedCalendarOwner](self, "isOrganizedBySharedCalendarOwner");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)markEventAsAttendeeForward
{
  -[EKCalendarItem setModifiedProperties:](self, "setModifiedProperties:", -[EKCalendarItem modifiedProperties](self, "modifiedProperties") | 0x800);
}

+ (int64_t)_eventAvailabilityForParticipantStatus:(int64_t)a3 supportedEventAvailabilities:(unint64_t)a4 isAllDayEvent:(BOOL)a5
{
  int64_t v5;
  unint64_t v6;

  v5 = -1;
  if (a4)
    v5 = 1;
  v6 = -1;
  if (a3 == 4)
    v6 = (a4 >> 1) & 2;
  if (a3 == 2)
    v6 = 0;
  if (a5)
    v6 = v5;
  if (a4)
    return v6;
  else
    return v5;
}

- (int64_t)_parentParticipationStatus
{
  void *v2;
  void *v3;
  int64_t v4;

  -[EKCalendarItem originalItem](self, "originalItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "participationStatus");
  else
    v4 = 0;

  return v4;
}

- (EKImage)image
{
  return (EKImage *)-[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B698]);
}

- (void)setImage:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D0B698];
  v5 = a3;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, objc_opt_class());

}

- (EKColor)color
{
  return (EKColor *)-[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B650]);
}

- (void)setColor:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D0B650];
  v5 = a3;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, objc_opt_class());

}

- (id)birthdayID
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B640]);
}

- (NSInteger)birthdayPersonID
{
  void *v2;
  void *v3;
  NSInteger v4;

  -[EKEvent birthdayID](self, "birthdayID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = -1;

  return v4;
}

- (void)setBirthdayContactIdentifier:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B630]);
}

- (NSString)birthdayContactName
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B638]);
}

- (void)setBirthdayContact:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "CalDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v5, *MEMORY[0x1E0D0B638]);

  objc_msgSend(v4, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[EKEvent setBirthdayContactIdentifier:](self, "setBirthdayContactIdentifier:", v6);
}

- (BOOL)isBirthday
{
  void *v2;
  BOOL v3;

  -[EKEvent birthdayContactIdentifier](self, "birthdayContactIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)recurrenceRule
{
  void *v3;
  void *v4;

  if (-[EKCalendarItem hasRecurrenceRules](self, "hasRecurrenceRules"))
  {
    -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setRecurrenceRule:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v5, 0);
    -[EKEvent setRecurrenceRules:](self, "setRecurrenceRules:", v4);

  }
  else
  {
    -[EKEvent setRecurrenceRules:](self, "setRecurrenceRules:", 0);
  }

}

- (void)setRecurrenceRules:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEvent;
  -[EKCalendarItem setRecurrenceRules:](&v4, sel_setRecurrenceRules_, a3);
  -[EKEvent clearNextCachedReminderOccurrenceDate](self, "clearNextCachedReminderOccurrenceDate");
}

- (id)singleRecurrenceRule
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[EKEvent isDetached](self, "isDetached"))
  {
    -[EKCalendarItem originalItem](self, "originalItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "singleRecurrenceRule");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)EKEvent;
    -[EKCalendarItem singleRecurrenceRule](&v6, sel_singleRecurrenceRule);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)makeRecurrenceEndDateBased
{
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
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "recurrenceEnd");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[EKEvent _lastRecurrenceDate](self, "_lastRecurrenceDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D48], "sharedAutoupdatingCurrentCalendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");

      -[EKEvent effectiveTimeZone](self, "effectiveTimeZone");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTimeZone:", v10);

      objc_msgSend(v7, "dateByAddingDays:inCalendar:", 1, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "dateRemovingTimeComponentsInCalendar:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "dateByAddingTimeInterval:", -1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[EKRecurrenceEnd recurrenceEndWithEndDate:](EKRecurrenceEnd, "recurrenceEndWithEndDate:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRecurrenceEnd:", v13);
    v15[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setRecurrenceRules:](self, "setRecurrenceRules:", v14);

  }
}

- (id)_occurrenceDatesForCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  EKRecurrenceGenerator *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;

  -[EKEvent masterEvent](self, "masterEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent _adjustDateIfFloatingForDate:](self, "_adjustDateIfFloatingForDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(EKRecurrenceGenerator);
  -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent effectiveTimeZone](self, "effectiveTimeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = 0;
  v13 = -[EKRecurrenceGenerator copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:](v8, "copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:", self, v10, v7, v11, v12, 0, a3, v15);

  return v13;
}

- (id)_lastRecurrenceDate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "recurrenceEnd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "occurrenceCount");

  if (v6)
  {
    objc_msgSend(v4, "recurrenceEnd");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent _occurrenceDatesForCount:](self, "_occurrenceDatesForCount:", objc_msgSend(v7, "occurrenceCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "lastObject");
  }
  else
  {
    -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent _adjustDateIfFloatingForDate:](self, "_adjustDateIfFloatingForDate:", v8);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_adjustDateIfFloatingForDate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (-[EKEvent isFloating](self, "isFloating"))
  {
    -[EKEvent effectiveTimeZone](self, "effectiveTimeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateInTimeZone:fromTimeZone:", 0, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (void)makeRecurrenceEndCountBased
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  EKRecurrenceGenerator *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  -[EKEvent singleRecurrenceRule](self, "singleRecurrenceRule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_18;
  objc_msgSend(v3, "recurrenceEnd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "occurrenceCount");

  if (!v6)
  {
    objc_msgSend(v4, "recurrenceEnd");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

LABEL_7:
      -[EKEvent masterEvent](self, "masterEvent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent _adjustDateIfFloatingForDate:](self, "_adjustDateIfFloatingForDate:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEvent _adjustDateIfFloatingForDate:](self, "_adjustDateIfFloatingForDate:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "recurrenceEnd");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "endDate");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
          v18 = (void *)v16;
        else
          v18 = v14;
        v19 = v18;

        v20 = objc_alloc_init(EKRecurrenceGenerator);
        -[EKEvent effectiveTimeZone](self, "effectiveTimeZone");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v26) = 0;
        v22 = -[EKRecurrenceGenerator copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:](v20, "copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:", self, v4, v12, v19, v21, 0, 0, v26);

        v6 = objc_msgSend(v22, "count");
      }
      else
      {
        v6 = 0;
      }

      goto LABEL_14;
    }
    v9 = -[EKEvent isMainOccurrence](self, "isMainOccurrence");

    if (!v9)
      goto LABEL_7;
    v6 = 0;
  }
LABEL_14:
  if (v6 <= 1)
    v23 = 1;
  else
    v23 = v6;
  +[EKRecurrenceEnd recurrenceEndWithOccurrenceCount:](EKRecurrenceEnd, "recurrenceEndWithOccurrenceCount:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRecurrenceEnd:", v24);
  v27[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent setRecurrenceRules:](self, "setRecurrenceRules:", v25);

LABEL_18:
}

- (BOOL)canWeInferUpdateToComplexRecurrenceRule
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;

  if (-[EKCalendarItem hasComplexRecurrence](self, "hasComplexRecurrence"))
  {
    -[EKEvent singleRecurrenceRule](self, "singleRecurrenceRule");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "daysOfTheYear");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v5 = 0;
LABEL_4:

LABEL_11:
      return v5;
    }
    objc_msgSend(v3, "weeksOfTheYear");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v5 = 0;
      goto LABEL_11;
    }
    if (!objc_msgSend(v3, "frequency") || objc_msgSend(v3, "frequency") == 1)
    {
      v5 = 1;
      goto LABEL_11;
    }
    objc_msgSend(v3, "daysOfTheWeek");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "daysOfTheMonth");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPositions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "monthsOfTheYear");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "frequency") == 2)
    {
      if (objc_msgSend(v9, "count") && !objc_msgSend(v10, "count")
        || objc_msgSend(v4, "count") == 1 && objc_msgSend(v10, "count") == 1
        || objc_msgSend(v4, "count") == 7 && objc_msgSend(v10, "count") == 1)
      {
        v5 = 1;
LABEL_25:

        goto LABEL_4;
      }
    }
    else if (objc_msgSend(v3, "frequency") == 3
           && !objc_msgSend(v10, "count")
           && (unint64_t)objc_msgSend(v4, "count") <= 1)
    {
      v5 = objc_msgSend(v11, "count") != 0;
      goto LABEL_25;
    }
    v5 = 0;
    goto LABEL_25;
  }
  return 1;
}

- (BOOL)hasADateChangeAndComplexRecurrenceWeDontKnowHowToUpdate
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!-[EKEvent isStartDateDirty](self, "isStartDateDirty"))
    return 0;
  if (!-[EKCalendarItem hasComplexRecurrence](self, "hasComplexRecurrence"))
    return 0;
  -[EKEvent startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent occurrenceStartDate](self, "occurrenceStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EKEvent _occurrenceExistsOnDate:timeZone:](self, "_occurrenceExistsOnDate:timeZone:", v3, v5);

  return !v6 && -[EKEvent canWeInferUpdateToComplexRecurrenceRule](self, "canWeInferUpdateToComplexRecurrenceRule");
}

- (BOOL)hasCustomRecurrence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  -[EKEvent singleRecurrenceRule](self, "singleRecurrenceRule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "sharedAutoupdatingCurrentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem timeZone](self, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

  if (!v3)
    goto LABEL_4;
  -[EKEvent startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if ((objc_msgSend(v3, "isPinnedToEndOfFrequency") & 1) != 0)
    {
LABEL_4:
      LOBYTE(v6) = 0;
      goto LABEL_30;
    }
    -[EKEvent startDate](self, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components:fromDate:", 536, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "frequency"))
    {
      if (objc_msgSend(v3, "frequency") == 1)
      {
        if (objc_msgSend(v3, "interval") == 1)
        {
          objc_msgSend(v3, "daysOfTheWeek");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v9;
          if (v9)
          {
            if (objc_msgSend(v9, "count") == 1)
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v10, "dayOfTheWeek");
              v12 = objc_msgSend(v8, "weekday");
              goto LABEL_11;
            }
            goto LABEL_27;
          }
LABEL_29:

          goto LABEL_30;
        }
LABEL_28:
        LOBYTE(v6) = 1;
        goto LABEL_29;
      }
      if (objc_msgSend(v3, "frequency") != 2)
      {
        if (objc_msgSend(v3, "frequency") != 3)
          goto LABEL_28;
        if (objc_msgSend(v3, "interval") != 1)
          goto LABEL_28;
        objc_msgSend(v3, "daysOfTheWeek");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v17)
          goto LABEL_28;
        objc_msgSend(v3, "monthsOfTheYear");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v18;
        if (!v18)
          goto LABEL_29;
        if (objc_msgSend(v18, "count") == 1)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "integerValue");
          v12 = objc_msgSend(v8, "month");
LABEL_11:
          v13 = v12;

          if (v11 != v13)
            goto LABEL_28;
          goto LABEL_14;
        }
LABEL_27:

        goto LABEL_28;
      }
      if (objc_msgSend(v3, "interval") != 1)
        goto LABEL_28;
      objc_msgSend(v3, "daysOfTheWeek");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
        goto LABEL_28;
      objc_msgSend(v3, "daysOfTheMonth");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        if (objc_msgSend(v6, "count") == 1)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "integerValue");
          v12 = objc_msgSend(v8, "day");
          goto LABEL_11;
        }
        goto LABEL_27;
      }

    }
    else if (objc_msgSend(v3, "interval") != 1)
    {
      goto LABEL_28;
    }
LABEL_14:
    LOBYTE(v6) = 0;
    goto LABEL_29;
  }
LABEL_30:

  return (char)v6;
}

- (BOOL)futureOccurrencesCannotBeAffectedByChangingStartDateToDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "hasDuplicateMonthsOfYear") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v6, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isAfterDate:", v8) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      -[EKEvent startDate](self, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent _nsCalendar](self, "_nsCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "newStartDateIsInvalid:currentStartDate:calendar:", v4, v9, v10))
        v7 = objc_msgSend(v6, "interval") > 1;
      else
        v7 = 0;

    }
  }

  return v7;
}

- (EKEventAvailability)availability
{
  void *v3;
  EKEventAvailability v4;

  if (!-[EKEvent allowsAvailabilityModifications](self, "allowsAvailabilityModifications"))
    return -1;
  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B628]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setAvailability:(EKEventAvailability)availability
{
  _BOOL4 v5;
  id v6;

  v5 = -[EKEvent allowsAvailabilityModifications](self, "allowsAvailabilityModifications");
  if (availability != EKEventAvailabilityNotSupported && v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", availability);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v6, *MEMORY[0x1E0D0B628]);

  }
}

- (id)responseComment
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B6E8]);
}

- (void)setResponseComment:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B6E8]);
}

- (id)_defaultAlarmOffset
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = -[EKEvent isAllDay](self, "isAllDay");
  -[EKCalendarItem calendar](self, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "defaultAllDayAlarmOffset");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[EKObject eventStore](self, "eventStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "defaultAllDayAlarmOffset");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v10 = (void *)v9;

      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(v5, "defaultAlarmOffset");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[EKObject eventStore](self, "eventStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "defaultTimedAlarmOffset");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  v7 = v7;
  v10 = v7;
LABEL_8:

  return v10;
}

- (BOOL)shouldHaveDefaultAlarms
{
  void *v2;
  void *v3;
  BOOL v4;

  -[EKEvent _defaultAlarmOffset](self, "_defaultAlarmOffset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue") != 0x7FFFFFFFFFFFFFFFLL;
  else
    v4 = 0;

  return v4;
}

- (id)defaultAlarm
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[EKCalendarItem alarms](self, "alarms", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
      if ((objc_msgSend(v8, "isDefaultAlarm") & 1) != 0)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v9 = v8;

    if (v9)
      return v9;
  }
  else
  {
LABEL_9:

  }
  -[EKEvent defaultAlarms](self, "defaultAlarms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anyObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)defaultAlarms
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[EKEvent _defaultAlarmOffset](self, "_defaultAlarmOffset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && objc_msgSend(v2, "integerValue") != 0x7FFFFFFFFFFFFFFFLL
    && (+[EKAlarm alarmWithRelativeOffset:](EKAlarm, "alarmWithRelativeOffset:", (double)objc_msgSend(v3, "integerValue")), v4 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v4, "setDefaultAlarm:", 1), v4))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (NSString)virtualConferenceTextRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[EKEvent virtualConference](self, "virtualConference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v2, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@\n\n"), v5);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v2, "joinMethods");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "title");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "title");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v13);

        }
        objc_msgSend(v11, "URL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "absoluteString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n\n"), v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  objc_msgSend(v2, "conferenceDetails");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v2, "conferenceDetails");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v17);

  }
  return (NSString *)v3;
}

- (id)_originallyCommittedVirtualConference
{
  void *v2;
  void *v3;
  void *v4;

  -[EKEvent committedValueForKey:](self, "committedValueForKey:", *MEMORY[0x1E0D0B328]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[EKConferencePersistence deserializeConference:](EKConferencePersistence, "deserializeConference:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "conference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setVirtualConference:(id)a3
{
  id v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKEvent virtualConference](self, "virtualConference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (!objc_msgSend(v5, "isWritable"))
      goto LABEL_21;
    if (v4)
    {
      if (!objc_msgSend(v4, "isWritable"))
      {
LABEL_11:
        -[EKEvent _originallyCommittedVirtualConference](self, "_originallyCommittedVirtualConference");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqual:", v6) & 1) == 0)
        {
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          objc_msgSend(v6, "joinMethods", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v21;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v21 != v17)
                  objc_enumerationMutation(v14);
                objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "URL");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                +[EKConferenceUtils invalidateConferenceURL:](EKConferenceUtils, "invalidateConferenceURL:", v19);

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            }
            while (v16);
          }

        }
        goto LABEL_21;
      }
      +[EKConferencePersistence serializeConference:](EKConferencePersistence, "serializeConference:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent displayNotes](self, "displayNotes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent _buildConferenceStringFromNotesWithoutConference:serializedConference:](self, "_buildConferenceStringFromNotesWithoutConference:serializedConference:", v8, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent setNotes:](self, "setNotes:", v9);

    }
    else
    {
      -[EKEvent displayNotes](self, "displayNotes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent setNotes:](self, "setNotes:", v7);
    }

    goto LABEL_11;
  }
  if (v4 && objc_msgSend(v4, "isWritable"))
  {
    +[EKConferencePersistence serializeConference:](EKConferencePersistence, "serializeConference:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem notes](self, "notes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent _buildConferenceStringFromNotesWithoutConference:serializedConference:](self, "_buildConferenceStringFromNotesWithoutConference:serializedConference:", v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setNotes:](self, "setNotes:", v12);

  }
LABEL_21:

}

- (void)invalidateVirtualConferenceURLIfNeededOnCommit:(id)a3
{
  id v4;
  NSMutableArray *virtualConferenceURLsToInvalidateOnCommit;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    virtualConferenceURLsToInvalidateOnCommit = self->_virtualConferenceURLsToInvalidateOnCommit;
    v8 = v4;
    if (!virtualConferenceURLsToInvalidateOnCommit)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_virtualConferenceURLsToInvalidateOnCommit;
      self->_virtualConferenceURLsToInvalidateOnCommit = v6;

      virtualConferenceURLsToInvalidateOnCommit = self->_virtualConferenceURLsToInvalidateOnCommit;
    }
    -[NSMutableArray addObject:](virtualConferenceURLsToInvalidateOnCommit, "addObject:", v8);
    v4 = v8;
  }

}

- (void)clearVirtualConferenceURLsQueuedForInvalidation
{
  NSMutableArray *virtualConferenceURLsToInvalidateOnCommit;

  virtualConferenceURLsToInvalidateOnCommit = self->_virtualConferenceURLsToInvalidateOnCommit;
  self->_virtualConferenceURLsToInvalidateOnCommit = 0;

}

- (void)invalidateRemovedVirtualConferences
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_virtualConferenceURLsToInvalidateOnCommit;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[EKObject eventStore](self, "eventStore", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[EKConferenceUtils invalidateConferenceURLIfNeeded:inEventStore:](EKConferenceUtils, "invalidateConferenceURLIfNeeded:inEventStore:", v8, v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)_buildConferenceStringFromNotesWithoutConference:(id)a3 serializedConference:(id)a4
{
  id v5;
  const __CFString *v6;
  void *v7;

  v5 = a4;
  if (a3)
    v6 = (const __CFString *)a3;
  else
    v6 = &stru_1E4789A58;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length")
    && objc_msgSend(v5, "length")
    && (objc_msgSend(v7, "hasSuffix:", CFSTR("\n\n")) & 1) == 0)
  {
    objc_msgSend(v7, "appendString:", CFSTR("\n\n"));
  }
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v7, "appendString:", v5);

  return v7;
}

- (void)setSpecialDayType:(int64_t)a3
{
  int64_t *v3;

  if (a3)
  {
    if (a3 == 3)
    {
      v3 = (int64_t *)MEMORY[0x1E0DDB950];
    }
    else
    {
      if (a3 != 1)
        return;
      v3 = (int64_t *)MEMORY[0x1E0DDB958];
    }
    a3 = *v3;
  }
  -[EKEvent setSpecialDayString:](self, "setSpecialDayString:", a3);
}

- (id)specialDayString
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B6F0]);
}

- (void)setSpecialDayString:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B6F0]);
}

- (void)removeServerRefreshRelatedProperties
{
  -[EKCalendarItem setExternalModificationTag:](self, "setExternalModificationTag:", 0);
  -[EKCalendarItem setExternalID:](self, "setExternalID:", 0);
}

- (unint64_t)flags
{
  void *v2;
  unint64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B2E8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setFlags:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B2E8]);

}

- (BOOL)flag:(unint64_t)a3
{
  return (-[EKEvent flags](self, "flags") & a3) != 0;
}

- (void)setFlag:(unint64_t)a3 value:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  unint64_t v8;

  v4 = a4;
  v7 = -[EKEvent flags](self, "flags");
  if (v4)
    v8 = v7 | a3;
  else
    v8 = v7 & ~a3;
  -[EKEvent setFlags:](self, "setFlags:", v8);
}

- (void)setInvitationStatus:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B6A8]);

}

- (void)clearInvitationStatus
{
  id v2;

  -[EKObject persistentObject](self, "persistentObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unloadPropertyForKey:", *MEMORY[0x1E0D0B6A8]);

}

- (NSSet)actions
{
  return (NSSet *)-[EKObject meltedAndCachedMultiRelationObjectsForKey:](self, "meltedAndCachedMultiRelationObjectsForKey:", *MEMORY[0x1E0D0B620]);
}

- (void)setActions:(id)a3
{
  -[EKObject updateMeltedAndCachedMultiRelationObjects:forKey:](self, "updateMeltedAndCachedMultiRelationObjects:forKey:", a3, *MEMORY[0x1E0D0B620]);
}

- (void)addEventAction:(id)a3
{
  -[EKObject addCachedMeltedObject:forMultiValueKey:](self, "addCachedMeltedObject:forMultiValueKey:", a3, *MEMORY[0x1E0D0B620]);
}

- (void)removeEventAction:(id)a3
{
  -[EKObject removeCachedMeltedObject:forMultiValueKey:](self, "removeCachedMeltedObject:forMultiValueKey:", a3, *MEMORY[0x1E0D0B620]);
}

- (BOOL)isAlerted
{
  return -[EKEvent invitationStatus](self, "invitationStatus") != 3
      && -[EKEvent invitationStatus](self, "invitationStatus") != 0;
}

- (void)setIsAlerted:(BOOL)a3
{
  if (a3)
    -[EKEvent _setInvitationStatusAlertedIfNecessary](self, "_setInvitationStatusAlertedIfNecessary");
  else
    -[EKEvent _setInvitationStatusUnalertedIfNecessary](self, "_setInvitationStatusUnalertedIfNecessary");
}

- (void)_setInvitationStatusAlertedIfNecessary
{
  if (-[EKEvent invitationStatus](self, "invitationStatus") == 3)
    -[EKEvent setInvitationStatus:](self, "setInvitationStatus:", 2);
}

- (void)_setInvitationStatusUnalertedIfNecessary
{
  unsigned int v3;
  _BOOL4 v4;
  uint64_t v6;

  v3 = -[EKEvent invitationChangedProperties](self, "invitationChangedProperties");
  v4 = -[EKEvent _shouldAlertInviteeDeclines](self, "_shouldAlertInviteeDeclines");
  if (v3 != 32 || v4)
    v6 = 3;
  else
    v6 = 2;
  -[EKEvent setInvitationStatus:](self, "setInvitationStatus:", v6);
}

- (BOOL)_shouldAlertInviteeDeclines
{
  return CalAlertInviteeDeclines() != 0;
}

- (int)externalTrackingStatus
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B688]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setExternalTrackingStatus:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B688]);

}

- (id)_travelTimeInternalDescription
{
  double v2;
  double v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  -[EKEvent travelTime](self, "travelTime");
  if (v2 <= 0.0)
  {
    v8 = 0;
  }
  else
  {
    v3 = v2;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v5, v3);
    objc_msgSend(v4, "components:fromDate:toDate:options:", 96, v5, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "hour"))
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%ld hours, %ld minutes"), objc_msgSend(v7, "hour"), objc_msgSend(v7, "minute"));
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%ld minutes"), objc_msgSend(v7, "minute"), v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)setTravelTime:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(a3, 0.0));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B710]);

}

- (void)setProposedStartDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[EKCalendarItem selfAttendee](self, "selfAttendee");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        v7 = -[EKCalendarItem isExternallyOrganizedInvitation](self, "isExternallyOrganizedInvitation"),
        v6,
        v7))
  {
    -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B6D8]);
    -[EKCalendarItem selfAttendee](self, "selfAttendee");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProposedStartDate:forEvent:", v4, self);

    if (v4)
      -[EKEvent setInvitationStatus:](self, "setInvitationStatus:", 0);
  }
  else
  {
    v9 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEvent setProposedStartDate:].cold.1(v9);
  }

}

- (NSDate)proposedEndDate
{
  void *v3;
  void *v4;

  -[EKEvent proposedStartDate](self, "proposedStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent duration](self, "duration");
  objc_msgSend(v3, "dateByAddingTimeInterval:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (BOOL)allowsAttendeesModifications
{
  char v3;
  void *v4;
  char v5;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;

  if (-[EKEvent status](self, "status") == EKEventStatusCanceled)
    return 0;
  -[EKObject eventStore](self, "eventStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "skipModificationValidation");

  if ((v5 & 1) != 0 || (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessHasSyncClientEntitlement") & 1) != 0)
    return 1;
  if (-[EKEvent currentUserMayActAsOrganizer](self, "currentUserMayActAsOrganizer"))
  {
    v7 = 0;
  }
  else if (-[EKCalendarItem isExternallyOrganizedInvitation](self, "isExternallyOrganizedInvitation"))
  {
    v7 = !-[EKEvent canForward](self, "canForward");
  }
  else
  {
    v7 = 1;
  }
  -[EKEvent constraints](self, "constraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsOutgoingInvitations");

  v3 = 0;
  if ((v7 & 1) == 0 && v9)
  {
    -[EKCalendarItem calendar](self, "calendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "allowsScheduling"))
    {
      -[EKCalendarItem calendar](self, "calendar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "allowsContentModifications");

      if (!v12)
        return 0;
      -[EKEvent constraints](self, "constraints");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "requiresOutgoingInvitationsInDefaultCalendar"))
      {
        v13 = -[EKCalendarItem hasAttendees](self, "hasAttendees");

        if (v13)
          return 1;
        -[EKCalendarItem calendar](self, "calendar");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v10, "isDefaultSchedulingCalendar");
      }
      else
      {
        v3 = 1;
      }
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (BOOL)allowsTravelTimeModifications
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[EKCalendarItem calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "allowsContentModifications"))
  {
    -[EKEvent constraints](self, "constraints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "supportsTravelTime"))
      v5 = !-[EKEvent isAllDay](self, "isAllDay");
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)allowsPrivacyLevelModifications
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  uint64_t v10;

  -[EKCalendarItem calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent constraints](self, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "supportsPrivateEvents"))
    goto LABEL_9;
  -[EKObject eventStore](self, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "skipModificationValidation") & 1) == 0)
  {
    v6 = objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessHasSyncClientEntitlement");

    if ((v6 & 1) != 0)
      goto LABEL_5;
    objc_msgSend(v3, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isDelegate");

    v10 = objc_msgSend(v3, "sharingStatus");
    if (v10 == 2 || !v9)
    {
      if (v10 == 2)
        goto LABEL_9;
    }
    else if ((objc_msgSend(v4, "allowsPrivateEventAccessByDelegate") & 1) == 0)
    {
LABEL_9:
      LOBYTE(v7) = 0;
      goto LABEL_10;
    }
    if (objc_msgSend(v4, "prohibitsPrivateEventsWithAttendees"))
    {
      v7 = !-[EKCalendarItem hasAttendees](self, "hasAttendees");
      goto LABEL_10;
    }
    goto LABEL_5;
  }

LABEL_5:
  LOBYTE(v7) = 1;
LABEL_10:

  return v7;
}

- (BOOL)allowsAllDayModifications
{
  BOOL v3;
  void *v4;

  if (-[EKEvent isEditable](self, "isEditable"))
  {
    if (!-[EKCalendarItem hasRecurrenceRules](self, "hasRecurrenceRules"))
      return 1;
    if (!-[EKEvent isDetached](self, "isDetached"))
    {
      -[EKCalendarItem detachedItems](self, "detachedItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v4, "count") == 0;

      return v3;
    }
  }
  return 0;
}

- (void)setPrivacyLevel:(int64_t)a3
{
  id v5;

  if (-[EKEvent allowsPrivacyLevelModifications](self, "allowsPrivacyLevelModifications"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v5, *MEMORY[0x1E0D0B6D0]);

  }
}

- (void)setPrivacyLevelWithoutVerifyingPrivacyModificationsAllowed:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B6D0]);

}

- (BOOL)locationIsAConferenceRoom
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[EKEvent locationWithoutPrediction](self, "locationWithoutPrediction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length") && -[EKCalendarItem hasAttendees](self, "hasAttendees"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[EKCalendarItem attendees](self, "attendees", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v9, "participantType") == 2)
          {
            objc_msgSend(v9, "name");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "isEqualToString:", v4);

            if ((v11 & 1) != 0)
            {
              LOBYTE(v6) = 1;
              goto LABEL_17;
            }
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_17:

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)setInvitationChangedProperties:(unsigned int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B6A0]);

}

- (void)_setInvitationChangedProperty:(BOOL)a3 forFlag:(unsigned int)a4
{
  _BOOL4 v5;
  unsigned int v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v7 = -[EKEvent invitationChangedProperties](self, "invitationChangedProperties");
  if (v5)
    v8 = v7 | a4;
  else
    v8 = v7 & ~a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v9, *MEMORY[0x1E0D0B6A0]);

}

- (BOOL)attendeeComment
{
  return -[EKEvent _invitationChangedPropertyForFlag:](self, "_invitationChangedPropertyForFlag:", 16);
}

- (BOOL)attendeeStatus
{
  return -[EKEvent _invitationChangedPropertyForFlag:](self, "_invitationChangedPropertyForFlag:", 32);
}

- (BOOL)attendeeProposedStartDate
{
  return -[EKEvent _invitationChangedPropertyForFlag:](self, "_invitationChangedPropertyForFlag:", 64);
}

- (BOOL)attendeeDeclinedStartDate
{
  return -[EKEvent _invitationChangedPropertyForFlag:](self, "_invitationChangedPropertyForFlag:", 128);
}

- (void)setDateChanged:(BOOL)a3
{
  -[EKEvent _setInvitationChangedProperty:forFlag:](self, "_setInvitationChangedProperty:forFlag:", a3, 1);
}

- (void)setTimeChanged:(BOOL)a3
{
  -[EKEvent _setInvitationChangedProperty:forFlag:](self, "_setInvitationChangedProperty:forFlag:", a3, 2);
}

- (void)setTitleChanged:(BOOL)a3
{
  -[EKEvent _setInvitationChangedProperty:forFlag:](self, "_setInvitationChangedProperty:forFlag:", a3, 4);
}

- (void)setLocationChanged:(BOOL)a3
{
  -[EKEvent _setInvitationChangedProperty:forFlag:](self, "_setInvitationChangedProperty:forFlag:", a3, 8);
}

- (void)setVideoConferenceChanged:(BOOL)a3
{
  -[EKEvent _setInvitationChangedProperty:forFlag:](self, "_setInvitationChangedProperty:forFlag:", a3, 256);
}

- (void)setRecurrenceChanged:(BOOL)a3
{
  -[EKEvent _setInvitationChangedProperty:forFlag:](self, "_setInvitationChangedProperty:forFlag:", a3, 512);
}

- (void)setAttendeeComment:(BOOL)a3
{
  -[EKEvent _setInvitationChangedProperty:forFlag:](self, "_setInvitationChangedProperty:forFlag:", a3, 16);
}

- (void)setAttendeeStatus:(BOOL)a3
{
  -[EKEvent _setInvitationChangedProperty:forFlag:](self, "_setInvitationChangedProperty:forFlag:", a3, 32);
}

- (void)setAttendeeProposedStartDate:(BOOL)a3
{
  -[EKEvent _setInvitationChangedProperty:forFlag:](self, "_setInvitationChangedProperty:forFlag:", a3, 64);
}

- (void)setAttendeeDeclinedStartDate:(BOOL)a3
{
  -[EKEvent _setInvitationChangedProperty:forFlag:](self, "_setInvitationChangedProperty:forFlag:", a3, 128);
}

- (BOOL)canForward
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B648]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "BOOLValue"))
  {
    -[EKEvent constraints](self, "constraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportsEventForwarding");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)serverSupportedProposeNewTime
{
  void *v3;
  char v4;
  void *v5;

  -[EKEvent constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "allowsProposeNewTime") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[EKEvent constraints](self, "constraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "supportsResponseComments");

  }
  return v4;
}

- (BOOL)disallowProposeNewTime
{
  void *v2;
  char v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B678]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)allowsProposedTimeModifications
{
  void *v3;
  int v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;

  if (-[EKEvent disallowProposeNewTime](self, "disallowProposeNewTime"))
    goto LABEL_13;
  if (-[EKEvent isAllDay](self, "isAllDay"))
    goto LABEL_13;
  if (-[EKEvent status](self, "status") == EKEventStatusCanceled)
    goto LABEL_13;
  -[EKCalendarItem calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsContentModifications");

  if (!v4)
    goto LABEL_13;
  v5 = -[EKCalendarItem isExternallyOrganizedInvitation](self, "isExternallyOrganizedInvitation");
  if (v5)
  {
    -[EKCalendarItem selfAttendee](self, "selfAttendee");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (!-[EKCalendarItem isOrganizedBySharedCalendarOwner](self, "isOrganizedBySharedCalendarOwner"))
      {
        -[EKCalendarItem calendar](self, "calendar");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "allowsScheduling");

        if (v8)
        {
          if (-[EKEvent serverSupportedProposeNewTime](self, "serverSupportedProposeNewTime"))
            goto LABEL_12;
          -[EKCalendarItem organizer](self, "organizer");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "emailAddress");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            -[EKCalendarItem calendar](self, "calendar");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "source");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "hasOwnerEmailAddress");

            if (v13)
            {
LABEL_12:
              LOBYTE(v5) = 1;
              return v5;
            }
          }
        }
      }
    }
LABEL_13:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)supportsAddingAttachments
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  if (-[EKCalendarItem isExternallyOrganizedInvitation](self, "isExternallyOrganizedInvitation"))
    return 0;
  -[EKCalendarItem calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsContentModifications");

  if (!v4)
    return 0;
  -[EKEvent constraints](self, "constraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsAttachments");

  return v6;
}

- (void)setNotes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[EKCalendarItem notes](self, "notes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v4))
  {

  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", &stru_1E4789A58) & 1) != 0)
    {
      -[EKCalendarItem notes](self, "notes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_8;
    }
    else
    {

    }
    v7.receiver = self;
    v7.super_class = (Class)EKEvent;
    -[EKCalendarItem setNotes:](&v7, sel_setNotes_, v4);
    -[EKEvent setNotesCommon:](self, "setNotesCommon:", v4);
  }
LABEL_8:

}

- (id)displayNotes
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v11;
  id v12;

  v11 = 0;
  v12 = 0;
  -[EKEvent parsedConference:andNotes:](self, "parsedConference:andNotes:", &v12, &v11);
  v3 = v12;
  v4 = v11;
  if (!v3)
  {
    -[EKCalendarItem notes](self, "notes");
    v8 = objc_claimAutoreleasedReturnValue();
    v7 = v4;
    goto LABEL_5;
  }
  v5 = objc_msgSend(v3, "range");
  objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v5, v6, &stru_1E4789A58);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "hasSuffix:", CFSTR("\n\n")))
  {
    objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 2);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:

    v7 = (void *)v8;
  }
  objc_msgSend(v7, "CDVStringByXMLUnquoting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setDisplayNotes:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v4 = a3;
  v11 = 0;
  v12 = 0;
  -[EKEvent parsedConference:andNotes:](self, "parsedConference:andNotes:", &v12, &v11);
  v5 = v12;
  v6 = v11;
  v7 = v4;
  if (v5)
  {
    v8 = objc_msgSend(v5, "range");
    objc_msgSend(v6, "substringWithRange:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent _buildConferenceStringFromNotesWithoutConference:serializedConference:](self, "_buildConferenceStringFromNotesWithoutConference:serializedConference:", v4, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[EKEvent setNotes:](self, "setNotes:", v7);

}

- (void)setURL:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEvent;
  v4 = a3;
  -[EKCalendarItem setURL:](&v5, sel_setURL_, v4);
  -[EKEvent setURLCommon:](self, "setURLCommon:", v4, v5.receiver, v5.super_class);

}

- (id)URL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)EKEvent;
  -[EKCalendarItem URL](&v11, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else if (-[EKEvent isBirthday](self, "isBirthday"))
  {
    v6 = (void *)MEMORY[0x1E0C99E98];
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[EKEvent birthdayContactIdentifier](self, "birthdayContactIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("addressbook://%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v9);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setStructuredLocation:(EKStructuredLocation *)structuredLocation
{
  EKStructuredLocation *v4;

  v4 = structuredLocation;
  -[EKEvent setPredictedLocationFrozen:](self, "setPredictedLocationFrozen:", 0);
  -[EKEvent _clearLocationPredictionCacheIfNotFrozen](self, "_clearLocationPredictionCacheIfNotFrozen");
  -[EKCalendarItem setStructuredLocationWithoutPrediction:](self, "setStructuredLocationWithoutPrediction:", v4);

  -[EKEvent clearDetectedConferenceURL](self, "clearDetectedConferenceURL");
}

- (void)setStructuredLocation:(id)a3 preserveConferenceRooms:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
  {
    v7 = (void *)MEMORY[0x1E0C99DE8];
    -[EKEvent _conferenceRoomDisplayStrings](self, "_conferenceRoomDisplayStrings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v6, "title", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("; "));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v23 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
              if ((objc_msgSend(v9, "containsObject:", v17) & 1) == 0)
                objc_msgSend(v9, "addObject:", v17);
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          }
          while (v14);
        }

      }
    }
    -[EKEvent setStructuredLocation:](self, "setStructuredLocation:", v6);
    objc_msgSend((id)objc_opt_class(), "_locationStringForLocations:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent structuredLocation](self, "structuredLocation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[EKEvent structuredLocation](self, "structuredLocation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTitle:", v18);
    }
    else
    {
      +[EKStructuredLocation locationWithTitle:](EKStructuredLocation, "locationWithTitle:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent setStructuredLocation:](self, "setStructuredLocation:", v20);
    }

  }
  else
  {
    -[EKEvent roomAttendees](self, "roomAttendees");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent removeConferenceRooms:](self, "removeConferenceRooms:", v21);

    -[EKEvent setStructuredLocation:](self, "setStructuredLocation:", v6);
  }

}

- (id)roomAttendees
{
  void *v2;
  void *v3;
  void *v4;

  -[EKCalendarItem attendees](self, "attendees");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_122);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __24__EKEvent_roomAttendees__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocationRoom");
}

- (void)addConferenceRooms:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[EKCalendarItem addAttendee:](self, "addAttendee:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  -[EKEvent structuredLocation](self, "structuredLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent setStructuredLocation:preserveConferenceRooms:](self, "setStructuredLocation:preserveConferenceRooms:", v9, 1);

}

- (void)removeConferenceRooms:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKEvent roomAttendees](self, "roomAttendees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectsInArray:", v4);
  if (objc_msgSend(v6, "count"))
  {
    v23 = 0;
  }
  else
  {
    -[EKEvent locations](self, "locations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    v23 = v8 == objc_msgSend(v5, "count");

  }
  v9 = (void *)MEMORY[0x1E0C99DE8];
  -[EKEvent structuredLocation](self, "structuredLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("; "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v19, "displayString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v13, "removeObject:", v20);
        -[EKCalendarItem removeAttendee:](self, "removeAttendee:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v16);
  }

  if (v23)
  {
    -[EKEvent setStructuredLocation:](self, "setStructuredLocation:", 0);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_locationStringForLocations:", v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent structuredLocation](self, "structuredLocation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTitle:", v21);

  }
}

- (id)_conferenceRoomDisplayStrings
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[EKEvent roomAttendees](self, "roomAttendees", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "displayString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_updatePredictedLocationCacheIfNeededHoldingLock
{
  EKStructuredLocation *cachedLocationPrediction;
  NSDate *cachedLocationPredictionExpirationDate;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  NSDate *v14;
  NSDate *v15;
  id v17;

  if (-[EKEvent _needsPredictedLocationCacheUpdateHoldingLock](self, "_needsPredictedLocationCacheUpdateHoldingLock"))
  {
    cachedLocationPrediction = self->_cachedLocationPrediction;
    self->_cachedLocationPrediction = 0;

    cachedLocationPredictionExpirationDate = self->_cachedLocationPredictionExpirationDate;
    self->_cachedLocationPredictionExpirationDate = 0;

    v5 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      -[EKEvent _updatePredictedLocationCacheIfNeededHoldingLock].cold.4(v5);
    v17 = 0;
    +[EKEvent _updatedPredictedLocationRespectingTimeoutBudgetForEvent:error:](EKEvent, "_updatedPredictedLocationRespectingTimeoutBudgetForEvent:error:", self, &v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    v8 = (void *)EKLogHandle;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        -[EKEvent _updatePredictedLocationCacheIfNeededHoldingLock].cold.3(v8, self);
      v9 = (void *)objc_opt_new();
      v10 = v9;
      v11 = 120.0;
      goto LABEL_16;
    }
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    {
      -[EKEvent _updatePredictedLocationCacheIfNeededHoldingLock].cold.2((uint64_t)v6, v8, self);
      if (v6)
        goto LABEL_10;
    }
    else if (v6)
    {
LABEL_10:
      -[EKEvent _firstNonConferenceRoomLocationTitle](self, "_firstNonConferenceRoomLocationTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(v6, "address");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "setTitle:", v12);
      v13 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
        -[EKEvent _updatePredictedLocationCacheIfNeededHoldingLock].cold.1((uint64_t)v12, v13, self);

    }
    objc_storeStrong((id *)&self->_cachedLocationPrediction, v6);
    v9 = (void *)objc_opt_new();
    v10 = v9;
    v11 = 300.0;
LABEL_16:
    objc_msgSend(v9, "dateByAddingTimeInterval:", v11);
    v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v15 = self->_cachedLocationPredictionExpirationDate;
    self->_cachedLocationPredictionExpirationDate = v14;

  }
  return self->_cachedLocationPrediction;
}

+ (id)_updatedPredictedLocationRespectingTimeoutBudgetForEvent:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  double v7;
  double v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  mach_timebase_info v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v7 = *(double *)&remainingTimeout;
  if (v6)
    v8 = *(double *)&remainingTimeout;
  else
    v8 = 0.1;
  v9 = EKLogHandle;
  v10 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG);
  if (v6 && v7 <= 0.0)
  {
    if (v10)
      +[EKEvent _updatedPredictedLocationRespectingTimeoutBudgetForEvent:error:].cold.1();
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("Prediction not attempted due to past timeouts");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D0C140], 0, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    v13 = 0;
    goto LABEL_22;
  }
  if (v10)
  {
    +[EKEvent _updatedPredictedLocationRespectingTimeoutBudgetForEvent:error:].cold.3(v6, v9, v11, v8);
    if (v6)
      goto LABEL_13;
  }
  else if (v6)
  {
LABEL_13:
    v14 = mach_absolute_time();
    goto LABEL_16;
  }
  v14 = 0;
LABEL_16:
  +[EKStructuredLocationPrediction locationPredictionForEvent:error:timeout:](EKStructuredLocationPrediction, "locationPredictionForEvent:error:timeout:", v5, a4, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v15 = mach_absolute_time();
    v22 = 0;
    mach_timebase_info(&v22);
    v16 = (v15 - v14) * v22.numer / v22.denom;
    if (*(double *)&remainingTimeout == 0.1)
      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_127);
    v17 = (double)v16 / 1000000000.0;
    v18 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      +[EKEvent _updatedPredictedLocationRespectingTimeoutBudgetForEvent:error:].cold.2(v18, v17, v19, v20);
    *(double *)&remainingTimeout = *(double *)&remainingTimeout - v17;
  }
LABEL_22:

  return v13;
}

void __74__EKEvent__updatedPredictedLocationRespectingTimeoutBudgetForEvent_error___block_invoke()
{
  remainingTimeout = 0x3FB999999999999ALL;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    __74__EKEvent__updatedPredictedLocationRespectingTimeoutBudgetForEvent_error___block_invoke_cold_1();
}

- (id)_firstNonConferenceRoomLocationTitle
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v18;
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[EKEvent locationsWithoutPrediction](self, "locationsWithoutPrediction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKCalendarItem hasAttendees](self, "hasAttendees"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = v3;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v4)
    {
      v5 = v4;
      v20 = *(_QWORD *)v26;
      v18 = v3;
      while (1)
      {
        v6 = 0;
LABEL_5:
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v6);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        -[EKCalendarItem attendees](self, "attendees");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (!v9)
          break;
        v10 = v9;
        v11 = *(_QWORD *)v22;
LABEL_9:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
          if (objc_msgSend(v13, "participantType") == 2)
          {
            objc_msgSend(v13, "name");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", v7);

            if (v15)
              break;
          }
          if (v10 == ++v12)
          {
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v10)
              goto LABEL_9;
            goto LABEL_21;
          }
        }

        if (++v6 != v5)
          goto LABEL_5;
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        v16 = 0;
        v3 = v18;
        if (!v5)
          goto LABEL_23;
      }
LABEL_21:

      v16 = v7;
      v3 = v18;
    }
    else
    {
      v16 = 0;
    }
LABEL_23:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_clearLocationPredictionCacheIfNotFrozenHoldingLock
{
  EKStructuredLocation *cachedLocationPrediction;
  NSDate *cachedLocationPredictionExpirationDate;

  if (!self->_locationPredictionFrozen)
  {
    cachedLocationPrediction = self->_cachedLocationPrediction;
    self->_cachedLocationPrediction = 0;

    cachedLocationPredictionExpirationDate = self->_cachedLocationPredictionExpirationDate;
    self->_cachedLocationPredictionExpirationDate = 0;

  }
}

- (void)_clearLocationPredictionCacheIfNotFrozen
{
  os_unfair_lock_s *p_locationPredictionLock;

  p_locationPredictionLock = &self->_locationPredictionLock;
  os_unfair_lock_lock(&self->_locationPredictionLock);
  -[EKEvent _clearLocationPredictionCacheIfNotFrozenHoldingLock](self, "_clearLocationPredictionCacheIfNotFrozenHoldingLock");
  os_unfair_lock_unlock(p_locationPredictionLock);
}

- (void)confirmPredictedLocation:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v4 = a3;
  -[EKEvent setPredictedLocationFrozen:](self, "setPredictedLocationFrozen:", 0);
  if (!v4)
  {
    -[EKEvent structuredLocation](self, "structuredLocation");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "duplicate");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPredictedLOI:", 0);
  if (-[EKEvent isEditable](self, "isEditable")
    && (-[EKEvent constraints](self, "constraints"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "supportsStructuredLocations"),
        v5,
        v6))
  {
    -[EKEvent setStructuredLocation:](self, "setStructuredLocation:", v8);
  }
  else
  {
    -[EKEvent locationWithoutPrediction](self, "locationWithoutPrediction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDerivedFrom:", v7);

    -[EKCalendarItem setClientLocation:](self, "setClientLocation:", v8);
  }
  -[EKEvent setLocationPredictionState:](self, "setLocationPredictionState:", 2);

}

- (void)rejectPredictedLocation
{
  void *v3;

  -[EKEvent setPredictedLocationFrozen:](self, "setPredictedLocationFrozen:", 0);
  -[EKEvent preferredLocationWithoutPrediction](self, "preferredLocationWithoutPrediction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent setStructuredLocation:](self, "setStructuredLocation:", v3);

  -[EKEvent setLocationPredictionState:](self, "setLocationPredictionState:", 3);
}

- (BOOL)hasPredictedLocation
{
  void *v2;
  char v3;

  -[EKCalendarItem preferredLocation](self, "preferredLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPrediction");

  return v3;
}

- (void)setPredictedLocationFrozen:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_locationPredictionLock;
  id v6;

  v3 = a3;
  p_locationPredictionLock = &self->_locationPredictionLock;
  os_unfair_lock_lock(&self->_locationPredictionLock);
  if (self->_locationPredictionFrozen != v3)
  {
    if (v3
      && +[EKStructuredLocationPrediction shouldDoLocationPredictionForEvent:](EKStructuredLocationPrediction, "shouldDoLocationPredictionForEvent:", self))
    {
      v6 = -[EKEvent _updatePredictedLocationCacheIfNeededHoldingLock](self, "_updatePredictedLocationCacheIfNeededHoldingLock");
    }
    self->_locationPredictionFrozen = v3;
    -[EKEvent _clearLocationPredictionCacheIfNotFrozenHoldingLock](self, "_clearLocationPredictionCacheIfNotFrozenHoldingLock");
  }
  os_unfair_lock_unlock(p_locationPredictionLock);
}

- (id)conferenceURLString
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B660]);
}

- (void)setConferenceURLString:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B660]);
}

- (NSURL)conferenceURL
{
  void *v2;
  void *v3;

  -[EKEvent conferenceURLString](self, "conferenceURLString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (void)setConferenceURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEvent setConferenceURLString:](self, "setConferenceURLString:", v4);

}

- (void)setCalendar:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)EKEvent;
    -[EKCalendarItem setCalendar:](&v12, sel_setCalendar_, 0);
    goto LABEL_11;
  }
  -[EKCalendarItem calendar](self, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_msgSend(v5, "source"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[EKCalendarItem calendar](self, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "source");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10) ^ 1;

    if (v7)
      goto LABEL_9;
  }
  else
  {
    v11 = 0;
  }

LABEL_9:
  v12.receiver = self;
  v12.super_class = (Class)EKEvent;
  -[EKCalendarItem setCalendar:](&v12, sel_setCalendar_, v5);
  if (v11)
    -[EKEvent updateDefaultAlarms](self, "updateDefaultAlarms");
LABEL_11:
  -[EKEvent clearIntegrationType](self, "clearIntegrationType");

}

- (void)setEndLocation:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D0B2B8];
  v5 = a3;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, +[EKStructuredLocation frozenClass](EKStructuredLocation, "frozenClass"));

}

- (EKStructuredLocation)endLocation
{
  return (EKStructuredLocation *)-[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B2B8]);
}

- (void)setParticipationStatusModifiedDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B6C8]);
}

- (BOOL)completed
{
  return -[EKEvent flag:](self, "flag:", 1);
}

- (void)setCompleted:(BOOL)a3
{
  -[EKEvent setFlag:value:](self, "setFlag:value:", 1, a3);
}

- (BOOL)isTentative
{
  int64_t v3;
  int64_t v4;
  EKEventStatus v5;
  char v6;
  void *v7;
  void *v8;

  v3 = -[EKEvent participationStatus](self, "participationStatus");
  if (v3 == 2)
    return 0;
  v4 = v3;
  if (!-[EKCalendarItem isExternallyOrganizedInvitation](self, "isExternallyOrganizedInvitation"))
    return 0;
  v5 = -[EKEvent status](self, "status");
  v6 = v5 != EKEventStatusCanceled;
  if (v4 == 4 && v5 != EKEventStatusCanceled)
  {
    -[EKEvent constraints](self, "constraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v6 = objc_msgSend(v7, "statusesAreAccurate");
    else
      v6 = 1;

  }
  return v6;
}

- (NSComparisonResult)compareStartDateWithEvent:(EKEvent *)other
{
  EKEvent *v4;
  void *v5;
  void *v6;
  NSComparisonResult v7;

  v4 = other;
  -[EKEvent occurrenceStartDate](self, "occurrenceStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent occurrenceStartDate](v4, "occurrenceStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (int64_t)compareOriginalStartDateWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  if (-[EKEvent isDetached](self, "isDetached"))
    -[EKEvent originalStartDate](self, "originalStartDate");
  else
    -[EKEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isDetached") & 1) != 0)
    objc_msgSend(v4, "originalStartDate");
  else
    objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

- (BOOL)isEditable
{
  void *v3;
  char v4;
  unsigned __int8 v6;
  objc_super v7;

  -[EKObject eventStore](self, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "skipModificationValidation") & 1) != 0)
  {

    return 1;
  }
  v4 = objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessHasSyncClientEntitlement");

  if ((v4 & 1) != 0)
    return 1;
  v7.receiver = self;
  v7.super_class = (Class)EKEvent;
  v6 = -[EKCalendarItem isEditable](&v7, sel_isEditable);
  return v6 & ~-[EKEvent isPrivateEventSharedToMe](self, "isPrivateEventSharedToMe");
}

- (BOOL)isPrivateEventSharedToMe
{
  int64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v3 = -[EKEvent privacyLevel](self, "privacyLevel");
  -[EKCalendarItem calendar](self, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDelegate");

  -[EKCalendarItem calendar](self, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sharingStatus");

  if (v8 == 2)
    v9 = 1;
  else
    v9 = v6;
  return v3 && v9;
}

- (BOOL)allowsRecurrenceModificationsForSpan:(int64_t)a3
{
  char v5;
  void *v6;
  void *v7;

  v5 = -[EKEvent isEditable](self, "isEditable");
  if (-[EKEvent isDetached](self, "isDetached"))
  {
    if (a3 != 1 && a3 != 4)
    {
      -[EKCalendarItem calendar](self, "calendar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[EKEvent constraints](self, "constraints");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v7, "supportsRecurrencesOnDetachedEvents");

      }
    }
  }
  return v5;
}

- (BOOL)allowsCalendarModifications
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEvent;
  v3 = -[EKCalendarItem allowsCalendarModifications](&v5, sel_allowsCalendarModifications);
  if (v3)
  {
    if (-[EKObject isNew](self, "isNew"))
      LOBYTE(v3) = 1;
    else
      LOBYTE(v3) = !-[EKCalendarItem isExternallyOrganizedInvitation](self, "isExternallyOrganizedInvitation");
  }
  return v3;
}

- (BOOL)responseMustApplyToAll
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  EKEvent *v7;
  EKEvent *v8;
  BOOL v9;
  void *v10;

  if (!-[EKEvent isOrWasPartOfRecurringSeries](self, "isOrWasPartOfRecurringSeries"))
    return 0;
  -[EKEvent constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mustAcknowledgeMasterEvent");

  if (!v4)
    return 0;
  -[EKCalendarItem originalItem](self, "originalItem");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (EKEvent *)v5;
  else
    v7 = self;
  v8 = v7;

  if (-[EKEvent participationStatus](v8, "participationStatus") == 1)
  {
    v9 = 1;
  }
  else
  {
    -[EKCalendarItem externalID](v8, "externalID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10 == 0;

  }
  return v9;
}

- (BOOL)_changesRequireDetachOrSlice
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[EKObject changeSet](self, "changeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changedKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", *MEMORY[0x1E0D0B280]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent constraints](self, "constraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "requiresSamePrivacyLevelAcrossRecurrenceSeries");

  if (v8)
    objc_msgSend(v6, "addObject:", *MEMORY[0x1E0D0B6D0]);
  -[EKEvent constraints](self, "constraints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "prohibitsDetachmentOnCommentChange"))
  {
    v10 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0D0B6D8]);

    if ((v10 & 1) == 0)
      objc_msgSend(v6, "addObject:", *MEMORY[0x1E0D0B6E8]);
    if (!v5)
      goto LABEL_17;
  }
  else
  {

    if (!v5)
      goto LABEL_17;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v12)
  {
    v16 = 1;
    goto LABEL_21;
  }
  v13 = v12;
  v14 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v19 != v14)
        objc_enumerationMutation(v11);
      v5 -= objc_msgSend(v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v13);

  if (v5)
    goto LABEL_18;
LABEL_17:
  if (!-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B350]))
  {
    objc_msgSend(v6, "allObjects");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v16 = -[EKObject hasUnsavedChangesIgnoreKeys:](self, "hasUnsavedChangesIgnoreKeys:", v11);
LABEL_21:

    goto LABEL_22;
  }
LABEL_18:
  v16 = 1;
LABEL_22:

  return v16;
}

- (BOOL)requiresDetach
{
  return !-[EKObject isNew](self, "isNew")
      && -[EKCalendarItem _hadRecurrenceRules](self, "_hadRecurrenceRules")
      && -[EKEvent _changesRequireDetachOrSlice](self, "_changesRequireDetachOrSlice");
}

- (BOOL)canDetachSingleOccurrence
{
  void *v3;
  char v4;

  if (-[EKEvent isDetached](self, "isDetached"))
  {
    -[EKEvent singleRecurrenceRule](self, "singleRecurrenceRule");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasChanges");

    if ((v4 & 1) != 0)
      return 0;
  }
  if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B350])
    || -[EKEvent isAllDayDirty](self, "isAllDayDirty"))
  {
    return 0;
  }
  else
  {
    return !-[EKEvent hasAttachmentChanges](self, "hasAttachmentChanges");
  }
}

- (BOOL)hasAttachmentChanges
{
  return -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B270]);
}

- (BOOL)changingAllDayPropertyIsAllowed
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[EKEvent isDetached](self, "isDetached"))
    return 0;
  if (!-[EKCalendarItem hasRecurrenceRules](self, "hasRecurrenceRules") || -[EKObject isNew](self, "isNew"))
    return 1;
  -[EKCalendarItem calendar](self, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "sourceType") != 1;

  return v3;
}

+ (id)_basicChangesRequiringSpanAll
{
  if (_basicChangesRequiringSpanAll_onceToken != -1)
    dispatch_once(&_basicChangesRequiringSpanAll_onceToken, &__block_literal_global_137);
  return (id)_basicChangesRequiringSpanAll_basicChangesRequiringSpanAll;
}

void __40__EKEvent__basicChangesRequiringSpanAll__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B270];
  v3[0] = CFSTR("privacyLevelString");
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E0D0B280];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_basicChangesRequiringSpanAll_basicChangesRequiringSpanAll;
  _basicChangesRequiringSpanAll_basicChangesRequiringSpanAll = v1;

}

- (BOOL)hasChangesRequiringSpanAll
{
  return -[EKObject isSaved](self, "isSaved")
      && -[EKEvent _hasBasicChangesRequiringSpanAll](self, "_hasBasicChangesRequiringSpanAll")
      || -[EKEvent _hasRecurrenceRuleChangeRequiringSpanAll](self, "_hasRecurrenceRuleChangeRequiringSpanAll");
}

- (BOOL)_hasOrHadRecurrenceRule
{
  return -[EKCalendarItem hasRecurrenceRules](self, "hasRecurrenceRules")
      || -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B350]);
}

- (BOOL)_hasBasicChangesRequiringSpanAll
{
  void *v3;
  BOOL v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "_basicChangesRequiringSpanAll");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKEvent _hasOrHadRecurrenceRule](self, "_hasOrHadRecurrenceRule"))
  {
    v4 = -[EKObject hasUnsavedChangesInKeys:](self, "hasUnsavedChangesInKeys:", v3);
  }
  else
  {
    -[EKCalendarItem originalItem](self, "originalItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "_hasOrHadRecurrenceRule"))
      v4 = -[EKObject hasUnsavedChangesInKeys:](self, "hasUnsavedChangesInKeys:", v3);
    else
      v4 = 0;

  }
  return v4;
}

- (BOOL)_hasRecurrenceRuleChangeRequiringSpanAll
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  EKRecurrenceRule *v12;
  void *v13;
  EKRecurrenceRule *v14;

  -[EKObject _previousValueForKey:](self, "_previousValueForKey:", *MEMORY[0x1E0D0B350]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = -[EKCalendarItem hasRecurrenceRules](self, "hasRecurrenceRules");
  if (!v5 || v4)
  {
    if (!v5)
    {
      LOBYTE(v6) = v4 != 0;
      goto LABEL_13;
    }
    -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") == 1)
    {
      v8 = objc_msgSend(v3, "count");

      if (v8 == 1)
      {
LABEL_12:
        -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = [EKRecurrenceRule alloc];
        objc_msgSend(v3, "anyObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[EKObject initWithPersistentObject:](v12, "initWithPersistentObject:", v13);

        v6 = objc_msgSend(v11, "isEqualToRecurrenceRule:", v14) ^ 1;
        goto LABEL_13;
      }
    }
    else
    {

    }
    v9 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEvent _hasRecurrenceRuleChangeRequiringSpanAll].cold.1(v9, self);
    goto LABEL_12;
  }
  LOBYTE(v6) = 0;
LABEL_13:

  return v6;
}

- (BOOL)automaticLocationGeocodingAllowed
{
  void *v2;
  char v3;

  -[EKCalendarItem calendar](self, "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "automaticEventLocationGeocodingAllowed");

  return v3;
}

- (BOOL)eligibleForTravelAdvisories
{
  return -[EKEvent _eligibleForTravelAdvisoriesIncludePotential:](self, "_eligibleForTravelAdvisoriesIncludePotential:", 0);
}

- (BOOL)potentiallyEligibleForTravelAdvisories
{
  return -[EKEvent _eligibleForTravelAdvisoriesIncludePotential:](self, "_eligibleForTravelAdvisoriesIncludePotential:", 1);
}

- (BOOL)_eligibleForTravelAdvisoriesIncludePotential:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v3 = a3;
  if (-[EKEvent isAllDay](self, "isAllDay")
    || -[EKEvent selfParticipantStatus](self, "selfParticipantStatus") == 3
    || -[EKEvent status](self, "status") == EKEventStatusCanceled
    || -[EKEvent locationIsAConferenceRoom](self, "locationIsAConferenceRoom"))
  {
    return 0;
  }
  -[EKCalendarItem preferredLocation](self, "preferredLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hasKnownSpatialData") & 1) != 0
    || v3 && -[EKEvent automaticLocationGeocodingAllowed](self, "automaticLocationGeocodingAllowed"))
  {
    if (objc_msgSend(v7, "isPrediction")
      && (objc_msgSend(v7, "predictedLOI"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "type"),
          v8,
          v9 <= 1))
    {
      -[EKEvent conferenceURLForDisplay](self, "conferenceURLForDisplay");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v5 = 0;
      }
      else
      {
        -[EKEvent virtualConference](self, "virtualConference");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v11 == 0;

      }
    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)travelAdvisoryBehavior
{
  void *v2;
  void *v3;
  int64_t v4;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B708]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (void)setTravelAdvisoryBehavior:(int64_t)a3
{
  id v5;

  if (-[EKEvent eligibleForTravelAdvisories](self, "eligibleForTravelAdvisories"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v5, *MEMORY[0x1E0D0B708]);

  }
}

- (BOOL)travelAdvisoryBehaviorIsEffectivelyEnabled
{
  int64_t v2;
  void *v3;
  char v4;

  v2 = -[EKEvent travelAdvisoryBehavior](self, "travelAdvisoryBehavior");
  if (v2 == 2)
    return 0;
  if (v2)
    return 1;
  objc_msgSend(MEMORY[0x1E0D0BB10], "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "get_enableTravelAdvisoriesForAutomaticBehavior");

  return v4;
}

- (void)setJunkStatus:(unint64_t)a3
{
  id v5;

  -[EKEvent setCachedJunkStatus:](self, "setCachedJunkStatus:");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v5, *MEMORY[0x1E0D0B6B0]);

}

- (NSString)sendersEmail
{
  void *v2;
  void *v3;

  -[EKCalendarItem organizer](self, "organizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sendersPhoneNumber
{
  void *v2;
  void *v3;

  -[EKCalendarItem organizer](self, "organizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "phoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)_relatedCachedTimeKeys
{
  if (_relatedCachedTimeKeys_onceToken != -1)
    dispatch_once(&_relatedCachedTimeKeys_onceToken, &__block_literal_global_156);
  return (id)_relatedCachedTimeKeys_relatedKeys;
}

void __33__EKEvent__relatedCachedTimeKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("cachedStartOfDayForStartDate");
  v2[1] = CFSTR("cachedStartOfDayForEndDate");
  v2[2] = CFSTR("cachedDaysSpanned");
  v2[3] = CFSTR("cachedIsMultiDayTimedEvent");
  v2[4] = CFSTR("nextReminderOccurrenceDateKey");
  v2[5] = CFSTR("isFirstOccurrenceIncludingSlices");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_relatedCachedTimeKeys_relatedKeys;
  _relatedCachedTimeKeys_relatedKeys = v0;

}

- (void)clearCachedTimeValues
{
  id v3;

  objc_msgSend((id)objc_opt_class(), "_relatedCachedTimeKeys");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject clearCachedValuesForKeys:](self, "clearCachedValuesForKeys:", v3);

}

- (id)startOfDayForStartDateInCalendar:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  EKEvent *v11;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_relatedCachedTimeKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__EKEvent_startOfDayForStartDateInCalendar___block_invoke;
  v9[3] = &unk_1E4786E78;
  v10 = v4;
  v11 = self;
  v6 = v4;
  -[EKObject cachedValueForKey:expectingCachedValue:forMasterKey:relatedKeys:populateBlock:](self, "cachedValueForKey:expectingCachedValue:forMasterKey:relatedKeys:populateBlock:", CFSTR("cachedStartOfDayForStartDate"), v6, CFSTR("cachedTimeValuesCalendar"), v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __44__EKEvent_startOfDayForStartDateInCalendar___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startOfDayForDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)startOfDayForEndDateInCalendar:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_relatedCachedTimeKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__EKEvent_startOfDayForEndDateInCalendar___block_invoke;
  v9[3] = &unk_1E4786E78;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  -[EKObject cachedValueForKey:expectingCachedValue:forMasterKey:relatedKeys:populateBlock:](self, "cachedValueForKey:expectingCachedValue:forMasterKey:relatedKeys:populateBlock:", CFSTR("cachedStartOfDayForEndDate"), v6, CFSTR("cachedTimeValuesCalendar"), v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __42__EKEvent_startOfDayForEndDateInCalendar___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "startOfDayForStartDateInCalendar:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingDays:inCalendar:", objc_msgSend(*(id *)(a1 + 32), "daysSpannedInCalendar:", *(_QWORD *)(a1 + 40)) - 1, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)daysSpannedInCalendar:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  int64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  EKEvent *v14;
  id v15;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_relatedCachedTimeKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __33__EKEvent_daysSpannedInCalendar___block_invoke;
  v13 = &unk_1E4786E78;
  v14 = self;
  v15 = v4;
  v6 = v4;
  -[EKObject cachedValueForKey:expectingCachedValue:forMasterKey:relatedKeys:populateBlock:](self, "cachedValueForKey:expectingCachedValue:forMasterKey:relatedKeys:populateBlock:", CFSTR("cachedDaysSpanned"), v6, CFSTR("cachedTimeValuesCalendar"), v5, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "integerValue", v10, v11, v12, v13, v14);
  return v8;
}

uint64_t __33__EKEvent_daysSpannedInCalendar___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endDateUnadjustedForLegacyClients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "daysSpannedFromStartDate:toEndDate:allDay:inCalendar:", v3, v4, objc_msgSend(*(id *)(a1 + 32), "isAllDay"), *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
}

- (BOOL)isMultiDayTimedEventInCalendar:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t);
  void *v15;
  EKEvent *v16;
  id v17;

  v4 = a3;
  -[EKEvent startDate](self, "startDate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    objc_msgSend((id)objc_opt_class(), "_relatedCachedTimeKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __42__EKEvent_isMultiDayTimedEventInCalendar___block_invoke;
    v15 = &unk_1E4786E78;
    v16 = self;
    v17 = v4;
    -[EKObject cachedValueForKey:expectingCachedValue:forMasterKey:relatedKeys:populateBlock:](self, "cachedValueForKey:expectingCachedValue:forMasterKey:relatedKeys:populateBlock:", CFSTR("cachedIsMultiDayTimedEvent"), v17, CFSTR("cachedTimeValuesCalendar"), v8, &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "BOOLValue", v12, v13, v14, v15, v16);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __42__EKEvent_isMultiDayTimedEventInCalendar___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endDateUnadjustedForLegacyClients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isMultiDayTimedEventWithStartDate:endDate:allDay:inCalendar:", v4, v5, objc_msgSend(*(id *)(a1 + 32), "isAllDay"), *(_QWORD *)(a1 + 40)));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)isMultiDayTimedEventWithStartDate:(id)a3 endDate:(id)a4 allDay:(BOOL)a5 inCalendar:(id)a6
{
  id v9;
  id v10;
  id v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = 0;
  if (v9 && v10 && !a5)
  {
    if ((objc_msgSend(v9, "isSameDayAsDate:inCalendar:", v10, v11) & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v11, "startOfDayForDate:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dateByAddingDays:inCalendar:", 1, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dateOnlyComponentsInCalendar:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setHour:", 5);
      objc_msgSend(v11, "dateFromComponents:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isAfterDate:", v16);

    }
  }

  return v12;
}

- (void)_clearOriginalDateFields
{
  -[EKEvent setOriginalOccurrenceStartDate:](self, "setOriginalOccurrenceStartDate:", 0);
  -[EKEvent setOriginalOccurrenceEndDate:](self, "setOriginalOccurrenceEndDate:", 0);
  -[EKEvent setOriginalOccurrenceIsAllDay:](self, "setOriginalOccurrenceIsAllDay:", 0);
}

- (id)snapshotCopyWithPropertyKeysToCopy:(id)a3 propertyKeysToSkip:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EKEvent;
  -[EKObject snapshotCopyWithPropertyKeysToCopy:propertyKeysToSkip:](&v9, sel_snapshotCopyWithPropertyKeysToCopy_propertyKeysToSkip_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOccurrenceIsAllDay:", -[EKEvent occurrenceIsAllDay](self, "occurrenceIsAllDay"));
  -[EKEvent occurrenceStartDate](self, "occurrenceStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOccurrenceStartDate:", v6);

  -[EKEvent occurrenceEndDate](self, "occurrenceEndDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOccurrenceEndDate:", v7);

  return v5;
}

- (id)previouslySavedCopy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EKEvent;
  -[EKObject previouslySavedCopy](&v9, sel_previouslySavedCopy);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent originalOccurrenceIsAllDay](self, "originalOccurrenceIsAllDay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[EKEvent originalOccurrenceIsAllDay](self, "originalOccurrenceIsAllDay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOccurrenceIsAllDay:", objc_msgSend(v5, "BOOLValue"));

  }
  else
  {
    objc_msgSend(v3, "setOccurrenceIsAllDay:", -[EKEvent occurrenceIsAllDay](self, "occurrenceIsAllDay"));
  }
  -[EKEvent originalOccurrenceStartDate](self, "originalOccurrenceStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOccurrenceStartDate:", v6);

  -[EKEvent originalOccurrenceEndDate](self, "originalOccurrenceEndDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOccurrenceEndDate:", v7);

  return v3;
}

- (void)_resetInternalStateWithForce:(BOOL)a3
{
  _BOOL8 v3;
  NSNumber *v5;
  NSNumber *originalOccurrenceIsAllDay;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  -[EKEvent clearCachedTimeValues](self, "clearCachedTimeValues");
  if (v3 || -[EKEvent isAllDayDirty](self, "isAllDayDirty"))
  {
    self->_occurrenceIsAllDay = -[EKEvent _isAllDay](self, "_isAllDay");
    -[EKEvent committedValueForKey:](self, "committedValueForKey:", *MEMORY[0x1E0D0B308]);
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    originalOccurrenceIsAllDay = self->_originalOccurrenceIsAllDay;
    self->_originalOccurrenceIsAllDay = v5;

    if (v3)
    {
      -[EKEvent startDateRaw](self, "startDateRaw");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent _updateStartDateForDate:withAdjustmentMode:adjustEndDate:](self, "_updateStartDateForDate:withAdjustmentMode:adjustEndDate:", v7, 1, 0);

LABEL_8:
      -[EKEvent endDateRaw](self, "endDateRaw");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent _updateEndDateForDate:withAdjustmentMode:adjustStartDate:](self, "_updateEndDateForDate:withAdjustmentMode:adjustStartDate:", v9, 1, v3 ^ 1);

      goto LABEL_9;
    }
  }
  if (-[EKEvent isStartDateDirty](self, "isStartDateDirty"))
  {
    -[EKEvent startDateRaw](self, "startDateRaw");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent _updateStartDateForDate:withAdjustmentMode:adjustEndDate:](self, "_updateStartDateForDate:withAdjustmentMode:adjustEndDate:", v8, 1, v3 ^ 1);

  }
  if (-[EKEvent isEndDateDirty](self, "isEndDateDirty"))
    goto LABEL_8;
LABEL_9:
  v10.receiver = self;
  v10.super_class = (Class)EKEvent;
  -[EKObject _resetInternalStateWithForce:](&v10, sel__resetInternalStateWithForce_, v3);
  -[EKEvent _invalidateRecurrenceIdentifier](self, "_invalidateRecurrenceIdentifier");
}

- (int64_t)pendingParticipationStatus
{
  void *v2;
  int64_t v3;

  -[EKCalendarItem selfAttendee](self, "selfAttendee");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pendingStatus");

  return v3;
}

- (BOOL)allowsAvailabilityModifications
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  if (-[EKEvent status](self, "status") == EKEventStatusCanceled)
    return 0;
  -[EKCalendarItem calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportedEventAvailabilities");

  if (!v4)
    return 0;
  if (!-[EKEvent privacyLevel](self, "privacyLevel"))
    return 1;
  -[EKCalendarItem calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sharingStatus") != 2;

  return v6;
}

- (BOOL)allowsAlarmModifications
{
  objc_super v4;

  if (-[EKEvent status](self, "status") == EKEventStatusCanceled)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)EKEvent;
  return -[EKCalendarItem allowsAlarmModifications](&v4, sel_allowsAlarmModifications);
}

- (BOOL)_hasExternalIDOrDeliverySource
{
  void *v3;
  void *v4;
  void *v5;

  -[EKCalendarItem externalID](self, "externalID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  -[EKCalendarItem originalItem](self, "originalItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 || -[EKEvent hasValidEventAction](self, "hasValidEventAction");
}

- (BOOL)hasValidEventAction
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[EKEvent actions](self, "actions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v6, "externalID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          objc_msgSend(v6, "externalFolderID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {

            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)allowsParticipationStatusModifications
{
  BOOL v3;
  EKEventStatus v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (-[EKObject isNew](self, "isNew"))
    return 0;
  v5 = -[EKEvent status](self, "status");
  v6 = -[EKCalendarItem isExternallyOrganizedInvitation](self, "isExternallyOrganizedInvitation");
  -[EKCalendarItem selfAttendee](self, "selfAttendee");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = 0;
  if (v5 != EKEventStatusCanceled && v6 && v7)
  {
    if (-[EKCalendarItem isOrganizedBySharedCalendarOwner](self, "isOrganizedBySharedCalendarOwner"))
      return 0;
    -[EKEvent constraints](self, "constraints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem calendar](self, "calendar");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v3 = 0;
    if (v8 && v9)
    {
      -[EKCalendarItem organizer](self, "organizer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v3 = (objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend(v11, "scheduleAgent") != 1
        && objc_msgSend(v10, "allowsContentModifications")
        && (!objc_msgSend(v8, "proposedStatusRequiredForResponse") || v5 == EKEventStatusConfirmed)
        && objc_msgSend(v8, "supportsInvitationModifications")
        && objc_msgSend(v10, "allowsScheduling")
        && (!objc_msgSend(v8, "deliverySourceOrExternalIDRequiredForResponse")
         || -[EKEvent _hasExternalIDOrDeliverySource](self, "_hasExternalIDOrDeliverySource"))
        && (-[EKEvent participationStatus](self, "participationStatus") != 3
         || !objc_msgSend(v8, "declinedStatusChangeRequiresNoPendingStatus")
         || !-[EKEvent pendingParticipationStatus](self, "pendingParticipationStatus"));

    }
  }
  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)EKEvent;
  -[EKCalendarItem description](&v18, sel_description);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKCalendarItem hasRecurrenceRules](self, "hasRecurrenceRules"))
  {
    -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndex:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  v14 = objc_opt_class();
  -[EKCalendarItem location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent structuredLocation](self, "structuredLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKEvent isAllDay](self, "isAllDay");
  v9 = -[EKEvent isFloating](self, "isFloating");
  -[EKEvent _travelTimeInternalDescription](self, "_travelTimeInternalDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem travelStartLocation](self, "travelStartLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ <%p>\n{\n\t %@; \n\t location = \t%@; \n\t structuredLocation = \t%@; \n\t startDate = \t%@; \n\t endDate = \t\t%@; \n\t allDay = \t\t%u; \n\t floating = \t%u; \n\t recurrence = \t%@; \n\t travelTime = \t%@; \n\t startLocation = \t%@;\n};"),
    v14,
    self,
    v17,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v16,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)privacyDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKObject objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rowID");
  -[EKCalendarItem UUID](self, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ rowid=[%d] UUID=[%@] start-date=[%@]>"), v4, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)refresh
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEvent;
  return -[EKObject refresh](&v3, sel_refresh);
}

- (BOOL)refreshAndNotify:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  uint64_t v6;
  EKCalendarDate *v7;
  EKCalendarDate *v8;
  BOOL occurrenceIsAllDay;
  NSNumber *v10;
  NSNumber *originalOccurrenceIsAllDay;
  objc_super v13;

  v3 = a3;
  if (-[EKObject isNew](self, "isNew"))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v6 = -[EKEvent clearModifiedFlags](self, "clearModifiedFlags");
    if (self->_originalOccurrenceStartDate || self->_originalOccurrenceEndDate || self->_originalOccurrenceIsAllDay)
    {
      v7 = self->_occurrenceStartDate;
      v8 = self->_occurrenceEndDate;
      occurrenceIsAllDay = self->_occurrenceIsAllDay;
    }
    else
    {
      v7 = 0;
      v8 = 0;
      occurrenceIsAllDay = 0;
    }
    v13.receiver = self;
    v13.super_class = (Class)EKEvent;
    if (-[EKObject refreshAndNotify:](&v13, sel_refreshAndNotify_, v3))
    {
      -[EKEvent setClearModifiedFlags:](self, "setClearModifiedFlags:", v6);
      if (v7)
      {
        objc_storeStrong((id *)&self->_originalOccurrenceStartDate, self->_occurrenceStartDate);
        objc_storeStrong((id *)&self->_occurrenceStartDate, v7);
        objc_storeStrong((id *)&self->_originalOccurrenceEndDate, self->_occurrenceEndDate);
        objc_storeStrong((id *)&self->_occurrenceEndDate, v8);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_occurrenceIsAllDay);
        v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        originalOccurrenceIsAllDay = self->_originalOccurrenceIsAllDay;
        self->_originalOccurrenceIsAllDay = v10;

        self->_occurrenceIsAllDay = occurrenceIsAllDay;
      }
      v5 = -[EKEvent validateOccurrenceDateStillMatchesRecurrenceRules](self, "validateOccurrenceDateStillMatchesRecurrenceRules");
      if (v5 && v3)
      {
        -[EKEvent postModifiedNotification](self, "postModifiedNotification");
        LOBYTE(v5) = 1;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  return v5;
}

- (BOOL)validateOccurrenceDateStillMatchesRecurrenceRules
{
  EKRecurrenceGenerator *v3;
  void *v4;
  _BOOL4 v5;
  BOOL result;

  result = 1;
  if (-[EKCalendarItem _hadRecurrenceRules](self, "_hadRecurrenceRules"))
  {
    v3 = objc_alloc_init(EKRecurrenceGenerator);
    -[EKEvent originalOccurrenceStartDate](self, "originalOccurrenceStartDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[EKRecurrenceGenerator isOccurrenceDate:validForEvent:](v3, "isOccurrenceDate:validForEvent:", v4, self);

    if (!v5)
      return 0;
  }
  return result;
}

- (void)snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4
{
  -[EKEvent _snoozeAlarm:withTimeIntervalFromNow:orTargetDate:pinsTriggerToStartDate:](self, "_snoozeAlarm:withTimeIntervalFromNow:orTargetDate:pinsTriggerToStartDate:", a3, 0, 1, a4);
}

- (void)snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4 pinsTriggerToStartDate:(BOOL)a5
{
  -[EKEvent _snoozeAlarm:withTimeIntervalFromNow:orTargetDate:pinsTriggerToStartDate:](self, "_snoozeAlarm:withTimeIntervalFromNow:orTargetDate:pinsTriggerToStartDate:", a3, 0, a5, a4);
}

- (void)snoozeAlarm:(id)a3 untilTargetDate:(id)a4
{
  -[EKEvent _snoozeAlarm:withTimeIntervalFromNow:orTargetDate:pinsTriggerToStartDate:](self, "_snoozeAlarm:withTimeIntervalFromNow:orTargetDate:pinsTriggerToStartDate:", a3, a4, 1, 0.0);
}

- (void)snoozeAlarm:(id)a3 untilTargetDate:(id)a4 pinsTriggerToStartDate:(BOOL)a5
{
  -[EKEvent _snoozeAlarm:withTimeIntervalFromNow:orTargetDate:pinsTriggerToStartDate:](self, "_snoozeAlarm:withTimeIntervalFromNow:orTargetDate:pinsTriggerToStartDate:", a3, a4, a5, 0.0);
}

- (void)_snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4 orTargetDate:(id)a5 pinsTriggerToStartDate:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  int v20;
  int v21;
  void *v22;
  double v23;
  void *v24;
  int v25;
  void *v26;
  id v27;

  v6 = a6;
  v27 = a3;
  v10 = a5;
  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent constraints](self, "constraints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "snoozeAlarmRequiresDetach");

    if (v13)
    {
      v14 = v27;
      -[EKEvent setRequiresDetachDueToSnoozedAlarm:](self, "setRequiresDetachDueToSnoozedAlarm:", 1);
    }
    else
    {
      objc_msgSend(v27, "duplicate");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setAcknowledgedDate:", v11);
    }
    objc_msgSend(v14, "setDefaultAlarm:", 0);
    if (!v10)
    {
      objc_msgSend(v11, "dateByAddingTimeInterval:", a4);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[EKEvent startDate](self, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v11, "isAfterDate:", v15);

    -[EKEvent startDate](self, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v17);
    v19 = v18;

    v20 = !v6;
    if (v19 <= 0.0)
      v20 = 1;
    v21 = (v20 | v16) ^ 1;
    if (v19 > 0.0 && (v21 & 1) == 0)
    {
      -[EKEvent constraints](self, "constraints");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v22, "supportsAlarmsTriggeringAfterStartDate") ^ 1;

    }
    v23 = 0.0;
    if (!v21)
      v23 = v19;
    objc_msgSend(v14, "setRelativeOffset:", v23);
    -[EKEvent constraints](self, "constraints");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "snoozeAlarmRequiresDetach");

    if (v25)
    {
      -[EKCalendarItem setModifiedProperties:](self, "setModifiedProperties:", -[EKCalendarItem modifiedProperties](self, "modifiedProperties") | 0x80);
    }
    else
    {
      -[EKCalendarItem findOriginalAlarmStartingWith:](self, "findOriginalAlarmStartingWith:", v27);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setOriginalAlarm:", v26);
      -[EKCalendarItem addAlarm:](self, "addAlarm:", v14);

    }
  }

}

- (id)propertiesThatCanBeModifiedOnReadOnlyCalendars
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEvent;
  -[EKCalendarItem propertiesThatCanBeModifiedOnReadOnlyCalendars](&v5, sel_propertiesThatCanBeModifiedOnReadOnlyCalendars);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", *MEMORY[0x1E0D0B290]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)validate:(id *)a3
{
  return -[EKEvent validateWithSpan:error:](self, "validateWithSpan:error:", 0, a3);
}

- (BOOL)validateWithSpan:(int64_t)a3 error:(id *)a4
{
  _BOOL4 v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t i;
  void *v56;
  int v57;
  uint64_t v59;
  id obj;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  objc_super v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v69.receiver = self;
  v69.super_class = (Class)EKEvent;
  v7 = -[EKCalendarItem validate:](&v69, sel_validate_, a4);
  if (v7)
  {
    -[EKCalendarItem calendar](self, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "allowEvents");

    if ((v9 & 1) == 0)
    {
      if (a4)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = 22;
        goto LABEL_18;
      }
LABEL_102:
      LOBYTE(v7) = 0;
      return v7;
    }
    -[EKEvent startDate](self, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      if (a4)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = 2;
        goto LABEL_18;
      }
      goto LABEL_102;
    }
    -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      if (a4)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = 3;
        goto LABEL_18;
      }
      goto LABEL_102;
    }
    -[EKEvent startDate](self, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "compare:", v13);

    if (v14 >= 1)
    {
      if (a4)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = 4;
LABEL_18:
        objc_msgSend(v15, "errorWithEKErrorCode:", v16);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        LOBYTE(v7) = 0;
        *a4 = v18;
        return v7;
      }
      goto LABEL_102;
    }
    v17 = -[EKEvent _isParticipationStatusDirty](self, "_isParticipationStatusDirty");
    if (a3 == 1 && v17)
    {
      if (a4)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = 13;
        goto LABEL_18;
      }
      goto LABEL_102;
    }
    v19 = *MEMORY[0x1E0D0B350];
    if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B350]))
    {
      if (-[EKCalendarItem hasRecurrenceRules](self, "hasRecurrenceRules"))
      {
        -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21 && !-[EKEvent validateRecurrenceRule:error:](self, "validateRecurrenceRule:error:", v21, a4))
        {

          goto LABEL_102;
        }
      }
      else
      {
        v21 = 0;
      }

    }
    v7 = -[EKEvent _validateDatesAndRecurrencesGivenSpan:error:](self, "_validateDatesAndRecurrencesGivenSpan:error:", a3, a4);
    if (!v7)
      return v7;
    -[EKObject eventStore](self, "eventStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "skipModificationValidation") & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessHasSyncClientEntitlement") & 1) != 0)
    {

    }
    else
    {
      if (-[EKObject isNew](self, "isNew"))
      {
        v28 = -[EKCalendarItem hasAttendees](self, "hasAttendees");

        if (!v28)
          goto LABEL_30;
      }
      else
      {

      }
      v29 = *MEMORY[0x1E0D0B278];
      if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B278])
        && !-[EKEvent allowsAttendeesModifications](self, "allowsAttendeesModifications"))
      {
        if (!-[EKEvent _isOnlyChangeToAttendeesSelfAttendeeParticipationStatus](self, "_isOnlyChangeToAttendeesSelfAttendeeParticipationStatus"))
        {
          v59 = v19;
          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          -[EKCalendarItem attendees](self, "attendees");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
          if (v50)
          {
            v51 = v50;
            v52 = *(_QWORD *)v66;
            v53 = *MEMORY[0x1E0D0B218];
            v54 = 1;
            do
            {
              for (i = 0; i != v51; ++i)
              {
                if (*(_QWORD *)v66 != v52)
                  objc_enumerationMutation(obj);
                objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "changeSet");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = objc_msgSend(v56, "hasUnsavedChangeForKey:", v53);

                v54 &= v57 ^ 1;
              }
              v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
            }
            while (v51);
          }
          else
          {
            v54 = 1;
          }

          if (a4 && v54)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 41);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          v19 = v59;
          if ((v54 & 1) != 0)
            goto LABEL_102;
        }
      }
      else if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", v29)
             && -[EKCalendarItem isExternallyOrganizedInvitation](self, "isExternallyOrganizedInvitation"))
      {
        -[EKEvent committedValueForKey:](self, "committedValueForKey:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "valueForKey:", *MEMORY[0x1E0D0B820]);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v31, "allObjects");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "arrayWithArray:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v35 = v31;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v62;
          do
          {
            for (j = 0; j != v37; ++j)
            {
              if (*(_QWORD *)v62 != v38)
                objc_enumerationMutation(v35);
              objc_msgSend(v34, "removeObject:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j));
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
          }
          while (v37);
        }

        v40 = objc_msgSend(v34, "count");
        v41 = v40;
        if (a4 && v40)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 41);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_102;
        }

        if (v41)
          goto LABEL_102;
      }
      else if (-[EKCalendarItem hasAttendees](self, "hasAttendees"))
      {
        -[EKCalendarItem calendar](self, "calendar");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "allowsScheduling");

        if ((v43 & 1) == 0)
        {
          if (a4)
          {
            v15 = (void *)MEMORY[0x1E0CB35C8];
            v16 = 0;
            goto LABEL_18;
          }
          goto LABEL_102;
        }
      }
    }
LABEL_30:
    if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B268])
      && !-[EKEvent allowsAlarmModifications](self, "allowsAlarmModifications"))
    {
      if (a4)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = 40;
        goto LABEL_18;
      }
      goto LABEL_102;
    }
    if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", v19)
      && !-[EKEvent allowsRecurrenceModificationsForSpan:](self, "allowsRecurrenceModificationsForSpan:", a3))
    {
      if (a4)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = 39;
        goto LABEL_18;
      }
      goto LABEL_102;
    }
    if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B6D0])
      && !-[EKEvent allowsPrivacyLevelModifications](self, "allowsPrivacyLevelModifications"))
    {
      if (a4)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = 38;
        goto LABEL_18;
      }
      goto LABEL_102;
    }
    if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B650]))
    {
      -[EKCalendarItem calendar](self, "calendar");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "source");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      -[EKEvent color](self, "color");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "source");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (v26 && v24)
      {
        if ((objc_msgSend(v24, "isEqual:", v26) & 1) == 0)
        {
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 71);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_102;
        }
      }
      else if (v24 && v25 && !v26)
      {
        objc_msgSend(v25, "setSource:", v24);
      }

    }
    -[EKEvent constraints](self, "constraints");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v44, "supportsStructuredLocations"))
    {
      -[EKCalendarItem calendar](self, "calendar");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v45, "isSuggestedEventCalendar"))
      {
        -[EKCalendarItem calendar](self, "calendar");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "isNaturalLanguageSuggestedEventCalendar");

        if ((v47 & 1) == 0)
        {
          if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", CFSTR("endLocation")))
          {
            -[EKEvent endLocation](self, "endLocation");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "isStructured");

            if (v49)
            {
              if (a4)
              {
                v15 = (void *)MEMORY[0x1E0CB35C8];
                v16 = 19;
                goto LABEL_18;
              }
              goto LABEL_102;
            }
          }
        }
LABEL_80:
        LOBYTE(v7) = 1;
        return v7;
      }

    }
    goto LABEL_80;
  }
  return v7;
}

- (id)_generateNewUniqueID
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (-[EKEvent isReminderIntegrationEvent](self, "isReminderIntegrationEvent"))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v3 = (void *)getREMReminderClass_softClass_1;
    v17 = getREMReminderClass_softClass_1;
    if (!getREMReminderClass_softClass_1)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __getREMReminderClass_block_invoke_1;
      v13[3] = &unk_1E4784C68;
      v13[4] = &v14;
      __getREMReminderClass_block_invoke_1((uint64_t)v13);
      v3 = (void *)v15[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v14, 8);
    v5 = (void *)objc_msgSend(v4, "newObjectID");
    objc_msgSend(v5, "urlRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v9 = (void *)objc_opt_class();
    -[EKCalendarItem originalItem](self, "originalItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem calendar](self, "calendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "generateUniqueIDWithEvent:originalEvent:calendar:", self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
}

- (void)_willSave
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEvent;
  -[EKCalendarItem _willSave](&v3, sel__willSave);
  -[EKEvent _removeInvalidAlarmsDuringSave](self, "_removeInvalidAlarmsDuringSave");
}

+ (BOOL)_allowSlicingFromDetachedOccurrence
{
  return objc_msgSend(MEMORY[0x1E0D0C278], "isProgramSDKAtLeast:", 0x7E60901FFFFFFFFLL);
}

- (BOOL)saveWithSpan:(int64_t)a3 error:(id *)a4
{
  EKEvent *v6;
  BOOL v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  int64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  unint64_t v24;
  void *v25;
  BOOL v26;
  _QWORD *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  _BOOL4 v55;
  int v56;
  int v57;
  int64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t k;
  void *v70;
  void *v71;
  char v72;
  void *v73;
  int v74;
  void *v75;
  int v76;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  int v89;
  void *v90;
  BOOL v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  _BOOL8 v123;
  uint64_t v124;
  void *v125;
  _QWORD *v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  EKRecurrenceGenerator *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  _QWORD *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t m;
  void *v149;
  uint64_t v150;
  EKEvent *v151;
  void *v152;
  void *v153;
  int v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  int64_t v159;
  void *v160;
  void *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t n;
  uint64_t v166;
  void *v167;
  void *v168;
  int v169;
  void *v170;
  char v171;
  void *v172;
  void *v173;
  void *v174;
  BOOL v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  void *v184;
  id v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t ii;
  uint64_t v190;
  void *v191;
  uint64_t v192;
  void *v193;
  void *v194;
  EKEvent *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  id v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t jj;
  void *v207;
  void *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t kk;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  uint64_t v217;
  void *v218;
  _BOOL4 v219;
  void *v220;
  uint64_t v221;
  void *v222;
  uint64_t v223;
  _BOOL4 v224;
  BOOL v225;
  _BOOL4 v226;
  void *v227;
  void *v228;
  id v229;
  int64_t v230;
  int64_t v231;
  int64_t v232;
  void *v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  int64_t v237;
  uint64_t v238;
  void *v239;
  void *v240;
  uint64_t v241;
  void *v242;
  unsigned int v243;
  void *v244;
  void *v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  id v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  _BYTE v279[128];
  _BYTE v280[128];
  _BYTE v281[128];
  _BYTE v282[128];
  _BYTE v283[128];
  uint64_t v284;
  void *v285;
  _BYTE v286[128];
  _BYTE v287[128];
  _BYTE v288[128];
  uint64_t v289;

  v6 = self;
  v289 = *MEMORY[0x1E0C80C00];
  if (a4)
    *a4 = 0;
  if (!-[EKObject hasChanges](self, "hasChanges"))
    return 1;
  if (!-[EKObject isUndeleted](v6, "isUndeleted"))
    goto LABEL_15;
  if (a3 && a3 != 3)
  {
    if (!a4)
      return 0;
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = CFSTR("Cannot undelete an event with the given span");
LABEL_29:
    v10 = 13;
    goto LABEL_30;
  }
  if (!-[EKEvent isDetached](v6, "isDetached"))
  {
    if (-[EKCalendarItem hasRecurrenceRules](v6, "hasRecurrenceRules"))
    {
      if (a4)
      {
        v8 = (void *)MEMORY[0x1E0CB35C8];
        v9 = CFSTR("Cannot undelete an event that is part of a recurring series and not detached");
        v10 = 5;
LABEL_30:
        objc_msgSend(v8, "errorWithEKErrorCode:description:", v10, v9);
        v7 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        return v7;
      }
      return 0;
    }
LABEL_15:
    if (-[EKEvent isUndetached](v6, "isUndetached"))
    {
      if (!a3 || a3 == 3)
        return -[EKEvent _saveUndetachedOccurrenceWithError:](v6, "_saveUndetachedOccurrenceWithError:", a4);
      if (!a4)
        return 0;
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("Cannot undetach an event with the given span");
      goto LABEL_29;
    }
    v12 = a3;
    if ((unint64_t)(a3 - 4) >= 0xFFFFFFFFFFFFFFFELL)
    {
      if (-[EKEvent isDetached](v6, "isDetached"))
        v12 = 0;
      else
        v12 = 4;
    }
    if (-[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", *MEMORY[0x1E0D0B328]))
    {
      -[EKEvent _originallyCommittedVirtualConference](v6, "_originallyCommittedVirtualConference");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent virtualConference](v6, "virtualConference");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqual:", v14) & 1) != 0)
        v15 = 0;
      else
        v15 = v13;

    }
    else
    {
      v15 = 0;
    }
    if (-[EKEvent _detectedConferenceURLOnBackingObjectMayBeInvalid](v6, "_detectedConferenceURLOnBackingObjectMayBeInvalid"))
    {
      -[EKEvent conferenceURLDetected](v6, "conferenceURLDetected");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "absoluteString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKObject setSingleChangedValue:forKey:](v6, "setSingleChangedValue:forKey:", v17, *MEMORY[0x1E0D0B658]);

    }
    if (-[EKEvent _needsAttendeePartStatReset](v6, "_needsAttendeePartStatReset"))
    {
      -[EKEvent dismissAttendeeRepliedNotification](v6, "dismissAttendeeRepliedNotification");
      v277 = 0u;
      v278 = 0u;
      v275 = 0u;
      v276 = 0u;
      -[EKEvent attendeesNotIncludingOrganizer](v6, "attendeesNotIncludingOrganizer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v275, v288, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v276;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v276 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v275 + 1) + 8 * i), "setParticipantStatus:", 1);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v275, v288, 16);
        }
        while (v20);
      }

    }
    v237 = a3;
    v234 = *MEMORY[0x1E0D0B680];
    -[EKEvent committedValueForKey:](v6, "committedValueForKey:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v228 = v23;
    if (objc_msgSend(v23, "compare:", v25) == -1)
    {
      -[EKEvent virtualConference](v6, "virtualConference");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        if (-[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", *MEMORY[0x1E0D0B350]))
        {
          v226 = -[EKCalendarItem hasRecurrenceRules](v6, "hasRecurrenceRules");
          goto LABEL_47;
        }
        if (-[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", v234))
        {
          -[EKEvent endDateUnadjustedForLegacyClients](v6, "endDateUnadjustedForLegacyClients");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v226 = objc_msgSend(v25, "compare:", v51) == -1;

LABEL_47:
          v227 = v25;
          v26 = -[EKObject isPropertyUnavailable:](v6, "isPropertyUnavailable:", *MEMORY[0x1E0D0B278]);
          v27 = (_QWORD *)MEMORY[0x1E0D0B358];
          v229 = v15;
          if (v26)
          {
            if (-[EKObject isPropertyUnavailable:](v6, "isPropertyUnavailable:", *MEMORY[0x1E0D0B358]))
              goto LABEL_71;
            LOBYTE(v28) = 0;
          }
          else
          {
            v273 = 0u;
            v274 = 0u;
            v271 = 0u;
            v272 = 0u;
            -[EKCalendarItem attendees](v6, "attendees");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v271, v287, 16);
            if (v28)
            {
              v230 = v12;
              v30 = *(_QWORD *)v272;
              v31 = *MEMORY[0x1E0D0B248];
              while (2)
              {
                for (j = 0; j != v28; ++j)
                {
                  if (*(_QWORD *)v272 != v30)
                    objc_enumerationMutation(v29);
                  v33 = *(void **)(*((_QWORD *)&v271 + 1) + 8 * j);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v33, "_hasChangesForKey:", v31) & 1) != 0)
                  {
                    LODWORD(v28) = 1;
                    goto LABEL_64;
                  }
                }
                v28 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v271, v287, 16);
                if (v28)
                  continue;
                break;
              }
LABEL_64:
              v15 = v229;
              v12 = v230;
              v24 = 0x1E0C99000;
            }

            if (-[EKObject isPropertyUnavailable:](v6, "isPropertyUnavailable:", *v27))
            {
              if (!(_DWORD)v28)
                goto LABEL_71;
              goto LABEL_70;
            }
          }
          -[EKCalendarItem selfAttendee](v6, "selfAttendee");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "_hasChangesForKey:", *MEMORY[0x1E0D0B248]);

          if ((v28 & 1) != 0 || (v36 & 1) != 0)
          {
LABEL_70:
            objc_msgSend(*(id *)(v24 + 3432), "date");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKEvent setParticipationStatusModifiedDate:](v6, "setParticipationStatusModifiedDate:", v37);

          }
LABEL_71:
          v38 = *MEMORY[0x1E0D0B628];
          if (-[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", *MEMORY[0x1E0D0B628]))
          {
            -[EKCalendarItem calendar](v6, "calendar");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "supportedEventAvailabilities");

            if (!v40)
              -[EKObject setSingleChangedValue:forKey:](v6, "setSingleChangedValue:forKey:", &unk_1E47B5090, v38);
          }
          v225 = -[EKEvent isMasterOrDetachedOccurrence](v6, "isMasterOrDetachedOccurrence");
          -[EKEvent originalOccurrenceStartDate](v6, "originalOccurrenceStartDate");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "date");
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          v235 = *MEMORY[0x1E0D0B3D0];
          if (-[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:")
            || -[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", v234)
            || -[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", *MEMORY[0x1E0D0B308]))
          {
            -[EKEvent recurrenceDate](v6, "recurrenceDate");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if (v43)
            {
              v270 = 0;
              v44 = -[EKEvent adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:](v6, "adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:", v43, 1, 0, &v270);
              v45 = v270;
              objc_msgSend(v45, "date");
              v46 = objc_claimAutoreleasedReturnValue();

              v42 = (void *)v46;
            }

          }
          v47 = -[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", v235);
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v236 = (void *)objc_msgSend(v48, "copy");

          v224 = v47;
          if (v47)
          {
            if (v12)
            {
              if (!-[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", *MEMORY[0x1E0D0B350]))
              {
                -[EKEvent startDate](v6, "startDate");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = objc_msgSend(v42, "isSameDayAsDate:inCalendar:", v49, v236);

                if ((v50 & 1) == 0)
                {
                  if (-[EKCalendarItem hasComplexRecurrence](v6, "hasComplexRecurrence"))
                  {
                    if (!-[EKEvent _attemptToUpdateComplexRecurrenceRule](v6, "_attemptToUpdateComplexRecurrenceRule"))
                      v12 = 0;
                  }
                  else
                  {
                    -[EKCalendarItem pinRecurrenceRuleToEndsOfFreqency](v6, "pinRecurrenceRuleToEndsOfFreqency");
                  }
                }
              }
            }
          }
          -[EKObject eventStore](v6, "eventStore");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v52, "eventAccessLevel") == 1)
          {
            -[EKCalendarItem calendar](v6, "calendar");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "isNew");

            if (v54)
            {
              if (a4)
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 61);
                v245 = 0;
                v7 = 0;
                *a4 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v245 = 0;
                v7 = 0;
              }
LABEL_301:
              v216 = v227;
              v215 = v228;
LABEL_302:

              return v7;
            }
          }
          else
          {

          }
          v233 = v42;
          if (-[EKObject isNew](v6, "isNew"))
          {
            v245 = 0;
          }
          else
          {
            v55 = -[EKEvent _changesRequireDetachOrSlice](v6, "_changesRequireDetachOrSlice");
            if (-[EKEvent isDetached](v6, "isDetached"))
            {
              v56 = objc_msgSend((id)objc_opt_class(), "_allowSlicingFromDetachedOccurrence");
              if (v12 == 1)
                v57 = v56;
              else
                v57 = 1;
              if (v57)
                v58 = v12;
              else
                v58 = 0;
              if (v58 != 1)
                v55 = 0;
              if (v58)
              {
                -[EKCalendarItem originalItem](v6, "originalItem");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "previouslySavedCopy");
                v245 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v12 = 0;
                v245 = 0;
              }
            }
            else
            {
              if (v55)
                v55 = -[EKCalendarItem _hadRecurrenceRules](v6, "_hadRecurrenceRules");
              -[EKEvent previouslySavedCopy](v6, "previouslySavedCopy");
              v245 = (void *)objc_claimAutoreleasedReturnValue();
            }
            if (-[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", *MEMORY[0x1E0D0B280]))
            {
              -[EKCalendarItem calendar](v6, "calendar");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              -[EKCalendarItem moveToCalendar:](v6, "moveToCalendar:", v60);

              if (-[EKEvent isDetached](v6, "isDetached"))
              {
                -[EKCalendarItem originalItem](v6, "originalItem");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "calendar");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                -[EKCalendarItem calendar](v6, "calendar");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v64 = objc_msgSend(v62, "isEqual:", v63);

                if ((v64 & 1) == 0)
                {
                  if (a4)
                  {
                    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 37);
                    v7 = 0;
                    *a4 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v7 = 0;
                  }
                  v216 = v227;
                  v215 = v228;
                  v42 = v233;
                  goto LABEL_302;
                }
              }
              v231 = v12;
              v268 = 0u;
              v269 = 0u;
              v266 = 0u;
              v267 = 0u;
              -[EKCalendarItem detachedItems](v6, "detachedItems");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v266, v286, 16);
              if (v66)
              {
                v67 = v66;
                v68 = *(_QWORD *)v267;
                while (2)
                {
                  for (k = 0; k != v67; ++k)
                  {
                    if (*(_QWORD *)v267 != v68)
                      objc_enumerationMutation(v65);
                    objc_msgSend(*(id *)(*((_QWORD *)&v266 + 1) + 8 * k), "calendar");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    -[EKCalendarItem calendar](v6, "calendar");
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    v72 = objc_msgSend(v70, "isEqual:", v71);

                    if ((v72 & 1) == 0)
                    {
                      v42 = v233;
                      if (a4)
                      {
                        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 37);
                        *a4 = (id)objc_claimAutoreleasedReturnValue();
                      }

                      v7 = 0;
                      v15 = v229;
                      goto LABEL_301;
                    }
                  }
                  v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v266, v286, 16);
                  if (v67)
                    continue;
                  break;
                }
              }

              v24 = 0x1E0C99000uLL;
              v12 = v231;
            }
            if (-[EKEvent _isParticipationStatusDirty](v6, "_isParticipationStatusDirty") && !v12)
            {
              if (-[EKCalendarItem hasRecurrenceRules](v6, "hasRecurrenceRules")
                && (-[EKEvent constraints](v6, "constraints"),
                    v73 = (void *)objc_claimAutoreleasedReturnValue(),
                    v74 = objc_msgSend(v73, "mustAcknowledgeMasterEvent"),
                    v73,
                    v74))
              {
                if (-[EKEvent responseMustApplyToAll](v6, "responseMustApplyToAll"))
                  v12 = 4;
                else
                  v12 = 0;
              }
              else
              {
                v12 = 0;
              }
            }
            -[EKEvent constraints](v6, "constraints");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = objc_msgSend(v75, "snoozeAlarmRequiresDetach");

            if (v76 && -[EKEvent requiresDetachDueToSnoozedAlarm](v6, "requiresDetachDueToSnoozedAlarm"))
              v12 = 0;
            if (-[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", v235)
              || -[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", v234)
              || -[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", *MEMORY[0x1E0D0B308]))
            {
              -[EKCalendarItem removeAllSnoozedAlarms](v6, "removeAllSnoozedAlarms");
            }
            else if (-[EKCalendarItem isAlarmAcknowledgedPropertyDirty](v6, "isAlarmAcknowledgedPropertyDirty"))
            {
              -[EKCalendarItem removeAcknowledgedSnoozedAlarms](v6, "removeAcknowledgedSnoozedAlarms");
            }
            if (-[EKEvent isFirstOccurrence](v6, "isFirstOccurrence") && v12 == 1)
              v12 = 4;
            if ((_DWORD)v12 != 4 && v55)
            {
              -[EKEvent originalOccurrenceStartDate](v6, "originalOccurrenceStartDate");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "date");
              v79 = (void *)objc_claimAutoreleasedReturnValue();

              -[EKEvent occurrenceStartDate](v6, "occurrenceStartDate");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "date");
              v81 = (void *)objc_claimAutoreleasedReturnValue();

              if (-[EKEvent isFloating](v6, "isFloating"))
              {
                -[EKObject eventStore](v6, "eventStore");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v82, "timeZone");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v79, "dateInTimeZone:fromTimeZone:", 0, v83);
                v84 = objc_claimAutoreleasedReturnValue();

                -[EKObject eventStore](v6, "eventStore");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v85, "timeZone");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v81, "dateInTimeZone:fromTimeZone:", 0, v86);
                v87 = objc_claimAutoreleasedReturnValue();

                v79 = (void *)v84;
                v81 = (void *)v87;
              }
              -[EKEvent _detachOrSliceWithSpan:withOriginalStartDate:newStartDate:](v6, "_detachOrSliceWithSpan:withOriginalStartDate:newStartDate:", v12, v79, v81);

            }
            if (-[EKEvent requiresDetachDueToSnoozedAlarm](v6, "requiresDetachDueToSnoozedAlarm"))
            {
              -[EKEvent setRequiresDetachDueToSnoozedAlarm:](v6, "setRequiresDetachDueToSnoozedAlarm:", 0);
            }
            else if ((-[EKCalendarItem modifiedProperties](v6, "modifiedProperties") & 0x80) != 0)
            {
              -[EKCalendarItem setModifiedProperties:](v6, "setModifiedProperties:", -[EKCalendarItem modifiedProperties](v6, "modifiedProperties") & 0xFFFFFF7FLL);
            }
            -[EKCalendarItem _updateModifiedAlarmByAcknowledging](v6, "_updateModifiedAlarmByAcknowledging");
            if ((-[EKCalendarItem modifiedProperties](v6, "modifiedProperties") & 0x200) != 0
              && !-[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", *MEMORY[0x1E0D0B6A8]))
            {
              -[EKCalendarItem setModifiedProperties:](v6, "setModifiedProperties:", -[EKCalendarItem modifiedProperties](v6, "modifiedProperties") & 0xFFFFFDFFLL);
            }
          }
          -[EKCalendarItem addOrganizerAndSelfAttendeeForNewInvitation](v6, "addOrganizerAndSelfAttendeeForNewInvitation");
          -[EKCalendarItem removeLastExtraneousOrganizerAndSelfAttendee](v6, "removeLastExtraneousOrganizerAndSelfAttendee");
          -[EKEvent _updateUUIDForNewParticipants](v6, "_updateUUIDForNewParticipants");
          -[EKEvent constraints](v6, "constraints");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = objc_msgSend(v88, "requiresOccurrencesConformToRecurrenceRule");

          if (v89)
          {
            if (-[EKEvent _isSimpleRepeatingEvent](v6, "_isSimpleRepeatingEvent"))
            {
              -[EKCalendarItem recurrenceRules](v6, "recurrenceRules");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = -[EKEvent conformsToRecurrenceRules:](v6, "conformsToRecurrenceRules:", v90);

              if (!v91)
              {
                if (v12)
                {
                  -[EKCalendarItem recurrenceRules](v6, "recurrenceRules");
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v92, "objectAtIndexedSubscript:", 0);
                  v93 = (void *)objc_claimAutoreleasedReturnValue();

                  v94 = objc_msgSend(v93, "frequency");
                  v95 = objc_msgSend(v93, "interval");
                  objc_msgSend(v93, "recurrenceEnd");
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  +[EKRecurrenceRule recurrenceRuleWithType:interval:end:](EKRecurrenceRule, "recurrenceRuleWithType:interval:end:", v94, v95, v96);
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  v285 = v97;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v285, 1);
                  v98 = (void *)objc_claimAutoreleasedReturnValue();
                  -[EKEvent setRecurrenceRules:](v6, "setRecurrenceRules:", v98);

                }
              }
            }
          }
          if (-[EKEvent _isParticipationStatusDirty](v6, "_isParticipationStatusDirty"))
          {
            -[EKEvent constraints](v6, "constraints");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = objc_msgSend(v99, "mustAcknowledgeMasterEvent");

            if (v100)
            {
              if (-[EKEvent isDetached](v6, "isDetached") && v12 == 4)
              {
                -[EKCalendarItem originalItem](v6, "originalItem");
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                if (v101)
                {
                  v102 = -[EKEvent participationStatus](v6, "participationStatus");
                  if (v102 == 3)
                    v103 = 4;
                  else
                    v103 = v102;
                  objc_msgSend(v101, "setParticipationStatus:", v103);
                }

              }
            }
          }
          v104 = *MEMORY[0x1E0D0B698];
          if (-[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", *MEMORY[0x1E0D0B698]))
          {
            -[EKEvent image](v6, "image");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKCalendarItem calendar](v6, "calendar");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "saveInCalendar:", v106);

            -[EKObject changeSet](v6, "changeSet");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKEvent image](v6, "image");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "backingObject");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "forceChangeValue:forKey:", v109, v104);

          }
          if (-[EKEvent isDetached](v6, "isDetached"))
          {
            v110 = *MEMORY[0x1E0D0B350];
            if (-[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", *MEMORY[0x1E0D0B350]))
            {
              -[EKCalendarItem recurrenceRules](v6, "recurrenceRules");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              -[EKCalendarItem originalItem](v6, "originalItem");
              v112 = objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v112, "setRecurrenceRules:", v111);

              -[EKCalendarItem originalItem](v6, "originalItem");
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v112) = objc_msgSend(v113, "hasRecurrenceRules");

              -[EKCalendarItem originalItem](v6, "originalItem");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              v115 = v114;
              if ((v112 & 1) != 0)
              {
                objc_msgSend(v114, "_filterExceptionDatesAndDetachments");
              }
              else
              {
                objc_msgSend(v114, "setExceptionDates:", 0);

                -[EKCalendarItem originalItem](v6, "originalItem");
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v115, "setDetachedItems:", 0);
              }

              -[EKCalendarItem originalItem](v6, "originalItem");
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "_updateModifiedProperties");

              -[EKCalendarItem originalItem](v6, "originalItem");
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v117, "updatePersistentValueForKeyIfNeeded:", v110);

              -[EKCalendarItem originalItem](v6, "originalItem");
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              -[EKObject addCoCommitObject:](v6, "addCoCommitObject:", v118);

              -[EKObject changeSet](v6, "changeSet");
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              v284 = v110;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v284, 1);
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v119, "rollbackChangesForKeys:", v120);

              -[EKObject emptyMeltedCacheForKey:](v6, "emptyMeltedCacheForKey:", v110);
            }
          }
          v123 = v237 != 3 && v12 != 0 && v245 != 0;
          v124 = v123;
          if (!-[EKCalendarItem isSelfOrganized](v6, "isSelfOrganized"))
            v124 = v123 & ~-[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", *MEMORY[0x1E0D0B360]);
          -[EKCalendarItem timeZone](v6, "timeZone");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v236, "setTimeZone:", v125);

          v126 = (_QWORD *)MEMORY[0x1E0D0B2A8];
          v232 = v12;
          if (v123)
          {
            v127 = (void *)objc_opt_new();
            -[EKCalendarItem originalItem](v6, "originalItem");
            v128 = objc_claimAutoreleasedReturnValue();
            v129 = (void *)v128;
            if (v128)
              v130 = (void *)v128;
            else
              v130 = v6;
            v131 = v130;

            objc_msgSend(v131, "singleRecurrenceRule");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v132, "recurrenceEnd");
            v133 = (void *)objc_claimAutoreleasedReturnValue();

            v220 = v133;
            v222 = v131;
            v219 = v123;
            if (v133)
            {
              if (objc_msgSend(v133, "occurrenceCount"))
              {
                v134 = objc_alloc_init(EKRecurrenceGenerator);
                objc_msgSend(v131, "singleRecurrenceRule");
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v131, "startDate");
                v136 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v24 + 3432), "distantFuture");
                v243 = v124;
                v137 = v133;
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                -[EKEvent effectiveTimeZone](v6, "effectiveTimeZone");
                v139 = v127;
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v217) = 0;
                v141 = -[EKRecurrenceGenerator copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:](v134, "copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:", v222, v135, v136, v138, v140, 0, objc_msgSend(v137, "occurrenceCount"), v217);
                v142 = v126;
                v143 = (void *)v141;

                v127 = v139;
                v131 = v222;

                objc_msgSend(v143, "lastObject");
                v240 = (void *)objc_claimAutoreleasedReturnValue();

                v126 = v142;
                v124 = v243;

              }
              else
              {
                objc_msgSend(v133, "endDate");
                v240 = (void *)objc_claimAutoreleasedReturnValue();
              }
            }
            else
            {
              v240 = 0;
            }
            if (v12 == 4)
              objc_msgSend(v131, "emptyMeltedCacheForKey:", *v126);
            v264 = 0u;
            v265 = 0u;
            v262 = 0u;
            v263 = 0u;
            objc_msgSend(v131, "detachedItems");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            v145 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v262, v283, 16);
            if (v145)
            {
              v146 = v145;
              v147 = *(_QWORD *)v263;
              do
              {
                for (m = 0; m != v146; ++m)
                {
                  if (*(_QWORD *)v263 != v147)
                    objc_enumerationMutation(v144);
                  v149 = *(void **)(*((_QWORD *)&v262 + 1) + 8 * m);
                  if ((objc_msgSend(v149, "isEqual:", v6) & 1) == 0
                    && ((v124 & 1) != 0 || (objc_msgSend(v149, "isSignificantlyDetached") & 1) == 0))
                  {
                    if (!v240)
                      goto LABEL_216;
                    objc_msgSend(v149, "startDate");
                    v150 = v124;
                    v151 = v6;
                    v152 = v127;
                    v153 = (void *)objc_claimAutoreleasedReturnValue();
                    v154 = objc_msgSend(v153, "isBeforeOrSameDayAsDate:inCalendar:", v240, v236);

                    v127 = v152;
                    v6 = v151;
                    v124 = v150;
                    if (v154)
LABEL_216:
                      objc_msgSend(v127, "addObject:", v149);
                  }
                }
                v146 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v262, v283, 16);
              }
              while (v146);
            }

            if (-[EKEvent isDetached](v6, "isDetached"))
            {
              -[EKCalendarItem originalItem](v6, "originalItem");
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v127, "addObject:", v155);

            }
            -[EKEvent startDate](v6, "startDate");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v236, "components:fromDate:toDate:options:", 254, v233, v156, 0);
            v244 = (void *)objc_claimAutoreleasedReturnValue();

            -[EKEvent occurrenceStartDate](v6, "occurrenceStartDate");
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKEvent occurrenceEndDate](v6, "occurrenceEndDate");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKEvent _calculateDurationWithStart:end:allDay:](v6, "_calculateDurationWithStart:end:allDay:", v157, v158, -[EKEvent occurrenceIsAllDay](v6, "occurrenceIsAllDay"));
            v242 = (void *)objc_claimAutoreleasedReturnValue();

            v239 = 0;
            v159 = v237;
            if ((_DWORD)v124)
            {
              v218 = v127;
              v239 = (void *)objc_opt_new();
              v258 = 0u;
              v259 = 0u;
              v260 = 0u;
              v261 = 0u;
              -[EKObject eventStore](v6, "eventStore");
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v160, "eventsWithSameRecurrenceSetAsEvent:", v6);
              v161 = (void *)objc_claimAutoreleasedReturnValue();

              v162 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v258, v282, 16);
              if (v162)
              {
                v163 = v162;
                v164 = *(_QWORD *)v259;
                do
                {
                  for (n = 0; n != v163; ++n)
                  {
                    if (*(_QWORD *)v259 != v164)
                      objc_enumerationMutation(v161);
                    v166 = *(_QWORD *)(*((_QWORD *)&v258 + 1) + 8 * n);
                    if (v159 == 4)
                      goto LABEL_229;
                    objc_msgSend(*(id *)(*((_QWORD *)&v258 + 1) + 8 * n), "startDate");
                    v167 = (void *)objc_claimAutoreleasedReturnValue();
                    -[EKEvent startDate](v6, "startDate");
                    v168 = (void *)objc_claimAutoreleasedReturnValue();
                    v169 = objc_msgSend(v167, "isAfterDate:", v168);

                    v159 = v237;
                    if (v169)
LABEL_229:
                      objc_msgSend(v239, "addObject:", v166);
                  }
                  v163 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v258, v282, 16);
                }
                while (v163);
              }

              objc_msgSend(v239, "sortUsingSelector:", sel_compareStartDateWithEvent_);
              v127 = v218;
            }

            v24 = 0x1E0C99000;
            v12 = v232;
            LODWORD(v123) = v219;
            v126 = (_QWORD *)MEMORY[0x1E0D0B2A8];
          }
          else
          {
            v127 = 0;
            v239 = 0;
            v242 = 0;
            v244 = 0;
          }
          -[EKObject insertPersistentObjectIfNeeded](v6, "insertPersistentObjectIfNeeded");
          -[EKEvent _willSave](v6, "_willSave");
          -[EKEvent _updateVideoConferenceOnlyModified](v6, "_updateVideoConferenceOnlyModified");
          -[EKObject eventStore](v6, "eventStore");
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          v171 = objc_msgSend(v170, "allowsIntegrationModifications");

          if ((v171 & 1) == 0 && -[EKEvent isOrWasIntegrationEvent](v6, "isOrWasIntegrationEvent"))
          {
            -[EKObject eventStore](v6, "eventStore");
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKObject backingObject](v6, "backingObject");
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v172, "_markObjectUncommittable:", v173);

            -[EKObject persistentObject](v6, "persistentObject");
            v174 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v174, "isNew"))
            {
LABEL_244:

              goto LABEL_245;
            }
            v175 = -[EKEvent isDetached](v6, "isDetached");

            if (!v175)
            {
              -[EKEvent committedValueForKey:](v6, "committedValueForKey:", *MEMORY[0x1E0D0B408]);
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              -[EKCalendarItem uniqueID](v6, "uniqueID");
              v176 = (void *)objc_claimAutoreleasedReturnValue();
              v177 = v176;
              if (v174
                && v176
                && (objc_msgSend(v176, "isEqualToString:", v174) & 1) == 0
                && !-[EKEvent isDetached](v6, "isDetached"))
              {
                -[EKObject eventStore](v6, "eventStore");
                v178 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v178, "pendingIntegrationEventChangedIdentifierFrom:to:", v174, v177);

              }
              -[EKObject eventStore](v6, "eventStore");
              v179 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v179, "addPendingIntegrationEvent:", v6);

              goto LABEL_244;
            }
          }
LABEL_245:
          v180 = *v126;
          v181 = *MEMORY[0x1E0D0B6C0];
          v182 = *MEMORY[0x1E0D0B350];
          v238 = *MEMORY[0x1E0D0B320];
          v221 = *MEMORY[0x1E0D0B338];
          v223 = *MEMORY[0x1E0D0B2B0];
          v241 = v180;
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v235, v234, *MEMORY[0x1E0D0B2B0], v180, *MEMORY[0x1E0D0B338], *MEMORY[0x1E0D0B320], *MEMORY[0x1E0D0B6C0], *MEMORY[0x1E0D0B350], 0);
          v183 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKObject updatePersistentObjectSkippingProperties:](v6, "updatePersistentObjectSkippingProperties:", v183);

          if (v123)
          {
            if (objc_msgSend(v127, "count"))
              -[EKEvent _propagateChangesToDetachedEvents:originalItemBeforeSave:startDateOffset:duration:calendar:](v6, "_propagateChangesToDetachedEvents:originalItemBeforeSave:startDateOffset:duration:calendar:", v127, v245, v244, v242, v236);
            v184 = v127;
            v256 = 0u;
            v257 = 0u;
            v254 = 0u;
            v255 = 0u;
            v185 = v239;
            v186 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v254, v281, 16);
            if (v186)
            {
              v187 = v186;
              v188 = *(_QWORD *)v255;
              do
              {
                for (ii = 0; ii != v187; ++ii)
                {
                  if (*(_QWORD *)v255 != v188)
                    objc_enumerationMutation(v185);
                  -[EKEvent _propagateChangesToSlice:originalItemBeforeSave:startDateOffset:duration:calendar:](v6, "_propagateChangesToSlice:originalItemBeforeSave:startDateOffset:duration:calendar:", *(_QWORD *)(*((_QWORD *)&v254 + 1) + 8 * ii), v245, v244, v242, v236);
                }
                v187 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v254, v281, 16);
              }
              while (v187);
            }

            v127 = v184;
            v24 = 0x1E0C99000uLL;
            v12 = v232;
          }
          v190 = *MEMORY[0x1E0D0B308];
          if (-[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", *MEMORY[0x1E0D0B308]))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[EKEvent occurrenceIsAllDay](v6, "occurrenceIsAllDay"));
            v191 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKEvent setOriginalOccurrenceIsAllDay:](v6, "setOriginalOccurrenceIsAllDay:", v191);

          }
          if (v224 && !-[EKObject isNew](v6, "isNew") && v12)
          {
            -[EKEvent _clearExceptionDatesAndUpdateDetachedOriginalDates:](v6, "_clearExceptionDatesAndUpdateDetachedOriginalDates:", v6);
          }
          else if (-[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", v182))
          {
            if (-[EKCalendarItem hasRecurrenceRules](v6, "hasRecurrenceRules"))
            {
              -[EKEvent _filterExceptionDatesAndDetachments](v6, "_filterExceptionDatesAndDetachments");
            }
            else
            {
              -[EKCalendarItem setExceptionDates:](v6, "setExceptionDates:", 0);
              -[EKCalendarItem setDetachedItems:](v6, "setDetachedItems:", 0);
            }
          }
          -[EKObject updatePersistentValueForKeyIfNeeded:](v6, "updatePersistentValueForKeyIfNeeded:", v181);
          if (!v225 && -[EKCalendarItem hasRecurrenceRules](v6, "hasRecurrenceRules") && v12 == 4)
          {
            -[EKEvent _applyTimeChangesToMaster](v6, "_applyTimeChangesToMaster");
          }
          else
          {
            -[EKObject updatePersistentValueForKeyIfNeeded:](v6, "updatePersistentValueForKeyIfNeeded:", v235);
            -[EKObject updatePersistentValueForKeyIfNeeded:](v6, "updatePersistentValueForKeyIfNeeded:", v234);
          }
          -[EKObject updatePersistentValueForKeyIfNeeded:](v6, "updatePersistentValueForKeyIfNeeded:", v223);
          -[EKObject updatePersistentValueForKeyIfNeeded:](v6, "updatePersistentValueForKeyIfNeeded:", v221);
          -[EKEvent _updateModifiedPropertiesForThisEventAndAllDetachments](v6, "_updateModifiedPropertiesForThisEventAndAllDetachments");
          -[EKCalendarItem originalItem](v6, "originalItem");
          v192 = objc_claimAutoreleasedReturnValue();
          v193 = (void *)v192;
          if (v192)
            v194 = (void *)v192;
          else
            v194 = v6;
          v195 = v194;

          -[EKObject updatePersistentValueForKeyIfNeeded:](v195, "updatePersistentValueForKeyIfNeeded:", v241);
          if (-[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", v190)
            || -[EKObject _hasChangesForKey:](v6, "_hasChangesForKey:", v182))
          {
            if (-[EKEvent isAllDay](v6, "isAllDay"))
            {
              -[EKCalendarItem recurrenceRules](v6, "recurrenceRules");
              v196 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v196, "lastObject");
              v197 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v197, "endDate");
              v198 = (void *)objc_claimAutoreleasedReturnValue();

              if (v198)
                -[EKEvent _updateRecurrenceEndDatesWithAdjustmentMode:](v6, "_updateRecurrenceEndDatesWithAdjustmentMode:", 0);
            }
          }
          -[EKObject updatePersistentValueForKeyIfNeeded:](v195, "updatePersistentValueForKeyIfNeeded:", v182);
          -[EKObject updatePersistentValueForKeyIfNeeded:](v6, "updatePersistentValueForKeyIfNeeded:", v238);
          -[EKEvent setPredictedLocationFrozen:](v6, "setPredictedLocationFrozen:", 0);
          -[EKEvent occurrenceStartDate](v6, "occurrenceStartDate");
          v199 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKEvent setOriginalOccurrenceStartDate:](v6, "setOriginalOccurrenceStartDate:", v199);

          -[EKEvent occurrenceEndDate](v6, "occurrenceEndDate");
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKEvent setOriginalOccurrenceEndDate:](v6, "setOriginalOccurrenceEndDate:", v200);

          -[EKEvent _invalidateRecurrenceIdentifier](v6, "_invalidateRecurrenceIdentifier");
          if (v195 == v6)
          {
            v201 = v127;
            -[EKObject cachedMeltedObjectsForMultiValueKey:](v6, "cachedMeltedObjectsForMultiValueKey:", v241);
            v250 = 0u;
            v251 = 0u;
            v252 = 0u;
            v253 = 0u;
            v202 = (id)objc_claimAutoreleasedReturnValue();
            v203 = objc_msgSend(v202, "countByEnumeratingWithState:objects:count:", &v250, v280, 16);
            v15 = v229;
            v42 = v233;
            if (v203)
            {
              v204 = v203;
              v205 = *(_QWORD *)v251;
              do
              {
                for (jj = 0; jj != v204; ++jj)
                {
                  if (*(_QWORD *)v251 != v205)
                    objc_enumerationMutation(v202);
                  objc_msgSend(*(id *)(*((_QWORD *)&v250 + 1) + 8 * jj), "_invalidateRecurrenceIdentifier");
                }
                v204 = objc_msgSend(v202, "countByEnumeratingWithState:objects:count:", &v250, v280, 16);
              }
              while (v204);
            }

            v127 = v201;
          }
          else
          {
            -[EKEvent _deleteErrorIfInvalid](v195, "_deleteErrorIfInvalid");
            v15 = v229;
            v42 = v233;
          }
          -[EKEvent _deleteErrorIfInvalid](v6, "_deleteErrorIfInvalid");
          if (v15)
          {
            v207 = v127;
            v248 = 0u;
            v249 = 0u;
            v246 = 0u;
            v247 = 0u;
            objc_msgSend(v15, "joinMethods");
            v208 = (void *)objc_claimAutoreleasedReturnValue();
            v209 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v246, v279, 16);
            if (v209)
            {
              v210 = v209;
              v211 = *(_QWORD *)v247;
              do
              {
                for (kk = 0; kk != v210; ++kk)
                {
                  if (*(_QWORD *)v247 != v211)
                    objc_enumerationMutation(v208);
                  objc_msgSend(*(id *)(*((_QWORD *)&v246 + 1) + 8 * kk), "URL");
                  v213 = (void *)objc_claimAutoreleasedReturnValue();
                  -[EKEvent invalidateVirtualConferenceURLIfNeededOnCommit:](v6, "invalidateVirtualConferenceURLIfNeededOnCommit:", v213);

                }
                v210 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v246, v279, 16);
              }
              while (v210);
            }

            v42 = v233;
            v127 = v207;
          }
          if (v226)
          {
            objc_msgSend(*(id *)(v24 + 3432), "dateWithTimeIntervalSinceNow:", 31622400.0);
            v214 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKEvent _extendConferenceURLExpirationDateToDate:](v6, "_extendConferenceURLExpirationDateToDate:", v214);

          }
          v7 = 1;
          goto LABEL_301;
        }
      }
    }
    v226 = 0;
    goto LABEL_47;
  }
  -[EKEvent _saveUndeletedDetachedOccurrence](v6, "_saveUndeletedDetachedOccurrence");
  return 1;
}

- (BOOL)_needsAttendeePartStatReset
{
  return (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessHasSyncClientEntitlement") & 1) == 0
      && -[EKCalendarItem hasAttendees](self, "hasAttendees")
      && !-[EKCalendarItem isExternallyOrganizedInvitation](self, "isExternallyOrganizedInvitation")
      && -[EKEvent isDifferentFromCommittedEventAndRequiresRSVP](self, "isDifferentFromCommittedEventAndRequiresRSVP");
}

- (void)_deleteErrorIfInvalid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[EKCalendarItem syncError](self, "syncError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isNew") & 1) == 0)
  {
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D0BF10]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        while (2)
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            -[EKEvent _eventKitPropertyKeyForCalendarItemErrorPropertyKey:](self, "_eventKitPropertyKeyForCalendarItemErrorPropertyKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), (_QWORD)v13);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12 && -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", v12))
            {

              -[EKCalendarItem setSyncError:](self, "setSyncError:", 0);
              -[EKObject updatePersistentValueForKeyIfNeeded:](self, "updatePersistentValueForKeyIfNeeded:", *MEMORY[0x1E0D0B3F8]);
              goto LABEL_15;
            }

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v9)
            continue;
          break;
        }
      }

    }
LABEL_15:

  }
}

- (id)_eventKitPropertyKeyForCalendarItemErrorPropertyKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0D0BF18];
  v9[0] = *MEMORY[0x1E0D0B270];
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_saveUndeletedDetachedOccurrence
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  -[EKObject _initChangeSetIfNone](self, "_initChangeSetIfNone");
  -[EKCalendarItem originalItem](self, "originalItem");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEvent originalStartDate](self, "originalStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_removeExceptionDate:", v3);

  objc_msgSend(v12, "updatePersistentValueForKeyIfNeeded:", *MEMORY[0x1E0D0B2B0]);
  -[EKObject frozenObject](self, "frozenObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D0B2A8];
  objc_msgSend(v12, "addMultiChangedObjectValue:forKey:", v4, *MEMORY[0x1E0D0B2A8]);

  objc_msgSend(v12, "emptyMeltedCacheForKey:", v5);
  -[EKObject changeSet](self, "changeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frozenObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D0B338];
  objc_msgSend(v6, "forceChangeValue:forKey:", v7, *MEMORY[0x1E0D0B338]);

  -[EKObject changeSet](self, "changeSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent _generateNewUniqueID](self, "_generateNewUniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D0B408];
  objc_msgSend(v9, "forceChangeValue:forKey:", v10, *MEMORY[0x1E0D0B408]);

  -[EKObject updatePersistentValueForKeyIfNeeded:](self, "updatePersistentValueForKeyIfNeeded:", v11);
  -[EKObject updatePersistentValueForKeyIfNeeded:](self, "updatePersistentValueForKeyIfNeeded:", v8);
  -[EKObject addCoCommitObject:](self, "addCoCommitObject:", v12);
  -[EKObject insertPersistentObjectIfNeeded](self, "insertPersistentObjectIfNeeded");

}

- (BOOL)_saveUndetachedOccurrenceWithError:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  BOOL v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[EKEvent masterEvent](self, "masterEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v4, "detachedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
      objc_msgSend(v10, "originalStartDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent startDate](self, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToDate:", v12);

      if ((v13 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v10;

    if (!v14)
      goto LABEL_12;
    objc_msgSend(v14, "_deleteSelfAndDetached");

    v15 = 1;
  }
  else
  {
LABEL_9:

LABEL_12:
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:description:", 5, CFSTR("Cannot undetach an event that is not detached"));
      v15 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (void)_extendConferenceURLExpirationDateToDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKEvent virtualConference](self, "virtualConference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v5, "joinMethods", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "URL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[EKConferenceUtils renewConferenceURL:toDate:](EKConferenceUtils, "renewConferenceURL:toDate:", v12, v4);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (void)_updateModifiedPropertiesForThisEventAndAllDetachments
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "privacyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A2318000, v1, v3, "Updating modified properties for event: %{public}@.", v4);

  OUTLINED_FUNCTION_4_0();
}

- (void)_updateVideoConferenceOnlyModified
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v3 = *MEMORY[0x1E0D0B328];
  if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B328]))
  {
    -[EKEvent committedValueForKey:](self, "committedValueForKey:", v3);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem notes](self, "notes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D0C280], "deserializeConference:", v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D0C280], "deserializeConference:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "conference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v7 == 0) == (v8 != 0) || v7 && (objc_msgSend(v7, "isEqual:", v8) & 1) == 0)
    {
      v9 = objc_msgSend(v5, "range");
      objc_msgSend(v18, "stringByReplacingCharactersInRange:withString:", v9, v10, &stru_1E4789A58);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "hasSuffix:", CFSTR("\n\n")))
      {
        objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - 2);
        v12 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v12;
      }
      v13 = objc_msgSend(v6, "range");
      objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v13, v14, &stru_1E4789A58);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "hasSuffix:", CFSTR("\n\n")))
      {
        objc_msgSend(v15, "substringToIndex:", objc_msgSend(v15, "length") - 2);
        v16 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v16;
      }
      if (v11 && (objc_msgSend(v11, "isEqualToString:", v15) & 1) != 0
        || !objc_msgSend(v11, "length") && !objc_msgSend(v15, "length"))
      {

        if ((-[EKCalendarItem modifiedProperties](self, "modifiedProperties") & 0x20) != 0)
          goto LABEL_16;
        v17 = -[EKCalendarItem modifiedProperties](self, "modifiedProperties") | 0x2000;
LABEL_15:
        -[EKCalendarItem setModifiedProperties:](self, "setModifiedProperties:", v17);
LABEL_16:

        return;
      }

    }
    v17 = -[EKCalendarItem modifiedProperties](self, "modifiedProperties") & 0xFFFFDFFFLL;
    goto LABEL_15;
  }
}

- (void)_updateModifiedProperties
{
  int v6;
  int v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  __CFString *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a1, "modifiedProperties");
  v7 = objc_msgSend(a1, "modifiedProperties");
  if (v7 == (_DWORD)a2)
  {
    v8 = CFSTR("Modified properties changed: NO");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Modified properties changed: YES. Old modified properties: %u"), a2);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = (int)objc_msgSend(a1, "clearModifiedFlags");
  objc_msgSend(a1, "privacyDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 67109890;
  v12 = v6;
  v13 = 2114;
  v14 = v8;
  v15 = 2048;
  v16 = v9;
  v17 = 2114;
  v18 = v10;
  _os_log_debug_impl(&dword_1A2318000, a3, OS_LOG_TYPE_DEBUG, "Updated modified properties: %u. %{public}@. Clear modified flags: %lu. Event: %{public}@", buf, 0x26u);

  if (v7 != (_DWORD)a2)
}

- (void)applyChangesFromEvent:(id)a3 toEvent:(id)a4 ignoringDifferencesFrom:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v8 = (void *)MEMORY[0x1E0C99E20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  +[EKEvent knownKeysToSkipForFutureChanges](EKEvent, "knownKeysToSkipForFutureChanges");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[EKEvent constraints](self, "constraints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v13, "requiresSeparateFilesForAllAttachments");

  if ((_DWORD)v8)
    objc_msgSend(v14, "addObject:", *MEMORY[0x1E0D0B270]);
  objc_msgSend(v14, "addObject:", *MEMORY[0x1E0D0B358]);
  +[EKObject addChangesFromObject:toObject:exceptWhereObjectIsDifferentFrom:skippingChanges:](EKObject, "addChangesFromObject:toObject:exceptWhereObjectIsDifferentFrom:skippingChanges:", v11, v10, v9, v14);

}

- (void)_propagateChangesToSlice:(id)a3 originalItemBeforeSave:(id)a4 startDateOffset:(id)a5 duration:(id)a6 calendar:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[EKEvent applyChangesFromEvent:toEvent:ignoringDifferencesFrom:](self, "applyChangesFromEvent:toEvent:ignoringDifferencesFrom:", self, v12, v13);
  objc_msgSend(v12, "_updateModifiedProperties");
  objc_msgSend(v12, "updatePersistentObjectSkippingProperties:", 0);
  -[EKObject addCoCommitObject:](self, "addCoCommitObject:", v12);
  objc_msgSend(v12, "detachedItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v14;
  v28 = v15;
  -[EKEvent _propagateChangesToDetachedEvents:originalItemBeforeSave:startDateOffset:duration:calendar:](self, "_propagateChangesToDetachedEvents:originalItemBeforeSave:startDateOffset:duration:calendar:", v17, v13, v14, v15, v16);

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v30 = v12;
  objc_msgSend(v12, "detachedItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    v22 = *MEMORY[0x1E0D0B2A8];
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v24, "_updateModifiedProperties");
        v25 = (void *)MEMORY[0x1E0C99E60];
        v35 = v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setWithArray:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "updatePersistentObjectSkippingProperties:", v27);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v20);
  }

}

- (void)_propagateChangesToDetachedEvents:(id)a3 originalItemBeforeSave:(id)a4 startDateOffset:(id)a5 duration:(id)a6 calendar:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
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
  int v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  id obj;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v58 = a6;
  v15 = a7;
  -[EKEvent constraints](self, "constraints");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v16, "requiresSeparateFilesForAllAttachments");

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v17 = v12;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v72 != v20)
          objc_enumerationMutation(v17);
        -[EKEvent applyChangesFromEvent:toEvent:ignoringDifferencesFrom:](self, "applyChangesFromEvent:toEvent:ignoringDifferencesFrom:", self, *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i), v13);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
    }
    while (v19);
  }
  v56 = v13;

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v17;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v68 != v24)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
        objc_msgSend(v26, "originalStartDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
          goto LABEL_15;
        objc_msgSend(v15, "dateByAddingComponents:toDate:options:", v14, v27, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setOriginalStartDate:", v28);

        objc_msgSend(v26, "startDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v27, "isEqualToDate:", v29);

        if (v30)
        {
LABEL_15:
          objc_msgSend(v26, "startDate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "dateByAddingComponents:toDate:options:", v14, v31, 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setStartDate:", v32);

          objc_msgSend(v26, "occurrenceStartDate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "calendarDateByComponentwiseAddingComponents:", v58);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v34, "date");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "_updateEndDateForDate:withAdjustmentMode:", v35, 0);

        }
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
    }
    while (v23);
  }

  v36 = (void *)MEMORY[0x1E0C99E20];
  +[EKEvent knownKeysToUseForFutureChanges](EKEvent, "knownKeysToUseForFutureChanges");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setWithArray:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    objc_msgSend(v38, "removeObject:", *MEMORY[0x1E0D0B270]);
    -[EKEvent _duplicateAddedAttachmentsToDetachedEvents:](self, "_duplicateAddedAttachmentsToDetachedEvents:", obj);
  }
  -[EKCalendarItem selfAttendee](self, "selfAttendee");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject changeSet](self, "changeSet");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "hasUnsavedChangeForKey:", *MEMORY[0x1E0D0B358]);

  if (v41)
  {
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v42 = obj;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v64;
      do
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v64 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * k), "_updateSelfAttendeeToMatchSelfAttendee:", v39);
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
      }
      while (v44);
    }

  }
  if (-[EKEvent isDetached](self, "isDetached"))
  {
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v47 = obj;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v60;
      do
      {
        v51 = 0;
        do
        {
          if (*(_QWORD *)v60 != v50)
            objc_enumerationMutation(v47);
          __102__EKEvent__propagateChangesToDetachedEvents_originalItemBeforeSave_startDateOffset_duration_calendar___block_invoke(v48, *(void **)(*((_QWORD *)&v59 + 1) + 8 * v51++));
        }
        while (v49 != v51);
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
        v49 = v48;
      }
      while (v48);
    }

    -[EKEvent originalStartDate](self, "originalStartDate");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      -[EKEvent originalStartDate](self, "originalStartDate");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dateByAddingComponents:toDate:options:", v14, v53, 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent setOriginalStartDate:](self, "setOriginalStartDate:", v54);

    }
  }

}

void __102__EKEvent__propagateChangesToDetachedEvents_originalItemBeforeSave_startDateOffset_duration_calendar___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "_updateModifiedProperties");
  v3 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = *MEMORY[0x1E0D0B2A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatePersistentObjectSkippingProperties:", v5);

}

- (void)_updateSelfAttendeeToMatchSelfAttendee:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[EKCalendarItem attendeesRaw](self, "attendeesRaw", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v9, "isEqualToParticipant:", v4))
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }
  -[EKCalendarItem setSelfAttendee:](self, "setSelfAttendee:", v6);

}

- (void)_duplicateAddedAttachmentsToDetachedEvents:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  id v31;
  void (**v32)(_QWORD, _QWORD);
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKObject changeSet](self, "changeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D0B270];
  v7 = objc_msgSend(v5, "hasUnsavedMultiValueAdditionForKey:", *MEMORY[0x1E0D0B270]);

  if (v7)
  {
    v38 = v4;
    -[EKObject changeSet](self, "changeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "multiValueAdditions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v50 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v17, "uniqueIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v11, "addObject:", v18);
          }
          else
          {
            v19 = EKLogHandle;
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v56 = v17;
              _os_log_error_impl(&dword_1A2318000, v19, OS_LOG_TYPE_ERROR, "Ignoring added attachment without a UUID: %@", buf, 0xCu);
            }
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v14);
    }

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    -[EKCalendarItem attachments](self, "attachments");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v46 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          objc_msgSend(v26, "uniqueIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v11, "containsObject:", v27);

          if (v28)
            objc_msgSend(v20, "addObject:", v26);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v23);
    }

    v29 = objc_msgSend(v20, "count");
    if (v29 != objc_msgSend(v11, "count"))
    {
      v30 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        -[EKEvent _duplicateAddedAttachmentsToDetachedEvents:].cold.1(v30, v20);
    }
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __54__EKEvent__duplicateAddedAttachmentsToDetachedEvents___block_invoke;
    v43[3] = &unk_1E4786EA0;
    v31 = v20;
    v44 = v31;
    v32 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85849D4](v43);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v4 = v38;
    v33 = v38;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v40 != v36)
            objc_enumerationMutation(v33);
          v32[2](v32, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k));
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
      }
      while (v35);
    }

  }
}

void __54__EKEvent__duplicateAddedAttachmentsToDetachedEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "duplicateWithNewIdentity", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addAttachment:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_updateUUIDForNewParticipants
{
  _BOOL4 v3;
  _BOOL4 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  EKEvent *v18;
  EKEvent *v19;
  id v20;
  id v21;
  uint64_t *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  EKEvent *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B278]);
  v4 = -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B330]);
  if (v4 || v3)
  {
    if (v4)
    {
      -[EKCalendarItem organizer](self, "organizer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isNew"))
        v6 = v5;
      else
        v6 = 0;

      if (v3)
      {
LABEL_11:
        -[EKCalendarItem attendeesRaw](self, "attendeesRaw");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        if (v9)
        {
          v10 = v9;
          v7 = 0;
          v11 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v46 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
              if (objc_msgSend(v13, "isNew"))
              {
                if (!v7)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
                  v7 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v7, "addObject:", v13);
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          }
          while (v10);
        }
        else
        {
          v7 = 0;
        }

        if (v6)
          goto LABEL_26;
LABEL_25:
        if (!objc_msgSend(v7, "count"))
        {
LABEL_43:

          return;
        }
LABEL_26:
        v14 = (void *)objc_opt_new();
        v15 = (void *)objc_opt_new();
        -[EKCalendarItem originalItem](self, "originalItem");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
          v18 = (EKEvent *)v16;
        else
          v18 = self;
        v19 = v18;

        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __40__EKEvent__updateUUIDForNewParticipants__block_invoke_2;
        v41[3] = &unk_1E4786F08;
        v41[4] = self;
        v44 = &__block_literal_global_208;
        v20 = v15;
        v42 = v20;
        v21 = v14;
        v43 = v21;
        v35 = v19;
        -[EKCalendarItem _recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:](v19, "_recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:", v41, self);
        v22 = (uint64_t *)MEMORY[0x1E0D0B820];
        if (v6)
        {
          objc_msgSend(v6, "generateSemanticIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            objc_msgSend(v6, "setUUID:", v24);
            objc_msgSend(v6, "updatePersistentValueForKeyIfNeeded:", *v22);
          }

        }
        v34 = v20;
        v36 = v6;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v25 = v7;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v38;
          v29 = *v22;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v38 != v28)
                objc_enumerationMutation(v25);
              v31 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
              objc_msgSend(v31, "generateSemanticIdentifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKeyedSubscript:", v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if (v33)
              {
                objc_msgSend(v31, "setUUID:", v33);
                objc_msgSend(v31, "updatePersistentValueForKeyIfNeeded:", v29);
              }

            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
          }
          while (v27);
        }

        v6 = v36;
        goto LABEL_43;
      }
    }
    else
    {
      v6 = 0;
      if (v3)
        goto LABEL_11;
    }
    v7 = 0;
    if (v6)
      goto LABEL_26;
    goto LABEL_25;
  }
}

void __40__EKEvent__updateUUIDForNewParticipants__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v4 = a3;
  objc_msgSend(v4, "generateSemanticIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v6)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v5);
    }
  }

}

void __40__EKEvent__updateUUIDForNewParticipants__block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if ((id)a1[4] != v3)
  {
    v5 = a1[7];
    v6 = a1[5];
    objc_msgSend(v3, "organizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "attendeesRaw", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          (*(void (**)(void))(a1[7] + 16))();
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (BOOL)isSignificantlyDetached
{
  EKEvent *v2;
  void *v3;

  v2 = self;
  -[EKCalendarItem originalItem](self, "originalItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[EKEvent _isSignificantlyDetachedComparedToMaster:shouldIgnorePartStat:](v2, "_isSignificantlyDetachedComparedToMaster:shouldIgnorePartStat:", v3, 0);

  return (char)v2;
}

- (BOOL)isSignificantlyDetachedIgnoringParticipation
{
  EKEvent *v2;
  void *v3;

  v2 = self;
  -[EKCalendarItem originalItem](self, "originalItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[EKEvent _isSignificantlyDetachedComparedToMaster:shouldIgnorePartStat:](v2, "_isSignificantlyDetachedComparedToMaster:shouldIgnorePartStat:", v3, 1);

  return (char)v2;
}

- (BOOL)_isSignificantlyDetachedComparedToMaster:(id)a3 shouldIgnorePartStat:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  EKEventStatus v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v13 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      v14 = v13;
      -[EKEvent privacyDescription](self, "privacyDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 138543362;
      v52 = v15;
      _os_log_impl(&dword_1A2318000, v14, OS_LOG_TYPE_INFO, "Event %{public}@ is not significantly detached because it is not detached", (uint8_t *)&v51, 0xCu);

    }
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "isPhantom"))
  {
    v8 = (void *)EKLogHandle;
    v9 = 1;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      v10 = v8;
      -[EKEvent privacyDescription](self, "privacyDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 138543362;
      v52 = v11;
      v12 = "Event %{public}@ is significantly detached because its master is a phantom";
LABEL_31:
      _os_log_impl(&dword_1A2318000, v10, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v51, 0xCu);

      goto LABEL_35;
    }
    goto LABEL_35;
  }
  -[EKEvent startDate](self, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent originalStartDate](self, "originalStartDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqualToDate:", v17);

  if ((v18 & 1) != 0)
  {
    -[EKEvent occurrenceStartDate](self, "occurrenceStartDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent occurrenceEndDate](self, "occurrenceEndDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "occurrenceStartDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "occurrenceEndDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent _calculateDurationWithStart:end:allDay:](self, "_calculateDurationWithStart:end:allDay:", v21, v22, objc_msgSend(v7, "occurrenceIsAllDay"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "calendarDateByComponentwiseAddingComponents:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v24, "isEqual:", v20) & 1) == 0)
    {
      v42 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
      {
        v43 = v42;
        -[EKEvent privacyDescription](self, "privacyDescription");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 138543362;
        v52 = v44;
        _os_log_impl(&dword_1A2318000, v43, OS_LOG_TYPE_INFO, "Event %{public}@ is significantly detached because its end date differs", (uint8_t *)&v51, 0xCu);

      }
      v9 = 1;
      goto LABEL_35;
    }

    -[EKEvent locationWithoutPrediction](self, "locationWithoutPrediction");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25
      || (objc_msgSend(v7, "locationWithoutPrediction"), (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[EKEvent locationWithoutPrediction](self, "locationWithoutPrediction");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "locationWithoutPrediction");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqualToString:", v27);

      if (v25)
      {

        if ((v28 & 1) != 0)
          goto LABEL_14;
      }
      else
      {

        if ((v28 & 1) != 0)
          goto LABEL_14;
      }
      v46 = (void *)EKLogHandle;
      v9 = 1;
      if (!os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
        goto LABEL_35;
      v10 = v46;
      -[EKEvent privacyDescription](self, "privacyDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 138543362;
      v52 = v11;
      v12 = "Event %{public}@ is significantly detached because its location differs";
      goto LABEL_31;
    }
LABEL_14:
    -[EKEvent title](self, "title");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29 || (objc_msgSend(v7, "title"), (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[EKEvent title](self, "title");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "title");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqualToString:", v31);

      if (v29)
      {

        if ((v32 & 1) != 0)
          goto LABEL_18;
LABEL_40:
        v47 = (void *)EKLogHandle;
        v9 = 1;
        if (!os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
          goto LABEL_35;
        v10 = v47;
        -[EKEvent privacyDescription](self, "privacyDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 138543362;
        v52 = v11;
        v12 = "Event %{public}@ is significantly detached because its title differs";
        goto LABEL_31;
      }

      if ((v32 & 1) == 0)
        goto LABEL_40;
    }
LABEL_18:
    v33 = -[EKEvent status](self, "status");
    if (v33 != objc_msgSend(v7, "status"))
    {
      v48 = (void *)EKLogHandle;
      v9 = 1;
      if (!os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
        goto LABEL_35;
      v10 = v48;
      -[EKEvent privacyDescription](self, "privacyDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 138543362;
      v52 = v11;
      v12 = "Event %{public}@ is significantly detached because its status differs";
      goto LABEL_31;
    }
    if (!a4)
    {
      if (-[EKCalendarItem isExternallyOrganizedInvitation](self, "isExternallyOrganizedInvitation"))
      {
        v33 = -[EKEvent participationStatus](self, "participationStatus");
        v34 = objc_msgSend(v7, "participationStatus");
        if (v33 != v34)
        {
          v35 = v34;
          v33 = +[EKParticipant needsResponseForParticipantStatus:](EKParticipant, "needsResponseForParticipantStatus:", v33);
          v36 = +[EKParticipant needsResponseForParticipantStatus:](EKParticipant, "needsResponseForParticipantStatus:", v35);
          if (!(_DWORD)v33 || !v36)
          {
            v50 = (void *)EKLogHandle;
            v9 = 1;
            if (!os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
              goto LABEL_35;
            v10 = v50;
            -[EKEvent privacyDescription](self, "privacyDescription");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = 138543362;
            v52 = v11;
            v12 = "Event %{public}@ is significantly detached because it is externally organized and its participation status differs";
            goto LABEL_31;
          }
        }
      }
    }
    -[EKCalendarItem organizer](self, "organizer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37 || (objc_msgSend(v7, "organizer"), (v33 = objc_claimAutoreleasedReturnValue()) != EKEventStatusNone))
    {
      -[EKCalendarItem organizer](self, "organizer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "organizer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "isEqualToParticipant:", v39);

      if (v37)
      {

        if ((v40 & 1) == 0)
          goto LABEL_45;
      }
      else
      {

        if ((v40 & 1) == 0)
        {
LABEL_45:
          v49 = (void *)EKLogHandle;
          v9 = 1;
          if (!os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
            goto LABEL_35;
          v10 = v49;
          -[EKEvent privacyDescription](self, "privacyDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = 138543362;
          v52 = v11;
          v12 = "Event %{public}@ is significantly detached because its organizer differs";
          goto LABEL_31;
        }
      }
    }
LABEL_7:
    v9 = 0;
    goto LABEL_35;
  }
  v41 = (void *)EKLogHandle;
  v9 = 1;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
  {
    v10 = v41;
    -[EKEvent privacyDescription](self, "privacyDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 138543362;
    v52 = v11;
    v12 = "Event %{public}@ is significantly detached because its start date differs";
    goto LABEL_31;
  }
LABEL_35:

  return v9;
}

- (id)_updateMasterDate:(id)a3 forChangeToOccurrenceDate:(id)a4 fromOriginalOccurrenceDate:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[EKEvent originalOccurrenceStartDate](self, "originalOccurrenceStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent occurrenceStartDate](self, "occurrenceStartDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "differenceAsDateComponents:units:", v7, 254);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calendarDateByComponentwiseAddingComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_applyTimeChangesToMaster
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;
  EKEvent *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  EKEvent *v18;

  v3 = *MEMORY[0x1E0D0B3D0];
  v4 = -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B3D0]);
  v5 = *MEMORY[0x1E0D0B680];
  v6 = -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B680]);
  v7 = v6;
  if (v4 || v6)
  {
    v8 = [EKEvent alloc];
    -[EKObject persistentObject](self, "persistentObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[EKEvent initWithPersistentObject:](v8, "initWithPersistentObject:", v9);

    if (v4)
    {
      -[EKEvent occurrenceStartDate](v18, "occurrenceStartDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent occurrenceStartDate](self, "occurrenceStartDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent originalOccurrenceStartDate](self, "originalOccurrenceStartDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent _updateMasterDate:forChangeToOccurrenceDate:fromOriginalOccurrenceDate:](self, "_updateMasterDate:forChangeToOccurrenceDate:fromOriginalOccurrenceDate:", v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent setStartDateRaw:](v18, "setStartDateRaw:", v13);

      -[EKObject updatePersistentValueForKeyIfNeeded:](v18, "updatePersistentValueForKeyIfNeeded:", v3);
    }
    if (v7)
    {
      -[EKEvent occurrenceEndDate](v18, "occurrenceEndDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent occurrenceEndDate](self, "occurrenceEndDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent originalOccurrenceEndDate](self, "originalOccurrenceEndDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent _updateMasterDate:forChangeToOccurrenceDate:fromOriginalOccurrenceDate:](self, "_updateMasterDate:forChangeToOccurrenceDate:fromOriginalOccurrenceDate:", v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent setEndDateRaw:](v18, "setEndDateRaw:", v17);

      -[EKObject updatePersistentValueForKeyIfNeeded:](v18, "updatePersistentValueForKeyIfNeeded:", v5);
    }

  }
}

- (void)_clearExceptionDatesAndUpdateDetachedOriginalDates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[EKEvent isDetached](self, "isDetached"))
  {
    -[EKCalendarItem originalItem](self, "originalItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_clearExceptionDatesAndUpdateDetachedOriginalDates:", v4);
  }
  else
  {
    -[EKCalendarItem setExceptionDates:](self, "setExceptionDates:", 0);
    if (!-[EKEvent isAllDay](self, "isAllDay"))
    {
      -[EKCalendarItem detachedItems](self, "detachedItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        if (-[EKEvent isFloating](self, "isFloating"))
          objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
        else
          -[EKCalendarItem timeZone](self, "timeZone");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEvent startDateRaw](self, "startDateRaw");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timeIntervalSinceReferenceDate");
        MEMORY[0x1A8584278](v7);

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v23 = v6;
        obj = v6;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v30 != v11)
                objc_enumerationMutation(obj);
              v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              if (objc_msgSend(v13, "isEqual:", v4))
                v14 = v4;
              else
                v14 = v13;
              v15 = v14;
              objc_msgSend(v15, "originalStartDate");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "timeIntervalSinceReferenceDate");
              MEMORY[0x1A8584278](v7);
              v17 = (void *)MEMORY[0x1E0C99D68];
              CalGregorianDateGetAbsoluteTimeWithFallbackToDefaultTimeZone();
              objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v15, "setOriginalStartDate:", v18);
            }
            v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
          }
          while (v10);
        }

        v6 = v23;
      }

    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "invalidateCachedEndDate");
        }
        v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v20);
    }
  }

}

- (BOOL)_attemptToUpdateComplexRecurrenceRule
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  EKRecurrenceRule *v16;
  EKRecurrenceDayOfWeek *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (**v24)(_QWORD);
  uint64_t i;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  EKRecurrenceRule *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  EKRecurrenceRule *v33;
  id v34;
  EKRecurrenceRule *v35;
  BOOL v36;
  EKRecurrenceDayOfWeek *v37;
  EKRecurrenceDayOfWeek *v38;
  uint64_t v39;
  id v40;
  EKRecurrenceRule *v41;
  void *v42;
  void *v43;
  EKRecurrenceRule *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  EKRecurrenceRule *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  EKRecurrenceRule *v56;
  EKEvent *v57;
  EKRecurrenceDayOfWeek *v58;
  uint64_t v59;
  EKRecurrenceRule *v60;
  uint64_t v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  EKRecurrenceRule *v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  void *v78;
  EKRecurrenceRule *v79;
  EKRecurrenceRule *v80;
  void *v81;
  id v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  void *v87;
  void (**v88)(_QWORD);
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  EKRecurrenceRule *v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  void *v99;
  id v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  EKRecurrenceRule *v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  void *v111;
  EKRecurrenceRule *v112;
  void (**v113)(_QWORD);
  void *v114;
  void *v115;
  void *v116;
  EKRecurrenceRule *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  EKRecurrenceRule *v121;
  void *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  EKRecurrenceRule *v128;
  uint64_t v129;
  id v130;
  void *v131;
  void *v132;
  EKRecurrenceRule *v133;
  void (**v134)(_QWORD);
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  EKRecurrenceRule *v140;
  EKRecurrenceRule *v141;
  void (**v142)(_QWORD);
  void (**v143)(_QWORD);
  uint64_t v144;
  uint64_t v145;
  id v146;
  EKRecurrenceRule *v147;
  void *v148;
  id v149;
  uint64_t v150;
  id v151;
  void *v152;
  id v153;
  void *v154;
  id v155;
  id v156;
  id v157;
  void *v158;
  EKRecurrenceRule *v159;
  uint64_t v160;
  id v161;
  uint64_t v162;
  EKRecurrenceDayOfWeek *v163;
  EKRecurrenceRule *v164;
  EKRecurrenceDayOfWeek *v165;
  id v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  _QWORD v179[4];
  id v180;
  id v181;
  id v182;
  EKEvent *v183;
  id v184;
  uint64_t v185;
  uint64_t v186;
  _BYTE v187[128];
  uint64_t v188;
  uint64_t v189;
  void *v190;
  _BYTE v191[128];
  uint64_t v192;
  _BYTE v193[128];
  _QWORD v194[3];

  v194[1] = *MEMORY[0x1E0C80C00];
  if (-[EKCalendarItem hasComplexRecurrence](self, "hasComplexRecurrence"))
  {
    -[EKEvent singleRecurrenceRule](self, "singleRecurrenceRule");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0C99D48];
    -[EKCalendarItem timeZone](self, "timeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "CalGregorianCalendarForTimeZone:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setFirstWeekday:", 1);
    -[EKEvent originalOccurrenceStartDate](self, "originalOccurrenceStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components:fromDate:", 5656, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKEvent startDate](self, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components:fromDate:", 5656, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v179[0] = MEMORY[0x1E0C809B0];
    v179[1] = 3221225472;
    v179[2] = __48__EKEvent__attemptToUpdateComplexRecurrenceRule__block_invoke;
    v179[3] = &unk_1E4786F30;
    v12 = v3;
    v180 = v12;
    v13 = v11;
    v181 = v13;
    v166 = v9;
    v182 = v166;
    v183 = self;
    v14 = v6;
    v184 = v14;
    v15 = (void (**)(_QWORD))MEMORY[0x1A85849D4](v179);
    if (objc_msgSend(v12, "frequency") == 1)
    {
      objc_msgSend(v12, "daysOfTheWeek");
      v16 = (EKRecurrenceRule *)objc_claimAutoreleasedReturnValue();
      if (!-[EKRecurrenceRule count](v16, "count"))
      {
        v36 = 1;
LABEL_77:

        goto LABEL_78;
      }
      v155 = v14;
      v17 = -[EKRecurrenceDayOfWeek initWithDayOfTheWeek:weekNumber:]([EKRecurrenceDayOfWeek alloc], "initWithDayOfTheWeek:weekNumber:", objc_msgSend(v13, "weekday"), 0);
      v18 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v163 = v17;
      v194[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v194, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithArray:", v19);

      v177 = 0u;
      v178 = 0u;
      v175 = 0u;
      v176 = 0u;
      v16 = v16;
      v21 = -[EKRecurrenceRule countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v175, v193, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v176;
        v151 = v12;
        while (2)
        {
          v24 = v15;
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v176 != v23)
              objc_enumerationMutation(v16);
            v26 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * i);
            if (objc_msgSend(v26, "weekNumber")
              || (v27 = objc_msgSend(v26, "dayOfTheWeek"), v27 == objc_msgSend(v13, "weekday")))
            {
              v36 = 0;
              v35 = v16;
              v15 = v24;
              v12 = v151;
              v14 = v155;
              v37 = v163;
              v34 = v20;
              goto LABEL_75;
            }
            v28 = objc_msgSend(v26, "dayOfTheWeek");
            if (v28 != objc_msgSend(v166, "weekday"))
              objc_msgSend(v20, "addObject:", v26);
          }
          v22 = -[EKRecurrenceRule countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v175, v193, 16);
          v15 = v24;
          v12 = v151;
          if (v22)
            continue;
          break;
        }
      }

      objc_msgSend(v20, "sortUsingComparator:", &__block_literal_global_216);
      v29 = [EKRecurrenceRule alloc];
      v30 = objc_msgSend(v12, "frequency");
      v31 = objc_msgSend(v12, "interval");
      objc_msgSend(v12, "recurrenceEnd");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v29;
      v34 = v20;
      v35 = -[EKRecurrenceRule initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:](v33, "initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", v30, v31, v20, 0, 0, 0, 0, 0, v32);

      -[EKEvent setRecurrenceRule:](self, "setRecurrenceRule:", v35);
      v36 = 1;
      v14 = v155;
      v37 = v163;
      goto LABEL_75;
    }
    if (objc_msgSend(v12, "frequency") == 2)
    {
      objc_msgSend(v12, "daysOfTheWeek");
      v16 = (EKRecurrenceRule *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "daysOfTheMonth");
      v38 = (EKRecurrenceDayOfWeek *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPositions");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      if (-[EKRecurrenceDayOfWeek count](v38, "count"))
      {
        v146 = v34;
        v152 = v12;
        v142 = v15;
        v156 = v14;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "day"));
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = objc_alloc(MEMORY[0x1E0C99DE8]);
        v41 = (EKRecurrenceRule *)v39;
        v192 = v39;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v192, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)objc_msgSend(v40, "initWithArray:", v42);

        v173 = 0u;
        v174 = 0u;
        v171 = 0u;
        v172 = 0u;
        v44 = v38;
        v45 = -[EKRecurrenceRule countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v171, v191, 16);
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v172;
          v140 = v16;
          while (2)
          {
            for (j = 0; j != v46; ++j)
            {
              if (*(_QWORD *)v172 != v47)
                objc_enumerationMutation(v44);
              v49 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * j);
              v50 = objc_msgSend(v49, "integerValue");
              if (v50 == objc_msgSend(v13, "day"))
              {
                v36 = 0;
                v37 = (EKRecurrenceDayOfWeek *)v44;
                v56 = v44;
                v16 = v140;
                v12 = v152;
                goto LABEL_54;
              }
              v51 = objc_msgSend(v49, "integerValue");
              if (v51 != objc_msgSend(v166, "day"))
                objc_msgSend(v43, "addObject:", v49);
            }
            v46 = -[EKRecurrenceRule countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v171, v191, 16);
            v16 = v140;
            if (v46)
              continue;
            break;
          }
        }
        v52 = v44;

        objc_msgSend(v43, "sortUsingComparator:", &__block_literal_global_218);
        v164 = [EKRecurrenceRule alloc];
        v12 = v152;
        v53 = objc_msgSend(v152, "frequency");
        v54 = objc_msgSend(v152, "interval");
        objc_msgSend(v152, "recurrenceEnd");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = -[EKRecurrenceRule initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:](v164, "initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", v53, v54, 0, v43, 0, 0, 0, 0, v55);

        v57 = self;
        v37 = (EKRecurrenceDayOfWeek *)v52;
        -[EKEvent setRecurrenceRule:](v57, "setRecurrenceRule:", v56);
        v36 = 1;
LABEL_54:

        v14 = v156;
        v15 = v142;
        v34 = v146;
        v35 = v41;
        goto LABEL_75;
      }
      v165 = v38;
      if (-[EKRecurrenceRule count](v16, "count") == 1)
      {
        v80 = [EKRecurrenceRule alloc];
        v144 = objc_msgSend(v12, "frequency");
        v139 = objc_msgSend(v12, "interval");
        v15[2](v15);
        v149 = v34;
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        v190 = v158;
        v36 = 1;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v190, 1);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "recurrenceEnd");
        v82 = v14;
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[EKRecurrenceRule initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:](v80, "initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", v144, v139, v81, 0, 0, 0, 0, 0, v83);

        v14 = v82;
        v34 = v149;
        -[EKEvent setRecurrenceRule:](self, "setRecurrenceRule:", v35);
LABEL_74:
        v37 = v165;
        goto LABEL_75;
      }
      if (-[EKRecurrenceRule count](v16, "count") == 7 && objc_msgSend(v34, "count") == 1)
      {
        v148 = v34;
        objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend(v93, "integerValue");

        if (v94 > 0)
          goto LABEL_62;
        objc_msgSend(v148, "objectAtIndexedSubscript:", 0);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v124 = objc_msgSend(v123, "integerValue");

        if (v124 < 0)
        {
          -[EKEvent startDate](self, "startDate");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = objc_msgSend(v14, "daysInMonthContainingDate:", v125);

          v127 = v126 - objc_msgSend(v13, "day");
          if (v127 <= 1)
          {
            v128 = [EKRecurrenceRule alloc];
            v162 = objc_msgSend(v12, "frequency");
            v145 = objc_msgSend(v12, "interval");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ~v127);
            v129 = objc_claimAutoreleasedReturnValue();
            v130 = v14;
            v131 = (void *)v129;
            v189 = v129;
            v132 = v12;
            v133 = v16;
            v134 = v15;
            v135 = v130;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v189, 1);
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v132, "recurrenceEnd");
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            v138 = -[EKRecurrenceRule initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:](v128, "initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", v162, v145, v133, 0, 0, 0, 0, v136, v137);

            -[EKEvent setRecurrenceRule:](self, "setRecurrenceRule:", v138);
            v36 = 1;
            v14 = v135;
            v15 = v134;
            v16 = v133;
            v12 = v132;
            v35 = (EKRecurrenceRule *)v138;
            goto LABEL_63;
          }
LABEL_62:
          v95 = [EKRecurrenceRule alloc];
          v96 = objc_msgSend(v12, "frequency");
          v97 = objc_msgSend(v12, "interval");
          objc_msgSend(v12, "recurrenceEnd");
          v98 = v14;
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = -[EKRecurrenceRule initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:](v95, "initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", v96, v97, 0, 0, 0, 0, 0, 0, v99);

          v14 = v98;
          -[EKEvent setRecurrenceRule:](self, "setRecurrenceRule:", v35);
          v36 = 1;
LABEL_63:
          v37 = v165;
          v34 = v148;
LABEL_75:

          goto LABEL_76;
        }
LABEL_81:
        v36 = 0;
        v37 = v165;
        v34 = v148;
        goto LABEL_76;
      }
      goto LABEL_66;
    }
    if (objc_msgSend(v12, "frequency") != 3)
    {
      v36 = 0;
LABEL_78:

      return v36;
    }
    objc_msgSend(v12, "daysOfTheWeek");
    v16 = (EKRecurrenceRule *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPositions");
    v58 = (EKRecurrenceDayOfWeek *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "monthsOfTheYear");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v165 = v58;
    if (!-[EKRecurrenceDayOfWeek count](v58, "count")
      || -[EKRecurrenceRule count](v16, "count") == 1
      || -[EKRecurrenceRule count](v16, "count") == 7)
    {
      v59 = objc_msgSend(v13, "month");
      if (v59 != objc_msgSend(v166, "month"))
      {
        v153 = v12;
        v157 = v14;
        v60 = v16;
        v143 = v15;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "month"));
        v61 = objc_claimAutoreleasedReturnValue();
        v62 = objc_alloc(MEMORY[0x1E0C99DE8]);
        v147 = (EKRecurrenceRule *)v61;
        v188 = v61;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v188, 1);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = (void *)objc_msgSend(v62, "initWithArray:", v63);

        v169 = 0u;
        v170 = 0u;
        v167 = 0u;
        v168 = 0u;
        v34 = v34;
        v65 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v167, v187, 16);
        if (v65)
        {
          v66 = v65;
          v67 = *(_QWORD *)v168;
          while (2)
          {
            for (k = 0; k != v66; ++k)
            {
              if (*(_QWORD *)v168 != v67)
                objc_enumerationMutation(v34);
              v69 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * k);
              v70 = objc_msgSend(v69, "integerValue");
              if (v70 == objc_msgSend(v13, "month"))
              {

                v36 = 0;
                v15 = v143;
                v35 = v147;
                v16 = v60;
                v12 = v153;
                v14 = v157;
                goto LABEL_74;
              }
              v71 = objc_msgSend(v69, "integerValue");
              if (v71 != objc_msgSend(v166, "month"))
                objc_msgSend(v64, "addObject:", v69);
            }
            v66 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v167, v187, 16);
            if (v66)
              continue;
            break;
          }
        }

        objc_msgSend(v64, "sortUsingComparator:", &__block_literal_global_219);
        v34 = v64;

        v15 = v143;
        v16 = v60;
        v12 = v153;
        v14 = v157;
      }
      if (-[EKRecurrenceRule count](v16, "count") == 7 && -[EKRecurrenceDayOfWeek count](v165, "count") == 1)
      {
        v148 = v34;
        -[EKRecurrenceDayOfWeek objectAtIndexedSubscript:](v165, "objectAtIndexedSubscript:", 0);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v72, "integerValue");

        if (v73 <= 0)
        {
          -[EKRecurrenceDayOfWeek objectAtIndexedSubscript:](v165, "objectAtIndexedSubscript:", 0);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = objc_msgSend(v102, "integerValue");

          if ((v103 & 0x8000000000000000) == 0)
            goto LABEL_81;
          -[EKEvent startDate](self, "startDate");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = objc_msgSend(v14, "daysInMonthContainingDate:", v104);

          v106 = v105 - objc_msgSend(v13, "day");
          if (v106 <= 1)
          {
            v107 = [EKRecurrenceRule alloc];
            v108 = objc_msgSend(v12, "frequency");
            v160 = objc_msgSend(v12, "interval");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ~v106);
            v109 = objc_claimAutoreleasedReturnValue();
            v110 = v14;
            v111 = (void *)v109;
            v186 = v109;
            v154 = v12;
            v112 = v16;
            v113 = v15;
            v114 = v110;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v186, 1);
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v154, "recurrenceEnd");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = -[EKRecurrenceRule initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:](v107, "initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", v108, v160, v112, 0, v148, 0, 0, v115, v116);

            v34 = v148;
            -[EKEvent setRecurrenceRule:](self, "setRecurrenceRule:", v35);
            v36 = 1;
            v14 = v114;
            v15 = v113;
            v16 = v112;
            v12 = v154;
            goto LABEL_74;
          }
        }
        v74 = [EKRecurrenceRule alloc];
        v75 = objc_msgSend(v12, "frequency");
        v76 = objc_msgSend(v12, "interval");
        objc_msgSend(v12, "recurrenceEnd");
        v77 = v14;
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v74;
        v34 = v148;
        v35 = -[EKRecurrenceRule initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:](v79, "initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", v75, v76, 0, 0, v148, 0, 0, 0, v78);

        v14 = v77;
        goto LABEL_73;
      }
      if (-[EKRecurrenceRule count](v16, "count") == 1)
      {
        v159 = [EKRecurrenceRule alloc];
        v150 = objc_msgSend(v12, "frequency");
        v84 = objc_msgSend(v12, "interval");
        v15[2](v15);
        v85 = objc_claimAutoreleasedReturnValue();
        v86 = v14;
        v87 = (void *)v85;
        v185 = v85;
        v141 = v16;
        v88 = v15;
        v89 = v86;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v185, 1);
        v90 = v34;
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "recurrenceEnd");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[EKRecurrenceRule initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:](v159, "initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", v150, v84, v91, 0, v90, 0, 0, 0, v92);

        v34 = v90;
        -[EKEvent setRecurrenceRule:](self, "setRecurrenceRule:", v35);
        v36 = 1;
        v14 = v89;
        v15 = v88;
        v16 = v141;
        goto LABEL_74;
      }
      if (!-[EKRecurrenceRule count](v16, "count"))
      {
        v100 = v34;
        v101 = objc_msgSend(v13, "month");
        if (v101 == objc_msgSend(v166, "month"))
        {
          v36 = 1;
          v37 = v165;
          v34 = v100;
          goto LABEL_76;
        }
        v117 = [EKRecurrenceRule alloc];
        v118 = objc_msgSend(v12, "frequency");
        v119 = objc_msgSend(v12, "interval");
        objc_msgSend(v12, "recurrenceEnd");
        v161 = v14;
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = v117;
        v34 = v100;
        v35 = -[EKRecurrenceRule initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:](v121, "initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", v118, v119, v16, 0, v100, 0, 0, 0, v120);

        v14 = v161;
LABEL_73:
        -[EKEvent setRecurrenceRule:](self, "setRecurrenceRule:", v35);
        v36 = 1;
        goto LABEL_74;
      }
    }
LABEL_66:
    v36 = 0;
    v37 = v165;
LABEL_76:

    goto LABEL_77;
  }
  return 1;
}

EKRecurrenceDayOfWeek *__48__EKEvent__attemptToUpdateComplexRecurrenceRule__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  EKRecurrenceDayOfWeek *v5;
  uint64_t v6;
  uint64_t v7;
  EKRecurrenceDayOfWeek *v8;
  uint64_t v9;
  EKRecurrenceDayOfWeek *v10;
  uint64_t v11;
  EKRecurrenceDayOfWeek *v12;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  EKRecurrenceDayOfWeek *v22;
  uint64_t v23;
  uint64_t v24;
  EKRecurrenceDayOfWeek *v25;
  uint64_t v26;
  EKRecurrenceDayOfWeek *v27;

  objc_msgSend(a1[4], "daysOfTheWeek");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(a1[5], "weekOfMonth");
  if (v4 != objc_msgSend(a1[6], "weekOfMonth"))
  {
    if (objc_msgSend(v3, "weekNumber") >= 1)
    {
      v10 = [EKRecurrenceDayOfWeek alloc];
      v11 = objc_msgSend(a1[5], "weekday");
      v7 = objc_msgSend(a1[5], "weekdayOrdinal");
      v8 = v10;
      v9 = v11;
      goto LABEL_5;
    }
    v14 = objc_msgSend(a1[5], "month");
    objc_msgSend(a1[7], "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = a1[8];
    objc_msgSend(a1[7], "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "components:fromDate:", 5656, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "month") == v14)
    {
      v19 = 0;
      do
      {
        v20 = v15;
        v21 = v18;
        objc_msgSend(a1[8], "dateByAddingUnit:value:toDate:options:", 4096, 1, v15, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1[8], "components:fromDate:", 5656, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v18, "month") == v14)
          ++v19;
      }
      while (objc_msgSend(v18, "month") == v14);
      if (v19 > 1)
      {
        v22 = [EKRecurrenceDayOfWeek alloc];
        v23 = objc_msgSend(a1[5], "weekday");
        v24 = objc_msgSend(a1[5], "weekdayOrdinal");
        v25 = v22;
        v26 = v23;
LABEL_16:
        v12 = -[EKRecurrenceDayOfWeek initWithDayOfTheWeek:weekNumber:](v25, "initWithDayOfTheWeek:weekNumber:", v26, v24);

        goto LABEL_6;
      }
    }
    else
    {
      v19 = 0;
    }
    v27 = [EKRecurrenceDayOfWeek alloc];
    v26 = objc_msgSend(a1[5], "weekday");
    v24 = ~v19;
    v25 = v27;
    goto LABEL_16;
  }
  v5 = [EKRecurrenceDayOfWeek alloc];
  v6 = objc_msgSend(a1[5], "weekday");
  v7 = objc_msgSend(v3, "weekNumber");
  v8 = v5;
  v9 = v6;
LABEL_5:
  v12 = -[EKRecurrenceDayOfWeek initWithDayOfTheWeek:weekNumber:](v8, "initWithDayOfTheWeek:weekNumber:", v9, v7);
LABEL_6:

  return v12;
}

uint64_t __48__EKEvent__attemptToUpdateComplexRecurrenceRule__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "dayOfTheWeek"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "dayOfTheWeek");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

uint64_t __48__EKEvent__attemptToUpdateComplexRecurrenceRule__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __48__EKEvent__attemptToUpdateComplexRecurrenceRule__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_filterExceptionDatesAndDetachments
{
  void *v3;
  char v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  EKRecurrenceGenerator *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t m;
  void *v56;
  uint64_t v57;
  EKRecurrenceGenerator *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  -[EKObject changeSet](self, "changeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasUnsavedMultiValueRemovalForKey:", *MEMORY[0x1E0D0B350]);

  if ((v4 & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v79;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v79 != v9)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * i), "dirtyStateMayAffectExceptionDates") & 1) != 0)
          {
            v5 = 1;
            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
        if (v8)
          continue;
        break;
      }
    }
    v5 = 0;
LABEL_13:

  }
  -[EKCalendarItem exceptionDates](self, "exceptionDates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem detachedItems](self, "detachedItems");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v11)
  {
    v14 = 0;
    if (v12)
      goto LABEL_16;
LABEL_18:
    v15 = 0;
    goto LABEL_19;
  }
  v14 = objc_msgSend(v11, "count") != 0;
  if (!v13)
    goto LABEL_18;
LABEL_16:
  v15 = objc_msgSend(v13, "count") != 0;
LABEL_19:
  if ((v5 & v14 & 1) != 0 || v15)
  {
    -[EKEvent startDateRaw](self, "startDateRaw");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v11, "allObjects");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendarItem exceptionDatesAdjustedForFloatingEvents](self, "exceptionDatesAdjustedForFloatingEvents");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "allObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = (void *)MEMORY[0x1E0C9AA60];
      v63 = (void *)MEMORY[0x1E0C9AA60];
    }
    v62 = v18;
    objc_msgSend(v18, "valueForKeyPath:", CFSTR("@max.self"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v64 = (void *)v16;
    if (v19)
      v21 = (void *)v19;
    else
      v21 = (void *)v16;
    v65 = v21;

    v22 = (void *)MEMORY[0x1E0C99E08];
    -[EKCalendarItem detachedItems](self, "detachedItems");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    -[EKCalendarItem detachedItems](self, "detachedItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v75;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v75 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
          objc_msgSend(v30, "originalStartDate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v30, v31);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
      }
      while (v27);
    }

    objc_msgSend(v24, "allKeys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "valueForKeyPath:", CFSTR("@max.self"));
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    v35 = v64;
    if (v33)
      v36 = (void *)v33;
    else
      v36 = v64;
    v37 = v36;

    objc_msgSend(v65, "laterDate:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "dateByAddingTimeInterval:", 1.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKCalendarItem timeZone](self, "timeZone");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_alloc_init(EKRecurrenceGenerator);
    LOBYTE(v57) = 1;
    v42 = -[EKRecurrenceGenerator copyOccurrenceDatesWithEKEvent:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:](v41, "copyOccurrenceDatesWithEKEvent:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:", self, v64, v39, v40, 0, 0, v57);
    if (objc_msgSend(v42, "count"))
    {
      v58 = v41;
      v59 = v40;
      v60 = v39;
      v61 = v37;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v43 = v63;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v71;
        do
        {
          for (k = 0; k != v45; ++k)
          {
            if (*(_QWORD *)v71 != v46)
              objc_enumerationMutation(v43);
            v48 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * k);
            if ((objc_msgSend(v42, "containsObject:", v48) & 1) == 0)
              -[EKCalendarItem _removeExceptionDate:](self, "_removeExceptionDate:", v48);
          }
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
        }
        while (v45);
      }

      objc_msgSend(v24, "allKeys");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent _leftoversInDates:withGeneratedDates:](self, "_leftoversInDates:withGeneratedDates:", v49, v42);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v51 = v50;
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
      if (v52)
      {
        v53 = v52;
        v54 = *(_QWORD *)v67;
        do
        {
          for (m = 0; m != v53; ++m)
          {
            if (*(_QWORD *)v67 != v54)
              objc_enumerationMutation(v51);
            objc_msgSend(v24, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * m));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKCalendarItem _removeDetachedItem:](self, "_removeDetachedItem:", v56);

          }
          v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
        }
        while (v53);
      }

      v35 = v64;
      v39 = v60;
      v37 = v61;
      v41 = v58;
      v40 = v59;
    }
    else
    {
      -[EKCalendarItem setExceptionDates:](self, "setExceptionDates:", 0);
      -[EKCalendarItem setDetachedItems:](self, "setDetachedItems:", 0);
    }

  }
}

- (id)_leftoversInDates:(id)a3 withGeneratedDates:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  objc_msgSend(v5, "setWithArray:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v9, "intersectSet:", v7);
  objc_msgSend(v8, "minusSet:", v9);

  return v8;
}

- (void)_removeInvalidAlarmsDuringSave
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  double v44;
  void *v45;
  uint64_t v46;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (!-[EKObject isPropertyUnavailable:](self, "isPropertyUnavailable:", *MEMORY[0x1E0D0B268]))
  {
    -[EKCalendarItem alarms](self, "alarms");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      -[EKEvent constraints](self, "constraints");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "supportsAlarmTriggerDates");

      if ((v5 & 1) == 0)
      {
        -[EKCalendarItem alarms](self, "alarms");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v6, "copy");

        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v60;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v60 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
              if (objc_msgSend(v13, "isAbsolute"))
              {
                -[EKCalendarItem removeAlarm:](self, "removeAlarm:", v13);
                -[EKEvent constraints](self, "constraints");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v14, "supportsAlarmTriggerIntervals");

                if (v15)
                {
                  objc_msgSend(v13, "absoluteDate");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  -[EKEvent startDate](self, "startDate");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "timeIntervalSinceDate:", v17);
                  v19 = v18;

                  +[EKAlarm alarmWithRelativeOffset:](EKAlarm, "alarmWithRelativeOffset:", v19);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  -[EKCalendarItem addAlarm:](self, "addAlarm:", v20);

                }
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
          }
          while (v10);
        }

      }
      -[EKEvent constraints](self, "constraints");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "supportsAlarmTriggerIntervals");

      if ((v22 & 1) == 0)
      {
        -[EKCalendarItem alarms](self, "alarms");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v23, "copy");

        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v25 = v24;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v56;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v56 != v28)
                objc_enumerationMutation(v25);
              v30 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
              if ((objc_msgSend(v30, "isAbsolute") & 1) == 0)
                -[EKCalendarItem removeAlarm:](self, "removeAlarm:", v30);
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
          }
          while (v27);
        }

      }
      -[EKEvent constraints](self, "constraints");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "supportsAlarmsTriggeringAfterStartDate");

      if ((v32 & 1) == 0)
      {
        -[EKCalendarItem alarms](self, "alarms");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v33, "copy");

        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v35 = v34;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
        if (!v36)
          goto LABEL_39;
        v37 = v36;
        v38 = *(_QWORD *)v52;
        while (1)
        {
          for (k = 0; k != v37; ++k)
          {
            if (*(_QWORD *)v52 != v38)
              objc_enumerationMutation(v35);
            v40 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * k);
            if (!objc_msgSend(v40, "isAbsolute", (_QWORD)v51))
            {
              objc_msgSend(v40, "relativeOffset");
              if (v44 <= 0.0)
                continue;
LABEL_36:
              -[EKCalendarItem removeAlarm:](self, "removeAlarm:", v40);
              continue;
            }
            objc_msgSend(v40, "absoluteDate");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKEvent startDate](self, "startDate");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v41, "compare:", v42);

            if (v43 == 1)
              goto LABEL_36;
          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
          if (!v37)
          {
LABEL_39:

            break;
          }
        }
      }
      -[EKEvent constraints](self, "constraints", (_QWORD)v51);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v46) = objc_msgSend(v45, "maxAlarmsAllowed");

      -[EKCalendarItem sortedAlarms](self, "sortedAlarms");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "count");
      if ((v46 & 0x80000000) == 0)
      {
        v49 = v48;
        v46 = v46;
        if (v48 > v46)
        {
          do
          {
            objc_msgSend(v47, "objectAtIndexedSubscript:", v46);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKCalendarItem removeAlarm:](self, "removeAlarm:", v50);

            ++v46;
          }
          while (v49 != v46);
        }
      }

    }
  }
}

- (void)_adjustRecurrenceRulesAfterMovingOrCopyingFromCalendar:(id)a3 toCalendar:(id)a4 notes:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v41 = a4;
  v7 = a5;
  if (!-[EKCalendarItem hasRecurrenceRules](self, "hasRecurrenceRules"))
    goto LABEL_29;
  -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "maxRecurrencesAllowed");

  v11 = objc_msgSend(v8, "count");
  if ((v10 & 0x80000000) == 0)
  {
    v12 = v11 - v10;
    if (v11 > v10)
    {
      do
      {
        -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[EKCalendarItem removeRecurrenceRule:](self, "removeRecurrenceRule:", v14);
        --v12;
      }
      while (v12);
    }
  }
  objc_msgSend(v8, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "frequency") != 2)
  {
LABEL_11:
    if (objc_msgSend(v15, "frequency") == 3)
    {
      objc_msgSend(v15, "monthsOfTheYear");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v20, "count") <= 1)
      {

      }
      else
      {
        objc_msgSend(v41, "constraints");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "prohibitsMultipleMonthsInYearlyRecurrence");

        if (v22)
        {
          v19 = (void *)objc_msgSend(v15, "copy");
          objc_msgSend(v19, "setMonthsOfTheYear:", 0);
          if (!v19)
            goto LABEL_24;
LABEL_21:
          if (v7)
          {
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("repeat"), &stru_1E4789A58, 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            -[EKEvent startDate](self, "startDate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "humanReadableDescriptionWithStartDate:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("\n%@:%@"), v26, v28);

          }
          -[EKCalendarItem removeRecurrenceRule:](self, "removeRecurrenceRule:", v15);
          -[EKCalendarItem addRecurrenceRule:](self, "addRecurrenceRule:", v19);

          goto LABEL_24;
        }
      }
    }
    if (objc_msgSend(v15, "frequency") != 3)
      goto LABEL_24;
    if (objc_msgSend(v15, "interval") < 2)
      goto LABEL_24;
    objc_msgSend(v41, "constraints");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "prohibitsYearlyRecurrenceInterval");

    if (!v24)
      goto LABEL_24;
    v19 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v19, "setInterval:", 1);
    if (!v19)
      goto LABEL_24;
    goto LABEL_21;
  }
  objc_msgSend(v15, "daysOfTheMonth");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v16, "count") <= 1)
  {

    goto LABEL_11;
  }
  objc_msgSend(v41, "constraints");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "prohibitsMultipleDaysInMonthlyRecurrence");

  if (!v18)
    goto LABEL_11;
  v19 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v19, "setDaysOfTheMonth:", 0);
  if (v19)
    goto LABEL_21;
LABEL_24:
  objc_msgSend(v41, "constraints");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "requiresOccurrencesConformToRecurrenceRule");

  if (v30)
  {
    -[EKEvent suggestedStartDateForCurrentRecurrenceRule](self, "suggestedStartDateForCurrentRecurrenceRule");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent startDate](self, "startDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isEqualToDate:", v31);

    if ((v33 & 1) == 0)
    {
      -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent startDate](self, "startDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "timeIntervalSinceDate:", v35);
      v37 = v36;

      -[EKEvent setStartDate:](self, "setStartDate:", v31);
      v38 = (void *)MEMORY[0x1E0C99D68];
      -[EKEvent startDate](self, "startDate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "dateWithTimeInterval:sinceDate:", v39, v37);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent setEndDateUnadjustedForLegacyClients:](self, "setEndDateUnadjustedForLegacyClients:", v40);

    }
  }

LABEL_29:
}

- (void)_adjustAfterMovingOrCopyingFromOldCalendar:(id)a3 toNewCalendar:(id)a4 cachedConstraintsForOldCalendar:(id)a5 savingItem:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[EKEvent _adjustAttendeesAfterMovingOrCopyingFromCalendar:toCalendar:](self, "_adjustAttendeesAfterMovingOrCopyingFromCalendar:toCalendar:", v13, v12);
  -[EKEvent _adjustPrivacyAfterMovingOrCopyingFromCalendar:toCalendar:cachedConstraintsForOldCalendar:savingItem:](self, "_adjustPrivacyAfterMovingOrCopyingFromCalendar:toCalendar:cachedConstraintsForOldCalendar:savingItem:", v13, v12, v11, v10);
  -[EKEvent _adjustAvailabilityAfterMovingOrCopyingFromCalendar:toCalendar:](self, "_adjustAvailabilityAfterMovingOrCopyingFromCalendar:toCalendar:", v13, v12);
  -[EKEvent _adjustScheduleAgentAfterMovingOrCopyingFromCalendar:toCalendar:cachedConstraintsForOldCalendar:](self, "_adjustScheduleAgentAfterMovingOrCopyingFromCalendar:toCalendar:cachedConstraintsForOldCalendar:", v13, v12, v11);
  -[EKEvent _adjustAttachmentsAfterMovingOrCopyingFromCalendar:toCalendar:cachedConstraintsForOldCalendar:savingItem:](self, "_adjustAttachmentsAfterMovingOrCopyingFromCalendar:toCalendar:cachedConstraintsForOldCalendar:savingItem:", v13, v12, v11, v10);

  v21 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[EKEvent _adjustURLAfterMovingOrCopyingToCalendar:notes:](self, "_adjustURLAfterMovingOrCopyingToCalendar:notes:", v12, v21);
  -[EKEvent _adjustAlarmsAfterMovingOrCopyingFromCalendar:toCalendar:](self, "_adjustAlarmsAfterMovingOrCopyingFromCalendar:toCalendar:", v13, v12);
  -[EKEvent _adjustRecurrenceRulesAfterMovingOrCopyingFromCalendar:toCalendar:notes:](self, "_adjustRecurrenceRulesAfterMovingOrCopyingFromCalendar:toCalendar:notes:", v13, v12, v21);
  -[EKEvent _adjustTimeZoneAfterMovingOrCopyingToCalendar:notes:](self, "_adjustTimeZoneAfterMovingOrCopyingToCalendar:notes:", v12, v21);
  -[EKEvent _adjustExternalFieldsAfterMovingOrCopyingFromCalendar:toCalendar:cachedConstraintsForOldCalendar:](self, "_adjustExternalFieldsAfterMovingOrCopyingFromCalendar:toCalendar:cachedConstraintsForOldCalendar:", v13, v12, v11);

  if (objc_msgSend(v21, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("The following information couldn’t be added to Exchange:"), &stru_1E4789A58, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKCalendarItem notes](self, "notes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");
    v18 = (void *)MEMORY[0x1E0CB3940];
    if (v17)
    {
      -[EKCalendarItem notes](self, "notes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@\n\n%@%@"), v19, v15, v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent setNotes:](self, "setNotes:", v20);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v15, v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent setNotes:](self, "setNotes:", v19);
    }

  }
  -[EKEvent _invalidateRecurrenceIdentifier](self, "_invalidateRecurrenceIdentifier");

}

- (void)_adjustExternalFieldsAfterMovingOrCopyingFromCalendar:(id)a3 toCalendar:(id)a4 cachedConstraintsForOldCalendar:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v19, "constraints");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  v13 = objc_msgSend(v11, "externalDataFormat");
  objc_msgSend(v8, "constraints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "externalDataFormat");

  if (v13 != v15)
  {
    -[EKCalendarItem setExternalData:](self, "setExternalData:", 0);
    -[EKObject eventStore](self, "eventStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "eventAccessLevel");

    if (v17 == 1)
    {
      -[EKObject changeSet](self, "changeSet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "forceChangeValue:forKey:", 0, *MEMORY[0x1E0D0B2C8]);

    }
  }

}

- (void)_adjustAttendeesAfterMovingOrCopyingFromCalendar:(id)a3 toCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[EKEvent _requirementsToMoveToCalendarHelperRemoveAttendeesRequiredToMoveEventFromCalendar:toCalendar:](self, "_requirementsToMoveToCalendarHelperRemoveAttendeesRequiredToMoveEventFromCalendar:toCalendar:", v6, v7))
  {
    -[EKCalendarItem setAttendees:](self, "setAttendees:", 0);
    -[EKCalendarItem setOrganizer:](self, "setOrganizer:", 0);
  }
  else
  {
    objc_msgSend(v6, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if ((v10 & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      -[EKCalendarItem organizer](self, "organizer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendarItem setOrganizer:](self, "setOrganizer:", 0);
      -[EKCalendarItem setSelfAttendee:](self, "setSelfAttendee:", 0);
      -[EKCalendarItem addOrganizerAndSelfAttendeeForNewInvitation](self, "addOrganizerAndSelfAttendeeForNewInvitation");
    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[EKCalendarItem attendees](self, "attendees", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isEqualToParticipant:", v17) & 1) != 0
            || !-[EKEvent _isValidAttendee:forCalendar:selfAttendeeIsValid:](self, "_isValidAttendee:forCalendar:selfAttendeeIsValid:", v17, v7, 1))
          {
            -[EKCalendarItem removeAttendee:](self, "removeAttendee:", v17);
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
}

- (void)_adjustPrivacyAfterMovingOrCopyingFromCalendar:(id)a3 toCalendar:(id)a4 cachedConstraintsForOldCalendar:(id)a5 savingItem:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int64_t v20;
  BOOL v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  BOOL v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[EKEvent isPrivacySet](self, "isPrivacySet")
    && !-[EKEvent allowsPrivacyLevelModifications](self, "allowsPrivacyLevelModifications"))
  {
    -[EKEvent setPrivacyLevelWithoutVerifyingPrivacyModificationsAllowed:](self, "setPrivacyLevelWithoutVerifyingPrivacyModificationsAllowed:", 0);
  }
  else
  {
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v10, "constraints");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;
    objc_msgSend(v11, "constraints", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "requiresSamePrivacyLevelAcrossRecurrenceSeries");

    v18 = objc_msgSend(v15, "requiresSamePrivacyLevelAcrossRecurrenceSeries");
    objc_msgSend(v11, "constraints");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = +[EKSource _calEventPrivacyLevelToEKPrivacyLevel:](EKSource, "_calEventPrivacyLevelToEKPrivacyLevel:", objc_msgSend(v19, "strictestEventPrivateValue"));

    if (v20 != +[EKSource _calEventPrivacyLevelToEKPrivacyLevel:](EKSource, "_calEventPrivacyLevelToEKPrivacyLevel:", objc_msgSend(v15, "strictestEventPrivateValue"))|| (v17 & (v18 ^ 1)) != 0)
    {
      v21 = 0;
      v29 = 0;
      v30 = &v29;
      v31 = 0x2020000000;
      v32 = 0;
      v22 = MEMORY[0x1E0C809B0];
      if (v17)
      {
        v23 = -[EKEvent privacyLevel](self, "privacyLevel") != 0;
        *((_BYTE *)v30 + 24) = v23;
        -[EKCalendarItem detachedItems](self, "detachedItems");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v22;
        v28[1] = 3221225472;
        v28[2] = __112__EKEvent__adjustPrivacyAfterMovingOrCopyingFromCalendar_toCalendar_cachedConstraintsForOldCalendar_savingItem___block_invoke;
        v28[3] = &unk_1E4786FF8;
        v28[4] = &v29;
        objc_msgSend(v24, "enumerateObjectsUsingBlock:", v28);

        v21 = *((_BYTE *)v30 + 24) != 0;
      }
      v26[0] = v22;
      v26[1] = 3221225472;
      v26[2] = __112__EKEvent__adjustPrivacyAfterMovingOrCopyingFromCalendar_toCalendar_cachedConstraintsForOldCalendar_savingItem___block_invoke_2;
      v26[3] = &__block_descriptor_41_e24_v16__0__EKCalendarItem_8l;
      v27 = v21;
      v26[4] = v20;
      -[EKCalendarItem _recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:](self, "_recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:", v26, v13);
      _Block_object_dispose(&v29, 8);
    }

    v10 = v25;
  }

}

uint64_t __112__EKEvent__adjustPrivacyAfterMovingOrCopyingFromCalendar_toCalendar_cachedConstraintsForOldCalendar_savingItem___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "privacyLevel");
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __112__EKEvent__adjustPrivacyAfterMovingOrCopyingFromCalendar_toCalendar_cachedConstraintsForOldCalendar_savingItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (*(_BYTE *)(a1 + 40) || objc_msgSend(v3, "privacyLevel"))
    objc_msgSend(v3, "setPrivacyLevel:", *(_QWORD *)(a1 + 32));

}

- (void)_adjustAvailabilityAfterMovingOrCopyingFromCalendar:(id)a3 toCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  -[EKObject eventStore](self, "eventStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "eventAccessLevel");

  if (v9 != 1)
  {
    objc_msgSend(v6, "source");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "sourceType");
    v13 = objc_msgSend(v11, "sourceType");
    if (v12 == 5 && v13 != 5)
    {
      -[EKEvent suggestionInfo](self, "suggestionInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v22 = 0;
        v23 = &v22;
        v24 = 0x2020000000;
        v15 = (_QWORD *)getkSuggestionsEKEventAvailabilityStateSymbolLoc_ptr;
        v25 = getkSuggestionsEKEventAvailabilityStateSymbolLoc_ptr;
        if (!getkSuggestionsEKEventAvailabilityStateSymbolLoc_ptr)
        {
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __getkSuggestionsEKEventAvailabilityStateSymbolLoc_block_invoke;
          v21[3] = &unk_1E4784C68;
          v21[4] = &v22;
          __getkSuggestionsEKEventAvailabilityStateSymbolLoc_block_invoke((uint64_t)v21);
          v15 = (_QWORD *)v23[3];
        }
        _Block_object_dispose(&v22, 8);
        if (!v15)
          -[EKEvent _adjustAvailabilityAfterMovingOrCopyingFromCalendar:toCalendar:].cold.1();
        -[EKCalendarItem localCustomObjectForKey:](self, "localCustomObjectForKey:", *v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = objc_msgSend(v16, "integerValue");
            v18 = (void *)objc_opt_class();
            -[EKCalendarItem calendar](self, "calendar");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v18, "_coercedEventAvailabilityForDesiredAvailability:supportedAvailabilities:", v17, objc_msgSend(v19, "supportedEventAvailabilities"));

            -[EKEvent setAvailability:](self, "setAvailability:", v20);
          }
        }

      }
    }

  }
}

- (void)_adjustAttachmentsAfterMovingOrCopyingFromCalendar:(id)a3 toCalendar:(id)a4 cachedConstraintsForOldCalendar:(id)a5 savingItem:(id)a6
{
  id v10;
  id v11;
  id v12;
  EKEvent *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  EKEvent *v22;
  void *v23;
  char v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  EKEvent *v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (EKEvent *)a6;
  objc_msgSend(v10, "source");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "source");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if ((v16 & 1) == 0)
  {
    if (v12)
    {
      v17 = v12;
    }
    else
    {
      objc_msgSend(v10, "constraints");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;
    objc_msgSend(v11, "constraints");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "supportsAttachments"))
    {
      objc_msgSend(v11, "constraints");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v20, "requiresOpeningAttachmentAsLink"))
      {
        v21 = objc_msgSend(v18, "requiresOpeningAttachmentAsLink");

        if ((v21 & 1) == 0)
        {
          if (self == v13)
          {
            -[EKCalendarItem originalItem](self, "originalItem");
            v22 = (EKEvent *)objc_claimAutoreleasedReturnValue();
            if (!v22)
              v22 = self;
            objc_msgSend(v11, "constraints");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "requiresSeparateFilesForAllAttachments");

            if ((v24 & 1) != 0)
              v25 = 0;
            else
              v25 = (void *)objc_opt_new();
            v27[0] = MEMORY[0x1E0C809B0];
            v27[1] = 3221225472;
            v27[2] = __116__EKEvent__adjustAttachmentsAfterMovingOrCopyingFromCalendar_toCalendar_cachedConstraintsForOldCalendar_savingItem___block_invoke;
            v27[3] = &unk_1E4787040;
            v28 = v25;
            v29 = self;
            v26 = v25;
            -[EKCalendarItem _recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:](v22, "_recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:", v27, self);

          }
          goto LABEL_10;
        }
LABEL_9:
        -[EKCalendarItem setAttachments:](self, "setAttachments:", 0);
LABEL_10:

        goto LABEL_11;
      }

    }
    goto LABEL_9;
  }
LABEL_11:

}

void __116__EKEvent__adjustAttachmentsAfterMovingOrCopyingFromCalendar_toCalendar_cachedConstraintsForOldCalendar_savingItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t v15;
  _BYTE v16[15];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a2, "attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        objc_msgSend(v9, "UUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(v9, "assignIdentity:", v11);
          objc_msgSend(v9, "invalidateLocalFilePropertiesForNewCopiedFile");
LABEL_10:
          objc_msgSend(v9, "setExternalID:", 0);
          objc_msgSend(v9, "setURL:", 0);

          goto LABEL_11;
        }
        objc_msgSend(v9, "assignNewIdentity");
        if ((objc_msgSend(v9, "copyLocalFileToNewSource") & 1) != 0)
        {
          objc_msgSend(v9, "UUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v10);
          goto LABEL_10;
        }
        v13 = EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
          __116__EKEvent__adjustAttachmentsAfterMovingOrCopyingFromCalendar_toCalendar_cachedConstraintsForOldCalendar_savingItem___block_invoke_cold_1(&v15, v16, v13);
        objc_msgSend(*(id *)(a1 + 40), "removeAttachment:", v9);
LABEL_11:

        ++v8;
      }
      while (v6 != v8);
      v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v6 = v14;
    }
    while (v14);
  }

}

- (void)_adjustURLAfterMovingOrCopyingToCalendar:(id)a3 notes:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  -[EKEvent URL](self, "URL");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v17, "constraints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "supportsURLField");

    if ((v10 & 1) == 0)
    {
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("url"), &stru_1E4789A58, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x1E0CB3940];
        -[EKEvent URL](self, "URL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "absoluteString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("\n%@:%@"), v12, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "appendString:", v16);
      }
      -[EKEvent setURL:](self, "setURL:", 0);
    }
  }

}

- (void)_adjustTimeZoneAfterMovingOrCopyingToCalendar:(id)a3 notes:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[EKCalendarItem timeZone](self, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || -[EKEvent isAllDay](self, "isAllDay"))
  {
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v15, "constraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsFloatingTimeZone");

  if ((v9 & 1) == 0)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("time zone"), &stru_1E4789A58, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Floating"), &stru_1E4789A58, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@:%@"), v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v14);

    }
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setTimeZone:](self, "setTimeZone:", v7);
    goto LABEL_7;
  }
LABEL_8:

}

+ (int64_t)_coercedEventAvailabilityForDesiredAvailability:(int64_t)a3 supportedAvailabilities:(unint64_t)a4
{
  int64_t result;

  if (!a4)
    return -1;
  result = a3;
  switch(a3)
  {
    case -1:
      return result;
    case 0:
      if ((a4 & 1) == 0)
        return -1;
      result = 0;
      break;
    case 1:
      if ((a4 & 2) == 0)
        return -1;
      result = 1;
      break;
    case 2:
      if ((a4 & 4) == 0)
        return -1;
      result = 2;
      break;
    case 3:
      if ((a4 & 8) == 0)
        return -1;
      result = 3;
      break;
    default:
      return -1;
  }
  return result;
}

- (void)markAsSaved
{
  objc_super v3;

  -[EKEvent _addOrganizerToRecentsIfNeeded](self, "_addOrganizerToRecentsIfNeeded");
  -[EKEvent _addNewAttendeesToRecentsIfNeeded](self, "_addNewAttendeesToRecentsIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)EKEvent;
  -[EKObject markAsSaved](&v3, sel_markAsSaved);
  -[EKEvent _clearOriginalDateFields](self, "_clearOriginalDateFields");
}

- (void)markAsCommitted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEvent;
  -[EKObject markAsCommitted](&v3, sel_markAsCommitted);
  -[EKEvent setClearModifiedFlags:](self, "setClearModifiedFlags:", 0);
  -[EKEvent invalidateRemovedVirtualConferences](self, "invalidateRemovedVirtualConferences");
}

- (void)markAsUndeleted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  if (-[EKCalendarItem _hadRecurrenceRules](self, "_hadRecurrenceRules") && !-[EKEvent isDetached](self, "isDetached"))
  {
    -[EKObject _markAsUndeletedCommon](self, "_markAsUndeletedCommon");
  }
  else
  {
    -[EKEvent uniqueId](self, "uniqueId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem calendarItemIdentifier](self, "calendarItemIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem externalID](self, "externalID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9.receiver = self;
    v9.super_class = (Class)EKEvent;
    -[EKObject markAsUndeleted](&v9, sel_markAsUndeleted);
    -[EKObject _initChangeSetIfNone](self, "_initChangeSetIfNone");
    -[EKObject changeSet](self, "changeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "forceChangeValue:forKey:", v3, *MEMORY[0x1E0D0B408]);

    -[EKObject changeSet](self, "changeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "forceChangeValue:forKey:", v4, *MEMORY[0x1E0D0B820]);

    -[EKObject changeSet](self, "changeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "forceChangeValue:forKey:", v5, *MEMORY[0x1E0D0B2D0]);

  }
}

- (void)markAsUndetachedWithStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[EKObject _initChangeSetIfNone](self, "_initChangeSetIfNone");
  -[EKObject changeSet](self, "changeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsUndetached:", 1);

  -[EKEvent setStartDate:](self, "setStartDate:", v6);
  -[EKEvent setEndDateUnadjustedForLegacyClients:](self, "setEndDateUnadjustedForLegacyClients:", v8);

}

- (BOOL)isUndetached
{
  void *v2;
  char v3;

  -[EKObject changeSet](self, "changeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUndetached");

  return v3;
}

- (BOOL)isOrWasIntegrationEvent
{
  BOOL v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[EKEvent isIntegrationEvent](self, "isIntegrationEvent"))
    return 1;
  v4 = *MEMORY[0x1E0D0B280];
  if (!-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B280]))
    return 0;
  -[EKObject _previousValueForKey:](self, "_previousValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject eventStore](self, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "meltedObjectInStore:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v8, "sourceType") == 6;

  return v3;
}

- (unint64_t)_integrationType
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__EKEvent__integrationType__block_invoke;
  v5[3] = &unk_1E4784B98;
  v5[4] = self;
  -[EKObject cachedValueForKey:populateBlock:](self, "cachedValueForKey:populateBlock:", CFSTR("eKEventIntegrationTypeKey"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

uint64_t __27__EKEvent__integrationType__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "calendar");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sourceType");

  if (v3 == 6)
    v4 = 2;
  else
    v4 = 1;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
}

- (void)clearIntegrationType
{
  -[EKObject clearCachedValueForKey:](self, "clearCachedValueForKey:", CFSTR("eKEventIntegrationTypeKey"));
}

- (BOOL)isIntegrationEvent
{
  return -[EKEvent _integrationType](self, "_integrationType") > 1;
}

- (BOOL)isReminderIntegrationEvent
{
  return -[EKEvent _integrationType](self, "_integrationType") == 2;
}

- (BOOL)allowsNonzeroDuration
{
  return !-[EKEvent isIntegrationEvent](self, "isIntegrationEvent");
}

- (unint64_t)reminderOccurrenceType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;

  if (!-[EKEvent isReminderIntegrationEvent](self, "isReminderIntegrationEvent")
    || !-[EKCalendarItem hasRecurrenceRules](self, "hasRecurrenceRules"))
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "CalSimulatedDateForNow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99D48];
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CalGregorianCalendarForTimeZone:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "compareDateIgnoringTimeComponents:inCalendar:", v3, v7);
  if (v8)
  {
    if (v8 == 1)
    {
      if (-[EKEvent isFirstOccurrence](self, "isFirstOccurrence"))
        v8 = 0;
      else
        v8 = 2;
    }
    else
    {
      -[EKEvent _nextReminderOccurrenceDate](self, "_nextReminderOccurrenceDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "compareDateIgnoringTimeComponents:inCalendar:", v3, v7) != 1;

    }
  }

  return v8;
}

- (id)_nextReminderOccurrenceDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__EKEvent__nextReminderOccurrenceDate__block_invoke;
  v3[3] = &unk_1E4784B98;
  v3[4] = self;
  -[EKObject cachedValueForKey:populateBlock:](self, "cachedValueForKey:populateBlock:", CFSTR("nextReminderOccurrenceDateKey"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __38__EKEvent__nextReminderOccurrenceDate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "nextOccurrence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "exceptionDates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isAfterDate:", v4) && objc_msgSend(v10, "isBeforeDate:", v3))
        {
          v11 = v10;

          v3 = v11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  v12 = v3;

  return v12;
}

- (void)clearNextCachedReminderOccurrenceDate
{
  -[EKObject clearCachedValueForKey:](self, "clearCachedValueForKey:", CFSTR("nextReminderOccurrenceDateKey"));
}

- (void)_setNextCachedReminderOccurrenceDate:(id)a3
{
  -[EKObject setCachedValue:forKey:](self, "setCachedValue:forKey:", a3, CFSTR("nextReminderOccurrenceDateKey"));
}

- (id)privacySafeIntegrationEventDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  const __CFString *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[EKCalendarItem uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[Event: %@: "), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKCalendarItem timeZone](self, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v32 = v8;
  objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianCalendarForTimeZone:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[EKEvent isAllDay](self, "isAllDay");
  v11 = v10;
  if (v10)
    v12 = 28;
  else
    v12 = 124;
  -[EKEvent startDate](self, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v9;
  objc_msgSend(v9, "components:fromDate:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "year");
  v16 = objc_msgSend(v14, "month");
  v17 = objc_msgSend(v14, "day");
  v18 = v17;
  if (v11)
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("%li-%li-%li"), v15, v16, v17, v27, v28);
  }
  else
  {
    v19 = objc_msgSend(v14, "hour");
    v20 = objc_msgSend(v14, "minute");
    if (v7)
    {
      v29 = v20;
      v30 = v19;
      objc_msgSend(v7, "abbreviationForDate:", v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        v23 = v21;
      }
      else
      {
        objc_msgSend(v7, "name");
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      v24 = v23;

      objc_msgSend(v5, "appendFormat:", CFSTR("%li-%li-%li %li:%02li %@"), v15, v16, v18, v30, v29, v24);
    }
    else
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("%li-%li-%li %li:%02li float"), v15, v16, v18, v19, v20);
    }
  }
  objc_msgSend(v5, "appendString:", CFSTR(", "));
  if (-[EKEvent completed](self, "completed"))
    v25 = CFSTR("complete");
  else
    v25 = CFSTR("incomplete");
  objc_msgSend(v5, "appendString:", v25);
  objc_msgSend(v5, "appendString:", CFSTR("]"));

  return v5;
}

- (BOOL)refreshIfRefreshableAndNotify:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  return !-[EKObject _refreshable](self, "_refreshable") || -[EKEvent refreshAndNotify:](self, "refreshAndNotify:", v3);
}

- (void)_addOrganizerToRecentsIfNeeded
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[EKEvent _isParticipationStatusDirty](self, "_isParticipationStatusDirty"))
  {
    v3 = -[EKEvent participationStatus](self, "participationStatus");
    if (v3 == 4 || v3 == 2)
    {
      -[EKCalendarItem organizer](self, "organizer");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "emailAddress");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "phoneNumber");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[EKRecents recordRecentForContactWithName:emailAddress:phoneNumber:](EKRecents, "recordRecentForContactWithName:emailAddress:phoneNumber:", v4, v5, v6);

    }
  }
}

- (void)_addNewAttendeesToRecentsIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D0B278];
  if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B278]))
  {
    -[EKObject changeSet](self, "changeSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unsavedMultiValueAddedObjectsForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count"))
    {
      v6 = (void *)MEMORY[0x1E0C99E08];
      -[EKCalendarItem attendees](self, "attendees");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      -[EKCalendarItem attendees](self, "attendees");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v32 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_msgSend(v14, "uniqueIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v11);
      }

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = v5;
      obj = v5;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v28;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v28 != v18)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "uniqueIdentifier", v25);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectForKeyedSubscript:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v21, "name");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "emailAddress");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "phoneNumber");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              +[EKRecents recordRecentForContactWithName:emailAddress:phoneNumber:](EKRecents, "recordRecentForContactWithName:emailAddress:phoneNumber:", v22, v23, v24);

            }
          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        }
        while (v17);
      }

      v5 = v25;
    }

  }
}

- (void)reset
{
  objc_super v3;

  -[EKEvent setPredictedLocationFrozen:](self, "setPredictedLocationFrozen:", 0);
  v3.receiver = self;
  v3.super_class = (Class)EKEvent;
  -[EKObject reset](&v3, sel_reset);
}

- (BOOL)_reset
{
  EKCalendarDate **p_originalOccurrenceStartDate;
  EKCalendarDate *originalOccurrenceStartDate;
  EKCalendarDate *v5;
  EKCalendarDate *originalOccurrenceEndDate;
  EKCalendarDate *v7;
  NSNumber *originalOccurrenceIsAllDay;
  NSNumber *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)EKEvent;
  if (!-[EKObject _reset](&v24, sel__reset))
    return 0;
  -[EKEvent clearDetectedConferenceURL](self, "clearDetectedConferenceURL");
  -[EKEvent clearParsedConference](self, "clearParsedConference");
  -[EKEvent clearVirtualConferenceURLsQueuedForInvalidation](self, "clearVirtualConferenceURLsQueuedForInvalidation");
  -[EKEvent setClearModifiedFlags:](self, "setClearModifiedFlags:", 0);
  p_originalOccurrenceStartDate = &self->_originalOccurrenceStartDate;
  originalOccurrenceStartDate = self->_originalOccurrenceStartDate;
  if (originalOccurrenceStartDate)
  {
    objc_storeStrong((id *)&self->_occurrenceStartDate, originalOccurrenceStartDate);
    v5 = *p_originalOccurrenceStartDate;
    *p_originalOccurrenceStartDate = 0;

  }
  originalOccurrenceEndDate = self->_originalOccurrenceEndDate;
  if (originalOccurrenceEndDate)
  {
    objc_storeStrong((id *)&self->_occurrenceEndDate, originalOccurrenceEndDate);
    v7 = self->_originalOccurrenceEndDate;
    self->_originalOccurrenceEndDate = 0;

  }
  originalOccurrenceIsAllDay = self->_originalOccurrenceIsAllDay;
  if (originalOccurrenceIsAllDay)
  {
    self->_occurrenceIsAllDay = -[NSNumber BOOLValue](originalOccurrenceIsAllDay, "BOOLValue");
    v9 = self->_originalOccurrenceIsAllDay;
    self->_originalOccurrenceIsAllDay = 0;

  }
  if (!-[EKEvent validateOccurrenceDateStillMatchesRecurrenceRules](self, "validateOccurrenceDateStillMatchesRecurrenceRules"))return 0;
  -[EKEvent _committedStartDate](self, "_committedStartDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v11 = -[EKEvent adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:](self, "adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:", v10, 1, 0, &v23);
  v12 = v23;
  v13 = v23;

  if (!-[EKCalendarItem _hadRecurrenceRules](self, "_hadRecurrenceRules"))
  {
    objc_storeStrong((id *)&self->_originalOccurrenceStartDate, v12);
    objc_storeStrong((id *)&self->_occurrenceStartDate, v12);
  }
  -[EKEvent _committedEndDate](self, "_committedEndDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v15 = 1;
  v16 = -[EKEvent adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:](self, "adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:", v14, 1, 1, &v22);
  v17 = v22;

  -[EKEvent _calculateDurationWithStart:end:allDay:](self, "_calculateDurationWithStart:end:allDay:", v13, v17, -[EKEvent _isAllDay](self, "_isAllDay"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent occurrenceStartDate](self, "occurrenceStartDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "calendarDateByComponentwiseAddingComponents:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent setOccurrenceEndDate:](self, "setOccurrenceEndDate:", v20);

  -[EKEvent setOccurrenceIsAllDay:](self, "setOccurrenceIsAllDay:", -[EKEvent _isAllDay](self, "_isAllDay"));
  return v15;
}

- (BOOL)revert
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  -[EKObject uniqueIdentifier](self, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKObject hasNeverBeenCommitted](self, "hasNeverBeenCommitted"))
    v4 = -[EKEvent isDetached](self, "isDetached");
  else
    v4 = 0;
  -[EKCalendarItem originalItem](self, "originalItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent occurrenceStartDate](self, "occurrenceStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent occurrenceEndDate](self, "occurrenceEndDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKEvent occurrenceIsAllDay](self, "occurrenceIsAllDay");
  v17.receiver = self;
  v17.super_class = (Class)EKEvent;
  v9 = -[EKObject revert](&v17, sel_revert);
  if (v4)
  {
    objc_msgSend(v5, "backingObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject setBackingObject:](self, "setBackingObject:", v10);

    -[EKObject _resetAfterUpdatingChangeSetOrBackingObject](self, "_resetAfterUpdatingChangeSetOrBackingObject");
    -[EKEvent reset](self, "reset");
    -[EKEvent setOccurrenceStartDate:](self, "setOccurrenceStartDate:", v6);
    -[EKEvent setOccurrenceEndDate:](self, "setOccurrenceEndDate:", v7);
    -[EKEvent setOccurrenceIsAllDay:](self, "setOccurrenceIsAllDay:", v8);
  }
  else
  {
    -[EKEvent originalOccurrenceStartDate](self, "originalOccurrenceStartDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setOccurrenceStartDate:](self, "setOccurrenceStartDate:", v11);

    -[EKEvent originalOccurrenceEndDate](self, "originalOccurrenceEndDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setOccurrenceEndDate:](self, "setOccurrenceEndDate:", v12);

    -[EKEvent originalOccurrenceIsAllDay](self, "originalOccurrenceIsAllDay");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[EKEvent originalOccurrenceIsAllDay](self, "originalOccurrenceIsAllDay");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent setOccurrenceIsAllDay:](self, "setOccurrenceIsAllDay:", objc_msgSend(v14, "BOOLValue"));

    }
  }
  -[EKEvent _clearOriginalDateFields](self, "_clearOriginalDateFields");
  -[EKEvent setPredictedLocationFrozen:](self, "setPredictedLocationFrozen:", 0);
  objc_msgSend((id)objc_opt_class(), "_modifiedNotificationUserInfoWithIdentifier:forRevert:", v3, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent postModifiedNotificationWithUserInfo:](self, "postModifiedNotificationWithUserInfo:", v15);

  return v9;
}

- (void)rollback
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B328]))
  {
    -[EKEvent virtualConference](self, "virtualConference");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent _originallyCommittedVirtualConference](self, "_originallyCommittedVirtualConference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[EKEvent virtualConference](self, "virtualConference");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "joinMethods");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "URL");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            +[EKConferenceUtils invalidateConferenceURL:](EKConferenceUtils, "invalidateConferenceURL:", v12);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v9);
      }

    }
  }
  v17.receiver = self;
  v17.super_class = (Class)EKEvent;
  -[EKObject rollback](&v17, sel_rollback);
  -[EKEvent clearDetectedConferenceURL](self, "clearDetectedConferenceURL");
  -[EKEvent clearParsedConference](self, "clearParsedConference");
  -[EKEvent clearVirtualConferenceURLsQueuedForInvalidation](self, "clearVirtualConferenceURLsQueuedForInvalidation");
  -[EKEvent originalOccurrenceStartDate](self, "originalOccurrenceStartDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent setOccurrenceStartDate:](self, "setOccurrenceStartDate:", v13);

  -[EKEvent originalOccurrenceEndDate](self, "originalOccurrenceEndDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent setOccurrenceEndDate:](self, "setOccurrenceEndDate:", v14);

  -[EKEvent originalOccurrenceIsAllDay](self, "originalOccurrenceIsAllDay");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[EKEvent originalOccurrenceIsAllDay](self, "originalOccurrenceIsAllDay");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setOccurrenceIsAllDay:](self, "setOccurrenceIsAllDay:", objc_msgSend(v16, "BOOLValue"));

  }
  -[EKEvent setPredictedLocationFrozen:](self, "setPredictedLocationFrozen:", 0);
}

- (id)nextOccurrence
{
  void *v3;
  void *v4;

  -[EKEvent startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent nextOccurrenceOrDetachmentAfter:](self, "nextOccurrenceOrDetachmentAfter:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nextOccurrenceOrDetachmentAfter:(id)a3
{
  id v4;
  void *v5;
  EKRecurrenceGenerator *v6;
  EKRecurrenceGenerator *v7;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  void *v10;
  EKEvent *v11;
  EKEvent *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  EKEvent *v25;
  EKEvent *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  EKRecurrenceGenerator *v36;
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKEvent singleRecurrenceRule](self, "singleRecurrenceRule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(EKRecurrenceGenerator);
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__17;
    v55 = __Block_byref_object_dispose__17;
    v56 = 0;
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__17;
    v49 = __Block_byref_object_dispose__17;
    v50 = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __43__EKEvent_nextOccurrenceOrDetachmentAfter___block_invoke;
    v35[3] = &unk_1E4787068;
    v7 = v6;
    v36 = v7;
    v37 = v4;
    v38 = &v51;
    v39 = &v45;
    v40 = &v41;
    v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85849D4](v35);
    -[EKEvent masterEvent](self, "masterEvent");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (EKEvent *)v9;
    else
      v11 = self;
    v12 = v11;

    -[EKEvent recurrenceSet](v12, "recurrenceSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      -[EKObject eventStore](self, "eventStore", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "eventsWithSameRecurrenceSetAsEvent:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v57, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v32 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_msgSend(v19, "masterEvent");
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = (void *)v20;
            if (v20)
              v22 = v20;
            else
              v22 = (uint64_t)v19;
            v8[2](v8, v22);

          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v57, 16);
        }
        while (v16);
      }

    }
    else
    {
      ((void (**)(_QWORD, EKEvent *))v8)[2](v8, v12);
    }
    if (v52[5])
    {
      if (!*((_BYTE *)v42 + 24))
      {
        v26 = [EKEvent alloc];
        objc_msgSend((id)v46[5], "persistentObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[EKEvent initWithPersistentObject:occurrenceDate:](v26, "initWithPersistentObject:occurrenceDate:", v27, v52[5]);
        v29 = (void *)v46[5];
        v46[5] = v28;

      }
      v25 = (EKEvent *)(id)v46[5];
    }
    else
    {
      v25 = 0;
    }

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v45, 8);

    _Block_object_dispose(&v51, 8);
  }
  else
  {
    -[EKEvent startDate](self, "startDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isAfterDate:", v4);

    if (v24)
      v25 = self;
    else
      v25 = 0;
  }

  return v25;
}

void __43__EKEvent_nextOccurrenceOrDetachmentAfter___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "exceptionDates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detachedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v5;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "recurrenceDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v10);
  }

  objc_msgSend(v4, "singleRecurrenceRule");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    obj = a2;
    v33 = (void *)a1[4];
    objc_msgSend(v4, "singleRecurrenceRule");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v16 = v7;
    else
      v16 = v35;
    objc_msgSend(v4, "startCalendarDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0D0C420];
    v19 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "calendarDateWithDate:timeZone:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "nextOccurrenceDateWithEKRecurrences:forCalendarItem:exceptionDates:initialDate:afterDate:", v15, v4, v16, v17, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if ((!v23 || objc_msgSend(v23, "isAfterDate:", v22))
      && objc_msgSend(v22, "isAfterDate:", a1[5]))
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v22);
      objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), obj);
      *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 0;
    }

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v24 = v8;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v37 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
        objc_msgSend(v29, "startDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
        if (!v31 || objc_msgSend(v31, "isAfterDate:", v30))
        {
          if (objc_msgSend(v30, "isAfterDate:", a1[5]))
          {
            objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v30);
            objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v29);
            *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
          }
        }

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v26);
  }

}

- (id)previousOccurrence
{
  void *v3;
  void *v4;

  -[EKEvent startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent previousOccurrenceOrDetachmentBefore:](self, "previousOccurrenceOrDetachmentBefore:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)previousOccurrenceOrDetachmentBefore:(id)a3
{
  id v4;
  void *v5;
  EKRecurrenceGenerator *v6;
  EKRecurrenceGenerator *v7;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  void *v10;
  EKEvent *v11;
  EKEvent *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  EKEvent *v25;
  EKEvent *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  EKRecurrenceGenerator *v36;
  id v37;
  EKEvent *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKEvent singleRecurrenceRule](self, "singleRecurrenceRule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(EKRecurrenceGenerator);
    v52 = 0;
    v53 = &v52;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__17;
    v56 = __Block_byref_object_dispose__17;
    v57 = 0;
    v46 = 0;
    v47 = &v46;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__17;
    v50 = __Block_byref_object_dispose__17;
    v51 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 0;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __48__EKEvent_previousOccurrenceOrDetachmentBefore___block_invoke;
    v35[3] = &unk_1E47870B8;
    v7 = v6;
    v36 = v7;
    v37 = v4;
    v38 = self;
    v39 = &v52;
    v40 = &v46;
    v41 = &v42;
    v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85849D4](v35);
    -[EKEvent masterEvent](self, "masterEvent");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (EKEvent *)v9;
    else
      v11 = self;
    v12 = v11;

    -[EKEvent recurrenceSet](v12, "recurrenceSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      -[EKObject eventStore](self, "eventStore", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "eventsWithSameRecurrenceSetAsEvent:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v58, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v32 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_msgSend(v19, "masterEvent");
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = (void *)v20;
            if (v20)
              v22 = v20;
            else
              v22 = (uint64_t)v19;
            v8[2](v8, v22);

          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v58, 16);
        }
        while (v16);
      }

    }
    else
    {
      ((void (**)(_QWORD, EKEvent *))v8)[2](v8, v12);
    }
    if (v53[5])
    {
      if (!*((_BYTE *)v43 + 24))
      {
        v26 = [EKEvent alloc];
        objc_msgSend((id)v47[5], "persistentObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[EKEvent initWithPersistentObject:occurrenceDate:](v26, "initWithPersistentObject:occurrenceDate:", v27, v53[5]);
        v29 = (void *)v47[5];
        v47[5] = v28;

      }
      v25 = (EKEvent *)(id)v47[5];
    }
    else
    {
      v25 = 0;
    }

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v46, 8);

    _Block_object_dispose(&v52, 8);
  }
  else
  {
    -[EKEvent startDate](self, "startDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isBeforeDate:", v4);

    if (v24)
      v25 = self;
    else
      v25 = 0;
  }

  return v25;
}

void __48__EKEvent_previousOccurrenceOrDetachmentBefore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "exceptionDates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detachedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }
  v34 = v4;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "recurrenceDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v9);
  }

  v13 = *(void **)(a1 + 32);
  objc_msgSend(v3, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(a1 + 40);
  objc_msgSend(v3, "duration");
  objc_msgSend(v15, "dateByAddingTimeInterval:", -v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "effectiveTimeZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v32) = 1;
  v19 = (void *)objc_msgSend(v13, "copyOccurrenceDatesWithEKEvent:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:", v3, v14, v17, v18, 0, 1000, v32);

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __48__EKEvent_previousOccurrenceOrDetachmentBefore___block_invoke_2;
  v39[3] = &unk_1E4787090;
  v40 = *(id *)(a1 + 40);
  v20 = v6;
  v41 = v20;
  v43 = *(_OWORD *)(a1 + 56);
  v21 = v3;
  v22 = *(_QWORD *)(a1 + 72);
  v42 = v21;
  v44 = v22;
  v33 = v19;
  objc_msgSend(v19, "enumerateObjectsWithOptions:usingBlock:", 2, v39);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v23 = v7;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        objc_msgSend(v28, "startDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29 && objc_msgSend(v29, "isBeforeDate:", *(_QWORD *)(a1 + 40)))
        {
          v31 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          if (*(_QWORD *)(v31 + 40))
          {
            if (!objc_msgSend(v30, "isAfterDate:"))
              goto LABEL_25;
            v31 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          }
          objc_storeStrong((id *)(v31 + 40), v30);
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v28);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
        }
LABEL_25:

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    }
    while (v25);
  }

}

void __48__EKEvent_previousOccurrenceOrDetachmentBefore___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "isBeforeDate:", *(_QWORD *)(a1 + 32))
    && (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v8) & 1) == 0)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (!*(_QWORD *)(v7 + 40))
    {
LABEL_6:
      objc_storeStrong((id *)(v7 + 40), a2);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 48));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      *a4 = 1;
      goto LABEL_7;
    }
    if (objc_msgSend(v8, "isAfterDate:"))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (id)earliestOccurrenceEndingAfter:(id)a3
{
  return -[EKEvent earliestOccurrenceEndingAfter:excludeSignificantDetachments:excludeCanceledDetachments:excludeDeclinedDetachments:](self, "earliestOccurrenceEndingAfter:excludeSignificantDetachments:excludeCanceledDetachments:excludeDeclinedDetachments:", a3, 0, 0, 0);
}

- (id)copyToCalendar:(id)a3 withOptions:(int64_t)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  int64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v6 = a3;
  -[EKCalendarItem calendar](self, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKEvent _requirementsToMoveToCalendarHelperRemoveAttendeesRequiredToMoveEventFromCalendar:toCalendar:](self, "_requirementsToMoveToCalendarHelperRemoveAttendeesRequiredToMoveEventFromCalendar:toCalendar:", v7, v6);

  if (v8)
    v9 = a4 | 4;
  else
    v9 = a4;
  -[EKEvent duplicateWithOptions:](self, "duplicateWithOptions:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCalendar:", v6);
  -[EKCalendarItem calendar](self, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __38__EKEvent_copyToCalendar_withOptions___block_invoke;
  v18[3] = &unk_1E47870E0;
  v19 = v11;
  v20 = v6;
  v12 = v10;
  v21 = v12;
  v13 = v6;
  v14 = v11;
  objc_msgSend(v12, "_recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:", v18, v12);
  v15 = v21;
  v16 = v12;

  return v16;
}

uint64_t __38__EKEvent_copyToCalendar_withOptions___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "_adjustAfterMovingOrCopyingFromOldCalendar:toNewCalendar:cachedConstraintsForOldCalendar:savingItem:", a1[4], a1[5], 0, a1[6]);
}

- (id)duplicateWithOptions:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  EKEvent *v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[EKObject duplicate](self, "duplicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self;
  v19 = a3;
  -[EKEvent _keysToChangeForDuplicateWithOptions:](self, "_keysToChangeForDuplicateWithOptions:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 == v14)
        {

          v13 = 0;
        }
        objc_msgSend(v5, "setValue:forKey:", v13, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
  if ((v19 & 2) != 0)
  {
    -[EKEvent startDate](v18, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_updateStartDateForDate:withAdjustmentMode:", v15, 0);

    -[EKEvent endDateUnadjustedForLegacyClients](v18, "endDateUnadjustedForLegacyClients");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_updateEndDateForDate:withAdjustmentMode:", v16, 0);

  }
  return v5;
}

- (id)_keysToChangeForDuplicateWithOptions:(int64_t)a3
{
  char v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  double v10;
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

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) != 0)
  {
    if ((v3 & 2) == 0)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7
      || (v8 = v7,
          v9 = (void *)MEMORY[0x1E0C99D68],
          objc_msgSend(v7, "timeIntervalSinceReferenceDate"),
          objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:", floor(v10)),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          !v11))
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D0B298]);

    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D0B350]);

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D0B2A8]);

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D0B338]);

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D0B6C0]);

  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D0B270]);

    if ((v3 & 0x10) == 0)
      return v4;
    goto LABEL_6;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D0B278]);

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D0B358]);

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D0B330]);

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D0B6C8]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E47B50A8, *MEMORY[0x1E0D0B6A8]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E47B50C0, *MEMORY[0x1E0D0B6A0]);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D0B6E8]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E47B50A8, *MEMORY[0x1E0D0B6B0]);
  if ((v3 & 8) != 0)
    goto LABEL_14;
LABEL_5:
  if ((v3 & 0x10) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("suggestionInfo"));

  }
  return v4;
}

- (unint64_t)countOfAttendeeProposedTimes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[EKCalendarItem isSelfOrganizedInvitation](self, "isSelfOrganizedInvitation"))
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[EKCalendarItem attendees](self, "attendees", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend(v10, "proposedStartDateForEvent:", self);
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;
            v13 = objc_msgSend(v10, "proposedStartDateStatus");

            if (v13 != 3)
              ++v6;
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)recurrenceSet
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B6E0]);
}

- (void)setRecurrenceSet:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B6E0]);
}

- (id)committedConstraints
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  -[EKObject eventStore](self, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "eventAccessLevel");

  if (v4 == 1)
  {
    -[EKObject eventStore](self, "eventStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject CADObjectID](self, "CADObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cachedConstraintsForEventOrSourceWithCADObjectID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[EKEvent committedValueForKey:](self, "committedValueForKey:", *MEMORY[0x1E0D0B280]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)validateRecurrenceRule:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "frequency");
    -[EKEvent constraints](self, "constraints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B280]))
    {
      -[EKEvent committedConstraints](self, "committedConstraints");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    EKBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Choose another way to repeat this event or move it to another calendar."), &stru_1E4789A58, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "prohibitsMultipleMonthsInYearlyRecurrence"))
    {
      if (objc_msgSend(v9, "prohibitsMultipleMonthsInYearlyRecurrence"))
      {
        if (v8 == 3)
        {
          objc_msgSend(v7, "monthsOfTheYear");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "count");

          if (v15 >= 2)
          {
            objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("This Calendar Cannot Repeat Events on Multiple Months in a Year"), &stru_1E4789A58, 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = 45;
            if (!a4)
              goto LABEL_18;
            goto LABEL_17;
          }
        }
      }
    }
    if (objc_msgSend(v10, "prohibitsMultipleDaysInMonthlyRecurrence")
      && objc_msgSend(v9, "prohibitsMultipleDaysInMonthlyRecurrence")
      && v8 == 2
      && (objc_msgSend(v7, "daysOfTheMonth"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "count"),
          v18,
          v19 >= 2))
    {
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("This Calendar Cannot Repeat Events on Multiple Days in a Month"), &stru_1E4789A58, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 46;
      if (a4)
      {
LABEL_17:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:description:reason:", v17, v13, v16);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (!objc_msgSend(v10, "prohibitsYearlyRecurrenceInterval")
        || !objc_msgSend(v9, "prohibitsYearlyRecurrenceInterval")
        || objc_msgSend(v7, "frequency") != 3
        || objc_msgSend(v7, "interval") < 2)
      {
        v11 = 1;
        goto LABEL_26;
      }
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("This Calendar Cannot Repeat Events Every %ld Years"), &stru_1E4789A58, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringWithFormat:", v21, objc_msgSend(v7, "interval"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = 47;
      if (a4)
        goto LABEL_17;
    }
LABEL_18:

    v11 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v11 = 1;
LABEL_27:

  return v11;
}

- (BOOL)overlapsWithOrIsSameDayAsEventInSeries
{
  void *v3;
  EKCalendarDate *originalOccurrenceStartDate;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;

  -[EKEvent occurrenceStartDate](self, "occurrenceStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  originalOccurrenceStartDate = self->_originalOccurrenceStartDate;

  if (!originalOccurrenceStartDate)
    return 0;
  -[EKCalendarDate date](self->_originalOccurrenceStartDate, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem timeZone](self, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[EKEvent isFloating](self, "isFloating"))
  {
    -[EKObject eventStore](self, "eventStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateInTimeZone:fromTimeZone:", v7, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    -[EKObject eventStore](self, "eventStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateInTimeZone:fromTimeZone:", v7, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v13;
    v5 = (void *)v10;
  }
  objc_msgSend(v5, "dateForStartOfDayInTimeZone:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateForStartOfDayInTimeZone:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  v17 = v16;
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  if (vabdd_f64(v17, v18) >= 2.22044605e-16)
  {
    -[EKEvent startDate](self, "startDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent occurrenceStartDate](self, "occurrenceStartDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeZone");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[EKEvent _occurrenceExistsOnDate:timeZone:](self, "_occurrenceExistsOnDate:timeZone:", v20, v22);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)_validateDatesAndRecurrencesGivenSpan:(int64_t)a3 error:(id *)a4
{
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t GregorianDateWithFallbackToDefaultTimeZone;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  if ((objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessHasSyncClientEntitlement") & 1) == 0)
  {
    -[EKEvent constraints](self, "constraints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[EKEvent startDate](self, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceReferenceDate");
      -[EKObject eventStore](self, "eventStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeZone");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      GregorianDateWithFallbackToDefaultTimeZone = CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone();
      v14 = v13;

      if (-[EKEvent isAllDay](self, "isAllDay"))
      {
        GregorianDateWithFallbackToDefaultTimeZone = CalGregorianDateGetGregorianDateForDay();
        v14 = v15;
      }
      -[EKObject eventStore](self, "eventStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeZone");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[EKEvent _checkStartDateConstraintAgainstDate:timeZone:error:](self, "_checkStartDateConstraintAgainstDate:timeZone:error:", GregorianDateWithFallbackToDefaultTimeZone, v14, v17, a4);

      if (!v18)
        goto LABEL_28;
      if (objc_msgSend(v8, "eventDurationConstrainedToRecurrenceInterval")
        && -[EKEvent durationOverlapsRecurrenceInterval](self, "durationOverlapsRecurrenceInterval"))
      {
        if (a4)
        {
          v19 = (void *)MEMORY[0x1E0CB35C8];
          v20 = 7;
LABEL_20:
          objc_msgSend(v19, "errorWithEKErrorCode:", v20);
          v7 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

          return v7;
        }
        goto LABEL_28;
      }
      if (!-[EKObject isNew](self, "isNew"))
      {
        v21 = objc_msgSend(v8, "requiresOccurrencesConformToRecurrenceRule");
        if (a3)
        {
          if (v21)
          {
            -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[EKEvent conformsToRecurrenceRules:](self, "conformsToRecurrenceRules:", v22);

            if (!v23 && !-[EKEvent _isSimpleRepeatingEvent](self, "_isSimpleRepeatingEvent"))
            {
              if (a4)
              {
                v24 = (void *)MEMORY[0x1E0CB35C8];
                EKBundle();
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Choose another way to repeat this event or move it to another calendar."), &stru_1E4789A58, 0);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                EKBundle();
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("That calendar does not allow events to start outside of their recurrence patterns."), &stru_1E4789A58, 0);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "errorWithEKErrorCode:description:reason:", 13, v26, v28);
                *a4 = (id)objc_claimAutoreleasedReturnValue();

              }
              goto LABEL_28;
            }
          }
        }
      }
      if (objc_msgSend(v8, "occurrencesMustOccurOnSeparateDays")
        && -[EKEvent overlapsWithOrIsSameDayAsEventInSeries](self, "overlapsWithOrIsSameDayAsEventInSeries"))
      {
        if (a4)
        {
          v19 = (void *)MEMORY[0x1E0CB35C8];
          v20 = 10;
          goto LABEL_20;
        }
LABEL_28:
        v7 = 0;
        goto LABEL_29;
      }
      if (objc_msgSend(v8, "occurrenceOrderEnforcedAfterDetachment")
        && -[EKEvent isOutOfOrderWithEventInSeries](self, "isOutOfOrderWithEventInSeries"))
      {
        if (a4)
        {
          v19 = (void *)MEMORY[0x1E0CB35C8];
          v20 = 69;
          goto LABEL_20;
        }
        goto LABEL_28;
      }
    }
    v7 = 1;
    goto LABEL_29;
  }
  return 1;
}

- (BOOL)durationOverlapsRecurrenceInterval
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x1E0C99D48];
    -[EKObject eventStore](self, "eventStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "CalGregorianCalendarForTimeZone:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKEvent startDate](self, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v3;
    v10 = v3;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      v14 = 1;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v16, "interval") >= 1)
          {
            objc_msgSend(v16, "dateComponents");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v17, v8, 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v18, "CalIsBeforeDate:", v9))
              v14 = 0;

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }
    else
    {
      v14 = 1;
    }

    v19 = (v14 & 1) == 0;
    v3 = v21;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (BOOL)_notDetachedOccurrenceOfEvent:(id)a3 existsInDateRangeWithStartDate:(id)a4 endDate:(id)a5 inTimeZone:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  char v15;
  void *v16;
  uint64_t v17;
  double v18;
  id v19;
  EKRecurrenceGenerator *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;

  v9 = a3;
  v42 = a4;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v9, "hasRecurrenceRules"))
  {
    objc_msgSend(v9, "recurrenceRules");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "duration");
    v14 = v13;
    v41 = v12;
    if (objc_msgSend(v12, "count"))
    {
      v15 = 0;
      v16 = 0;
      v43 = 0;
      v44 = 0;
      v17 = 0;
      v18 = (double)(unint64_t)v14;
      v45 = v9;
      while (1)
      {
        v19 = v42;
        if ((v15 & 1) == 0)
          break;
LABEL_37:

        if (++v17 >= (unint64_t)objc_msgSend(v41, "count"))
          goto LABEL_41;
      }
      while (1)
      {
        if (!objc_msgSend(v19, "CalIsBeforeOrSameAsDate:", v10))
          goto LABEL_37;
        v20 = objc_alloc_init(EKRecurrenceGenerator);
        LOBYTE(v39) = 1;
        v21 = -[EKRecurrenceGenerator copyOccurrenceDatesWithEKEvent:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:](v20, "copyOccurrenceDatesWithEKEvent:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:", v9, v19, v10, v11, 0, 1, v39);
        if (!objc_msgSend(v21, "count"))
        {
          v23 = 0;
LABEL_36:

          goto LABEL_37;
        }
        objc_msgSend(v21, "objectAtIndex:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (!v22 || !objc_msgSend(v22, "CalIsBeforeOrSameAsDate:", v10))
          goto LABEL_36;
        if (objc_msgSend(v23, "CalIsAfterOrSameAsDate:", v19))
        {
          if (v16)
          {
            v24 = v44;
            if (!v44)
              goto LABEL_34;
          }
          else
          {
            objc_msgSend(v9, "exceptionDatesAdjustedForFloatingEvents");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v29;
            if (v29)
            {
              v31 = v29;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E60], "set");
              v31 = (id)objc_claimAutoreleasedReturnValue();
            }
            v16 = v31;

            objc_msgSend(v45, "detachedItems");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "valueForKey:", CFSTR("originalStartDate"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v35)
            {
              objc_msgSend(v16, "setByAddingObjectsFromSet:", v35);
              v36 = objc_claimAutoreleasedReturnValue();

              v16 = (void *)v36;
            }
            v24 = objc_msgSend(v16, "count");
            if (objc_msgSend(v45, "isFloating") && !v43)
            {
              objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
            }

            v9 = v45;
            if (!v24)
            {
LABEL_34:
              v44 = 0;
              v15 = 1;
              goto LABEL_24;
            }
          }
          v44 = v24;
          v25 = v23;
          v26 = v25;
          if (v43)
          {
            v27 = v11;
            if (!v11)
            {
              objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v40;
            }
            objc_msgSend(v26, "dateInTimeZone:fromTimeZone:", v43, v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v11)
          }
          else
          {
            v28 = v25;
          }
          v32 = objc_msgSend(v16, "containsObject:", v28);

          if (!v32)
          {
            v15 = 1;
            goto LABEL_23;
          }
          v15 = 0;
        }
        objc_msgSend(v23, "dateByAddingTimeInterval:", v18);
        v33 = objc_claimAutoreleasedReturnValue();

        v19 = (id)v33;
LABEL_23:
        v9 = v45;
LABEL_24:

        if ((v15 & 1) != 0)
          goto LABEL_37;
      }
    }
    v43 = 0;
    v16 = 0;
    v15 = 0;
LABEL_41:

    v37 = v15 & 1;
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (BOOL)_occurrenceExistsOnDate:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  EKEvent *v9;
  EKEvent *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[EKEvent requiresDetach](self, "requiresDetach");
  v9 = self;
  v10 = v9;
  v11 = v9;
  if (!v8)
  {
    -[EKCalendarItem originalItem](v9, "originalItem");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v28 = 0;
      v11 = v10;
      goto LABEL_24;
    }
    v11 = (void *)v12;

  }
  objc_msgSend(v6, "dateForStartOfDayInTimeZone:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ek_ios_dateForEndOfDayInTimeZone:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)objc_opt_class(), "_notDetachedOccurrenceOfEvent:existsInDateRangeWithStartDate:endDate:inTimeZone:", v11, v13, v14, v7) & 1) != 0)
  {
    v15 = 1;
  }
  else
  {
    v30 = v14;
    v31 = v11;
    v32 = v6;
    objc_msgSend(v11, "detachedItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v17)
    {
      v18 = v17;
      v15 = 0;
      v19 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((objc_msgSend(v21, "isEqual:", v10) & 1) == 0)
          {
            objc_msgSend(v21, "startDate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "isFloating"))
            {
              objc_msgSend(v22, "dateInTimeZone:fromTimeZone:", v7, 0);
              v23 = objc_claimAutoreleasedReturnValue();

              v22 = (void *)v23;
            }
            objc_msgSend(v22, "dateForStartOfDayInTimeZone:", v7);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "timeIntervalSinceReferenceDate");
            v26 = v25;
            objc_msgSend(v24, "timeIntervalSinceReferenceDate");
            if (vabdd_f64(v26, v27) < 2.22044605e-16)
              v15 = 1;

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v18);
    }
    else
    {
      v15 = 0;
    }

    v11 = v31;
    v6 = v32;
    v14 = v30;
  }

  v28 = v15 & 1;
LABEL_24:

  return v28;
}

- (BOOL)_checkStartDateConstraintAgainstDate:(id)a3 timeZone:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  int v8;

  v6 = a4;
  -[EKEvent constraints](self, "constraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "futureStartDateLimitedToOccurrenceCacheBounds");

  if (v8)
    CalEventOccurrenceCacheCopyBoundsForTimeZone();

  return 1;
}

- (BOOL)conformsToRecurrenceRules:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  EKRecurrenceGenerator *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  BOOL v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v8, "frequency"))
        {
          v9 = objc_alloc_init(EKRecurrenceGenerator);
          -[EKEvent startDate](self, "startDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKCalendarItem timeZone](self, "timeZone");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "dateForDayInTimeZone:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKCalendarItem timeZone](self, "timeZone");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "ek_ios_dateForEndOfDayInTimeZone:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[EKCalendarItem timeZone](self, "timeZone");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[EKRecurrenceGenerator copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:limit:](v9, "copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:limit:", self, v8, v12, v15, v16, 1);

          v18 = objc_msgSend(v17, "count");
          if (!v18)
          {
            v19 = 0;
            goto LABEL_12;
          }
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v5)
        continue;
      break;
    }
  }
  v19 = 1;
LABEL_12:

  return v19;
}

- (BOOL)allowsSpansOtherThanThisEvent
{
  void *v3;
  int v4;
  void *v6;
  BOOL v7;

  -[EKEvent constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requiresOccurrencesConformToRecurrenceRule");

  if (!v4 || -[EKEvent _isSimpleRepeatingEvent](self, "_isSimpleRepeatingEvent"))
    return 1;
  -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EKEvent conformsToRecurrenceRules:](self, "conformsToRecurrenceRules:", v6);

  return v7;
}

- (BOOL)allowsResponseCommentModifications
{
  void *v3;
  BOOL v4;

  if (!-[EKEvent allowsParticipationStatusModifications](self, "allowsParticipationStatusModifications"))
    return 0;
  -[EKEvent constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportsResponseComments"))
    v4 = -[EKCalendarItem actionsState](self, "actionsState") == 0;
  else
    v4 = 0;

  return v4;
}

- (BOOL)allowsClearingCommentsAsOrganizer
{
  void *v2;
  char v3;

  -[EKEvent constraints](self, "constraints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsClearingPrivateComments");

  return v3;
}

- (BOOL)_isSimpleRepeatingEvent
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isSimpleRule");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldCancelInsteadOfDeleteWithSpan:(int64_t)a3
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v13;
  void *v14;
  const __CFString *v15;
  SEL v16;
  EKEvent *v17;
  uint64_t v18;

  if (a3 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("EKSpanAutomaticChange not allowed here");
    v16 = a2;
    v17 = self;
    v18 = 7171;
LABEL_16:
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", v16, v17, CFSTR("EKEvent.m"), v18, v15);

    goto LABEL_3;
  }
  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("EKSpanEveryOccurrenceUnlessAlreadyDetached not allowed here");
    v16 = a2;
    v17 = self;
    v18 = 7172;
    goto LABEL_16;
  }
LABEL_3:
  -[EKEvent constraints](self, "constraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldCancelDeletedEvents");

  if (!v7 || -[EKEvent isDetached](self, "isDetached") || !-[EKCalendarItem _hadAttendees](self, "_hadAttendees"))
    return 0;
  -[EKEvent committedValueForKey:](self, "committedValueForKey:", *MEMORY[0x1E0D0B330]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "isCurrentUser");
    if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 0)
      v11 = 0;
    else
      v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_shouldDeclineInsteadOfDelete
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[EKEvent constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldDeclineDeletedInvitations");

  if (!v4 || !-[EKCalendarItem _hadAttendees](self, "_hadAttendees"))
    return 0;
  -[EKEvent committedValueForKey:](self, "committedValueForKey:", *MEMORY[0x1E0D0B330]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v5 && (objc_msgSend(v5, "isCurrentUser") & 1) == 0 && -[EKEvent status](self, "status") != EKEventStatusCanceled;

  return v7;
}

- (void)_deleteWithSpan:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  EKEvent *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
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
  char v31;
  void *v32;
  const __CFString *v33;
  SEL v34;
  EKEvent *v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
      if (-[EKEvent isDetached](self, "isDetached"))
      {
        -[EKCalendarItem originalItem](self, "originalItem");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEvent originalStartDate](self, "originalStartDate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_addExceptionDate:", v6);

        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(v5, "detachedItems");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        if (!v8)
          goto LABEL_18;
        v9 = v8;
        v10 = *(_QWORD *)v43;
        while (1)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v43 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            if ((objc_msgSend(v12, "isEqual:", self) & 1) != 0)
            {
              v14 = v12;

              if (v14)
              {
                objc_msgSend(v5, "_removeDetachedItem:", v14);
                v7 = v14;
                goto LABEL_18;
              }
LABEL_19:
              -[EKCalendarItem _deleteSelfAndDetached](self, "_deleteSelfAndDetached");
              -[EKObject addCoCommitObject:](self, "addCoCommitObject:", v5);
              goto LABEL_43;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
          if (!v9)
          {
LABEL_18:

            goto LABEL_19;
          }
        }
      }
      -[EKEvent singleRecurrenceRule](self, "singleRecurrenceRule");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        -[EKEvent _deleteThisOccurrence](self, "_deleteThisOccurrence");
      else
        -[EKCalendarItem _deleteSelfAndDetached](self, "_deleteSelfAndDetached");
      return;
    case 1:
      if (-[EKEvent isDetached](self, "isDetached"))
      {
        -[EKEvent originalStartDate](self, "originalStartDate");
        v37 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[EKEvent originalOccurrenceStartDate](self, "originalOccurrenceStartDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "date");
        v37 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (-[EKEvent isFloating](self, "isFloating"))
      {
        -[EKObject eventStore](self, "eventStore");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeZone");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "dateInTimeZone:fromTimeZone:", 0, v18);
        v19 = objc_claimAutoreleasedReturnValue();

        v37 = (id)v19;
      }
      if (-[EKEvent isDetached](self, "isDetached"))
      {
        -[EKCalendarItem originalItem](self, "originalItem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_deleteFromOccurrenceDateOnward:includeSlices:", v37, 1);

      }
      else
      {
        -[EKEvent _deleteFromOccurrenceDateOnward:includeSlices:](self, "_deleteFromOccurrenceDateOnward:includeSlices:", v37, 1);
      }
      goto LABEL_28;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("EKSpanEveryOccurrenceUnlessAlreadyDetached not allowed here");
      v37 = v32;
      v34 = a2;
      v35 = self;
      v36 = 7217;
      goto LABEL_46;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("EKSpanAutomaticChange not allowed here");
      v37 = v32;
      v34 = a2;
      v35 = self;
      v36 = 7216;
LABEL_46:
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", v34, v35, CFSTR("EKEvent.m"), v36, v33);
LABEL_28:

      return;
    case 4:
      if (-[EKEvent isDetached](self, "isDetached"))
      {
        -[EKCalendarItem originalItem](self, "originalItem");
        v15 = (EKEvent *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = self;
      }
      v5 = v15;
      -[EKEvent recurrenceSet](v15, "recurrenceSet");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        -[EKObject eventStore](self, "eventStore");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "eventsWithSameRecurrenceSetAsEvent:", v5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v39;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v39 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
              objc_msgSend(v28, "eventOccurrenceID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[EKEvent eventOccurrenceID](self, "eventOccurrenceID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v29, "isEqualToString:", v30);

              if ((v31 & 1) == 0)
              {
                objc_msgSend(v28, "_deleteSelfAndDetached");
                objc_msgSend(v28, "updatePersistentObject");
                -[EKObject addCoCommitObject:](self, "addCoCommitObject:", v28);
              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          }
          while (v25);
        }

      }
      objc_msgSend(v5, "_deleteSelfAndDetached");
LABEL_43:

      return;
    default:
      return;
  }
}

- (void)_deleteFromOccurrenceDateOnward:(id)a3 includeSlices:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t m;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  int v68;
  id obj;
  EKRecurrenceGenerator *v70;
  void *v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v4 = a4;
  v98 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[EKEvent _committedStartDate](self, "_committedStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem timeZone](self, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = (void *)CalTimeZoneCopyCFTimeZone();
  v66 = v8;
  if (v4)
  {
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    -[EKObject eventStore](self, "eventStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "eventsWithSameRecurrenceSetAsEvent:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v90;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v90 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
          objc_msgSend(v15, "startDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isAfterDate:", v6);

          if (v17)
          {
            objc_msgSend(v15, "_deleteSelfAndDetached");
            -[EKObject addCoCommitObject:](self, "addCoCommitObject:", v15);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
      }
      while (v12);
    }

    v8 = v66;
  }
  -[EKEvent constraints](self, "constraints");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "recurrenceSeriesMustIncludeMoreThanFirstOccurrence");

  v68 = v19;
  if (v19)
    v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v67 = 0;
  -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v7;
  if (objc_msgSend(v20, "count"))
  {
    v21 = v7;
    objc_msgSend(v6, "dateByAddingTimeInterval:", -1.0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_alloc_init(EKRecurrenceGenerator);
  }
  else
  {
    v70 = 0;
    v71 = 0;
    v21 = 0;
  }
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = v20;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
  v65 = v21;
  if (!v22)
    goto LABEL_46;
  v23 = v22;
  v72 = *(_QWORD *)v86;
  do
  {
    v24 = 0;
    do
    {
      if (*(_QWORD *)v86 != v72)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v24);
      objc_msgSend(v25, "recurrenceEnd");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "occurrenceCount"))
      {
        LOBYTE(v63) = 0;
        v27 = -[EKRecurrenceGenerator copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:](v70, "copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:", self, v25, v21, v71, v8, 0, 0, v63);
        v28 = objc_msgSend(v27, "count");
        v29 = v28;
        if (v28 < 2)
        {
          if (v28 != 1)
          {
            -[EKCalendarItem _deleteSelfAndDetached](self, "_deleteSelfAndDetached", v28);
            v62 = obj;
            v47 = obj;
            v49 = v64;
            goto LABEL_78;
          }
          if (v68)
          {
            objc_msgSend(v67, "addObject:", v25);
            goto LABEL_41;
          }
          v29 = 1;
        }
        +[EKRecurrenceEnd recurrenceEndWithOccurrenceCount:](EKRecurrenceEnd, "recurrenceEndWithOccurrenceCount:", v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setRecurrenceEnd:", v32);
        goto LABEL_40;
      }
      objc_msgSend(v26, "endDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v30;
      if (!v30 || objc_msgSend(v30, "CalIsAfterOrSameAsDate:", v6))
      {
        LOBYTE(v63) = 0;
        v31 = -[EKRecurrenceGenerator copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:](v70, "copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:", self, v25, v21, v71, v8, 0, 0, v63);
        v32 = v31;
        if (v68)
        {
          v33 = objc_msgSend(v31, "count");
          if (v33 >= 2)
          {
            objc_msgSend(v32, "lastObject");
            v34 = objc_claimAutoreleasedReturnValue();
            goto LABEL_39;
          }
          if (v33 == 1)
            objc_msgSend(v67, "addObject:", v25);
        }
        else
        {
          objc_msgSend(v31, "lastObject");
          v34 = objc_claimAutoreleasedReturnValue();
          if (!v34)
          {
            -[EKCalendarItem _deleteSelfAndDetached](self, "_deleteSelfAndDetached");

            v62 = obj;
            v47 = obj;
            v49 = v64;
            v21 = v65;
            goto LABEL_78;
          }
LABEL_39:
          v35 = (void *)v34;
          +[EKRecurrenceEnd recurrenceEndWithEndDate:](EKRecurrenceEnd, "recurrenceEndWithEndDate:", v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setRecurrenceEnd:", v36);

          v8 = v66;
          v21 = v65;
        }
LABEL_40:

      }
LABEL_41:

      ++v24;
    }
    while (v23 != v24);
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
    v23 = v37;
  }
  while (v37);
LABEL_46:

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v38 = v67;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v82;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v82 != v41)
          objc_enumerationMutation(v38);
        -[EKCalendarItem removeRecurrenceRule:](self, "removeRecurrenceRule:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * j));
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
    }
    while (v40);
  }

  -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "count");

  if (!v44)
    -[EKEvent _updateSelfFromDetachedEventIfNeededForDelete](self, "_updateSelfFromDetachedEventIfNeededForDelete");
  -[EKCalendarItem detachedItems](self, "detachedItems");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "allObjects");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v47 = v46;
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
  v49 = v64;
  if (v48)
  {
    v50 = v48;
    v51 = *(_QWORD *)v78;
    do
    {
      for (k = 0; k != v50; ++k)
      {
        if (*(_QWORD *)v78 != v51)
          objc_enumerationMutation(v47);
        v53 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * k);
        if ((objc_msgSend(v53, "hasRecurrenceRules") & 1) == 0)
        {
          objc_msgSend(v53, "originalStartDate");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v54, "CalIsAfterOrSameAsDate:", v6))
            -[EKCalendarItem _removeDetachedItem:](self, "_removeDetachedItem:", v53);

        }
      }
      v50 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
    }
    while (v50);
  }

  -[EKCalendarItem exceptionDates](self, "exceptionDates");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "allObjects");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v27 = v56;
  v57 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v73, v93, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v74;
    do
    {
      for (m = 0; m != v58; ++m)
      {
        if (*(_QWORD *)v74 != v59)
          objc_enumerationMutation(v27);
        v61 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * m);
        if (objc_msgSend(v61, "CalIsAfterDate:", v6))
          -[EKCalendarItem _removeExceptionDate:](self, "_removeExceptionDate:", v61);
      }
      v58 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v73, v93, 16);
    }
    while (v58);
  }
  v26 = v27;
  v21 = v65;
  v8 = v66;
  v62 = obj;
LABEL_78:

}

- (void)_updateSelfFromDetachedEventIfNeededForDelete
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  -[EKEvent _committedStartDate](self, "_committedStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  -[EKCalendarItem detachedItems](self, "detachedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v69;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v69 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v8);
      objc_msgSend(v9, "originalStartDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToDate:", v3);

      if ((v11 & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v9;

    if (!v12)
      goto LABEL_45;
    objc_msgSend(v12, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setStartDate:](self, "setStartDate:", v13);

    objc_msgSend(v12, "endDateUnadjustedForLegacyClients");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setEndDateUnadjustedForLegacyClients:](self, "setEndDateUnadjustedForLegacyClients:", v14);

    objc_msgSend(v12, "timeZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setTimeZone:](self, "setTimeZone:", v15);

    objc_msgSend(v12, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setTitle:](self, "setTitle:", v16);

    objc_msgSend(v12, "structuredLocationWithoutPrediction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "duplicate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setStructuredLocation:](self, "setStructuredLocation:", v18);

    objc_msgSend(v12, "clientLocation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "duplicate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem setClientLocation:](self, "setClientLocation:", v20);

    objc_msgSend(v12, "notes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setNotes:](self, "setNotes:", v21);

    -[EKEvent setStatus:](self, "setStatus:", objc_msgSend(v12, "status"));
    -[EKEvent setAvailability:](self, "setAvailability:", objc_msgSend(v12, "availability"));
    -[EKEvent setPrivacyLevel:](self, "setPrivacyLevel:", objc_msgSend(v12, "privacyLevel"));
    objc_msgSend(v12, "travelTime");
    -[EKEvent setTravelTime:](self, "setTravelTime:");
    objc_msgSend(v12, "URL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setURL:](self, "setURL:", v22);

    -[EKEvent setTravelAdvisoryBehavior:](self, "setTravelAdvisoryBehavior:", objc_msgSend(v12, "travelAdvisoryBehavior"));
    -[EKCalendarItem setAlarms:](self, "setAlarms:", 0);
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend(v12, "alarms");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v65 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "duplicate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKCalendarItem addAlarm:](self, "addAlarm:", v28);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
      }
      while (v25);
    }

    -[EKCalendarItem selfAttendee](self, "selfAttendee");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem attendees](self, "attendees");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copy");

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v32 = v31;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v61 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
          if ((objc_msgSend(v37, "isEqual:", v29) & 1) == 0)
            -[EKCalendarItem removeAttendee:](self, "removeAttendee:", v37);
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
      }
      while (v34);
    }

    objc_msgSend(v12, "selfAttendee");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v12, "attendees");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v57;
      do
      {
        for (k = 0; k != v41; ++k)
        {
          if (*(_QWORD *)v57 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * k);
          if ((objc_msgSend(v44, "isEqual:", v38) & 1) == 0)
          {
            v45 = (void *)objc_msgSend(v44, "copy");
            -[EKCalendarItem addAttendee:](self, "addAttendee:", v45);

          }
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
      }
      while (v41);
    }

    -[EKCalendarItem setAttachments:](self, "setAttachments:", 0);
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v12, "attachments", 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v53;
      do
      {
        for (m = 0; m != v48; ++m)
        {
          if (*(_QWORD *)v53 != v49)
            objc_enumerationMutation(v46);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * m), "duplicate");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKCalendarItem addAttachment:](self, "addAttachment:", v51);

        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
      }
      while (v48);
    }

    -[EKCalendarItem _removeDetachedItem:](self, "_removeDetachedItem:", v12);
  }
  else
  {
LABEL_9:
    v12 = v4;
  }

LABEL_45:
}

- (void)_deleteThisOccurrence
{
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
  char v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  id obj;
  void *v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  EKRecurrenceGenerator *v44;
  _QWORD v45[4];
  id v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  -[EKEvent originalOccurrenceStartDate](self, "originalOccurrenceStartDate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "date");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKEvent isFloating](self, "isFloating"))
  {
    -[EKObject eventStore](self, "eventStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dateInTimeZone:fromTimeZone:", 0, v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v36 = (void *)v5;
  }
  -[EKCalendarItem exceptionDates](self, "exceptionDates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v43 = v7;
  objc_msgSend(v7, "addObject:", v36);
  v44 = objc_alloc_init(EKRecurrenceGenerator);
  -[EKEvent _committedStartDate](self, "_committedStartDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D0C420];
  -[EKCalendarItem timeZone](self, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calendarDateWithDate:timeZone:", v35, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = 0u;
  v60 = 0u;
  v58 = 0u;
  v57 = 0u;
  -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  obj = v12;
  v42 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (!v42)
  {

    v13 = 0;
    goto LABEL_34;
  }
  v13 = 0;
  v40 = 0;
  v41 = *(_QWORD *)v58;
  do
  {
    for (i = 0; i != v42; ++i)
    {
      if (*(_QWORD *)v58 != v41)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKRecurrenceGenerator nextOccurrenceDateWithEKRecurrences:forCalendarItem:exceptionDates:initialDate:afterDate:](v44, "nextOccurrenceDateWithEKRecurrences:forCalendarItem:exceptionDates:initialDate:afterDate:", v16, self, v43, v10, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        -[EKCalendarItem removeRecurrenceRule:](self, "removeRecurrenceRule:", v15);
        v13 = 1;
        goto LABEL_29;
      }
      objc_msgSend(v15, "recurrenceEnd");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKRecurrenceGenerator nextOccurrenceDateWithEKRecurrences:forCalendarItem:exceptionDates:initialDate:afterDate:](v44, "nextOccurrenceDateWithEKRecurrences:forCalendarItem:exceptionDates:initialDate:afterDate:", v19, self, v43, v10, v39);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          -[EKEvent _committedStartDate](self, "_committedStartDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[EKEvent isFloating](self, "isFloating"))
          {
            -[EKObject eventStore](self, "eventStore");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "timeZone");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "dateInTimeZone:fromTimeZone:", 0, v23);
            v24 = objc_claimAutoreleasedReturnValue();

            v21 = (void *)v24;
          }
          objc_msgSend(v18, "endDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = v25 == 0;
          objc_msgSend(v39, "date");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKCalendarItem timeZone](self, "timeZone");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v29 = -[EKRecurrenceGenerator copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:](v44, "copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:", self, v15, v21, v27, v28, 0, 0);

            v53 = 0;
            v54 = &v53;
            v55 = 0x2020000000;
            v56 = 0;
            v49 = 0;
            v50 = &v49;
            v51 = 0x2020000000;
            v52 = 0;
            v45[0] = MEMORY[0x1E0C809B0];
            v45[1] = 3221225472;
            v45[2] = __32__EKEvent__deleteThisOccurrence__block_invoke;
            v45[3] = &unk_1E4787108;
            v46 = v43;
            v47 = &v49;
            v48 = &v53;
            objc_msgSend(v29, "enumerateObjectsWithOptions:usingBlock:", 2, v45);
            if (*((_BYTE *)v54 + 24))
            {
              +[EKRecurrenceEnd recurrenceEndWithOccurrenceCount:](EKRecurrenceEnd, "recurrenceEndWithOccurrenceCount:", v50[3]);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v31 = 0;
            }

            _Block_object_dispose(&v49, 8);
            _Block_object_dispose(&v53, 8);
          }
          else
          {
            v29 = -[EKRecurrenceGenerator copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:](v44, "copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:", self, v15, v21, v27, v28, v43, 0);

            if (objc_msgSend(v29, "count"))
            {
              objc_msgSend(v29, "lastObject");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKEvent.m"), 7620, CFSTR("Unexpected number of occurrences (0) remaining in series after deleting the last remaining occurrence."));

              v30 = 0;
            }
            +[EKRecurrenceEnd recurrenceEndWithEndDate:](EKRecurrenceEnd, "recurrenceEndWithEndDate:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v15, "setRecurrenceEnd:", v31);

          v13 = 1;
          goto LABEL_28;
        }

      }
      if ((v40 & 1) != 0)
        v40 = 1;
      else
        v40 = -[EKRecurrenceGenerator occurrenceDate:matchesRecurrenceRule:forEvent:includeDetachedEventsInSeries:](v44, "occurrenceDate:matchesRecurrenceRule:forEvent:includeDetachedEventsInSeries:", v39, v15, self, 1);
LABEL_28:

LABEL_29:
    }
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  }
  while (v42);

  if ((v40 & 1) != 0)
    -[EKCalendarItem _addExceptionDate:](self, "_addExceptionDate:", v36);
LABEL_34:
  -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count") == 0;

  if (v34)
    -[EKEvent _updateSelfFromDetachedEventIfNeededForDelete](self, "_updateSelfFromDetachedEventIfNeededForDelete");
  if ((v13 & 1) != 0)
    -[EKEvent _filterExceptionDatesAndDetachments](self, "_filterExceptionDatesAndDetachments");

}

uint64_t __32__EKEvent__deleteThisOccurrence__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if ((result & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 + 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_cancelWithSpan:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  int v30;
  void *v32;
  void *v33;
  const __CFString *v34;
  SEL v35;
  EKEvent *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 4:
      -[EKEvent setStatus:](self, "setStatus:", 3, a4);
      -[EKEvent _cancelDetachedEvents](self, "_cancelDetachedEvents");
      v17 = 1;
      goto LABEL_11;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 3, a4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("EKSpanAutomaticChange not allowed here");
      v35 = a2;
      v36 = self;
      v37 = 7699;
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 2, a4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("EKSpanEveryOccurrenceUnlessAlreadyDetached not allowed here");
      v35 = a2;
      v36 = self;
      v37 = 7700;
      break;
    default:
      goto LABEL_4;
  }
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", v35, v36, CFSTR("EKEvent.m"), v37, v34);

LABEL_4:
  if (-[EKCalendarItem _hadRecurrenceRules](self, "_hadRecurrenceRules"))
  {
    -[EKEvent originalOccurrenceStartDate](self, "originalOccurrenceStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKEvent occurrenceStartDate](self, "occurrenceStartDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[EKEvent isFloating](self, "isFloating"))
    {
      -[EKObject eventStore](self, "eventStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeZone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dateInTimeZone:fromTimeZone:", 0, v12);
      v13 = objc_claimAutoreleasedReturnValue();

      -[EKObject eventStore](self, "eventStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeZone");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateInTimeZone:fromTimeZone:", 0, v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v16;
      v8 = (void *)v13;
    }
    -[EKEvent _detachOrSliceWithSpan:withOriginalStartDate:newStartDate:](self, "_detachOrSliceWithSpan:withOriginalStartDate:newStartDate:", a3, v8, v10);
    -[EKObject insertPersistentObjectIfNeeded](self, "insertPersistentObjectIfNeeded");

  }
  -[EKEvent setStatus:](self, "setStatus:", 3);
  if (a3 == 1)
  {
    v17 = 0;
LABEL_11:
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[EKObject eventStore](self, "eventStore", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "eventsWithSameRecurrenceSetAsEvent:", self);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v39 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v24, "eventOccurrenceID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKEvent eventOccurrenceID](self, "eventOccurrenceID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v25, "isEqualToString:", v26);

          if ((v27 & 1) == 0)
          {
            if ((v17 & 1) != 0
              || (objc_msgSend(v24, "startDate"),
                  v28 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[EKEvent startDate](self, "startDate"),
                  v29 = (void *)objc_claimAutoreleasedReturnValue(),
                  v30 = objc_msgSend(v28, "isAfterDate:", v29),
                  v29,
                  v28,
                  v30))
            {
              objc_msgSend(v24, "setStatus:", 3);
              if ((objc_msgSend(v24, "modifiedProperties") & 0x200) != 0)
                objc_msgSend(v24, "setModifiedProperties:", objc_msgSend(v24, "modifiedProperties") & 0xFFFFFDFFLL);
              -[EKObject addCoCommitObject:](self, "addCoCommitObject:", v24);
            }
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v21);
    }

  }
  if ((-[EKCalendarItem modifiedProperties](self, "modifiedProperties") & 0x200) != 0)
    -[EKCalendarItem setModifiedProperties:](self, "setModifiedProperties:", -[EKCalendarItem modifiedProperties](self, "modifiedProperties") & 0xFFFFFDFFLL);
  return 1;
}

- (void)_cancelDetachedEvents
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[EKCalendarItem detachedItems](self, "detachedItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setStatus:", 3);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (BOOL)_validateSpanForRemove:(int64_t)a3 error:(id *)a4
{
  BOOL result;
  id v6;

  result = 1;
  if ((unint64_t)a3 >= 2 && (_DWORD)a3 != 2 && (_DWORD)a3 != 4)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 13);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a4 = v6;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)removeWithSpan:(int64_t)a3 error:(id *)a4
{
  int64_t v5;
  int v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
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
  char v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v5 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend((id)objc_opt_class(), "_validateSpanForRemove:error:", a3, a4);
  if (!v7)
    return v7;
  if (-[EKEvent isDetached](self, "isDetached")
    && !objc_msgSend((id)objc_opt_class(), "_allowSlicingFromDetachedOccurrence"))
  {
    v5 = 0;
  }
  if (!-[EKEvent isOrWasPartOfRecurringSeries](self, "isOrWasPartOfRecurringSeries"))
  {
    -[EKEvent recurrenceSet](self, "recurrenceSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
LABEL_12:
      v5 = 4;
      goto LABEL_14;
    }
  }
  if (!v5)
    goto LABEL_10;
  if (v5 == 2)
  {
    if (-[EKEvent isDetached](self, "isDetached"))
    {
LABEL_10:
      if (-[EKEvent _eventIsTheOnlyRemainingOccurrence](self, "_eventIsTheOnlyRemainingOccurrence"))
      {
        -[EKEvent recurrenceSet](self, "recurrenceSet");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9 == 0;

        v5 = 4 * v10;
      }
      else
      {
        v5 = 0;
      }
      goto LABEL_14;
    }
    goto LABEL_12;
  }
LABEL_14:
  if (-[EKEvent isFirstOccurrenceIncludingSlices](self, "isFirstOccurrenceIncludingSlices") && v5 == 1)
    v5 = 4;
  if (-[EKEvent _shouldCancelInsteadOfDeleteWithSpan:](self, "_shouldCancelInsteadOfDeleteWithSpan:", v5))
  {
    v7 = -[EKEvent _cancelWithSpan:error:](self, "_cancelWithSpan:error:", v5, a4);
    if (!v7)
      return v7;
  }
  else if (-[EKEvent _shouldDeclineInsteadOfDelete](self, "_shouldDeclineInsteadOfDelete"))
  {
    -[EKEvent recurrenceSet](self, "recurrenceSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      -[EKObject eventStore](self, "eventStore", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "eventsWithSameRecurrenceSetAsEvent:", self);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_msgSend(v18, "setParticipationStatus:", 3);
            objc_msgSend(v18, "setInvitationStatus:", 0);
            objc_msgSend(v18, "eventOccurrenceID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKEvent eventOccurrenceID](self, "eventOccurrenceID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v19, "isEqualToString:", v20);

            if ((v21 & 1) == 0)
              -[EKObject addCoCommitObject:](self, "addCoCommitObject:", v18);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v15);
      }

    }
    else
    {
      -[EKEvent setParticipationStatus:](self, "setParticipationStatus:", 3);
      -[EKEvent setInvitationStatus:](self, "setInvitationStatus:", 0);
    }
  }
  else
  {
    -[EKEvent _deleteWithSpan:](self, "_deleteWithSpan:", v5);
  }
  -[EKObject updatePersistentObject](self, "updatePersistentObject");
  if (!v5)
    -[EKObject clearCachedValueForKey:](self, "clearCachedValueForKey:", CFSTR("isFirstOccurrenceIncludingSlices"));
  LOBYTE(v7) = 1;
  return v7;
}

- (BOOL)isFirstOccurrenceIncludingSlices
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__EKEvent_isFirstOccurrenceIncludingSlices__block_invoke;
  v5[3] = &unk_1E4784B98;
  v5[4] = self;
  -[EKObject cachedValueForKey:populateBlock:](self, "cachedValueForKey:populateBlock:", CFSTR("isFirstOccurrenceIncludingSlices"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

id __43__EKEvent_isFirstOccurrenceIncludingSlices__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;

  objc_msgSend(*(id *)(a1 + 32), "originalItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = v2;
  if (!v2)
    v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "eventsWithSameRecurrenceSetAsEvent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_306);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
    goto LABEL_8;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "originalStartDate");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
  v12 = objc_msgSend(v9, "isBeforeDate:", v10);

  if ((v12 & 1) != 0)
  {
    v13 = (void *)MEMORY[0x1E0C9AAA0];
  }
  else
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_noRemainingEarlierOccurrences"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

uint64_t __43__EKEvent_isFirstOccurrenceIncludingSlices__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (BOOL)isOrWasPartOfRecurringSeries
{
  return -[EKCalendarItem hasRecurrenceRules](self, "hasRecurrenceRules")
      || -[EKCalendarItem _hadRecurrenceRules](self, "_hadRecurrenceRules")
      || -[EKEvent isDetached](self, "isDetached");
}

- (id)masterEvent
{
  EKEvent *v3;
  EKEvent *v4;
  void *v5;
  EKEvent *v6;

  -[EKCalendarItem originalItem](self, "originalItem");
  v3 = (EKEvent *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[EKCalendarItem _hadRecurrenceRules](self, "_hadRecurrenceRules") || -[EKEvent isPhantom](self, "isPhantom"))
    && (v3 = self) != 0)
  {
    v4 = [EKEvent alloc];
    -[EKObject persistentObject](v3, "persistentObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[EKEvent initWithPersistentObject:](v4, "initWithPersistentObject:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)_eventIsTheOnlyRemainingOccurrence
{
  EKEvent *v3;
  EKEvent *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  EKRecurrenceGenerator *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v35;
  void *v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (-[EKEvent isDetached](self, "isDetached"))
  {
    -[EKCalendarItem originalItem](self, "originalItem");
    v3 = (EKEvent *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[EKCalendarItem hasRecurrenceRules](self, "hasRecurrenceRules"))
      return 1;
    v3 = self;
  }
  v4 = v3;
  if (-[EKEvent isPhantom](v3, "isPhantom"))
  {
    -[EKCalendarItem detachedItems](v4, "detachedItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (unint64_t)objc_msgSend(v5, "count") < 2;

  }
  else
  {
    -[EKObject eventStore](self, "eventStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eventsWithSameRecurrenceSetAsEvent:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 <= 1)
    {
      -[EKEvent originalOccurrenceStartDate](self, "originalOccurrenceStartDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[EKEvent isFloating](self, "isFloating"))
      {
        -[EKObject eventStore](self, "eventStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeZone");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dateInTimeZone:fromTimeZone:", 0, v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v14;
      }
      -[EKCalendarItem exceptionDates](v4, "exceptionDates");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        -[EKCalendarItem exceptionDates](v4, "exceptionDates");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setByAddingObject:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v19 = objc_msgSend(v18, "count");
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      -[EKCalendarItem recurrenceRules](v4, "recurrenceRules");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v20)
      {
        v21 = v20;
        v35 = v11;
        v36 = v10;
        v39 = v19 + 2;
        v40 = v18;
        v38 = *(_QWORD *)v42;
        v22 = *MEMORY[0x1E0D0B308];
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v42 != v38)
              objc_enumerationMutation(obj);
            v24 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
            v25 = objc_alloc_init(EKRecurrenceGenerator);
            -[EKEvent committedValueForKey:](self, "committedValueForKey:", v22);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "BOOLValue");

            if ((v27 & 1) != 0)
            {
              -[EKObject eventStore](self, "eventStore");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "timeZone");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              -[EKCalendarItem timeZone](v4, "timeZone");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = -[EKRecurrenceGenerator copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:](v25, "copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:", v4, v24, v30, v31, v29, v40, v39);

            v33 = objc_msgSend(v32, "count");
            if (v33)
            {
              v6 = 0;
              goto LABEL_28;
            }
          }
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          if (v21)
            continue;
          break;
        }
        v6 = 1;
LABEL_28:
        v11 = v35;
        v10 = v36;
        v18 = v40;
      }
      else
      {
        v6 = 1;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)_noRemainingEarlierOccurrences
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  EKEvent *v12;
  EKEvent *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  EKRecurrenceGenerator *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v31;
  void *v32;

  if (!-[EKEvent isOrWasPartOfRecurringSeries](self, "isOrWasPartOfRecurringSeries"))
    return 1;
  -[EKEvent committedValueForKey:](self, "committedValueForKey:", *MEMORY[0x1E0D0B308]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = v4 | -[EKEvent isFloating](self, "isFloating");
  if ((v5 & 1) != 0)
  {
    -[EKObject eventStore](self, "eventStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[EKCalendarItem timeZone](self, "timeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[EKEvent originalOccurrenceStartDate](self, "originalOccurrenceStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v10, "dateInTimeZone:fromTimeZone:", 0, v7);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  if (-[EKEvent isDetached](self, "isDetached"))
  {
    -[EKCalendarItem originalItem](self, "originalItem");
    v12 = (EKEvent *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = self;
  }
  v13 = v12;
  -[EKObject eventStore](self, "eventStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "eventsWithSameRecurrenceSetAsEvent:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v15;
  objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_307);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "count"))
    goto LABEL_14;
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent startDate](v13, "startDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isBeforeDate:", v19);

  if ((v20 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
LABEL_14:
    v31 = v7;
    -[EKCalendarItem recurrenceRules](v13, "recurrenceRules");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKCalendarItem exceptionDates](v13, "exceptionDates");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count") + 1;
    v25 = objc_alloc_init(EKRecurrenceGenerator);
    if ((v4 & 1) != 0)
    {
      -[EKObject eventStore](self, "eventStore");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeZone");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[EKCalendarItem timeZone](v13, "timeZone");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[EKRecurrenceGenerator copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:](v25, "copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:", v13, v22, v28, v10, v27, v23, v24);

    v8 = objc_msgSend(v29, "count") == 0;
    v7 = v31;
  }

  return v8;
}

uint64_t __41__EKEvent__noRemainingEarlierOccurrences__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)rebaseToEventStore:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v4 = a3;
  -[EKEvent constraints](self, "constraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "requiresSeparateFilesForAllAttachments");

  -[EKCalendarItem selfAttendee](self, "selfAttendee");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0D0B620], *MEMORY[0x1E0D0B3F8], *MEMORY[0x1E0D0B358], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject rebaseSkippingRelationProperties:toEventStore:](self, "rebaseSkippingRelationProperties:toEventStore:", v7, v4);

  if (v6)
    -[EKEvent _recursivelyAssignAllAttachmentsNewIdentities](self, "_recursivelyAssignAllAttachmentsNewIdentities");
  if (v8)
    -[EKEvent _updateSelfAttendeeToMatchSelfAttendee:](self, "_updateSelfAttendeeToMatchSelfAttendee:", v8);

}

- (void)rebaseSkippingRelationProperties:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  -[EKEvent constraints](self, "constraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "requiresSeparateFilesForAllAttachments"))
  {
    v6 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0D0B270]);

    v7.receiver = self;
    v7.super_class = (Class)EKEvent;
    -[EKObject rebaseSkippingRelationProperties:](&v7, sel_rebaseSkippingRelationProperties_, v4);

    if ((v6 & 1) == 0)
      -[EKEvent _recursivelyAssignAllAttachmentsNewIdentities](self, "_recursivelyAssignAllAttachmentsNewIdentities");
  }
  else
  {

    v7.receiver = self;
    v7.super_class = (Class)EKEvent;
    -[EKObject rebaseSkippingRelationProperties:](&v7, sel_rebaseSkippingRelationProperties_, v4);

  }
}

- (void)_recursivelyAssignAllAttachmentsNewIdentities
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[EKEvent _assignAllAttachmentsNewIdentities](self, "_assignAllAttachmentsNewIdentities");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[EKCalendarItem detachedItems](self, "detachedItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_assignAllAttachmentsNewIdentities");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_assignAllAttachmentsNewIdentities
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[EKCalendarItem attachments](self, "attachments", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "assignNewIdentity");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)_shouldPreserveFutureWhenSlicingWithStartDate:(id)a3 newStartDate:(id)a4
{
  void *v4;
  char v5;

  -[EKEvent constraints](self, "constraints", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsRecurrenceSplit");

  return v5;
}

- (void)_detachOrSliceWithSpan:(int64_t)a3 withOriginalStartDate:(id)a4 newStartDate:(id)a5
{
  EKEvent *v8;
  id v9;
  id v10;
  void *v11;
  EKEvent *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  EKEvent *v17;

  v8 = self;
  v9 = a5;
  v10 = a4;
  v17 = v8;
  if (-[EKEvent isDetached](v8, "isDetached"))
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot detach an already detached occurrence"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "raise");

    }
    v12 = [EKEvent alloc];
    -[EKCalendarItem originalItem](v8, "originalItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "persistentObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent originalStartDate](v8, "originalStartDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[EKEvent initWithPersistentObject:occurrenceDate:](v12, "initWithPersistentObject:occurrenceDate:", v14, v15);

    if (-[EKObject _hasChangesForKey:](v8, "_hasChangesForKey:", *MEMORY[0x1E0D0B350]))
    {
      -[EKCalendarItem recurrenceRules](v8, "recurrenceRules");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent setRecurrenceRules:](v17, "setRecurrenceRules:", v16);

    }
  }
  objc_msgSend((id)objc_opt_class(), "_detachOrSliceEvent:withSpan:savingEvent:withOriginalStartDate:newStartDate:", v17, a3, v8, v10, v9);

  v8->_isMainOccurrence = !-[EKEvent isDetached](v8, "isDetached");
}

+ (void)_detachOrSliceEvent:(id)a3 withSpan:(int64_t)a4 savingEvent:(id)a5 withOriginalStartDate:(id)a6 newStartDate:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  char v52;
  EKAttendee *v53;
  void *v54;
  EKAttendee *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  void *v61;
  int v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  void *v69;
  char v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t m;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t n;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t ii;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  int v92;
  uint64_t v93;
  EKRecurrenceGenerator *v94;
  void *v95;
  id v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t jj;
  id v108;
  id v109;
  void *v110;
  void *v111;
  char v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t kk;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  id v137;
  id v138;
  id v139;
  id v140;
  int v141;
  int64_t v142;
  void *v143;
  void *v144;
  id v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  char v153;
  void *v154;
  int v155;
  id v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  _BYTE v196[128];
  uint64_t v197;

  v197 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (a4 == 1)
    v15 = objc_msgSend(v12, "_shouldPreserveFutureWhenSlicingWithStartDate:newStartDate:", v13, v14);
  else
    v15 = 0;
  v141 = objc_msgSend(v12, "isFirstOccurrence");
  v153 = objc_msgSend(v13, "isEqual:", v14);
  objc_msgSend(v12, "originalStartDate");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (void *)v16;
  else
    v18 = v13;
  v156 = v18;

  objc_msgSend(v12, "masterEvent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "selfAttendee");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attendees");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "alarms");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recurrenceRules");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x1E0D0B620];
  v22 = *MEMORY[0x1E0D0B3F8];
  v23 = *MEMORY[0x1E0D0B358];
  v155 = v15;
  if (v15)
  {
    v152 = *MEMORY[0x1E0D0B2A8];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v21, v22, *MEMORY[0x1E0D0B2A8], v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "rebaseSkippingRelationProperties:", v24);

    objc_msgSend(v11, "_generateNewUniqueID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setUniqueID:", v25);

    objc_msgSend(v12, "addCoCommitObject:", v19);
  }
  else
  {
    v152 = *MEMORY[0x1E0D0B2A8];
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", v21, v22, *MEMORY[0x1E0D0B278], v23, *MEMORY[0x1E0D0B2B0], *MEMORY[0x1E0D0B2A8], *MEMORY[0x1E0D0B268], 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (!a4)
      objc_msgSend(v26, "addObject:", *MEMORY[0x1E0D0B350]);
    objc_msgSend(v11, "persistentObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rebaseSkippingRelationProperties:", v27);
    objc_msgSend(v11, "persistentObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addCoCommitObject:", v28);

    objc_msgSend(v27, "allObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "emptyMeltedCacheForKeys:", v30);

    objc_msgSend(v11, "_generateNewUniqueID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUniqueID:", v31);

    if (v12 != v11)
    {
      objc_msgSend(v12, "addCoCommitObject:", v11);
      if (objc_msgSend(v12, "_hasChangesForKey:", *MEMORY[0x1E0D0B280]))
      {
        objc_msgSend(v12, "calendar");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setCalendar:", v32);

      }
    }

    v15 = 0;
  }
  if (a4 == 1)
  {
    objc_msgSend(v11, "recurrenceSet");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      objc_msgSend(v19, "recurrenceSet");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(v19, "recurrenceSet");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setRecurrenceSet:", v35);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "UUIDString");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setRecurrenceSet:", v36);

      }
    }
    objc_msgSend(v11, "recurrenceSet");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setRecurrenceSet:", v37);

  }
  objc_msgSend(v12, "setStartDateRaw:", v14);
  objc_msgSend(v12, "duration");
  objc_msgSend(v14, "dateByAddingTimeInterval:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEndDateRaw:", v38);

  if (v11 != v12)
  {
    objc_msgSend(v11, "setStartDateRaw:", v156);
    objc_msgSend(v19, "duration");
    objc_msgSend(v156, "dateByAddingTimeInterval:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEndDateRaw:", v39);

  }
  v145 = v12;
  v150 = v19;
  v142 = a4;
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v19, "_updateSelfAttendeeToMatchSelfAttendee:", v20);
  }
  else
  {
    objc_msgSend(v11, "setAttendees:", MEMORY[0x1E0C9AA60]);
    objc_msgSend(v11, "constraints");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "attendeesUseDeletedByOrganizerStatus");

    if (v41)
    {
      v135 = v20;
      v137 = v14;
      v139 = v13;
      v42 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v146, "valueForKey:", *MEMORY[0x1E0D0B820]);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setWithArray:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v187 = 0u;
      v188 = 0u;
      v185 = 0u;
      v186 = 0u;
      objc_msgSend(v19, "attendees");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v185, v196, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v186;
        do
        {
          for (i = 0; i != v47; ++i)
          {
            if (*(_QWORD *)v186 != v48)
              objc_enumerationMutation(v45);
            v50 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * i);
            objc_msgSend(v50, "UUID");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v44, "containsObject:", v51);

            if ((v52 & 1) == 0)
            {
              v53 = [EKAttendee alloc];
              objc_msgSend(v50, "persistentObject");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = -[EKObject initWithPersistentObject:](v53, "initWithPersistentObject:", v54);

              -[EKObject rebase](v55, "rebase");
              -[EKAttendee setParticipantStatus:](v55, "setParticipantStatus:", -1);
              objc_msgSend(v11, "addAttendee:", v55);

            }
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v185, v196, 16);
        }
        while (v47);
      }

      v14 = v137;
      v13 = v139;
      v20 = v135;
    }
    v183 = 0u;
    v184 = 0u;
    v181 = 0u;
    v182 = 0u;
    v56 = v146;
    v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v181, v195, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v182;
      do
      {
        for (j = 0; j != v58; ++j)
        {
          if (*(_QWORD *)v182 != v59)
            objc_enumerationMutation(v56);
          v61 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * j);
          v62 = objc_msgSend(v61, "isEqual:", v20);
          objc_msgSend(v61, "rebase");
          objc_msgSend(v11, "addAttendee:", v61);
          if (v62)
          {
            objc_msgSend(v11, "setSelfAttendee:", v20);
            objc_msgSend(v61, "persistentObject");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setPersistentObject:", v63);

            objc_msgSend(v20, "_resetAfterUpdatingChangeSetOrBackingObject");
          }
        }
        v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v181, v195, 16);
      }
      while (v58);
    }

    objc_msgSend(v11, "setAllAlarms:", MEMORY[0x1E0C9AA60]);
    v179 = 0u;
    v180 = 0u;
    v177 = 0u;
    v178 = 0u;
    v64 = v144;
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v177, v194, 16);
    v19 = v150;
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v178;
      do
      {
        for (k = 0; k != v66; ++k)
        {
          if (*(_QWORD *)v178 != v67)
            objc_enumerationMutation(v64);
          v69 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * k);
          objc_msgSend(v69, "rebaseForDetachment");
          objc_msgSend(v11, "addAlarm:", v69);
        }
        v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v177, v194, 16);
      }
      while (v66);
    }

    v12 = v145;
    a4 = v142;
    v15 = v155;
  }
  if (a4 == 1)
  {
    if (v11 == v12)
      v70 = v153;
    else
      v70 = 1;
    if ((v70 & 1) != 0)
    {
      if (v15)
      {
        objc_msgSend(v11, "exceptionDates");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v173 = 0u;
        v174 = 0u;
        v175 = 0u;
        v176 = 0u;
        v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v173, v193, 16);
        if (v72)
        {
          v73 = v72;
          v74 = *(_QWORD *)v174;
          do
          {
            for (m = 0; m != v73; ++m)
            {
              if (*(_QWORD *)v174 != v74)
                objc_enumerationMutation(v71);
              v76 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * m);
              if (objc_msgSend(v76, "CalIsBeforeDate:", v156))
                objc_msgSend(v11, "_removeExceptionDate:", v76);
            }
            v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v173, v193, 16);
          }
          while (v73);
        }
      }
      else
      {
        v171 = 0u;
        v172 = 0u;
        v169 = 0u;
        v170 = 0u;
        objc_msgSend(v19, "exceptionDates");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v169, v192, 16);
        if (v77)
        {
          v78 = v77;
          v79 = *(_QWORD *)v170;
          do
          {
            for (n = 0; n != v78; ++n)
            {
              if (*(_QWORD *)v170 != v79)
                objc_enumerationMutation(v71);
              v81 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * n);
              if (objc_msgSend(v81, "CalIsAfterDate:", v156))
                objc_msgSend(v11, "_addExceptionDate:", v81);
            }
            v78 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v169, v192, 16);
          }
          while (v78);
        }
      }

    }
    else
    {
      objc_msgSend(v12, "setExceptionDates:", 0);
    }
    v138 = v14;
    v140 = v13;
    v154 = v11;
    objc_msgSend(v19, "startDate");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeZone");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v149)
      v149 = (void *)CalTimeZoneCopyCFTimeZone();
    v136 = v20;
    v167 = 0u;
    v168 = 0u;
    v165 = 0u;
    v166 = 0u;
    v82 = v143;
    v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v165, v191, 16);
    if (v83)
    {
      v84 = v83;
      v85 = *(_QWORD *)v166;
      do
      {
        for (ii = 0; ii != v84; ++ii)
        {
          if (*(_QWORD *)v166 != v85)
            objc_enumerationMutation(v82);
          v87 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * ii);
          objc_msgSend(v87, "recurrenceEnd");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "endDate");
          v89 = objc_claimAutoreleasedReturnValue();
          if (v89
            && (v90 = (void *)v89,
                objc_msgSend(v88, "endDate"),
                v91 = (void *)objc_claimAutoreleasedReturnValue(),
                v92 = objc_msgSend(v91, "CalIsBeforeDate:", v156),
                v91,
                v90,
                v92))
          {
            objc_msgSend(v154, "removeRecurrenceRule:", v87);
          }
          else if (objc_msgSend(v88, "occurrenceCount"))
          {
            v93 = objc_msgSend(v88, "occurrenceCount");
            v94 = objc_alloc_init(EKRecurrenceGenerator);
            objc_msgSend(v156, "dateByAddingTimeInterval:", -1.0);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v134) = 0;
            v96 = -[EKRecurrenceGenerator copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:](v94, "copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:", v150, v87, v148, v95, v149, 0, 0, v134);

            v97 = objc_msgSend(v96, "count");
            if (v93 == v97)
            {
              objc_msgSend(v154, "removeRecurrenceRule:", v87);
            }
            else
            {
              +[EKRecurrenceEnd recurrenceEndWithOccurrenceCount:](EKRecurrenceEnd, "recurrenceEndWithOccurrenceCount:", v93 - v97);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "setRecurrenceEnd:", v98);

            }
          }

        }
        v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v165, v191, 16);
      }
      while (v84);
    }

    if (v155)
      v99 = v154;
    else
      v99 = v150;
    if (v155)
      v100 = v150;
    else
      v100 = v154;
    v101 = v99;
    v102 = v100;
    v161 = 0u;
    v162 = 0u;
    v163 = 0u;
    v164 = 0u;
    v151 = v101;
    objc_msgSend(v101, "detachedItems");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v161, v190, 16);
    v12 = v145;
    if (v104)
    {
      v105 = v104;
      v106 = *(_QWORD *)v162;
      v147 = *MEMORY[0x1E0D0B338];
      do
      {
        for (jj = 0; jj != v105; ++jj)
        {
          if (*(_QWORD *)v162 != v106)
            objc_enumerationMutation(v103);
          v108 = *(id *)(*((_QWORD *)&v161 + 1) + 8 * jj);
          v109 = v108;
          if (objc_msgSend(v108, "isEqual:", v145))
          {
            v109 = v145;

          }
          objc_msgSend(v109, "originalStartDate");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          if (v155 == objc_msgSend(v110, "CalIsBeforeDate:", v156))
          {
            objc_msgSend(v151, "_removeDetachedItem:", v108);
            objc_msgSend(v109, "persistentObject");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            v112 = objc_msgSend(v111, "isNew");

            if ((v112 & 1) == 0)
            {
              objc_msgSend(v109, "persistentObject");
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "rebase");
              objc_msgSend(v154, "eventStore");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v114, "_deleteObject:", v113);

              objc_msgSend(v145, "persistentObject");
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v115, "addCoCommitObject:", v113);

            }
            objc_msgSend(v109, "frozenObject");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "addMultiChangedObjectValue:forKey:", v116, v152);

            objc_msgSend(v109, "setOriginalItem:", v102);
            v117 = (void *)objc_opt_class();
            objc_msgSend(v102, "calendar");
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "generateUniqueIDWithEvent:originalEvent:calendar:", v109, v102, v118);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "setUniqueID:", v119);

            if (v109 != v145)
            {
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v147);
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "updatePersistentObjectSkippingProperties:", v120);

              objc_msgSend(v109, "insertPersistentObjectIfNeeded");
            }
          }

        }
        v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v161, v190, 16);
      }
      while (v105);
    }

    objc_msgSend(v102, "emptyMeltedCacheForKey:", v152);
    v19 = v150;
    objc_msgSend(v150, "_deleteFromOccurrenceDateOnward:includeSlices:", v156, 0);

    v11 = v154;
    v14 = v138;
    v13 = v140;
    v20 = v136;
    a4 = v142;
  }
  if (v141)
  {
    v159 = 0u;
    v160 = 0u;
    v157 = 0u;
    v158 = 0u;
    objc_msgSend(v19, "alarms");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v157, v189, 16);
    if (v122)
    {
      v123 = v122;
      v124 = *(_QWORD *)v158;
      do
      {
        for (kk = 0; kk != v123; ++kk)
        {
          if (*(_QWORD *)v158 != v124)
            objc_enumerationMutation(v121);
          v126 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * kk);
          if (objc_msgSend(v126, "isAbsolute"))
            objc_msgSend(v19, "removeAlarm:", v126);
        }
        v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v157, v189, 16);
      }
      while (v123);
    }

    v12 = v145;
    a4 = v142;
  }
  if (a4)
  {
    objc_msgSend(v19, "_updatePersistentObjectOfSelfAndDetachedItemsExceptForSavingItem:", v12);
    objc_msgSend(v19, "updatePersistentValueForKeyIfNeeded:", v152);
  }
  else
  {
    objc_msgSend(v11, "frozenObject");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addMultiChangedObjectValue:forKey:", v127, v152);

    objc_msgSend(v19, "emptyMeltedCacheForKey:", v152);
    objc_msgSend(v11, "setOriginalItem:", v19);
    objc_msgSend(v11, "setOriginalStartDate:", v13);
    v128 = (void *)objc_opt_class();
    objc_msgSend(v19, "calendar");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "generateUniqueIDWithEvent:originalEvent:calendar:", v11, v19, v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUniqueID:", v130);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v152);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updatePersistentObjectSkippingProperties:", v131);

  }
  objc_msgSend(v11, "eventStore");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "_addObjectToPendingCommits:", v19);

  objc_msgSend(v12, "emptyMeltedCacheForKey:", *MEMORY[0x1E0D0B338]);
  if (v11 != v12)
  {
    objc_msgSend(v11, "_updatePersistentObjectOfSelfAndDetachedItemsExceptForSavingItem:", v12);
    objc_msgSend(v11, "updatePersistentValueForKeyIfNeeded:", v152);
    objc_msgSend(v11, "eventStore");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "_addObjectToPendingCommits:", v11);

  }
}

- (id)privacyLevelString
{
  unint64_t v2;

  v2 = -[EKEvent privacyLevel](self, "privacyLevel");
  if (v2 > 3)
    return 0;
  else
    return off_1E4787270[v2];
}

- (EKSuggestedEventInfo)suggestionInfo
{
  return (EKSuggestedEventInfo *)-[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B700]);
}

- (void)setSuggestionInfo:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D0B700];
  v5 = a3;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, objc_opt_class());

}

- (BOOL)updateEventToEvent:(id)a3
{
  return -[EKEvent updateEventToEvent:commit:](self, "updateEventToEvent:commit:", a3, 1);
}

- (BOOL)updateEventToEvent:(id)a3 commit:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  char v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;

  v4 = a4;
  v6 = a3;
  -[EKEvent suggestionInfo](self, "suggestionInfo");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent startDate](self, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToDate:", v11) & 1) == 0)
    {
      -[EKEvent setStartDate:](self, "setStartDate:", v11);
      objc_msgSend(v8, "setChangedFields:", objc_msgSend(v8, "changedFields") | 2);
      if ((objc_msgSend(v9, "isDate:inSameDayAsDate:", v10, v11) & 1) == 0)
        objc_msgSend(v8, "setChangedFields:", objc_msgSend(v8, "changedFields") | 1);
    }
    -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDateUnadjustedForLegacyClients");
    v13 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToDate:", v13) & 1) == 0)
    {
      -[EKEvent setEndDateUnadjustedForLegacyClients:](self, "setEndDateUnadjustedForLegacyClients:", v13);
      objc_msgSend(v8, "setChangedFields:", objc_msgSend(v8, "changedFields") | 2);
      if ((objc_msgSend(v9, "isDate:inSameDayAsDate:", v12, v13) & 1) == 0)
        objc_msgSend(v8, "setChangedFields:", objc_msgSend(v8, "changedFields") | 1);
    }
    -[EKEvent title](self, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v41 = v14;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqualToString:") & 1) == 0)
    {
      -[EKEvent setTitle:](self, "setTitle:", v46);
      objc_msgSend(v8, "setChangedFields:", objc_msgSend(v8, "changedFields") | 4);
    }
    v45 = v9;
    -[EKCalendarItem location](self, "location");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "location");
    v16 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v13;
    v43 = v12;
    v40 = (void *)v15;
    if (v15 | v16)
      v17 = objc_msgSend((id)v15, "isEqualToString:", v16) ^ 1;
    else
      v17 = 0;
    objc_msgSend(v6, "structuredLocation");
    v23 = objc_claimAutoreleasedReturnValue();
    -[EKEvent structuredLocation](self, "structuredLocation");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    v26 = v24 | v23;
    if (v24 | v23)
      v26 = objc_msgSend((id)v24, "isEqualToLocation:", v23) ^ 1;
    v44 = v10;
    if ((v17 | v26) == 1)
    {
      -[EKCalendarItem setLocation:](self, "setLocation:", v16);
      objc_msgSend((id)v23, "duplicate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent setStructuredLocation:](self, "setStructuredLocation:", v27);

      objc_msgSend(v8, "setChangedFields:", objc_msgSend(v8, "changedFields") | 8);
    }
    objc_msgSend(v6, "notes", v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setNotes:](self, "setNotes:", v28);

    objc_msgSend(v6, "localStructuredData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem setLocalStructuredData:](self, "setLocalStructuredData:", v29);

    objc_msgSend(v6, "structuredData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem setStructuredData:](self, "setStructuredData:", v30);

    objc_msgSend(v6, "suggestionInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
    {
      objc_msgSend(v31, "duplicate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent setSuggestionInfo:](self, "setSuggestionInfo:", v33);

      v34 = objc_msgSend(v8, "changedFields");
      -[EKEvent suggestionInfo](self, "suggestionInfo");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setChangedFields:", v34);

    }
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      -[EKEvent updateEventToEvent:commit:].cold.3();
    -[EKObject eventStore](self, "eventStore");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    v21 = objc_msgSend(v36, "saveEvent:span:commit:error:", self, 0, v4, &v49);
    v37 = v49;

    if ((v21 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
        -[EKEvent updateEventToEvent:commit:].cold.1();
    }
    else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      -[EKEvent updateEventToEvent:commit:].cold.2();
    }

  }
  else if (v6 || !v7)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEvent updateEventToEvent:commit:].cold.4();
    v21 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      -[EKEvent updateEventToEvent:commit:].cold.9();
    v48 = 0;
    v18 = -[EKEvent _cancelWithSpan:error:](self, "_cancelWithSpan:error:", 0, &v48);
    v19 = v48;
    if (v18)
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
        -[EKEvent updateEventToEvent:commit:].cold.7();
      -[EKObject eventStore](self, "eventStore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0;
      v21 = objc_msgSend(v20, "saveEvent:span:commit:error:", self, 0, v4, &v47);
      v22 = v47;

      if ((v21 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
          -[EKEvent updateEventToEvent:commit:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      {
        -[EKEvent updateEventToEvent:commit:].cold.6();
      }

    }
    else
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        -[EKEvent updateEventToEvent:commit:].cold.8();
      v21 = 0;
    }

  }
  return v21;
}

- (BOOL)_fetchedEventIsConflict:(id)a3 forStartDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  BOOL v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[EKEvent uniqueId](self, "uniqueId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("/RID="));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "uniqueId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("/RID="));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v13, "isEqual:", v16) & 1) == 0
    && objc_msgSend(v8, "status") != 3
    && objc_msgSend(v8, "participationStatus") != 3
    && (objc_msgSend(v8, "status") || (objc_msgSend(v8, "isAllDay") & 1) == 0)
    && (!objc_msgSend(v8, "status") || objc_msgSend(v8, "availability") != 1))
  {
    objc_msgSend(v8, "endDateUnadjustedForLegacyClients");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToDate:", v9))
    {

    }
    else
    {
      objc_msgSend(v8, "startDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToDate:", v10);

      if (!v19)
      {
        v20 = 1;
        goto LABEL_12;
      }
    }
  }
  v20 = 0;
LABEL_12:

  return v20;
}

- (id)potentialConflictOccurrenceDatesInTimePeriod:(double *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  EKRecurrenceGenerator *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (-[EKEvent isAllDay](self, "isAllDay")
    || (-[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    v7 = 0;
  }
  else
  {
    -[EKEvent startDate](self, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    if (v9 && objc_msgSend(v9, "frequency") != 3)
    {
      v11 = objc_msgSend(v9, "frequency");
      if (v11 > 2)
      {
        v12 = 1;
        v10 = 0x417E133800000000;
      }
      else
      {
        v10 = qword_1A244A640[v11];
        v12 = qword_1A244A658[v11];
      }
      v13 = objc_alloc_init(EKRecurrenceGenerator);
      -[EKEvent startCalendarDate](self, "startCalendarDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendarItem timeZone](self, "timeZone");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[EKRecurrenceGenerator copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:limit:](v13, "copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:limit:", self, v9, v15, v16, v17, v12);

      if (objc_msgSend(v18, "count") > v12)
      {
        objc_msgSend(v18, "subarrayWithRange:", 0, v12);
        v19 = objc_claimAutoreleasedReturnValue();

        v18 = (id)v19;
      }

      v7 = v18;
    }
    if (a3)
      *(_QWORD *)a3 = v10;

  }
  return v7;
}

- (id)scanForConflicts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  unsigned int (**v22)(_QWORD, _QWORD);
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t m;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  unsigned int v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t j;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  unsigned int (**v78)(_QWORD, _QWORD);
  void *v79;
  uint64_t v80;
  void *v81;
  id v82;
  void *v83;
  id obj;
  char *obja;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _QWORD v100[4];
  id v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  double v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  if (-[EKEvent isAllDay](self, "isAllDay")
    || (-[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    +[EKConflictDetails infoWithConflicts:needsAction:event:](EKConflictDetails, "infoWithConflicts:needsAction:event:", 0, 0, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EKCalendarItem calendar](self, "calendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v5, "calendarsForEntityType:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v75 = v5;
    v10 = objc_msgSend(v5, "supportsAvailabilityRequests");
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v11 = (void *)objc_msgSend(v9, "copy");
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v107;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v107 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
          if (v10 && !objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * i), "isAffectingAvailability")
            || !objc_msgSend(v16, "allowsScheduling")
            || (objc_msgSend(v16, "isFacebookBirthdayCalendar") & 1) != 0
            || (objc_msgSend(v16, "isSubscribedHolidayCalendar") & 1) != 0
            || (objc_msgSend(v16, "isSuggestedEventCalendar") & 1) != 0
            || objc_msgSend(v16, "isNaturalLanguageSuggestedEventCalendar"))
          {
            objc_msgSend(v9, "removeObject:", v16);
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
      }
      while (v13);
    }

    v105 = 0.0;
    -[EKEvent potentialConflictOccurrenceDatesInTimePeriod:](self, "potentialConflictOccurrenceDatesInTimePeriod:", &v105);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = 0;
    v104 = 0;
    CalEventOccurrenceCacheGetIdealRangeAndTimeZone();
    v18 = 0;
    v19 = 0;
    objc_msgSend(v19, "dateByAddingTimeInterval:", -176400.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v100[0] = MEMORY[0x1E0C809B0];
    v100[1] = 3221225472;
    v100[2] = __27__EKEvent_scanForConflicts__block_invoke;
    v100[3] = &unk_1E4787190;
    v21 = v18;
    v101 = v21;
    v74 = v20;
    v102 = v74;
    v22 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x1A85849D4](v100);
    v83 = v9;
    v78 = v22;
    if ((unint64_t)objc_msgSend(v17, "count") > 1)
    {
      v71 = v21;
      v77 = (void *)objc_opt_new();
      -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent startDate](self, "startDate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "timeIntervalSinceDate:", v45);
      v47 = v46;

      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v73 = v17;
      v48 = v17;
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v92, v111, 16);
      if (v49)
      {
        v50 = v49;
        obja = 0;
        v87 = 0;
        v51 = *(_QWORD *)v93;
        v52 = 0x1E0C99000uLL;
        v80 = *(_QWORD *)v93;
        v82 = v48;
        do
        {
          for (j = 0; j != v50; ++j)
          {
            if (*(_QWORD *)v93 != v51)
              objc_enumerationMutation(v48);
            v54 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * j);
            objc_msgSend(*(id *)(v52 + 3432), "dateWithTimeInterval:sinceDate:", v54, v47);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22[2](v22, v54) && ((unsigned int (**)(_QWORD, void *))v22)[2](v22, v55))
            {
              -[EKObject eventStore](self, "eventStore");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "predicateForEventsWithStartDate:endDate:calendars:loadDefaultProperties:", v54, v55, v9, 0);
              v57 = (void *)objc_claimAutoreleasedReturnValue();

              -[EKObject eventStore](self, "eventStore");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "eventsMatchingPredicate:", v57);
              v59 = (void *)objc_claimAutoreleasedReturnValue();

              v90 = 0u;
              v91 = 0u;
              v88 = 0u;
              v89 = 0u;
              v60 = v59;
              v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v88, v110, 16);
              if (v61)
              {
                v62 = v61;
                v63 = *(_QWORD *)v89;
                while (2)
                {
                  for (k = 0; k != v62; ++k)
                  {
                    if (*(_QWORD *)v89 != v63)
                      objc_enumerationMutation(v60);
                    if (-[EKEvent _fetchedEventIsConflict:forStartDate:endDate:](self, "_fetchedEventIsConflict:forStartDate:endDate:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * k), v54, v55))
                    {
                      ++obja;
                      objc_msgSend(v77, "addObject:", v54);
                      goto LABEL_52;
                    }
                  }
                  v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v88, v110, 16);
                  if (v62)
                    continue;
                  break;
                }
LABEL_52:
                v22 = v78;
              }
              ++v87;

              v48 = v82;
              v9 = v83;
              v51 = v80;
              v52 = 0x1E0C99000;
            }

          }
          v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v92, v111, 16);
        }
        while (v50);
      }
      else
      {
        obja = 0;
        v87 = 0;
      }

      v66 = (void *)MEMORY[0x1E0D0C2B8];
      -[EKEvent startCalendarDate](self, "startCalendarDate");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "date");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "rangeWithStartDate:duration:", v68, v105);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v65 = v77;
      +[EKConflictDetails infoWithConflictsInSeries:outOf:withPeriod:conflictingDates:](EKConflictDetails, "infoWithConflictsInSeries:outOf:withPeriod:conflictingDates:", obja, v87, v24, v77);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v71;
      v17 = v73;
    }
    else
    {
      -[EKEvent startDate](self, "startDate");
      v23 = objc_claimAutoreleasedReturnValue();
      -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = (void *)v23;
      if (v22[2](v22, v23) && (((uint64_t (*)(_QWORD, void *))v22[2])(v22, v24) & 1) != 0)
      {
        v81 = v24;
        v70 = v21;
        v72 = v17;
        -[EKObject eventStore](self, "eventStore");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEvent startDate](self, "startDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "predicateForEventsWithStartDate:endDate:calendars:loadDefaultProperties:", v26, v27, v9, 0);
        v28 = objc_claimAutoreleasedReturnValue();

        -[EKObject eventStore](self, "eventStore");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = (void *)v28;
        objc_msgSend(v29, "eventsMatchingPredicate:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        obj = v30;
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v112, 16);
        if (v31)
        {
          v32 = v31;
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v86 = *(_QWORD *)v97;
          do
          {
            for (m = 0; m != v32; ++m)
            {
              if (*(_QWORD *)v97 != v86)
                objc_enumerationMutation(obj);
              v37 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * m);
              -[EKEvent startDate](self, "startDate");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = -[EKEvent _fetchedEventIsConflict:forStartDate:endDate:](self, "_fetchedEventIsConflict:forStartDate:endDate:", v37, v38, v39);

              if (v40)
              {
                v41 = objc_msgSend(v37, "isTentative");
                v33 += v41;
                v34 += v41 ^ 1;
                if (v34 + v33 == 1)
                  v42 = v37;
                else
                  v42 = 0;

                v35 = v42;
              }
            }
            v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v112, 16);
          }
          while (v32);
        }
        else
        {
          v33 = 0;
          v34 = 0;
          v35 = 0;
        }

        +[EKConflictDetails infoWithConflicts:needsAction:event:](EKConflictDetails, "infoWithConflicts:needsAction:event:", v34, v33, v35);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = v81;
        v9 = v83;
        v21 = v70;
        v17 = v72;
        v65 = v76;
        v22 = v78;
      }
      else
      {
        +[EKConflictDetails infoWithConflicts:needsAction:event:](EKConflictDetails, "infoWithConflicts:needsAction:event:", 0, 0, 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v76;
      }
    }

  }
  return v43;
}

uint64_t __27__EKEvent_scanForConflicts__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "CalIsAfterOrSameAsDate:", *(_QWORD *)(a1 + 32)))
    v4 = objc_msgSend(v3, "CalIsBeforeOrSameAsDate:", *(_QWORD *)(a1 + 40));
  else
    v4 = 0;

  return v4;
}

- (BOOL)updateWithGeocodedMapItemAndSaveWithCommit:(id)a3 eventStore:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  char v15;

  v8 = a4;
  v9 = a3;
  -[EKCalendarItem structuredLocationWithoutPrediction](self, "structuredLocationWithoutPrediction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "duplicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "updateFromMapItem:", v9);
  if (!-[EKEvent isEditable](self, "isEditable"))
    goto LABEL_6;
  -[EKEvent constraints](self, "constraints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "supportsStructuredLocations") & 1) == 0)
  {

    goto LABEL_6;
  }
  -[EKEvent constraints](self, "constraints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "supportsAutoGeocodingStructuredLocations");

  if (!v14)
  {
LABEL_6:
    -[EKCalendarItem setClientLocation:](self, "setClientLocation:", v11);
    goto LABEL_7;
  }
  -[EKEvent setStructuredLocation:](self, "setStructuredLocation:", v11);
LABEL_7:
  v15 = objc_msgSend(v8, "saveEvent:span:commit:error:", self, 3, 1, a5);

  return v15;
}

- (NSURL)launchURL
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;

  -[EKObject objectID](self, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "databaseID");
  v5 = *MEMORY[0x1E0D0BE78];
  v6 = (void *)MEMORY[0x1E0C99E98];
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[EKEvent startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  if (v4 == v5)
    objc_msgSend(v7, "stringWithFormat:", CFSTR("calshow:%lf?eventid=%d"), v9, objc_msgSend(v3, "rowID"), v13);
  else
    objc_msgSend(v7, "stringWithFormat:", CFSTR("calshow:%lf?eventid=%d_%d"), v9, objc_msgSend(v3, "databaseID"), objc_msgSend(v3, "rowID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v11;
}

+ (id)generateUniqueIDWithEvent:(id)a3 originalEvent:(id)a4 calendar:(id)a5
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "constraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "requiresMSFormattedUID");

  if (v9)
  {
    objc_msgSend(v6, "startTimeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (v7)
      {
LABEL_4:
        objc_msgSend(v7, "uniqueID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "originalStartDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "isAllDay");
        _EKMSUUIDStringForDetachedEvent();
        v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        goto LABEL_4;
    }
    _EKMSUUIDString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (objc_msgSend(v7, "isReminderIntegrationEvent"))
  {
    objc_msgSend(v7, "uniqueID");
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v13 = (void *)v14;
    goto LABEL_14;
  }
  if (!v7)
  {
    EKUUIDString();
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "uniqueID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originalStartDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceReferenceDate");
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@/RID=%llu"), v16, (unint64_t)v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v13;
}

- (void)dismissAcceptedProposeNewTimeNotification
{
  -[EKEvent _clearAttendeeChangedFlags](self, "_clearAttendeeChangedFlags");
  -[EKEvent setInvitationStatus:](self, "setInvitationStatus:", 0);
  -[EKEvent setClearModifiedFlags:](self, "setClearModifiedFlags:", -[EKEvent clearModifiedFlags](self, "clearModifiedFlags") | 0x200);
}

- (void)_clearAttendeeChangedFlags
{
  -[EKEvent setAttendeeComment:](self, "setAttendeeComment:", 0);
  -[EKEvent setAttendeeStatus:](self, "setAttendeeStatus:", 0);
  -[EKEvent setAttendeeProposedStartDate:](self, "setAttendeeProposedStartDate:", 0);
  -[EKEvent setAttendeeDeclinedStartDate:](self, "setAttendeeDeclinedStartDate:", 0);
}

- (void)dismissAttendeeRepliedNotification
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[EKEvent setInvitationStatus:](self, "setInvitationStatus:", 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[EKCalendarItem attendees](self, "attendees", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          objc_msgSend(v9, "setCommentChanged:", 0);
          objc_msgSend(v9, "setStatusChanged:", 0);
          objc_msgSend(v9, "setProposedStartDateChanged:", 0);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_respondToProposedTimeFromAttendee:(id)a3 shouldAccept:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v4 = a4;
  v14 = a3;
  objc_msgSend(v14, "setCommentChanged:", 0);
  objc_msgSend(v14, "setStatusChanged:", 0);
  objc_msgSend(v14, "setProposedStartDateChanged:", 0);
  if (v4)
    v6 = 2;
  else
    v6 = 3;
  objc_msgSend(v14, "setProposedStartDateStatus:", v6);
  v7 = v14;
  if (v4)
  {
    objc_msgSend(v14, "proposedStartDateForEvent:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[EKEvent endDateUnadjustedForLegacyClients](self, "endDateUnadjustedForLegacyClients");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent startDate](self, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", v10);
      v12 = v11;

      -[EKEvent setStartDate:](self, "setStartDate:", v8);
      objc_msgSend(v8, "dateByAddingTimeInterval:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent setEndDateUnadjustedForLegacyClients:](self, "setEndDateUnadjustedForLegacyClients:", v13);

    }
    -[EKEvent dismissAcceptedProposeNewTimeNotification](self, "dismissAcceptedProposeNewTimeNotification");

    v7 = v14;
  }

}

- (void)acceptProposedTimeNotificationFromAttendee:(id)a3
{
  -[EKEvent _respondToProposedTimeFromAttendee:shouldAccept:](self, "_respondToProposedTimeFromAttendee:shouldAccept:", a3, 1);
}

- (void)declineProposedTimeNotificationFromAttendee:(id)a3
{
  -[EKEvent _respondToProposedTimeFromAttendee:shouldAccept:](self, "_respondToProposedTimeFromAttendee:shouldAccept:", a3, 0);
}

- (id)committedCopy
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  if (-[EKEvent isDetached](self, "isDetached") && -[EKObject hasNeverBeenCommitted](self, "hasNeverBeenCommitted"))
  {
    v3 = objc_alloc((Class)objc_opt_class());
    -[EKCalendarItem originalItem](self, "originalItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent originalStartDate](self, "originalStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithPersistentObject:occurrenceDate:", v5, v6);

    objc_msgSend(v7, "committedCopy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)EKEvent;
    -[EKObject committedCopy](&v10, sel_committedCopy);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)diffFromCommitted
{
  void *v3;
  void *v4;
  void *v5;

  -[EKEvent committedCopy](self, "committedCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "diffWithObject:", self);
  else
    +[EKDiff diffBetweenObject:andObject:](EKDiff, "diffBetweenObject:andObject:", 0, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3 comparingKeys:(id)a4
{
  return -[EKObject isEqual:comparingKeys:compareImmutableKeys:ignoringProperties:](self, "isEqual:comparingKeys:compareImmutableKeys:ignoringProperties:", a3, a4, 0, 0);
}

- (BOOL)isDifferentWithDiff:(id)a3
{
  return objc_msgSend(a3, "result") != 0;
}

+ (id)knownRequireRSVPKeys
{
  if (knownRequireRSVPKeys_onceToken != -1)
    dispatch_once(&knownRequireRSVPKeys_onceToken, &__block_literal_global_336);
  return (id)knownRequireRSVPKeys_knownRequireRSVPKeys;
}

void __31__EKEvent_knownRequireRSVPKeys__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B3E0];
  v4[0] = *MEMORY[0x1E0D0B680];
  v4[1] = v0;
  v1 = *MEMORY[0x1E0D0B3D0];
  v4[2] = *MEMORY[0x1E0D0B350];
  v4[3] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)knownRequireRSVPKeys_knownRequireRSVPKeys;
  knownRequireRSVPKeys_knownRequireRSVPKeys = v2;

}

+ (id)knownPerUserPropertyKeys
{
  if (knownPerUserPropertyKeys_onceToken != -1)
    dispatch_once(&knownPerUserPropertyKeys_onceToken, &__block_literal_global_337);
  return (id)knownPerUserPropertyKeys_knownPerUserPropertyKeys;
}

void __35__EKEvent_knownPerUserPropertyKeys__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B710];
  v3[0] = CFSTR("alarms");
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E0D0B628];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)knownPerUserPropertyKeys_knownPerUserPropertyKeys;
  knownPerUserPropertyKeys_knownPerUserPropertyKeys = v1;

}

- (BOOL)_diff:(id)a3 isDifferentFromCommittedEventHelperRequiresReschedule:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  char v23;

  v4 = a4;
  v6 = a3;
  v7 = -[EKEvent isDifferentWithDiff:](self, "isDifferentWithDiff:", v6);
  objc_msgSend(v6, "differentKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKCalendarItem hasAttendees](self, "hasAttendees")
    || objc_msgSend(v8, "containsObject:", *MEMORY[0x1E0D0B278]))
  {
    v9 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend((id)objc_opt_class(), "knownRequireRSVPKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "secondObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isDetached") & 1) == 0 && objc_msgSend(v13, "isDetached"))
    {
      objc_msgSend(v12, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

      if (v16)
        objc_msgSend(v11, "removeObject:", *MEMORY[0x1E0D0B3D0]);
      objc_msgSend(v12, "endDateUnadjustedForLegacyClients");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "endDateUnadjustedForLegacyClients");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (v19)
        objc_msgSend(v11, "removeObject:", *MEMORY[0x1E0D0B680]);
      objc_msgSend(v11, "removeObject:", *MEMORY[0x1E0D0B350]);
    }
    if (v4)
    {
      objc_msgSend(v11, "addObject:", *MEMORY[0x1E0D0B278]);
      objc_msgSend(v11, "addObject:", *MEMORY[0x1E0D0B6E8]);
    }
    objc_msgSend(v12, "location");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "location");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (v22)
      objc_msgSend(v11, "removeObject:", *MEMORY[0x1E0D0B3E0]);
    v23 = objc_msgSend(v8, "intersectsSet:", v11);

  }
  else
  {
    if (!v7)
    {
      v23 = 0;
      goto LABEL_16;
    }
    -[EKEvent masterEvent](self, "masterEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v11, "hasAttendees");
  }

LABEL_16:
  return v23;
}

- (BOOL)isDifferentAndRequiresRescheduleWithDiff:(id)a3
{
  return -[EKEvent _diff:isDifferentFromCommittedEventHelperRequiresReschedule:](self, "_diff:isDifferentFromCommittedEventHelperRequiresReschedule:", a3, 1);
}

- (BOOL)isDifferentAndModifiedAttendeesWithDiff:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  if (-[EKEvent isDifferentWithDiff:](self, "isDifferentWithDiff:", v4))
  {
    objc_msgSend(v4, "differentKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0D0B278])
      && (objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0D0B628]) & 1) == 0)
    {
      v6 = objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0D0B358]) ^ 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isDifferentAndHasForwardedAttendeesWithDiff:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[EKEvent status](self, "status") != EKEventStatusCanceled
    && -[EKEvent currentUserGeneralizedParticipantRole](self, "currentUserGeneralizedParticipantRole") == 1
    && -[EKEvent allowsAttendeesModifications](self, "allowsAttendeesModifications")
    && -[EKEvent isDifferentAndModifiedAttendeesWithDiff:](self, "isDifferentAndModifiedAttendeesWithDiff:", v4);

  return v5;
}

- (BOOL)isDifferentAndHasNewProposedTimeWithDiff:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (-[EKEvent isDifferentWithDiff:](self, "isDifferentWithDiff:", v4))
  {
    objc_msgSend(v4, "summaryDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D0B6D8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isDifferentExceptingPerUserPropertiesWithDiff:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  if (-[EKEvent isDifferentWithDiff:](self, "isDifferentWithDiff:", v4))
  {
    v5 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend((id)objc_opt_class(), "knownPerUserPropertyKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(v4, "differentKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithSet:", v9);

    objc_msgSend(v10, "minusSet:", v7);
    v11 = objc_msgSend(v10, "count") != 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isDifferentFromCommittedEventAndRequiresReschedule
{
  EKEvent *v2;
  void *v3;

  v2 = self;
  -[EKEvent diffFromCommitted](self, "diffFromCommitted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[EKEvent isDifferentAndRequiresRescheduleWithDiff:](v2, "isDifferentAndRequiresRescheduleWithDiff:", v3);

  return (char)v2;
}

- (BOOL)isDifferentAndRequiresRSVPWithDiff:(id)a3
{
  return -[EKEvent _diff:isDifferentFromCommittedEventHelperRequiresReschedule:](self, "_diff:isDifferentFromCommittedEventHelperRequiresReschedule:", a3, 0);
}

- (BOOL)isDifferentFromCommittedEventAndRequiresRSVP
{
  EKEvent *v2;
  void *v3;

  v2 = self;
  -[EKEvent diffFromCommitted](self, "diffFromCommitted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[EKEvent isDifferentAndRequiresRSVPWithDiff:](v2, "isDifferentAndRequiresRSVPWithDiff:", v3);

  return (char)v2;
}

- (BOOL)isDifferentAndHasUnscheduledAttendeesWithDiff:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(a3, "summaryDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKDiff summaryKeyForMultiValueAddOfPropertyKey:](EKDiff, "summaryKeyForMultiValueAddOfPropertyKey:", *MEMORY[0x1E0D0B278]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (BOOL)isDifferentFromCommittedEventAndHasUnscheduledAttendees
{
  EKEvent *v2;
  void *v3;

  v2 = self;
  -[EKEvent diffFromCommitted](self, "diffFromCommitted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[EKEvent isDifferentAndHasUnscheduledAttendeesWithDiff:](v2, "isDifferentAndHasUnscheduledAttendeesWithDiff:", v3);

  return (char)v2;
}

- (BOOL)isPrivacySet
{
  return -[EKEvent privacyLevel](self, "privacyLevel") != 0;
}

- (int64_t)requirementsToMoveFromCalendar:(id)a3 toCalendar:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;

  v6 = a3;
  v7 = a4;
  if (-[EKEvent _requirementsToMoveOrCopyToCalendarHelperAllowedToMoveOrCopyEventFromCalendar:toCalendar:](self, "_requirementsToMoveOrCopyToCalendarHelperAllowedToMoveOrCopyEventFromCalendar:toCalendar:", v6, v7))
  {
    if (-[EKEvent _requirementsToMoveToCalendarHelperDuplicationRequiredToMoveEventFromCalendar:toCalendar:](self, "_requirementsToMoveToCalendarHelperDuplicationRequiredToMoveEventFromCalendar:toCalendar:", v6, v7))
    {
      v8 = 4;
    }
    else
    {
      v8 = 0;
    }
    if (-[EKEvent _requirementsToMoveToCalendarHelperAlterationsRequiredToMoveEventFromCalendar:toCalendar:](self, "_requirementsToMoveToCalendarHelperAlterationsRequiredToMoveEventFromCalendar:toCalendar:", v6, v7))
    {
      v9 = v8 | 8;
    }
    else
    {
      v9 = v8;
    }
    if (-[EKEvent _requirementsToMoveToCalendarHelperReinviteAttendeesRequiredToMoveEventFromCalendar:toCalendar:](self, "_requirementsToMoveToCalendarHelperReinviteAttendeesRequiredToMoveEventFromCalendar:toCalendar:", v6, v7))
    {
      v10 = v9 | 0x20;
      if (!_bitmaskContainsOption(v9 | 0x20, 4)
        && -[EKEvent _requirementsToMoveToCalendarHelperNeedToRemoveOriginalToMoveEventFromCalendar:toCalendar:](self, "_requirementsToMoveToCalendarHelperNeedToRemoveOriginalToMoveEventFromCalendar:toCalendar:", v6, v7))
      {
        v10 = v9 | 0x30;
      }
    }
    else if (-[EKEvent _requirementsToMoveToCalendarHelperRemoveAttendeesRequiredToMoveEventFromCalendar:toCalendar:](self, "_requirementsToMoveToCalendarHelperRemoveAttendeesRequiredToMoveEventFromCalendar:toCalendar:", v6, v7))
    {
      v10 = v9 | 0x40;
    }
    else
    {
      v10 = v9;
    }
    if (v10 <= 1)
      v11 = 1;
    else
      v11 = v10;
  }
  else
  {
    v11 = 2;
  }

  return v11;
}

- (int64_t)requirementsToMoveToCalendar:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[EKCalendarItem calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EKEvent requirementsToMoveFromCalendar:toCalendar:](self, "requirementsToMoveFromCalendar:toCalendar:", v5, v4);

  return v6;
}

- (BOOL)canMoveToCalendar:(id)a3 fromCalendar:(id)a4 error:(id *)a5
{
  return -[EKEvent canMoveToCalendar:fromCalendar:allowedRequirements:error:](self, "canMoveToCalendar:fromCalendar:allowedRequirements:error:", a3, a4, 121, a5);
}

- (BOOL)canMoveToCalendar:(id)a3 fromCalendar:(id)a4 allowedRequirements:(int64_t)a5 error:(id *)a6
{
  return -[EKEvent _canMoveOrCopyFromCalendar:toCalendar:allowedRequirements:error:](self, "_canMoveOrCopyFromCalendar:toCalendar:allowedRequirements:error:", a4, a3, a5, a6);
}

- (BOOL)canMoveOrCopyToCalendar:(id)a3 fromCalendar:(id)a4 error:(id *)a5
{
  return -[EKEvent _canMoveOrCopyFromCalendar:toCalendar:allowedRequirements:error:](self, "_canMoveOrCopyFromCalendar:toCalendar:allowedRequirements:error:", a4, a3, 125, a5);
}

- (BOOL)requiresCopyToMoveFromCalendar:(id)a3 toCalendar:(id)a4
{
  return ((unint64_t)-[EKEvent requirementsToMoveFromCalendar:toCalendar:](self, "requirementsToMoveFromCalendar:toCalendar:", a3, a4) >> 2) & 1;
}

- (BOOL)_canMoveOrCopyFromCalendar:(id)a3 toCalendar:(id)a4 allowedRequirements:(int64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;

  v10 = a3;
  v11 = a4;
  objc_msgSend(v11, "source");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v11, "source");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEnabledForEvents") ^ 1;

  }
  else
  {
    v14 = 0;
  }

  if (!objc_msgSend(v11, "allowEvents") || v14)
  {
    if (a6)
    {
      v17 = 22;
      goto LABEL_18;
    }
LABEL_19:
    v19 = 0;
    goto LABEL_20;
  }
  if ((objc_msgSend(v10, "isEqual:", v11) & 1) == 0)
  {
    -[EKEvent constraints](self, "constraints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "requiresOutgoingInvitationsInDefaultCalendar");

    if (v16)
    {
      if (-[EKCalendarItem isSelfOrganizedInvitation](self, "isSelfOrganizedInvitation"))
      {
        if (a6)
        {
          v17 = 12;
LABEL_18:
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", v17);
          v19 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_20;
        }
        goto LABEL_19;
      }
    }
  }
  v18 = -[EKEvent requirementsToMoveFromCalendar:toCalendar:](self, "requirementsToMoveFromCalendar:toCalendar:", v10, v11);
  if (v18 == 2 || !_bitmaskContainsOption(a5, v18))
  {
    if (a6)
    {
      v17 = 0;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v19 = 1;
LABEL_20:

  return v19;
}

- (BOOL)seriesHasOutOfOrderEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  EKRecurrenceGenerator *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {

    return 0;
  }
  -[EKCalendarItem detachedItems](self, "detachedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    return 0;
  -[EKEvent masterEvent](self, "masterEvent");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(v33, "detachedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v12, "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v13);

        objc_msgSend(v12, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isAfterDate:", v6);

        if (v15)
        {
          objc_msgSend(v12, "startDate");
          v16 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v16;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v9);
  }

  -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99D48];
  -[EKCalendarItem timeZone](self, "timeZone");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "CalGregorianCalendarForTimeZone:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "dateComponents");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dateByAddingComponents:toDate:options:", v22, v6, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_alloc_init(EKRecurrenceGenerator);
  objc_msgSend(v33, "startDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem timeZone](self, "timeZone");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v32) = 1;
  v27 = -[EKRecurrenceGenerator copyOccurrenceDatesWithEKEvent:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:](v24, "copyOccurrenceDatesWithEKEvent:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:", self, v25, v23, v26, 0, 0, v32);

  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __36__EKEvent_seriesHasOutOfOrderEvents__block_invoke;
  v34[3] = &unk_1E47871F8;
  v28 = v7;
  v35 = v28;
  v29 = v27;
  v36 = v29;
  v37 = &v38;
  objc_msgSend(v29, "enumerateObjectsUsingBlock:", v34);
  v30 = *((_BYTE *)v39 + 24) != 0;

  _Block_object_dispose(&v38, 8);
  return v30;
}

void __36__EKEvent_seriesHasOutOfOrderEvents__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v14 = v7;
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3 - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isBeforeDate:", v8);

      if (v10)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

    }
    if (objc_msgSend(*(id *)(a1 + 40), "count") - 1 > a3)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3 + 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isAfterDate:", v11);

      if (v13)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

    }
    v7 = v14;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *a4 = 1;
  }

}

- (BOOL)isOutOfOrderWithEventInSeries
{
  EKEvent *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  EKRecurrenceGenerator *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  uint64_t v37;
  void *v38;
  void *v39;
  EKRecurrenceGenerator *v40;
  id v41;
  EKEvent *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  -[EKCalendarItem originalItem](self, "originalItem");
  v3 = (EKEvent *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 || v3)
  {
    if (!v3)
      v3 = self;
    -[EKEvent originalStartDate](self, "originalStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[EKEvent originalOccurrenceStartDate](self, "originalOccurrenceStartDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[EKEvent startDate](self, "startDate");
    v42 = v3;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem detachedItems](v3, "detachedItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v49;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v49 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(v16, "originalStartDate");
          v17 = (id)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "compare:", v7);
          if (v18)
          {
            v19 = v18;
            objc_msgSend(v10, "addObject:", v17);
            objc_msgSend(v16, "startDate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "compare:", v43);

            if (v21 != v19)
            {
              LOBYTE(v6) = 1;
              v22 = v11;
              goto LABEL_37;
            }
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        if (v13)
          continue;
        break;
      }
    }

    -[EKCalendarItem exceptionDates](v42, "exceptionDates");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v43;
    v24 = objc_msgSend(v43, "isBeforeDate:", v7);
    if (v24)
      v25 = v43;
    else
      v25 = v7;
    if (v24)
      v23 = v7;
    v17 = v25;
    v41 = v23;
    v26 = objc_alloc_init(EKRecurrenceGenerator);
    -[EKEvent effectiveTimeZone](v42, "effectiveTimeZone");
    v27 = objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem recurrenceRules](v42, "recurrenceRules");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "firstObject");
    v29 = objc_claimAutoreleasedReturnValue();

    LOBYTE(v37) = 1;
    v39 = (void *)v27;
    v40 = v26;
    v38 = (void *)v29;
    v30 = v29;
    v31 = v41;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v32 = -[EKRecurrenceGenerator copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:](v26, "copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:", v42, v30, v17, v41, v27, 0, 0, v37);
    v6 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v6)
    {
      v33 = *(_QWORD *)v45;
      while (2)
      {
        for (j = 0; j != v6; ++j)
        {
          if (*(_QWORD *)v45 != v33)
            objc_enumerationMutation(v32);
          v35 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          if ((objc_msgSend(v35, "isEqualToDate:", v7) & 1) == 0
            && (objc_msgSend(v22, "containsObject:", v35) & 1) == 0
            && !objc_msgSend(v10, "containsObject:", v35))
          {
            LOBYTE(v6) = 1;
            goto LABEL_35;
          }
        }
        v6 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v6)
          continue;
        break;
      }
LABEL_35:
      v31 = v41;
    }

LABEL_37:
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)seriesHasOverlappingOrOnSameDayOrOutOfOrderEvents
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[EKCalendarItem recurrenceRuleString](self, "recurrenceRuleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[EKEvent masterEvent](self, "masterEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "overlapsWithOrIsSameDayAsEventInSeries") & 1) != 0)
  {
LABEL_14:
    v10 = 1;
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[EKCalendarItem detachedItems](self, "detachedItems", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "overlapsWithOrIsSameDayAsEventInSeries") & 1) != 0)
          {

            goto LABEL_14;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }

    v10 = -[EKEvent seriesHasOutOfOrderEvents](self, "seriesHasOutOfOrderEvents");
  }

  return v10;
}

- (BOOL)_requirementsToMoveOrCopyToCalendarHelperAllowedToMoveOrCopyEventFromCalendar:(id)a3 toCalendar:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  BOOL v16;
  BOOL v17;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "allowsContentModifications") & 1) == 0)
  {
    -[EKEvent suggestionInfo](self, "suggestionInfo");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_17;
    v9 = (void *)v8;
    v10 = objc_msgSend(v7, "isSuggestedEventCalendar");

    if (!v10)
      goto LABEL_17;
  }
  if (objc_msgSend(v6, "sharingStatus") == 2)
  {
    if (!-[EKEvent privacyLevel](self, "privacyLevel"))
      goto LABEL_11;
  }
  else
  {
    objc_msgSend(v6, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isDelegate") & 1) == 0)
    {

      goto LABEL_11;
    }
    v12 = -[EKEvent privacyLevel](self, "privacyLevel");

    if (!v12)
    {
LABEL_11:
      objc_msgSend(v7, "constraints");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "eventDurationConstrainedToRecurrenceInterval"))
      {
        v14 = -[EKEvent durationOverlapsRecurrenceInterval](self, "durationOverlapsRecurrenceInterval");

        if (v14)
          goto LABEL_17;
      }
      else
      {

      }
      objc_msgSend(v7, "constraints");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "occurrencesMustOccurOnSeparateDays"))
      {
        v16 = -[EKEvent seriesHasOverlappingOrOnSameDayOrOutOfOrderEvents](self, "seriesHasOverlappingOrOnSameDayOrOutOfOrderEvents");

        if (v16)
          goto LABEL_17;
      }
      else
      {

      }
      v17 = 1;
      goto LABEL_20;
    }
  }
LABEL_17:
  v17 = 0;
LABEL_20:

  return v17;
}

- (BOOL)_hasAbsoluteAlarms
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[EKCalendarItem hasAlarms](self, "hasAlarms"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[EKCalendarItem alarms](self, "alarms", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "absoluteDate");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7)
          {
            LOBYTE(v4) = 1;
            goto LABEL_13;
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)_nsCalendar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[EKEvent isAllDay](self, "isAllDay")
    || (-[EKCalendarItem timeZone](self, "timeZone"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianGMTCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C99D48];
    -[EKCalendarItem timeZone](self, "timeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "CalGregorianCalendarForTimeZone:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)_suggestedStartDateHelperRecurrenceRuleRequiresExpansion:(id)a3 forDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "frequency") == 3)
  {
    objc_msgSend(v6, "daysOfTheYear");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {

    }
    else
    {
      objc_msgSend(v6, "monthsOfTheYear");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        -[EKEvent _nsCalendar](self, "_nsCalendar");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "component:fromDate:", 8, v7);

        objc_msgSend(v6, "monthsOfTheYear");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v10, "containsObject:", v15) ^ 1;
        goto LABEL_22;
      }
    }
  }
  if ((objc_msgSend(v6, "isPinnedToEndOfFrequency") & 1) == 0)
  {
    objc_msgSend(v6, "daysOfTheMonth");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      LOBYTE(v9) = 1;
LABEL_23:

      goto LABEL_24;
    }
    objc_msgSend(v6, "daysOfTheWeek");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {
      LOBYTE(v9) = 1;
    }
    else
    {
      objc_msgSend(v6, "daysOfTheYear");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "count"))
      {
        LOBYTE(v9) = 1;
      }
      else
      {
        objc_msgSend(v6, "monthsOfTheYear");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count"))
        {
          LOBYTE(v9) = 1;
        }
        else
        {
          objc_msgSend(v6, "setPositions");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "count"))
          {
            LOBYTE(v9) = 1;
          }
          else
          {
            objc_msgSend(v6, "weeksOfTheYear");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v9) = objc_msgSend(v19, "count") != 0;

          }
        }

      }
    }
LABEL_22:

    goto LABEL_23;
  }
  LOBYTE(v9) = 0;
LABEL_24:

  return v9;
}

- (id)suggestedStartDateForCurrentRecurrenceRule
{
  return -[EKEvent suggestedStartDateForCurrentRecurrenceRuleWithSimulatedNowDate:](self, "suggestedStartDateForCurrentRecurrenceRuleWithSimulatedNowDate:", 0);
}

- (id)suggestedStartDateForCurrentRecurrenceRuleWithSimulatedNowDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  EKRecurrenceGenerator *v25;
  void *v26;
  uint64_t v27;
  void *v29;

  v4 = a3;
  -[EKEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && -[EKEvent _suggestedStartDateHelperRecurrenceRuleRequiresExpansion:forDate:](self, "_suggestedStartDateHelperRecurrenceRuleRequiresExpansion:forDate:", v7, v5))
  {
    if (objc_msgSend(v7, "interval") != 1)
    {
      v8 = (void *)objc_msgSend(v7, "copy");

      objc_msgSend(v8, "setInterval:", 1);
      v7 = v8;
    }
    -[EKEvent _nsCalendar](self, "_nsCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    objc_msgSend(v10, "setFirstWeekday:", objc_msgSend(v7, "firstDayOfTheWeek"));
    if (v4)
    {
      v11 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    v13 = (void *)MEMORY[0x1E0C99D68];
    -[EKEvent startDate](self, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v12;
    objc_msgSend(v13, "dateWithDatePartFromDate:timePartFromDate:inCalendar:", v12, v14, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKEvent startDate](self, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v16, "isSameWeekAsDate:inCalendar:", v15, v10);

    -[EKEvent startDate](self, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if ((_DWORD)v12)
    {
      if ((objc_msgSend(v17, "isBeforeDate:", v15) & 1) != 0)
      {
        -[EKEvent startDate](self, "startDate");
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = v15;
      }
    }
    else
    {
      v20 = objc_msgSend(v17, "isAfterDate:", v15);

      -[EKEvent startDate](self, "startDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
LABEL_15:
        v22 = (void *)MEMORY[0x1E0D0C420];
        -[EKCalendarItem timeZone](self, "timeZone");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "calendarDateWithDate:timeZone:", v18, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = objc_alloc_init(EKRecurrenceGenerator);
        -[CalRecurrenceGenerator setOnlyIncludeInitialDateIfItMatchesRecurrence:](v25, "setOnlyIncludeInitialDateIfItMatchesRecurrence:", 1);
        -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKRecurrenceGenerator nextOccurrenceDateWithEKRecurrences:forCalendarItem:initialDate:afterDate:inclusive:](v25, "nextOccurrenceDateWithEKRecurrences:forCalendarItem:initialDate:afterDate:inclusive:", v26, self, v24, v24, 1);
        v27 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v27;
        goto LABEL_16;
      }
      objc_msgSend(v18, "roundToCurrentWeekInCalendar:withFirstWeekdayIndex:", v10, objc_msgSend(v7, "firstDayOfTheWeek"));
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v19;

    v18 = v21;
    goto LABEL_15;
  }
LABEL_16:

  return v5;
}

- (BOOL)isValidAttendee:(id)a3 forCalendar:(id)a4
{
  return -[EKEvent _isValidAttendee:forCalendar:selfAttendeeIsValid:](self, "_isValidAttendee:forCalendar:selfAttendeeIsValid:", a3, a4, 0);
}

- (BOOL)_isValidAttendee:(id)a3 forCalendar:(id)a4 selfAttendeeIsValid:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  char v11;
  BOOL v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  id obj;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v5 = a5;
  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v5
    || (-[EKCalendarItem selfAttendee](self, "selfAttendee"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEqualToParticipant:", v8),
        v10,
        (v11 & 1) == 0))
  {
    objc_msgSend(v8, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLForNoMail");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if ((v15 & 1) != 0
      || (objc_msgSend(v9, "ownerIdentityAddress"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v13, "isEqual:", v16),
          v16,
          (v17 & 1) != 0))
    {
      v12 = 0;
LABEL_31:

      goto LABEL_32;
    }
    objc_msgSend(v8, "emailAddress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ownerIdentityAddress");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resourceSpecifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "ownerIdentityEmail");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEqual:", v21) & 1) != 0)
    {

LABEL_10:
      v12 = 0;
LABEL_30:

      goto LABEL_31;
    }
    v22 = objc_msgSend(v18, "isEqual:", v20);

    if ((v22 & 1) != 0)
      goto LABEL_10;
    objc_msgSend(v8, "phoneNumber");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ownerIdentityPhoneNumber");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v23, "isEqual:", v24) & 1) != 0)
    {

    }
    else
    {
      v25 = objc_msgSend(v23, "isEqual:", v20);

      if ((v25 & 1) == 0)
      {
        objc_msgSend(v13, "absoluteString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        objc_msgSend(v9, "source");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "ownerAddresses");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v27;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v37;
          while (2)
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v37 != v30)
                objc_enumerationMutation(obj);
              v32 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
              if ((objc_msgSend(v18, "isEqual:", v32) & 1) != 0
                || (objc_msgSend(v23, "isEqual:", v32) & 1) != 0
                || (objc_msgSend(v35, "isEqual:", v32) & 1) != 0)
              {
                v12 = 0;
                goto LABEL_28;
              }
            }
            v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
            v12 = 1;
            if (v29)
              continue;
            break;
          }
        }
        else
        {
          v12 = 1;
        }
LABEL_28:

        goto LABEL_29;
      }
    }
    v12 = 0;
LABEL_29:

    goto LABEL_30;
  }
  v12 = 1;
LABEL_32:

  return v12;
}

- (id)attendeesNotIncludingOrganizer
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[EKCalendarItem attendees](self, "attendees");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem organizer](self, "organizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (-[EKEvent isAttendeeSameAsOrganizer:](self, "isAttendeeSameAsOrganizer:", v10, (_QWORD)v15))
          {
            v19 = v10;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "arrayByExcludingObjectsInArray:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_14;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v7)
          continue;
        break;
      }
    }

    v11 = v5;
  }
  else
  {
    v11 = v3;
  }
  v13 = v11;
LABEL_14:

  return v13;
}

- (BOOL)isAttendeeSameAsOrganizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4)
  {
    -[EKCalendarItem organizer](self, "organizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[EKCalendarItem organizer](self, "organizer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToParticipant:", v4);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)attendeesNotIncludingOrganizerOrLocationsOrResources
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[EKCalendarItem attendees](self, "attendees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  -[EKCalendarItem organizer](self, "organizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isNew") & 1) != 0 || (v12 = objc_msgSend(v6, "existsInStore"), !v6) || v12)
  {
    -[EKCalendarItem attendees](self, "attendees");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject eventStore](self, "eventStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKObject objectsIDsExistingInStoreFromObjects:eventStore:](EKObject, "objectsIDsExistingInStoreFromObjects:eventStore:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKCalendarItem attendees](self, "attendees");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __63__EKEvent_attendeesNotIncludingOrganizerOrLocationsOrResources__block_invoke;
    v15[3] = &unk_1E4787220;
    v16 = v9;
    v17 = v6;
    v18 = v5;
    v11 = v9;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __63__EKEvent_attendeesNotIncludingOrganizerOrLocationsOrResources__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;

  v10 = a2;
  if ((objc_msgSend(v10, "isNew") & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v10, "CADObjectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "containsObject:", v7) & 1) == 0 || objc_msgSend(v10, "participantType") == 2)
    {

      goto LABEL_11;
    }
    v8 = objc_msgSend(v10, "participantType");

    v4 = v10;
    if (v8 == 3)
      goto LABEL_12;
LABEL_9:
    v9 = objc_msgSend(v4, "isEqualToParticipant:", *(_QWORD *)(a1 + 40));
    v4 = v10;
    if ((v9 & 1) != 0)
      goto LABEL_12;
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
LABEL_11:
    v4 = v10;
    goto LABEL_12;
  }
  v3 = objc_msgSend(v10, "participantType");
  v4 = v10;
  if (v3 != 2)
  {
    v5 = objc_msgSend(v10, "participantType");
    v4 = v10;
    if (v5 != 3)
      goto LABEL_9;
  }
LABEL_12:

}

- (void)prefetchAttendeesWithAdditionalProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  +[EKPersistentAttendee defaultPropertiesToLoad](EKPersistentAttendee, "defaultPropertiesToLoad");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[EKObject eventStore](self, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem attendeesRaw](self, "attendeesRaw");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ensureLoadedProperties:forObjects:", v5, v7);

}

- (BOOL)_requirementsToMoveToCalendarHelperAlterationsRequiredToMoveEventFromCalendar:(id)a3 toCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  int v10;
  void *v11;
  int v12;
  int v13;
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
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[EKEvent isPrivacySet](self, "isPrivacySet"))
  {
    objc_msgSend(v7, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "supportsPrivateEvents"))
      v9 = objc_msgSend(v7, "sharingStatus") != 2;
    else
      v9 = 0;
    v10 = !v9;

  }
  else
  {
    v10 = 0;
  }
  -[EKCalendarItem alarms](self, "alarms");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "count") < 2)
    v12 = 0;
  else
    v12 = objc_msgSend(v7, "supportsMultipleAlarms") ^ 1;
  v13 = v10 | v12;

  if (-[EKEvent _hasAbsoluteAlarms](self, "_hasAbsoluteAlarms"))
  {
    objc_msgSend(v7, "constraints");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 |= objc_msgSend(v14, "supportsAlarmTriggerDates") ^ 1;

  }
  if (-[EKCalendarItem hasRecurrenceRules](self, "hasRecurrenceRules"))
  {
    objc_msgSend(v7, "constraints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "requiresOccurrencesConformToRecurrenceRule"))
    {
      -[EKEvent startDate](self, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent suggestedStartDateForCurrentRecurrenceRule](self, "suggestedStartDateForCurrentRecurrenceRule");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v13 |= objc_msgSend(v16, "isEqualToDate:", v17) ^ 1;

    }
  }
  -[EKEvent URL](self, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v7, "constraints");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13 |= objc_msgSend(v19, "supportsURLField") ^ 1;

  }
  objc_msgSend(v6, "source");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sourceIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sourceIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "isEqualToString:", v23) & 1) == 0)
  {
    -[EKCalendarItem attachments](self, "attachments");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count"))
      v13 = 1;

  }
  -[EKCalendarItem timeZone](self, "timeZone");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {

  }
  else
  {
    objc_msgSend(v7, "constraints");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "supportsFloatingTimeZone");

    if ((v27 & 1) == 0)
      v13 |= !-[EKEvent isAllDay](self, "isAllDay");
  }
  if (-[EKCalendarItem hasAttendees](self, "hasAttendees"))
  {
    objc_msgSend(v6, "source");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sourceIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "source");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "sourceIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v29, "isEqualToString:", v31);

    if ((v32 & 1) == 0)
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      -[EKCalendarItem attendees](self, "attendees", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v49;
        while (2)
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v49 != v36)
              objc_enumerationMutation(v33);
            if (!-[EKEvent isValidAttendee:forCalendar:](self, "isValidAttendee:forCalendar:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i), v7))
            {
              v13 = 1;
              goto LABEL_38;
            }
          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
          if (v35)
            continue;
          break;
        }
      }
LABEL_38:

    }
    if (!objc_msgSend(v6, "type") && objc_msgSend(v7, "type") != 2 && objc_msgSend(v7, "type"))
    {
      -[EKCalendarItem organizer](self, "organizer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "scheduleAgent") == 1)
        v39 = v13;
      else
        v39 = 1;
      v13 = v39 != 0;

    }
  }
  if (-[EKCalendarItem hasRecurrenceRules](self, "hasRecurrenceRules"))
  {
    -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "firstObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v41, "frequency") == 2)
    {
      objc_msgSend(v41, "daysOfTheMonth");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v42, "count") >= 2)
      {
        objc_msgSend(v7, "constraints");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v13 |= objc_msgSend(v43, "prohibitsMultipleDaysInMonthlyRecurrence");

      }
    }
    if (objc_msgSend(v41, "frequency") == 3)
    {
      objc_msgSend(v41, "monthsOfTheYear");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v44, "count") >= 2)
      {
        objc_msgSend(v7, "constraints");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v13 |= objc_msgSend(v45, "prohibitsMultipleMonthsInYearlyRecurrence");

      }
    }
    if (objc_msgSend(v41, "frequency") == 3 && objc_msgSend(v41, "interval") >= 2)
    {
      objc_msgSend(v7, "constraints");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v13 |= objc_msgSend(v46, "prohibitsYearlyRecurrenceInterval");

    }
    LOBYTE(v13) = v13 != 0;

  }
  return v13;
}

+ (BOOL)_calendarsAreSharedToMeInSameSourceAndHaveSameOwner:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sharedOwnerAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v13, "sharingStatus", (_QWORD)v20) != 2)
            goto LABEL_13;
          objc_msgSend(v13, "source");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v5, "isEqual:", v14);

          if (v15)
          {
            objc_msgSend(v13, "sharedOwnerAddress");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v7, "isEqualToString:", v16);

            if (v17)
              continue;
          }
LABEL_13:
          v18 = 0;
          goto LABEL_16;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v18 = 1;
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v18 = 1;
    }
LABEL_16:

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)_requirementsToMoveToCalendarHelperDuplicationRequiredToMoveEventFromCalendar:(id)a3 toCalendar:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "allowsContentModifications") & 1) != 0)
    v8 = 0;
  else
    v8 = objc_msgSend(v6, "isSuggestedEventCalendar") ^ 1;
  if (-[EKCalendarItem hasAttendees](self, "hasAttendees"))
  {
    if (objc_msgSend(v6, "type")
      && (-[EKCalendarItem organizer](self, "organizer"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "scheduleAgent"),
          v9,
          v10 != 1))
    {
      if (-[EKEvent isCurrentUserInvitedAttendee](self, "isCurrentUserInvitedAttendee")
        || !-[EKEvent currentUserMayActAsOrganizer](self, "currentUserMayActAsOrganizer"))
      {
        if (objc_msgSend(v6, "sharingStatus") == 2 || objc_msgSend(v7, "sharingStatus") == 2)
        {
          v23[0] = v6;
          v23[1] = v7;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v8 | !+[EKEvent _calendarsAreSharedToMeInSameSourceAndHaveSameOwner:](EKEvent, "_calendarsAreSharedToMeInSameSourceAndHaveSameOwner:", v14);

          if (objc_msgSend(v6, "sharingStatus") == 2)
            v16 = objc_msgSend(v6, "allowsScheduling") ^ 1;
          else
            v16 = 0;
          v8 = v16 | v15;
          if (objc_msgSend(v7, "sharingStatus") == 2)
            v17 = objc_msgSend(v7, "allowsScheduling") ^ 1;
          else
            v17 = 0;
          LOBYTE(v8) = (v8 | v17) != 0;
        }
        else
        {
          objc_msgSend(v6, "source");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "sourceIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "source");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "sourceIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v8 |= objc_msgSend(v19, "isEqualToString:", v21) ^ 1;

        }
      }
    }
    else if (-[EKEvent isCurrentUserInvitedAttendee](self, "isCurrentUserInvitedAttendee"))
    {
      v11 = objc_msgSend(v7, "sharingStatus");
      v12 = objc_msgSend(v7, "type");
      if (v11 == 2 || v12 == 2)
        LOBYTE(v8) = 1;
    }
  }

  return v8;
}

- (BOOL)_requirementsToMoveToCalendarHelperNeedToRemoveOriginalToMoveEventFromCalendar:(id)a3 toCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  _BOOL4 v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EKCalendarItem organizer](self, "organizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "scheduleAgent") == 1)
  {

LABEL_9:
    LOBYTE(v16) = 0;
    goto LABEL_10;
  }
  v9 = objc_msgSend(v6, "type");

  if (!v9 || !-[EKCalendarItem hasAttendees](self, "hasAttendees"))
    goto LABEL_9;
  v18[0] = v6;
  v18[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sourceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sourceIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "isEqualToString:", v14);

  if (v15)
  {
    if (objc_msgSend(v6, "sharingStatus") == 2 || objc_msgSend(v7, "sharingStatus") == 2)
      v16 = !+[EKEvent _calendarsAreSharedToMeInSameSourceAndHaveSameOwner:](EKEvent, "_calendarsAreSharedToMeInSameSourceAndHaveSameOwner:", v10);
    else
      LOBYTE(v16) = 0;
  }
  else
  {
    LOBYTE(v16) = 1;
  }

LABEL_10:
  return v16;
}

- (BOOL)_requirementsToMoveToCalendarHelperReinviteAttendeesRequiredToMoveEventFromCalendar:(id)a3 toCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[EKCalendarItem hasAttendees](self, "hasAttendees")
    || !-[EKEvent currentUserMayActAsOrganizer](self, "currentUserMayActAsOrganizer"))
  {
    goto LABEL_17;
  }
  -[EKCalendarItem organizer](self, "organizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "scheduleAgent") != 1)
  {
    v9 = objc_msgSend(v6, "type");

    if (!v9
      || objc_msgSend(v6, "type") != 2 && objc_msgSend(v7, "type") == 2
      || objc_msgSend(v6, "sharingStatus") == 2
      && objc_msgSend(v7, "sharingStatus") != 2
      && -[EKEvent isCurrentUserInvitedAttendee](self, "isCurrentUserInvitedAttendee"))
    {
      goto LABEL_17;
    }
    if (objc_msgSend(v6, "sharingStatus") == 2 || objc_msgSend(v7, "sharingStatus") == 2)
    {
      if (objc_msgSend(v6, "sharingStatus") != 2
        || (objc_msgSend(v6, "allowsScheduling") & 1) != 0
        || objc_msgSend(v7, "sharingStatus") != 2
        || (objc_msgSend(v7, "allowsScheduling") & 1) != 0)
      {
        goto LABEL_17;
      }
      v16[0] = v6;
      v16[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = !+[EKEvent _calendarsAreSharedToMeInSameSourceAndHaveSameOwner:](EKEvent, "_calendarsAreSharedToMeInSameSourceAndHaveSameOwner:", v12);
    }
    else
    {
      objc_msgSend(v6, "source");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sourceIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "source");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sourceIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v13, "isEqualToString:", v15) ^ 1;

    }
    goto LABEL_18;
  }

LABEL_17:
  LOBYTE(v10) = 0;
LABEL_18:

  return v10;
}

- (BOOL)_requirementsToMoveToCalendarHelperRemoveAttendeesRequiredToMoveEventFromCalendar:(id)a3 toCalendar:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  int v9;

  v6 = a3;
  v7 = a4;
  if (-[EKCalendarItem hasAttendees](self, "hasAttendees"))
  {
    if (objc_msgSend(v6, "type") != 2 && objc_msgSend(v7, "type") == 2
      || objc_msgSend(v6, "sharingStatus") == 2
      && objc_msgSend(v7, "sharingStatus") != 2
      && -[EKEvent isCurrentUserInvitedAttendee](self, "isCurrentUserInvitedAttendee"))
    {
      LOBYTE(v8) = 1;
    }
    else
    {
      v8 = -[EKEvent _requirementsToMoveToCalendarHelperDuplicationRequiredToMoveEventFromCalendar:toCalendar:](self, "_requirementsToMoveToCalendarHelperDuplicationRequiredToMoveEventFromCalendar:toCalendar:", v6, v7);
      if (-[EKEvent currentUserMayActAsOrganizer](self, "currentUserMayActAsOrganizer"))
      {
        if (objc_msgSend(v7, "sharingStatus") == 2)
          v9 = objc_msgSend(v7, "allowsScheduling") ^ 1;
        else
          v9 = 0;
        LOBYTE(v8) = (v9 | v8) != 0;
      }
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (id)eventFromICSEvent:(id)a3 inStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  EKEventStore *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1A85847F4]();
  v8 = objc_alloc_init(MEMORY[0x1E0DDB7D8]);
  v18[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setComponents:options:", v9, 0);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB820]), "initWithCalendar:", v8);
  objc_msgSend(v10, "ICSDataWithOptions:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EKEventStore initWithEKOptions:]([EKEventStore alloc], "initWithEKOptions:", 48);
  -[EKEventStore defaultCalendarForNewEvents](v12, "defaultCalendarForNewEvents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore importICSData:intoCalendar:options:](v12, "importICSData:intoCalendar:options:", v11, v13, *MEMORY[0x1E0D0BE90]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "duplicateToEventStore:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCalendar:", 0);

  objc_autoreleasePoolPop(v7);
  return v16;
}

- (void)setRecurrenceRuleFromICSString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DDB850], "recurrenceRuleFromICSString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[EKEvent _ekRecurrenceRuleFromICSRecurrenceRule:](self, "_ekRecurrenceRuleFromICSRecurrenceRule:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setRecurrenceRules:](self, "setRecurrenceRules:", v7);

  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEvent setRecurrenceRuleFromICSString:].cold.1();
  }

}

- (id)_ekRecurrenceRuleFromICSRecurrenceRule:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  EKEventStore *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  EKEvent *v25;
  id v26;
  void *context;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v25 = self;
    context = (void *)MEMORY[0x1A85847F4]();
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setSummary:", CFSTR("Temp event"));
    v26 = v4;
    v29[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRrule:", v6);

    v7 = objc_alloc(MEMORY[0x1E0DDB800]);
    objc_msgSend(MEMORY[0x1E0DDB810], "dateFromICSString:", CFSTR("20220717T000000Z"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithValue:", v8);
    objc_msgSend(v5, "setDtstart:", v9);

    objc_msgSend(v5, "dtstart");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDtend:", v10);

    v11 = objc_alloc_init(MEMORY[0x1E0DDB7D8]);
    v28 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setComponents:options:", v12, 0);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB820]), "initWithCalendar:", v11);
    objc_msgSend(v13, "ICSDataWithOptions:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[EKEventStore initWithEKOptions:]([EKEventStore alloc], "initWithEKOptions:", 48);
    -[EKEventStore defaultCalendarForNewEvents](v15, "defaultCalendarForNewEvents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventStore importICSData:intoCalendar:options:](v15, "importICSData:intoCalendar:options:", v14, v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "recurrenceRules");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[EKObject eventStore](v25, "eventStore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "duplicateToEventStore:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        -[EKEvent _ekRecurrenceRuleFromICSRecurrenceRule:].cold.1();
      v22 = 0;
    }
    v4 = v26;

    objc_autoreleasePoolPop(context);
    if (v20)
      v23 = v22;
    else
      v23 = 0;

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)updateWithVCSEntity:(id)a3 inCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  EKStructuredLocation *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v68.receiver = self;
  v68.super_class = (Class)EKEvent;
  -[EKCalendarItem updateWithVCSEntity:inCalendar:](&v68, sel_updateWithVCSEntity_inCalendar_, v6, a4);
  v7 = v6;
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent effectiveTimeZone](self, "effectiveTimeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nsDateWithLocalTimeZone:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent effectiveTimeZone](self, "effectiveTimeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nsDateWithLocalTimeZone:", v12);
  v13 = objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "floating"))
  {
    -[EKEvent setTimeZone:](self, "setTimeZone:", 0);
  }
  else
  {
    -[EKEvent effectiveTimeZone](self, "effectiveTimeZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setTimeZone:](self, "setTimeZone:", v14);

  }
  -[EKEvent setAllDay:](self, "setAllDay:", objc_msgSend(v8, "dateOnly"));
  -[EKEvent setStartDate:](self, "setStartDate:", v10);
  -[EKEvent setEndDateUnadjustedForLegacyClients:](self, "setEndDateUnadjustedForLegacyClients:", v13);
  objc_msgSend(v7, "propertyForName:", CFSTR("LOCATION"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "singleValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "value");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "componentsJoinedByString:", CFSTR("; "));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "length"))
  {
    v19 = objc_alloc_init(EKStructuredLocation);
    -[EKStructuredLocation setTitle:](v19, "setTitle:", v18);
    -[EKEvent setStructuredLocation:](self, "setStructuredLocation:", v19);

  }
  objc_msgSend(v7, "propertyForName:", CFSTR("RRULE"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "singleValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "value");
  v22 = objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[EKEvent _ekRecurrenceRuleFromVCSRecurrenceRule:](self, "_ekRecurrenceRuleFromVCSRecurrenceRule:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v23)
    {
      v71[0] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent setRecurrenceRules:](self, "setRecurrenceRules:", v25);

    }
  }
  v59 = (void *)v10;
  objc_msgSend(v7, "propertyForName:", CFSTR("TRANSP"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "singleValue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "value");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "unsignedIntegerValue");

  switch(v29)
  {
    case 1:
    case 2:
      break;
    case 3:
      -[EKCalendarItem calendar](self, "calendar");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v30, "supportedEventAvailabilities") & 0x10) != 0)
        v29 = 4;
      else
        v29 = 3;
      goto LABEL_18;
    case 4:
      -[EKCalendarItem calendar](self, "calendar");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v30, "supportedEventAvailabilities") & 0x20) != 0)
        v29 = 5;
      else
        v29 = 3;
LABEL_18:

      break;
    default:
      v29 = 0;
      break;
  }
  -[EKEvent setAvailability:](self, "setAvailability:", v29);
  v57 = v18;
  v58 = (void *)v13;
  v55 = v22;
  if (!objc_msgSend(v7, "hasPropertyWithName:", CFSTR("STATUS")))
  {
LABEL_24:
    v35 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v7, "propertyForName:", CFSTR("STATUS"), v22, v18, v13);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "singleValue");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "value");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "unsignedIntegerValue");

  if (v34)
  {
    if (v34 != 7)
    {
      if (v34 == 1)
      {
        v35 = 1;
        goto LABEL_25;
      }
      goto LABEL_24;
    }
    v35 = 3;
  }
  else
  {
    v35 = 2;
  }
LABEL_25:
  -[EKEvent setStatus:](self, "setStatus:", v35, v55);
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v7, "propertyForName:", CFSTR("ATTENDEE"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "values");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v65 != v40)
          objc_enumerationMutation(v37);
        objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "value");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        +[EKAttendee attendeeWithName:url:](EKAttendee, "attendeeWithName:url:", 0, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarItem addAttendee:](self, "addAttendee:", v43);

      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    }
    while (v39);
  }

  objc_msgSend(v7, "propertyForName:", CFSTR("EXDATE"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "values");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v45, "count"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v47 = v45;
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v49; ++j)
      {
        if (*(_QWORD *)v61 != v50)
          objc_enumerationMutation(v47);
        objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "value");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "nsDateWithLocalTimeZone:", 0);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObject:", v53);

      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    }
    while (v49);
  }

  -[EKCalendarItem setExceptionDates:](self, "setExceptionDates:", v46);
  -[EKObject eventStore](self, "eventStore");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "saveEvent:span:commit:error:", self, 1, 0, 0);

}

- (id)_ekRecurrenceRuleFromVCSRecurrenceRule:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  EKRecurrenceRule *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  EKRecurrenceRule *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  EKRecurrenceEnd *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id obj;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = 0;
    switch(objc_msgSend(v3, "recurrenceType"))
    {
      case 0:
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
          -[EKEvent _ekRecurrenceRuleFromVCSRecurrenceRule:].cold.1();
        goto LABEL_7;
      case 2:
        v5 = 1;
        break;
      case 3:
      case 4:
        v5 = 2;
        break;
      case 5:
      case 6:
        v5 = 3;
        break;
      default:
        break;
    }
    v33 = v5;
    if (objc_msgSend(v4, "hasDuration") && objc_msgSend(v4, "duration") >= 1)
    {
      v32 = -[EKRecurrenceEnd initWithOccurrenceCount:]([EKRecurrenceEnd alloc], "initWithOccurrenceCount:", objc_msgSend(v4, "duration"));
    }
    else
    {
      objc_msgSend(v4, "endDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v4, "endDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "nsDateWithLocalTimeZone:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = -[EKRecurrenceEnd initWithEndDate:]([EKRecurrenceEnd alloc], "initWithEndDate:", v9);
      }
      else
      {
        v32 = 0;
      }
    }
    v10 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v4, "weekdayList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v4, "weekdayList");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v44;
      v34 = *(_QWORD *)v44;
      v35 = v4;
      do
      {
        v16 = 0;
        v36 = v14;
        do
        {
          if (*(_QWORD *)v44 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v16);
          objc_msgSend(v4, "occurrenceList");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");

          if (v19)
          {
            v41 = 0u;
            v42 = 0u;
            v39 = 0u;
            v40 = 0u;
            objc_msgSend(v4, "occurrenceList");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            if (v21)
            {
              v22 = v21;
              v38 = v16;
              v23 = *(_QWORD *)v40;
              do
              {
                for (i = 0; i != v22; ++i)
                {
                  if (*(_QWORD *)v40 != v23)
                    objc_enumerationMutation(v20);
                  +[EKRecurrenceDayOfWeek dayOfWeek:weekNumber:](EKRecurrenceDayOfWeek, "dayOfWeek:weekNumber:", objc_msgSend((id)objc_opt_class(), "ekWeekDayFromVCSWeekDay:", objc_msgSend(v17, "unsignedIntegerValue")), objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "integerValue"));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "addObject:", v25);

                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
              }
              while (v22);
              v15 = v34;
              v4 = v35;
              v14 = v36;
              v16 = v38;
            }
          }
          else
          {
            +[EKRecurrenceDayOfWeek dayOfWeek:](EKRecurrenceDayOfWeek, "dayOfWeek:", objc_msgSend((id)objc_opt_class(), "ekWeekDayFromVCSWeekDay:", objc_msgSend(v17, "unsignedIntegerValue")));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v20);
          }

          ++v16;
        }
        while (v16 != v14);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v14);
    }

    v26 = [EKRecurrenceRule alloc];
    v27 = objc_msgSend(v4, "interval");
    objc_msgSend(v4, "dayNumberList");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "monthList");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dayList");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[EKRecurrenceRule initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:](v26, "initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", v33, v27, v12, v28, v29, 0, v30, 0, v32);

  }
  else
  {
LABEL_7:
    v6 = 0;
  }

  return v6;
}

+ (int64_t)ekWeekDayFromVCSWeekDay:(unint64_t)a3
{
  if (a3 - 1 < 6)
    return a3 + 1;
  else
    return 1;
}

- (NSString)birthdayPersonUniqueID
{
  return self->_birthdayPersonUniqueID;
}

- (void)setOriginalOccurrenceStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setOriginalOccurrenceEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)originalOccurrenceIsAllDay
{
  return self->_originalOccurrenceIsAllDay;
}

- (void)setOriginalOccurrenceIsAllDay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)requiresDetachDueToSnoozedAlarm
{
  return self->_requiresDetachDueToSnoozedAlarm;
}

- (void)setRequiresDetachDueToSnoozedAlarm:(BOOL)a3
{
  self->_requiresDetachDueToSnoozedAlarm = a3;
}

- (int)clearModifiedFlags
{
  return self->_clearModifiedFlags;
}

- (void)setClearModifiedFlags:(int)a3
{
  self->_clearModifiedFlags = a3;
}

- (void)setIsOriginalItemPhantom:(BOOL)a3
{
  self->_isOriginalItemPhantom = a3;
}

- (BOOL)preventConferenceURLDetection
{
  return self->_preventConferenceURLDetection;
}

- (void)setPreventConferenceURLDetection:(BOOL)a3
{
  self->_preventConferenceURLDetection = a3;
}

- (NSString)showEventURLString
{
  return self->_showEventURLString;
}

- (BOOL)isMainOccurrence
{
  return self->_isMainOccurrence;
}

- (void)setVirtualConferenceTextRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_virtualConferenceTextRepresentation, a3);
}

void __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, a1, a3, "(cachedJunkStatus) event was just created event is not junk", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, a1, a3, "(cachedJunkStatus) event is not junk because it was either organized by me or has no attendees", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A2318000, a2, a3, "(cachedJunkStatus) junk status for the invitation is %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, a1, a3, "(cachedJunkStatus) my status on the event is accepted or tentative so the event is not junk", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_5(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1A2318000, a2, OS_LOG_TYPE_DEBUG, "(cachedJunkStatus) junkStatus was set on the event to %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithEventStore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7_3(&dword_1A2318000, v0, v1, "API MISUSE: nil event store used in initialization of EKEvent instance", v2);
  OUTLINED_FUNCTION_1();
}

- (void)setProposedStartDate:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "privacyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1A2318000, v1, OS_LOG_TYPE_ERROR, "Tried to set proposed start date on invalid event: %@", v3, 0xCu);

  OUTLINED_FUNCTION_4_0();
}

- (void)_updatePredictedLocationCacheIfNeededHoldingLock
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "privacyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A2318000, v1, v3, "Beginning location prediction for event: %@", v4);

  OUTLINED_FUNCTION_4_0();
}

+ (void)_updatedPredictedLocationRespectingTimeoutBudgetForEvent:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "LocationPrediction: Not attempting prediction due to past timeouts", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_updatedPredictedLocationRespectingTimeoutBudgetForEvent:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 134218240;
  v5 = remainingTimeout;
  v6 = 2048;
  v7 = *(double *)&remainingTimeout - a2;
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, a1, a4, "LocationPrediction: Updating timeout from %f to %f", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_updatedPredictedLocationRespectingTimeoutBudgetForEvent:(uint64_t)a3 error:(double)a4 .cold.3(char a1, NSObject *a2, uint64_t a3, double a4)
{
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = &stru_1E4789A58;
  if ((a1 & 1) == 0)
    v4 = CFSTR("NOT ");
  v5 = 138412546;
  v6 = v4;
  v7 = 2048;
  v8 = a4;
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, a2, a3, "LocationPrediction: this is %@the main thread. Using timeout %f", (uint8_t *)&v5);
  OUTLINED_FUNCTION_1_0();
}

void __74__EKEvent__updatedPredictedLocationRespectingTimeoutBudgetForEvent_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "LocationPrediction: Reset timeout", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_hasRecurrenceRuleChangeRequiringSpanAll
{
  id v3;
  void *v4;
  void *v5;
  os_log_t v6;
  os_log_type_t v7;
  const char *v8;
  uint8_t *v9;

  v3 = OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend(a2, "recurrenceRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "count");
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_12_0();
  _os_log_error_impl(v5, v6, v7, v8, v9, 0xEu);

  OUTLINED_FUNCTION_1_1();
}

- (void)_duplicateAddedAttachmentsToDetachedEvents:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  os_log_t v5;
  os_log_type_t v6;
  const char *v7;
  uint8_t *v8;

  v3 = a1;
  objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_12_0();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x20u);

}

- (void)_adjustAvailabilityAfterMovingOrCopyingFromCalendar:toCalendar:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkSuggestionsEKEventAvailabilityState(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKEvent.m"), 110, CFSTR("%s"), dlerror());

  __break(1u);
}

void __116__EKEvent__adjustAttachmentsAfterMovingOrCopyingFromCalendar_toCalendar_cachedConstraintsForOldCalendar_savingItem___block_invoke_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_7_3(&dword_1A2318000, a3, (uint64_t)a3, "Couldn't copy attachment file, so we're just going to have to remove the attachment from the moved event", a1);
}

- (void)updateEventToEvent:commit:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A2318000, v0, v1, "-[EKEvent updateEventToEvent:] saved itself correctly [%@]", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateEventToEvent:commit:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "-[EKEvent updateEventToEvent:] failed to save with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateEventToEvent:commit:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, v0, (uint64_t)v0, "-[EKEvent updateEventToEvent:] is about to save itself [%@] with EKSuggestedEventInfo [%@]", v1);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateEventToEvent:commit:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "-[EKEvent updateEventToEvent:] was called on an event without a EKSuggestedEventInfo: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateEventToEvent:commit:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "-[EKEvent updateEventToEvent:] failed to save with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateEventToEvent:commit:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A2318000, v0, v1, "-[EKEvent updateEventToEvent:] CANCEL finished correctly [%@], now attempting to save", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateEventToEvent:commit:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "-[EKEvent updateEventToEvent:] CANCEL failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateEventToEvent:commit:.cold.9()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, v0, (uint64_t)v0, "-[EKEvent updateEventToEvent:] was given a nil event and will CANCEL itself [%@] with EKSuggestedEventInfo [%@]", v1);
  OUTLINED_FUNCTION_1_0();
}

- (void)setRecurrenceRuleFromICSString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Could not parse ICS recurrence rule: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_ekRecurrenceRuleFromICSRecurrenceRule:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7_3(&dword_1A2318000, v0, v1, "Could not construct EKRecurrenceRule from ICS recurrence rule", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_ekRecurrenceRuleFromVCSRecurrenceRule:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7_3(&dword_1A2318000, v0, v1, "@Unknown recurrence type", v2);
  OUTLINED_FUNCTION_1();
}

@end
