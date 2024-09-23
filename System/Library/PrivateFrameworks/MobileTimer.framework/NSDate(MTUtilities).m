@implementation NSDate(MTUtilities)

+ (id)mtNow
{
  void (**v0)(void);
  void *v1;

  MTCurrentDateProvider();
  v0 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v0[2]();
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (uint64_t)mtIsBeforeDate:()MTUtilities
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTUtilities.m"), 74, CFSTR("date can't be nil"));

  }
  objc_msgSend(a1, "earlierDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == a1)
    v7 = objc_msgSend(a1, "isEqualToDate:", v5) ^ 1;
  else
    v7 = 0;

  return v7;
}

- (BOOL)mtIsBeforeOrSameAsDate:()MTUtilities
{
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTUtilities.m"), 79, CFSTR("date can't be nil"));

  }
  objc_msgSend(a1, "earlierDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == a1;

  return v7;
}

- (uint64_t)mtIsAfterDate:()MTUtilities
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTUtilities.m"), 84, CFSTR("date can't be nil"));

  }
  objc_msgSend(a1, "laterDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == a1)
    v7 = objc_msgSend(a1, "isEqualToDate:", v5) ^ 1;
  else
    v7 = 0;

  return v7;
}

- (BOOL)mtIsAfterOrSameAsDate:()MTUtilities
{
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTUtilities.m"), 89, CFSTR("date can't be nil"));

  }
  objc_msgSend(a1, "laterDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == a1;

  return v7;
}

- (id)mtDateNearestMatchingComponents:()MTUtilities
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 224, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if (v7)
  {
    v8 = a1;
  }
  else
  {
    objc_msgSend(v5, "mtPreviousDateBeforeDate:matchingComponents:", a1, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mtNextDateAfterDate:matchingComponents:", a1, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "timeIntervalSinceDate:", v9);
    v12 = v11;
    objc_msgSend(v10, "timeIntervalSinceDate:", a1);
    if (v13 >= v12)
      v14 = v9;
    else
      v14 = v10;
    v8 = v14;

  }
  return v8;
}

+ (id)mtLatest:()MTUtilities
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (!v6 || objc_msgSend(v9, "mtIsAfterDate:", v6)))
        {
          v10 = v9;

          v6 = v10;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)mtEarliest:()MTUtilities
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (!v6 || objc_msgSend(v9, "mtIsBeforeDate:", v6)))
        {
          v10 = v9;

          v6 = v10;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)mtMidnightForDate
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startOfDayForDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mtDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "descriptionWithLocale:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
