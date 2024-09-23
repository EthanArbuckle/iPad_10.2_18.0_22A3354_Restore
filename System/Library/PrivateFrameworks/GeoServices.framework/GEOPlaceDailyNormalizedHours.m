@implementation GEOPlaceDailyNormalizedHours

+ (id)dailyNormalizedHoursForWeekday:(int64_t)a3 timeIntervals:(id)a4 closingThreshold:(double)a5 openingThreshold:(double)a6 openToMidnight:(BOOL)a7 openFromMidnight:(BOOL)a8
{
  id v13;
  GEOPlaceDailyNormalizedHours *v14;
  GEOPlaceDailyNormalizedHours *v15;
  uint64_t v16;
  NSArray *localTimeIntervals;

  v13 = a4;
  v14 = objc_alloc_init(GEOPlaceDailyNormalizedHours);
  v15 = v14;
  if (v14)
  {
    v14->_weekday = a3;
    v16 = objc_msgSend(v13, "copy");
    localTimeIntervals = v15->_localTimeIntervals;
    v15->_localTimeIntervals = (NSArray *)v16;

    v15->_closingSoonThresholdSeconds = a5;
    v15->_openingSoonThresholdSeconds = a6;
    v15->_openToMidnight = a7;
    v15->_openFromMidnight = a8;
  }

  return v15;
}

+ (int64_t)getWeekdayForDate:(id)a3 inNormalizedHours:(id)a4 timeZone:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;

  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99D48];
  v9 = *MEMORY[0x1E0C996C8];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v8, "calendarWithIdentifier:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimeZone:", v10);

  objc_msgSend(v12, "components:fromDate:", 512, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "weekday");
  objc_msgSend(v12, "startOfDayForDate:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v15);
  v17 = v16;

  if (v14 >= 1)
  {
    if (v14 == 1)
      v18 = 7;
    else
      v18 = v14 - 1;
    v14 = +[GEOPlaceDailyNormalizedHours todaysWeekday:yesterdaysWeekday:containsTimeFromMidnight:inNormalizedHours:](GEOPlaceDailyNormalizedHours, "todaysWeekday:yesterdaysWeekday:containsTimeFromMidnight:inNormalizedHours:", v14, v18, v7, v17);
  }

  return v14;
}

+ (int64_t)todaysWeekday:(int64_t)a3 yesterdaysWeekday:(int64_t)a4 containsTimeFromMidnight:(double)a5 inNormalizedHours:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  id v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  double v25;
  _BOOL4 v26;
  double v27;
  double v28;
  id obj;
  int v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (!v10)
  {
    v13 = 0;
    v12 = 0;
LABEL_16:
    a3 = -1;
    goto LABEL_33;
  }
  v11 = v10;
  v12 = 0;
  v13 = 0;
  v14 = *(_QWORD *)v37;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v37 != v14)
        objc_enumerationMutation(v9);
      v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      if (objc_msgSend(v16, "weekday") == a3)
      {
        v17 = v16;

        v13 = v17;
      }
      if (objc_msgSend(v16, "weekday") == a4)
      {
        v18 = v16;

        v12 = v18;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  }
  while (v11);
  if (!v13)
    goto LABEL_16;
  if (objc_msgSend(v13, "openFromMidnight"))
    v19 = objc_msgSend(v12, "openToMidnight") ^ 1;
  else
    v19 = 1;
  v31 = v19;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v13, "localTimeIntervals");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v33;
    while (2)
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(v24, "startTime");
        if (v25 <= a5)
        {
          objc_msgSend(v24, "endTime");
          v26 = v27 >= a5;
        }
        else
        {
          v26 = 0;
        }
        objc_msgSend(v24, "startTime");
        if (((!v26 | v31) & 1) == 0 && v28 == 0.0)
        {
          a3 = a4;
          goto LABEL_32;
        }
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v21)
        continue;
      break;
    }
  }
LABEL_32:

LABEL_33:
  return a3;
}

- (id)description
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("<  Weekday  > \n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%d\n"), self->_weekday);
  objc_msgSend(v3, "appendString:", CFSTR("<  Local Time Intervals  > \n"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_localTimeIntervals;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "startTime");
        v11 = v10;
        objc_msgSend(v9, "endTime");
        objc_msgSend(v3, "appendFormat:", CFSTR("<  Start Seconds: %f  >  -  <  End Seconds: %f  > \n"), v11, v12, (_QWORD)v16);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR("<  Closing Soon Threshold  > \n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%d\n"), (int)self->_closingSoonThresholdSeconds);
  objc_msgSend(v3, "appendString:", CFSTR("<  Opening Soon Threshold  > \n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%d\n"), (int)self->_openingSoonThresholdSeconds);
  objc_msgSend(v3, "appendString:", CFSTR("<  Open To Midnight  > \n"));
  if (self->_openToMidnight)
    v13 = CFSTR("Yes");
  else
    v13 = CFSTR("No");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ \n"), v13);
  objc_msgSend(v3, "appendString:", CFSTR("<  Open From Midnight  > \n"));
  if (self->_openFromMidnight)
    v14 = CFSTR("Yes");
  else
    v14 = CFSTR("No");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ \n \n"), v14);
  return v3;
}

- (int64_t)weekday
{
  return self->_weekday;
}

- (NSArray)localTimeIntervals
{
  return self->_localTimeIntervals;
}

- (double)closingSoonThresholdSeconds
{
  return self->_closingSoonThresholdSeconds;
}

- (void)setClosingSoonThresholdSeconds:(double)a3
{
  self->_closingSoonThresholdSeconds = a3;
}

- (double)openingSoonThresholdSeconds
{
  return self->_openingSoonThresholdSeconds;
}

- (void)setOpeningSoonThresholdSeconds:(double)a3
{
  self->_openingSoonThresholdSeconds = a3;
}

- (BOOL)openToMidnight
{
  return self->_openToMidnight;
}

- (BOOL)openFromMidnight
{
  return self->_openFromMidnight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localTimeIntervals, 0);
}

@end
