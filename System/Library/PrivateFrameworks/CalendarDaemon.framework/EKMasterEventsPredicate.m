@implementation EKMasterEventsPredicate

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
  const void *FilterFromRowIDs;
  const __CFArray *v8;
  const __CFArray *v9;
  CFIndex Count;
  void *v11;
  CFIndex i;
  uint64_t v13;
  const void *v14;

  AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
  -[EKPredicate calendarRowIDsForDatabaseID:](self, "calendarRowIDsForDatabaseID:", AuxilliaryDatabaseID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate restrictedCalendarRowIDsForDatabaseID:](self, "restrictedCalendarRowIDsForDatabaseID:", AuxilliaryDatabaseID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") || objc_msgSend(v6, "count"))
    FilterFromRowIDs = (const void *)CreateFilterFromRowIDs(v5, v6);
  else
    FilterFromRowIDs = 0;
  v8 = (const __CFArray *)CalDatabaseCopyCalendarItemsWithCalendarFilter();
  if (!v8)
  {
    v11 = 0;
    if (!FilterFromRowIDs)
      goto LABEL_12;
    goto LABEL_11;
  }
  v9 = v8;
  Count = CFArrayGetCount(v8);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      CFArrayGetValueAtIndex(v9, i);
      v13 = CalEventOccurrenceCreateForInitialOccurrence();
      if (v13)
      {
        v14 = (const void *)v13;
        objc_msgSend(v11, "addObject:", v13);
        CFRelease(v14);
      }
    }
  }
  CFRelease(v9);
  if (FilterFromRowIDs)
LABEL_11:
    CFRelease(FilterFromRowIDs);
LABEL_12:

  return v11;
}

@end
