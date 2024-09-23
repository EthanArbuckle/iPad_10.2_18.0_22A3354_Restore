@implementation CADTravelEventsPredicate

- (CADTravelEventsPredicate)initWithCalendarIDs:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  CADTravelEventsPredicate *v10;
  CADTravelEventsPredicate *v11;
  CADTravelEventsPredicate *v12;
  NSObject *v13;
  uint8_t v15[16];
  objc_super v16;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CADTravelEventsPredicate;
  v10 = -[EKPredicate initWithCalendars:](&v16, sel_initWithCalendars_, a3);
  v11 = v10;
  if (!v10)
    goto LABEL_5;
  if (v8 && v9)
  {
    -[EKPredicate setStartDate:](v10, "setStartDate:", v8);
    -[EKPredicate setEndDate:](v11, "setEndDate:", v9);
LABEL_5:
    v12 = v11;
    goto LABEL_9;
  }
  v13 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1B6A18000, v13, OS_LOG_TYPE_ERROR, "CADTravelEventsPredicate must be given non-nil 'startDate' and 'endDate'", v15, 2u);
  }
  v12 = 0;
LABEL_9:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADTravelEventsPredicate)initWithCoder:(id)a3
{
  id v4;
  CADTravelEventsPredicate *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADTravelEventsPredicate;
  v5 = -[EKPredicate initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate setStartDate:](v5, "setStartDate:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate setEndDate:](v5, "setEndDate:", v7);

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
  v7.super_class = (Class)CADTravelEventsPredicate;
  v4 = a3;
  -[EKPredicate encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[EKPredicate startDate](self, "startDate", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("startDate"));

  -[EKPredicate endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("endDate"));

}

- (id)predicateFormat
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

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateStyle:", 1);
  objc_msgSend(v3, "setTimeStyle:", 1);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[EKPredicate startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate calendars](self, "calendars");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CADPredicate conciseCalendarList:](CADPredicate, "conciseCalendarList:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("CADTravelEventsPredicate start:%@; end:%@; cals:%@"), v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CADTravelEventsPredicate *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (CADTravelEventsPredicate *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      -[EKPredicate startDate](v4, "startDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKPredicate startDate](self, "startDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[EKPredicate endDate](v4, "endDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKPredicate endDate](self, "endDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", v10))
        {
          -[EKPredicate calendars](v4, "calendars");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKPredicate calendars](self, "calendars");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11 == v12)
          {
            v6 = 1;
          }
          else
          {
            -[EKPredicate calendars](v4, "calendars");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKPredicate calendars](self, "calendars");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = objc_msgSend(v13, "isEqual:", v14);

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
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  void *v5;
  char v6;
  NSObject *v8;
  int v9;
  CADTravelEventsPredicate *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D0BB10], "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "get_enableTravelAdvisoriesForAutomaticBehavior");

  if ((v6 & 1) != 0)
  {
    -[CADTravelEventsPredicate _fetchTravelEventsWithDatabase:](self, "_fetchTravelEventsWithDatabase:", a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = self;
      _os_log_impl(&dword_1B6A18000, v8, OS_LOG_TYPE_DEBUG, "Will not perform travel event search because travel advisories are not enabled globally.  Predicate: [%@]", (uint8_t *)&v9, 0xCu);
    }
    return 0;
  }
}

- (id)_fetchTravelEventsWithDatabase:(CalDatabase *)a3
{
  const void *v4;
  uint64_t AuxilliaryDatabaseID;
  void *v6;
  void *v7;
  uint64_t FilterFromRowIDs;
  void *v9;
  NSObject *v10;
  CADTravelEventsPredicate *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFArray *v17;
  CFIndex Count;
  NSObject *v19;
  CFIndex i;
  const void *ValueAtIndex;
  void *v22;
  void *v23;
  NSObject *v24;
  CADTravelEventsPredicate *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v38;
  void *v39;
  const void *v40;
  CFTypeRef cf;
  id v42;
  uint8_t buf[4];
  CADTravelEventsPredicate *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = (const void *)CalDatabaseCopyEventOccurrenceCache();
  AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
  -[EKPredicate calendarRowIDsForDatabaseID:](self, "calendarRowIDsForDatabaseID:", AuxilliaryDatabaseID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate restrictedCalendarRowIDsForDatabaseID:](self, "restrictedCalendarRowIDsForDatabaseID:", AuxilliaryDatabaseID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  FilterFromRowIDs = CreateFilterFromRowIDs(v6, v7);
  v9 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    v10 = v9;
    -[EKPredicate startDate](self, "startDate");
    v11 = (CADTravelEventsPredicate *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate endDate](self, "endDate");
    v12 = FilterFromRowIDs;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v44 = v11;
    v45 = 2112;
    v46 = v13;
    v47 = 2112;
    v48 = v6;
    v49 = 2112;
    v50 = v7;
    _os_log_impl(&dword_1B6A18000, v10, OS_LOG_TYPE_DEBUG, "Commencing travel event search with start date: [%@] end date: [%@] calendar object IDs: [%@] restricted calendar row IDs: [%@]", buf, 0x2Au);

    FilterFromRowIDs = v12;
  }
  -[EKPredicate startDate](self, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate endDate](self, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  cf = (CFTypeRef)FilterFromRowIDs;
  v17 = (const __CFArray *)CalEventOccurrenceCacheCopyEventOccurrencesInDateRange();

  if (v17)
  {
    v38 = v7;
    v39 = v6;
    v40 = v4;
    Count = CFArrayGetCount(v17);
    v19 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v44 = (CADTravelEventsPredicate *)Count;
      _os_log_impl(&dword_1B6A18000, v19, OS_LOG_TYPE_DEBUG, "Found [%ld] travel event candidates.", buf, 0xCu);
    }
    v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
    if (Count >= 1)
    {
      for (i = 0; Count != i; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v17, i);
        CalEventOccurrenceGetEvent();
        if (CalEventIsCandidateForTravelAdvisories())
        {
          objc_msgSend(v42, "addObject:", ValueAtIndex);
          v22 = (void *)CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
          {
            v23 = (void *)MEMORY[0x1E0C99D68];
            v24 = v22;
            CalEventOccurrenceGetDate();
            objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
            v25 = (CADTravelEventsPredicate *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)CalCalendarItemCopySummary();
            v27 = (void *)MEMORY[0x1E0C99D68];
            v28 = v26;
            CalEventOccurrenceGetDate();
            objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
            v29 = (void *)CalEventCopyURI();
            *(_DWORD *)buf = 138412802;
            v44 = v25;
            v45 = 2112;
            v46 = v26;
            v47 = 2112;
            v48 = v29;
            _os_log_impl(&dword_1B6A18000, v24, OS_LOG_TYPE_DEBUG, "Accepted travel event candidate.  Start date: [%@] title: [%@] URI: [%@]", buf, 0x20u);

LABEL_13:
          }
        }
        else
        {
          v30 = (void *)CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
          {
            v31 = (void *)MEMORY[0x1E0C99D68];
            v24 = v30;
            CalEventOccurrenceGetDate();
            objc_msgSend(v31, "dateWithTimeIntervalSinceReferenceDate:");
            v25 = (CADTravelEventsPredicate *)objc_claimAutoreleasedReturnValue();
            v32 = (void *)CalCalendarItemCopySummary();
            v33 = (void *)MEMORY[0x1E0C99D68];
            v34 = v32;
            CalEventOccurrenceGetDate();
            objc_msgSend(v33, "dateWithTimeIntervalSinceReferenceDate:");
            v35 = (void *)CalEventCopyURI();
            *(_DWORD *)buf = 138412802;
            v44 = v25;
            v45 = 2112;
            v46 = v32;
            v47 = 2112;
            v48 = v35;
            _os_log_impl(&dword_1B6A18000, v24, OS_LOG_TYPE_DEBUG, "Rejected travel event candidate.  Start date: [%@] title: [%@] URI: [%@]", buf, 0x20u);

            goto LABEL_13;
          }
        }
      }
    }
    CFRelease(v17);
    v6 = v39;
    v4 = v40;
    v7 = v38;
  }
  else
  {
    v36 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v44 = self;
      _os_log_impl(&dword_1B6A18000, v36, OS_LOG_TYPE_DEBUG, "NULL occurrences array returned for [%@].", buf, 0xCu);
    }
    v42 = 0;
  }
  if (cf)
    CFRelease(cf);
  if (v4)
    CFRelease(v4);

  return v42;
}

@end
