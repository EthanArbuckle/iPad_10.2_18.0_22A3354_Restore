@implementation CADUpNextEventsPredicate

- (CADUpNextEventsPredicate)initWithCalendarIDs:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  CADUpNextEventsPredicate *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  void *v18;
  objc_class *v19;
  CADUpNextEventsPredicate *v20;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CADUpNextEventsPredicate;
  v10 = -[EKPredicate initWithCalendars:](&v22, sel_initWithCalendars_, a3);
  if (!v10)
    goto LABEL_12;
  if (v8 && v9)
  {
    if (objc_msgSend(v8, "CalIsAfterDate:", v9))
    {
      v11 = (void *)CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v12 = v11;
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v24 = v14;
        v25 = 2112;
        v26 = v8;
        v27 = 2112;
        v28 = v9;
        v15 = "[%@] must be given a 'startDate' that occurs before the given 'endDate.'  startDate: [%@] endDate: [%@]";
        v16 = v12;
        v17 = 32;
LABEL_9:
        _os_log_impl(&dword_1B6A18000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);

        goto LABEL_10;
      }
      goto LABEL_10;
    }
    -[EKPredicate setStartDate:](v10, "setStartDate:", v8);
    -[EKPredicate setEndDate:](v10, "setEndDate:", v9);
LABEL_12:
    v20 = v10;
    goto LABEL_13;
  }
  v18 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    v12 = v18;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v14;
    v15 = "[%@] must be given non-nil 'startDate' and 'endDate'";
    v16 = v12;
    v17 = 12;
    goto LABEL_9;
  }
LABEL_10:
  v20 = 0;
LABEL_13:

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADUpNextEventsPredicate)initWithCoder:(id)a3
{
  id v4;
  CADUpNextEventsPredicate *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADUpNextEventsPredicate;
  v5 = -[EKPredicate initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate setStartDate:](v5, "setStartDate:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate setEndDate:](v5, "setEndDate:", v7);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("startDateRestrictionThreshold"));
    -[CADUpNextEventsPredicate setStartDateRestrictionThreshold:](v5, "setStartDateRestrictionThreshold:");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CADUpNextEventsPredicate;
  v4 = a3;
  -[EKPredicate encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[EKPredicate startDate](self, "startDate", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("startDate"));

  -[EKPredicate endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("endDate"));

  -[CADUpNextEventsPredicate startDateRestrictionThreshold](self, "startDateRestrictionThreshold");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("startDateRestrictionThreshold"));

}

- (id)predicateFormat
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateStyle:", 1);
  objc_msgSend(v3, "setTimeStyle:", 1);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate endDate](self, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate calendars](self, "calendars");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CADPredicate conciseCalendarList:](CADPredicate, "conciseCalendarList:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@] start:%@; end:%@; cals:%@"), v6, v8, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  CADUpNextEventsPredicate *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v4 = (CADUpNextEventsPredicate *)a3;
  if (v4 == self)
  {
    v17 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && (-[CADUpNextEventsPredicate startDateRestrictionThreshold](v4, "startDateRestrictionThreshold"),
          v7 = v6,
          -[CADUpNextEventsPredicate startDateRestrictionThreshold](self, "startDateRestrictionThreshold"),
          vabdd_f64(v7, v8) < 2.22044605e-16))
    {
      -[EKPredicate startDate](v4, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKPredicate startDate](self, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[EKPredicate endDate](v4, "endDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKPredicate endDate](self, "endDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v12))
        {
          -[EKPredicate calendars](v4, "calendars");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKPredicate calendars](self, "calendars");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13 == v14)
          {
            v17 = 1;
          }
          else
          {
            -[EKPredicate calendars](v4, "calendars");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKPredicate calendars](self, "calendars");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "isEqual:", v16);

          }
        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  CADUpNextEventsPredicate *v9;
  void *v10;
  void *v11;
  const void *v12;
  uint64_t AuxilliaryDatabaseID;
  CADUpNextEventsPredicate *v14;
  void *v15;
  const void *FilterFromRowIDs;
  void *v17;
  NSObject *v18;
  CADUpNextEventsPredicate *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFArray *v26;
  id v27;
  CFIndex Count;
  NSObject *v29;
  const __CFArray *v30;
  CADUpNextEventsPredicate *v31;
  CADUpNextEventsPredicate *v32;
  CFIndex v33;
  const void *ValueAtIndex;
  uint64_t Event;
  void *v36;
  NSObject *v37;
  CADUpNextEventsPredicate *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  CADUpNextEventsPredicate *v43;
  NSObject *v44;
  const char *v45;
  uint32_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  const __CFArray *cf;
  const void *v55;
  void *v56;
  CADUpNextEventsPredicate *v57;
  const void *v58;
  void *v59;
  CFIndex v60;
  uint8_t buf[4];
  CADUpNextEventsPredicate *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  CADUpNextEventsPredicate *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  -[EKPredicate startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "CalIsAfterDate:", v5);

  if (v6)
  {
    v7 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      -[EKPredicate startDate](self, "startDate");
      v9 = (CADUpNextEventsPredicate *)objc_claimAutoreleasedReturnValue();
      -[EKPredicate endDate](self, "endDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v62 = v9;
      v63 = 2112;
      v64 = v10;
      v65 = 2112;
      v66 = self;
      _os_log_impl(&dword_1B6A18000, v8, OS_LOG_TYPE_ERROR, "Start date [%@] is after end date [%@].  Will not query for events for [%@]", buf, 0x20u);

    }
    return (id)MEMORY[0x1E0C9AA60];
  }
  v12 = (const void *)CalDatabaseCopyEventOccurrenceCache();
  AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
  -[EKPredicate calendarRowIDsForDatabaseID:](self, "calendarRowIDsForDatabaseID:", AuxilliaryDatabaseID);
  v14 = (CADUpNextEventsPredicate *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate restrictedCalendarRowIDsForDatabaseID:](self, "restrictedCalendarRowIDsForDatabaseID:", AuxilliaryDatabaseID);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  FilterFromRowIDs = (const void *)CreateFilterFromRowIDs(v14, v15);
  v17 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    v18 = v17;
    -[EKPredicate startDate](self, "startDate");
    v19 = (CADUpNextEventsPredicate *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate endDate](self, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[CADUpNextEventsPredicate startDateRestrictionThreshold](self, "startDateRestrictionThreshold");
    objc_msgSend(v21, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v62 = v19;
    v63 = 2112;
    v64 = v20;
    v65 = 2112;
    v66 = v14;
    v67 = 2112;
    v68 = v15;
    v69 = 2112;
    v70 = v22;
    _os_log_impl(&dword_1B6A18000, v18, OS_LOG_TYPE_DEBUG, "Commencing up next event search with start date: [%@] end date: [%@] calendar object IDs: [%@] restricted calendar row IDs: [%@] startDateRestrictionThreshold: [%@]", buf, 0x34u);

  }
  -[EKPredicate startDate](self, "startDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate endDate](self, "endDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (const __CFArray *)CalEventOccurrenceCacheCopyEventOccurrencesInDateRange();

  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = v27;
  if (!v26)
  {
    v49 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v62 = self;
      _os_log_impl(&dword_1B6A18000, v49, OS_LOG_TYPE_DEBUG, "NULL occurrences array returned for [%@].", buf, 0xCu);
    }
    goto LABEL_39;
  }
  v59 = v27;
  v56 = v15;
  Count = CFArrayGetCount(v26);
  v29 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v62 = (CADUpNextEventsPredicate *)Count;
    _os_log_impl(&dword_1B6A18000, v29, OS_LOG_TYPE_DEBUG, "Found [%ld] up next event candidates.  Proceeding to sort and filter.", buf, 0xCu);
  }
  cf = v26;
  v55 = FilterFromRowIDs;
  v57 = v14;
  v58 = v12;
  v30 = (const __CFArray *)-[__CFArray sortedArrayUsingComparator:](v26, "sortedArrayUsingComparator:", &__block_literal_global_4);
  objc_msgSend(MEMORY[0x1E0C99D68], "CalSimulatedDateForNow");
  v31 = (CADUpNextEventsPredicate *)objc_claimAutoreleasedReturnValue();
  if (Count < 1)
  {
    v32 = 0;
    goto LABEL_38;
  }
  v60 = Count;
  v32 = 0;
  v33 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v30, v33);
    Event = CalEventOccurrenceGetEvent();
    v36 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      v37 = v36;
      objc_msgSend((id)objc_opt_class(), "_descriptionForOccurrence:ofEvent:", ValueAtIndex, Event);
      v38 = (CADUpNextEventsPredicate *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v62 = v38;
      _os_log_impl(&dword_1B6A18000, v37, OS_LOG_TYPE_DEBUG, "Analyzing 'up next' candidate: [%@]", buf, 0xCu);

    }
    CalEventOccurrenceGetDate();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "dateByAddingTimeInterval:", (double)CalEventGetDuration());
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v40, "CalIsBeforeDate:", v31))
      break;
    v41 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      v42 = v41;
      objc_msgSend((id)objc_opt_class(), "_descriptionForOccurrence:ofEvent:", ValueAtIndex, Event);
      v43 = (CADUpNextEventsPredicate *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v62 = v31;
      v63 = 2112;
      v64 = v40;
      v65 = 2112;
      v66 = v43;
      v44 = v42;
      v45 = "Rejected 'up next' candidate because it ended before 'now' at [%@].  End date: [%@].  Candidate: [%@]";
      v46 = 32;
LABEL_29:
      _os_log_impl(&dword_1B6A18000, v44, OS_LOG_TYPE_DEBUG, v45, buf, v46);

    }
LABEL_30:

    if (v60 == ++v33)
      goto LABEL_38;
  }
  if (!v32 || (-[CADUpNextEventsPredicate isEqualToDate:](v32, "isEqualToDate:", v39) & 1) != 0)
  {
    if (objc_msgSend((id)objc_opt_class(), "_occurrencePassesFilter:event:", ValueAtIndex, Event))
    {
      objc_msgSend(v59, "addObject:", ValueAtIndex);
      if (!v32)
      {
        if (objc_msgSend(v39, "CalIsAfterOrSameAsDate:", v31))
          v32 = v39;
        else
          v32 = 0;
      }
      v48 = (void *)CADLogHandle;
      if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
        goto LABEL_30;
      v42 = v48;
      objc_msgSend((id)objc_opt_class(), "_descriptionForOccurrence:ofEvent:", ValueAtIndex, Event);
      v43 = (CADUpNextEventsPredicate *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v62 = v43;
      v44 = v42;
      v45 = "Accepted 'up next' candidate: [%@]";
    }
    else
    {
      v47 = (void *)CADLogHandle;
      if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
        goto LABEL_30;
      v42 = v47;
      objc_msgSend((id)objc_opt_class(), "_descriptionForOccurrence:ofEvent:", ValueAtIndex, Event);
      v43 = (CADUpNextEventsPredicate *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v62 = v43;
      v44 = v42;
      v45 = "Rejected 'up next' candidate because it didn't pass the filter.  Candidate: [%@]";
    }
    v46 = 12;
    goto LABEL_29;
  }
  v50 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    v51 = v50;
    objc_msgSend((id)objc_opt_class(), "_descriptionForOccurrence:ofEvent:", ValueAtIndex, Event);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v62 = v32;
    v63 = 2112;
    v64 = v52;
    _os_log_impl(&dword_1B6A18000, v51, OS_LOG_TYPE_DEBUG, "Rejected 'up next' candidate because its start date is not equal to the earliest start date on or after now.  Earliest date: [%@]  Candidate: [%@]", buf, 0x16u);

  }
LABEL_38:
  CFRelease(cf);

  v14 = v57;
  v12 = v58;
  FilterFromRowIDs = v55;
  v15 = v56;
  v11 = v59;
LABEL_39:
  if (FilterFromRowIDs)
    CFRelease(FilterFromRowIDs);
  if (v12)
    CFRelease(v12);

  return v11;
}

uint64_t __58__CADUpNextEventsPredicate_copyMatchingItemsWithDatabase___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  CalEventOccurrenceGetDate();
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99D68];
  CalEventOccurrenceGetDate();
  v8 = v7;

  objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "compare:", v9);

  return v10;
}

+ (BOOL)_occurrencePassesFilter:(CalEventOccurrence *)a3 event:(void *)a4
{
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  const void *v15;
  int ParticipationStatus;
  void *v17;
  uint64_t v18;
  const void *v19;
  uint64_t v20;
  const void *v21;
  char IsFoundInMailCalendar;
  void *v23;
  int v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    if (CalEventIsAllDay())
    {
      v7 = (void *)CADLogHandle;
      v8 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG);
      if (v8)
      {
        v9 = v7;
        objc_msgSend((id)objc_opt_class(), "_descriptionForOccurrence:ofEvent:", a3, a4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412290;
        v26 = v10;
        v11 = "Occurrence does not pass filter since it is an all-day event.  Occurrence: [%@]";
LABEL_10:
        _os_log_impl(&dword_1B6A18000, v9, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v25, 0xCu);

        goto LABEL_11;
      }
    }
    else
    {
      if (CalCalendarItemGetStatus() != 3)
      {
        if (CalCalendarItemHasAttendees())
        {
          v14 = CalCalendarItemCopyOrganizer();
          if (v14)
          {
            v15 = (const void *)v14;
            if (CalOrganizerIsSelf())
            {
              CFRelease(v15);
            }
            else
            {
              ParticipationStatus = CalEventGetParticipationStatus();
              CFRelease(v15);
              if (ParticipationStatus == 2)
              {
                v17 = (void *)CADLogHandle;
                v8 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG);
                if (!v8)
                  return v8;
                v9 = v17;
                objc_msgSend((id)objc_opt_class(), "_descriptionForOccurrence:ofEvent:", a3, a4);
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = 138412290;
                v26 = v10;
                v11 = "Occurrence does not pass filter since it is a declined event.  Occurrence: [%@]";
                goto LABEL_10;
              }
            }
          }
        }
        v18 = CalEventCopyStore();
        if (v18)
        {
          v19 = (const void *)v18;
          if (CalStoreGetType() == 5 && (v20 = CalCalendarItemCopyCalendar()) != 0)
          {
            v21 = (const void *)v20;
            IsFoundInMailCalendar = CalCalendarIsFoundInMailCalendar();
            CFRelease(v21);
            CFRelease(v19);
            if ((IsFoundInMailCalendar & 1) == 0)
            {
              v23 = (void *)CADLogHandle;
              v8 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG);
              if (!v8)
                return v8;
              v9 = v23;
              objc_msgSend((id)objc_opt_class(), "_descriptionForOccurrence:ofEvent:", a3, a4);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = 138412290;
              v26 = v10;
              v11 = "Occurrence does not pass filter since it is a birthday event.  Occurrence: [%@]";
              goto LABEL_10;
            }
          }
          else
          {
            CFRelease(v19);
          }
        }
        LOBYTE(v8) = 1;
        return v8;
      }
      v13 = (void *)CADLogHandle;
      v8 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG);
      if (v8)
      {
        v9 = v13;
        objc_msgSend((id)objc_opt_class(), "_descriptionForOccurrence:ofEvent:", a3, a4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412290;
        v26 = v10;
        v11 = "Occurrence does not pass filter since it is a cancelled event.  Occurrence: [%@]";
        goto LABEL_10;
      }
    }
  }
  else
  {
    v12 = CADLogHandle;
    v8 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      v25 = 138412290;
      v26 = a1;
      _os_log_impl(&dword_1B6A18000, v12, OS_LOG_TYPE_ERROR, "NULL 'event' given.  Will not check to see if the event passes the filter for [%@]", (uint8_t *)&v25, 0xCu);
LABEL_11:
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

+ (id)_descriptionForOccurrence:(CalEventOccurrence *)a3 ofEvent:(void *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  uint8_t buf[2];
  __int16 v15;

  if (a3)
  {
    if (a4)
    {
      v4 = (void *)CalCalendarItemCopySummary();
      v5 = (void *)MEMORY[0x1E0C99D68];
      CalEventOccurrenceGetDate();
      objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0C99D68];
      CalEventOccurrenceGetDate();
      objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
      v8 = (void *)CalEventCopyURI();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("summary: [%@], occurrence start date: [%@], URI: [%@]"), v4, v6, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      return v9;
    }
    v11 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v12 = "NULL 'event' given.  Will not find a description for the occurrence.";
      v13 = buf;
      goto LABEL_8;
    }
  }
  else
  {
    v11 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v15 = 0;
      v12 = "NULL 'occurrence' given.  Will not find a description for the occurrence.";
      v13 = (uint8_t *)&v15;
LABEL_8:
      _os_log_impl(&dword_1B6A18000, v11, OS_LOG_TYPE_ERROR, v12, v13, 2u);
    }
  }
  return &stru_1E6A39768;
}

- (double)startDateRestrictionThreshold
{
  return self->_startDateRestrictionThreshold;
}

- (void)setStartDateRestrictionThreshold:(double)a3
{
  self->_startDateRestrictionThreshold = a3;
}

@end
