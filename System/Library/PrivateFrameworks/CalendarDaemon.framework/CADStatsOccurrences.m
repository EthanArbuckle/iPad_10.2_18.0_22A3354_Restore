@implementation CADStatsOccurrences

+ (id)eventName
{
  return CFSTR("cadstats.Occurrence");
}

- (void)prepareWithContext:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *occurrenceInfos;
  NSDate *v6;
  NSDate *now;
  id v8;
  void *v9;
  void *v10;
  CalDateRange *v11;
  CalDateRange *desiredOccurrenceRange;
  id v13;

  v4 = (NSMutableArray *)objc_opt_new();
  occurrenceInfos = self->_occurrenceInfos;
  self->_occurrenceInfos = v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (NSDate *)objc_opt_new();
  now = self->_now;
  self->_now = v6;

  v8 = objc_alloc(MEMORY[0x1E0D0C2B8]);
  objc_msgSend(v13, "dateByAddingUnit:value:toDate:options:", 16, -1, self->_now, 1024);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateByAddingUnit:value:toDate:options:", 16, 365, self->_now, 1024);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (CalDateRange *)objc_msgSend(v8, "initWithStartDate:endDate:", v9, v10);
  desiredOccurrenceRange = self->_desiredOccurrenceRange;
  self->_desiredOccurrenceRange = v11;

}

- (BOOL)wantsOccurrences
{
  return 1;
}

- (id)desiredOccurrenceRange
{
  return self->_desiredOccurrenceRange;
}

- (void)processOccurrences:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t Event;
  double v11;
  double v12;
  double v13;
  double v14;
  const __CFArray *v15;
  const __CFArray *v16;
  CFIndex Count;
  CFIndex v18;
  CFIndex v19;
  const void *ValueAtIndex;
  const void *v21;
  uint64_t v22;
  const void *v23;
  const __CFArray *v24;
  const __CFArray *v25;
  CFIndex v26;
  CFIndex v27;
  CFIndex v28;
  const void *v29;
  uint64_t v30;
  const void *v31;
  const void *v32;
  const void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v35;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_opt_new();
        -[NSMutableArray addObject:](self->_occurrenceInfos, "addObject:", v9);
        Event = CalEventOccurrenceGetEvent();
        CalEventOccurrenceGetDate();
        v12 = v11;
        -[NSDate timeIntervalSinceReferenceDate](self->_now, "timeIntervalSinceReferenceDate");
        v14 = (v12 - v13) / 60.0;
        *(double *)(v9 + 72) = v14;
        *(double *)(v9 + 80) = v14 + (double)CalEventGetDuration() / 60.0;
        *(double *)(v9 + 64) = (double)CalEventGetDuration() / 60.0;
        *(_BYTE *)(v9 + 8) = CalEventIsAllDay();
        *(_BYTE *)(v9 + 11) = CalEventIsCandidateForTravelAdvisories();
        *(_BYTE *)(v9 + 12) = CalEventIsImmediatelyEligibleForTravelAdvisories();
        v15 = (const __CFArray *)CalCalendarItemCopyAttendees();
        if (v15)
        {
          v16 = v15;
          Count = CFArrayGetCount(v15);
          *(_QWORD *)(v9 + 32) = Count;
          if (Count >= 1)
          {
            v18 = Count;
            v19 = 0;
            while (1)
            {
              ValueAtIndex = CFArrayGetValueAtIndex(v16, v19);
              v21 = (const void *)MEMORY[0x1BCC9B8C0](ValueAtIndex);
              if (v21)
                break;
              if (v18 == ++v19)
                goto LABEL_13;
            }
            *(_BYTE *)(v9 + 13) = 1;
            CFRelease(v21);
          }
LABEL_13:
          CFRelease(v16);
          if (*(_QWORD *)(v9 + 32))
          {
            v22 = CalCalendarItemCopyOrganizer();
            if (v22)
            {
              v23 = (const void *)v22;
              *(_BYTE *)(v9 + 14) = CalOrganizerIsSelf();
              CFRelease(v23);
            }
          }
        }
        *(_QWORD *)(v9 + 56) = (int)CalEventGetParticipationStatus();
        *(_QWORD *)(v9 + 48) = CalCalendarItemGetStatus();
        v24 = (const __CFArray *)MEMORY[0x1BCC9C3D0](Event);
        if (v24)
        {
          v25 = v24;
          v26 = CFArrayGetCount(v24);
          if (v26 >= 1)
          {
            v27 = v26;
            v28 = 0;
            while (1)
            {
              CFArrayGetValueAtIndex(v25, v28);
              if ((CalAlarmIsDefaultAlarm() & 1) == 0)
                break;
              if (v27 == ++v28)
                goto LABEL_23;
            }
            *(_BYTE *)(v9 + 15) = 1;
          }
LABEL_23:
          CFRelease(v25);
        }
        v29 = (const void *)CalCalendarItemCopyPreferredLocation();
        *(_BYTE *)(v9 + 16) = v29 != 0;
        *(_BYTE *)(v9 + 17) = CalCalendarItemHasClientLocation();
        if (v29)
        {
          *(_BYTE *)(v9 + 18) = CalLocationHasKnownSpatialData();
          *(_BYTE *)(v9 + 19) = CalEventPreferredLocationIsAConferenceRoom();
          CFRelease(v29);
        }
        *(_BYTE *)(v9 + 20) = CalEventHasPredictedLocation();
        *(_QWORD *)(v9 + 40) = CalEventGetTravelAdvisoryBehavior();
        v30 = CalCalendarItemCopyCalendar();
        if (v30)
        {
          v31 = (const void *)v30;
          *(_BYTE *)(v9 + 21) = CalCalendarIsIgnoringEventAlerts();
          *(_BYTE *)(v9 + 22) = CalCalendarGetSharingStatus() != 0;
          *(_BYTE *)(v9 + 9) = CalCalendarIsBirthdayCalendar();
          *(_BYTE *)(v9 + 10) = CalCalendarIsHolidaySubscribedCalendar();
          CFRelease(v31);
        }
        v32 = (const void *)CalCalendarItemCopyURL();
        *(_BYTE *)(v9 + 23) = v32 != 0;
        if (v32)
          CFRelease(v32);
        v33 = (const void *)CalCalendarItemCopyDescription();
        *(_BYTE *)(v9 + 24) = v33 != 0;
        if (v33)
          CFRelease(v33);

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v6);
  }

}

- (id)eventDictionaries
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *obj;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[25];
  _QWORD v41[25];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_occurrenceInfos, "count"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = self->_occurrenceInfos;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v18)
  {
    v16 = *(_QWORD *)v37;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v3);
        v41[0] = &unk_1E6A506D8;
        v40[0] = CFSTR("instance");
        v40[1] = CFSTR("minutesUntilStart");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(v4 + 72));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = v34;
        v40[2] = CFSTR("minutesUntilEnd");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(v4 + 80));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v41[2] = v33;
        v40[3] = CFSTR("isAllDay");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 8));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v41[3] = v32;
        v40[4] = CFSTR("isBirthday");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 9));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v41[4] = v31;
        v40[5] = CFSTR("isHoliday");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 10));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v41[5] = v30;
        v40[6] = CFSTR("isCandidateForTravelAdvisories");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 11));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v41[6] = v29;
        v40[7] = CFSTR("isImmediatelyEligibleForTravelAdvisories");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 12));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v41[7] = v28;
        v40[8] = CFSTR("hasResponseComment");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 13));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v41[8] = v27;
        v40[9] = CFSTR("organizerIsSelf");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 14));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v41[9] = v26;
        v40[10] = CFSTR("hasNonDefaultAlarm");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 15));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v41[10] = v25;
        v40[11] = CFSTR("hasLocation");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 16));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v41[11] = v24;
        v40[12] = CFSTR("hasClientLocation");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 17));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v41[12] = v23;
        v40[13] = CFSTR("hasLocationWithKnownSpatialData");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 18));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v41[13] = v22;
        v40[14] = CFSTR("hasConferenceRoomLocation");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 19));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v41[14] = v21;
        v40[15] = CFSTR("hasPredictedLocation");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 20));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v41[15] = v20;
        v40[16] = CFSTR("isOnCalendarThatSuppressesAlerts");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 21));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v41[16] = v19;
        v40[17] = CFSTR("isOnSharedCalendar");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 22));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v41[17] = v5;
        v40[18] = CFSTR("hasURL");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 23));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v41[18] = v6;
        v40[19] = CFSTR("hasNotes");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 24));
        v35 = v3;
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v41[19] = v7;
        v40[20] = CFSTR("numAttendees");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(v4 + 32));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v41[20] = v8;
        v40[21] = CFSTR("travelAdvisoryBehavior");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(v4 + 40));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v41[21] = v9;
        v40[22] = CFSTR("status");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(v4 + 48));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v41[22] = v10;
        v40[23] = CFSTR("participationStatus");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(v4 + 56));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v41[23] = v11;
        v40[24] = CFSTR("durationInMinutes");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(v4 + 64));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v41[24] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v13);

        v3 = v35 + 1;
      }
      while (v18 != v35 + 1);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v18);
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredOccurrenceRange, 0);
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_occurrenceInfos, 0);
}

@end
