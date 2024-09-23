@implementation CLSHolidayCalendarEventService

- (CLSHolidayCalendarEventService)initWithEventRules:(id)a3 locale:(id)a4
{
  id v7;
  id v8;
  CLSHolidayCalendarEventService *v9;
  CLSHolidayCalendarEventService *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CLSHolidayCalendarEventService;
  v9 = -[CLSHolidayCalendarEventService init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventRules, a3);
    objc_storeStrong((id *)&v10->_locale, a4);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v10->_eventRules;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15++), "setDateRuleDelegate:", v10, (_QWORD)v17);
        }
        while (v13 != v15);
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v13);
    }

  }
  return v10;
}

- (CLSHolidayCalendarEventService)initWithLocale:(id)a3 calendarSourcesURL:(id)a4
{
  id v6;
  void *v7;
  CLSHolidayCalendarEventService *v8;

  v6 = a3;
  if (a4)
    +[CLSHolidayCalendarEventRulesFactory eventRulesForSourcesURL:](CLSHolidayCalendarEventRulesFactory, "eventRulesForSourcesURL:", a4);
  else
    +[CLSHolidayCalendarEventRulesFactory eventRules](CLSHolidayCalendarEventRulesFactory, "eventRules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CLSHolidayCalendarEventService initWithEventRules:locale:](self, "initWithEventRules:locale:", v7, v6);

  return v8;
}

- (CLSHolidayCalendarEventService)initWithLocale:(id)a3
{
  return -[CLSHolidayCalendarEventService initWithLocale:calendarSourcesURL:](self, "initWithLocale:calendarSourcesURL:", a3, 0);
}

- (id)sceneNamesForHolidayName:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_eventRules;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = (void *)MEMORY[0x1E0C9AA60];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "name", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) != 0)
        {
          objc_msgSend(v11, "allSceneNames");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }
LABEL_12:

  return v9;
}

- (unint64_t)peopleTraitForHolidayName:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_eventRules;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = 127;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "name", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) != 0)
        {
          v9 = objc_msgSend(v11, "peopleTrait");
          goto LABEL_12;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v9 = 127;
  }
LABEL_12:

  return v9;
}

- (id)eventRulesForLocalDate:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSLocale *locale;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_eventRules;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        locale = self->_locale;
        if (locale)
        {
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
          -[NSLocale countryCode](locale, "countryCode", (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "_isMatchingOnlyLocalDate:countryCode:", v4, v13);

          if (v14)
            objc_msgSend(v5, "addObject:", v12);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)eventRuleForHolidayName:(id)a3 localDate:(id)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_eventRules;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        if (self->_locale)
        {
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v12, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "isEqualToString:", v6) & 1) != 0)
          {
            -[NSLocale countryCode](self->_locale, "countryCode");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v12, "_isMatchingOnlyLocalDate:countryCode:", v18, v14);

            if ((v15 & 1) != 0)
            {
              v16 = v12;
              goto LABEL_14;
            }
          }
          else
          {

          }
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  v16 = 0;
LABEL_14:

  return v16;
}

- (void)_enumerateEventRulesWithNames:(id)a3 betweenLocalDate:(id)a4 andLocalDate:(id)a5 supportedCountryCode:(id)a6 usingBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  int64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  int v47;
  void *v48;
  id v49;
  uint64_t v50;
  id v51;
  id v52;
  int64_t v53;
  uint64_t v54;
  void (**v55)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSArray *obj;
  void *v57;
  uint64_t v58;
  int64_t v59;
  void *v60;
  void *context;
  id v62;
  id v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  unsigned __int8 v73;
  _BYTE v74[128];
  id v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v14;
  v17 = v15;
  v18 = a7;
  v19 = v13;
  v55 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v18;
  if (!v16 || !v13 || !v18 || objc_msgSend(v13, "compare:", v16) == 1)
    goto LABEL_41;
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v13, v16);
  v49 = v13;
  v20 = +[CLSCalendar yearFromDate:](CLSCalendar, "yearFromDate:", v13);
  v48 = v16;
  v59 = +[CLSCalendar yearFromDate:](CLSCalendar, "yearFromDate:", v16);
  v21 = v59 - 100;
  if (v20 > v59 - 100)
    v21 = v20;
  v53 = v21;
  v73 = 0;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = self->_eventRules;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
  if (!v22)
    goto LABEL_40;
  v23 = v22;
  v24 = *(_QWORD *)v70;
  v51 = v17;
  v52 = v12;
  v50 = *(_QWORD *)v70;
  while (2)
  {
    v25 = 0;
    v54 = v23;
    do
    {
      if (*(_QWORD *)v70 != v24)
        objc_enumerationMutation(obj);
      v26 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v25);
      v27 = (void *)MEMORY[0x1D1796094]();
      if (!v12
        || (objc_msgSend(v26, "name"),
            v28 = (void *)objc_claimAutoreleasedReturnValue(),
            v29 = objc_msgSend(v12, "containsObject:", v28),
            v28,
            v29))
      {
        objc_msgSend(v26, "explicitlySupportedCountryCodes");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(v26, "explicitlySupportedCountryCodes");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "containsObject:", v17);

          if (!v31)
          {
LABEL_35:

            goto LABEL_36;
          }
          v57 = v27;
          v58 = v25;
          v75 = v17;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
          v32 = objc_claimAutoreleasedReturnValue();

          v60 = (void *)v32;
        }
        else
        {
          v57 = v27;
          v58 = v25;
        }
        v62 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v33 = v53;
        if (v53 <= v59)
        {
          do
          {
            context = (void *)MEMORY[0x1D1796094]();
            v65 = 0u;
            v66 = 0u;
            v67 = 0u;
            v68 = 0u;
            v63 = v60;
            v34 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
            if (v34)
            {
              v35 = v34;
              v36 = *(_QWORD *)v66;
              do
              {
                for (i = 0; i != v35; ++i)
                {
                  if (*(_QWORD *)v66 != v36)
                    objc_enumerationMutation(v63);
                  v38 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
                  v39 = (void *)MEMORY[0x1D1796094]();
                  objc_msgSend(v26, "localDateByEvaluatingRuleForYear:countryCode:", v33, v38);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v40)
                  {
                    v41 = objc_alloc(MEMORY[0x1E0CB3588]);
                    +[CLSCalendar startOfDayForDate:](CLSCalendar, "startOfDayForDate:", v40);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    +[CLSCalendar endOfDayForDate:](CLSCalendar, "endOfDayForDate:", v40);
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    v44 = (void *)objc_msgSend(v41, "initWithStartDate:endDate:", v42, v43);

                    if (objc_msgSend(v64, "intersectsDateInterval:", v44))
                      objc_msgSend(v62, "addObject:", v40);

                  }
                  objc_autoreleasePoolPop(v39);
                }
                v35 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
              }
              while (v35);
            }

            objc_autoreleasePoolPop(context);
          }
          while (v33++ != v59);
        }
        if (objc_msgSend(v62, "count"))
        {
          objc_msgSend(v62, "allObjects");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *, unsigned __int8 *))v55)[2](v55, v26, v46, &v73);

        }
        v47 = v73;

        v17 = v51;
        v12 = v52;
        v24 = v50;
        v23 = v54;
        v27 = v57;
        v25 = v58;
        if (v47)
        {

          objc_autoreleasePoolPop(v57);
          goto LABEL_40;
        }
        goto LABEL_35;
      }
LABEL_36:
      objc_autoreleasePoolPop(v27);
      ++v25;
    }
    while (v25 != v23);
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
    if (v23)
      continue;
    break;
  }
LABEL_40:

  v16 = v48;
  v19 = v49;
LABEL_41:

}

- (void)enumerateEventRulesForAllCountriesBetweenLocalDate:(id)a3 andLocalDate:(id)a4 usingBlock:(id)a5
{
  -[CLSHolidayCalendarEventService _enumerateEventRulesWithNames:betweenLocalDate:andLocalDate:supportedCountryCode:usingBlock:](self, "_enumerateEventRulesWithNames:betweenLocalDate:andLocalDate:supportedCountryCode:usingBlock:", 0, a3, a4, 0, a5);
}

- (void)enumerateEventRulesForAllCountriesWithNames:(id)a3 betweenLocalDate:(id)a4 andLocalDate:(id)a5 usingBlock:(id)a6
{
  -[CLSHolidayCalendarEventService _enumerateEventRulesWithNames:betweenLocalDate:andLocalDate:supportedCountryCode:usingBlock:](self, "_enumerateEventRulesWithNames:betweenLocalDate:andLocalDate:supportedCountryCode:usingBlock:", a3, a4, a5, 0, a6);
}

- (void)enumerateEventRulesWithNames:(id)a3 betweenLocalDate:(id)a4 andLocalDate:(id)a5 usingBlock:(id)a6
{
  -[CLSHolidayCalendarEventService _enumerateEventRulesWithNames:betweenLocalDate:andLocalDate:supportedCountryCode:usingBlock:](self, "_enumerateEventRulesWithNames:betweenLocalDate:andLocalDate:supportedCountryCode:usingBlock:", a3, a4, a5, 0, a6);
}

- (void)enumerateEventRulesBetweenLocalDate:(id)a3 andLocalDate:(id)a4 supportedCountryCode:(id)a5 usingBlock:(id)a6
{
  -[CLSHolidayCalendarEventService _enumerateEventRulesWithNames:betweenLocalDate:andLocalDate:supportedCountryCode:usingBlock:](self, "_enumerateEventRulesWithNames:betweenLocalDate:andLocalDate:supportedCountryCode:usingBlock:", 0, a3, a4, a5, a6);
}

- (id)triggerHolidaysForCountryCode:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_eventRules;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "triggerMemoryForCountryCode:", v4, (_QWORD)v13))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)eventRuleForHolidayName:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_eventRules;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "name", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if (v13)
        {
          v14 = v11;

          v8 = v14;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)supportedLanguageCodes
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_eventRules;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "commonCelebratedLanguages", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "allKeys");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v11);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)dateForRuleWithUUID:(id)a3 byEvaluatingForYear:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;

  v11 = 0;
  -[CLSHolidayCalendarEventService _ruleWithUUID:countryCode:](self, "_ruleWithUUID:countryCode:", a3, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  objc_msgSend(v5, "_dateRuleForYear:countryCode:", a4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "localDateByEvaluatingRuleForYear:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_ruleWithUUID:(id)a3 countryCode:(id *)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  char v19;
  id v20;
  uint64_t v22;
  id *v23;
  uint64_t v24;
  NSArray *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = self->_eventRules;
  v24 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v24)
  {
    v8 = *(_QWORD *)v31;
    v25 = v7;
    v22 = *(_QWORD *)v31;
    v23 = a4;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v7);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v10, "commonCelebratedCountryCodes", v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allValues");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v27;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v27 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
              objc_msgSend(v17, "uuid");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "isEqualToString:", v6);

              if ((v19 & 1) != 0)
              {
                objc_msgSend(v17, "countryCode");
                *v23 = (id)objc_claimAutoreleasedReturnValue();
                v20 = v10;

                v7 = v25;
                goto LABEL_19;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v14)
              continue;
            break;
          }
        }

        v7 = v25;
        v8 = v22;
      }
      v20 = 0;
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v24);
  }
  else
  {
    v20 = 0;
  }
LABEL_19:

  return v20;
}

- (NSArray)eventRules
{
  return self->_eventRules;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_eventRules, 0);
}

@end
