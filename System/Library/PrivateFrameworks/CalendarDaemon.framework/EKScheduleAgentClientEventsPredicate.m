@implementation EKScheduleAgentClientEventsPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)predicateWithCalendarIDs:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCalendars:", v4);

  return v5;
}

- (id)predicateFormat
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  uint64_t AuxilliaryDatabaseID;
  void *v5;
  void *v6;
  void *v7;
  const void *FilterFromRowIDs;
  const __CFArray *v9;
  const __CFArray *v10;
  CFIndex Count;
  void *v12;
  CFIndex i;
  uint64_t v14;
  const void *v15;

  AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
  -[EKPredicate calendarRowIDsForDatabaseID:](self, "calendarRowIDsForDatabaseID:", AuxilliaryDatabaseID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    -[EKPredicate restrictedCalendarRowIDsForDatabaseID:](self, "restrictedCalendarRowIDsForDatabaseID:", AuxilliaryDatabaseID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FilterFromRowIDs = (const void *)CreateFilterFromRowIDs(v6, v7);

  }
  else
  {
    FilterFromRowIDs = 0;
  }
  v9 = (const __CFArray *)CalDatabaseCopyOfAllEventsWithScheduleAgentClientAndCalendarUID();
  if (!v9)
  {
    v12 = 0;
    if (!FilterFromRowIDs)
      goto LABEL_13;
    goto LABEL_12;
  }
  v10 = v9;
  Count = CFArrayGetCount(v9);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      CFArrayGetValueAtIndex(v10, i);
      v14 = CalEventOccurrenceCreateForInitialOccurrence();
      if (v14)
      {
        v15 = (const void *)v14;
        objc_msgSend(v12, "addObject:", v14);
        CFRelease(v15);
      }
    }
  }
  CFRelease(v10);
  if (FilterFromRowIDs)
LABEL_12:
    CFRelease(FilterFromRowIDs);
LABEL_13:

  return v12;
}

@end
