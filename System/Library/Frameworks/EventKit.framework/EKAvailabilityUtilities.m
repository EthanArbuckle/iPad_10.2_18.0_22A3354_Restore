@implementation EKAvailabilityUtilities

+ (int)CALFreeBusyTypeFromEKAvailType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return 1;
  else
    return dword_1A244A5A0[a3 - 1];
}

+ (int)leastAvailabileFreeBusyTypeForArray:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t i;
  void *v9;
  int v10;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "count");
    if (v5 < 2)
    {
      v7 = 6;
    }
    else
    {
      v6 = v5;
      v7 = 6;
      for (i = 1; i < v6; i += 2)
      {
        objc_msgSend(v4, "objectAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "integerValue");

        if (v7 >= v10)
          v7 = v10;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)getCALFreeBusyFromEKSpans:(id)a3 inRange:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isBeforeDate:", v10);

    if (v11)
    {
      objc_msgSend(v6, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v12);

      objc_msgSend(v7, "addObject:", &unk_1E47B5078);
    }
    v28 = v5;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = v5;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v18, "startDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v19);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[EKAvailabilityUtilities CALFreeBusyTypeFromEKAvailType:](EKAvailabilityUtilities, "CALFreeBusyTypeFromEKAvailType:", objc_msgSend(v18, "type")));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v20);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v15);
    }

    objc_msgSend(v13, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v6, "endDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "endDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isAfterDate:", v23);

      if (v24)
      {
        objc_msgSend(v21, "endDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v25);

        objc_msgSend(v7, "addObject:", &unk_1E47B5078);
      }
    }

    v5 = v28;
  }
  else
  {
    objc_msgSend(v6, "startDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v26);

    objc_msgSend(v7, "addObject:", &unk_1E47B5078);
  }

  return v7;
}

+ (id)getCALFreeBusyFromResults:(id)a3 forAttendees:(id)a4 inRange:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v24 = (id)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13);
        v15 = (void *)objc_opt_new();
        if (v7)
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }
        objc_msgSend(v15, "sanitizeAndInsertResults:inRange:", v16, v9);
        objc_msgSend(v15, "spans");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (v18)
        {
          v19 = (void *)objc_opt_class();
          objc_msgSend(v15, "spans");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "getCALFreeBusyFromEKSpans:inRange:", v20, v9);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v21, v14);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  return v24;
}

+ (int64_t)summarizedAvailabilityTypeForSpans:(id)a3
{
  id v4;
  int64_t v5;
  _QWORD v7[7];
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  v9 = objc_msgSend((id)objc_opt_class(), "orderForType:", 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__EKAvailabilityUtilities_summarizedAvailabilityTypeForSpans___block_invoke;
  v7[3] = &unk_1E4786D90;
  v7[4] = v8;
  v7[5] = &v10;
  v7[6] = a1;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = v11[3];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);

  return v5;
}

uint64_t __62__EKAvailabilityUtilities_summarizedAvailabilityTypeForSpans___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = objc_msgSend(a2, "type");
  result = objc_msgSend((id)objc_opt_class(), "orderForType:", v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (result > *(_QWORD *)(v5 + 24))
  {
    *(_QWORD *)(v5 + 24) = result;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  }
  return result;
}

+ (BOOL)spansIncludeBusyPeriod:(id)a3
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__EKAvailabilityUtilities_spansIncludeBusyPeriod___block_invoke;
  v6[3] = &unk_1E4786DB8;
  v6[4] = &v7;
  v6[5] = a1;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  LOBYTE(a1) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)a1;
}

uint64_t __50__EKAvailabilityUtilities_spansIncludeBusyPeriod___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "showTypeAsBusy:", objc_msgSend(a2, "type"));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

+ (BOOL)showTypeAsBusy:(int64_t)a3
{
  return ((unint64_t)a3 < 8) & (0xF2u >> a3);
}

+ (BOOL)showTypeAsUnavailable:(int64_t)a3
{
  return ((unint64_t)a3 < 8) & (0xD0u >> a3);
}

+ (int64_t)availabilityPanelVisibilityForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int64_t v8;
  void *v10;
  char v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsAvailabilityRequests");

    if (v7)
    {
      if ((objc_msgSend(v5, "isAllDay") & 1) != 0)
      {
        v8 = 3;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D0C270], "activeCalendar");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v5, "isMultiDayTimedEventInCalendar:", v10);

        if ((v11 & 1) != 0)
        {
          v8 = 4;
        }
        else if (objc_msgSend(v5, "hasAttendees"))
        {
          if (objc_msgSend(a1, "canSeeAttendeeStatusesForEvent:", v5))
            v8 = 0;
          else
            v8 = 6;
        }
        else
        {
          v8 = 5;
        }
      }
    }
    else
    {
      v8 = 2;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (BOOL)canSeeAttendeeStatusesForEvent:(id)a3
{
  id v3;
  void *v4;
  int v5;
  BOOL v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v3 = a3;
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (objc_msgSend(v3, "isNew"))
      v5 = objc_msgSend(v3, "hasAttendees");
    else
      v5 = 0;
    objc_msgSend(v3, "organizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "organizer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isCurrentUser");

    }
    else
    {
      v9 = 0;
    }

    v10 = v5 | v9;
    objc_msgSend(v3, "calendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_constraintsInternal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10 == 1)
      v15 = objc_msgSend(v13, "organizerCanSeeAttendeeStatuses");
    else
      v15 = objc_msgSend(v13, "inviteesCanSeeAttendeeStatuses");
    v6 = v15;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (int64_t)orderForType:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return 0;
  else
    return qword_1A244A5C0[a3];
}

@end
