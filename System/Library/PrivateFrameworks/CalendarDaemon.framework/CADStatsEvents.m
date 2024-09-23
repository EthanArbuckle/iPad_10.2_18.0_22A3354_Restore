@implementation CADStatsEvents

+ (id)eventName
{
  return CFSTR("cadstats.Event");
}

- (void)prepareWithContext:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *eventInfos;

  v4 = (NSMutableArray *)objc_opt_new();
  eventInfos = self->_eventInfos;
  self->_eventInfos = v4;

}

- (BOOL)wantsEvents
{
  return 1;
}

- (void)processEvents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  const void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        v9 = objc_opt_new();
        -[NSMutableArray addObject:](self->_eventInfos, "addObject:", v9);
        *(_BYTE *)(v9 + 8) = CalEventIsDetached();
        *(_BYTE *)(v9 + 9) = CalCalendarItemHasRecurrenceRules();
        *(_BYTE *)(v9 + 10) = CalCalendarItemIsAllDay();
        *(_QWORD *)(v9 + 32) = (int)CalEventGetParticipationStatus();
        v10 = CalCalendarItemCopyPreferredLocation();
        *(_BYTE *)(v9 + 13) = v10 != 0;
        if (v10)
        {
          v11 = (const void *)v10;
          *(_BYTE *)(v9 + 14) = CalLocationHasKnownSpatialData();
          CFRelease(v11);
        }
        *(_BYTE *)(v9 + 15) = CalCalendarItemHasClientLocation();
        *(_BYTE *)(v9 + 16) = CalEventPreferredLocationIsAConferenceRoom();
        *(_QWORD *)(v9 + 24) = CalEventGetTravelAdvisoryBehavior();
        *(_BYTE *)(v9 + 17) = CalEventIsCandidateForTravelAdvisories();
        *(_BYTE *)(v9 + 18) = CalEventIsImmediatelyEligibleForTravelAdvisories();
        *(_BYTE *)(v9 + 19) = CalEventHasPredictedLocation();
        v12 = CalCalendarItemCopyCalendar();
        if (v12)
        {
          v13 = (const void *)v12;
          *(_BYTE *)(v9 + 20) = CalCalendarIsIgnoringEventAlerts();
          *(_BYTE *)(v9 + 21) = CalCalendarGetSharingStatus() != 0;
          *(_BYTE *)(v9 + 11) = CalCalendarIsBirthdayCalendar();
          *(_BYTE *)(v9 + 12) = CalCalendarIsHolidaySubscribedCalendar();
          CFRelease(v13);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
  NSMutableArray *obj;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[17];
  _QWORD v32[17];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_eventInfos, "count"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_eventInfos;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v17)
  {
    v15 = *(_QWORD *)v28;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v3);
        v32[0] = &unk_1E6A506C0;
        v31[0] = CFSTR("instance");
        v31[1] = CFSTR("isDetached");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 8));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v32[1] = v26;
        v31[2] = CFSTR("hasRecurrenceRules");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 9));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v32[2] = v25;
        v31[3] = CFSTR("isAllDay");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 10));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v32[3] = v24;
        v31[4] = CFSTR("isBirthday");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 11));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v32[4] = v23;
        v31[5] = CFSTR("isHoliday");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 12));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v32[5] = v22;
        v31[6] = CFSTR("hasLocation");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 13));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v32[6] = v21;
        v31[7] = CFSTR("locationHasKnownSpatialData");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 14));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v32[7] = v20;
        v31[8] = CFSTR("hasClientLocation");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 15));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v32[8] = v19;
        v31[9] = CFSTR("preferredLocationIsAConferenceRoom");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 16));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v32[9] = v18;
        v31[10] = CFSTR("isCandidateForTravelAdvisories");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 17));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v32[10] = v5;
        v31[11] = CFSTR("isImmediatelyEligibleForTravelAdvisories");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 18));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v32[11] = v6;
        v31[12] = CFSTR("travelAdvisoryBehavior");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(v4 + 24));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v32[12] = v7;
        v31[13] = CFSTR("participationStatus");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(v4 + 32));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v32[13] = v8;
        v31[14] = CFSTR("hasPredictedLocation");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 19));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v32[14] = v9;
        v31[15] = CFSTR("isOnCalendarIgnoringEventAlerts");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 20));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v32[15] = v10;
        v31[16] = CFSTR("isOnSharedCalendar");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 21));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v32[16] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v12);

        ++v3;
      }
      while (v17 != v3);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v17);
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventInfos, 0);
}

@end
