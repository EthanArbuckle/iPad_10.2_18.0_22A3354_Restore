@implementation CUIKPasteboardUtilities

+ (id)roundedDateForDate:(id)a3 dateMode:(unint64_t)a4 calendar:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = v7;
  if (a4 == 1)
  {
    objc_msgSend(v7, "dateRoundedToNearestFifteenMinutesInCalendar:", a5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

+ (void)adjustTimesForEventsToPaste:(id)a3 pasteDate:(id)a4 dateMode:(unint64_t)a5 calendar:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (a5 != 3)
  {
    v50 = v12;
    v47 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v45 = v10;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v56 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v19, "startDate", v45);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isBeforeDate:", v13);

          if (v21)
          {
            objc_msgSend(v19, "startDate");
            v22 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)v22;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      }
      while (v16);
    }

    objc_msgSend(a1, "roundedDateForDate:dateMode:calendar:", v47, a5, v50);
    v23 = objc_claimAutoreleasedReturnValue();

    v24 = (id)v23;
    if (!v23)
      v24 = v13;
    objc_msgSend(v13, "dateRemovingTimeComponentsInCalendar:", v50, v45);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dateRemovingTimeComponentsInCalendar:", v50);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "components:fromDate:toDate:options:", 16, v25, v26, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v27, "day");

    v48 = v24;
    objc_msgSend(v50, "components:fromDate:toDate:options:", 176, v13, v24, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v29 = v14;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v52;
      v33 = a5 - 1;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v52 != v32)
            objc_enumerationMutation(v29);
          v35 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
          objc_msgSend(v35, "endDateUnadjustedForLegacyClients");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "startDate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "timeIntervalSinceDate:", v37);
          v39 = v38;

          objc_msgSend(v35, "startDate");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v40;
          if (v33 > 1)
            objc_msgSend(v40, "dateByAddingDays:inCalendar:", v49, 0);
          else
            objc_msgSend(v50, "dateByAddingComponents:toDate:options:", v28, v40, 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setStartDate:", v42);

          objc_msgSend(v35, "startDate");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "dateByAddingTimeInterval:", v39);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setEndDateUnadjustedForLegacyClients:", v44);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      }
      while (v31);
    }

    v10 = v46;
    v11 = v48;
    v12 = v50;
  }

}

+ (id)duplicateEventsByStrippingUnsupportedFields:(id)a3 toNewCalendar:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  NSObject *v35;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
    v40 = (id)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v37 = v5;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v54;
      v38 = *(_QWORD *)v54;
      v39 = v6;
      do
      {
        v10 = 0;
        v41 = v8;
        do
        {
          if (*(_QWORD *)v54 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v10);
          if (objc_msgSend(v11, "currentUserGeneralizedParticipantRole") == 3
            || objc_msgSend(v11, "currentUserGeneralizedParticipantRole") == 1)
          {
            objc_msgSend(v11, "selfAttendee");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "attendees");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)MEMORY[0x1E0CB3880];
            v51[0] = MEMORY[0x1E0C809B0];
            v51[1] = 3221225472;
            v51[2] = __85__CUIKPasteboardUtilities_duplicateEventsByStrippingUnsupportedFields_toNewCalendar___block_invoke;
            v51[3] = &unk_1E6EB5AB8;
            v52 = v12;
            v15 = v12;
            objc_msgSend(v14, "predicateWithBlock:", v51);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "filteredArrayUsingPredicate:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v18 = 30;
          }
          else
          {
            v17 = 0;
            v18 = 26;
          }
          objc_msgSend(v11, "calendar");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v11, "canMoveOrCopyToCalendar:fromCalendar:error:", v6, v19, 0);

          if (v20)
          {
            v21 = objc_msgSend(v11, "copyToCalendar:withOptions:", v6, v18);
            -[NSObject setStatus:](v21, "setStatus:", 0);
            v49 = 0u;
            v50 = 0u;
            v47 = 0u;
            v48 = 0u;
            v22 = v17;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v48;
              do
              {
                for (i = 0; i != v24; ++i)
                {
                  if (*(_QWORD *)v48 != v25)
                    objc_enumerationMutation(v22);
                  objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "duplicate");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject addAttendee:](v21, "addAttendee:", v27);

                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
              }
              while (v24);
            }

            v45 = 0u;
            v46 = 0u;
            v43 = 0u;
            v44 = 0u;
            -[NSObject attendees](v21, "attendees");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v44;
              do
              {
                for (j = 0; j != v30; ++j)
                {
                  if (*(_QWORD *)v44 != v31)
                    objc_enumerationMutation(v28);
                  v33 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
                  objc_msgSend(v33, "proposedStartDateForEvent:", v11);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v34)
                    objc_msgSend(v33, "setProposedStartDate:forEvent:", 0, v21);
                }
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
              }
              while (v30);
            }

            objc_msgSend(v40, "addObject:", v21);
            v9 = v38;
            v6 = v39;
            v8 = v41;
          }
          else
          {
            +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v60 = v11;
              v61 = 2112;
              v62 = v6;
              _os_log_error_impl(&dword_1B8A6A000, v21, OS_LOG_TYPE_ERROR, "Attempting to duplicate event (%@) to a calendar that does not allow it (%@). Skipping this event.", buf, 0x16u);
            }
          }

          ++v10;
        }
        while (v10 != v8);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
      }
      while (v8);
    }

    v5 = v37;
  }
  else
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      +[CUIKPasteboardUtilities duplicateEventsByStrippingUnsupportedFields:toNewCalendar:].cold.1(v35);

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v40 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v40;
}

uint64_t __85__CUIKPasteboardUtilities_duplicateEventsByStrippingUnsupportedFields_toNewCalendar___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToParticipant:", *(_QWORD *)(a1 + 32)) ^ 1;
}

+ (BOOL)allEventsValidForAction:(unint64_t)a3 fromEvents:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  v7 = v6;
  if (v6)
  {
    v8 = *(_QWORD *)v16;
    v9 = v6;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isReminderIntegrationEvent", (_QWORD)v15) & 1) != 0)
        {
LABEL_19:
          v12 = 0;
          goto LABEL_21;
        }
        if (a3 - 1 >= 2)
        {
          if (!a3
            && ((objc_msgSend(v11, "isNew") & 1) != 0
             || !objc_msgSend(v11, "isDeletable")
             || objc_msgSend(v11, "isReminderIntegrationEvent")
             && (objc_msgSend(v11, "CUIK_reminderShouldBeEditable") & 1) == 0))
          {
            goto LABEL_19;
          }
        }
        else if ((objc_msgSend(v11, "isNew") & 1) != 0 || (objc_msgSend(v11, "isBirthday") & 1) != 0)
        {
          goto LABEL_19;
        }
      }
      v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v12 = 1;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v12 = 1;
  }
LABEL_21:

  if (v7)
    v13 = v12;
  else
    v13 = 0;

  return v13;
}

+ (BOOL)declinesToPerformCutCopyPasteAction:(SEL)a3 withSender:(id)a4
{
  id v5;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;

  v5 = a4;
  v7 = sel_paste_ == a3 || sel_copy_ == a3 || sel_cut_ == a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v5;
    v9 = v8;
    if (v7)
    {
      objc_msgSend(v8, "sender");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v9, "sender");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          isKindOfClass = 1;
        }
        else
        {
          objc_msgSend(v9, "sender");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

        }
      }
      else
      {
        isKindOfClass = 0;
      }

    }
    else
    {
      isKindOfClass = 0;
    }

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

+ (void)duplicateEventsByStrippingUnsupportedFields:(os_log_t)log toNewCalendar:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B8A6A000, log, OS_LOG_TYPE_ERROR, "nil calendar given when attempting to duplicate events. The caller must ensure we have a valid new calendar", v1, 2u);
}

@end
