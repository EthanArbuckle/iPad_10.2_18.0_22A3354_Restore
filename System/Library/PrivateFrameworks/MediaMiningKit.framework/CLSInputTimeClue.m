@implementation CLSInputTimeClue

- (id)universalDates
{
  -[CLSInputClue prepareIfNeeded](self, "prepareIfNeeded");
  return self->_universalDates;
}

- (id)universalStartDate
{
  -[CLSInputClue prepareIfNeeded](self, "prepareIfNeeded");
  return self->_universalStartDate;
}

- (id)universalEndDate
{
  -[CLSInputClue prepareIfNeeded](self, "prepareIfNeeded");
  return self->_universalEndDate;
}

- (id)localDates
{
  -[CLSInputClue prepareIfNeeded](self, "prepareIfNeeded");
  return self->_localDates;
}

- (id)localStartDate
{
  -[CLSInputClue prepareIfNeeded](self, "prepareIfNeeded");
  return self->_localStartDate;
}

- (id)localEndDate
{
  -[CLSInputClue prepareIfNeeded](self, "prepareIfNeeded");
  return self->_localEndDate;
}

- (double)timeInterval
{
  double result;

  -[CLSInputClue prepareIfNeeded](self, "prepareIfNeeded");
  -[NSDate timeIntervalSinceDate:](self->_localEndDate, "timeIntervalSinceDate:", self->_localStartDate);
  return result;
}

- (unint64_t)numberOfDays
{
  double v3;

  -[CLSInputClue prepareIfNeeded](self, "prepareIfNeeded");
  -[NSDate timeIntervalSinceDate:](self->_localEndDate, "timeIntervalSinceDate:", self->_localStartDate);
  return (unint64_t)(ceil(v3) / 86400.0);
}

- (NSArray)events
{
  -[CLSInputClue prepareIfNeeded](self, "prepareIfNeeded");
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (id)description
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
  objc_super v15;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v15.receiver = self;
  v15.super_class = (Class)CLSInputTimeClue;
  -[CLSClue description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLSInputTimeClue universalDates](self, "universalDates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "flattenWithSeparator:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tuniversalDates:[%@]"), v8);

  -[CLSInputTimeClue localDates](self, "localDates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "flattenWithSeparator:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tlocalDates:[%@]"), v11);

  if (-[NSArray count](self->_events, "count"))
  {
    -[NSArray valueForKeyPath:](self->_events, "valueForKeyPath:", CFSTR("title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "flattenWithSeparator:", CFSTR(", "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n\tevents:[%@]"), v13);

  }
  return v5;
}

- (void)_prepareWithProgressBlock:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *events;
  CLSServiceManager *serviceManager;
  NSDate *universalEndDate;
  uint64_t v28;
  NSArray *v29;
  id *location;
  CLSInputTimeClue *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[2];
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!self->_dateComponentsArray)
  {
    location = (id *)&self->_dateComponentsArray;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v31 = self;
    -[CLSClue value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v34;
      v9 = 0x1E0C99000uLL;
      v32 = v5;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v34 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v4, "addObject:", v11);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              +[CLSCalendar componentsFromDate:inTimeZone:](CLSCalendar, "componentsFromDate:inTimeZone:", v11, 0);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObject:", v12);

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v13 = v9;
                v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3560]), "initWithTypes:error:", 8, 0);
                objc_msgSend(v14, "matchesInString:options:range:", v11, 0, 0, objc_msgSend(v11, "length"));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "objectAtIndex:", 0);
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v16, "timeZone");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = v17;
                if (v17)
                {
                  v19 = v17;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
                  v19 = (id)objc_claimAutoreleasedReturnValue();
                }
                v22 = v19;

                objc_msgSend(v16, "date");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                +[CLSCalendar componentsFromDate:inTimeZone:](CLSCalendar, "componentsFromDate:inTimeZone:", v23, v22);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObject:", v24);

                v9 = v13;
                v5 = v32;
              }
              else
              {
                +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "loggingConnection");
                v21 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v39 = v11;
                  _os_log_error_impl(&dword_1CAB79000, v21, OS_LOG_TYPE_ERROR, "Failed to convert date \"%@\" when creating clue", buf, 0xCu);
                }

              }
            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      }
      while (v7);
    }

    objc_storeStrong(location, v4);
    if (!v31->_universalDates)
      -[CLSInputTimeClue _computeDateProperties](v31, "_computeDateProperties");
    if (!v31->_events)
    {
      if (CLSDeviceIs2GBOrLess_onceToken != -1)
        dispatch_once(&CLSDeviceIs2GBOrLess_onceToken, &__block_literal_global_263);
      if (CLSDeviceIs2GBOrLess_sDeviceIs2GBOrLess)
      {
        events = v31->_events;
        v31->_events = (NSArray *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        serviceManager = v31->_serviceManager;
        universalEndDate = v31->_universalEndDate;
        v37[0] = v31->_universalStartDate;
        v37[1] = universalEndDate;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
        events = (void *)objc_claimAutoreleasedReturnValue();
        -[CLSServiceManager eventsForDates:](serviceManager, "eventsForDates:", events);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v31->_events;
        v31->_events = (NSArray *)v28;

      }
    }

  }
}

- (void)_computeDateProperties
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSDate **p_universalStartDate;
  NSDate **p_localEndDate;
  NSSet *v14;
  NSSet *universalDates;
  NSSet *v16;
  NSSet *localDates;
  NSArray *obj;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_dateComponentsArray;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        +[CLSCalendar dateFromComponents:inTimeZone:](CLSCalendar, "dateFromComponents:inTimeZone:", v8, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);
        objc_msgSend(v8, "timeZone");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[CLSCalendar dateFromComponents:inTimeZone:](CLSCalendar, "dateFromComponents:inTimeZone:", v8, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "addObject:", v11);
        p_universalStartDate = &self->_universalStartDate;
        if (!self->_universalStartDate)
        {
          objc_storeStrong((id *)&self->_universalStartDate, v9);
          objc_storeStrong((id *)&self->_universalEndDate, v9);
          objc_storeStrong((id *)&self->_localStartDate, v11);
          p_localEndDate = &self->_localEndDate;
LABEL_14:
          objc_storeStrong((id *)p_localEndDate, v11);
          goto LABEL_15;
        }
        if (objc_msgSend(v9, "compare:") == -1
          || (p_universalStartDate = &self->_universalEndDate, objc_msgSend(v9, "compare:", self->_universalEndDate) == 1))
        {
          objc_storeStrong((id *)p_universalStartDate, v9);
        }
        p_localEndDate = &self->_localStartDate;
        if (objc_msgSend(v11, "compare:", self->_localStartDate) == -1)
          goto LABEL_14;
        p_localEndDate = &self->_localEndDate;
        if (objc_msgSend(v11, "compare:", self->_localEndDate) == 1)
          goto LABEL_14;
LABEL_15:

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v3);
  v14 = (NSSet *)objc_claimAutoreleasedReturnValue();
  universalDates = self->_universalDates;
  self->_universalDates = v14;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v19);
  v16 = (NSSet *)objc_claimAutoreleasedReturnValue();
  localDates = self->_localDates;
  self->_localDates = v16;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_universalEndDate, 0);
  objc_storeStrong((id *)&self->_universalStartDate, 0);
  objc_storeStrong((id *)&self->_universalDates, 0);
  objc_storeStrong((id *)&self->_localEndDate, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
  objc_storeStrong((id *)&self->_localDates, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_dateComponentsArray, 0);
}

+ (id)clueWithDates:(id)a3 serviceManager:(id)a4
{
  id v5;
  _QWORD *v6;
  void *v7;

  v5 = a4;
  +[CLSClue _clueWithValue:forKey:](CLSInputTimeClue, "_clueWithValue:forKey:", a3, CFSTR("Global Time"));
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6[21];
  v6[21] = v5;

  return v6;
}

@end
