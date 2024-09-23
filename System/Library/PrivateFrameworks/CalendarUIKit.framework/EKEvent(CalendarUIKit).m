@implementation EKEvent(CalendarUIKit)

- (BOOL)CUIK_deleteActionShouldDeclineEvent
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL8 result;
  _BOOL4 v15;

  objc_msgSend(a1, "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "sourceType") == 1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(a1, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "sourceType") != 2;

  }
  objc_msgSend(a1, "selfAttendee");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "participantStatus");

  v9 = objc_msgSend(a1, "status");
  v10 = objc_msgSend(a1, "currentUserGeneralizedParticipantRole");
  objc_msgSend(a1, "organizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "scheduleAgent");

  result = 0;
  if (!v4 && v10 == 1)
  {
    v15 = v9 != 3 && v12 == 2;
    return v8 != 3 && v15;
  }
  return result;
}

- (const)CUIK_symbolName
{
  void *v3;
  char v4;

  if (objc_msgSend(a1, "isIntegrationEvent"))
  {
    if (objc_msgSend(a1, "completed"))
      return CFSTR("circle.inset.filled");
    else
      return CFSTR("circle");
  }
  else if ((objc_msgSend(a1, "isBirthday") & 1) != 0)
  {
    return CFSTR("gift.circle.fill");
  }
  else
  {
    objc_msgSend(a1, "calendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isHolidayCalendar");

    if ((v4 & 1) != 0)
    {
      return CFSTR("star.circle.fill");
    }
    else if (objc_msgSend(a1, "isAllDay"))
    {
      return CFSTR("calendar.circle.fill");
    }
    else
    {
      return 0;
    }
  }
}

- (id)CUIK_symbolColor
{
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "isIntegrationEvent"))
  {
    objc_msgSend(a1, "color");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
      objc_msgSend(v2, "CUIK_color");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(a1, "isBirthday"))
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)CUIK_disabledSymbolColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "CUIK_symbolColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cuik_colorWithAlphaScaled:", 0.4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)_isFirstFutureOccurrenceReminder
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;

  if (!objc_msgSend(a1, "isReminderIntegrationEvent"))
    return 0;
  if (!objc_msgSend(a1, "hasRecurrenceRules"))
    return 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "CalSimulatedDateForNow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;
  objc_msgSend(a1, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  if (v4 >= v7)
    goto LABEL_6;
  objc_msgSend(a1, "previousOccurrence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_9;
  v9 = v8;
  objc_msgSend(v8, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v14 = v13;

  if (v12 >= v14)
LABEL_6:
    v15 = 0;
  else
LABEL_9:
    v15 = 1;

  return v15;
}

- (BOOL)CUIK_reminderShouldBeEditable
{
  return objc_msgSend(a1, "reminderOccurrenceType") == 0;
}

- (id)CUIK_currentReminder
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99D68], "CalSimulatedDateForNow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateForEndOfDayInTimeZone:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "masterEvent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CAA110]);
  objc_msgSend(v5, "timeZone");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = v3;
  objc_msgSend(v5, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "copyOccurrenceDatesWithEKEvent:startDate:endDate:timeZone:limit:", v5, v8, v4, v7, 0);

  v10 = v5;
  if (objc_msgSend(v9, "count"))
  {
    v11 = objc_alloc(MEMORY[0x1E0CAA060]);
    objc_msgSend(v5, "persistentObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "initWithPersistentObject:occurrenceDate:", v12, v13);

  }
  return v10;
}

- (uint64_t)CUIK_attendeesIconState
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
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
  if (!objc_msgSend(a1, "hasAttendees"))
    return 0;
  if (!objc_msgSend(a1, "isSelfOrganized"))
  {
    if (objc_msgSend(a1, "status") == 3)
      return 10;
    objc_msgSend(a1, "selfAttendee");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "participantStatus");

    if (v22)
    {
      objc_msgSend(a1, "selfAttendee");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "participantStatus");

      if (v24 == 3)
        return 10;
      else
        return 8 * (v24 == 4);
    }
    return 0;
  }
  objc_msgSend(a1, "attendeesNotIncludingOrganizer");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v31 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v7, "isLocationRoom") && objc_msgSend(v7, "participantStatus") == 3)
        {

          v20 = 5;
          goto LABEL_40;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v4)
        continue;
      break;
    }
  }

  objc_msgSend(a1, "roomAttendees");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = objc_msgSend(v2, "count");

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v2;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v27;
    while (2)
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        if (v9 == v10
          || !objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "isLocationRoom", (_QWORD)v26)
          || objc_msgSend(v18, "participantStatus") != 2)
        {
          v19 = objc_msgSend(v18, "participantStatus", (_QWORD)v26);
          if ((v14 & 1) != 0)
          {
            if (v15 != v19)
            {
              v20 = 6;
              goto LABEL_39;
            }
            v14 = 1;
          }
          else
          {
            v14 = 1;
            v15 = v19;
          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v13)
        continue;
      break;
    }

    if ((v14 & 1) != 0)
    {
      if (v15 >= 8)
        v20 = 1;
      else
        v20 = qword_1B8BA4710[v15];
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
LABEL_39:

  }
LABEL_40:

  return v20;
}

- (const)CUIK_attendeesIconSymbolWithAttendeesIconState:()CalendarUIKit myParticipantStatus:
{
  uint64_t v6;

  v6 = objc_msgSend(a1, "currentUserGeneralizedParticipantRole");
  if (a4 == 3)
    return CFSTR("person.fill.xmark");
  if (v6 == 2 && (unint64_t)(a3 - 1) <= 9)
    return off_1E6EB64B0[a3 - 1];
  return 0;
}

@end
