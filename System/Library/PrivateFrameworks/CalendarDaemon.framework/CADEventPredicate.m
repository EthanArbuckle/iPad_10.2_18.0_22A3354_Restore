@implementation CADEventPredicate

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  uint64_t AuxilliaryDatabaseID;
  void *v5;
  void *v6;
  uint64_t FilterFromRowIDs;
  const void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFArray *v13;
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v15;
  CFIndex Count;
  void *v17;
  uint64_t i;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t j;
  const void *ValueAtIndex;
  CFTypeID v30;
  void *v31;
  int v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  _BOOL4 v37;
  int v38;
  __CFArray *v40;
  __CFArray *v41;
  CFTypeRef cf;
  void *v44;
  void *v45;
  __CFArray *theArray;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
  -[EKPredicate calendarRowIDsForDatabaseID:](self, "calendarRowIDsForDatabaseID:", AuxilliaryDatabaseID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate restrictedCalendarRowIDsForDatabaseID:](self, "restrictedCalendarRowIDsForDatabaseID:", AuxilliaryDatabaseID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FilterFromRowIDs = CreateFilterFromRowIDs(v5, v6);
  if (FilterFromRowIDs)
  {
    v8 = (const void *)FilterFromRowIDs;
    -[EKPredicate startDate](self, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate endDate](self, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADEventPredicate timeZone](self, "timeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CADEventPredicate shouldLoadProposedTimesInRange](self, "shouldLoadProposedTimesInRange");
    v13 = (const __CFArray *)CalDatabaseCopyEventOccurrencesInDateRangeEx();
    if (!v11)

    if (!v13)
    {
      v15 = 0;
      v23 = 0;
LABEL_56:
      CFRelease(v8);
      goto LABEL_57;
    }
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    v15 = Mutable;
    if (Mutable)
    {
      theArray = Mutable;
      v44 = v6;
      Count = CFArrayGetCount(v13);
      v17 = (void *)objc_opt_new();
      if (Count >= 1)
      {
        for (i = 0; i != Count; ++i)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", i);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v19);

        }
      }
      cf = v8;
      v45 = v5;
      if (self->_randomize)
      {
        v20 = objc_msgSend(v17, "count");
        if (v20 >= 2)
        {
          v21 = v20;
          v22 = 0;
          do
          {
            objc_msgSend(v17, "exchangeObjectAtIndex:withObjectAtIndex:", v22, v22 + arc4random_uniform(v21));
            ++v22;
            --v21;
          }
          while (v21 != 1);
        }
      }
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v23 = v17;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v48;
        v27 = *MEMORY[0x1E0D0C490];
        while (2)
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v48 != v26)
              objc_enumerationMutation(v23);
            ValueAtIndex = CFArrayGetValueAtIndex(v13, objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "longValue", cf));
            v30 = CFGetTypeID(ValueAtIndex);
            if (v30 == CalEventOccurrenceGetTypeID())
            {
              CalEventOccurrenceGetEvent();
              if (!self->super._uuid
                || (v31 = (void *)CalEventCopyUniqueIdentifier(),
                    v32 = objc_msgSend(v31, "isEqualToString:", self->super._uuid),
                    v31,
                    v32))
              {
                if ((!self->_excludeTimedEvents || CalEventIsAllDay())
                  && (!self->_excludeAllDayEvents || (CalEventIsAllDay() & 1) == 0)
                  && (!self->_excludeNoAttendeeEvents || CalCalendarItemHasAttendees())
                  && (!self->_excludeNoLocationEvents || CalCalendarItemHasLocation()))
                {
                  v33 = (void *)CalCalendarItemCopySummary();
                  if (!-[NSSet containsObject:](self->_filteredOutTitles, "containsObject:", v33))
                  {
                    CalEventGetProposedStartDate();
                    if (v34 == v27)
                    {
                      v37 = 0;
                    }
                    else
                    {
                      v35 = v34;
                      CalEventOccurrenceGetDate();
                      v37 = vabdd_f64(v36, v35) < 2.22044605e-16;
                    }
                    if (CalEventGetParticipationStatus() != 2
                      || (!self->_excludeDeclinedUnlessProposed ? (v38 = 1) : (v38 = v37),
                          v38 == 1 && !self->_excludeDeclined))
                    {
                      if (!self->_excludeProposed || !v37)
                      {
                        CFArrayAppendValue(theArray, ValueAtIndex);
                        if (self->_limit >= 1 && self->_limit == CFArrayGetCount(theArray))
                        {

                          goto LABEL_50;
                        }
                      }
                    }
                  }

                }
              }
            }
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
          if (v25)
            continue;
          break;
        }
      }
LABEL_50:

      v15 = theArray;
      v40 = theArray;
      v6 = v44;
      v5 = v45;
      v8 = cf;
    }
    else
    {
      v23 = 0;
    }
    CFRelease(v8);
    CFRelease(v13);
    if (v15)
    {
      v8 = v15;
      goto LABEL_56;
    }
  }
  else
  {
    v15 = 0;
    v23 = 0;
  }
LABEL_57:
  v41 = v15;

  return v41;
}

- (NSTimeZone)timeZone
{
  return self->super._timeZone;
}

- (BOOL)shouldLoadProposedTimesInRange
{
  return self->_shouldLoadProposedTimesInRange;
}

+ (id)predicateWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 calendars:(id)a6 propertyLoadMode:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStartDate:endDate:timeZone:calendars:propertyLoadMode:", v14, v13, v12, v11, a7);

  return v15;
}

- (CADEventPredicate)initWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 calendars:(id)a6 propertyLoadMode:(unint64_t)a7
{
  CADEventPredicate *result;

  result = -[CADEventPredicate initWithStartDate:endDate:timeZone:calendars:](self, "initWithStartDate:endDate:timeZone:calendars:", a3, a4, a5, a6);
  if (result)
    result->_propertyLoadMode = a7;
  return result;
}

- (CADEventPredicate)initWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 eventUUID:(id)a6 calendars:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CADEventPredicate *v16;
  CADEventPredicate *v17;
  void *v18;
  CADEventPredicate *v19;
  void *v20;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CADEventPredicate;
  v16 = -[EKPredicate initWithCalendars:](&v22, sel_initWithCalendars_, a7);
  v17 = v16;
  if (!v16)
  {
LABEL_9:
    v19 = v17;
    goto LABEL_10;
  }
  if (v12 && v13)
  {
    -[EKPredicate setStartDate:](v16, "setStartDate:", v12);
    -[EKPredicate setEndDate:](v17, "setEndDate:", v13);
    objc_storeStrong((id *)&v17->super._uuid, a6);
    if (v14)
      v18 = (void *)objc_msgSend(v14, "copy");
    else
      v18 = (void *)CalCopyTimeZone();
    v20 = v18;
    objc_storeStrong((id *)&v17->super._timeZone, v18);

    v17->_excludeSkippedReminders = 1;
    goto LABEL_9;
  }
  NSLog(CFSTR("WARNING: CADEventPredicate must be given non nil startDate and endDate"));
  v19 = 0;
LABEL_10:

  return v19;
}

- (CADEventPredicate)initWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 calendars:(id)a6
{
  return -[CADEventPredicate initWithStartDate:endDate:timeZone:eventUUID:calendars:](self, "initWithStartDate:endDate:timeZone:eventUUID:calendars:", a3, a4, a5, 0, a6);
}

- (void)beginSignpostWithHandle:(id)a3 signpostID:(unint64_t)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    -[CADEventPredicate predicateFormat](self, "predicateFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v8;
    v13 = 2114;
    v14 = v10;
    _os_signpost_emit_with_name_impl(&dword_1B6A18000, v7, OS_SIGNPOST_INTERVAL_BEGIN, a4, "EKPredicateSearch", "predicateClass=%@; predicateFormat=%{public}@",
      (uint8_t *)&v11,
      0x16u);

  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CADEventPredicate;
  v4 = a3;
  -[EKPredicate encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[EKPredicate startDate](self, "startDate", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("startDate"));

  -[EKPredicate endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("endDate"));

  objc_msgSend(v4, "encodeObject:forKey:", self->super._uuid, CFSTR("UUID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->super._timeZone, CFSTR("timeZone"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CADEventPredicate propertyLoadMode](self, "propertyLoadMode"), CFSTR("propertyLoadMode"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldLoadProposedTimesInRange, CFSTR("shouldLoadProposedTimesInRange"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_excludeTimedEvents, CFSTR("excludeTimedEvents"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_excludeAllDayEvents, CFSTR("excludeAllDayEvents"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_excludeDeclined, CFSTR("excludeDeclined"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_excludeProposed, CFSTR("excludeProposed"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_excludeDeclinedUnlessProposed, CFSTR("excludeDeclinedUnlessProposed"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_excludeNoAttendeeEvents, CFSTR("excludeNoAttendeeEvents"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_excludeNoLocationEvents, CFSTR("excludeNoLocationEvents"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_filteredOutTitles, CFSTR("filteredOutTitles"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_randomize, CFSTR("randomize"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_limit, CFSTR("limit"));

}

- (id)defaultPropertiesToLoad
{
  unint64_t v2;
  id v3;

  v2 = -[CADEventPredicate propertyLoadMode](self, "propertyLoadMode");
  if (v2 == 2)
  {
    if (defaultPropertiesToLoad_onceToken != -1)
      dispatch_once(&defaultPropertiesToLoad_onceToken, &__block_literal_global);
    v3 = (id)defaultPropertiesToLoad_extendedPropertiesToLoad;
  }
  else if (v2 == 1)
  {
    CADEKPersistentEventDefaultPropertiesToLoad();
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (unint64_t)propertyLoadMode
{
  return self->_propertyLoadMode;
}

- (id)predicateFormat
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
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;

  if (predicateFormat_onceToken != -1)
    dispatch_once(&predicateFormat_onceToken, &__block_literal_global_46);
  v3 = (void *)objc_opt_new();
  if (-[CADEventPredicate excludeTimedEvents](self, "excludeTimedEvents"))
    objc_msgSend(v3, "addObject:", CFSTR("timed"));
  if (-[CADEventPredicate excludeAllDayEvents](self, "excludeAllDayEvents"))
    objc_msgSend(v3, "addObject:", CFSTR("allday"));
  if (-[CADEventPredicate excludeDeclined](self, "excludeDeclined"))
    objc_msgSend(v3, "addObject:", CFSTR("declined"));
  if (-[CADEventPredicate excludeProposed](self, "excludeProposed"))
    objc_msgSend(v3, "addObject:", CFSTR("proposed"));
  if (-[CADEventPredicate excludeDeclinedUnlessProposed](self, "excludeDeclinedUnlessProposed"))
    objc_msgSend(v3, "addObject:", CFSTR("declinedUnlessProposed"));
  if (-[CADEventPredicate excludeNoAttendeeEvents](self, "excludeNoAttendeeEvents"))
    objc_msgSend(v3, "addObject:", CFSTR("noAttendee"));
  if (-[CADEventPredicate excludeNoLocationEvents](self, "excludeNoLocationEvents"))
    objc_msgSend(v3, "addObject:", CFSTR("noLocation"));
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (void *)predicateFormat_formatter;
  -[EKPredicate startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)predicateFormat_formatter;
  -[EKPredicate endDate](self, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate calendars](self, "calendars");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CADPredicate conciseCalendarList:](CADPredicate, "conciseCalendarList:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (self->_randomize)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("CADEventPredicate start:%@; end:%@; cals:%@, exclusions:[%@], filterdOutTitles:[%@], limit:%ld, randomize:%@"),
    v7,
    v10,
    v12,
    v13,
    self->_filteredOutTitles,
    self->_limit,
    v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)excludeTimedEvents
{
  return self->_excludeTimedEvents;
}

- (BOOL)excludeProposed
{
  return self->_excludeProposed;
}

- (BOOL)excludeDeclined
{
  return self->_excludeDeclined;
}

- (BOOL)excludeDeclinedUnlessProposed
{
  return self->_excludeDeclinedUnlessProposed;
}

- (BOOL)excludeAllDayEvents
{
  return self->_excludeAllDayEvents;
}

- (BOOL)excludeNoLocationEvents
{
  return self->_excludeNoLocationEvents;
}

- (BOOL)excludeNoAttendeeEvents
{
  return self->_excludeNoAttendeeEvents;
}

- (CADEventPredicate)initWithCoder:(id)a3
{
  id v4;
  CADEventPredicate *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *uuid;
  uint64_t v10;
  NSTimeZone *timeZone;
  uint64_t v12;
  NSSet *filteredOutTitles;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CADEventPredicate;
  v5 = -[EKPredicate initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate setStartDate:](v5, "setStartDate:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate setEndDate:](v5, "setEndDate:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    uuid = v5->super._uuid;
    v5->super._uuid = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
    v10 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->super._timeZone;
    v5->super._timeZone = (NSTimeZone *)v10;

    v5->_propertyLoadMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("propertyLoadMode"));
    v5->_shouldLoadProposedTimesInRange = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldLoadProposedTimesInRange"));
    v5->_excludeTimedEvents = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("excludeTimedEvents"));
    v5->_excludeAllDayEvents = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("excludeAllDayEvents"));
    v5->_excludeDeclined = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("excludeDeclined"));
    v5->_excludeProposed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("excludeProposed"));
    v5->_excludeDeclinedUnlessProposed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("excludeDeclinedUnlessProposed"));
    v5->_excludeNoAttendeeEvents = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("excludeNoAttendeeEvents"));
    v5->_excludeNoLocationEvents = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("excludeNoLocationEvents"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filteredOutTitles"));
    v12 = objc_claimAutoreleasedReturnValue();
    filteredOutTitles = v5->_filteredOutTitles;
    v5->_filteredOutTitles = (NSSet *)v12;

    v5->_randomize = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("randomize"));
    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("limit"));
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredOutTitles, 0);
}

void __44__CADEventPredicate_defaultPropertiesToLoad__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  CADEKPersistentEventDefaultPropertiesToLoad();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultPropertiesToLoad_extendedPropertiesToLoad;
  defaultPropertiesToLoad_extendedPropertiesToLoad = v0;

  v2 = (void *)defaultPropertiesToLoad_extendedPropertiesToLoad;
  v3 = *MEMORY[0x1E0D0B328];
  v7[0] = *MEMORY[0x1E0D0B278];
  v7[1] = v3;
  v7[2] = *MEMORY[0x1E0D0B660];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)defaultPropertiesToLoad_extendedPropertiesToLoad;
  defaultPropertiesToLoad_extendedPropertiesToLoad = v5;

}

- (id)relatedObjectPropertiesToLoad
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  uint64_t v15;
  _QWORD v16[12];
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v17[0] = &unk_1E6A503A8;
  v2 = *MEMORY[0x1E0D0B850];
  v16[0] = *MEMORY[0x1E0D0B820];
  v16[1] = v2;
  v3 = *MEMORY[0x1E0D0B870];
  v16[2] = *MEMORY[0x1E0D0B248];
  v16[3] = v3;
  v4 = *MEMORY[0x1E0D0B868];
  v16[4] = *MEMORY[0x1E0D0B890];
  v16[5] = v4;
  v5 = *MEMORY[0x1E0D0B888];
  v16[6] = *MEMORY[0x1E0D0B878];
  v16[7] = v5;
  v6 = *MEMORY[0x1E0D0B238];
  v16[8] = *MEMORY[0x1E0D0B220];
  v16[9] = v6;
  v7 = *MEMORY[0x1E0D0B898];
  v16[10] = *MEMORY[0x1E0D0B230];
  v16[11] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v17[1] = &unk_1E6A503C0;
  v15 = *MEMORY[0x1E0D0B840];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  v17[2] = &unk_1E6A503D8;
  v10 = *MEMORY[0x1E0D0B748];
  v14[0] = *MEMORY[0x1E0D0B7A0];
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __36__CADEventPredicate_predicateFormat__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)predicateFormat_formatter;
  predicateFormat_formatter = (uint64_t)v0;

  objc_msgSend((id)predicateFormat_formatter, "setDateStyle:", 1);
  return objc_msgSend((id)predicateFormat_formatter, "setTimeStyle:", 1);
}

+ (id)predicateWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 calendars:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStartDate:endDate:timeZone:calendars:", v12, v11, v10, v9);

  return v13;
}

+ (id)predicateWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 eventUUID:(id)a6 calendars:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStartDate:endDate:timeZone:eventUUID:calendars:", v15, v14, v13, v12, v11);

  return v16;
}

- (NSString)eventUUID
{
  return self->super._uuid;
}

- (BOOL)isEqual:(id)a3
{
  CADEventPredicate *v4;
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
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v4 = (CADEventPredicate *)a3;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_42;
  }
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    -[EKPredicate startDate](v4, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate startDate](self, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqual:", v8))
    {
      v6 = 0;
LABEL_41:

      goto LABEL_42;
    }
    -[EKPredicate endDate](v4, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate endDate](self, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqual:", v10))
    {
      v6 = 0;
LABEL_40:

      goto LABEL_41;
    }
    -[CADEventPredicate timeZone](v4, "timeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADEventPredicate timeZone](self, "timeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEquivalentTo:", v12))
    {
      v6 = 0;
LABEL_39:

      goto LABEL_40;
    }
    -[CADEventPredicate eventUUID](v4, "eventUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADEventPredicate eventUUID](self, "eventUUID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 != v39)
    {
      -[CADEventPredicate eventUUID](v4, "eventUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADEventPredicate eventUUID](self, "eventUUID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v14;
      if (!objc_msgSend(v14, "isEqual:"))
      {
        v6 = 0;
        goto LABEL_37;
      }
    }
    -[EKPredicate calendars](v4, "calendars");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate calendars](self, "calendars");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v15;
    if (v15 == v37)
    {
      v33 = v13;
    }
    else
    {
      -[EKPredicate calendars](v4, "calendars");
      v16 = objc_claimAutoreleasedReturnValue();
      -[EKPredicate calendars](self, "calendars");
      v17 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v16;
      v18 = (void *)v16;
      v15 = (void *)v17;
      if (!objc_msgSend(v18, "isEqual:", v17))
      {
        v6 = 0;
        goto LABEL_34;
      }
      v33 = v13;
    }
    v19 = -[CADEventPredicate propertyLoadMode](v4, "propertyLoadMode");
    if (v19 != -[CADEventPredicate propertyLoadMode](self, "propertyLoadMode"))
      goto LABEL_31;
    v20 = -[CADEventPredicate excludeTimedEvents](v4, "excludeTimedEvents");
    if (v20 != -[CADEventPredicate excludeTimedEvents](self, "excludeTimedEvents"))
      goto LABEL_31;
    v21 = -[CADEventPredicate excludeAllDayEvents](v4, "excludeAllDayEvents");
    if (v21 != -[CADEventPredicate excludeAllDayEvents](self, "excludeAllDayEvents"))
      goto LABEL_31;
    v22 = -[CADEventPredicate excludeDeclined](v4, "excludeDeclined");
    if (v22 == -[CADEventPredicate excludeDeclined](self, "excludeDeclined")
      && (v23 = -[CADEventPredicate excludeProposed](v4, "excludeProposed"),
          v23 == -[CADEventPredicate excludeProposed](self, "excludeProposed"))
      && (v24 = -[CADEventPredicate excludeDeclinedUnlessProposed](v4, "excludeDeclinedUnlessProposed"),
          v24 == -[CADEventPredicate excludeDeclinedUnlessProposed](self, "excludeDeclinedUnlessProposed"))
      && (v25 = -[CADEventPredicate excludeNoAttendeeEvents](v4, "excludeNoAttendeeEvents"),
          v25 == -[CADEventPredicate excludeNoAttendeeEvents](self, "excludeNoAttendeeEvents"))
      && (v26 = -[CADEventPredicate excludeNoLocationEvents](v4, "excludeNoLocationEvents"),
          v26 == -[CADEventPredicate excludeNoLocationEvents](self, "excludeNoLocationEvents"))
      && (v27 = -[CADEventPredicate randomize](v4, "randomize"), v27 == -[CADEventPredicate randomize](self, "randomize"))&& (v28 = -[CADEventPredicate limit](v4, "limit"), v28 == -[CADEventPredicate limit](self, "limit")))
    {
      v34 = v12;
      -[CADEventPredicate filteredOutTitles](v4, "filteredOutTitles");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADEventPredicate filteredOutTitles](self, "filteredOutTitles");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v29, "isEqualToSet:", v30);

      if (v38 == v37)
      {

        v13 = v33;
        v12 = v34;
        if (v33 == v39)
          goto LABEL_38;
        goto LABEL_37;
      }
      v13 = v33;
      v12 = v34;
    }
    else
    {
LABEL_31:
      if (v38 == v37)
      {

        v6 = 0;
        v13 = v33;
LABEL_36:
        if (v13 == v39)
        {
LABEL_38:

          goto LABEL_39;
        }
LABEL_37:

        goto LABEL_38;
      }
      v6 = 0;
      v13 = v33;
    }
LABEL_34:

    goto LABEL_36;
  }
  v6 = 0;
LABEL_42:

  return v6;
}

- (void)setExcludeAllDayEvents:(BOOL)a3
{
  self->_excludeAllDayEvents = a3;
}

- (void)setExcludeTimedEvents:(BOOL)a3
{
  self->_excludeTimedEvents = a3;
}

- (void)setExcludeDeclined:(BOOL)a3
{
  self->_excludeDeclined = a3;
}

- (void)setExcludeProposed:(BOOL)a3
{
  self->_excludeProposed = a3;
}

- (void)setExcludeDeclinedUnlessProposed:(BOOL)a3
{
  self->_excludeDeclinedUnlessProposed = a3;
}

- (void)setExcludeNoAttendeeEvents:(BOOL)a3
{
  self->_excludeNoAttendeeEvents = a3;
}

- (void)setExcludeNoLocationEvents:(BOOL)a3
{
  self->_excludeNoLocationEvents = a3;
}

- (BOOL)excludeSkippedReminders
{
  return self->_excludeSkippedReminders;
}

- (void)setExcludeSkippedReminders:(BOOL)a3
{
  self->_excludeSkippedReminders = a3;
}

- (NSSet)filteredOutTitles
{
  return self->_filteredOutTitles;
}

- (void)setFilteredOutTitles:(id)a3
{
  objc_storeStrong((id *)&self->_filteredOutTitles, a3);
}

- (BOOL)randomize
{
  return self->_randomize;
}

- (void)setRandomize:(BOOL)a3
{
  self->_randomize = a3;
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

@end
