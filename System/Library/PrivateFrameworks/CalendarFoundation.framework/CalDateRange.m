@implementation CalDateRange

+ (id)rangeWithStartDate:(id)a3 duration:(double)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStartDate:duration:", v5, a4);

  return v6;
}

- (CalDateRange)initWithStartDate:(id)a3 duration:(double)a4
{
  id v6;
  void *v7;
  CalDateRange *v8;

  v6 = a3;
  objc_msgSend(v6, "dateByAddingTimeInterval:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CalDateRange initWithStartDate:endDate:](self, "initWithStartDate:endDate:", v6, v7);

  return v8;
}

- (CalDateRange)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  CalDateRange *v8;
  CalDateRange *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[CalDateRange init](self, "init");
  v9 = v8;
  if (v8)
    -[CalDateRange setStartDate:endDate:](v8, "setStartDate:endDate:", v6, v7);

  return v9;
}

- (void)setStartDate:(id)a3 endDate:(id)a4
{
  id v6;

  v6 = a4;
  -[CalDateRange setStartDate:](self, "setStartDate:", a3);
  -[CalDateRange setEndDate:](self, "setEndDate:", v6);

}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (id)midnightsForRangeInTimeZoneString:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t (**v22)(_QWORD, _QWORD);
  void *v23;
  int v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  unint64_t v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;

  v4 = a3;
  if (midnightsForRangeInTimeZoneString__onceToken != -1)
    dispatch_once(&midnightsForRangeInTimeZoneString__onceToken, &__block_literal_global_21);
  v5 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __50__CalDateRange_midnightsForRangeInTimeZoneString___block_invoke_2;
  v48[3] = &unk_1E2A85AD8;
  v6 = v4;
  v49 = v6;
  v7 = (void *)MEMORY[0x19400A168](v48);
  v8 = (id)midnightsForRangeInTimeZoneString___rangeToCache;
  objc_sync_enter(v8);
  if ((objc_msgSend((id)midnightsForRangeInTimeZoneString___rangeToCache, "containsRange:", self) & 1) == 0)
  {
    if (-[CalDateRange containsRange:](self, "containsRange:", midnightsForRangeInTimeZoneString___rangeToCache))
    {
      +[CalDateRange rangeWithRange:](CalDateRange, "rangeWithRange:", self);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)midnightsForRangeInTimeZoneString___rangeToCache;
      midnightsForRangeInTimeZoneString___rangeToCache = v9;
    }
    else
    {
      -[CalDateRange endDate](self, "endDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)midnightsForRangeInTimeZoneString___rangeToCache, "endDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "CalIsAfterDate:", v12);

      -[CalDateRange duration](self, "duration");
      +[CalDateRange rangeByExpandingRange:direction:duration:](CalDateRange, "rangeByExpandingRange:direction:duration:", self, v13 ^ 1u, fmax(v14, 126144000.0));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)midnightsForRangeInTimeZoneString___rangeToCache, "unionRange:", v10);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)midnightsForRangeInTimeZoneString___rangeToCache;
      midnightsForRangeInTimeZoneString___rangeToCache = v15;

    }
  }
  objc_sync_exit(v8);

  v17 = (id)midnightsForRangeInTimeZoneString___rangeToCache;
  v18 = (void *)midnightsForRangeInTimeZoneString__midnightsForTimeZoneStrings;
  v45[0] = v5;
  v45[1] = 3221225472;
  v45[2] = __50__CalDateRange_midnightsForRangeInTimeZoneString___block_invoke_3;
  v45[3] = &unk_1E2A85B00;
  v19 = v7;
  v47 = v19;
  v20 = v17;
  v46 = v20;
  objc_msgSend(v18, "CALsafeObjectForKey:calculatedWithBlock:", v6, v45);
  v43[0] = v5;
  v43[1] = 3221225472;
  v43[2] = __50__CalDateRange_midnightsForRangeInTimeZoneString___block_invoke_4;
  v43[3] = &unk_1E2A85B68;
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v44 = v21;
  v22 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x19400A168](v43);
  -[CalDateRange startDate](self, "startDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v21, "containsObject:", v23);

  if (v24)
  {
    -[CalDateRange startDate](self, "startDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v21, "indexOfObject:", v25);

    goto LABEL_14;
  }
  -[CalDateRange startDate](self, "startDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = ((uint64_t (**)(_QWORD, void *))v22)[2](v22, v27);

  if (v26 >= objc_msgSend(v21, "count"))
    goto LABEL_18;
  -[CalDateRange startDate](self, "startDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndex:", v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v28, "isBeforeDate:", v29);

  if (!v30)
    goto LABEL_14;
  if (!v26)
  {
LABEL_18:
    (*((void (**)(id, CalDateRange *))v19 + 2))(v19, self);
    v39 = objc_claimAutoreleasedReturnValue();
LABEL_25:
    v41 = (void *)v39;
    goto LABEL_26;
  }
  --v26;
LABEL_14:
  -[CalDateRange startDate](self, "startDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDateRange endDate](self, "endDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v31, "isEqualToDate:", v32);

  if (v33)
  {
    v34 = v26 + 1;
  }
  else
  {
    -[CalDateRange endDate](self, "endDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v21, "containsObject:", v35);

    -[CalDateRange endDate](self, "endDate");
    if (v36)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v21, "indexOfObject:", v37);
    }
    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = ((uint64_t (**)(_QWORD, void *))v22)[2](v22, v37);
    }
    v34 = v38;

  }
  if (v34 >= v26 && v34 <= objc_msgSend(v21, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithOrderedSet:range:copyItems:", v21, v26, v34 - v26, 0);
    v39 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  -[CalDateRange briefDescription](self, "briefDescription");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Got a bad range to find midnights for in timeZone: %@, %@"), v6, v40);

  v41 = 0;
LABEL_26:

  return v41;
}

void __50__CalDateRange_midnightsForRangeInTimeZoneString___block_invoke()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  CalDateRange *v6;
  void *v7;
  id v8;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)midnightsForRangeInTimeZoneString__midnightsForTimeZoneStrings;
  midnightsForRangeInTimeZoneString__midnightsForTimeZoneStrings = (uint64_t)v0;

  v2 = objc_alloc(MEMORY[0x1E0C99D48]);
  v3 = objc_msgSend(v2, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v4 = (void *)midnightsForRangeInTimeZoneString___calendar;
  midnightsForRangeInTimeZoneString___calendar = v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -63072000.0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[CalDateRange initWithStartDate:duration:]([CalDateRange alloc], "initWithStartDate:duration:", v8, 126144000.0);
  v7 = (void *)midnightsForRangeInTimeZoneString___rangeToCache;
  midnightsForRangeInTimeZoneString___rangeToCache = (uint64_t)v6;

}

- (BOOL)containsRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (v4)
  {
    -[CalDateRange startDate](self, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "CalIsBeforeOrSameAsDate:", v6))
    {
      -[CalDateRange endDate](self, "endDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "CalIsAfterOrSameAsDate:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

id __50__CalDateRange_midnightsForRangeInTimeZoneString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = (id)midnightsForRangeInTimeZoneString___calendar;
  objc_sync_enter(v4);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend((id)midnightsForRangeInTimeZoneString___calendar, "setTimeZone:", v5);
  objc_msgSend(v3, "_calculateMidnightsInCalendar:", midnightsForRangeInTimeZoneString___calendar);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  return v6;
}

- (id)_calculateMidnightsInCalendar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;

  v4 = a3;
  -[CalDateRange startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startOfDayForDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CalDateRange endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startOfDayForDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CalDateRange endDate](self, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v8, "isEqualToDate:", v9);

  if ((_DWORD)v7)
  {
    objc_msgSend(v8, "dateByAddingDays:inCalendar:", -1, v4);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v6);
  objc_msgSend(MEMORY[0x1E0C99D78], "CalComponentForDays:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "compare:", v8);

  if (v14 == -1)
  {
    v15 = 1;
    do
    {
      objc_msgSend(v12, "setDay:", v15);
      objc_msgSend(v4, "dateByAddingComponents:toDate:options:", v12, v6, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startOfDayForDate:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToDate:", v17);

      if ((v18 & 1) == 0)
      {
        objc_msgSend(v16, "dateByAddingTimeInterval:", 21600.0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "startOfDayForDate:", v19);
        v20 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v20;
      }
      objc_msgSend(v11, "addObject:", v16);

      objc_msgSend(v11, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "compare:", v8);

      ++v15;
    }
    while (v22 == -1);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

+ (id)rangeWithStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStartDate:endDate:", v6, v5);

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CalDateRange startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptionWithLocale:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDateRange endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionWithLocale:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (double)duration
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[CalDateRange endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDateRange startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

+ (id)rangeWithRange:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rangeWithStartDate:endDate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)containsDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4)
  {
    -[CalDateRange startDate](self, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "CalIsAfterOrSameAsDate:", v5))
    {
      -[CalDateRange endDate](self, "endDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "CalIsBeforeDate:", v6);

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

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CalDateRange startDate](self, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[CalDateRange endDate](self, "endDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)intersectsRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  -[CalDateRange startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDateRange endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = +[CalDateRange rangesIntersectWithStartDate1:endDate1:startDate2:endDate2:](CalDateRange, "rangesIntersectWithStartDate1:endDate1:startDate2:endDate2:", v5, v6, v7, v8);
  return v9;
}

- (BOOL)intersectsRange:(id)a3 allowSinglePointIntersection:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = -[CalDateRange intersectsRangeWithStartDate:endDate:allowSinglePointIntersection:](self, "intersectsRangeWithStartDate:endDate:allowSinglePointIntersection:", v7, v8, v4);
  return v4;
}

- (BOOL)intersectsRangeWithStartDate:(id)a3 endDate:(id)a4 allowSinglePointIntersection:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[CalDateRange startDate](self, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDateRange endDate](self, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = +[CalDateRange rangesIntersectWithStartDate1:endDate1:startDate2:endDate2:allowSinglePointIntersection:](CalDateRange, "rangesIntersectWithStartDate1:endDate1:startDate2:endDate2:allowSinglePointIntersection:", v10, v11, v9, v8, v5);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[CalDateRange startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CalDateRange endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 3 * objc_msgSend(v5, "hash") + 2 * v4;

  return v6;
}

- (id)subtractRange:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  CalDisjointDateRange *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  if (!v4)
    goto LABEL_8;
  +[CalDateRange rangeWithRange:](CalDateRange, "rangeWithRange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CalDateRange isEqual:](self, "isEqual:", v5);

  if (!v6)
  {
    if (-[CalDateRange intersectsRange:](self, "intersectsRange:", v4))
    {
      -[CalDateRange startDate](self, "startDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "CalIsBeforeDate:", v9);

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CalDateRange startDate](self, "startDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[CalDateRange rangeWithStartDate:endDate:](CalDateRange, "rangeWithStartDate:endDate:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v14);

        -[CalDateRange endDate](self, "endDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "endDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v13) = objc_msgSend(v15, "isAfterDate:", v16);

        if (!(_DWORD)v13)
          goto LABEL_16;
      }
      else
      {
        -[CalDateRange startDate](self, "startDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "startDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "CalIsAfterDate:", v20))
        {

        }
        else
        {
          -[CalDateRange startDate](self, "startDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "startDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "isEqualToDate:", v22);

          if (!v23)
          {
            v7 = 0;
            goto LABEL_9;
          }
        }
        -[CalDateRange endDate](self, "endDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "endDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isAfterDate:", v25);

        if (!v26)
          goto LABEL_3;
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v4, "endDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalDateRange endDate](self, "endDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[CalDateRange rangeWithStartDate:endDate:](CalDateRange, "rangeWithStartDate:endDate:", v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v29);

LABEL_16:
      +[CalDisjointDateRange disjointRangeWithDistinctRanges:](CalDisjointDateRange, "disjointRangeWithDistinctRanges:", v11);
      v7 = (CalDisjointDateRange *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CalDisjointDateRange disjointRangeWithDistinctRanges:](CalDisjointDateRange, "disjointRangeWithDistinctRanges:", v17);
    v7 = (CalDisjointDateRange *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
LABEL_3:
  v7 = objc_alloc_init(CalDisjointDateRange);
LABEL_9:

  return v7;
}

- (id)unionRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v4 = a3;
  v5 = (void *)-[CalDateRange copy](self, "copy");
  v6 = (void *)objc_msgSend(v4, "copy");

  if (v6)
  {
    objc_msgSend(v6, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "CalIsBeforeDate:", v8);

    if (v9)
    {
      objc_msgSend(v6, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setStartDate:", v10);

    }
    objc_msgSend(v6, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "CalIsAfterDate:", v12);

    if (v13)
    {
      objc_msgSend(v6, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setEndDate:", v14);

    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CalDateRange startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDateRange endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithStartDate:endDate:", v5, v6);

  return v7;
}

+ (id)rangeByExpandingRange:(id)a3 direction:(int64_t)a4 multiplier:(unint64_t)a5
{
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;

  objc_msgSend(a1, "rangeWithRange:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "duration");
  if (a5 >= 2)
  {
    switch(a4)
    {
      case 2:
        v13 = (v9 * (double)a5 - v9) * 0.5;
        objc_msgSend(v8, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dateByAddingTimeInterval:", -v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "endDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dateByAddingTimeInterval:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "rangeWithStartDate:endDate:", v11, v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      case 1:
        v17 = -((double)a5 * v9);
        objc_msgSend(v8, "endDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dateByAddingTimeInterval:", v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "endDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "rangeWithStartDate:endDate:", v11, v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      case 0:
        v10 = v9 * (double)a5;
        objc_msgSend(v8, "startDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "rangeWithStartDate:duration:", v11, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

        goto LABEL_10;
    }
  }
  v12 = 0;
LABEL_10:

  return v12;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[CalDateRange startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CalDateRange endDate](self, "endDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[CalDateRange startDate](self, "startDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalDateRange endDate](self, "endDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "CalIsBeforeDate:", v6);

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

- (id)intersectionWithRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (-[CalDateRange intersectsRange:](self, "intersectsRange:", v4))
  {
    -[CalDateRange startDate](self, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "laterDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDateRange endDate](self, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "earlierDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CalDateRange rangeWithStartDate:endDate:](CalDateRange, "rangeWithStartDate:endDate:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)midpoint
{
  void *v3;
  double v4;
  void *v5;

  -[CalDateRange startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDateRange duration](self, "duration");
  objc_msgSend(v3, "dateByAddingTimeInterval:", v4 * 0.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)rangeByExpandingRange:(id)a3 direction:(int64_t)a4 duration:(double)a5
{
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(a1, "rangeWithRange:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "duration");
  if (v9 >= a5)
  {
    objc_msgSend(a1, "rangeWithRange:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (a4 == 2)
  {
    objc_msgSend(v8, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateByAddingTimeInterval:", -(a5 * 0.5));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dateByAddingTimeInterval:", a5 * 0.5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "rangeWithStartDate:endDate:", v14, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    goto LABEL_11;
  }
  if (a4 == 1)
  {
    objc_msgSend(v8, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dateByAddingTimeInterval:", -a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "rangeWithStartDate:endDate:", v14, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if (a4)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v8, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "duration");
    objc_msgSend(a1, "rangeWithStartDate:duration:", v10, v11 + a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_11:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  id v5;

  startDate = self->_startDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startDate, CFSTR("start"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("end"));

}

+ (id)rangeByExpandingRange:(id)a3 direction:(int64_t)a4 components:(id)a5 calendar:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (a4 == 2)
  {
    objc_msgSend(v9, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "CalDateBySubtractingComponents:fromDate:", v10, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a4 == 1)
    {
      objc_msgSend(v9, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "CalDateBySubtractingComponents:fromDate:", v10, v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "endDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (a4)
    {
      v17 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v9, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingComponents:toDate:options:", v10, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  +[CalDateRange rangeWithStartDate:endDate:](CalDateRange, "rangeWithStartDate:endDate:", v12, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CalDateRange)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSDate *v6;
  NSDate *startDate;
  void *v8;
  NSDate *v9;
  NSDate *endDate;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("start"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSDate *)objc_msgSend(v5, "copy");
  startDate = self->_startDate;
  self->_startDate = v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("end"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (NSDate *)objc_msgSend(v8, "copy");
  endDate = self->_endDate;
  self->_endDate = v9;

  return self;
}

- (void)setDuration:(double)a3
{
  void *v5;
  id v6;

  -[CalDateRange startDate](self, "startDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDateRange setEndDate:](self, "setEndDate:", v5);

}

- (void)setStartDate:(id)a3 duration:(double)a4
{
  -[CalDateRange setStartDate:](self, "setStartDate:", a3);
  -[CalDateRange setDuration:](self, "setDuration:", a4);
}

+ (BOOL)range:(id)a3 intersectsRange:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = +[CalDateRange rangesIntersectWithStartDate1:endDate1:startDate2:endDate2:](CalDateRange, "rangesIntersectWithStartDate1:endDate1:startDate2:endDate2:", v7, v8, v9, v10);
  return v11;
}

+ (BOOL)range:(id)a3 intersectsRange:(id)a4 allowSinglePointIntersection:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = +[CalDateRange rangesIntersectWithStartDate1:endDate1:startDate2:endDate2:allowSinglePointIntersection:](CalDateRange, "rangesIntersectWithStartDate1:endDate1:startDate2:endDate2:allowSinglePointIntersection:", v9, v10, v11, v12, v5);
  return v5;
}

+ (BOOL)range:(id)a3 intersectsRangeWithStartDate:(id)a4 endDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = +[CalDateRange rangesIntersectWithStartDate1:endDate1:startDate2:endDate2:](CalDateRange, "rangesIntersectWithStartDate1:endDate1:startDate2:endDate2:", v10, v11, v8, v7);
  return (char)v9;
}

+ (BOOL)range:(id)a3 intersectsRangeWithStartDate:(id)a4 endDate:(id)a5 allowSinglePointIntersection:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = +[CalDateRange rangesIntersectWithStartDate1:endDate1:startDate2:endDate2:allowSinglePointIntersection:](CalDateRange, "rangesIntersectWithStartDate1:endDate1:startDate2:endDate2:allowSinglePointIntersection:", v12, v13, v10, v9, v6);
  return v6;
}

- (BOOL)intersectsRangeWithStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a4;
  v7 = a3;
  -[CalDateRange startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDateRange endDate](self, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CalDateRange rangesIntersectWithStartDate1:endDate1:startDate2:endDate2:](CalDateRange, "rangesIntersectWithStartDate1:endDate1:startDate2:endDate2:", v8, v9, v7, v6);

  return v10;
}

+ (BOOL)rangesIntersectWithStartDate1:(id)a3 endDate1:(id)a4 startDate2:(id)a5 endDate2:(id)a6
{
  return +[CalDateRange rangesIntersectWithStartDate1:endDate1:startDate2:endDate2:allowSinglePointIntersection:](CalDateRange, "rangesIntersectWithStartDate1:endDate1:startDate2:endDate2:allowSinglePointIntersection:", a3, a4, a5, a6, 0);
}

+ (BOOL)rangesIntersectWithStartDate1:(id)a3 endDate1:(id)a4 startDate2:(id)a5 endDate2:(id)a6 allowSinglePointIntersection:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v20;
  int v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  LOBYTE(v16) = 0;
  if (v11 && v12 && v13 && v14)
  {
    objc_msgSend(v11, "laterDate:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "earlierDate:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isBeforeDate:", v18) & 1) != 0)
      goto LABEL_6;
    v16 = objc_msgSend(v17, "isEqualToDate:", v18);
    if (!v16 || a7)
      goto LABEL_7;
    if ((v20 = objc_msgSend(v11, "isEqualToDate:", v12), v21 = objc_msgSend(v13, "isEqualToDate:", v15), v20)
      && (v21 & 1) != 0
      || (v20 | v21) == 1
      && ((objc_msgSend(v17, "CalIsBeforeDate:", v12) & 1) != 0 || (objc_msgSend(v17, "CalIsBeforeDate:", v15) & 1) != 0))
    {
LABEL_6:
      LOBYTE(v16) = 1;
    }
    else
    {
      LOBYTE(v16) = 0;
    }
LABEL_7:

  }
  return v16;
}

- (id)briefDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (briefDescription_onceToken != -1)
    dispatch_once(&briefDescription_onceToken, &__block_literal_global_36);
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CalDateRange startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __32__CalDateRange_briefDescription__block_invoke_2((uint64_t)v4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDateRange endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __32__CalDateRange_briefDescription__block_invoke_2((uint64_t)v6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __32__CalDateRange_briefDescription__block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)briefDescription_dateFormatter;
  briefDescription_dateFormatter = (uint64_t)v0;

  objc_msgSend((id)briefDescription_dateFormatter, "setDateFormat:", CFSTR("y'/'M'/'d"));
  v2 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v3 = (void *)briefDescription_cachedBriefStrings;
  briefDescription_cachedBriefStrings = (uint64_t)v2;

}

id __32__CalDateRange_briefDescription__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v3 = (void *)briefDescription_cachedBriefStrings;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__CalDateRange_briefDescription__block_invoke_3;
  v7[3] = &unk_1E2A85A90;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "CALobjectForKey:calculatedWithBlock:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __32__CalDateRange_briefDescription__block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = (id)briefDescription_dateFormatter;
  objc_sync_enter(v2);
  objc_msgSend((id)briefDescription_dateFormatter, "stringFromDate:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

uint64_t __50__CalDateRange_midnightsForRangeInTimeZoneString___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __50__CalDateRange_midnightsForRangeInTimeZoneString___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = objc_msgSend(v2, "indexOfObject:inSortedRange:options:usingComparator:", v3, 0, objc_msgSend(v2, "count"), 1024, &__block_literal_global_28);

  return v4;
}

uint64_t __50__CalDateRange_midnightsForRangeInTimeZoneString___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

@end
