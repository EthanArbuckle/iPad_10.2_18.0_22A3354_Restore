@implementation CADEventsForAssistantSearchPredicate

- (CADEventsForAssistantSearchPredicate)initWithTimeZone:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 location:(id)a7 notes:(id)a8 participants:(id)a9 limit:(int64_t)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  CADEventsForAssistantSearchPredicate *v24;
  CADEventsForAssistantSearchPredicate *v25;
  objc_super v27;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v27.receiver = self;
  v27.super_class = (Class)CADEventsForAssistantSearchPredicate;
  v24 = -[EKPredicate initWithCalendars:](&v27, sel_initWithCalendars_, 0);
  v25 = v24;
  if (v24)
  {
    -[EKPredicate setStartDate:](v24, "setStartDate:", v18);
    -[EKPredicate setEndDate:](v25, "setEndDate:", v19);
    objc_storeStrong((id *)&v25->super._timeZone, a3);
    -[EKPredicate setTitle:](v25, "setTitle:", v20);
    -[CADEventsForAssistantSearchPredicate setLocation:](v25, "setLocation:", v21);
    -[CADEventsForAssistantSearchPredicate setNotes:](v25, "setNotes:", v22);
    -[CADEventsForAssistantSearchPredicate setParticipants:](v25, "setParticipants:", v23);
    -[CADEventsForAssistantSearchPredicate setLimit:](v25, "setLimit:", a10);
  }

  return v25;
}

- (id)description
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
  objc_super v14;

  v3 = objc_alloc(MEMORY[0x1E0D0C2D0]);
  v14.receiver = self;
  v14.super_class = (Class)CADEventsForAssistantSearchPredicate;
  -[CADEventsForAssistantSearchPredicate description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSuperclassDescription:", v4);

  objc_msgSend(v5, "setKey:withObject:", CFSTR("timeZone"), self->super._timeZone);
  -[EKPredicate startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withDate:", CFSTR("startDate"), v6);

  -[EKPredicate endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withDate:", CFSTR("endDate"), v7);

  -[EKPredicate title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withString:", CFSTR("title"), v8);

  -[CADEventsForAssistantSearchPredicate location](self, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withString:", CFSTR("location"), v9);

  -[CADEventsForAssistantSearchPredicate notes](self, "notes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withString:", CFSTR("notes"), v10);

  -[CADEventsForAssistantSearchPredicate participants](self, "participants");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withArray:", CFSTR("participants"), v11);

  objc_msgSend(v5, "setKey:withInteger:", CFSTR("limit"), -[CADEventsForAssistantSearchPredicate limit](self, "limit"));
  objc_msgSend(v5, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADEventsForAssistantSearchPredicate)initWithCoder:(id)a3
{
  id v4;
  CADEventsForAssistantSearchPredicate *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSTimeZone *timeZone;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CADEventsForAssistantSearchPredicate;
  v5 = -[EKPredicate initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate setStartDate:](v5, "setStartDate:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate setEndDate:](v5, "setEndDate:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
    v8 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->super._timeZone;
    v5->super._timeZone = (NSTimeZone *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate setTitle:](v5, "setTitle:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADEventsForAssistantSearchPredicate setLocation:](v5, "setLocation:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADEventsForAssistantSearchPredicate setNotes:](v5, "setNotes:", v12);

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("participants"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADEventsForAssistantSearchPredicate setParticipants:](v5, "setParticipants:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("limit"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADEventsForAssistantSearchPredicate setLimit:](v5, "setLimit:", objc_msgSend(v17, "integerValue"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CADEventsForAssistantSearchPredicate;
  v4 = a3;
  -[EKPredicate encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  -[EKPredicate startDate](self, "startDate", v12.receiver, v12.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("startDate"));

  -[EKPredicate endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("endDate"));

  objc_msgSend(v4, "encodeObject:forKey:", self->super._timeZone, CFSTR("timeZone"));
  -[EKPredicate title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("title"));

  -[CADEventsForAssistantSearchPredicate location](self, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("location"));

  -[CADEventsForAssistantSearchPredicate notes](self, "notes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("notes"));

  -[CADEventsForAssistantSearchPredicate participants](self, "participants");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("participants"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CADEventsForAssistantSearchPredicate limit](self, "limit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("limit"));

}

- (id)predicateFormat
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%p>"), objc_opt_class(), self);
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t AuxilliaryDatabaseID;
  void *v11;
  void *v12;
  const void *FilterFromRowIDs;
  uint64_t v14;
  const void *v15;
  const void *v16;
  void *v17;
  NSTimeZone *timeZone;
  const void *v19;
  uint64_t v20;
  const void *v21;
  int64_t v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  CADEventsForAssistantSearchPredicate *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v33 = self;
    _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_DEBUG, "Preparing to fetch matching events for predicate: [%@]", buf, 0xCu);
  }
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EKPredicate startDate](self, "startDate");
  v6 = objc_claimAutoreleasedReturnValue();
  -[EKPredicate endDate](self, "endDate");
  v7 = objc_claimAutoreleasedReturnValue();
  -[EKPredicate title](self, "title");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADEventsForAssistantSearchPredicate location](self, "location");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADEventsForAssistantSearchPredicate notes](self, "notes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADEventsForAssistantSearchPredicate participants](self, "participants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[CADEventsForAssistantSearchPredicate limit](self, "limit");
  AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
  -[EKPredicate calendarRowIDsForDatabaseID:](self, "calendarRowIDsForDatabaseID:", AuxilliaryDatabaseID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate restrictedCalendarRowIDsForDatabaseID:](self, "restrictedCalendarRowIDsForDatabaseID:", AuxilliaryDatabaseID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  FilterFromRowIDs = (const void *)CreateFilterFromRowIDs(v11, v12);
  if (v6 | v7)
  {
    if (v6 && v7)
    {
      objc_msgSend((id)v7, "dateByAddingTimeInterval:", -1.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      timeZone = self->super._timeZone;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __70__CADEventsForAssistantSearchPredicate_copyMatchingItemsWithDatabase___block_invoke;
      v27[3] = &unk_1E6A37C80;
      v28 = v26;
      v29 = v25;
      v30 = v8;
      v31 = v9;
      v19 = (const void *)MEMORY[0x1BCC9BED8](a3, FilterFromRowIDs, v6, v17, timeZone, v23, v27);

      if (v19)
      {
        objc_msgSend(v24, "addObjectsFromArray:", v19);
        CFRelease(v19);
      }

    }
  }
  else
  {
    v14 = CalDatabaseCopyEventOccurrenceCache();
    if (v14)
    {
      v15 = (const void *)v14;
      if (v26 || v25 || v8 || v9)
      {
        if (v9)
          objc_msgSend(v9, "objectAtIndex:", 0);
        v20 = CalDatabaseCopyEventIDsOfEventsMatching();
        if (!v20)
          goto LABEL_21;
        v21 = (const void *)v20;
        CFAbsoluteTimeGetCurrent();
        v16 = (const void *)CalEventOccurrenceCacheCopyEventOccurrencesWithIDsAfterDate();
        CFRelease(v21);
        if (!v16)
          goto LABEL_21;
      }
      else
      {
        CFAbsoluteTimeGetCurrent();
        v16 = (const void *)CalEventOccurrenceCacheCopyEventOccurrencesAfterDate();
        if (!v16)
          goto LABEL_21;
      }
      objc_msgSend(v24, "addObjectsFromArray:", v16, v23);
      CFRelease(v16);
LABEL_21:
      CFRelease(v15);
    }
  }
  CFRelease(FilterFromRowIDs);

  return v24;
}

uint64_t __70__CADEventsForAssistantSearchPredicate_copyMatchingItemsWithDatabase___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  CFIndex v6;
  const __CFString *v7;
  const __CFString *v8;
  CFIndex v9;
  const __CFArray *v10;
  const __CFArray *v11;
  CFIndex Count;
  void *v13;
  CFIndex i;
  const void *ValueAtIndex;
  uint64_t v16;
  const void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __CFString *v24;
  uint64_t v25;
  __CFString *v26;
  CFIndex location;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  uint64_t v34;
  const __CFArray *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_5;
  v2 = (const __CFString *)CalCalendarItemCopySummary();
  if (!v2)
    return 0;
  v3 = (__CFString *)v2;
  if (CFStringFind(v2, (CFStringRef)*(_QWORD *)(a1 + 32), 0x81uLL).location != -1)
  {
    CFRelease(v3);
    goto LABEL_5;
  }
  v24 = v3;
  -[__CFString rangeOfString:](v24, "rangeOfString:", CFSTR("’"));
  if (!v25)
  {

    CFRelease(v24);
    return 0;
  }
  -[__CFString stringByReplacingOccurrencesOfString:withString:](v24, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

  location = CFStringFind(v26, (CFStringRef)*(_QWORD *)(a1 + 32), 0x81uLL).location;
  CFRelease(v24);
  if (location == -1)
    return 0;
LABEL_5:
  if (*(_QWORD *)(a1 + 40))
  {
    v4 = (const __CFString *)CalEventCopyLocation_Deprecated();
    if (!v4)
      return 0;
    v5 = v4;
    v6 = CFStringFind(v4, (CFStringRef)*(_QWORD *)(a1 + 40), 0x81uLL).location;
    CFRelease(v5);
    if (v6 == -1)
      return 0;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    v7 = (const __CFString *)CalCalendarItemCopyDescription();
    if (!v7)
      return 0;
    v8 = v7;
    v9 = CFStringFind(v7, (CFStringRef)*(_QWORD *)(a1 + 48), 0x81uLL).location;
    CFRelease(v8);
    if (v9 == -1)
      return 0;
  }
  if (!objc_msgSend(*(id *)(a1 + 56), "count"))
    return 1;
  v10 = (const __CFArray *)CalCalendarItemCopyAttendees();
  v11 = v10;
  if (v10 && CFArrayGetCount(v10) >= 1)
  {
    Count = CFArrayGetCount(v11);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v11, i);
        v16 = MEMORY[0x1BCC9B878](ValueAtIndex);
        if (v16)
        {
          v17 = (const void *)v16;
          if (objc_msgSend(v13, "length"))
            objc_msgSend(v13, "appendFormat:", CFSTR(" %@"), v17);
          else
            objc_msgSend(v13, "appendString:", v17);
          CFRelease(v17);
        }
      }
    }
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v18 = *(id *)(a1 + 56);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v42;
LABEL_24:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v42 != v21)
          objc_enumerationMutation(v18);
        v23 = 1;
        if (objc_msgSend(v13, "rangeOfString:options:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v22), 1) != 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_47;
        if (v20 == ++v22)
        {
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
          if (v20)
            goto LABEL_24;
          break;
        }
      }
    }
  }
  else
  {
    v13 = (void *)CalCalendarItemCopySummary();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v18 = *(id *)(a1 + 56);
    v28 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v28)
    {
      v29 = v28;
      v36 = v11;
      v30 = *(_QWORD *)v38;
      while (2)
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v38 != v30)
            objc_enumerationMutation(v18);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\\b%@\\b"), *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v32, 0, 0);
          v34 = objc_msgSend(v33, "numberOfMatchesInString:options:range:", v13, 8, 0, objc_msgSend(v13, "length"));

          if (v34)
          {
            v23 = 1;
            goto LABEL_46;
          }
        }
        v29 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v29)
          continue;
        break;
      }
      v23 = 0;
LABEL_46:
      v11 = v36;
      goto LABEL_47;
    }
  }
  v23 = 0;
LABEL_47:

  if (v11)
    CFRelease(v11);
  return v23;
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
