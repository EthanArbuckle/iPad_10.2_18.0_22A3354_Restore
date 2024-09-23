@implementation CADStatsCalendars

+ (id)eventName
{
  return CFSTR("cadstats.Calendar");
}

- (void)prepareWithContext:(id)a3
{
  NSMutableArray *v5;
  NSMutableArray *calendarInfos;
  id v7;

  objc_storeStrong((id *)&self->_context, a3);
  v7 = a3;
  v5 = (NSMutableArray *)objc_opt_new();
  calendarInfos = self->_calendarInfos;
  self->_calendarInfos = v5;

}

- (BOOL)wantsCalendars
{
  return 1;
}

- (void)processCalendars:(id)a3 inStore:(void *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t *v18;
  const __CFArray *v19;
  const __CFArray *v20;
  CFIndex Count;
  unint64_t v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  CalGetDatabaseForRecord();
  CalDatabaseGetPreferences();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0C99E60]);
  v23 = v7;
  objc_msgSend(v7, "getValueForPreference:expectedClass:", CFSTR("LastDeselectedCalendars"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v14);
        v16 = objc_opt_new();
        -[NSMutableArray addObject:](self->_calendarInfos, "addObject:", v16);
        v17 = (void *)CalCalendarCopyUUID();
        *(_BYTE *)(v16 + 8) = objc_msgSend(v10, "containsObject:", v17) ^ 1;

        *(_BYTE *)(v16 + 9) = CalCalendarIsHolidaySubscribedCalendar();
        *(_BYTE *)(v16 + 10) = CalCalendarIsSubscribed();
        *(_BYTE *)(v16 + 11) = CalStoreGetType() == 2;
        *(_BYTE *)(v16 + 12) = -[CADStatsCalendars calendarUsesAuthentication:](self, "calendarUsesAuthentication:", v15);
        *(_BYTE *)(v16 + 16) = CalCalendarIsBirthdayCalendar();
        *(_BYTE *)(v16 + 17) = CalCalendarIsFacebookBirthdayCalendar();
        *(_BYTE *)(v16 + 18) = CalCalendarIsFamilyCalendar();
        *(_BYTE *)(v16 + 19) = CalCalendarIsFoundInMailCalendar();
        *(_BYTE *)(v16 + 20) = CalCalendarIsNaturalLanguageSuggestedEventsCalendar();
        *(_BYTE *)(v16 + 15) = CalCalendarIsHidden();
        *(_BYTE *)(v16 + 13) = CalCalendarGetSharingStatus() != 0;
        *(_BYTE *)(v16 + 21) = CalCalendarGetSharingStatus() == 1;
        *(_BYTE *)(v16 + 22) = CalCalendarIsHolidaySyncedCalendar();
        *(_BYTE *)(v16 + 14) = CalCalendarCanContainEntityTypeAndStoreAllowsIt();
        *(_QWORD *)(v16 + 24) = 0;
        v18 = (unint64_t *)(v16 + 24);
        *(_QWORD *)(v16 + 32) = 0;
        v19 = (const __CFArray *)CalCalendarCopySharees();
        if (v19)
        {
          v20 = v19;
          Count = CFArrayGetCount(v19);
          *v18 = Count;
          if (Count)
          {
            v22 = 0;
            do
            {
              CFArrayGetValueAtIndex(v20, v22);
              if ((int)CalShareeGetAccessLevel() <= 1)
                ++*(_QWORD *)(v16 + 32);
              ++v22;
            }
            while (v22 < *v18);
          }
          CFRelease(v20);
        }
        *(_QWORD *)(v16 + 40) = *(_QWORD *)(v16 + 24) - *(_QWORD *)(v16 + 32);

        ++v14;
      }
      while (v14 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

}

- (BOOL)calendarUsesAuthentication:(void *)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v4 = (void *)CalCalendarCopySubscriptionURL();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    goto LABEL_2;
  objc_msgSend(v5, "password");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v7 = 1;
    goto LABEL_6;
  }
  v6 = (void *)CalCalendarCopySubCalAccountID();
  if (!v6)
  {
LABEL_12:
    v7 = 0;
    goto LABEL_3;
  }
  -[CADStatCollectionContext accountStore](self->_context, "accountStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountWithIdentifier:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

    goto LABEL_12;
  }
  v13 = v12;
  objc_msgSend(v12, "username");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (!v15)
    goto LABEL_12;
LABEL_2:
  v7 = 1;
LABEL_3:

LABEL_6:
  return v7;
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
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[19];
  _QWORD v34[19];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_calendarInfos, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = self->_calendarInfos;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v17)
  {
    v15 = *(_QWORD *)v30;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v3);
        v34[0] = &unk_1E6A50420;
        v33[0] = CFSTR("instance");
        v33[1] = CFSTR("isSelected");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 8));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v34[1] = v28;
        v33[2] = CFSTR("isHoliday");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 9));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v34[2] = v27;
        v33[3] = CFSTR("isSubscribed");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 10));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v34[3] = v26;
        v33[4] = CFSTR("isCalDAV");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 11));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v34[4] = v25;
        v33[5] = CFSTR("isAuthenticated");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 12));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v34[5] = v24;
        v33[6] = CFSTR("isShared");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 13));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v34[6] = v23;
        v33[7] = CFSTR("allowsEvents");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 14));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v34[7] = v22;
        v33[8] = CFSTR("isHidden");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 15));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v34[8] = v21;
        v33[9] = CFSTR("isBirthday");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 16));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v34[9] = v20;
        v33[10] = CFSTR("isFacebookBirthday");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 17));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v34[10] = v19;
        v33[11] = CFSTR("isFamily");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 18));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v34[11] = v18;
        v33[12] = CFSTR("isFoundInMail");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 19));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v34[12] = v5;
        v33[13] = CFSTR("isNaturalLanguageSuggestedEvents");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 20));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v34[13] = v6;
        v33[14] = CFSTR("isSharedByMe");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 21));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v34[14] = v7;
        v33[15] = CFSTR("isSyncedHolidayCalendar");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v4 + 22));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v34[15] = v8;
        v33[16] = CFSTR("numSharees");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(v4 + 24));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v34[16] = v9;
        v33[17] = CFSTR("readOnlySharees");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(v4 + 32));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v34[17] = v10;
        v33[18] = CFSTR("readWriteSharees");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(v4 + 40));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v34[18] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v12);

        ++v3;
      }
      while (v17 != v3);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v17);
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarInfos, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
