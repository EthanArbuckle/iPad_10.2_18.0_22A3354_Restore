@implementation EKREMReminderPredicate

- (EKREMReminderPredicate)initWithCalendars:(id)a3
{
  id v4;
  EKREMReminderPredicate *v5;
  uint64_t v6;
  NSArray *calendars;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKREMReminderPredicate;
  v5 = -[EKREMReminderPredicate init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    calendars = v5->_calendars;
    v5->_calendars = (NSArray *)v6;

    v5->noCalendarNoResult = 0;
  }

  return v5;
}

- (id)initForCalendarStoreWithCalendars:(id)a3
{
  id v4;
  EKREMReminderPredicate *v5;
  uint64_t v6;
  NSArray *calendars;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKREMReminderPredicate;
  v5 = -[EKREMReminderPredicate init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    calendars = v5->_calendars;
    v5->_calendars = (NSArray *)v6;

    v5->noCalendarNoResult = 1;
  }

  return v5;
}

- (id)remListIDsWithAllLists:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSArray count](self->_calendars, "count") || self->noCalendarNoResult)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_calendars, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_calendars;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "frozenObject", (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v11, "frozenObject");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "remObjectID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v15);

          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    v16 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("objectID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)fetchMatchingRemindersInStore:(id)a3 allLists:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[EKREMReminderPredicate remListIDsWithAllLists:](self, "remListIDsWithAllLists:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRemindersForEventKitBridgingWithListIDs:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)evaluateWithObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *calendarIdentifierSet;
  NSSet *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[NSArray count](self->_calendars, "count"))
    {
      if (!self->_calendarIdentifierSet)
      {
        v5 = (void *)MEMORY[0x1E0C99E60];
        -[NSArray valueForKey:](self->_calendars, "valueForKey:", CFSTR("calendarIdentifier"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setWithArray:", v6);
        v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
        calendarIdentifierSet = self->_calendarIdentifierSet;
        self->_calendarIdentifierSet = v7;

      }
      v9 = self->_calendarIdentifierSet;
      objc_msgSend(v4, "calendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "calendarIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[NSSet containsObject:](v9, "containsObject:", v11);

    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)predicateFormat
{
  return CFSTR("ReminderPredicate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarIdentifierSet, 0);
  objc_storeStrong((id *)&self->_calendars, 0);
}

@end
